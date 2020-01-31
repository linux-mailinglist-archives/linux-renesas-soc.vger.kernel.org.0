Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD1BE14EAA2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2020 11:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbgAaKcz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 Jan 2020 05:32:55 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:37598 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728291AbgAaKcy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Jan 2020 05:32:54 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 128DC3C057C;
        Fri, 31 Jan 2020 11:32:52 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3KaeKh2-7R_U; Fri, 31 Jan 2020 11:32:46 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id CC9D03C0579;
        Fri, 31 Jan 2020 11:32:46 +0100 (CET)
Received: from vmlxhi-118.adit-jv.com (10.72.93.77) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Fri, 31 Jan
 2020 11:32:46 +0100
Date:   Fri, 31 Jan 2020 11:32:39 +0100
From:   Hardik Gajjar <hgajjar@de.adit-jv.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Hardik Gajjar <hgajjar@de.adit-jv.com>,
        <gregkh@linuxfoundation.org>, <thinhn@synopsys.com>,
        <Kento.A.Kobayashi@sony.com>, <atmgnd@outlook.com>,
        <linux-usb@vger.kernel.org>, <andrew_gabbasov@mentor.com>,
        <erosca@de.adit-jv.com>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] USB: hub: Fix the broken detection of USB3 device in
 SMSC hub
Message-ID: <20200131103239.GA21056@vmlxhi-118.adit-jv.com>
References: <1580403994-21076-1-git-send-email-hgajjar@de.adit-jv.com>
 <Pine.LNX.4.44L0.2001301306330.1441-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2001301306330.1441-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.77]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

On Thu, Jan 30, 2020 at 01:09:10PM -0500, Alan Stern wrote:
> On Thu, 30 Jan 2020, Hardik Gajjar wrote:
> 
> > Renesas R-Car H3ULCB + Kingfisher Infotainment Board is either not able
> > to detect the USB3.0 mass storage devices or is detecting those as
> > USB2.0 high speed devices.
> > 
> > The explanation given by Renesas is that, due to a HW issue, the XHCI
> > driver does not wake up after going to sleep on connecting a USB3.0
> > device.
> > 
> > In order to mitigate that, disable the auto-suspend feature
> > specifically for SMSC hubs from hub_probe() function, as a quirk.
> > 
> > Renesas Kingfisher Infotainment Board has two USB3.0 ports (CN2) which
> > are connected via USB5534B 4-port SuperSpeed/Hi-Speed, low-power,
> > configurable hub controller.
> > 
> > [1] SanDisk USB 3.0 device detected as USB-2.0 before the patch
> >  [   74.036390] usb 5-1.1: new high-speed USB device number 4 using xhci-hcd
> >  [   74.061598] usb 5-1.1: New USB device found, idVendor=0781, idProduct=5581, bcdDevice= 1.00
> >  [   74.069976] usb 5-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> >  [   74.077303] usb 5-1.1: Product: Ultra
> >  [   74.080980] usb 5-1.1: Manufacturer: SanDisk
> >  [   74.085263] usb 5-1.1: SerialNumber: 4C530001110208116550
> > 
> > [2] SanDisk USB 3.0 device detected as USB-3.0 after the patch
> >  [   34.565078] usb 6-1.1: new SuperSpeed Gen 1 USB device number 3 using xhci-hcd
> >  [   34.588719] usb 6-1.1: New USB device found, idVendor=0781, idProduct=5581, bcdDevice= 1.00
> >  [   34.597098] usb 6-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> >  [   34.604430] usb 6-1.1: Product: Ultra
> >  [   34.608110] usb 6-1.1: Manufacturer: SanDisk
> >  [   34.612397] usb 6-1.1: SerialNumber: 4C530001110208116550
> > 
> > Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> > ---
> > Changes in v2:
> >  - [Alan Stern] Switched from pm_runtime_set_autosuspend_delay()
> >    to usb_autopm_get_interface()
> >  - Improved commit description
> >  - Rebased against v5.5
> >  - https://lore.kernel.org/linux-renesas-soc/1579876573-13741-1-git-send-email-hgajjar@de.adit-jv.com/
> > 
> >  drivers/usb/core/hub.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 3405b14..4152f44 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -38,7 +38,9 @@
> >  #include "otg_whitelist.h"
> >  
> >  #define USB_VENDOR_GENESYS_LOGIC		0x05e3
> > +#define USB_VENDOR_SMSC				0x0424
> >  #define HUB_QUIRK_CHECK_PORT_AUTOSUSPEND	0x01
> > +#define HUB_QUIRK_DISABLE_AUTOSUSPEND		0x02
> >  
> >  #define USB_TP_TRANSMISSION_DELAY	40	/* ns */
> >  #define USB_TP_TRANSMISSION_DELAY_MAX	65535	/* ns */
> > @@ -1863,6 +1865,9 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
> >  	if (id->driver_info & HUB_QUIRK_CHECK_PORT_AUTOSUSPEND)
> >  		hub->quirk_check_port_auto_suspend = 1;
> >  
> > +	if (id->driver_info & HUB_QUIRK_DISABLE_AUTOSUSPEND)
> > +		usb_autopm_get_interface(intf);
> > +
> >  	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0)
> >  		return 0;
> >  
> 
> This isn't right.  If you call usb_autopm_get_interface() then at some 
> later point you _must_ call usb_autopm_put_interface().  In this case, 
> you would have to add these calls following the hub_configure() call 
> (in the case where it returns an error) and in the hub_disconnect() 
> routine.
> 

Thanks for feedback.

I tried to call the usb_autopm_put_interface() after hub_configure()[1] but then,
detection of USB3 device is stopped. Perhaps, It will increase the counter
again and allow the hub to go into suspend/sleep Mode. I need to disable auto
suspend permanently for SMSC hub. 

Please,  give some suggestion. 

[1] diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 30977da..6b2a84b 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1718,6 +1718,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
        struct usb_host_interface *desc;
        struct usb_device *hdev;
        struct usb_hub *hub;
+       int ret;

        desc = intf->cur_altsetting;
        hdev = interface_to_usbdev(intf);
@@ -1827,11 +1828,17 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
        if (id->driver_info & HUB_QUIRK_DISABLE_AUTOSUSPEND)
                usb_autopm_get_interface(intf);

-       if (hub_configure(hub, &desc->endpoint[0].desc) >= 0)
-               return 0;
+       ret = hub_configure(hub, &desc->endpoint[0].desc);

-       hub_disconnect(intf);
-       return -ENODEV;
+       if (id->driver_info & HUB_QUIRK_DISABLE_AUTOSUSPEND)
+               usb_autopm_put_interface(intf);
+
+       if (ret < 0) {
+               hub_disconnect(intf);
+               ret = -ENODEV;
+       }
+
+       return ret;
 }

> Alan Stern
> 

-- 
Best Regards,
Hardik Gajjar
