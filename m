Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8393F2167DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2020 09:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgGGH6s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jul 2020 03:58:48 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35714 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgGGH6s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 03:58:48 -0400
Received: by mail-oi1-f194.google.com with SMTP id k4so34178902oik.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2020 00:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gM5eD64lpfuDctEPr4G1NsrcEzEVkWdUqeZEr3N96yc=;
        b=Wyhjp9xrG693UeaQq9MJMm9vkvF0yK/P+ln8PCya2YHOP6D/J83izPQpdwXfBXxuXn
         1hRUkrrjJFNZKm45Vm2vepmQn0rnoos9vnHj8p9xiwAg2D8PwpcNYO0L4Bat7Ip+cjPJ
         8ua61ffH1zoxahmSPMyGE1/x9gOIGRe3llIJEkDEHSGVXhxipF/L6S82KNqvCwxQ/Pql
         d+voCViRdCe3Tjr3bIqYvc06zeepwjq5oyULDJRc0+SOHpFg8jor9ZQ+pkRW1Ysc1GBj
         L/y6bszvWERVedpvnU4MoaELN/s8ICVrzLWV3hrelILAsACEion6GPoVehqsXaJTLcXL
         AoMw==
X-Gm-Message-State: AOAM533reVln6pHNA84VTojOw4po8bPswRtE0QDZius+0CNkwWbh0ucP
        Lvfrxx+j3mQBm8eWfcWXp4Rho9rVcje23lQWc5Q=
X-Google-Smtp-Source: ABdhPJyPhCwHw+BH5hWBP7RH7D6H/uIBwF1q9JsFmjpKP2IF5Ov3qprM33CsK/VA2lnkZtTHEiVg5CJSaiRKRF49UCw=
X-Received: by 2002:aca:5c41:: with SMTP id q62mr2261847oib.148.1594108727033;
 Tue, 07 Jul 2020 00:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200706150205.22053-1-geert+renesas@glider.be>
 <CAMj1kXFmpWKVAbjjTVztmUktxFpYutQQ1SOBqknPB74fcG0FEQ@mail.gmail.com>
 <CAMuHMdVn6NmSL7ke629oQMnkW4qfu1r3DGNv3pGk8+nSRYZyhQ@mail.gmail.com> <CAMj1kXHe96g+4uuUsWTHbKom=EvssnbzZyX9i5La463QKjhLsw@mail.gmail.com>
In-Reply-To: <CAMj1kXHe96g+4uuUsWTHbKom=EvssnbzZyX9i5La463QKjhLsw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jul 2020 09:58:35 +0200
Message-ID: <CAMuHMdU4htNtgTTXjS5Q7-oxLaCtFVXypG14j0D9un09RM1Dxg@mail.gmail.com>
Subject: Re: [PATCH/RFC v7] ARM: boot: Obtain start of physical memory from DTB
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ard,

On Tue, Jul 7, 2020 at 9:45 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> On Tue, 7 Jul 2020 at 10:39, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Jul 7, 2020 at 8:50 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > On Mon, 6 Jul 2020 at 18:02, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > > > Currently, the start address of physical memory is obtained by masking
> > > > the program counter with a fixed mask of 0xf8000000.  This mask value
> > > > was chosen as a balance between the requirements of different platforms.
> > > > However, this does require that the start address of physical memory is
> > > > a multiple of 128 MiB, precluding booting Linux on platforms where this
> > > > requirement is not fulfilled.
> > > >
> > > > Fix this limitation by obtaining the start address from the DTB instead,
> > > > if available (either explicitly passed, or appended to the kernel).
> > > > Fall back to the traditional method when needed.
> > > >
> > > > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> > > > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> > > > i.e. not at a multiple of 128 MiB.
> > > >
> > > > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> > > > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> > > > Cc: Lukasz Stelmach <l.stelmach@samsung.com>
> > > > ---
> > > > Marked as RFC, because:
> > > >   1. This is known to break crashkernel support, as the memory used by
> > > >      the crashkernel is not marked reserved in DT (yet),
> > > >   2. Russell won't apply this for v5.9 anyway,
> > > >
> > >
> > > Would it help if we make this behavior dependent on a simple heuristic, e.g.,
> > >
> > > if (round_up(load_address, 128M) >= dram_end)
> > >   use dram_start from DT
> > > else
> > >   use round_up(load_address, 128M)
> > >
> > > That way, the fix is guaranteed to only take effect for systems that
> > > cannot even boot otherwise, which fixes the crashkernel case, as well
> > > as other potential regressions due to the load address of the core
> > > kernel changing for existing boards.
> >
> > Thanks for your suggestion!
> >   1. Shouldn't the calculation use round_down() instead of round_up()?
> >   2. Likewise, "round_down(load_address, 128M) < dram_start from DT"?
> >
>
> No.
>
> What the code does today is round *up* to a multiple of 128 MB, and
> only when that leads to a problem, we should use the DT provided
> memory regions.

                mov     r4, pc
                and     r4, r4, #0xf8000000

Surely this is rounding down, isn't it?

                add     r4, r4, #TEXT_OFFSET

Followed by adding a small number (typically 0x00008000).

On RZA2MEVB with 64 MiB of RAM, the result lies below dram_start.
BTW, how to obtain dram_end? From DT again? Do we trust it, as we
apparently cannot trust dram_start in some configurations.

Do I need more coffee?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
