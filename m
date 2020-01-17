Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8684E140EEC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2020 17:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgAQQ0o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jan 2020 11:26:44 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:58690 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726603AbgAQQ0o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jan 2020 11:26:44 -0500
Received: (qmail 4053 invoked by uid 2102); 17 Jan 2020 11:26:43 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 17 Jan 2020 11:26:43 -0500
Date:   Fri, 17 Jan 2020 11:26:43 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
cc:     gregkh@linuxfoundation.org, <linux@prisktech.co.nz>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] usb: host: ehci-platform: add a quirk to avoid stuck
In-Reply-To: <1579258447-28135-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Message-ID: <Pine.LNX.4.44L0.2001171103070.1571-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 17 Jan 2020, Yoshihiro Shimoda wrote:

> Since EHCI/OHCI controllers on R-Car Gen3 SoCs are possible to
> be getting stuck very rarely after a full/low usb device was
> disconnected. To detect/recover from such a situation, the controllers
> require a special way which poll the EHCI PORTSC register and changes
> the OHCI functional state.
> 
> So, this patch adds a polling timer into the ehci-platform driver,
> and if the ehci driver detects the issue by the EHCI PORTSC register,
> the ehci driver removes a companion device (= the OHCI controller)
> to change the OHCI functional state to USB Reset once. And then,
> the ehci driver adds the companion device again.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

The programming in this patch could be improved in several ways.

> ---
>  drivers/usb/host/ehci-platform.c | 104 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
> index 769749c..fc6bb06 100644
> --- a/drivers/usb/host/ehci-platform.c
> +++ b/drivers/usb/host/ehci-platform.c
> @@ -29,6 +29,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> +#include <linux/timer.h>
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
>  #include <linux/usb/ehci_pdriver.h>
> @@ -44,6 +45,9 @@ struct ehci_platform_priv {
>  	struct clk *clks[EHCI_MAX_CLKS];
>  	struct reset_control *rsts;
>  	bool reset_on_resume;
> +	bool quirk_poll;
> +	struct timer_list poll_timer;
> +	struct work_struct poll_work;
>  };
>  
>  static const char hcd_name[] = "ehci-platform";
> @@ -118,6 +122,88 @@ static struct usb_ehci_pdata ehci_platform_defaults = {
>  	.power_off =		ehci_platform_power_off,
>  };
>  
> +static bool ehci_platform_quirk_poll_check_condition(struct ehci_hcd *ehci)

There should be a kerneldoc section above this line, explaining what 
the function does and why it is needed.  Otherwise people reading this 
code for the first time will have no idea what is going on.

You don't really need the "ehci_platform_" at the start of the function 
name, because this is a static function.

Also, "quirk_poll_check_condition" suggests that this is the _only_ 
condition that a quirk might need to poll for.  What if another similar 
quirk arises in the future?  The function name should indicate 
something about what condition is being checked.

> +{
> +	u32 port_status = ehci_readl(ehci, &ehci->regs->port_status[0]);
> +
> +	if (!(port_status & PORT_OWNER) &&	/* PO == 0b */
> +	    port_status & PORT_POWER &&		/* PP == 1b */
> +	    !(port_status & PORT_CONNECT) &&	/* CCS == 0b */
> +	    port_status & GENMASK(11, 10))	/* LS != 00b */

The comments are unnecessary.  Anyone reading the code will realize 
that !(port_status & PORT_OWNER) means that the PO value is 0b, and so 
on.

Also, I think the code would be a little clearer if all the tests were 
inside parentheses, not just the negated tests.

The GENMASK stuff is very obscure.  You could define a PORT_LS_MASK
macro in include/linux/usb/ehci_defs.h to be (3<<10), and make the
test:

	(port_status & PORT_LS_MASK)

> +		return true;
> +
> +	return false;
> +}
> +
> +static void ehci_platform_quirk_poll_rebind_companion(struct ehci_hcd *ehci)
> +{
> +	struct device *companion_dev;
> +	struct usb_hcd *hcd = ehci_to_hcd(ehci);
> +
> +	companion_dev = usb_of_get_companion_dev(hcd->self.controller);
> +	if (!companion_dev)
> +		return;
> +
> +	device_release_driver(companion_dev);
> +	if (device_attach(companion_dev) < 0)
> +		ehci_err(ehci, "%s: failed\n", __func__);
> +
> +	put_device(companion_dev);
> +}
> +
> +static void ehci_platform_quirk_poll_start_timer(struct ehci_platform_priv *p)
> +{
> +	mod_timer(&p->poll_timer, jiffies + msecs_to_jiffies(1000));
> +}

Does this really need to be in a separate function?  Why not include it
inline wherever it is used?

Also, instead of msecs_to_jiffies(1000) you can just write HZ.

> +
> +static void ehci_platform_quirk_poll_work(struct work_struct *work)
> +{
> +	struct ehci_platform_priv *priv =
> +		container_of(work, struct ehci_platform_priv, poll_work);
> +	struct ehci_hcd *ehci = container_of((void *)priv, struct ehci_hcd,
> +					     priv);
> +	int i;
> +
> +	usleep_range(4000, 8000);

You have just waited 1000 ms for the timer.  Why will sleeping an
additional 4 - 8 ms make any difference?

> +
> +	for (i = 0; i < 2; i++) {
> +		udelay(10);
> +		if (!ehci_platform_quirk_poll_check_condition(ehci))
> +			goto out;
> +	}

This will be clearer if you expand the loop and add a comment:

	/* Make sure the condition persists for at least 10 us */
	if (!ehci_platform_quirk_poll_check_condition(ehci))
		return;
	udelay(10);
	if (!ehci_platform_quirk_poll_check_condition(ehci))
		return;

> +
> +	ehci_dbg(ehci, "%s: detected getting stuck. rebind now!\n", __func__);
> +	ehci_platform_quirk_poll_rebind_companion(ehci);
> +
> +out:
> +	ehci_platform_quirk_poll_start_timer(priv);

You don't need to restart the timer here ...

> +}
> +
> +static void ehci_platform_quirk_poll_timer(struct timer_list *t)
> +{
> +	struct ehci_platform_priv *priv = from_timer(priv, t, poll_timer);
> +	struct ehci_hcd *ehci = container_of((void *)priv, struct ehci_hcd,
> +					     priv);
> +
> +	if (ehci_platform_quirk_poll_check_condition(ehci))
> +		schedule_work(&priv->poll_work);
> +	else

... if you simply remove this "else" line.

> +		ehci_platform_quirk_poll_start_timer(priv);

Also, it would be a lot cleaner if you run all the check_condition
stuff inside the timer routine here, and use the work routine only for
rebind_companion.

Alan Stern

