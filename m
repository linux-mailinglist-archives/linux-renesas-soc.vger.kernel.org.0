Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703671AA40E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 15:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897048AbgDONRG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 09:17:06 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42015 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S370736AbgDONRA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 09:17:00 -0400
Received: by mail-ot1-f68.google.com with SMTP id l21so3300446otd.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2020 06:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dbnocMf+YCXO6rynSRbZKTHwedc1p0SI4PJLE21o0ts=;
        b=tcwcMxjyuB17jcYEyseG57ePeYy+L1oQKHQEUudo+r1/HAHyhlIlGvOZ4fhNiFmhPR
         H2lRu2jJooeUoFLOSifNBrqUWniWjeTP+q9hX5/xGlFn4smhg5/wK5BrsbJcR2YAE0yJ
         JbZhWFXiaSjjoKzfCEvmo3f9CDc2jBlr7ufstx0V0HEvHyuU3hLQXkH6uQ1Nae8j3zwc
         QzjYx8yLVvvcFjUe1TvLcVnA1aEK70M2iNCzZtR2m2ik8gh8FwxGbNu5Ya6l22Vym3Ob
         /ifbf9gng0G/oPUzgRVb8xYlUvKeAUIXmZ6lHYOQBrUw1KirG4g9MkVXDRgUjEVdo1Aw
         65mg==
X-Gm-Message-State: AGi0PuZOMJodHNbTR4rs6kk1YSUF7iVRvXFm1kjv5ol9sl5kpXZtMAqg
        dfQphHemUVYL6SU0X1D4BQiS89abmY9LktKAx3w=
X-Google-Smtp-Source: APiQypI1n3n1HrpC733H6dekvk5p8H+HZWlAjswfFTnY0HYg7b/b8KXVZIN2QJT+RFB7PNoRdwSj8pariD7U/pYZeoo=
X-Received: by 2002:a9d:6299:: with SMTP id x25mr16992635otk.107.1586956619730;
 Wed, 15 Apr 2020 06:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200320144348.12865-1-geert+renesas@glider.be>
 <CAKv+Gu8q2bAVMRLSc-Ae=hxhg3sbvpfuaMJ_nx4FZFvegNZ+9w@mail.gmail.com>
 <CAMj1kXFAEOWGgmMT4SMP=QafcT54mzMekLjm3wMTN8M4psNSKw@mail.gmail.com>
 <CAMuHMdUkrF9qBaZre0EJ-cuzPcL7A1j2ANmQNYV7FAngybb1bA@mail.gmail.com> <CAMj1kXEgXuizeQzBrt6aC-QODRGinoU5sjFrx0a1LRMg7zD85w@mail.gmail.com>
In-Reply-To: <CAMj1kXEgXuizeQzBrt6aC-QODRGinoU5sjFrx0a1LRMg7zD85w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Apr 2020 15:16:48 +0200
Message-ID: <CAMuHMdWxiSE5H=CEqrO5Zx4nyiLo8_xxRJUj20eHm=PHnANkdg@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: boot: Obtain start of physical memory from DTB
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Nicolas Pitre <nico@fluxnic.net>, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Eric Miao <eric.miao@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ard,

On Wed, Apr 15, 2020 at 2:57 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> On Wed, 15 Apr 2020 at 14:45, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Apr 14, 2020 at 10:07 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > On Wed, 25 Mar 2020 at 17:40, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > On Fri, 20 Mar 2020 at 15:43, Geert Uytterhoeven
> > > > <geert+renesas@glider.be> wrote:
> > > > > Currently, the start address of physical memory is obtained by masking
> > > > > the program counter with a fixed mask of 0xf8000000.  This mask value
> > > > > was chosen as a balance between the requirements of different platforms.
> > > > > However, this does require that the start address of physical memory is
> > > > > a multiple of 128 MiB, precluding booting Linux on platforms where this
> > > > > requirement is not fulfilled.
> > > > >
> > > > > Fix this limitation by obtaining the start address from the DTB instead,
> > > > > if available (either explicitly passed, or appended to the kernel).
> > > > > Fall back to the traditional method when needed.
> > > > >
> > > > > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> > > > > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> > > > > i.e. not at a multiple of 128 MiB.
> > > > >
> > > > > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> > > > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > > ---
> > > > > v4:
> > > > >   - Fix stack location after commit 184bf653a7a452c1 ("ARM:
> > > > >     decompressor: factor out routine to obtain the inflated image
> > > > >     size"),
> > > > >
> > > >
> > > > Apologies for the breakage. I was aware of the existence of this
> > > > patch, but I didn't realize it was accessing LC0 early on to find the
> > > > stack pointer value.
> > > >
> > > > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > OK, so one thing I did notice when playing with this code is that the
> > > phys/virt patching code requires that 'PHYS_OFFSET - PAGE_OFFSET' is a
> > > multiple of 16 MB, and so this needs to be taken into account by this
> > > change as well, given that PHYS_OFFSET is based on the placement of
> > > the uncompressed kernel in the physical address space.
> >
> > You mean fdt_get_mem_start() should round up the address to make sure
> > it is a multiple of 16 MiB (assumed PAGE_OFFSET is a multiple of 16 MiB,
> > too)?
>
> Yes.

OK.

> > Can PAGE_OFFSET actually be not a multiple of 16 MiB?
>
> ARM's Kconfig has
>
> config PAGE_OFFSET
>         hex
>         default PHYS_OFFSET if !MMU
>         default 0x40000000 if VMSPLIT_1G
>         default 0x80000000 if VMSPLIT_2G
>         default 0xB0000000 if VMSPLIT_3G_OPT
>         default 0xC0000000
>
> which means that PHYS_OFFSET - PAGE_OFFSET is guaranteed to be 16 MB
> aligned if PHYS_OFFSET is 16 MB aligned.

Ah, I missed the lack of a prompt, and thought this was user-configurable,
too.  Hence as you talked about the alignment of the difference of the two
values only, I wondered if PAGE_OFFSET could be e.g. 0xb0800000,
so PHYS_OFFSET has to be offset by 0x800000, too ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
