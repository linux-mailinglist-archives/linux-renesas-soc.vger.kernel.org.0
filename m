Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07142168CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2020 11:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbgGGJJO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jul 2020 05:09:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:47230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725825AbgGGJJN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 05:09:13 -0400
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 754B020890
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2020 09:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594112952;
        bh=hK5nN8/Wvs1FMwASbOwqFL9C3E3fy5MqSNQBt/shppg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gEd0VKTSapPn7YQidFciomoHNt/RJYeC7sf6vQHUzZpylxxWz6bstCFryh2n6nINR
         tzzcKcKur/fwNZkmIxrt9yvpssOb/BkngNYCkIIskR+a4Ao5w2qynCmitcRo4Q9PJZ
         TVLet3fRBnmZIM3ynmFe/izz8xiHoroqWCbLr06M=
Received: by mail-oi1-f170.google.com with SMTP id e4so26178012oib.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2020 02:09:12 -0700 (PDT)
X-Gm-Message-State: AOAM533bs62EcPdHMoK9lDmgR18VSCK++9slb1lWzmDdQdf0+h0DuR4L
        qmG5YTRoW0TvwXxwUJgeuugsySPKz5396giuFmQ=
X-Google-Smtp-Source: ABdhPJxsOX9Jy3qrafy7mGlwIGPlyia8dT+UJ6Tu/Cy/ojpSU/osSJQb+NF13/qmIw7OoRsgvtt7ZOWqTwKg47V0+Nk=
X-Received: by 2002:aca:5516:: with SMTP id j22mr827405oib.47.1594112951685;
 Tue, 07 Jul 2020 02:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200706150205.22053-1-geert+renesas@glider.be>
 <CAMj1kXFmpWKVAbjjTVztmUktxFpYutQQ1SOBqknPB74fcG0FEQ@mail.gmail.com>
 <CAMuHMdVn6NmSL7ke629oQMnkW4qfu1r3DGNv3pGk8+nSRYZyhQ@mail.gmail.com>
 <CAMj1kXHe96g+4uuUsWTHbKom=EvssnbzZyX9i5La463QKjhLsw@mail.gmail.com>
 <CAMuHMdU4htNtgTTXjS5Q7-oxLaCtFVXypG14j0D9un09RM1Dxg@mail.gmail.com>
 <CAMj1kXG6xXBQka+bHO7Rfr7z-1mEEes52WMjXFrkW5KiUhTQRQ@mail.gmail.com> <CAMj1kXG0ierVG8q3bui+rV0i-ZJkSpKt8sVWEQoJi0F76OuzGQ@mail.gmail.com>
In-Reply-To: <CAMj1kXG0ierVG8q3bui+rV0i-ZJkSpKt8sVWEQoJi0F76OuzGQ@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 7 Jul 2020 12:09:00 +0300
X-Gmail-Original-Message-ID: <CAMj1kXFQy6ZF_XXiKLfxPSPOB4NjovwJeaCaTbBG_-A=apAKZg@mail.gmail.com>
Message-ID: <CAMj1kXFQy6ZF_XXiKLfxPSPOB4NjovwJeaCaTbBG_-A=apAKZg@mail.gmail.com>
Subject: Re: [PATCH/RFC v7] ARM: boot: Obtain start of physical memory from DTB
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Tue, 7 Jul 2020 at 11:40, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Tue, 7 Jul 2020 at 11:35, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Tue, 7 Jul 2020 at 10:58, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >
> > > Hi Ard,
> > >
> > > On Tue, Jul 7, 2020 at 9:45 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > On Tue, 7 Jul 2020 at 10:39, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Tue, Jul 7, 2020 at 8:50 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > > On Mon, 6 Jul 2020 at 18:02, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > > > > > > Currently, the start address of physical memory is obtained by masking
> > > > > > > the program counter with a fixed mask of 0xf8000000.  This mask value
> > > > > > > was chosen as a balance between the requirements of different platforms.
> > > > > > > However, this does require that the start address of physical memory is
> > > > > > > a multiple of 128 MiB, precluding booting Linux on platforms where this
> > > > > > > requirement is not fulfilled.
> > > > > > >
> > > > > > > Fix this limitation by obtaining the start address from the DTB instead,
> > > > > > > if available (either explicitly passed, or appended to the kernel).
> > > > > > > Fall back to the traditional method when needed.
> > > > > > >
> > > > > > > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> > > > > > > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> > > > > > > i.e. not at a multiple of 128 MiB.
> > > > > > >
> > > > > > > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > > Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> > > > > > > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > > > > > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > > > > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> > > > > > > Cc: Lukasz Stelmach <l.stelmach@samsung.com>
> > > > > > > ---
> > > > > > > Marked as RFC, because:
> > > > > > >   1. This is known to break crashkernel support, as the memory used by
> > > > > > >      the crashkernel is not marked reserved in DT (yet),
> > > > > > >   2. Russell won't apply this for v5.9 anyway,
> > > > > > >
> > > > > >
> > > > > > Would it help if we make this behavior dependent on a simple heuristic, e.g.,
> > > > > >
> > > > > > if (round_up(load_address, 128M) >= dram_end)
> > > > > >   use dram_start from DT
> > > > > > else
> > > > > >   use round_up(load_address, 128M)
> > > > > >
> > > > > > That way, the fix is guaranteed to only take effect for systems that
> > > > > > cannot even boot otherwise, which fixes the crashkernel case, as well
> > > > > > as other potential regressions due to the load address of the core
> > > > > > kernel changing for existing boards.
> > > > >
> > > > > Thanks for your suggestion!
> > > > >   1. Shouldn't the calculation use round_down() instead of round_up()?
> > > > >   2. Likewise, "round_down(load_address, 128M) < dram_start from DT"?
> > > > >
> > > >
> > > > No.
> > > >
> > > > What the code does today is round *up* to a multiple of 128 MB, and
> > > > only when that leads to a problem, we should use the DT provided
> > > > memory regions.
> > >
> > >                 mov     r4, pc
> > >                 and     r4, r4, #0xf8000000
> > >
> > > Surely this is rounding down, isn't it?
> > >
> >
> > Yes you are right.
> >
> > >                 add     r4, r4, #TEXT_OFFSET
> > >
> > > Followed by adding a small number (typically 0x00008000).
> > >
> > > On RZA2MEVB with 64 MiB of RAM, the result lies below dram_start.
> >
> > Yes, but in the general case, this is not true. Platforms that manage
> > to boot using the current arrangement will do so by putting the
> > decompressor above the first 128 MB aligned boundary covered by DRAM
> > (and lose access to any memory below it via the linear mapping, but
> > this memory could still be used via a no-map reserved-memory node
> > AFAIK.)
> >
> > > BTW, how to obtain dram_end? From DT again? Do we trust it, as we
> > > apparently cannot trust dram_start in some configurations.
> > >
> > > Do I need more coffee?
> > >
> >
> > Maybe we both do :-)
> >
> > AIUI, the reason we cannot trust dram_start is because of the
> > crashkernel case, i.e., the kernel may have deliberately been put high
> > up in memory, and the expectation is that the load address is derived
> > by rounding down the load address of the decompressor.
> >
> > Hence my suggestion to round *up* and compare with dram_end: if
> > round_up(load_address, 128M) >= dram_end holds, it is guaranteed that
> > no address exists in memory from which we could round down and arrive
> > at a valid DRAM address. This would mean that your change will only
> > affect platforms that were unable to boot to begin with, and not
> > affect any other weird configurations including crashkernels etc
>
> Uhm maybe not ...
>
> Time to get that coffee...

OK  so we know that the memory base should be a 16 MB aligned value >=
dram_start. This holds for the crashkernel as well, although in that
case, the memory base is much higher than dram_start, and not right
above it.

So how about if we *only* use the DT dram_start as the memory base if
it is aligned to 16 MB, and if rounding down from the load_address
produces an address that is below it? That should cover your use case,
but very conservatively, reducing the likelihood of regressions.
