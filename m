Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 823592167AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2020 09:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728319AbgGGHpW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jul 2020 03:45:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:36286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726467AbgGGHpV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 03:45:21 -0400
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7D10A20758
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2020 07:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594107920;
        bh=vTllSKG4fzs0QvBRu9ucypUzu8K0u4R7Ajo7DG7n19c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uDigErE1iBtgv8r86gqZ2Oe6HDGTi4Fjw3YXvTJz9eiHSMpmZCYKTxxs+KgTnl1Rx
         xCpgJ5G/+nP6r/cS+r1HEoEsZRcH7EW6zNPmJiuCERxdnTY/HJ34uW7+SafngxJZUr
         z/giSyRMOm/wRPjlorKwRmHHXs3x3N04ck6UX3t0=
Received: by mail-ot1-f53.google.com with SMTP id h1so11473837otq.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2020 00:45:20 -0700 (PDT)
X-Gm-Message-State: AOAM532tjHkzvws240Ilj5Epgastnm+K3iX1VCuw8/Ls0hn+Ubf0zdC8
        +uP33662XNhHtURQnaNGL655f8T6upBcePIrIHI=
X-Google-Smtp-Source: ABdhPJwLG2hBJK00IfRySa8B+cl/TQACsr2YmdhG3NdQPKBzzdSXsdtk++pyEEi3uLG3FI78EaocLcctNmLHfqIhdiQ=
X-Received: by 2002:a9d:4a8f:: with SMTP id i15mr47505658otf.77.1594107919841;
 Tue, 07 Jul 2020 00:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200706150205.22053-1-geert+renesas@glider.be>
 <CAMj1kXFmpWKVAbjjTVztmUktxFpYutQQ1SOBqknPB74fcG0FEQ@mail.gmail.com> <CAMuHMdVn6NmSL7ke629oQMnkW4qfu1r3DGNv3pGk8+nSRYZyhQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVn6NmSL7ke629oQMnkW4qfu1r3DGNv3pGk8+nSRYZyhQ@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 7 Jul 2020 10:45:08 +0300
X-Gmail-Original-Message-ID: <CAMj1kXHe96g+4uuUsWTHbKom=EvssnbzZyX9i5La463QKjhLsw@mail.gmail.com>
Message-ID: <CAMj1kXHe96g+4uuUsWTHbKom=EvssnbzZyX9i5La463QKjhLsw@mail.gmail.com>
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

On Tue, 7 Jul 2020 at 10:39, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ard,
>
> On Tue, Jul 7, 2020 at 8:50 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > On Mon, 6 Jul 2020 at 18:02, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
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
> > > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> > > Cc: Lukasz Stelmach <l.stelmach@samsung.com>
> > > ---
> > > Marked as RFC, because:
> > >   1. This is known to break crashkernel support, as the memory used by
> > >      the crashkernel is not marked reserved in DT (yet),
> > >   2. Russell won't apply this for v5.9 anyway,
> > >
> >
> > Would it help if we make this behavior dependent on a simple heuristic, e.g.,
> >
> > if (round_up(load_address, 128M) >= dram_end)
> >   use dram_start from DT
> > else
> >   use round_up(load_address, 128M)
> >
> > That way, the fix is guaranteed to only take effect for systems that
> > cannot even boot otherwise, which fixes the crashkernel case, as well
> > as other potential regressions due to the load address of the core
> > kernel changing for existing boards.
>
> Thanks for your suggestion!
>   1. Shouldn't the calculation use round_down() instead of round_up()?
>   2. Likewise, "round_down(load_address, 128M) < dram_start from DT"?
>

No.

What the code does today is round *up* to a multiple of 128 MB, and
only when that leads to a problem, we should use the DT provided
memory regions.
