Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D061AA293
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 14:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505609AbgDOM5s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 08:57:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:42260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2505605AbgDOM5o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 08:57:44 -0400
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6351D20936
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2020 12:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586955463;
        bh=prirf2k0vEOldQV3Q6B6roXSXcORQ3srsnX0/zX+nmU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QbAb7Gd9GthiCa4/OawBOq8tVLLsDbvZuYYEJiz/CQ38sJjTP3TEvqaqmiJY9WR8R
         kG55FAZIYGPVmN18Z/mGB1yLrj72AcICVDvClQGwFkeO58d6AQqmU7SYtNsNSlZNQ7
         f1N8aMzZtyymQyQ6UwZUbkjmQsAf8rmKj/mp/M7Q=
Received: by mail-pg1-f174.google.com with SMTP id x26so1432340pgc.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2020 05:57:43 -0700 (PDT)
X-Gm-Message-State: AGi0PuaK/oj9Q6e9GK7fMdQjii0lG75c8mqx8J7QByvzRojFitH5Q8Fx
        ATXcMw8mh6DBCjwMzDZKjXEj/bJDa9AgMTX575w=
X-Google-Smtp-Source: APiQypKy73qFjUlK2hkG7VDPPS2tn6u2GeHdjM9WffZnjcJ3WlNJ5Lbm/19dLEq4AuxLtvPzf6NnZMZ7X/nStea6z5k=
X-Received: by 2002:a92:aa0f:: with SMTP id j15mr5222510ili.211.1586955461321;
 Wed, 15 Apr 2020 05:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200320144348.12865-1-geert+renesas@glider.be>
 <CAKv+Gu8q2bAVMRLSc-Ae=hxhg3sbvpfuaMJ_nx4FZFvegNZ+9w@mail.gmail.com>
 <CAMj1kXFAEOWGgmMT4SMP=QafcT54mzMekLjm3wMTN8M4psNSKw@mail.gmail.com> <CAMuHMdUkrF9qBaZre0EJ-cuzPcL7A1j2ANmQNYV7FAngybb1bA@mail.gmail.com>
In-Reply-To: <CAMuHMdUkrF9qBaZre0EJ-cuzPcL7A1j2ANmQNYV7FAngybb1bA@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 15 Apr 2020 14:57:30 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEgXuizeQzBrt6aC-QODRGinoU5sjFrx0a1LRMg7zD85w@mail.gmail.com>
Message-ID: <CAMj1kXEgXuizeQzBrt6aC-QODRGinoU5sjFrx0a1LRMg7zD85w@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: boot: Obtain start of physical memory from DTB
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Wed, 15 Apr 2020 at 14:45, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ard,
>
> On Tue, Apr 14, 2020 at 10:07 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > On Wed, 25 Mar 2020 at 17:40, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > On Fri, 20 Mar 2020 at 15:43, Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
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
> > > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > ---
> > > > v4:
> > > >   - Fix stack location after commit 184bf653a7a452c1 ("ARM:
> > > >     decompressor: factor out routine to obtain the inflated image
> > > >     size"),
> > > >
> > >
> > > Apologies for the breakage. I was aware of the existence of this
> > > patch, but I didn't realize it was accessing LC0 early on to find the
> > > stack pointer value.
> > >
> > > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> >
> > OK, so one thing I did notice when playing with this code is that the
> > phys/virt patching code requires that 'PHYS_OFFSET - PAGE_OFFSET' is a
> > multiple of 16 MB, and so this needs to be taken into account by this
> > change as well, given that PHYS_OFFSET is based on the placement of
> > the uncompressed kernel in the physical address space.
>
> You mean fdt_get_mem_start() should round up the address to make sure
> it is a multiple of 16 MiB (assumed PAGE_OFFSET is a multiple of 16 MiB,
> too)?

Yes.

> Can PAGE_OFFSET actually be not a multiple of 16 MiB?

ARM's Kconfig has

config PAGE_OFFSET
        hex
        default PHYS_OFFSET if !MMU
        default 0x40000000 if VMSPLIT_1G
        default 0x80000000 if VMSPLIT_2G
        default 0xB0000000 if VMSPLIT_3G_OPT
        default 0xC0000000

which means that PHYS_OFFSET - PAGE_OFFSET is guaranteed to be 16 MB
aligned if PHYS_OFFSET is 16 MB aligned.
