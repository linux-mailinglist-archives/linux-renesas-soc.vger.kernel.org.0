Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E076E1D2147
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2020 23:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729695AbgEMVmX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 May 2020 17:42:23 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:40976 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729196AbgEMVmW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 May 2020 17:42:22 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id F31823C04C1;
        Wed, 13 May 2020 23:42:19 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tONdvVV0gRwf; Wed, 13 May 2020 23:42:14 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 130993C04C0;
        Wed, 13 May 2020 23:42:14 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.11) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 13 May
 2020 23:42:13 +0200
Date:   Wed, 13 May 2020 23:42:07 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
CC:     Hardik Gajjar <hgajjar@de.adit-jv.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <stern@rowland.harvard.edu>, <thinhn@synopsys.com>,
        <Kento.A.Kobayashi@sony.com>, <atmgnd@outlook.com>,
        <linux-usb@vger.kernel.org>, <andrew_gabbasov@mentor.com>,
        <erosca@de.adit-jv.com>, <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v4] USB: hub: Fix the broken detection of USB3 device in
 SMSC hub
Message-ID: <20200513214207.GA24855@lxhi-065.adit-jv.com>
References: <1580989763-32291-1-git-send-email-hgajjar@de.adit-jv.com>
 <73933975-6F0E-40F5-9584-D2B8F615C0F3@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <73933975-6F0E-40F5-9584-D2B8F615C0F3@canonical.com>
X-Originating-IP: [10.72.94.11]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kai-Heng,

Many thanks for reporting the issue!

On Tue, May 12, 2020 at 09:36:07PM +0800, Kai-Heng Feng wrote:
> This patch prevents my Raven Ridge xHCI from getting runtime suspend.
> 
> > On Feb 6, 2020, at 19:49, Hardik Gajjar <hgajjar@de.adit-jv.com> wrote:
> > 
> > Renesas R-Car H3ULCB + Kingfisher Infotainment Board is either not able
> > to detect the USB3.0 mass storage devices or is detecting those as
> > USB2.0 high speed devices.
> > 
> > The explanation given by Renesas is that, due to a HW issue, the XHCI
> > driver does not wake up after going to sleep on connecting a USB3.0
> > device.
> 
> Since the issue is already root caused to xHCI, sounds the workaround should be implemented in xHCI?
> 
> Functions like xhci_alloc_dev() can be a better place to instrument the workaround.

To my understanding, based on the USB Vendor ID used in this patch and
on the lsusb output [1] got on the original arm64 board, we are talking
about a hub device [2], hence drivers/usb/core/hub.c seems an
appropriate placement.

> > +#define USB_VENDOR_SMSC				0x0424

Based on the output [1], I believe the quirk could be made specific
to USB Product IDs '2134' and '5534'?

Could you please share the output of 'lsusb | grep 0424' on the machine
you experienced the regression?

Question to both USB and Renesas people. Does anybody expect SMSC hub
Product ID to vary across different Kingfisher [3] board samples?

> > static const struct usb_device_id hub_id_table[] = {
> > +    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR | USB_DEVICE_ID_MATCH_INT_CLASS,
> > +      .idVendor = USB_VENDOR_SMSC,
> > +      .bInterfaceClass = USB_CLASS_HUB,
> > +      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},

[1] h3ulcb-kf #> lsusb | grep 0424
    Bus 006 Device 002: ID 0424:5534 Standard Microsystems Corp. Hub
    Bus 005 Device 002: ID 0424:2134 Standard Microsystems Corp. Hub
[2] https://devicehunt.com/search/type/usb/vendor/0424/device/any
[3] https://elinux.org/R-Car/Boards/Kingfisher

-- 
Best regards,
Eugeniu Rosca
