Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4B2D23A2AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Aug 2020 12:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbgHCKSU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Aug 2020 06:18:20 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:34885 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbgHCKSU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Aug 2020 06:18:20 -0400
Received: by mail-oo1-f67.google.com with SMTP id j19so1505172oor.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Aug 2020 03:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bLwWjtcCNGtJBDj5GnvmiZWK/Yy4sV+kbUnqu0SuzU0=;
        b=CHhy7r78BAPiNEY3XBfLE62YfV1dUSkMguvm822lfs1vmi9zf/PEfBEM1fNf1HtAQv
         szgpncNG8eioDN8E2xM4xhjz7MeP2WLy8I4ZglwyAPLbYkbmoVFOv6s06kkYpT5Cke7v
         1SFFBmkF+o6LPGtmoYCeXOpng+ZyFFXR0ZE1WNX/+STgQEdLfEEjds412ZoDiCQNBMRJ
         tEGfjpxw6hOUIxUWwItWH+8SVm6rOpPbxwjO+JTFGILX5ijsNu7uwi+ZAZk21kLuJIl/
         1pIYb/gAC9Gj88CrwvrZHSexJrYCoZVPRfhqmuoEKa9r2cICkN5oUOp7c7uGzT/zZWzL
         5RaQ==
X-Gm-Message-State: AOAM5329HRbDxBDsHSUO8jqH2RIsXkO/UnaIJm5E9xbDibKNRLftDVuH
        e90H/ferJAYFcdZjjkXSzGiyJWeizqpiNZAJRm4=
X-Google-Smtp-Source: ABdhPJwnKmkCVYo98rx0Po1sai5Wd4TAMwjpdWXT81E+blY7ioGikSgG1JNdowIMZyWBcNFp5U1P8DHjT30tgqL1CPo=
X-Received: by 2002:a4a:4201:: with SMTP id h1mr4585302ooj.1.1596449899082;
 Mon, 03 Aug 2020 03:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200706150205.22053-1-geert+renesas@glider.be>
 <CACRpkdZD3gVLdcjaOL9ZCfZD+hrOUB0-q0NpoHu6m1Ujupw6Fw@mail.gmail.com>
 <CAK8P3a33AWe-fa8jJnRrme56Hgc-hLdNH4FK6FEPyZ0=O=vwtg@mail.gmail.com>
 <CACRpkdbxQrmNtByZ1cHSROyX7rwwaa2Mb=GQLpVcDi4FsZ06FQ@mail.gmail.com> <159546718359.3847286.13460778905630969897@swboyd.mtv.corp.google.com>
In-Reply-To: <159546718359.3847286.13460778905630969897@swboyd.mtv.corp.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 3 Aug 2020 12:18:08 +0200
Message-ID: <CAMuHMdWo2hfDfg5n1i0hHzVpEj3SG_0cMmUwuXggYETCYuOUCA@mail.gmail.com>
Subject: Re: [PATCH/RFC v7] ARM: boot: Obtain start of physical memory from DTB
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Laura Abbott <labbott@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kumar Gala <kumar.gala@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Eric Miao <eric.miao@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen,

On Thu, Jul 23, 2020 at 3:19 AM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Linus Walleij (2020-07-21 05:58:59)
> > On Mon, Jul 20, 2020 at 11:53 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > No idea what /exactly/ is going wrong, but I would point out that this is one
> > > of the platforms that is handled as a special case in the Makefile when
> > > setting TEXT_OFFSET:
> > (...)
> > > textofs-$(CONFIG_ARCH_IPQ40XX) := 0x00208000
> > > textofs-$(CONFIG_ARCH_MSM8X60) := 0x00208000
> > > textofs-$(CONFIG_ARCH_MSM8960) := 0x00208000
> >
> > But what on earth is this? I just deleted this and the platform
> > boots just as well.
>
> We need to shift the kernel text to start 2MB beyond the start of memory
> because there is the shared memory region used to communicate with other
> processors in the SoC there. It took a while for us to convince other OS
> folks in the company to put shared memory somewhere else besides the
> start of RAM, but eventually we won that battle.
>
> Does your booted kernel have its text section at the start of RAM or is
> it offset by 2MB without this change? Check out /proc/iomem to see where
> the kernel text is in relation to the start of RAM. I think the problem
> is the decompressor would have to parse the reserved memory sections in
> DT to figure out that it shouldn't decompress over shared memory, and
> changing the decompressor to do that was deemed "hard". Does this patch
> series resolve that?

As this patch adds C code to extract the start of memory from DT, it
should be quite easy to add code to filter out regions marked reserved
in DT.  In fact that would be a prerequisite for making this work with
crashkernel support (+ making the crashkernel code mark its memory as
reserved in DT).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
