Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C19E6D8F4F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 13:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403833AbfJPLXc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 07:23:32 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:57140 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403812AbfJPLXc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 07:23:32 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 3ECE13C04C1;
        Wed, 16 Oct 2019 13:23:29 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id rmrzOOXsaI02; Wed, 16 Oct 2019 13:23:22 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id C6DA03C003F;
        Wed, 16 Oct 2019 13:23:22 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Wed, 16 Oct
 2019 13:23:22 +0200
Date:   Wed, 16 Oct 2019 13:23:19 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH/RFC 17/19] arm64: dts: renesas: Add support for
 Salvator-XS with R-Car M3-W+
Message-ID: <20191016112319.GA656@vmlxhi-102.adit-jv.com>
References: <20191007102332.12196-1-geert+renesas@glider.be>
 <20191007102332.12196-18-geert+renesas@glider.be>
 <20191014175742.GA10194@vmlxhi-102.adit-jv.com>
 <CAMuHMdU2CbuaS6yd8BTmkSx4h_kGF-ca2BRwjUcOaaX8EN02fA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU2CbuaS6yd8BTmkSx4h_kGF-ca2BRwjUcOaaX8EN02fA@mail.gmail.com>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, Oct 16, 2019 at 10:54:12AM +0200, Geert Uytterhoeven wrote:
> Hi Eugeniu,
> 
> On Mon, Oct 14, 2019 at 7:57 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> > On Mon, Oct 07, 2019 at 12:23:30PM +0200, Geert Uytterhoeven wrote:
> > > Add initial support for the Renesas Salvator-X 2nd version development
> > > board equipped with an R-Car M3-W+ SiP with 8 (2 x 4) GiB of RAM.
> > >
> > > The memory map is as follows:
> > >   - Bank0: 4GiB RAM : 0x000048000000 -> 0x000bfffffff
> > >                     0x000480000000 -> 0x004ffffffff
> > >   - Bank1: 4GiB RAM : 0x000600000000 -> 0x006ffffffff
> > >
> > > Based on a patch in the BSP by Takeshi Kihara
> > > <takeshi.kihara.df@renesas.com>.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  arch/arm64/boot/dts/renesas/Makefile          |  1 +
> > >  .../boot/dts/renesas/r8a77961-salvator-xs.dts | 31 +++++++++++++++++++
> > >  2 files changed, 32 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
> >
> > It is common practice in Renesas BSP to specify the SiP memory
> > split by suffixing the DTB names with '-{2,4}x{2,4}g' [1].
> >
> > Has this ever been discussed on ML?
> >
> > Here in particular, it would allow M3-W+ 2x4GiB Salvator-XS and
> > M3-W+ 2x2GiB (or any other DRAM split flavor of) Salvator-XS to
> > coexist in harmony, if the latter pops up at any point.
> 
> With mainline U-Boot, the memory configuration is passed from ATF
> through U-Boot to Linux, see e.g. "ARM: renesas: Configure DRAM size
> from ATF DT fragment" [1], so there's no longer a need to maintain
> multiple DTS files.

With CONFIG_ARCH_FIXUP_FDT_MEMORY being disabled on most, if not all,
R-Car3 targets in u-boot master [2], it's unlikely we'll get any DRAM
information passed via DT from U-Boot to Linux.

I notice that Marek (CC) has just submitted a patch to re-enable [3]
the U-Boot feature. Does this mean the community is fine with the idea
that adjusting the Linux DT memory entries (e.g. for debugging and
other purposes) will become a NOOP and will require users to reflash
their bootloaders?

> [1] https://gitlab.denx.de/u-boot/u-boot/commit/175f5027345c7feaa41e8f4201778814bf72fe37
[2] u-boot (6891152a4596) git grep FIXUP_FDT -- configs/r8a779*
configs/r8a7795_salvator-x_defconfig:# CONFIG_ARCH_FIXUP_FDT_MEMORY is not set
configs/r8a7795_ulcb_defconfig:# CONFIG_ARCH_FIXUP_FDT_MEMORY is not set
configs/r8a77965_salvator-x_defconfig:# CONFIG_ARCH_FIXUP_FDT_MEMORY is not set
configs/r8a77965_ulcb_defconfig:# CONFIG_ARCH_FIXUP_FDT_MEMORY is not set
configs/r8a7796_salvator-x_defconfig:# CONFIG_ARCH_FIXUP_FDT_MEMORY is not set
configs/r8a7796_ulcb_defconfig:# CONFIG_ARCH_FIXUP_FDT_MEMORY is not set
configs/r8a77970_eagle_defconfig:# CONFIG_ARCH_FIXUP_FDT_MEMORY is not set
configs/r8a77990_ebisu_defconfig:# CONFIG_ARCH_FIXUP_FDT_MEMORY is not set
configs/r8a77995_draak_defconfig:# CONFIG_ARCH_FIXUP_FDT_MEMORY is not set
[3] https://patchwork.ozlabs.org/patch/1177387/
    ("ARM: rmobile: Enable CONFIG_ARCH_FIXUP_FDT_MEMORY on Gen3")

-- 
Best Regards,
Eugeniu
