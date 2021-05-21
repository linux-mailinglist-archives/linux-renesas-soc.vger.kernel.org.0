Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2C8B38C7E1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 15:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235115AbhEUN0x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 09:26:53 -0400
Received: from mail-ua1-f44.google.com ([209.85.222.44]:39680 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235065AbhEUN0t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 09:26:49 -0400
Received: by mail-ua1-f44.google.com with SMTP id f20so2645685uax.6;
        Fri, 21 May 2021 06:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qRbyj4hnpbc3k4A+KkiBSK4Wsj0BDOQJgU/wtF8JLXs=;
        b=ZMJDUr9wrzvQ01Ap2KydoU1IRPUxTJJfxNuWvEAClHKvAbxQ+YdGEg32F4Iu8vCCgD
         KVVRICXM/PCRmnFb+A1YueR8y2Nxf3ZV3qodbMiYIQqGJ1V5KD3hgilSGtJq0L0IAP0u
         wR+H2sAKy43fTjQyUNc8lje9AolJFroHevCP278WMdHWEv2JJyFEKGlFeIP2hrOniDWp
         SjZMYBsF367rtoPZyE/ytCQKVSFfg2gnteC1xkbNrFoHojU7yItK42OawFlZAET9mb8q
         IsF+3QTFeka9g3Z9AVmVRSl+ij28L/D4t/oystWrkB4es61CeIVSH37jq3KJn2xiROUf
         k0RA==
X-Gm-Message-State: AOAM533XeeQFH3A50lDhqYF/sulOzs8Q2vS2E8BxV3/R0mb5xCZ2FQ1Q
        c6qN91DG+6LRORxbHqTdfoUQOyPR5Y+pHOqzUF4=
X-Google-Smtp-Source: ABdhPJyU3JXc2pJRQaqnYUFEIxzdDLSIk2Lov0ZJRGoLvieGJIGh6qYVS7spCooqh0dW7Qf4KPPcxKvwjlON0x8ake4=
X-Received: by 2002:ab0:f5:: with SMTP id 108mr10706159uaj.106.1621603525425;
 Fri, 21 May 2021 06:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210514192218.13022-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210514192218.13022-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 May 2021 15:25:13 +0200
Message-ID: <CAMuHMdVOTfV9XBo0t0CxGU1=Zo3VjFioDaDU1rdX8Hb6Pvz-Zw@mail.gmail.com>
Subject: Re: [PATCH 04/16] soc: renesas: Add ARCH_R9A07G044{L,LC} for the new
 RZ/G2{L,LC} SoC's
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, May 14, 2021 at 9:23 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add ARCH_R9A07G044{L,LC} as a configuration symbol for the new Renesas
> RZ/G2{L,LC} SoC's.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -279,6 +279,16 @@ config ARCH_R8A774B1
>         help
>           This enables support for the Renesas RZ/G2N SoC.
>
> +config ARCH_R9A07G044L
> +       bool "ARM64 Platform support for RZ/G2L SoC"

Please drop the "SoC", for consistency with other entries.

> +       help
> +         This enables support for the Renesas RZ/G2L SoC.
> +
> +config ARCH_R9A07G044LC
> +       bool "ARM64 Platform support for RZ/G2LC SoC"

Likewise.

> +       help
> +         This enables support for the Renesas RZ/G2LC SoC.
> +
>  endif # ARM64

Given LSI DEVID is the same, do we need both, or can we do with a
single ARCH_R9A07G044?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
