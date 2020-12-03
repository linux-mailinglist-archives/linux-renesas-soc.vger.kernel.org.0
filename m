Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00AB2CD5F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Dec 2020 13:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730491AbgLCMun (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Dec 2020 07:50:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:52630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730434AbgLCMun (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 07:50:43 -0500
X-Gm-Message-State: AOAM533Dtr02rDlSh5OKX4axx36ME3DUtLosKIheyUoNXClKjeTJtdjR
        8A4GP8U5ArTY17NYj/zVdOOQYnF8sw0h/lzxVvY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1606999802;
        bh=5MjvXoBCvX+CIlTanN0Tk1XSyBNXQoHNfaH+mI7A6vU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=geLkymAQFoBMKID+/f2xhuEUCs0OFsYCk6iTR8W8uIzMLSUGITvDqN42VJxWXqLWu
         Wl8IYmjvdYED66t7sG1kZ/GiKU2JPEUGOm7JQl7KpO6ooCgjWy4RnsIX43Q5xDpFsc
         A+aSAL1CnF8cCdOL71Cifd42+fzLUIB5ltosmmhZkZ/B6H7SAzg+hzXfCPg6wA48XN
         doV0qlrQ2jcjdDVqxMQK7BB+IBOu+Ex5yBo+xxgo1/9F+HQ0aJKAiNMpzTUTWmk/uQ
         ylwMaYQM/bttHIl5JB6iLWZgXsxtA9+xSV761tvv8pE7XQ4/fpW1ylI2bsSh34AAZk
         kM0GE0WLhlU2Q==
X-Google-Smtp-Source: ABdhPJyQWbwgmTA7NHAwK/kzwHFWlwPZ30WdMrgZrq7K0773ZVkCg8CFOxprXX72+rwfryD9UttHF8qmkOELB8F9rRA=
X-Received: by 2002:a05:6830:214c:: with SMTP id r12mr1905187otd.90.1606999801170;
 Thu, 03 Dec 2020 04:50:01 -0800 (PST)
MIME-Version: 1.0
References: <20201203121916.2870975-1-geert+renesas@glider.be> <20201203121916.2870975-2-geert+renesas@glider.be>
In-Reply-To: <20201203121916.2870975-2-geert+renesas@glider.be>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 3 Dec 2020 13:49:49 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEKdRGQXFh9qMgrWcZnoW5s8Bj5TaKqStU=w1qJ-Nu9zA@mail.gmail.com>
Message-ID: <CAMj1kXEKdRGQXFh9qMgrWcZnoW5s8Bj5TaKqStU=w1qJ-Nu9zA@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] ARM: uncompress: Add be32tocpu macro
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

Hallo Geert,

On Thu, 3 Dec 2020 at 13:19, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> DTB stores all values as 32-bit big-endian integers.
> Add a macro to convert such values to native CPU endianness, to reduce
> duplication.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v10:
>   - New.
> ---
>  arch/arm/boot/compressed/head.S | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
> index 835ce64f1674c9a2..aabdc544c03aafdc 100644
> --- a/arch/arm/boot/compressed/head.S
> +++ b/arch/arm/boot/compressed/head.S
> @@ -165,6 +165,16 @@
>                 orr     \res, \res, \tmp1, lsl #24
>                 .endm
>
> +               .macro  be32tocpu, val, tmp
> +#ifndef __ARMEB__
> +               /* convert to little endian */
> +               eor     \tmp, \val, \val, ror #16
> +               bic     \tmp, \tmp, #0x00ff0000
> +               mov     \val, \val, ror #8
> +               eor     \val, \val, \tmp, lsr #8
> +#endif
> +               .endm
> +

Thanks for cleaning this up.

This patch is fine as is.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

However, I would like to note that, since we are touching this code,
we might do it properly. (Given the v10, feel free to ignore or defer
to a later time)

- put this into asm/assembler.h so other .S files can use it
- use rev instructions when supported
- factor out the difference between xx_to cpu and bswap

I.e.,

.macro bswap32, val, tmp
.if  __LINUX_ARM_ARCH__ >= 6
rev \val, \val
.else
eor     \tmp, \val, \val, ror #16
bic     \tmp, \tmp, #0x00ff0000
mov     \val, \val, ror #8
eor     \val, \val, \tmp, lsr #8
.endif
.endm

.macro  be32tocpu, val, tmp
#ifndef __ARMEB__
bswap32 \val, \tmp
#endif
.endm

.macro  le32tocpu, val, tmp
#ifdef __ARMEB__
bswap32 \val, \tmp
#endif
.endm

This would allow us to reuse this macro in
arch/arm/crypto/aes-cipher-core.S, and replace the __rev macro it
defines.


>                 .section ".start", "ax"
>  /*
>   * sort out different calling conventions
> @@ -345,13 +355,7 @@ restart:   adr     r0, LC1
>
>                 /* Get the initial DTB size */
>                 ldr     r5, [r6, #4]
> -#ifndef __ARMEB__
> -               /* convert to little endian */
> -               eor     r1, r5, r5, ror #16
> -               bic     r1, r1, #0x00ff0000
> -               mov     r5, r5, ror #8
> -               eor     r5, r5, r1, lsr #8
> -#endif
> +               be32tocpu r5, r1
>                 dbgadtb r6, r5
>                 /* 50% DTB growth should be good enough */
>                 add     r5, r5, r5, lsr #1
> @@ -403,13 +407,7 @@ restart:   adr     r0, LC1
>
>                 /* Get the current DTB size */
>                 ldr     r5, [r6, #4]
> -#ifndef __ARMEB__
> -               /* convert r5 (dtb size) to little endian */
> -               eor     r1, r5, r5, ror #16
> -               bic     r1, r1, #0x00ff0000
> -               mov     r5, r5, ror #8
> -               eor     r5, r5, r1, lsr #8
> -#endif
> +               be32tocpu r5, r1
>
>                 /* preserve 64-bit alignment */
>                 add     r5, r5, #7
> --
> 2.25.1
>
