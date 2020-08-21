Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4DF24D730
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Aug 2020 16:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgHUOTs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Aug 2020 10:19:48 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:45095 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgHUOTq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Aug 2020 10:19:46 -0400
Received: by mail-oo1-f67.google.com with SMTP id u28so371047ooe.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2020 07:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yveK7Sh2p0vvKh9DvKRz3gP6OP29WrawZxynBUepTIU=;
        b=sYB1YL/BqGNoKmAmA0sUHfJPLKFKNafEstdtSUeS4U+xBr9zRVE1mtAEe+GOI3FEmS
         1Y0RsiBtp0D1lc/qAq1i/Li4lVQTUPirUIOOavd11QKeYGOCZTlidnghAjFBIYOHjx1m
         JW03LEUfZzWBksqvCGtHOs64vwCzl/ppTmib8O/KgABeMqbOIIpCzb9M9IGrnH+5Cddu
         F4Z+bCOslQnbIFGtgjGcJpv9jxJ0JQGlJ+LOxpBvveMerLYFwFoFVm2b2HUG+dfKBEsJ
         xwtRfOrnW90+Lai6dZtNsZj/l9VV9G6NvI5ewbLKq3KhzcTaTER4rGSo2kHwxWuVfsh+
         52bw==
X-Gm-Message-State: AOAM532MDLPyIRsltmOgbRYQqyJ9b4OLZRVhP8/P6YNVSKC6KDXuhstB
        QWeufqcC4quwDEiWsHn2XPFzEGcE8/U/s2NoK5k=
X-Google-Smtp-Source: ABdhPJxHqYly4MWj5BZNLBVg3tSy5ObVyZuVwBzICOKwoexmiNq4aTdvPNRd6IFQkna5YnX1jtDmRDNoNvcYodaWCr0=
X-Received: by 2002:a4a:6c13:: with SMTP id q19mr2288149ooc.11.1598019585356;
 Fri, 21 Aug 2020 07:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <87lfidho8o.wl-kuninori.morimoto.gx@renesas.com> <87imdhho6o.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87imdhho6o.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Aug 2020 16:19:34 +0200
Message-ID: <CAMuHMdWMSNyPuh2F-DToMU4vagzckvp7PZ03UU1=Fo2dCq65VQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] soc: renesas: align driver description title
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Mon, Aug 17, 2020 at 6:51 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Now, Renesas SoC drivers are under menu,
> but current description are not aligned.
> This patch align these.
>
>         - R-Car H2 System Controller support                                                                    │ │
>         - R-Car M2-W/N System Controller support                                                                │ │
>         - R-Car V2H System Controller support                                                                   │ │
>         - R-Car E2 System Controller support                                                                    │ │
>         - R-Car H3 System Controller support                                                                    │ │
>         - R-Car M3-W System Controller support                                                                  │ │
>         - R-Car M3-W+ System Controller support                                                                 │ │
>         - R-Car M3-N System Controller support                                                                  │ │
>
>         + System Controller support for R-Car H2                                                                │ │
>         + System Controller support for R-Car M2-W/N                                                            │ │
>         + System Controller support for R-Car V2H                                                               │ │
>         + System Controller support for R-Car E2                                                                │ │
>         + System Controller support for R-Car H3                                                                │ │
>         + System Controller support for R-Car M3-W                                                              │ │
>         + System Controller support for R-Car M3-W+                                                             │ │
>         + System Controller support for R-Car M3-N                                                              │ │
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -276,97 +276,97 @@ endif # ARM64
>
>  # SoC
>  config SYSC_R8A7742
> -       bool "RZ/G1H System Controller support" if COMPILE_TEST
> +       bool "System Controller support for RZ/G1H" if COMPILE_TEST
>         select SYSC_RCAR

[...]

>  config SYSC_R8A77995
> -       bool "R-Car D3 System Controller support" if COMPILE_TEST
> +       bool "System Controller support for R-Car D3" if COMPILE_TEST
>         select SYSC_RCAR
>
>  # Family
>  config RST_RCAR
> -       bool "R-Car Reset Controller support" if COMPILE_TEST
> +       bool "Reset  Controller support for R-Car" if COMPILE_TEST

This one looks a bit strange, in between SoC-specific and family-specific
System Controller support.

It could be moved up (breaking the separation between SoC-specific
and family-specific options), or down (breaking alphabetical sort order).
Any other options?

>
>  config SYSC_RCAR
> -       bool "R-Car System Controller support" if COMPILE_TEST
> +       bool "System Controller support for R-Car" if COMPILE_TEST
>
>  config SYSC_RMOBILE
> -       bool "R-Mobile System Controller support" if COMPILE_TEST
> +       bool "System Controller support for R-Mobile" if COMPILE_TEST
>
>  endif # SOC_RENESAS

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
