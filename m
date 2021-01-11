Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98DD02F1ACD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Jan 2021 17:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730537AbhAKQUR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Jan 2021 11:20:17 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:43286 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728344AbhAKQUQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jan 2021 11:20:16 -0500
Received: by mail-oi1-f173.google.com with SMTP id q25so20636655oij.10;
        Mon, 11 Jan 2021 08:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BFRalSTc2wBo0cjIlCJKWiZkEC3SzoZK2JeTxyOUuJs=;
        b=AaCAjCQEwMuKCqiUtsegOlEkQZuXJ6w7r+s+Y4g3RI++7z1ki0r62nR/xLwnFn0VL9
         Zlw+pqiPCAn2fkwDLPN3sbqND1QdLQ84iCmmCPC1LK6G5tuzZ/FXcbY7EVpb3fRkvUPG
         5MDc+bH4OXzDxuqQEXCT5SWhhHTaLUVCzX/eesa+4cK1ECI7vGhKH5FxOq2AeyPg+Wzj
         k7p5FksoQF0ZTvI7GqF6iLFzHS5hnfgVF1sbG/Ts200ks6ZWWE8dfYJx9slBJYnH3TzJ
         MSG5fXRx2XG0zccDrO/lgeKkyhtmtWBesjydfgy0JsP/vSc9rvhB5BA38wooEp058Sb/
         RnYA==
X-Gm-Message-State: AOAM530VdKHEYg7mxCNzzUWPu3vmsAH8whf5lvq4xxxEUQ75KtR+WIbY
        zsARaZ3RmEFfR2HpsVm1oJhFpIP1aG32h69fmjs=
X-Google-Smtp-Source: ABdhPJyQ9MgCNkZG99CLyMwk8G+4+Wi5pRSaAwZiC4QYOnEzSbRnRNcvip5iNWPwzUX4n68zw8j7mHtn/tg8YSqDprs=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr92589oia.148.1610381975695;
 Mon, 11 Jan 2021 08:19:35 -0800 (PST)
MIME-Version: 1.0
References: <20210104130111.1269694-1-geert+renesas@glider.be> <CACRpkdZyV-tye0b6Pxf6s_SSEy1sq=Hqr_xXUopJrCkXsu9m9g@mail.gmail.com>
In-Reply-To: <CACRpkdZyV-tye0b6Pxf6s_SSEy1sq=Hqr_xXUopJrCkXsu9m9g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Jan 2021 17:19:24 +0100
Message-ID: <CAMuHMdVK+iYu-mEPfcNK0OwpFMs8re2uC7YAYzt5_CYvo_8BQg@mail.gmail.com>
Subject: Re: [PATCH v12] ARM: uncompress: Validate start of physical memory
 against passed DTB
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Grant Likely <grant.likely@linaro.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Linus,

CC Rob, Grant, Michael, Heinrich, DT

On Sat, Jan 9, 2021 at 12:57 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Jan 4, 2021 at 2:01 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Currently, the start address of physical memory is obtained by masking
> > the program counter with a fixed mask of 0xf8000000.  This mask value
> > was chosen as a balance between the requirements of different platforms.
> > However, this does require that the start address of physical memory is
> > a multiple of 128 MiB, precluding booting Linux on platforms where this
> > requirement is not fulfilled.
> >
> > Fix this limitation by validating the masked address against the memory
> > information in the passed DTB.  Only use the start address
> > from DTB when masking would yield an out-of-range address, prefer the
> > traditional method in all other cases.  Note that this applies only to the
> > explicitly passed DTB on modern systems, and not to a DTB appended to
> > the kernel, or to ATAGS.  The appended DTB may need to be augmented by
> > information from ATAGS, which may need to rely on knowledge of the start
> > address of physical memory itself.
> >
> > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> > i.e. not at a multiple of 128 MiB.
> >
> > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > Acked-by: Nicolas Pitre <nico@fluxnic.net>
>
> Sorry for the long delay in reading the patch :(
>
> I really like the looks of this now, moreover it is very useful.
> I suppose it is already in the patch tracker, but for the record:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks a lot!

> > +               reg = fdt_getprop(fdt, offset, "linux,usable-memory", &len);
>
> I suppose we already had a discussion of why this property
> is undocumented? Or should we document it? Obviously
> it is already in widespread use.

This comes from commit 51975db0b7333cf3 ("of/flattree: merge
early_init_dt_scan_memory() common code"), which combined existing
practises on Microblaze (commit 12e8414263f47352 ("microblaze_v8: Open
firmware files")) and PowerPC (ba7594852f4e7121 ("[PATCH] powerpc: Add
support for "linux,usable-memory" on memory nodes")), with the former
obviously just copying the latter.
Unfortunately none of this is documented in The DeviceTree
Specification, ePAPR, or P1275.

Heinrich tried to document it, but his patch was ignored:
[PATCH] Documentation: devicetree: "linux,usable-memory" property
https://lore.kernel.org/linux-devicetree/20161223161747.9986-1-xypron.glpk@gmx.de/
https://lkml.org/lkml/2016/12/23/175
https://lore.kernel.org/patchwork/patch/745784/
Note that Heinrichs address is mangled in lore (imported from gmane?,
but lkml and patchwork have it right.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
