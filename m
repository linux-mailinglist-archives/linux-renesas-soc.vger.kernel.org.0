Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68B3114A5BA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2020 15:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgA0OIu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Jan 2020 09:08:50 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45273 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbgA0OIu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Jan 2020 09:08:50 -0500
Received: by mail-oi1-f195.google.com with SMTP id l7so6702003oil.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2020 06:08:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5tsmFts7T7BI9vGyWUX2iu19lpSC8/BqHOFJ4HpyIlg=;
        b=Nn5o6kDQA0WjVgMvAMP9fGmJubfv/TbnngJj51q7cCgXQIFJPmtF+/fHpls3T4UuzA
         fiuLFFh5Nvx8AtNJpxp53udXCYV8Iw9AlTRQn8juJPswzWGu/80b21n+FC245VS5pmto
         KLPjV1RnczZSREN3uBNJcGHaBpyfzd9BobcNCRY9qp9TzM7ZGuYh4ayyHfDfu0E8rOTi
         CwSmxwY+1OKN1bqhNIVh4eE0BGWhFEhlEx3SSwEkkILviG7Xu75m7fFz5qhAsCKtELVB
         nXD4/srAsoPqMnrBGicoB0wtdBmP5aZtdx1RWOcPUM31wC51bK7X4iRegojAEWaplQaL
         OLDA==
X-Gm-Message-State: APjAAAUHPmevHFaN/BQP51Pqq1GxxrHgBdxy3+OBEvOLLMqHWei7ETYL
        5U/34vcmjXhad5tFfofyR21XVAR2RGZlSXNqxAU=
X-Google-Smtp-Source: APXvYqyXcgXQJlvo6qqMaF08C0viKon2y0punbKg7jdZBGvbXL+AC2XFGIoByoZpNLHINnJMWkPEqX8udLowyjc/EjE=
X-Received: by 2002:aca:5905:: with SMTP id n5mr7649001oib.54.1580134129342;
 Mon, 27 Jan 2020 06:08:49 -0800 (PST)
MIME-Version: 1.0
References: <20200121192741.20597-1-geert+renesas@glider.be> <nycvar.YSQ.7.76.2001211437240.1655@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.76.2001211437240.1655@knanqh.ubzr>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Jan 2020 15:08:37 +0100
Message-ID: <CAMuHMdVrCyjTgJoef4HE0COEKRNYTNKXkmtRVizv6gLi2rfL8w@mail.gmail.com>
Subject: Re: [PATCH] ARM: boot: Obtain start of physical memory from DTB
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Nicolas,

On Tue, Jan 21, 2020 at 11:44 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> On Tue, 21 Jan 2020, Geert Uytterhoeven wrote:
> > Currently, the start address of physical memory is obtained by masking
> > the program counter with a fixed mask of 0xf8000000.  This mask value
> > was chosen as a balance between the requirements of different platforms.
> > However, this does require that the start address of physical memory is
> > a multiple of 128 MiB, precluding booting Linux on platforms where this
> > requirement is not fulfilled.
> >
> > Fix this limitation by obtaining the start address from the passed DTB
> > instead, if available.  Note that for now this is limited to DTBs passed
> > explicitly by the boot loader.  DTBs appended to a zImage or uImage are
> > not inspected.  Fall back to the traditional method when needed.
> >
> > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> > i.e. not at a multiple of 128 MiB.
> >
> > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Against arm/for-next.
> >
> > Tested with the following configurations:
> >   - zImage + DTB (r8a7791/koelsch): physical memory start address
> >     obtained from DT,
> >   - uImage + DTB (r8a73a4/ape6evm, r7s72100/rskrza1, r7s9210/rza2mevb):
> >     physical memory start address obtained from DT,
> >   - zImage with appended DTB (r8a7740/armadillo, sh73a0/kzm9g): physical
> >     memory start address obtained by masking, as before.
> >
> > An appended DTB is currently processed after the start of physical
> > memory is obtained.  Hence obtaining that address from an appended DTB
> > requires moving/copying that copy.  Given the complexity w.r.t. the
> > "restart" label, and the lack of a need for me to support this, I didn't
> > implement that part.
>
> Well, not exactly. You don't have to move anything. But more on that
> later.
>
> One important detail: you didn't set up the stack pointer. That means
> you're relying on whatever value left in sp by the bootloader. If you're
> lucky that might be fine, but it isn't a good idea to leave things to
> luck.
>
> Before calling the C code, you should probably do:
>
>         adr     r0, LC0
>         ldr     r1, [r0]
>         ldr     sp, [r0, #28]
>         sub     r0, r0, r1
>         add     sp, sp, r0
>
> But if there is an appended dtb then you'll overwrite it. So you need
> to look for one and account for its size.

Thank you very much for the very constructive feedback!

> Something like this:
>
>         adr     r0, LC0
>         ldr     r1, [r0]                @ get absolute LC0
>         ldr     sp, [r0, #28]           @ get stack location
>         sub     r1, r0, r1              @ compute relocation offset
>         add     sp, sp, r1              @ apply relocation
>
> #ifdef CONFIG_ARM_APPENDED_DTB
>         /*
>          * Look for an appended DTB. If found, use it and
>          * move stack away from it.
>          */
>         ldr     r6, [r0, #12]           @ get &_end

[r0, #12] is actually &_edata, not &_end.

>         add     r6, r6, r1              @ relocate it
>         ldmia   r6, {r0, r5}            @ get DTB signature and size
> #ifndef __ARMEB__
>         ldr     r1, =0xedfe0dd0         @ sig is 0xd00dfeed big endian
>         /* convert DTB size to little endian */
>         eor     r2, r5, r5, ror #16
>         bic     r2, r2, #0x00ff0000
>         mov     r5, r5, ror #8
>         eor     r5, r5, r2, lsr #8
> #else
>         ldr     r1, =0xd00dfeed
> #endif
>         cmp     r0, r1                  @ do we have a DTB there?
>         moveq   r8, r0                  @ use it if so

moveq r8, r6

>         addeq   sp, sp, r5              @ and move stack above it

Care must be taken to keep sp 64-bit aligned.

> #endif
>
>         bl      fdt_get_mem_start
>         ...
>
> This is a little involved but there is no way around that for a safe
> stack. Benefit is that you get appended DTB support with a single
> additional instruction.

True.

> Also one minor nit:
>
> > +             bl      fdt_get_mem_start
> > +             mov     r4, r0
> > +             cmn     r0, #1
>
> Please just use "cmp r0 #-1" here. The assembler will convert it for
> you.

OK, thanks.

Sent v2...

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
