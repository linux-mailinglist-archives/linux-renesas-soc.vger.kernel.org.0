Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 031A0216791
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2020 09:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgGGHjt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jul 2020 03:39:49 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:43441 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgGGHjt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 03:39:49 -0400
Received: by mail-oo1-f65.google.com with SMTP id t12so1103060ooc.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2020 00:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qwGRpjVwTQk+oF+XqfCX0y8BQ0NOeAyUET0WjkwUcVs=;
        b=X4fA9OoQmCp1oYYxRdcZ/4y0XKkRZ92OTJ7K9vMbP+SUeryV6krcy8Jb7A2SdfsY0M
         1LwKdOI8Kd/l+YQxIxD+LqxLm7ixYNJx7+H24G9IaeA3RXLB9kzufurtFGuGxcWWzhC4
         9lC5oVgVqbCq3SWE7WHSrjjpLC/AAmMOdvhr03u1Xc4fGXZMMLyW5kOkh8iNg9TZH0pA
         Wq5DsWxuWOpc5uaUjGyuySUx6o3HpiZAZDXk6IVY15aa4V3LX39+DgSEOE9wnUGo3804
         rekASeolq/URyCNHamH8TNM1TJBQozQqj0/XaZ88U8P5C09kIlSuacZVJmf/LHehaU1W
         NLAQ==
X-Gm-Message-State: AOAM531HUfjACnMMDgsWzy8iaNLlrvCqfFmd/3jmHScpzKKT5Uxz0dH5
        6roeVhDq7K1JhITIPlciwfWRzqI9T5CPgg9iy+iF69FE8Qg=
X-Google-Smtp-Source: ABdhPJzCLSviUIVuzaxTQadfV3ziV7Mm89/aw4bdESWhoqsQu6U8GE/jSZp3WkmHpITeRAs9BwhEqk3g89DQff2lFw0=
X-Received: by 2002:a4a:5209:: with SMTP id d9mr28531616oob.40.1594107588295;
 Tue, 07 Jul 2020 00:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200706150205.22053-1-geert+renesas@glider.be> <CAMj1kXFmpWKVAbjjTVztmUktxFpYutQQ1SOBqknPB74fcG0FEQ@mail.gmail.com>
In-Reply-To: <CAMj1kXFmpWKVAbjjTVztmUktxFpYutQQ1SOBqknPB74fcG0FEQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jul 2020 09:39:37 +0200
Message-ID: <CAMuHMdVn6NmSL7ke629oQMnkW4qfu1r3DGNv3pGk8+nSRYZyhQ@mail.gmail.com>
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

On Tue, Jul 7, 2020 at 8:50 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> On Mon, 6 Jul 2020 at 18:02, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
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
> > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> > Cc: Lukasz Stelmach <l.stelmach@samsung.com>
> > ---
> > Marked as RFC, because:
> >   1. This is known to break crashkernel support, as the memory used by
> >      the crashkernel is not marked reserved in DT (yet),
> >   2. Russell won't apply this for v5.9 anyway,
> >
>
> Would it help if we make this behavior dependent on a simple heuristic, e.g.,
>
> if (round_up(load_address, 128M) >= dram_end)
>   use dram_start from DT
> else
>   use round_up(load_address, 128M)
>
> That way, the fix is guaranteed to only take effect for systems that
> cannot even boot otherwise, which fixes the crashkernel case, as well
> as other potential regressions due to the load address of the core
> kernel changing for existing boards.

Thanks for your suggestion!
  1. Shouldn't the calculation use round_down() instead of round_up()?
  2. Likewise, "round_down(load_address, 128M) < dram_start from DT"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
