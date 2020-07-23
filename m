Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E9822A474
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jul 2020 03:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387517AbgGWBTp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Jul 2020 21:19:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:56506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387510AbgGWBTp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Jul 2020 21:19:45 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56A2D20771;
        Thu, 23 Jul 2020 01:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595467184;
        bh=QfMH7B9BMTL8WQ/BywQA5f3Zd1xGTehBAlrxpaz7Az0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jTpgHYmj4hYCdjGFA91nUHVV/Bue7aWqUZThnPEeZ7hmCusSxwb/FSmcNFIYj0HRF
         jFHcyVp+9nCGNmAZJXpx98E8e1LAdKioz3lg+SRIVNvBe/uJ+gN7xjqYAnuGwo71ZU
         j67qfJ5YUGUUMbv2iv0Mp5qDBdbPoeclTOu4RW6Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CACRpkdbxQrmNtByZ1cHSROyX7rwwaa2Mb=GQLpVcDi4FsZ06FQ@mail.gmail.com>
References: <20200706150205.22053-1-geert+renesas@glider.be> <CACRpkdZD3gVLdcjaOL9ZCfZD+hrOUB0-q0NpoHu6m1Ujupw6Fw@mail.gmail.com> <CAK8P3a33AWe-fa8jJnRrme56Hgc-hLdNH4FK6FEPyZ0=O=vwtg@mail.gmail.com> <CACRpkdbxQrmNtByZ1cHSROyX7rwwaa2Mb=GQLpVcDi4FsZ06FQ@mail.gmail.com>
Subject: Re: [PATCH/RFC v7] ARM: boot: Obtain start of physical memory from DTB
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Kumar Gala <kumar.gala@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Eric Miao <eric.miao@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
To:     Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Laura Abbott <labbott@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 22 Jul 2020 18:19:43 -0700
Message-ID: <159546718359.3847286.13460778905630969897@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Linus Walleij (2020-07-21 05:58:59)
> On Mon, Jul 20, 2020 at 11:53 AM Arnd Bergmann <arnd@arndb.de> wrote:
>=20
> > No idea what /exactly/ is going wrong, but I would point out that this =
is one
> > of the platforms that is handled as a special case in the Makefile when
> > setting TEXT_OFFSET:
> (...)
> > textofs-$(CONFIG_ARCH_IPQ40XX) :=3D 0x00208000
> > textofs-$(CONFIG_ARCH_MSM8X60) :=3D 0x00208000
> > textofs-$(CONFIG_ARCH_MSM8960) :=3D 0x00208000
>=20
> But what on earth is this? I just deleted this and the platform
> boots just as well.

We need to shift the kernel text to start 2MB beyond the start of memory
because there is the shared memory region used to communicate with other
processors in the SoC there. It took a while for us to convince other OS
folks in the company to put shared memory somewhere else besides the
start of RAM, but eventually we won that battle.

Does your booted kernel have its text section at the start of RAM or is
it offset by 2MB without this change? Check out /proc/iomem to see where
the kernel text is in relation to the start of RAM. I think the problem
is the decompressor would have to parse the reserved memory sections in
DT to figure out that it shouldn't decompress over shared memory, and
changing the decompressor to do that was deemed "hard". Does this patch
series resolve that?

>=20
> It was originally added by Stephen in
> commit 9e775ad19f52d70a53797b4d0eb740c52b0a9567

That was almost a decade ago! Don't remind me of these things ;-)

> "ARM: 7012/1: Set proper TEXT_OFFSET for newer MSMs"
> to patch around memblocks in the board files in
> mach-msm/* These boardfile hacks that seem to relate to this
> textofs are now *GONE* but this is still here!
>=20
> Laura, Stephen, Bjorn: can't we just delete these QCOM
> textofs things so as to clean out some confusion?
>=20
> Or is my APQ8060 odd once again and the rest of the world
> crashes if we remove this?
>
