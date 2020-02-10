Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E115B157EED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2020 16:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbgBJPhX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Feb 2020 10:37:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:47544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726816AbgBJPhX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Feb 2020 10:37:23 -0500
Received: from localhost (unknown [104.132.1.111])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2139F20715;
        Mon, 10 Feb 2020 15:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581349042;
        bh=sGjD7xGr3xdQbRTfhCpcS5nzJvm1i6kOJ+HnTDC8inE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=w/LPlaHlTa9ikc2OwAE/jzPLqp+orS3uUOC9gBVNAHW65VDr39oI62BcXbqwCCy5m
         PqzKgjdnSLFJDGoDX3pjkb7nkrrcM+p5kqMv1LgTP3y0GBuvRZjxiltDP5P8LMgA/N
         5j7Ye32XCOkyRniJN4Q/7Gf/4yHfGAvywXB7HKqc=
Date:   Mon, 10 Feb 2020 07:37:21 -0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Hardik Gajjar <hgajjar@de.adit-jv.com>, thinhn@synopsys.com,
        Kento.A.Kobayashi@sony.com, atmgnd@outlook.com,
        linux-usb@vger.kernel.org, andrew_gabbasov@mentor.com,
        linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v4] USB: hub: Fix the broken detection of USB3 device in
 SMSC hub
Message-ID: <20200210153721.GA689337@kroah.com>
References: <1580989763-32291-1-git-send-email-hgajjar@de.adit-jv.com>
 <20200210152808.GA7327@lxhi-065.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210152808.GA7327@lxhi-065.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 10, 2020 at 04:28:08PM +0100, Eugeniu Rosca wrote:
> Hi Alan, hi Greg,
> 
> On Thu, Feb 06, 2020 at 12:49:23PM +0100, Hardik Gajjar wrote:
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
> > Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> > Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> > Acked-by: Alan Stern <stern@rowland.harvard.edu>
> > Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> 
> Is there anything else we can do to see the patch accepted?
> Do you think it is also relevant for the stable tree?

It was the merge window, I couldn't do anything with it until a few
hours ago.  Please give me some time to catch up with patches...

thanks,

greg k-h
