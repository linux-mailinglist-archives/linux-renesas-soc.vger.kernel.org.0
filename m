Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAEA548748F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jan 2022 10:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346406AbiAGJO6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jan 2022 04:14:58 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:45649 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346393AbiAGJO6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jan 2022 04:14:58 -0500
Received: by mail-ua1-f53.google.com with SMTP id x33so7709381uad.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Jan 2022 01:14:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kSn+BBnlgrMpWCQvSGGShvTSCaEQidQAfOfH7P7zYoE=;
        b=rCDjfyonhIfZXwZrIgLkAIsKiJi1ojdZajNLa4A9l1zc9kWAt8nKYw17sLbLxSMETP
         apiMVzM+E6P0utWodAVJ7HU/gDNGzwVThvyaEngWDjGPYonotVvCs7xXbS+cwHkTLJ5e
         w8oeXQHk3TL58M7/EfIcM23p3sy+TXWqB32ndY9fh6K0h62322w4N2Ha8h9tjDrXaTsV
         al4drgBUw+Ht0w2J3ZeJ1SaheVMJCBumPVwnb1WLakVbPgV+mLzYXCPmZ2Gigti7xwbP
         tlMfgWVR1FfZ/jnIW+zW4u92NWCXaehq86hTI7fO9BfTF4YY+jmJuTqcqu6zYGZsVFGi
         aBdA==
X-Gm-Message-State: AOAM532VDPzugDuLslfC7HeSwAQvPFFL7CBDNldoDMV0ebKmo5liPhHT
        K/XHn3VQCpi4TTfGeDhqNsj8HOgpvDiKrg==
X-Google-Smtp-Source: ABdhPJygclujXUIafJKZ57P+t4bthhOwSPN7xf0Di0wgpzs8eWdU9LWsqatl4vIMQg5wnfCplvbJsg==
X-Received: by 2002:a05:6130:312:: with SMTP id ay18mr19322346uab.5.1641546897826;
        Fri, 07 Jan 2022 01:14:57 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id m8sm2787733uae.8.2022.01.07.01.14.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jan 2022 01:14:57 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id o1so9093390uap.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Jan 2022 01:14:57 -0800 (PST)
X-Received: by 2002:ab0:7450:: with SMTP id p16mr8594171uaq.14.1641546896918;
 Fri, 07 Jan 2022 01:14:56 -0800 (PST)
MIME-Version: 1.0
References: <20220106192645.3913934-1-ardb@kernel.org>
In-Reply-To: <20220106192645.3913934-1-ardb@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 7 Jan 2022 10:14:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXLSFHiQPQeb5Z1yhi0L_2Pz7x4K_GtEVJTmLSkM8o4Vw@mail.gmail.com>
Message-ID: <CAMuHMdXLSFHiQPQeb5Z1yhi0L_2Pz7x4K_GtEVJTmLSkM8o4Vw@mail.gmail.com>
Subject: Re: [RFT PATCH] ARM: suspend: switch to swapper_pg_dir before using
 the vmap'ed stack
To:     Ard Biesheuvel <ardb@kernel.org>
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

Hi Ard,

On Thu, Jan 6, 2022 at 8:27 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> The resume from suspend code switches to the ID map so it can enable the
> MMU. On !LPAE configurations, the ID map carries its own copy of the
> kernel VA range, but this is not kept in sync with swapper_pg_dir, and
> so it may lack the mapping of the kernel mode stack if CONFIG_VMAP_STACK
> is enabled.
>
> So let's switch to swapper_pg_dir right after re-enabling the MMU on
> such configurations. This avoids a crash on resume observed on various
> platforms [0].
>
> [0] https://lore.kernel.org/linux-arm-kernel/20211122092816.2865873-8-ardb@kernel.org/
>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Thanks for your patch!

This fixes s2ram on r8a7791/koelsch (dual Cortex-A15) with
shmobile_defconfig.
S2ram on sh73a0/kzm9g (dual Cortex-A9) works as before.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
> Please test with the Kconfig patch [9177/1] reverted.
>
>  arch/arm/kernel/sleep.S | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/kernel/sleep.S b/arch/arm/kernel/sleep.S
> index b062b3738bc6..6217ef90feb0 100644
> --- a/arch/arm/kernel/sleep.S
> +++ b/arch/arm/kernel/sleep.S
> @@ -119,6 +119,13 @@ ENTRY(cpu_resume_mmu)
>  ENDPROC(cpu_resume_mmu)
>         .popsection
>  cpu_resume_after_mmu:
> +#if defined(CONFIG_VMAP_STACK) && !defined(CONFIG_ARM_LPAE)
> +       @ Before using the vmap'ed stack, we have to switch to swapper_pg_dir
> +       @ as the ID map does not cover the vmalloc region.
> +       mrc     p15, 0, ip, c2, c0, 1   @ read TTBR1
> +       mcr     p15, 0, ip, c2, c0, 0   @ set TTBR0
> +       isb
> +#endif
>         bl      cpu_init                @ restore the und/abt/irq banked regs
>         mov     r0, #0                  @ return zero on success
>         ldmfd   sp!, {r4 - r11, pc}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
