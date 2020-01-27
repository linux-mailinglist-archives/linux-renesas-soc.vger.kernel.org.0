Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5089C14A6AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2020 15:59:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729152AbgA0O7F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Jan 2020 09:59:05 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:38034 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729112AbgA0O7F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Jan 2020 09:59:05 -0500
Received: (qmail 2164 invoked by uid 2102); 27 Jan 2020 09:59:03 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 27 Jan 2020 09:59:03 -0500
Date:   Mon, 27 Jan 2020 09:59:03 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
cc:     gregkh@linuxfoundation.org, <linux@prisktech.co.nz>,
        <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v4] usb: host: ehci-platform: add a quirk to avoid stuck
In-Reply-To: <1580114262-25029-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Message-ID: <Pine.LNX.4.44L0.2001270957110.1493-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 27 Jan 2020, Yoshihiro Shimoda wrote:

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

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> ---
>  Changes from v3:
>  - Fix the comment of PORT_LS_MASK.
>  - Remove a comment about the bit 11:10 of PORTSC register.
>  https://patchwork.kernel.org/patch/11349733/
> 
>  Changes from v2:
>  - Use .family instead of .soc_id members on quirk_poll_match.
>  https://patchwork.kernel.org/patch/11347521/
> 
>  Changes from v1:
>  - Remove adding a new property into the generic-ehci.yaml.
>  - Add kerneldoc sections.
>  - Remove prefix "ehci_platform_" from function names.
>  - Rename quirk_poll_check_condition() with quirk_poll_check_port_status().
>  - Fix some coding style.
>  - Remove "start_timer" function and use HZ on mod_timer().
>  - Use delayed_work instead of usleep_range().
>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=229861
> 
>  drivers/usb/host/ehci-platform.c | 127 +++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/ehci_def.h     |   2 +-
>  2 files changed, 128 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
> index 769749c..e4fc3f6 100644
> --- a/drivers/usb/host/ehci-platform.c
> +++ b/drivers/usb/host/ehci-platform.c
> @@ -29,6 +29,8 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> +#include <linux/sys_soc.h>
> +#include <linux/timer.h>
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
>  #include <linux/usb/ehci_pdriver.h>
> @@ -44,6 +46,9 @@ struct ehci_platform_priv {
>  	struct clk *clks[EHCI_MAX_CLKS];
>  	struct reset_control *rsts;
>  	bool reset_on_resume;
> +	bool quirk_poll;
> +	struct timer_list poll_timer;
> +	struct delayed_work poll_work;
>  };
>  
>  static const char hcd_name[] = "ehci-platform";
> @@ -118,6 +123,111 @@ static struct usb_ehci_pdata ehci_platform_defaults = {
>  	.power_off =		ehci_platform_power_off,
>  };
>  
> +/**
> + * quirk_poll_check_port_status - Poll port_status if the device sticks
> + * @ehci: the ehci hcd pointer
> + *
> + * Since EHCI/OHCI controllers on R-Car Gen3 SoCs are possible to be getting
> + * stuck very rarely after a full/low usb device was disconnected. To
> + * detect such a situation, the controllers require a special way which poll
> + * the EHCI PORTSC register.
> + *
> + * Return: true if the controller's port_status indicated getting stuck
> + */
> +static bool quirk_poll_check_port_status(struct ehci_hcd *ehci)
> +{
> +	u32 port_status = ehci_readl(ehci, &ehci->regs->port_status[0]);
> +
> +	if (!(port_status & PORT_OWNER) &&
> +	     (port_status & PORT_POWER) &&
> +	    !(port_status & PORT_CONNECT) &&
> +	     (port_status & PORT_LS_MASK))
> +		return true;
> +
> +	return false;
> +}
> +
> +/**
> + * quirk_poll_rebind_companion - rebind comanion device to recover
> + * @ehci: the ehci hcd pointer
> + *
> + * Since EHCI/OHCI controllers on R-Car Gen3 SoCs are possible to be getting
> + * stuck very rarely after a full/low usb device was disconnected. To
> + * recover from such a situation, the controllers require changing the OHCI
> + * functional state.
> + */
> +static void quirk_poll_rebind_companion(struct ehci_hcd *ehci)
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
> +static void quirk_poll_work(struct work_struct *work)
> +{
> +	struct ehci_platform_priv *priv =
> +		container_of(to_delayed_work(work), struct ehci_platform_priv,
> +			     poll_work);
> +	struct ehci_hcd *ehci = container_of((void *)priv, struct ehci_hcd,
> +					     priv);
> +
> +	/* check the status twice to reduce misdetection rate */
> +	if (!quirk_poll_check_port_status(ehci))
> +		return;
> +	udelay(10);
> +	if (!quirk_poll_check_port_status(ehci))
> +		return;
> +
> +	ehci_dbg(ehci, "%s: detected getting stuck. rebind now!\n", __func__);
> +	quirk_poll_rebind_companion(ehci);
> +}
> +
> +static void quirk_poll_timer(struct timer_list *t)
> +{
> +	struct ehci_platform_priv *priv = from_timer(priv, t, poll_timer);
> +	struct ehci_hcd *ehci = container_of((void *)priv, struct ehci_hcd,
> +					     priv);
> +
> +	if (quirk_poll_check_port_status(ehci)) {
> +		/*
> +		 * Now scheduling the work for testing the port more. Note that
> +		 * updating the status is possible to be delayed when
> +		 * reconnection. So, this uses delayed work with 5 ms delay
> +		 * to avoid misdetection.
> +		 */
> +		schedule_delayed_work(&priv->poll_work, msecs_to_jiffies(5));
> +	}
> +
> +	mod_timer(&priv->poll_timer, jiffies + HZ);
> +}
> +
> +static void quirk_poll_init(struct ehci_platform_priv *priv)
> +{
> +	INIT_DELAYED_WORK(&priv->poll_work, quirk_poll_work);
> +	timer_setup(&priv->poll_timer, quirk_poll_timer, 0);
> +	mod_timer(&priv->poll_timer, jiffies + HZ);
> +}
> +
> +static void quirk_poll_end(struct ehci_platform_priv *priv)
> +{
> +	del_timer_sync(&priv->poll_timer);
> +	cancel_delayed_work(&priv->poll_work);
> +}
> +
> +static const struct soc_device_attribute quirk_poll_match[] = {
> +	{ .family = "R-Car Gen3" },
> +	{ /* sentinel*/ }
> +};
> +
>  static int ehci_platform_probe(struct platform_device *dev)
>  {
>  	struct usb_hcd *hcd;
> @@ -176,6 +286,9 @@ static int ehci_platform_probe(struct platform_device *dev)
>  					  "has-transaction-translator"))
>  			hcd->has_tt = 1;
>  
> +		if (soc_device_match(quirk_poll_match))
> +			priv->quirk_poll = true;
> +
>  		for (clk = 0; clk < EHCI_MAX_CLKS; clk++) {
>  			priv->clks[clk] = of_clk_get(dev->dev.of_node, clk);
>  			if (IS_ERR(priv->clks[clk])) {
> @@ -247,6 +360,9 @@ static int ehci_platform_probe(struct platform_device *dev)
>  	device_enable_async_suspend(hcd->self.controller);
>  	platform_set_drvdata(dev, hcd);
>  
> +	if (priv->quirk_poll)
> +		quirk_poll_init(priv);
> +
>  	return err;
>  
>  err_power:
> @@ -273,6 +389,9 @@ static int ehci_platform_remove(struct platform_device *dev)
>  	struct ehci_platform_priv *priv = hcd_to_ehci_priv(hcd);
>  	int clk;
>  
> +	if (priv->quirk_poll)
> +		quirk_poll_end(priv);
> +
>  	usb_remove_hcd(hcd);
>  
>  	if (pdata->power_off)
> @@ -297,9 +416,13 @@ static int ehci_platform_suspend(struct device *dev)
>  	struct usb_hcd *hcd = dev_get_drvdata(dev);
>  	struct usb_ehci_pdata *pdata = dev_get_platdata(dev);
>  	struct platform_device *pdev = to_platform_device(dev);
> +	struct ehci_platform_priv *priv = hcd_to_ehci_priv(hcd);
>  	bool do_wakeup = device_may_wakeup(dev);
>  	int ret;
>  
> +	if (priv->quirk_poll)
> +		quirk_poll_end(priv);
> +
>  	ret = ehci_suspend(hcd, do_wakeup);
>  	if (ret)
>  		return ret;
> @@ -331,6 +454,10 @@ static int ehci_platform_resume(struct device *dev)
>  	}
>  
>  	ehci_resume(hcd, priv->reset_on_resume);
> +
> +	if (priv->quirk_poll)
> +		quirk_poll_init(priv);
> +
>  	return 0;
>  }
>  #endif /* CONFIG_PM_SLEEP */
> diff --git a/include/linux/usb/ehci_def.h b/include/linux/usb/ehci_def.h
> index a15ce99..78e0063 100644
> --- a/include/linux/usb/ehci_def.h
> +++ b/include/linux/usb/ehci_def.h
> @@ -151,7 +151,7 @@ struct ehci_regs {
>  #define PORT_OWNER	(1<<13)		/* true: companion hc owns this port */
>  #define PORT_POWER	(1<<12)		/* true: has power (see PPC) */
>  #define PORT_USB11(x) (((x)&(3<<10)) == (1<<10))	/* USB 1.1 device */
> -/* 11:10 for detecting lowspeed devices (reset vs release ownership) */
> +#define PORT_LS_MASK	(3<<10)		/* Link status (SE0, K or J */
>  /* 9 reserved */
>  #define PORT_LPM	(1<<9)		/* LPM transaction */
>  #define PORT_RESET	(1<<8)		/* reset port */
> 

