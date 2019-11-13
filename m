Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A78BFB5E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 18:04:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbfKMREm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 12:04:42 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:43802 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbfKMREm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 12:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=C2QNnRLON1yM7HplcQbHE6Soc3XK8SdkjG3qnRqou0s=; b=M/w2tVs3GhHvSL/BmJLeErQx8
        D40WW/t8ajXR/5N7kfi/V+5ft9/YXhH9ov5fsFhVcPyFv/5zYjalxbQDcWdKiPJaIqo4Yi4lAR+Fi
        aMZ+n+LdYEKNvIWC4ceznLR+t5YSZmc26nG60uvEIWOsUgB8ZtG+P5m/GZOdggcfaVljol1o4ucol
        Jd/igNztrjFvOFh4Pp/wbF9VF7knUXCi5QwXsdXMVVcmMVXLRigeXlIDryavyIccPDSgY0q1ZBI4y
        RYYZxiVCdG/paSpYRHina3DlK0YhC6hfAYw0kXuq79qhq6rZOOydImIpkUKWr6WFPBLbBqUZvkkWC
        u3x1woM8Q==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:55748)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iUw4B-0005e6-KM; Wed, 13 Nov 2019 17:04:27 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iUw49-0002bd-41; Wed, 13 Nov 2019 17:04:25 +0000
Date:   Wed, 13 Nov 2019 17:04:25 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.miao@nvidia.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH/RFC] ARM: boot: Relax kernel image alignment for RZ/A
 with CS3 SDRAM
Message-ID: <20191113170425.GQ25745@shell.armlinux.org.uk>
References: <20191113102729.29303-1-geert+renesas@glider.be>
 <20191113103919.GM25745@shell.armlinux.org.uk>
 <CAMuHMdXWsUChMA+_6sdavo8nd-9icX6nsN7unSfMMViOQrUVMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXWsUChMA+_6sdavo8nd-9icX6nsN7unSfMMViOQrUVMQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 13, 2019 at 02:32:19PM +0100, Geert Uytterhoeven wrote:
> Hi Russell,
> 
> On Wed, Nov 13, 2019 at 11:39 AM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> > On Wed, Nov 13, 2019 at 11:27:29AM +0100, Geert Uytterhoeven wrote:
> > > The RZA2MEVB sub board has 64 MiB of SDRAM at 0x0C000000 (CS3 space).
> > > Hence the mask for CONFIG_AUTO_ZRELADDR needs to be changed, otherwise
> > > the system will crash because it will try to decompress a zImage or
> > > uImage to a non-RAM garbage address.
> > >
> > > Based on a patch in the BSP by Chris Brandt <chris.brandt@renesas.com>.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > No idea what to do with the rest of the comment, or if this breaks
> > > existing platforms.
> >
> > We occasionally have discussions about this - the last one was a big
> > one in Edinburgh, and the answer is we can't change this in mainline.
> > They've also come up on the mailing lists as well.
> >
> > I'm not going to rehash this old argument yet again - the comment
> > details the reason for it, and is there to prevent exactly this.
> 
> Sorry, I wasn't aware of that discussion.
> I had a chat about this at ELC-E with Arnd, and he was open to this change.
> 
> > If someone is silly enough to come up with a platform that violates
> > the documented 32-bit ARM booting protocol, then they can't expect
> > the kernel to bend to their platform's requirements at the expense of
> > already merged platforms.
> 
> Documentation/arm/booting.rst:
>   1. The kernel should be placed in the first 128MiB of RAM: check.
>   2. A safe location is just above the 128MiB boundary from start of RAM:
>      oops. Not all platforms have more than 128 MiB of RAM...
> 
> An alternative is to fall to the builtin 4 MiB of SRAM, or the 8 MiB of
> HyperRAM on RZA2MEVB, but doing that requires using XIP.
> Which brings us to your response in the other email:
> 
> > Are we going back to non-multi-platform kernels? ;)
> 
> Good question! ;-)
> 
>   1. CONFIG_AUTO_ZRELADDR=n
>   2. CONFIG_XIP_KERNEL=y

If you're using an XIP kernel, you are by definition not using the
decompressor.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
