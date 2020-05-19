Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2BD1D963E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 14:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728686AbgESM1t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 08:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgESM1t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 08:27:49 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C735C08C5C0;
        Tue, 19 May 2020 05:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=gpxgZE1WFOAA3USSRGpS7gL30qkfqbIwl8FUPWp2p+I=; b=m3qWdMR6jSUKVXFYt3bcZ3AM+
        1gzgGHifUKhfdqriZNFuIRjJftXo3RkK5mZW0yHqlWjNV/Mhnlantm5xiuI8D5t9vXPWjzicYmUvM
        oux8K2FN76KGorGbDm46c8qhC6wCqVgHhw/8ll91CpW0mJBfe6HZMluI72cdynfwSUFUQPHocHbva
        Vhgprv2CIlnBk4mLLJ9Fty0ne9pWfCvz0sPb186ZbqHM0HdJxSwAFIQsFBhp28m1rJ/8jwFNVe1Xj
        NFfDH2fzDEUnrj6/xHtLfdrknIGCeEDVaoOawN3b5i3tNOa/vxT/O6FxgMy7CxbF4vnQGU7XfzcH5
        ri6ToOMdQ==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:42234)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jb1Kz-0005M2-Jn; Tue, 19 May 2020 13:27:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jb1Ks-0005is-Pw; Tue, 19 May 2020 13:27:06 +0100
Date:   Tue, 19 May 2020 13:27:06 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
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
Message-ID: <20200519122706.GC1551@shell.armlinux.org.uk>
References: <20200519114329.GB1551@shell.armlinux.org.uk>
 <CGME20200519122044eucas1p1220e8827c66dd1ace94b0a86a34f9c37@eucas1p1.samsung.com>
 <dleftj5zcs5d6e.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dleftj5zcs5d6e.fsf%l.stelmach@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 19, 2020 at 02:20:25PM +0200, Lukasz Stelmach wrote:
> It was <2020-05-19 wto 12:43>, when Russell King - ARM Linux admin wrote:
> > On Tue, May 19, 2020 at 01:21:09PM +0200, Geert Uytterhoeven wrote:
> >> On Tue, May 19, 2020 at 11:46 AM Russell King - ARM Linux admin
> >> <linux@armlinux.org.uk> wrote:
> >> > On Tue, May 19, 2020 at 11:44:17AM +0200, Geert Uytterhoeven wrote:
> >> > > On Tue, May 19, 2020 at 10:54 AM Lukasz Stelmach <l.stelmach@samsung.com> wrote:
> >> > > > It was <2020-04-29 śro 10:21>, when Geert Uytterhoeven wrote:
> >> > > > > Currently, the start address of physical memory is obtained by masking
> >> > > > > the program counter with a fixed mask of 0xf8000000.  This mask value
> >> > > > > was chosen as a balance between the requirements of different platforms.
> >> > > > > However, this does require that the start address of physical memory is
> >> > > > > a multiple of 128 MiB, precluding booting Linux on platforms where this
> >> > > > > requirement is not fulfilled.
> >> > > > >
> >> > > > > Fix this limitation by obtaining the start address from the DTB instead,
> >> > > > > if available (either explicitly passed, or appended to the kernel).
> >> > > > > Fall back to the traditional method when needed.
> >> > > > >
> >> > > > > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> >> > > > > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> >> > > > > i.e. not at a multiple of 128 MiB.
> >> > > > >
> >> > > > > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> >> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> > > > > Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> >> > > > > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> >> > > > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> > > > > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> >> > > > > ---
> >> > > >
> >> > > > [...]
> >> > > >
> >> > > > Apparently reading physical memory layout from DTB breaks crashdump
> >> > > > kernels. A crashdump kernel is loaded into a region of memory, that is
> >> > > > reserved in the original (i.e. to be crashed) kernel. The reserved
> >> > > > region is large enough for the crashdump kernel to run completely inside
> >> > > > it and don't modify anything outside it, just read and dump the remains
> >> > > > of the crashed kernel. Using the information from DTB makes the
> >> > > > decompressor place the kernel outside of the dedicated region.
> >> > > >
> >> > > > The log below shows that a zImage and DTB are loaded at 0x18eb8000 and
> >> > > > 0x193f6000 (physical). The kernel is expected to run at 0x18008000, but
> >> > > > it is decompressed to 0x00008000 (see r4 reported before jumping from
> >> > > > within __enter_kernel). If I were to suggest something, there need to be
> >> > > > one more bit of information passed in the DTB telling the decompressor
> >> > > > to use the old masking technique to determain kernel address. It would
> >> > > > be set in the DTB loaded along with the crashdump kernel.
> >> > >
> >> > > Shouldn't the DTB passed to the crashkernel describe which region of
> >> > > memory is to be used instead?
> >> >
> >> > Definitely not.  The crashkernel needs to know where the RAM in the
> >> > machine is, so that it can create a coredump of the crashed kernel.
> >> 
> >> So the DTB should describe both ;-)
> >> 
> >> > > Describing "to use the old masking technique" sounds a bit hackish to me.
> >> > > I guess it cannot just restrict the /memory node to the reserved region,
> >> > > as the crashkernel needs to be able to dump the remains of the crashed
> >> > > kernel, which lie outside this region.
> >> >
> >> > Correct.
> >> >
> >> > > However, something under /chosen should work.
> >> >
> >> > Yet another sticky plaster...
> >> 
> >> IMHO the old masking technique is the hacky solution covered by
> >> plasters.
> >
> > One line of code is not "covered by plasters".  There are no plasters.
> > It's a solution that works for 99.99% of people, unlike your approach
> > that has had a stream of issues over the last four months, and has
> > required many reworks of the code to fix each one.  That in itself
> > speaks volumes about the suitability of the approach.
> 
> As I have been working with kexec code (patches soon) I would like to
> defend the DT approach a bit. It allows to avoid zImage relocation when
> a decompressed kernel is larger than ~128MiB. In such case zImage isn't
> small either and moving it around takes some time.

... which is something that has been supported for a very long time,
before the days of DT.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC for 0.8m (est. 1762m) line in suburbia: sync at 13.1Mbps down 424kbps up
