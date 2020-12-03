Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C20912CD607
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Dec 2020 13:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389114AbgLCMvD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Dec 2020 07:51:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:52898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389097AbgLCMvB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 07:51:01 -0500
X-Gm-Message-State: AOAM531Y41a1SDwTGwQ0J/XFwie12hZVEW8UkJFzt/TW5M8oTtWlLAoO
        fzyrOJlFwog4v5vcs4Ltdqca0mtOHYYcfNgQBnU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1606999820;
        bh=vzl05i7nSGf1kne8kmAzzMVoofwdQKpDIeU8H+Oz5wM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hIruvSBbNhIXCctS/qHJ5SbBqa7zZm7SHZ0Dx1cUCVLVq64wixXp0xqH16DWzBktm
         fEzRUycRBp0r6RusMyyriQQdZLwj7WlYXuMGuZwAT5FJgb/wLt+Eu3fK02wXA1rRhf
         Hgq6n9ELmV/4M4noXU4fj65JQHNdY7Rv/Hz/hyf0rYV2acSAUheKKsB6nh0jDlV65V
         2EcP2XkHQyWrhXLwH3A89yxbDUq2bwz0iQl00wvT3se3FPVRrAqlpGQomZKCLGAQNx
         Ga/j8DWgRIl6DIgHaOzmJ1XM3BZxG9xOwxgcaPi0OvXro3Fqz3HH/VYJ4BUW1lE7R9
         6di/59PpP2ahQ==
X-Google-Smtp-Source: ABdhPJwCVCGuvTrj9Bwk32WG/2YHesLb7zugZFBRceF4d/5Gt/R0tpRuPdXss6gjIUkuvNl6bPm0gGmg7sUKY1gEk84=
X-Received: by 2002:aca:5ec2:: with SMTP id s185mr1667470oib.33.1606999819105;
 Thu, 03 Dec 2020 04:50:19 -0800 (PST)
MIME-Version: 1.0
References: <20201203121916.2870975-1-geert+renesas@glider.be> <20201203121916.2870975-3-geert+renesas@glider.be>
In-Reply-To: <20201203121916.2870975-3-geert+renesas@glider.be>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 3 Dec 2020 13:50:08 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGy=ZLRg_+d-amY2FNj7hrZOM2umHcCiFYY5_eZsG95AQ@mail.gmail.com>
Message-ID: <CAMj1kXGy=ZLRg_+d-amY2FNj7hrZOM2umHcCiFYY5_eZsG95AQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] ARM: uncompress: Add OF_DT_MAGIC macro
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 3 Dec 2020 at 13:19, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> The DTB magic marker is stored as a 32-bit big-endian value, and thus
> depends on the CPU's endianness.  Add a macro to define this value in
> native endianness, to reduce #ifdef clutter and (future) duplication.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

> ---
> v10:
>   - New.
> ---
>  arch/arm/boot/compressed/head.S | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
> index aabdc544c03aafdc..d9cce7238a365081 100644
> --- a/arch/arm/boot/compressed/head.S
> +++ b/arch/arm/boot/compressed/head.S
> @@ -11,6 +11,12 @@
>
>  #include "efi-header.S"
>
> +#ifdef __ARMEB__
> +#define OF_DT_MAGIC 0xd00dfeed
> +#else
> +#define OF_DT_MAGIC 0xedfe0dd0
> +#endif
> +
>   AR_CLASS(     .arch   armv7-a )
>   M_CLASS(      .arch   armv7-m )
>
> @@ -335,11 +341,7 @@ restart:   adr     r0, LC1
>   */
>
>                 ldr     lr, [r6, #0]
> -#ifndef __ARMEB__
> -               ldr     r1, =0xedfe0dd0         @ sig is 0xd00dfeed big endian
> -#else
> -               ldr     r1, =0xd00dfeed
> -#endif
> +               ldr     r1, =OF_DT_MAGIC
>                 cmp     lr, r1
>                 bne     dtb_check_done          @ not found
>
> --
> 2.25.1
>
