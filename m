Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D494C3A9979
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jun 2021 13:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbhFPLrS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Jun 2021 07:47:18 -0400
Received: from mail-vk1-f179.google.com ([209.85.221.179]:37523 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232618AbhFPLrS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jun 2021 07:47:18 -0400
Received: by mail-vk1-f179.google.com with SMTP id u66so534055vkb.4;
        Wed, 16 Jun 2021 04:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C5xppwYgbbNCxTVa8+l3hCPLDPuKKTv39ehN8GGrI7U=;
        b=ZfxZh9HYfi+BscZ6zAdlaBHdLQ4j+3D7HBDvjYEihWp5wOE8zLuH8rA08aGCkjym0h
         OMCV4VwI8uUFqu333amPxAOquSwLFE1qoLsHolcooItCuc7X1Sd0Kh18AjI9mnp+DahT
         5RgXZlft/EgWEvVhkCqDafAlGBZzrw+OYRN3KLBs9rm4qjcfr3u/akvERCYSIIlqe6eV
         1589HKujFJXYXrYOxYWdk7X3T1d53a7ofHMVN9ITUNapv6/An8KMKzUO5X8oNBeVUieI
         ChcE+0qFigkDo2hyOFnT4HHyxqk/M8ND3AiquUItw7uJUPjf4ZIJ7Q2oTPEKws7uDqtm
         u1uw==
X-Gm-Message-State: AOAM531EFEcQ+9in6NFYC2IdSnUg05H3gl9l5axCv8K7BMmXm9oW1d/0
        xz7jpusdqfn2EfVHexlo010pwuqOFN1lBFgEAQA=
X-Google-Smtp-Source: ABdhPJwZ6TT6OMmy6SWymg2li73H9PwHPEkS+Jh/3w8Q8Nu3JnWuVnB1heh2jXrTY/4YRd/lVwLIj72o+UD/CLTuj6Q=
X-Received: by 2002:a1f:9505:: with SMTP id x5mr8721402vkd.6.1623843911751;
 Wed, 16 Jun 2021 04:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210616105949.10215-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210616105949.10215-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Jun 2021 13:45:00 +0200
Message-ID: <CAMuHMdUbWMbCLtTmTjv7KViObv8UxeVpQ93tvJyp-ziO55bfyw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clk: renesas: Update {ETH,SDHI,USB} CPG
 Clock Definitions
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Jun 16, 2021 at 1:18 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Update {ETH, SDHI, USB} clock definitions, as they need special
> handling.
>
> ETH has 2 clocks controlled by single bit.
> USB has 4 clocks pclock is shared by USB Ch0 and USB Ch1.
> SDHI has 4 clocks.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/include/dt-bindings/clock/r9a07g044-cpg.h
> +++ b/include/dt-bindings/clock/r9a07g044-cpg.h
> @@ -39,51 +39,61 @@
>  #define R9A07G044_CLK_SYSC             4
>  #define R9A07G044_CLK_MTU              5
>  #define R9A07G044_CLK_GPT              6
> -#define R9A07G044_CLK_ETH0             7
> -#define R9A07G044_CLK_ETH1             8
> -#define R9A07G044_CLK_I2C0             9
> -#define R9A07G044_CLK_I2C1             10
> -#define R9A07G044_CLK_I2C2             11
> -#define R9A07G044_CLK_I2C3             12
> -#define R9A07G044_CLK_SCIF0            13
> -#define R9A07G044_CLK_SCIF1            14
> -#define R9A07G044_CLK_SCIF2            15
> -#define R9A07G044_CLK_SCIF3            16
> -#define R9A07G044_CLK_SCIF4            17
> -#define R9A07G044_CLK_SCI0             18
> -#define R9A07G044_CLK_SCI1             19
> -#define R9A07G044_CLK_GPIO             20
> -#define R9A07G044_CLK_SDHI0            21
> -#define R9A07G044_CLK_SDHI1            22
> -#define R9A07G044_CLK_USB0             23
> -#define R9A07G044_CLK_USB1             24
> -#define R9A07G044_CLK_CANFD            25
> -#define R9A07G044_CLK_SSI0             26
> -#define R9A07G044_CLK_SSI1             27
> -#define R9A07G044_CLK_SSI2             28
> -#define R9A07G044_CLK_SSI3             29
> -#define R9A07G044_CLK_MHU              30
> -#define R9A07G044_CLK_OSTM0            31
> -#define R9A07G044_CLK_OSTM1            32
> -#define R9A07G044_CLK_OSTM2            33
> -#define R9A07G044_CLK_WDT0             34
> -#define R9A07G044_CLK_WDT1             35
> -#define R9A07G044_CLK_WDT2             36
> -#define R9A07G044_CLK_WDT_PON          37
> -#define R9A07G044_CLK_GPU              38
> -#define R9A07G044_CLK_ISU              39
> -#define R9A07G044_CLK_H264             40
> -#define R9A07G044_CLK_CRU              41
> -#define R9A07G044_CLK_MIPI_DSI         42
> -#define R9A07G044_CLK_LCDC             43
> -#define R9A07G044_CLK_SRC              44
> -#define R9A07G044_CLK_RSPI0            45
> -#define R9A07G044_CLK_RSPI1            46
> -#define R9A07G044_CLK_RSPI2            47
> -#define R9A07G044_CLK_ADC              48
> -#define R9A07G044_CLK_TSU_PCLK         49
> -#define R9A07G044_CLK_SPI              50
> -#define R9A07G044_CLK_MIPI_DSI_V       51
> -#define R9A07G044_CLK_MIPI_DSI_PIN     52
> +#define ETH0_CLK_AXI                   7
> +#define ETH0_CLK_CHI                   8
> +#define ETH1_CLK_AXI                   9
> +#define ETH1_CLK_CHI                   10

R9A07G044_ETH0_CLK_AXI etc.?

> +#define R9A07G044_CLK_I2C0             11
> +#define R9A07G044_CLK_I2C1             12
> +#define R9A07G044_CLK_I2C2             13
> +#define R9A07G044_CLK_I2C3             14
> +#define R9A07G044_CLK_SCIF0            15
> +#define R9A07G044_CLK_SCIF1            16
> +#define R9A07G044_CLK_SCIF2            17
> +#define R9A07G044_CLK_SCIF3            18
> +#define R9A07G044_CLK_SCIF4            19
> +#define R9A07G044_CLK_SCI0             20
> +#define R9A07G044_CLK_SCI1             21
> +#define R9A07G044_CLK_GPIO             22
> +#define R9A07G044_CLK_SDHI0_IMCLK      23
> +#define R9A07G044_CLK_SDHI0_IMCLK2     24
> +#define R9A07G044_CLK_SDHI0_CLK_HS     25
> +#define R9A07G044_CLK_SDHI0_ACLK       26
> +#define R9A07G044_CLK_SDHI1_IMCLK      27
> +#define R9A07G044_CLK_SDHI1_IMCLK2     28
> +#define R9A07G044_CLK_SDHI1_CLK_HS     29
> +#define R9A07G044_CLK_SDHI1_ACLK       30
> +#define R9A07G044_CLK_USB_U2H0_HCLK    31
> +#define R9A07G044_CLK_USB_U2H1_HCLK    32
> +#define R9A07G044_CLK_HSUSB            33
> +#define R9A07G044_CLK_USB_PCLK         34

I think we should use the opportunity to
  1. Split the remaining module clocks like R9A07G044_CLK_IA55 and
     R9A07G044_CLK_DMAC,
  2. Rename the definitions to match the "Clock Name" column in the
     RZG2L clock list, with an "R9A07G044_" prefix,
  3. Add all missing clocks, as listed in the RZG2L clock list.
This will prevent similar issues from popping up later, when the DT
bindings clock list is part of a released kernel version, and becomes
cast in stone and append-only (so yes, step 3 could be postponed).

Do you agree?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
