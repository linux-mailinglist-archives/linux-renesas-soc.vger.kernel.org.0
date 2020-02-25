Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75A7216EA29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2020 16:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731010AbgBYPcd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Feb 2020 10:32:33 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:38776 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729065AbgBYPcd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Feb 2020 10:32:33 -0500
Received: (qmail 3414 invoked by uid 2102); 25 Feb 2020 10:32:32 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 25 Feb 2020 10:32:32 -0500
Date:   Tue, 25 Feb 2020 10:32:32 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
cc:     linux-usb@vger.kernel.org, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Lee, Chiasheng" <chiasheng.lee@intel.com>,
        Mathieu Malaterre <malat@debian.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Hardik Gajjar <hgajjar@de.adit-jv.com>,
        <scan-admin@coverity.com>
Subject: Re: [PATCH] usb: hub: Fix unhandled return value of usb_autopm_get_interface()
In-Reply-To: <20200225130846.20236-1-erosca@de.adit-jv.com>
Message-ID: <Pine.LNX.4.44L0.2002251028030.1485-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 25 Feb 2020, Eugeniu Rosca wrote:

> Address below Coverity complaint (Feb 25, 2020, 8:06 AM CET):
> 
> *** CID 1458999:  Error handling issues  (CHECKED_RETURN)
> /drivers/usb/core/hub.c: 1869 in hub_probe()
> 1863
> 1864            if (id->driver_info & HUB_QUIRK_CHECK_PORT_AUTOSUSPEND)
> 1865                    hub->quirk_check_port_auto_suspend = 1;
> 1866
> 1867            if (id->driver_info & HUB_QUIRK_DISABLE_AUTOSUSPEND) {
> 1868                    hub->quirk_disable_autosuspend = 1;
>  >>>     CID 1458999:  Error handling issues  (CHECKED_RETURN)
>  >>>     Calling "usb_autopm_get_interface" without checking return value (as is done elsewhere 97 out of 111 times).
> 1869                    usb_autopm_get_interface(intf);
> 1870            }
> 1871
> 1872            if (hub_configure(hub, &desc->endpoint[0].desc) >= 0)
> 1873                    return 0;
> 1874
> 
> Fixes: 1208f9e1d758c9 ("USB: hub: Fix the broken detection of USB3 device in SMSC hub")
> Cc: Hardik Gajjar <hgajjar@de.adit-jv.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reported-by: scan-admin@coverity.com
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
>  drivers/usb/core/hub.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 1d212f82c69b..ff04ca28970d 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -1865,8 +1865,12 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  		hub->quirk_check_port_auto_suspend = 1;
>  
>  	if (id->driver_info & HUB_QUIRK_DISABLE_AUTOSUSPEND) {
> -		hub->quirk_disable_autosuspend = 1;
> -		usb_autopm_get_interface(intf);
> +		int r = usb_autopm_get_interface(intf);
> +
> +		if (!r)
> +			hub->quirk_disable_autosuspend = 1;
> +		else
> +			dev_dbg(&intf->dev, "disable autosuspend err=%d\n", r);
>  	}
>  
>  	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0)

This change is not necessary, because the resume operation cannot fail
at this point (interfaces are always powered-up during probe).  A
better solution would be to call usb_autpm_get_interface_no_resume()
instead.

On the other hand, the other places that call
usb_autopm_get_interface() without checking should be audited.  Some of
them almost certainly need to be fixed.

Alan Stern

