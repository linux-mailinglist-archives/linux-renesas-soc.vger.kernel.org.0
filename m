Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6038A1D935D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 11:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgESJaq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 05:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbgESJap (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 05:30:45 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1B03C061A0C;
        Tue, 19 May 2020 02:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=rDkog1PAN1T7MdqLtFOWdqFB/5sRcxJYVWYK5k03nOM=; b=zs9tbHcLyegSt8cjSfSKZTO6e
        QJLFRolcnj4GdZkdBdkicC6cnqALIXzgo5h3DvhWUOIFdlMeWnWo6bM2JmqHo+Z6nHhJNGdSygzbY
        5X+ggygXn+p5NQKdwWO4XyCwKLgBAMGIwE6KTxZG3pOBxN1/ataFbZIRTMcRFIoiPYT3bvhgrwy1V
        6FVrhFDqsBw5DAHTEwkt0XH8DF/IQUavfWNnh4pRubqkB8rm1+YYASvZYxhaZFYuu879guP/L+E0D
        5PyhqNNLeu6/CXeMQjCbI1R3U3re7k1j1vJobb2wFPFaXgsAOWs2o9mq4bEDRR2YYh7HvYfdmhYZB
        NT9HL7pCw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34112)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jayZi-0004p1-M8; Tue, 19 May 2020 10:30:14 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jayZZ-0005ak-JV; Tue, 19 May 2020 10:30:05 +0100
Date:   Tue, 19 May 2020 10:30:05 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
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
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v6] ARM: boot: Obtain start of physical memory from DTB
Message-ID: <20200519093005.GX1551@shell.armlinux.org.uk>
References: <CGME20200429082134eucas1p2415c5269202529e6b019f2d70c1b5572@eucas1p2.samsung.com>
 <20200429082120.16259-1-geert+renesas@glider.be>
 <dleftjmu645mqn.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dleftjmu645mqn.fsf%l.stelmach@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 19, 2020 at 10:53:52AM +0200, Lukasz Stelmach wrote:
> It was <2020-04-29 śro 10:21>, when Geert Uytterhoeven wrote:
> > Currently, the start address of physical memory is obtained by masking
> > the program counter with a fixed mask of 0xf8000000.  This mask value
> > was chosen as a balance between the requirements of different platforms.
> > However, this does require that the start address of physical memory is
> > a multiple of 128 MiB, precluding booting Linux on platforms where this
> > requirement is not fulfilled.
> >
> > Fix this limitation by obtaining the start address from the DTB instead,
> > if available (either explicitly passed, or appended to the kernel).
> > Fall back to the traditional method when needed.
> >
> > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> > i.e. not at a multiple of 128 MiB.
> >
> > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> 
> [...]
> 
> Apparently reading physical memory layout from DTB breaks crashdump
> kernels. A crashdump kernel is loaded into a region of memory, that is
> reserved in the original (i.e. to be crashed) kernel. The reserved
> region is large enough for the crashdump kernel to run completely inside
> it and don't modify anything outside it, just read and dump the remains
> of the crashed kernel. Using the information from DTB makes the
> decompressor place the kernel outside of the dedicated region.
> 
> The log below shows that a zImage and DTB are loaded at 0x18eb8000 and
> 0x193f6000 (physical). The kernel is expected to run at 0x18008000, but
> it is decompressed to 0x00008000 (see r4 reported before jumping from
> within __enter_kernel).

Right, and it's important that the kernel decompresses to 0x18008000
so it doesn't overwrite memory that was being used by the crashing
kernel, and thus can create a true coredump image of the failed
kernel.  Meanwhile, the DTB still needs to describe the full memory
layout so that we know where memory is located in order to coredump
it properly.

So, this is a flaw with this approach, and will need the commit to be
dropped yet again - this patch is fundamentally incompatible with the
way kexec's crashdump works.

Looking back at the history, we've been trying this approach since
February with four patches submitted to the patch system, and problems
eventually found with each of them.  I think this shows that the way
the decompressor works out where to decompress the kernel to today is
relied upon all over the place, and changing it is always going to
cause problems.  So, I don't think we /can/ change it without causing
a regression for someone.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
