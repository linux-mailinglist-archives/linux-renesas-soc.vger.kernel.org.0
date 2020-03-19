Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB4AF18B020
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2020 10:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgCSJ0B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Mar 2020 05:26:01 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:41600 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgCSJ0A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Mar 2020 05:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Yb/xjLK1ui2j4hUNbhZagNJyXnbqQ+joMlyaDUNd3FM=; b=DDdZRk/eS5AQ/lCDPOwBAGNZx
        rmNqgJZFXL9pV819W/fxoEfzt9A4Tl+xIQRjOmQ1TxKcLh4bqPj137R2jYlNtfJw2ccGPLGwsooM2
        zW85Yr7KkEx/jwWJYmcXSnfkxdoXLQrcxvPVs643O1wrGJTkJvGtFR2bX8KiKNkzD0OMATYnrT7uZ
        A9SbTd3luF5DISAJkO3L3H4uWKzpZ9Smbg5qtb5kcPXU17QzADSAWYIoqmqq1jHyrM/p3MsxTTC8d
        aJVKexv8S73aD7bWnEl5LnnI8gjpdiskScrcUW3HrhuaUQUYqDAhy5MJveIbIDxDv8lRd+hkKDrKY
        NLaz6hM5Q==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:55058)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jErQt-0001LT-TO; Thu, 19 Mar 2020 09:25:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jErQl-0004f3-RZ; Thu, 19 Mar 2020 09:25:35 +0000
Date:   Thu, 19 Mar 2020 09:25:35 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Nicolas Pitre <nico@fluxnic.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Eric Miao <eric.miao@nvidia.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2] ARM: boot: Obtain start of physical memory from DTB
Message-ID: <20200319092535.GB25745@shell.armlinux.org.uk>
References: <CGME20200225112354eucas1p1300749b32c6809b6a22194c1a952a68c@eucas1p1.samsung.com>
 <20200127140716.15673-1-geert+renesas@glider.be>
 <d1b12473-5199-1cf6-25d1-a6ce79450e8e@samsung.com>
 <CAMuHMdUGu4eStpYp5W0SKJd8yrLLDTgF4__Jq_n+Z7SWtPM+Cg@mail.gmail.com>
 <90c006f2-8c13-2976-008f-37139ca49f37@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90c006f2-8c13-2976-008f-37139ca49f37@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 19, 2020 at 04:11:00AM +0300, Dmitry Osipenko wrote:
> 25.02.2020 14:40, Geert Uytterhoeven пишет:
> > Hi Marek,
> > 
> > On Tue, Feb 25, 2020 at 12:24 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 27.01.2020 15:07, Geert Uytterhoeven wrote:
> >>> Currently, the start address of physical memory is obtained by masking
> >>> the program counter with a fixed mask of 0xf8000000.  This mask value
> >>> was chosen as a balance between the requirements of different platforms.
> >>> However, this does require that the start address of physical memory is
> >>> a multiple of 128 MiB, precluding booting Linux on platforms where this
> >>> requirement is not fulfilled.
> >>>
> >>> Fix this limitation by obtaining the start address from the DTB instead,
> >>> if available (either explicitly passed, or appended to the kernel).
> >>> Fall back to the traditional method when needed.
> >>>
> >>> This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> >>> on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> >>> i.e. not at a multiple of 128 MiB.
> >>>
> >>> Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> >>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>> Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> >>> ---
> >>> Against arm/for-next.
> >>
> >> This patch landed recently in linux-next. It breaks legacy booting from
> >> the zImage + appended DT + cmdline/memory info provided via ATAGs. I
> >> will debug it further once I find some spare time. What I noticed so
> >> far, the cmdline/memory info is not read from the ATAGs, only the values
> >> provided via appended DT are used.
> > 
> > Oops, something happening like this was one of my biggest worries when
> > posting this patch... Sorry for the breakage.
> > 
> > IIUIC, the kernel still boots, but just doesn't use the info passed by ATAGs?
> > 
> > I'll have a closer look later today.
> > In the mean time, I've sent some debug code I used when developing
> > this patch, which may be useful, hopefully.
> 
> Hello,
> 
> NVIDIA Tegra is also affected by this patch. A week ago an updated
> version of the patch was pushed into linux-next and now machine doesn't
> boot at all.
> 
> I couldn't find v3 on the ML, so replying to the v2. Please take a look
> and fix the problem, or revert/drop the offending patch, thanks in advance.

I'll drop the patch. It's clear that this is going to be difficult,
so I would ask you to test the next version, rather than waiting for
it to appear in linux-next.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
