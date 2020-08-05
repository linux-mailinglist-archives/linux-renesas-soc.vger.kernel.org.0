Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 771CA23D0DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Aug 2020 21:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbgHETxv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 15:53:51 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36736 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728122AbgHEQtd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 12:49:33 -0400
Received: by mail-oi1-f193.google.com with SMTP id l204so11423619oib.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Aug 2020 09:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6uljOmFBDcXjht755lAopTNR9CCmJpe3vlR5toHcn9A=;
        b=fJu4N4r6eRMtMz93eObZR6WQCw2qXevvKSSMqe4qjrkHUjtEELXj+fNG6iyMHi2UXR
         +83DlfXYuORAJQivaJwl5syvNIj5GRE/dtwlkxjKZ9TYsGJ42pU3S66jmgHn6uKkxlKb
         vDFMqmFEVWwFwpxdmuCR8WkdwOwz79IGqdFT0UuKPxgofcZ8yUZ3tOaIDrHn/Z1NDx9c
         WcwUOxZEaUEktu6tNFemgR9TgU0EQWsfq3eCLs9YfTF3Nq4nFfRFcdiOYLzqeT203vG2
         YMgpd3F2XXSDPoW2giru1BxtJva7gBP2+cbq+8fwasoJEswfCUsAxtBszurF1oq7a7dP
         Qgiw==
X-Gm-Message-State: AOAM5337+9AxYYXV4UVecpe4ajrJdkH9E/fDvISew5GsHwAx3hzXGlVX
        7jkD5Xlcbji29eJNiNPrBDkMUiOOrDLeeRbLXPxEzbaB
X-Google-Smtp-Source: ABdhPJzhNt/EXHThIadzIZ3hdM26FpACi7FQ+axpuz8IJU1ybZ81wLDKzytOtqpuVV1kXi3+E5aj94Ti1vOq21a7V8U=
X-Received: by 2002:aca:adc4:: with SMTP id w187mr2400852oie.153.1596630853536;
 Wed, 05 Aug 2020 05:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <87sgd3gcv4.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sgd3gcv4.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 14:34:02 +0200
Message-ID: <CAMuHMdUB=--G6PGYrKtkDUZweDeJuOGJhUErPkNB4+dVixsAyQ@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: use menu for Renesas SoC
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Aug 4, 2020 at 8:12 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Renesas related SoC settings are located on TOP level menu
> when menuconfig, thus it is very verbose.
> This patch groups Renesas related settings into
> "Renesas SoC driver support" menu.
>
> And it aligns config menu names.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!
Unfortunately it doesn't apply against renesas-devel, as new SoCs have
been added.

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -config SOC_RENESAS
> +menuconfig SOC_RENESAS

Yes, that helps.

>         bool "Renesas SoC driver support" if COMPILE_TEST && !ARCH_RENESAS
>         default y if ARCH_RENESAS
>         select SOC_BUS
> @@ -174,35 +174,35 @@ endif # ARM
>  if ARM64
>
>  config ARCH_R8A774A1
> -       bool "Renesas RZ/G2M SoC Platform"
> +       bool "SoC Platform support for RZ/G2M"
>         select ARCH_RCAR_GEN3
>         select SYSC_R8A774A1
>         help
>           This enables support for the Renesas RZ/G2M SoC.
>
>  config ARCH_R8A774B1
> -       bool "Renesas RZ/G2N SoC Platform"
> +       bool "SoC Platform support for RZ/G2N"

[...]

Why these changes?

> @@ -262,79 +262,79 @@ endif # ARM64
>
>  # SoC
>  config SYSC_R8A7743
> -       bool "RZ/G1M System Controller support" if COMPILE_TEST
> +       bool "System Controller support for RZ/G1M" if COMPILE_TEST
>         select SYSC_RCAR
>
>  config SYSC_R8A7745
> -       bool "RZ/G1E System Controller support" if COMPILE_TEST
> +       bool "System Controller support for RZ/G1E" if COMPILE_TEST

[...]

Why these changes?

BTW, if you want to increase consistency, please also update the
descriptions for arm32 and family-specific options.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
