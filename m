Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628E51AA1C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 14:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S370206AbgDOMq6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 08:46:58 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40796 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S370189AbgDOMpt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 08:45:49 -0400
Received: by mail-ot1-f66.google.com with SMTP id i27so3209515ota.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2020 05:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IR4ZVGXr+wRwlF8AUUe1V7aAxhR/LFzIJ2fK96oWNr8=;
        b=l/cgUUwWbxjUXAEhnf4lbhmZXy2TEoEvKQpmdFahwassHDDHdjHNz4/nOrMXHwswBs
         lbiSnd0/nZOF0rISqc7MGZBxZWO0ud5Hsi9wwpKbSk2T/cnBgKh0nthhdw7QQFosGBj1
         NOwtl4mVlAbgm2BD5KD7FCKTtres7NhUM2tGO1zVPxXCl3+5vXyJDWykR7eRLD37Ni5G
         ihsUaOhbJ05aO+zHUO0XNOhRJDWYym1TWVekPt2H+37RkzvDFxP2dQNFwRiKBmjQw8cg
         9Bim7sTxtbTDJAtxlbJA73Ocy/d+5abhyadJIH95t1hiEtHL+rYRj96z/tHSCGDuZKlP
         XdlA==
X-Gm-Message-State: AGi0Pub8f9iaamEeksV87fjV52GKTdy4L1A6csmBMM3mUnvPg9pVMfRL
        gEAbsWsM86E5v3ErnMW2+mDNb8A8honxDITccYI=
X-Google-Smtp-Source: APiQypKOaaToKG1t3eLDM/6X/8HK2J9ka0wjabL5aK3YHS6MKbxLNizZ+ztTbzdVZv6t4BibGtgKgxCnE5CDqrtmkks=
X-Received: by 2002:a9d:7590:: with SMTP id s16mr22295846otk.250.1586954747367;
 Wed, 15 Apr 2020 05:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200320144348.12865-1-geert+renesas@glider.be>
 <CAKv+Gu8q2bAVMRLSc-Ae=hxhg3sbvpfuaMJ_nx4FZFvegNZ+9w@mail.gmail.com> <CAMj1kXFAEOWGgmMT4SMP=QafcT54mzMekLjm3wMTN8M4psNSKw@mail.gmail.com>
In-Reply-To: <CAMj1kXFAEOWGgmMT4SMP=QafcT54mzMekLjm3wMTN8M4psNSKw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Apr 2020 14:45:35 +0200
Message-ID: <CAMuHMdUkrF9qBaZre0EJ-cuzPcL7A1j2ANmQNYV7FAngybb1bA@mail.gmail.com>
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

On Tue, Apr 14, 2020 at 10:07 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> On Wed, 25 Mar 2020 at 17:40, Ard Biesheuvel <ardb@kernel.org> wrote:
> > On Fri, 20 Mar 2020 at 15:43, Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Currently, the start address of physical memory is obtained by masking
> > > the program counter with a fixed mask of 0xf8000000.  This mask value
> > > was chosen as a balance between the requirements of different platforms.
> > > However, this does require that the start address of physical memory is
> > > a multiple of 128 MiB, precluding booting Linux on platforms where this
> > > requirement is not fulfilled.
> > >
> > > Fix this limitation by obtaining the start address from the DTB instead,
> > > if available (either explicitly passed, or appended to the kernel).
> > > Fall back to the traditional method when needed.
> > >
> > > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> > > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> > > i.e. not at a multiple of 128 MiB.
> > >
> > > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > ---
> > > v4:
> > >   - Fix stack location after commit 184bf653a7a452c1 ("ARM:
> > >     decompressor: factor out routine to obtain the inflated image
> > >     size"),
> > >
> >
> > Apologies for the breakage. I was aware of the existence of this
> > patch, but I didn't realize it was accessing LC0 early on to find the
> > stack pointer value.
> >
> > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
>
> OK, so one thing I did notice when playing with this code is that the
> phys/virt patching code requires that 'PHYS_OFFSET - PAGE_OFFSET' is a
> multiple of 16 MB, and so this needs to be taken into account by this
> change as well, given that PHYS_OFFSET is based on the placement of
> the uncompressed kernel in the physical address space.

You mean fdt_get_mem_start() should round up the address to make sure
it is a multiple of 16 MiB (assumed PAGE_OFFSET is a multiple of 16 MiB,
too)?
Can PAGE_OFFSET actually be not a multiple of 16 MiB?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
