Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318871A7571
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2020 10:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406971AbgDNIHZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Apr 2020 04:07:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:48784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406964AbgDNIHM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Apr 2020 04:07:12 -0400
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 83D9E20774
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2020 08:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586851627;
        bh=NjcoS6FoeHprQ2wvOMz4dIaRGIgrGeu2l5Dn/BzuqOo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=n3UlIZoNal5q6Yiqbjnc9//1HRnmDZdKsIK9xJHqFFgYuzfShmNzSpssNxkI8X2jW
         uoGCvyJzoxoRpD+k0h+W+OCP1wAd9I02d/JL2yfg2FEgziUpKo0JHR4TS0Lq+lGN/G
         pFr9qjfmp6HZiS4dkU/vwkWl2HFUPN1u/lG7fmt8=
Received: by mail-il1-f176.google.com with SMTP id t11so11169786ils.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2020 01:07:07 -0700 (PDT)
X-Gm-Message-State: AGi0PuZOnwD2FmF4xjyj4awuAT4TWztS/mU8cQ5IE6skIHgLfKHrrmBY
        yMnXROTR5lwIHNGrLwtSoLWBpoSeYHuq2UKNU9o=
X-Google-Smtp-Source: APiQypLQLP/ZI4tMLr6ebPQ0bR4YsIrccGVqw6J/dihbCsVIqgQD8U5+8RZJOaX3ZbBuK9zufCedF7pYyc8yYBMBmwg=
X-Received: by 2002:a92:aa0f:: with SMTP id j15mr8713415ili.211.1586851626855;
 Tue, 14 Apr 2020 01:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200320144348.12865-1-geert+renesas@glider.be> <CAKv+Gu8q2bAVMRLSc-Ae=hxhg3sbvpfuaMJ_nx4FZFvegNZ+9w@mail.gmail.com>
In-Reply-To: <CAKv+Gu8q2bAVMRLSc-Ae=hxhg3sbvpfuaMJ_nx4FZFvegNZ+9w@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 14 Apr 2020 10:06:56 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFAEOWGgmMT4SMP=QafcT54mzMekLjm3wMTN8M4psNSKw@mail.gmail.com>
Message-ID: <CAMj1kXFAEOWGgmMT4SMP=QafcT54mzMekLjm3wMTN8M4psNSKw@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: boot: Obtain start of physical memory from DTB
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Nicolas Pitre <nico@fluxnic.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
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

On Wed, 25 Mar 2020 at 17:40, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Fri, 20 Mar 2020 at 15:43, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> >
> > Currently, the start address of physical memory is obtained by masking
> > the program counter with a fixed mask of 0xf8000000.  This mask value
> > was chosen as a balance between the requirements of different platforms.
> > However, this does require that the start address of physical memory is
> > a multiple of 128 MiB, precluding booting Linux on platforms where this
> > requirement is not fulfilled.
> >
> > Fix this limitation by obtaining the start address from the DTB instead,
> > if available (either explicitly passed, or appended to the kernel).
> > Fall back to the traditional method when needed.
> >
> > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> > i.e. not at a multiple of 128 MiB.
> >
> > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> > v4:
> >   - Fix stack location after commit 184bf653a7a452c1 ("ARM:
> >     decompressor: factor out routine to obtain the inflated image
> >     size"),
> >
>
> Apologies for the breakage. I was aware of the existence of this
> patch, but I didn't realize it was accessing LC0 early on to find the
> stack pointer value.
>
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
>

OK, so one thing I did notice when playing with this code is that the
phys/virt patching code requires that 'PHYS_OFFSET - PAGE_OFFSET' is a
multiple of 16 MB, and so this needs to be taken into account by this
change as well, given that PHYS_OFFSET is based on the placement of
the uncompressed kernel in the physical address space.
