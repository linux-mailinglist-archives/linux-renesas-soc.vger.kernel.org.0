Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 755BC245336
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Aug 2020 23:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729342AbgHOV7X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 15 Aug 2020 17:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728889AbgHOVvm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Aug 2020 17:51:42 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B056C03B3DA
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Aug 2020 02:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=YTXVAf7SxO6dJCxtIqDzrMtvbAtyylYrsY5KjL/bkkA=; b=qDwXQ1tDWb2kSCRZ7ylh8tLMf
        nuBoA7HInMtbzGolYEcKPgb/ze2UpqNmAZUIRGup/I5HUxL29a7YsdfU8eKmST2dP2HIR2obFd4of
        3LibGiNsD4X/7TqrH+xPAsgQ+qRfD0LxlD7U4wePyczuornPWE/4YId7N6+2z2vUo9qCzZjLzHli+
        dXWjmt7/BoJ54K1BKQaCJN0E7X2j/44Ii0k2K/BmpVodKRPKSy6TQSR7fcp71nL7IjcY+mePKBTC0
        39F80EkQ1Hy9QooI2v8WzjDdCDIGIwwpWoaxJdyoB/UyQ5HGvKSjXzA0qM7I8P7J5l/xiv47IWx+1
        QpF3wdYYg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52760)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1k6sKa-0005E5-Dz; Sat, 15 Aug 2020 10:18:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1k6sKZ-0006hq-T6; Sat, 15 Aug 2020 10:18:27 +0100
Date:   Sat, 15 Aug 2020 10:18:27 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Laura Abbott <labbott@redhat.com>,
        Kumar Gala <kumar.gala@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Eric Miao <eric.miao@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH/RFC v7] ARM: boot: Obtain start of physical memory from
 DTB
Message-ID: <20200815091827.GW1551@shell.armlinux.org.uk>
References: <20200706150205.22053-1-geert+renesas@glider.be>
 <CACRpkdZD3gVLdcjaOL9ZCfZD+hrOUB0-q0NpoHu6m1Ujupw6Fw@mail.gmail.com>
 <CAK8P3a33AWe-fa8jJnRrme56Hgc-hLdNH4FK6FEPyZ0=O=vwtg@mail.gmail.com>
 <CACRpkdbxQrmNtByZ1cHSROyX7rwwaa2Mb=GQLpVcDi4FsZ06FQ@mail.gmail.com>
 <159546718359.3847286.13460778905630969897@swboyd.mtv.corp.google.com>
 <CACRpkdaN22OjWsG+d-hp_NEw==3VVAsWHkFsiG642KmbjD_6Mg@mail.gmail.com>
 <CAMj1kXFcS2+i7+Uf6mSkg+aO6j3FOaTJhN70vbWUDZe2CBm1Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFcS2+i7+Uf6mSkg+aO6j3FOaTJhN70vbWUDZe2CBm1Hg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 14, 2020 at 04:06:03PM +0200, Ard Biesheuvel wrote:
> On Fri, 14 Aug 2020 at 16:03, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Thu, Jul 23, 2020 at 3:19 AM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > > > > textofs-$(CONFIG_ARCH_IPQ40XX) := 0x00208000
> > > > > textofs-$(CONFIG_ARCH_MSM8X60) := 0x00208000
> > > > > textofs-$(CONFIG_ARCH_MSM8960) := 0x00208000
> > > >
> > > > But what on earth is this? I just deleted this and the platform
> > > > boots just as well.
> > >
> > > We need to shift the kernel text to start 2MB beyond the start of memory
> > > because there is the shared memory region used to communicate with other
> > > processors in the SoC there. It took a while for us to convince other OS
> > > folks in the company to put shared memory somewhere else besides the
> > > start of RAM, but eventually we won that battle.
> > >
> > > Does your booted kernel have its text section at the start of RAM or is
> > > it offset by 2MB without this change? Check out /proc/iomem to see where
> > > the kernel text is in relation to the start of RAM.
> >
> > The memory on this machine starts at 0x40200000 since the effect
> > of the current code is to take pc &= 0xf8000000 and that results in
> > 0x40000000 and then this adds textofs 0x00208000 to that
> > resulting in 0x40208000 for the kernel physical RAM. Which
> > is what we want to achieve since the RAM starts at
> > 0x40200000.
> >
> > But TEXT_OFFSET is also used inside the kernel to offset the
> > virtual memory. This means that when we set up the virtual
> > memory split, the kernel virtual memory is also bumped by
> > these 2 MB so the virtual memory starts at 0xC0208000
> > instead of 0xC0008000 as is normal.
> >
> > It looks weird to me but maybe someone can explain how
> > logical that is?
> >
> 
> The ARM mm code assumes that the relative alignment between PA and VA
> is 16 MB, so if we skip 2 MB in the physical space, we must do the
> same in the virtual space.

That is a good thing; it makes the virtual to physical translations
easy - we only have facility for offsets with bits 23..0 clear to
make the code rewriting simple.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
