Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E95C487523
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jan 2022 11:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237074AbiAGKBO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jan 2022 05:01:14 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:42840 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236928AbiAGKBO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jan 2022 05:01:14 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id AE6BDCE29D5
        for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Jan 2022 10:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE360C36AF5
        for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Jan 2022 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641549670;
        bh=Wa8+E1wbE9vYXue/0+MJo3OTe0bL3vxO5mUUVE4A2SI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=q0eX0n8zFoEiU+CAMOVB5TjeNicmY++Fu8DnEIC26BeBPfllLyZGT+U9fb21nTVBl
         WQUkXJMwX365flpQOnGR3LbvQLNTEmAZukIsl22sm3WlWYwj9/Y5LGkv2w0BlPfSdd
         OFzrtuXD6jmSnLDERCBVSwVBRcjE4oYwT8xbXmJqTPCTOvbR9b9rDJLxGT7KKJHNPN
         ETMC3c8wk9bPXayFHe/olTXwBbxUT7GchZpRCeRgSec8+6q0bgUSWn1hhVbv6x//SV
         7IeK/uPniSme3CXZEb3dygAtShaeHEm51U3lyTnPGuBKkrvup2lRDKxYxXEoebdu02
         F+la/OypMTx3g==
Received: by mail-wr1-f53.google.com with SMTP id a5so6089721wrh.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Jan 2022 02:01:10 -0800 (PST)
X-Gm-Message-State: AOAM532kD1pfDXCHhQImeZUTLbd5apzCdYHMjXj1N6AnMmCmaTORRLvW
        aVH/hDRZnHpS+BM29a66fl8Bq2PwQCsIdElVH9o=
X-Google-Smtp-Source: ABdhPJwjm3aN3Pn1UExZLbs8F1/HqXnMNVf8AW3LGiZtogWMQICyOu6jF3eB+L21MM2Hk8CT+Wvco4pbc57Dub/gwC8=
X-Received: by 2002:a5d:498b:: with SMTP id r11mr1966789wrq.189.1641549669089;
 Fri, 07 Jan 2022 02:01:09 -0800 (PST)
MIME-Version: 1.0
References: <20220106192645.3913934-1-ardb@kernel.org> <CAMuHMdXLSFHiQPQeb5Z1yhi0L_2Pz7x4K_GtEVJTmLSkM8o4Vw@mail.gmail.com>
In-Reply-To: <CAMuHMdXLSFHiQPQeb5Z1yhi0L_2Pz7x4K_GtEVJTmLSkM8o4Vw@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Fri, 7 Jan 2022 11:00:57 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEO_4cXpvi6xa17d1qN8EBqg2MC5c7GwJetgWEjGxpx7Q@mail.gmail.com>
Message-ID: <CAMj1kXEO_4cXpvi6xa17d1qN8EBqg2MC5c7GwJetgWEjGxpx7Q@mail.gmail.com>
Subject: Re: [RFT PATCH] ARM: suspend: switch to swapper_pg_dir before using
 the vmap'ed stack
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 7 Jan 2022 at 10:15, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ard,
>
> On Thu, Jan 6, 2022 at 8:27 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > The resume from suspend code switches to the ID map so it can enable the
> > MMU. On !LPAE configurations, the ID map carries its own copy of the
> > kernel VA range, but this is not kept in sync with swapper_pg_dir, and
> > so it may lack the mapping of the kernel mode stack if CONFIG_VMAP_STACK
> > is enabled.
> >
> > So let's switch to swapper_pg_dir right after re-enabling the MMU on
> > such configurations. This avoids a crash on resume observed on various
> > platforms [0].
> >
> > [0] https://lore.kernel.org/linux-arm-kernel/20211122092816.2865873-8-ardb@kernel.org/
> >
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Jon Hunter <jonathanh@nvidia.com>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> Thanks for your patch!
>
> This fixes s2ram on r8a7791/koelsch (dual Cortex-A15) with
> shmobile_defconfig.
> S2ram on sh73a0/kzm9g (dual Cortex-A9) works as before.
>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>

Thanks Geert.

> > ---
> > Please test with the Kconfig patch [9177/1] reverted.
> >
> >  arch/arm/kernel/sleep.S | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm/kernel/sleep.S b/arch/arm/kernel/sleep.S
> > index b062b3738bc6..6217ef90feb0 100644
> > --- a/arch/arm/kernel/sleep.S
> > +++ b/arch/arm/kernel/sleep.S
> > @@ -119,6 +119,13 @@ ENTRY(cpu_resume_mmu)
> >  ENDPROC(cpu_resume_mmu)
> >         .popsection
> >  cpu_resume_after_mmu:
> > +#if defined(CONFIG_VMAP_STACK) && !defined(CONFIG_ARM_LPAE)
> > +       @ Before using the vmap'ed stack, we have to switch to swapper_pg_dir
> > +       @ as the ID map does not cover the vmalloc region.
> > +       mrc     p15, 0, ip, c2, c0, 1   @ read TTBR1
> > +       mcr     p15, 0, ip, c2, c0, 0   @ set TTBR0
> > +       isb
> > +#endif
> >         bl      cpu_init                @ restore the und/abt/irq banked regs
> >         mov     r0, #0                  @ return zero on success
> >         ldmfd   sp!, {r4 - r11, pc}
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
