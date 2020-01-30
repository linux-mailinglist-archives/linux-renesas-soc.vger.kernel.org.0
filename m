Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0234C14E08A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2020 19:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbgA3SJM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Jan 2020 13:09:12 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:47732 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728010AbgA3SJM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Jan 2020 13:09:12 -0500
Received: (qmail 9080 invoked by uid 2102); 30 Jan 2020 13:09:10 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 30 Jan 2020 13:09:10 -0500
Date:   Thu, 30 Jan 2020 13:09:10 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Hardik Gajjar <hgajjar@de.adit-jv.com>
cc:     gregkh@linuxfoundation.org, <thinhn@synopsys.com>,
        <Kento.A.Kobayashi@sony.com>, <atmgnd@outlook.com>,
        <linux-usb@vger.kernel.org>, <andrew_gabbasov@mentor.com>,
        <erosca@de.adit-jv.com>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] USB: hub: Fix the broken detection of USB3 device in
 SMSC hub
In-Reply-To: <1580403994-21076-1-git-send-email-hgajjar@de.adit-jv.com>
Message-ID: <Pine.LNX.4.44L0.2001301306330.1441-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 30 Jan 2020, Hardik Gajjar wrote:

> Renesas R-Car H3ULCB + Kingfisher Infotainment Board is either not able
> to detect the USB3.0 mass storage devices or is detecting those as
> USB2.0 high speed devices.
> 
> The explanation given by Renesas is that, due to a HW issue, the XHCI
> driver does not wake up after going to sleep on connecting a USB3.0
> device.
> 
> In order to mitigate that, disable the auto-suspend feature
> specifically for SMSC hubs from hub_probe() function, as a quirk.
> 
> Renesas Kingfisher Infotainment Board has two USB3.0 ports (CN2) which
> are connected via USB5534B 4-port SuperSpeed/Hi-Speed, low-power,
> configurable hub controller.
> 
> [1] SanDisk USB 3.0 device detected as USB-2.0 before the patch
>  [   74.036390] usb 5-1.1: new high-speed USB device number 4 using xhci-hcd
>  [   74.061598] usb 5-1.1: New USB device found, idVendor=0781, idProduct=5581, bcdDevice= 1.00
>  [   74.069976] usb 5-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>  [   74.077303] usb 5-1.1: Product: Ultra
>  [   74.080980] usb 5-1.1: Manufacturer: SanDisk
>  [   74.085263] usb 5-1.1: SerialNumber: 4C530001110208116550
> 
> [2] SanDisk USB 3.0 device detected as USB-3.0 after the patch
>  [   34.565078] usb 6-1.1: new SuperSpeed Gen 1 USB device number 3 using xhci-hcd
>  [   34.588719] usb 6-1.1: New USB device found, idVendor=0781, idProduct=5581, bcdDevice= 1.00
>  [   34.597098] usb 6-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>  [   34.604430] usb 6-1.1: Product: Ultra
>  [   34.608110] usb 6-1.1: Manufacturer: SanDisk
>  [   34.612397] usb 6-1.1: SerialNumber: 4C530001110208116550
> 
> Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> ---
> Changes in v2:
>  - [Alan Stern] Switched from pm_runtime_set_autosuspend_delay()
>    to usb_autopm_get_interface()
>  - Improved commit description
>  - Rebased against v5.5
>  - https://lore.kernel.org/linux-renesas-soc/1579876573-13741-1-git-send-email-hgajjar@de.adit-jv.com/
> 
>  drivers/usb/core/hub.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 3405b14..4152f44 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -38,7 +38,9 @@
>  #include "otg_whitelist.h"
>  
>  #define USB_VENDOR_GENESYS_LOGIC		0x05e3
> +#define USB_VENDOR_SMSC				0x0424
>  #define HUB_QUIRK_CHECK_PORT_AUTOSUSPEND	0x01
> +#define HUB_QUIRK_DISABLE_AUTOSUSPEND		0x02
>  
>  #define USB_TP_TRANSMISSION_DELAY	40	/* ns */
>  #define USB_TP_TRANSMISSION_DELAY_MAX	65535	/* ns */
> @@ -1863,6 +1865,9 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  	if (id->driver_info & HUB_QUIRK_CHECK_PORT_AUTOSUSPEND)
>  		hub->quirk_check_port_auto_suspend = 1;
>  
> +	if (id->driver_info & HUB_QUIRK_DISABLE_AUTOSUSPEND)
> +		usb_autopm_get_interface(intf);
> +
>  	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0)
>  		return 0;
>  

This isn't right.  If you call usb_autopm_get_interface() then at some 
later point you _must_ call usb_autopm_put_interface().  In this case, 
you would have to add these calls following the hub_configure() call 
(in the case where it returns an error) and in the hub_disconnect() 
routine.

Alan Stern

> @@ -5599,6 +5604,10 @@ static void hub_event(struct work_struct *work)
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

