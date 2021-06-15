Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEA833A8340
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Jun 2021 16:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbhFOOxu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Jun 2021 10:53:50 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:39629 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbhFOOxt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Jun 2021 10:53:49 -0400
Received: by mail-ua1-f46.google.com with SMTP id c10so6771849uan.6;
        Tue, 15 Jun 2021 07:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VRuDeOUfZ6B0u10ffnqTPMqKC8c9Vta/YzdAIyumZr4=;
        b=nGB42WUcJGGEgEnVnicySd1EuOPCyqkDJV8+S+d92WWQ7l7SiNuPBP7N9xhEPEEmmX
         /vHQMglWoQGDe2VhugJ48FZJhoi59uVo9ORF84Bxo89ottxpehC8q6SgWI2Vv5JU2AfY
         G+IItPP71cFmZgaiyw3QRnq50elnJr2TYjYHUctkRdBM3GSFY2Q7ASauNCgOwx1AlKFa
         otO3LHnUctOVGUn5YRsVtIjaISJ0pJ8yyeIQOB90KnOAp/S+PprOXEW0HsQ3729tLEva
         yofPimzYDKXZhrZCN19lJ2CIkhpVkPH2n16I87w43W12n9i3NMokeT/7wRwQzGAHfluu
         qQJw==
X-Gm-Message-State: AOAM533ageoz5zc/SqzIhKtHkHb4nWdAhnMvSCKF/1yq9WGpx0rr6P32
        njQGmpMyYy9BkEHXMWrwup1/UboIRIafWKg6NEU=
X-Google-Smtp-Source: ABdhPJyMlEwcIPhRuOKgllmjsxF0JpzWIGKXY3MQGgAhU31dK3Mc0jsRrYJl2Yc0tBi6Y8M6CDuHe5zvmJbjZnwnuDg=
X-Received: by 2002:ab0:63d9:: with SMTP id i25mr18418485uap.106.1623768704802;
 Tue, 15 Jun 2021 07:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210317113130.2554368-1-geert+renesas@glider.be> <CAL_JsqL3NRDpzPbOxwvP6N+K76UXmrxs=e9-1rK-PbAKUx7f6w@mail.gmail.com>
In-Reply-To: <CAL_JsqL3NRDpzPbOxwvP6N+K76UXmrxs=e9-1rK-PbAKUx7f6w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Jun 2021 16:51:33 +0200
Message-ID: <CAMuHMdUdB-Ux9UpeaN3H0_UWDH7_9r3s72ZP01++XzOvrwavHg@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: Parse kdump DT properties
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Horman <horms@verge.net.au>,
        Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Mon, Mar 22, 2021 at 5:59 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Wed, Mar 17, 2021 at 5:31 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Parse the following DT properties in the crash dump kernel, to provide a
> > modern interface between kexec and the crash dump kernel:
> >   - linux,elfcorehdr: ELF core header segment, similar to the
> >     "elfcorehdr=" kernel parameter.
> >   - linux,usable-memory-range: Usable memory reserved for the crash dump
> >     kernel.
> >     This makes the memory reservation explicit.  If present, Linux no
> >     longer needs to mask the program counter, and rely on the "mem="
> >     kernel parameter to obtain the start and size of usable memory.
> >
> > For backwards compatibility, the traditional method to derive the start
> > of memory is still used if "linux,usable-memory-range" is absent, and
> > the "elfcorehdr=" and "mem=" kernel parameters are still parsed.
> >
> > Loosely based on the ARM64 version by Akashi Takahiro.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/arch/arm/mm/init.c
> > +++ b/arch/arm/mm/init.c
> > @@ -4,6 +4,7 @@
> >   *
> >   *  Copyright (C) 1995-2005 Russell King
> >   */
> > +#include <linux/crash_dump.h>
> >  #include <linux/kernel.h>
> >  #include <linux/errno.h>
> >  #include <linux/swap.h>
> > @@ -210,8 +211,95 @@ void check_cpu_icache_size(int cpuid)
> >  }
> >  #endif
> >
> > +#ifdef CONFIG_OF_EARLY_FLATTREE
> > +static int __init early_init_dt_scan_usablemem(unsigned long node,
> > +               const char *uname, int depth, void *data)
> > +{
> > +       struct memblock_region *usablemem = data;
> > +       const __be32 *reg;
> > +       int len;
> > +
> > +       if (depth != 1 || strcmp(uname, "chosen") != 0)
> > +               return 0;
>
> We have libfdt now, just get the '/chosen' node rather than using
> of_scan_flat_dt().
>
>
> > +
> > +       reg = of_get_flat_dt_prop(node, "linux,usable-memory-range", &len);
> > +       if (!reg || (len < (dt_root_addr_cells + dt_root_size_cells)))
> > +               return 1;
> > +
> > +       usablemem->base = dt_mem_next_cell(dt_root_addr_cells, &reg);
> > +       usablemem->size = dt_mem_next_cell(dt_root_size_cells, &reg);
> > +       return 1;
> > +}
> > +
> > +static void __init fdt_enforce_memory_region(void)
> > +{
> > +       struct memblock_region reg = {
> > +               .size = 0,
> > +       };
> > +
> > +       of_scan_flat_dt(early_init_dt_scan_usablemem, &reg);
> > +
> > +       if (reg.size)
> > +               memblock_cap_memory_range(reg.base, reg.size);
>
> We should be able to do this in the DT core code. It doesn't matter
> that these properties are arm* only. Other arches won't find the
> properties.
>
> Also, note that there is now a drivers/of/kexec.c (in -next) though
> not sure if all this would go there or stay in fdt.c with the rest of
> the memory parsing.

It's gonna be the latter, as that file handles the FDT during early
kernel startup, for both normal and kdump kernels.

Despite the name, drivers/of/kexec.c is not for kexec, but for
kexec_file.  This is the "new" fancy syscall that prepares the DTB
for the new kernel itself, unlike the classic kexec syscall, where
userspace is responsible for preparing the DTB for the new kernel.

> > +#if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_OF_EARLY_FLATTREE)
> > +static int __init early_init_dt_scan_elfcorehdr(unsigned long node,
> > +               const char *uname, int depth, void *data)
>
> Same comments as above.

This one can indeed be handled easily by drivers/of/fdt.c.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
