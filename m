Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 802CE2453FD
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Aug 2020 00:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729640AbgHOWKi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 15 Aug 2020 18:10:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:41784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729592AbgHOWKh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Aug 2020 18:10:37 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 429BA23108;
        Sat, 15 Aug 2020 08:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597480116;
        bh=Z3oTPFBH7Zb9AZuALkPSF1LZViQyorhxRNBNNgUWqQE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Oi8jQAgDvW+iprM6Q97dmaO0wx7qP/Qg3srqKxDnhNccEAU06dQem8ScG7XNclTGp
         jODyxpbbNP8xoDlG17/+w28J8u0ukfTifIZHjYj5Z0HR5b7ekI1ZBYtTLt4DB+D+Z6
         E0vWLoPaPHYyvE7krNXcIW20UVee4qLBjhTnXLV8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CACRpkdaN22OjWsG+d-hp_NEw==3VVAsWHkFsiG642KmbjD_6Mg@mail.gmail.com>
References: <20200706150205.22053-1-geert+renesas@glider.be> <CACRpkdZD3gVLdcjaOL9ZCfZD+hrOUB0-q0NpoHu6m1Ujupw6Fw@mail.gmail.com> <CAK8P3a33AWe-fa8jJnRrme56Hgc-hLdNH4FK6FEPyZ0=O=vwtg@mail.gmail.com> <CACRpkdbxQrmNtByZ1cHSROyX7rwwaa2Mb=GQLpVcDi4FsZ06FQ@mail.gmail.com> <159546718359.3847286.13460778905630969897@swboyd.mtv.corp.google.com> <CACRpkdaN22OjWsG+d-hp_NEw==3VVAsWHkFsiG642KmbjD_6Mg@mail.gmail.com>
Subject: Re: [PATCH/RFC v7] ARM: boot: Obtain start of physical memory from DTB
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Kumar Gala <kumar.gala@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Eric Miao <eric.miao@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Laura Abbott <labbott@redhat.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 15 Aug 2020 01:28:35 -0700
Message-ID: <159748011515.33733.12886780037889852900@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Linus Walleij (2020-08-14 07:03:41)
> On Thu, Jul 23, 2020 at 3:19 AM Stephen Boyd <sboyd@kernel.org> wrote:
>=20
> > > > textofs-$(CONFIG_ARCH_IPQ40XX) :=3D 0x00208000
> > > > textofs-$(CONFIG_ARCH_MSM8X60) :=3D 0x00208000
> > > > textofs-$(CONFIG_ARCH_MSM8960) :=3D 0x00208000
> > >
> > > But what on earth is this? I just deleted this and the platform
> > > boots just as well.
> >
> > We need to shift the kernel text to start 2MB beyond the start of memory
> > because there is the shared memory region used to communicate with other
> > processors in the SoC there. It took a while for us to convince other OS
> > folks in the company to put shared memory somewhere else besides the
> > start of RAM, but eventually we won that battle.
> >
> > Does your booted kernel have its text section at the start of RAM or is
> > it offset by 2MB without this change? Check out /proc/iomem to see where
> > the kernel text is in relation to the start of RAM.
>=20
> The memory on this machine starts at 0x40200000 since the effect
> of the current code is to take pc &=3D 0xf8000000 and that results in
> 0x40000000 and then this adds textofs 0x00208000 to that
> resulting in 0x40208000 for the kernel physical RAM. Which
> is what we want to achieve since the RAM starts at
> 0x40200000.

The bootloader is telling the kernel that memory starts at 0x40200000
but in reality RAM or DDR starts at 0x40000000 and the first 2MB are
reserved for shared memory. In the old days the bootloader would remove
the shared memory region from the memory layout and update ATAGs to
indicate that memory started at 0x40200000.

>=20
> But TEXT_OFFSET is also used inside the kernel to offset the
> virtual memory. This means that when we set up the virtual
> memory split, the kernel virtual memory is also bumped by
> these 2 MB so the virtual memory starts at 0xC0208000
> instead of 0xC0008000 as is normal.
>=20
> It looks weird to me but maybe someone can explain how
> logical that is?

Yes, that's intentional. I believe that's because it will map the first
2MB of memmory otherwise with the wrong attributes. The kernel needs to
map shared memory as non-cacheable or something like that so that
communication to the modem isn't going through the cache and needing
constant cleaning.

Hope it helps! If not, we can probably dig up mailing list discussions
on this.
