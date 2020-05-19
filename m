Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B841D9750
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 15:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728795AbgESNN2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 09:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727910AbgESNN2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 09:13:28 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C933CC08C5C0;
        Tue, 19 May 2020 06:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=i57lkD9cnLd3mYhYTL44RTjdfNu1CHhYUTKlZbuE/qA=; b=tiq9bVFD1bBw9CjMczu/C5+9G
        bekr4ojvKSr9XU8l7UAgzNAV3iIPTKZgkWw+WXIXehnHY6OzYtb3rtlXmb0baQdjXQ8tmTI+wQ+72
        wp7x/L+k1T9iFH9OqqYguznUKcSQ2DyMLA9ft+kyB/LbeJLkglwpZMF/5tA9xGiu/NQMT1Z4QE3Wl
        gpI7DZ9y8RFAiM0DWosfvfD/h3H5ccvJZeP0+ePaj+cFA3s3kYb+vWy7nh83piSmOAZtoBRqhhzSF
        5lGCsyQHoXMdHQR5KDfZHvdxbIzKqaIhvF2pSwhaF1lTMk/8iCQn58HvUS0bbAtuHaOaSw4sqGQx2
        3j3A88luQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34192)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jb23I-0005RT-7a; Tue, 19 May 2020 14:13:00 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jb23A-0005l3-T5; Tue, 19 May 2020 14:12:52 +0100
Date:   Tue, 19 May 2020 14:12:52 +0100
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
Message-ID: <20200519131252.GD1551@shell.armlinux.org.uk>
References: <20200519122706.GC1551@shell.armlinux.org.uk>
 <CGME20200519125008eucas1p2fe9f14c8f785e956a15097d1eca491c7@eucas1p2.samsung.com>
 <dleftjzha43x8q.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dleftjzha43x8q.fsf%l.stelmach@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 19, 2020 at 02:49:57PM +0200, Lukasz Stelmach wrote:
> It was <2020-05-19 wto 13:27>, when Russell King - ARM Linux admin wrote:
> > On Tue, May 19, 2020 at 02:20:25PM +0200, Lukasz Stelmach wrote:
> >> It was <2020-05-19 wto 12:43>, when Russell King - ARM Linux admin wrote:
> >>> On Tue, May 19, 2020 at 01:21:09PM +0200, Geert Uytterhoeven wrote:
> >>>> On Tue, May 19, 2020 at 11:46 AM Russell King - ARM Linux admin
> >>>> <linux@armlinux.org.uk> wrote:
> >>>>> On Tue, May 19, 2020 at 11:44:17AM +0200, Geert Uytterhoeven wrote:
> >>>>>> On Tue, May 19, 2020 at 10:54 AM Lukasz Stelmach <l.stelmach@samsung.com> wrote:
> >>>>>>> It was <2020-04-29 śro 10:21>, when Geert Uytterhoeven wrote:
> >>>>>>>> Currently, the start address of physical memory is obtained by masking
> >>>>>>>> the program counter with a fixed mask of 0xf8000000.  This mask value
> >>>>>>>> was chosen as a balance between the requirements of different platforms.
> >>>>>>>> However, this does require that the start address of physical memory is
> >>>>>>>> a multiple of 128 MiB, precluding booting Linux on platforms where this
> >>>>>>>> requirement is not fulfilled.
> >>>>>>>>
> >>>>>>>> Fix this limitation by obtaining the start address from the DTB instead,
> >>>>>>>> if available (either explicitly passed, or appended to the kernel).
> >>>>>>>> Fall back to the traditional method when needed.
> [...]
> >>>>>>> Apparently reading physical memory layout from DTB breaks crashdump
> >>>>>>> kernels. A crashdump kernel is loaded into a region of memory, that is
> >>>>>>> reserved in the original (i.e. to be crashed) kernel. The reserved
> >>>>>>> region is large enough for the crashdump kernel to run completely inside
> >>>>>>> it and don't modify anything outside it, just read and dump the remains
> >>>>>>> of the crashed kernel. Using the information from DTB makes the
> >>>>>>> decompressor place the kernel outside of the dedicated region.
> >>>>>>>
> >>>>>>> The log below shows that a zImage and DTB are loaded at 0x18eb8000 and
> >>>>>>> 0x193f6000 (physical). The kernel is expected to run at 0x18008000, but
> >>>>>>> it is decompressed to 0x00008000 (see r4 reported before jumping from
> >>>>>>> within __enter_kernel). If I were to suggest something, there need to be
> >>>>>>> one more bit of information passed in the DTB telling the decompressor
> >>>>>>> to use the old masking technique to determain kernel address. It would
> >>>>>>> be set in the DTB loaded along with the crashdump kernel.
> [...]
> >>>>>> Describing "to use the old masking technique" sounds a bit hackish to me.
> >>>>>> I guess it cannot just restrict the /memory node to the reserved region,
> >>>>>> as the crashkernel needs to be able to dump the remains of the crashed
> >>>>>> kernel, which lie outside this region.
> >>>>>
> >>>>> Correct.
> >>>>>
> >>>>>> However, something under /chosen should work.
> >>>>>
> >>>>> Yet another sticky plaster...
> >>>> 
> >>>> IMHO the old masking technique is the hacky solution covered by
> >>>> plasters.
> >>>
> >>> One line of code is not "covered by plasters".  There are no plasters.
> >>> It's a solution that works for 99.99% of people, unlike your approach
> >>> that has had a stream of issues over the last four months, and has
> >>> required many reworks of the code to fix each one.  That in itself
> >>> speaks volumes about the suitability of the approach.
> >> 
> >> As I have been working with kexec code (patches soon) I would like to
> >> defend the DT approach a bit. It allows to avoid zImage relocation when
> >> a decompressed kernel is larger than ~128MiB. In such case zImage isn't
> >> small either and moving it around takes some time.
> >
> > ... which is something that has been supported for a very long time,
> > before the days of DT.
> 
> How? If a decompressed kernel requires >128M and a bootloader would like
> to put a zImage high enough to *avoid* copying it once again, then the
> decompressor can't see any memory below the 128M window it starts in and
> can't decompress the kernel there.

Do you have such a large kernel?  It would be rather inefficient as
branch instructions could not be used; every function call would have
to be indirect.  The maximum is +/- 32MB for a branch.

> If we do not care about copying
> zImage, then, indeed, everything works fine as it is today. You are
> most probably right 99% doesn't require 128M kernel, but the case is
> IMHO obvious enough, that it should be adressed somehow.

If I have a kernel in excess of 4GB... "it should be addressed somehow"!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC for 0.8m (est. 1762m) line in suburbia: sync at 13.1Mbps down 424kbps up
