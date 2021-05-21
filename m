Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C709938C9B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 17:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbhEUPFJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 11:05:09 -0400
Received: from mail-vk1-f177.google.com ([209.85.221.177]:45925 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231597AbhEUPFI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 11:05:08 -0400
Received: by mail-vk1-f177.google.com with SMTP id f10so3407345vkm.12;
        Fri, 21 May 2021 08:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0qKJJd3cjJ7hCdvfk4pXNc41G7VhVnNbJwfnymFvfO0=;
        b=Tl3Xo7szpvzEzqM6T2WmNqLcOIZypMJ+yZJP3O7nIkRn9mkXE4s1czbeAJ9/8soAqI
         zkbWqdRrUCg9b6rTTPIbDDnTbuC+Id573A3K8+2MKoOGcfGxtXkahrZCWYIg5x7Wwbj3
         M+GDB2Cy2Qp8ROGUwBmGyWkFyant/iCbb8vx2bPctgrgB3O/fupfEaKFTZfhITM7KhIQ
         FumTVF7tDtzy2CyMGcOoRAyf10k+r+2pFPoNoWh68r/r3YgLczXEU8NmFVLTx/fRN+dv
         dDrG+hax00HFGptyB1eEgIMpGhav8mL5BbEcH7ZZ24//TIaP8bUanOEB6fViEWfL0A6V
         t25A==
X-Gm-Message-State: AOAM532h/jsOBybQZpJAhIWAfL28OHjttn4DNqK9fTdR1lkaJl2fGMjn
        vvlVQ9DyvxwFfXWySCGZ7/WbQIAKulyMensHOHQ=
X-Google-Smtp-Source: ABdhPJyo1NE5VHb9Iugn9gQsHSpjwptYqStSj76L9UD3F6tMbb4gbDvM+9CiAN94X2nH4ClmjJSV9MXwn7eFkeKS5Ik=
X-Received: by 2002:a1f:9505:: with SMTP id x5mr8258938vkd.6.1621609424111;
 Fri, 21 May 2021 08:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210514192218.13022-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210514192218.13022-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 May 2021 17:03:32 +0200
Message-ID: <CAMuHMdWheV1Y7jh9R32XVrcbDTYFaGEVPVOsf8GWdsZ6CA-c9Q@mail.gmail.com>
Subject: Re: [PATCH 12/16] clk: renesas: Define RZ/G2L CPG Clock Definitions
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

Thanks for your patch!

On Fri, May 14, 2021 at 9:23 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Define RZ/G2L (R9A07G044) Clock Pulse Generator Core Clock

(see Table 8.5 ("Clock List"))

> and module clock outputs.

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  include/dt-bindings/clock/r9a07g044l-cpg.h | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 include/dt-bindings/clock/r9a07g044l-cpg.h
>
> diff --git a/include/dt-bindings/clock/r9a07g044l-cpg.h b/include/dt-bindings/clock/r9a07g044l-cpg.h
> new file mode 100644
> index 000000000000..2bc13f4e575b
> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a07g044l-cpg.h
> @@ -0,0 +1,89 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__
> +#define __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* R9A07G044 CPG Core Clocks */
> +#define R9A07G044_CLK_I                        0
> +#define R9A07G044_CLK_I2               1
> +#define R9A07G044_CLK_G                        2
> +#define R9A07G044_CLK_S0               3
> +#define R9A07G044_CLK_S1               4
> +#define R9A07G044_CLK_SPI0             5
> +#define R9A07G044_CLK_SPI1             6
> +#define R9A07G044_CLK_SD0              7
> +#define R9A07G044_CLK_SD1              8
> +#define R9A07G044_CLK_M0               9
> +#define R9A07G044_CLK_M1               10
> +#define R9A07G044_CLK_M2               11
> +#define R9A07G044_CLK_M3               12
> +#define R9A07G044_CLK_M4               13
> +#define R9A07G044_CLK_HP               14
> +#define R9A07G044_CLK_TSU              15
> +#define R9A07G044_CLK_ZT               16
> +#define R9A07G044_CLK_P0               17
> +#define R9A07G044_CLK_P1               18
> +#define R9A07G044_CLK_P2               19
> +#define R9A07G044_CLK_AT               20
> +#define R9A07G044_OSCCLK               21

Looks good to me.

> +
> +/* R9A07G044 Module Clocks */
> +#define R9A07G044_CLK_GIC600           0
> +#define R9A07G044_CLK_IA55             1
> +#define R9A07G044_CLK_SYC              2
> +#define R9A07G044_CLK_DMAC             3
> +#define R9A07G044_CLK_SYSC             4
> +#define R9A07G044_CLK_MTU              5
> +#define R9A07G044_CLK_GPT              6
> +#define R9A07G044_CLK_ETH0             7
> +#define R9A07G044_CLK_ETH1             8
> +#define R9A07G044_CLK_I2C0             9
> +#define R9A07G044_CLK_I2C1             10
> +#define R9A07G044_CLK_I2C2             11
> +#define R9A07G044_CLK_I2C3             12
> +#define R9A07G044_CLK_SCIF0            13
> +#define R9A07G044_CLK_SCIF1            14
> +#define R9A07G044_CLK_SCIF2            15
> +#define R9A07G044_CLK_SCIF3            16
> +#define R9A07G044_CLK_SCIF4            17
> +#define R9A07G044_CLK_SCI0             18
> +#define R9A07G044_CLK_SCI1             19
> +#define R9A07G044_CLK_GPIO             20
> +#define R9A07G044_CLK_SDHI0            21
> +#define R9A07G044_CLK_SDHI1            22
> +#define R9A07G044_CLK_USB0             23
> +#define R9A07G044_CLK_USB1             24
> +#define R9A07G044_CLK_CANFD            25
> +#define R9A07G044_CLK_SSI0             26
> +#define R9A07G044_CLK_SSI1             27
> +#define R9A07G044_CLK_SSI2             28
> +#define R9A07G044_CLK_SSI3             29
> +#define R9A07G044_CLK_MHU              30
> +#define R9A07G044_CLK_OSTM0            31
> +#define R9A07G044_CLK_OSTM1            32
> +#define R9A07G044_CLK_OSTM2            33
> +#define R9A07G044_CLK_WDT0             34
> +#define R9A07G044_CLK_WDT1             35
> +#define R9A07G044_CLK_WDT2             36
> +#define R9A07G044_CLK_WDT_PON          37
> +#define R9A07G044_CLK_GPU              38
> +#define R9A07G044_CLK_ISU              39
> +#define R9A07G044_CLK_H264             40
> +#define R9A07G044_CLK_CRU              41
> +#define R9A07G044_CLK_MIPI_DSI         42
> +#define R9A07G044_CLK_LCDC             43
> +#define R9A07G044_CLK_SRC              44
> +#define R9A07G044_CLK_RSPI0            45
> +#define R9A07G044_CLK_RSPI1            46
> +#define R9A07G044_CLK_RSPI2            47
> +#define R9A07G044_CLK_ADC              48
> +#define R9A07G044_CLK_TSU_PCLK         49
> +#define R9A07G044_CLK_SPI              50
> +#define R9A07G044_CLK_MIPI_DSI_V       51
> +#define R9A07G044_CLK_MIPI_DSI_PIN     52

Are these also listed in the Hardware User's Manual?
Or is this your own list?

> +
> +#endif /* __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__ */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
