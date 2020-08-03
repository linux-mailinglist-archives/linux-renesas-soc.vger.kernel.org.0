Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E51C23ADBD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Aug 2020 21:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbgHCTq4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Aug 2020 15:46:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:59278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728041AbgHCTqz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Aug 2020 15:46:55 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E4DD20672;
        Mon,  3 Aug 2020 19:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596484015;
        bh=CVbzCkFD3/UKBlI4U2T5Fvan/BOF0ZxKo97Y/Uyn7Cw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Re1jiQ7Lpw7RO6oe1RWcu7UEyWPbeMjrDvzcVZ5V2eyqHkhR+Hhw5hjhcR4AwP28Q
         Rp7xKMk/a2TaEd+BKJf+5BLG97o1Ca0GpaK06EbpOashDRn6zomjaNIWCR8XBmzes3
         gE+8vv/i4UKiks1WyA7msBxZq0FGvdOw/hfvlIHM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdWo2hfDfg5n1i0hHzVpEj3SG_0cMmUwuXggYETCYuOUCA@mail.gmail.com>
References: <20200706150205.22053-1-geert+renesas@glider.be> <CACRpkdZD3gVLdcjaOL9ZCfZD+hrOUB0-q0NpoHu6m1Ujupw6Fw@mail.gmail.com> <CAK8P3a33AWe-fa8jJnRrme56Hgc-hLdNH4FK6FEPyZ0=O=vwtg@mail.gmail.com> <CACRpkdbxQrmNtByZ1cHSROyX7rwwaa2Mb=GQLpVcDi4FsZ06FQ@mail.gmail.com> <159546718359.3847286.13460778905630969897@swboyd.mtv.corp.google.com> <CAMuHMdWo2hfDfg5n1i0hHzVpEj3SG_0cMmUwuXggYETCYuOUCA@mail.gmail.com>
Subject: Re: [PATCH/RFC v7] ARM: boot: Obtain start of physical memory from DTB
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Kumar Gala <kumar.gala@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Eric Miao <eric.miao@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Laura Abbott <labbott@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 03 Aug 2020 12:46:53 -0700
Message-ID: <159648401388.1360974.8036993510375175974@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-08-03 03:18:08)
> Hi Stephen,
>=20
> On Thu, Jul 23, 2020 at 3:19 AM Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Linus Walleij (2020-07-21 05:58:59)
> > > On Mon, Jul 20, 2020 at 11:53 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > No idea what /exactly/ is going wrong, but I would point out that t=
his is one
> > > > of the platforms that is handled as a special case in the Makefile =
when
> > > > setting TEXT_OFFSET:
> > > (...)
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
> > the kernel text is in relation to the start of RAM. I think the problem
> > is the decompressor would have to parse the reserved memory sections in
> > DT to figure out that it shouldn't decompress over shared memory, and
> > changing the decompressor to do that was deemed "hard". Does this patch
> > series resolve that?
>=20
> As this patch adds C code to extract the start of memory from DT, it
> should be quite easy to add code to filter out regions marked reserved
> in DT.  In fact that would be a prerequisite for making this work with
> crashkernel support (+ making the crashkernel code mark its memory as
> reserved in DT).
>=20

Cool. Sounds like that may need to be done then before it works on these
particular qcom platforms.
