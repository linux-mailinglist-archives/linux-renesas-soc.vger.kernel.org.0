Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC71715429D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2020 12:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727471AbgBFLGc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Feb 2020 06:06:32 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:43363 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727455AbgBFLGb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Feb 2020 06:06:31 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 203133C009E;
        Thu,  6 Feb 2020 12:06:28 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id q_brCqrPFDg1; Thu,  6 Feb 2020 12:06:20 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 2C0A13C0034;
        Thu,  6 Feb 2020 12:06:20 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Thu, 6 Feb 2020
 12:06:19 +0100
Date:   Thu, 6 Feb 2020 12:06:16 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Hardik Gajjar <hgajjar@de.adit-jv.com>
CC:     <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <thinhn@synopsys.com>, <Kento.A.Kobayashi@sony.com>,
        <atmgnd@outlook.com>, <linux-usb@vger.kernel.org>,
        <andrew_gabbasov@mentor.com>, <erosca@de.adit-jv.com>,
        <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v3] USB: hub: Fix the broken detection of USB3 device in
 SMSC hub
Message-ID: <20200206110616.GA13629@lxhi-065.adit-jv.com>
References: <1580838253-31822-1-git-send-email-hgajjar@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1580838253-31822-1-git-send-email-hgajjar@de.adit-jv.com>
X-Originating-IP: [10.72.93.66]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hardik,

On Tue, Feb 04, 2020 at 06:44:13PM +0100, Hardik Gajjar wrote:
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

Thanks for the comprehensible and accurate write-up.

> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index a9e24e4..2fe9c9f 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h
> @@ -61,6 +61,7 @@ struct usb_hub {
>  	unsigned		quiescing:1;
>  	unsigned		disconnected:1;
>  	unsigned		in_reset:1;
> +	unsigned                quirk_disable_autosuspend:1;

I think it would make sense to respin the patch once again with the
above spaces converted to tabs, for consistency.

I would also include Alan's Acked-by (thanks!) and since Alan reshaped
the patch significantly in the last iteration, I would add his
Suggested-by too.

In addition to the above (please, also include):

Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Thanks!

-- 
Best Regards
Eugeniu Rosca
