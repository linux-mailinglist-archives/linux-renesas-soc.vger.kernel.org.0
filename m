Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDF3148AE6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2020 16:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388315AbgAXPHQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Jan 2020 10:07:16 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:48894 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2388032AbgAXPHQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Jan 2020 10:07:16 -0500
Received: (qmail 1708 invoked by uid 2102); 24 Jan 2020 10:07:15 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 24 Jan 2020 10:07:15 -0500
Date:   Fri, 24 Jan 2020 10:07:15 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Hardik Gajjar <hgajjar@de.adit-jv.com>
cc:     gregkh@linuxfoundation.org, <thinhn@synopsys.com>,
        <Kento.A.Kobayashi@sony.com>, <atmgnd@outlook.com>,
        <andrew_gabbasov@mentor.com>, <erosca@de.adit-jv.com>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] USB: hub: Fix the broken detection of USB3 device in
 SMSC hub
In-Reply-To: <1579876573-13741-1-git-send-email-hgajjar@de.adit-jv.com>
Message-ID: <Pine.LNX.4.44L0.2001241002090.1610-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 24 Jan 2020, Hardik Gajjar wrote:

> This patch disables the auto-suspend feature for SMSC USB hub.
> Renesas-RCAR3-H3-KF board was not able to detect the USB3.0 devices.
> The XHCI driver was going to sleep and not wake up again on connection
> of the USB3.0 device. According to Renesas, This is because of some
> hardware issue.
> 
> Renesas-RCAR3-H3-KF has USB5534B 4-port SuperSpeed/Hi-Speed, low-power,
> configurable hub controller.
> 
> Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> ---
>  drivers/usb/core/hub.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 939dd73a..ffc7abf 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -36,7 +36,9 @@
>  #include "otg_whitelist.h"
>  
>  #define USB_VENDOR_GENESYS_LOGIC		0x05e3
> +#define USB_VENDOR_SMSC    			0x0424
>  #define HUB_QUIRK_CHECK_PORT_AUTOSUSPEND	0x01
> +#define HUB_QUIRK_DISABLE_AUTOSUSPEND		0x02
>  
>  #define USB_VENDOR_UNWIRED			0x2996
>  #define USB_VENDOR_DELPHI			0x2C48
> @@ -1822,6 +1824,9 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  	if (id->driver_info & HUB_QUIRK_NO_LOGICAL_DISCONNECT)
>  		hub->quirk_no_logical_disconnect = 1;
>  
> +	if (id->driver_info & HUB_QUIRK_DISABLE_AUTOSUSPEND)
> +		pm_runtime_set_autosuspend_delay(&hdev->dev, -1);

This is not a good way to prevent autosuspend, because the user can 
override it.  If you really want to prevent the hub from 
autosuspending, you should call usb_autoresume_device() or 
usb_autopm_get_interface().  Either way, it is then necessary to issue 
a corresponding call to usb_autosuspend_device() or 
usb_autopm_put_interface_no_suspend() later on.

Alan Stern

> +
>  	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0)
>  		return 0;
>  
> @@ -5313,6 +5318,10 @@ static void hub_event(struct work_struct *work)
>  }
>  
>  static const struct usb_device_id hub_id_table[] = {
> +    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR | USB_DEVICE_ID_MATCH_INT_CLASS,
> +      .idVendor = USB_VENDOR_SMSC,
> +      .bInterfaceClass = USB_CLASS_HUB,
> +      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
>      { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
>  			| USB_DEVICE_ID_MATCH_INT_CLASS,
>        .idVendor = USB_VENDOR_GENESYS_LOGIC,
> 

