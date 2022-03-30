Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1244ECD36
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 21:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350699AbiC3T3x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 15:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350001AbiC3T3w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 15:29:52 -0400
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E31952BB25;
        Wed, 30 Mar 2022 12:28:06 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id r127so17516050qke.13;
        Wed, 30 Mar 2022 12:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A1/ObAT5GdIXtKIBoa72KMWM6B/LTkvaVgwzmBofnkY=;
        b=O5/yAAZnbw/umQwJO+8I0awGgavwHi3DHMKy9zDqCS5DxZyZq/NdOvfXvvvXYm4MUZ
         edCtE52sskPHguddFXgvV+cHKbzQyFU7oKNHWLse+8n6xqNz7xsTC+sppXg/gCtTDi3+
         ANQyVsJRQ8yReY8w8YVRkpRA0NFvey6Da0bVb4ye1JAI+ii9Gkp4P6BI6Qbs803+Shkm
         Y40A8MXduoBIkn8mo2lAy8FeL6sbmNWV70SXU9Z21Fk1kDaCk+6LKaQpRKHsEwnTkucE
         zJROft24zW0C0/syW6EbqqbVrHr2kUcM0Q+cot6zsFcInMsW5GGCgOR+/w8rHf6M6e2X
         H1dA==
X-Gm-Message-State: AOAM531r1SCrie6KPbDWJAkJOIXoPBjPjqTSWMgEHGe+pMOw9nJOlN6h
        Jw5L6lxnjnellqLV6vEjh1oTgsZNt9EV3Q==
X-Google-Smtp-Source: ABdhPJz3zDBxXd09eg0quCum4AtYfKzwZv1vIika6sikNdUGtYjQFgrHB4FE4U/rem/9EBzPbH9KEA==
X-Received: by 2002:a37:acb:0:b0:67b:15f9:55b8 with SMTP id 194-20020a370acb000000b0067b15f955b8mr917129qkk.694.1648668485688;
        Wed, 30 Mar 2022 12:28:05 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id h6-20020a379e06000000b0067b30874b90sm11301466qke.41.2022.03.30.12.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 12:28:05 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id y142so38461983ybe.11;
        Wed, 30 Mar 2022 12:28:05 -0700 (PDT)
X-Received: by 2002:a05:6902:101:b0:633:ccde:cfca with SMTP id
 o1-20020a056902010100b00633ccdecfcamr1156684ybh.207.1648668485039; Wed, 30
 Mar 2022 12:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220315142644.17660-1-biju.das.jz@bp.renesas.com> <20220315142644.17660-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315142644.17660-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 30 Mar 2022 21:27:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHWvkZyjPi4i5AG2iYgMp7euS=Nf-v_rYNVS10jiW6eQ@mail.gmail.com>
Message-ID: <CAMuHMdVHWvkZyjPi4i5AG2iYgMp7euS=Nf-v_rYNVS10jiW6eQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: clock: Add R9A07G043 CPG Clock and
 Reset Definitions
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Mar 15, 2022 at 3:26 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Define RZ/G2UL (R9A07G043U) Clock Pulse Generator Core Clock and module
> clock outputs, as listed in Table 7.1.4.2 ("Clock List r0.51") and also
> add Reset definitions referring to registers CPG_RST_* in Section 7.2.3
> ("Register configuration") of the RZ/G2UL Hardware User's Manual (Rev.
> 0.51, Nov. 2021).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Removed leading u/U from r9a07g043
>  * renamed the file r9a07g043u-cpg.h->r9a07g043-cpg.h
>  * Prepared Common Module Clock/Reset indices for RZ/G2UL and RZ/Five
>  * Prepared RZ/G2UL specific Module Clock/Reset indices.

Thanks for the update!

> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a07g043-cpg.h
> @@ -0,0 +1,190 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R9A07G043_CPG_H__
> +#define __DT_BINDINGS_CLOCK_R9A07G043_CPG_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* R9A07G043 CPG Core Clocks */
> +#define R9A07G043_CLK_I                        0
> +#define R9A07G043_CLK_I2               1
> +#define R9A07G043_CLK_S0               2
> +#define R9A07G043_CLK_SPI0             3
> +#define R9A07G043_CLK_SPI1             4
> +#define R9A07G043_CLK_SD0              5
> +#define R9A07G043_CLK_SD1              6
> +#define R9A07G043_CLK_M0               7
> +#define R9A07G043_CLK_M2               8
> +#define R9A07G043_CLK_M3               9
> +#define R9A07G043_CLK_HP               10
> +#define R9A07G043_CLK_TSU              11
> +#define R9A07G043_CLK_ZT               12
> +#define R9A07G043_CLK_P0               13
> +#define R9A07G043_CLK_P1               14
> +#define R9A07G043_CLK_P2               15
> +#define R9A07G043_CLK_AT               16
> +#define R9A07G043_OSCCLK               17
> +#define R9A07G043_CLK_P0_DIV2          18
> +
> +/* R9A07G043 Common Module Clocks */
> +#define R9A07G043_IA55_CLK             0
> +#define R9A07G043_IA55_PCLK            1

I think IA55 does not exist on RZ/Five?

> +#define R9A07G043_DMAC_ACLK            2
> +#define R9A07G043_DMAC_PCLK            3
> +#define R9A07G043_OSTM0_PCLK           4
> +#define R9A07G043_OSTM1_PCLK           5
> +#define R9A07G043_OSTM2_PCLK           6
> +#define R9A07G043_MTU_X_MCK_MTU3       7
> +#define R9A07G043_POE3_CLKM_POE                8
> +#define R9A07G043_WDT0_PCLK            9
> +#define R9A07G043_WDT0_CLK             10
> +#define R9A07G043_SPI_CLK2             11
> +#define R9A07G043_SPI_CLK              12
> +#define R9A07G043_SDHI0_IMCLK          13
> +#define R9A07G043_SDHI0_IMCLK2         14
> +#define R9A07G043_SDHI0_CLK_HS         15
> +#define R9A07G043_SDHI0_ACLK           16
> +#define R9A07G043_SDHI1_IMCLK          17
> +#define R9A07G043_SDHI1_IMCLK2         18
> +#define R9A07G043_SDHI1_CLK_HS         19
> +#define R9A07G043_SDHI1_ACLK           20
> +#define R9A07G043_SSI0_PCLK2           21
> +#define R9A07G043_SSI0_PCLK_SFR                22
> +#define R9A07G043_SSI1_PCLK2           23
> +#define R9A07G043_SSI1_PCLK_SFR                24
> +#define R9A07G043_SSI2_PCLK2           25
> +#define R9A07G043_SSI2_PCLK_SFR                26
> +#define R9A07G043_SSI3_PCLK2           27
> +#define R9A07G043_SSI3_PCLK_SFR                28
> +#define R9A07G043_SRC_CLKP             29
> +#define R9A07G043_USB_U2H0_HCLK                30
> +#define R9A07G043_USB_U2H1_HCLK                31
> +#define R9A07G043_USB_U2P_EXR_CPUCLK   32
> +#define R9A07G043_USB_PCLK             33
> +#define R9A07G043_ETH0_CLK_AXI         34
> +#define R9A07G043_ETH0_CLK_CHI         35
> +#define R9A07G043_ETH1_CLK_AXI         36
> +#define R9A07G043_ETH1_CLK_CHI         37
> +#define R9A07G043_I2C0_PCLK            38
> +#define R9A07G043_I2C1_PCLK            39
> +#define R9A07G043_I2C2_PCLK            40
> +#define R9A07G043_I2C3_PCLK            41
> +#define R9A07G043_SCIF0_CLK_PCK                42
> +#define R9A07G043_SCIF1_CLK_PCK                43
> +#define R9A07G043_SCIF2_CLK_PCK                44
> +#define R9A07G043_SCIF3_CLK_PCK                45
> +#define R9A07G043_SCIF4_CLK_PCK                46
> +#define R9A07G043_SCI0_CLKP            47
> +#define R9A07G043_SCI1_CLKP            48
> +#define R9A07G043_IRDA_CLKP            49
> +#define R9A07G043_RSPI0_CLKB           50
> +#define R9A07G043_RSPI1_CLKB           51
> +#define R9A07G043_RSPI2_CLKB           52
> +#define R9A07G043_CANFD_PCLK           53
> +#define R9A07G043_GPIO_HCLK            54
> +#define R9A07G043_ADC_ADCLK            55
> +#define R9A07G043_ADC_PCLK             56
> +#define R9A07G043_TSU_PCLK             57
> +#define R9A07G043_LAST_COMMON_CLK      (R9A07G043_TSU_PCLK)

Does R9A07G043_LAST_COMMON_CLK need to be part of the bindings?
Do you actually have a use case for this definition, besides the use
below?  If not, I would get rid of the definition, and just hardcode
the numeric values below.

Perhaps you planned to start enumerating RZ/Five-specific clocks from
R9A07G043_LAST_COMMON_CLK + 1, too?  I don't think that's a good idea,
as it would complicate validation of indices in the driver.

> +
> +/* RZ/G2UL Specific */
> +#define R9A07G043_CA55_SCLK            (R9A07G043_LAST_COMMON_CLK + 1)
> +#define R9A07G043_CA55_PCLK            (R9A07G043_LAST_COMMON_CLK + 2)
> +#define R9A07G043_CA55_ATCLK           (R9A07G043_LAST_COMMON_CLK + 3)
> +#define R9A07G043_CA55_GICCLK          (R9A07G043_LAST_COMMON_CLK + 4)
> +#define R9A07G043_CA55_PERICLK         (R9A07G043_LAST_COMMON_CLK + 5)
> +#define R9A07G043_CA55_ACLK            (R9A07G043_LAST_COMMON_CLK + 6)
> +#define R9A07G043_CA55_TSCLK           (R9A07G043_LAST_COMMON_CLK + 7)
> +#define R9A07G043_GIC600_GICCLK                (R9A07G043_LAST_COMMON_CLK + 8)
> +#define R9A07G043_MHU_PCLK             (R9A07G043_LAST_COMMON_CLK + 9)
> +#define R9A07G043_SYC_CNT_CLK          (R9A07G043_LAST_COMMON_CLK + 10)

I think SYC_CNT does exist on RZ/Five?

So I'm not 100% convinced it's a good idea to split the definitions in
common, RZ/G2UL-specific, and RZ/Five-specific definitions like this.
If we make a mistake, the end result won't look pretty.
And we can't do compile-time validation that way anyway.

So I'm in favor of listing all clocks (in the same order as on RZ/G2L),
and adding a comment if a clock is RZ/G2UL-only.

> +#define R9A07G043_WDT2_PCLK            (R9A07G043_LAST_COMMON_CLK + 11)
> +#define R9A07G043_WDT2_CLK             (R9A07G043_LAST_COMMON_CLK + 12)
> +#define R9A07G043_ISU_ACLK             (R9A07G043_LAST_COMMON_CLK + 13)
> +#define R9A07G043_ISU_PCLK             (R9A07G043_LAST_COMMON_CLK + 14)
> +#define R9A07G043_CRU_SYSCLK           (R9A07G043_LAST_COMMON_CLK + 15)
> +#define R9A07G043_CRU_VCLK             (R9A07G043_LAST_COMMON_CLK + 16)
> +#define R9A07G043_CRU_PCLK             (R9A07G043_LAST_COMMON_CLK + 17)
> +#define R9A07G043_CRU_ACLK             (R9A07G043_LAST_COMMON_CLK + 18)
> +#define R9A07G043_LCDC_CLK_A           (R9A07G043_LAST_COMMON_CLK + 19)
> +#define R9A07G043_LCDC_CLK_P           (R9A07G043_LAST_COMMON_CLK + 20)
> +#define R9A07G043_LCDC_CLK_D           (R9A07G043_LAST_COMMON_CLK + 21)
> +
> +/* R9A07G043 Common Resets */
> +#define R9A07G043_IA55_RESETN          0

All my comments above apply to resets, too.

> +#define R9A07G043_DMAC_ARESETN         1
> +#define R9A07G043_DMAC_RST_ASYNC       2
> +#define R9A07G043_OSTM0_PRESETZ                3
> +#define R9A07G043_OSTM1_PRESETZ                4
> +#define R9A07G043_OSTM2_PRESETZ                5
> +#define R9A07G043_MTU_X_PRESET_MTU3    6
> +#define R9A07G043_POE3_RST_M_REG       7
> +#define R9A07G043_WDT0_PRESETN         8
> +#define R9A07G043_SPI_RST              9
> +#define R9A07G043_SDHI0_IXRST          10
> +#define R9A07G043_SDHI1_IXRST          11

Move SSI resets here? (see below)

> +#define R9A07G043_SRC_RST              12
> +#define R9A07G043_USB_U2H0_HRESETN     13
> +#define R9A07G043_USB_U2H1_HRESETN     14
> +#define R9A07G043_USB_U2P_EXL_SYSRST   15
> +#define R9A07G043_USB_PRESETN          16

Move ETH resets here? (see below)

> +#define R9A07G043_I2C0_MRST            17
> +#define R9A07G043_I2C1_MRST            18
> +#define R9A07G043_I2C2_MRST            19
> +#define R9A07G043_I2C3_MRST            20

Move SCIF resets here? (see below)

> +#define R9A07G043_SCI0_RST             21
> +#define R9A07G043_SCI1_RST             22
> +#define R9A07G043_IRDA_RST             23
> +#define R9A07G043_RSPI0_RST            24
> +#define R9A07G043_RSPI1_RST            25
> +#define R9A07G043_RSPI2_RST            26
> +#define R9A07G043_CANFD_RSTP_N         27
> +#define R9A07G043_CANFD_RSTC_N         28
> +#define R9A07G043_GPIO_RSTN            29
> +#define R9A07G043_GPIO_PORT_RESETN     30
> +#define R9A07G043_GPIO_SPARE_RESETN    31
> +#define R9A07G043_TSU_PRESETN          32
> +#define R9A07G043_SSI0_RST_M2_REG      33
> +#define R9A07G043_SSI1_RST_M2_REG      34
> +#define R9A07G043_SSI2_RST_M2_REG      35
> +#define R9A07G043_SSI3_RST_M2_REG      36
> +#define R9A07G043_ETH0_RST_HW_N                37
> +#define R9A07G043_ETH1_RST_HW_N                38
> +#define R9A07G043_SCIF0_RST_SYSTEM_N   39
> +#define R9A07G043_SCIF1_RST_SYSTEM_N   40
> +#define R9A07G043_SCIF2_RST_SYSTEM_N   41
> +#define R9A07G043_SCIF3_RST_SYSTEM_N   42
> +#define R9A07G043_SCIF4_RST_SYSTEM_N   43

Is there any specific reason the SSI, ETH, and SCIF resets are
ordered differently than the corresponding clocks, and than the
resets on RZ/G2L?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
