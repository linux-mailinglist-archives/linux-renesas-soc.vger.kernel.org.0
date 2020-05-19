Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF2B1D99B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 16:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbgESO3k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 10:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728737AbgESO3k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 10:29:40 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1861C08C5C0;
        Tue, 19 May 2020 07:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=fL08D6YAELbTCQq/CP+0xzHTKkGqlgFrTATA2xxoDBA=; b=fELprJCdmW0Xmv0Rw7es+tLlz
        zDn2YC+jJ+9V01HIxqMUb3RsFGUcXkOyapbzECngwB02jHy266tVJg9p2+vtjfXSBHmtw7mUnWQOd
        yIChb3wO8boTp+d1qeG7vBAcTjFDnc4HjxNgs9J6Yo1cs3f6R0uTAJJAx00+WMhmJzzDgPi29zhWJ
        4sSoclOfgDlH7eN1JFhkkXev7foPKpGO39UB8M8b/8dKt8kk/mo5YSPjflz4D/8DvI+ArNxQxBjwA
        iIMYnJq9/rfku7yQIHr4me/2bHVoBq+58IKhYnkrwsMkA8ALwiPIfuP7OSWof8kpsXyh98Qv2COMo
        rbMQ+dCbA==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:42272)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jb3Es-0005am-Jv; Tue, 19 May 2020 15:29:02 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jb3Ek-0005nb-JH; Tue, 19 May 2020 15:28:54 +0100
Date:   Tue, 19 May 2020 15:28:54 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Grant Likely <grant.likely@arm.com>
Subject: Re: [PATCH v6] ARM: boot: Obtain start of physical memory from DTB
Message-ID: <20200519142854.GF1551@shell.armlinux.org.uk>
References: <CGME20200429082134eucas1p2415c5269202529e6b019f2d70c1b5572@eucas1p2.samsung.com>
 <20200429082120.16259-1-geert+renesas@glider.be>
 <dleftjmu645mqn.fsf%l.stelmach@samsung.com>
 <CAMuHMdXxq6m6gebQbWvxDynDcZ7dLyZzKC_QroK63L8FGeac1Q@mail.gmail.com>
 <20200519094637.GZ1551@shell.armlinux.org.uk>
 <CAMuHMdU5DG06G4H=+PH+OONMT_9oE==KS=wP+bLgY9xVCez6Ww@mail.gmail.com>
 <CAMj1kXH_s4qjDfTO03PkGNaiwfjmfkrZ-FE8vTm74QSrgoVt0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMj1kXH_s4qjDfTO03PkGNaiwfjmfkrZ-FE8vTm74QSrgoVt0A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 19, 2020 at 03:56:59PM +0200, Ard Biesheuvel wrote:
> On Tue, 19 May 2020 at 13:21, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Russell,
> >
> > CC devicetree
> >
> > On Tue, May 19, 2020 at 11:46 AM Russell King - ARM Linux admin
> > <linux@armlinux.org.uk> wrote:
> > > On Tue, May 19, 2020 at 11:44:17AM +0200, Geert Uytterhoeven wrote:
> > > > On Tue, May 19, 2020 at 10:54 AM Lukasz Stelmach <l.stelmach@samsung.com> wrote:
> > > > > It was <2020-04-29 śro 10:21>, when Geert Uytterhoeven wrote:
> > > > > > Currently, the start address of physical memory is obtained by masking
> > > > > > the program counter with a fixed mask of 0xf8000000.  This mask value
> > > > > > was chosen as a balance between the requirements of different platforms.
> > > > > > However, this does require that the start address of physical memory is
> > > > > > a multiple of 128 MiB, precluding booting Linux on platforms where this
> > > > > > requirement is not fulfilled.
> > > > > >
> > > > > > Fix this limitation by obtaining the start address from the DTB instead,
> > > > > > if available (either explicitly passed, or appended to the kernel).
> > > > > > Fall back to the traditional method when needed.
> > > > > >
> > > > > > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> > > > > > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> > > > > > i.e. not at a multiple of 128 MiB.
> > > > > >
> > > > > > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> > > > > > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > > > > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > > > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> > > > > > ---
> > > > >
> > > > > [...]
> > > > >
> > > > > Apparently reading physical memory layout from DTB breaks crashdump
> > > > > kernels. A crashdump kernel is loaded into a region of memory, that is
> > > > > reserved in the original (i.e. to be crashed) kernel. The reserved
> > > > > region is large enough for the crashdump kernel to run completely inside
> > > > > it and don't modify anything outside it, just read and dump the remains
> > > > > of the crashed kernel. Using the information from DTB makes the
> > > > > decompressor place the kernel outside of the dedicated region.
> > > > >
> > > > > The log below shows that a zImage and DTB are loaded at 0x18eb8000 and
> > > > > 0x193f6000 (physical). The kernel is expected to run at 0x18008000, but
> > > > > it is decompressed to 0x00008000 (see r4 reported before jumping from
> > > > > within __enter_kernel). If I were to suggest something, there need to be
> > > > > one more bit of information passed in the DTB telling the decompressor
> > > > > to use the old masking technique to determain kernel address. It would
> > > > > be set in the DTB loaded along with the crashdump kernel.
> > > >
> > > > Shouldn't the DTB passed to the crashkernel describe which region of
> > > > memory is to be used instead?
> > >
> > > Definitely not.  The crashkernel needs to know where the RAM in the
> > > machine is, so that it can create a coredump of the crashed kernel.
> >
> > So the DTB should describe both ;-)
> >
> > > > Describing "to use the old masking technique" sounds a bit hackish to me.
> > > > I guess it cannot just restrict the /memory node to the reserved region,
> > > > as the crashkernel needs to be able to dump the remains of the crashed
> > > > kernel, which lie outside this region.
> > >
> > > Correct.
> > >
> > > > However, something under /chosen should work.
> > >
> > > Yet another sticky plaster...
> >
> > IMHO the old masking technique is the hacky solution covered by
> > plasters.
> >
> 
> I think debating which solution is the hacky one will not get us anywhere.
> 
> The simple reality is that the existing solution works fine for
> existing platforms, and so any changes in the logic will have to be
> opt-in in one way or the other.
> 
> Since U-boot supports EFI boot these days, one potential option is to
> rely on that. I have some changes implementing this that go on top of
> this patch, but they don't actually rely on it - it was just to
> prevent lexical conflicts.
> 
> The only remaining options imo are a kernel command line option, or a
> DT property that tells the decompressor to look at the memory nodes.
> But using the DT memory nodes on all platforms like this patch does is
> obviously just too risky.
> 
> On another note, I do think the usable-memory-region property should
> be implemented for ARM as well - relying on this rounding to ensure
> that the decompressor does the right thing is too fragile.

What is "too fragile" is trying to change this and expecting everything
to continue working as it did before.

How will switching to EFI help?  Won't the crashdump kernel detect EFI
and try to get the memory map from EFI, whereby it runs into exactly
the same issue that the DT approach does?

The current crashkernel situation works precisely because of the 128M
masking that is being done.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC for 0.8m (est. 1762m) line in suburbia: sync at 13.1Mbps down 424kbps up
