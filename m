Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74CC514A773
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2020 16:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729548AbgA0Pqw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Jan 2020 10:46:52 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:37187 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729133AbgA0Pqw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Jan 2020 10:46:52 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id A63533C00C5;
        Mon, 27 Jan 2020 16:46:48 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1y22QhEBcS61; Mon, 27 Jan 2020 16:46:40 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 7DDE43C009E;
        Mon, 27 Jan 2020 16:46:40 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289]) by
 HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289%12]) with mapi id
 14.03.0468.000; Mon, 27 Jan 2020 16:46:40 +0100
From:   "Gajjar, Hardik (TCP GmbH; ADITG/ESM1)" <hgajjar@de.adit-jv.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "thinhn@synopsys.com" <thinhn@synopsys.com>,
        "Kento.A.Kobayashi@sony.com" <Kento.A.Kobayashi@sony.com>,
        "atmgnd@outlook.com" <atmgnd@outlook.com>,
        "andrew_gabbasov@mentor.com" <andrew_gabbasov@mentor.com>,
        "Rosca, Eugeniu (ADITG/ESM1)" <erosca@de.adit-jv.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] USB: hub: Fix the broken detection of USB3 device in
 SMSC hub
Thread-Topic: [PATCH] USB: hub: Fix the broken detection of USB3 device in
 SMSC hub
Thread-Index: AQHV0sgC1cDUaLSO2EetRqRI6tgIr6f+pZiw
Date:   Mon, 27 Jan 2020 15:46:39 +0000
Message-ID: <566F12E844DDE64E9951EDD6C85D69282942AE@HI2EXCH01.adit-jv.com>
References: <1579876573-13741-1-git-send-email-hgajjar@de.adit-jv.com>
 <Pine.LNX.4.44L0.2001241002090.1610-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2001241002090.1610-100000@iolanthe.rowland.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.72.92.125]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

Thank you so much for the speedy reply.  I have used the usb_autopm_get_interface() and it is working like a charm.

Best regards
Hardik Gajjar

Advanced Driver Information Technology GmbH
Engineering Software Multimedia 1 (ADITG/ESM1)
Robert-Bosch-Str. 200
31139 Hildesheim
Germany

Tel. +49 5121 49 6977
Fax +49 5121 49 6999
hgajjar@de.adit-jv.com
www.adit-jv.com

ADIT is a joint venture company of Robert Bosch GmbH/Robert Bosch Car Multimedia GmbH and DENSO Corporation
Sitz: Hildesheim, Registergericht: Amtsgericht Hildesheim HRB 3438
Geschaeftsfuehrung: Wilhelm Grabow, Ken Yaguchi

Data protection information: We use your contact information and e-mail communication to process your inquiry and for internal and possibly tax documentation purposes. Your information will only be passed on to third parties if this is necessary to carry out your request or if we are legally obliged to do so.


-----Original Message-----
From: Alan Stern <stern@rowland.harvard.edu> 
Sent: Freitag, 24. Januar 2020 16:08
To: Gajjar, Hardik (TCP GmbH; ADITG/ESM1) <hgajjar@de.adit-jv.com>
Cc: gregkh@linuxfoundation.org; thinhn@synopsys.com; Kento.A.Kobayashi@sony.com; atmgnd@outlook.com; andrew_gabbasov@mentor.com; Rosca, Eugeniu (ADITG/ESM1) <erosca@de.adit-jv.com>; linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] USB: hub: Fix the broken detection of USB3 device in SMSC hub

On Fri, 24 Jan 2020, Hardik Gajjar wrote:

> This patch disables the auto-suspend feature for SMSC USB hub.
> Renesas-RCAR3-H3-KF board was not able to detect the USB3.0 devices.
> The XHCI driver was going to sleep and not wake up again on connection 
> of the USB3.0 device. According to Renesas, This is because of some 
> hardware issue.
> 
> Renesas-RCAR3-H3-KF has USB5534B 4-port SuperSpeed/Hi-Speed, 
> low-power, configurable hub controller.
> 
> Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> ---
>  drivers/usb/core/hub.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c index 
> 939dd73a..ffc7abf 100644
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

This is not a good way to prevent autosuspend, because the user can override it.  If you really want to prevent the hub from autosuspending, you should call usb_autoresume_device() or usb_autopm_get_interface().  Either way, it is then necessary to issue a corresponding call to usb_autosuspend_device() or
usb_autopm_put_interface_no_suspend() later on.

Alan Stern

> +
>  	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0)
>  		return 0;
>  
> @@ -5313,6 +5318,10 @@ static void hub_event(struct work_struct *work)  
> }
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

