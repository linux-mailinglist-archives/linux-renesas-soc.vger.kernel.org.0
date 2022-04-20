Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFB7C5091E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Apr 2022 23:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382409AbiDTVPq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Apr 2022 17:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382384AbiDTVPp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 17:15:45 -0400
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9137447AEE;
        Wed, 20 Apr 2022 14:12:57 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id x20so2290773qvl.10;
        Wed, 20 Apr 2022 14:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6FPwyZ+ZUvJr8tcAEd6l0mcfs5euPojM4tuHFN6AkGM=;
        b=EUv/FKQCbgKFYb3EnJKEVI/KPAdMJhDttnDm7h/CKd3bbIox78qSYdtojglbejYoWw
         I4cGu9V9Inih9uptFErLWBiPJJg3HTlNrRwkLfKngkU3B0a9dLHzFIIiH+Sy4NKLXv+9
         bUS6AGMAI145NiR5OG9DnKllGCtppG6m3/h0XoYYI3gWZ/CwMAnafHAcOxYcfMF2IQES
         jYzwkIb23kTnbKWGbYOFw0MUzJFGhw9Xg2UzGp8uN/Vpbe5mc8CRv2qyIILPKXhWsz3f
         aO6Im3Kci6oRs0aiQtrfcKT/jo2b3Xo6JVOm6T5a0wT3GqX1mcl4wFPA5uXUXcbeBqNv
         PsVA==
X-Gm-Message-State: AOAM5332HdUsMavkoM2Ut8LkYFnVJY4mOj/FqhpHNCnQRqfMRQuO8H05
        zbUtAIc+H5JOc4TY8/WnzcB5GjncoQjvY1YM
X-Google-Smtp-Source: ABdhPJxjqwSiS6NhmktMF8Ch+kdjmvfYRhlUTyaBTfsLoiowlLB5EY3OUZftfj5dmLoW7VwIuyUvsw==
X-Received: by 2002:a05:6214:230a:b0:435:4f89:3c0e with SMTP id gc10-20020a056214230a00b004354f893c0emr16630831qvb.92.1650489176177;
        Wed, 20 Apr 2022 14:12:56 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id o10-20020ac85a4a000000b002f23c9f8cf0sm2629389qta.10.2022.04.20.14.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 14:12:55 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2edbd522c21so31896837b3.13;
        Wed, 20 Apr 2022 14:12:55 -0700 (PDT)
X-Received: by 2002:a81:4f0d:0:b0:2ec:1556:815 with SMTP id
 d13-20020a814f0d000000b002ec15560815mr23137661ywb.256.1650489175136; Wed, 20
 Apr 2022 14:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154024.112270-1-phil.edworthy@renesas.com> <20220330154024.112270-4-phil.edworthy@renesas.com>
In-Reply-To: <20220330154024.112270-4-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Apr 2022 23:12:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXy7XPcAmBLuCeXwZcPxNrfBs2yBN+tLicjHLQxQO=B2Q@mail.gmail.com>
Message-ID: <CAMuHMdXy7XPcAmBLuCeXwZcPxNrfBs2yBN+tLicjHLQxQO=B2Q@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] dt-bindings: clock: Add r9a09g011 CPG Clock Definitions
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

CC clock

Thanks for your patch!

On Wed, Mar 30, 2022 at 5:41 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Define RZ/V2M (R9A09G011) Clock Pulse Generator core clocks, module clock

The definitions contain no core clocks, only module clocks and resets?
Perhaps you will need a core clock for the Ethernet reference clock,
like on RZ/G2L?

> outputs (CPG_CLK_ON* registers), and reset definitions (CPG_RST_*
> registers) in Section 48.5 ("Register Description") of the RZ/V2M Hardware
> User's Manual (Rev. 1.10, Sep. 2021).
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  include/dt-bindings/clock/r9a09g011-cpg.h | 337 ++++++++++++++++++++++
>  1 file changed, 337 insertions(+)
>  create mode 100644 include/dt-bindings/clock/r9a09g011-cpg.h
>
> diff --git a/include/dt-bindings/clock/r9a09g011-cpg.h b/include/dt-bindings/clock/r9a09g011-cpg.h
> new file mode 100644
> index 000000000000..b88dbb0d8c49
> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a09g011-cpg.h
> @@ -0,0 +1,337 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R9A09G011_CPG_H__
> +#define __DT_BINDINGS_CLOCK_R9A09G011_CPG_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* Module Clocks */
> +#define R9A09G011_SYS_CLK              0
> +#define R9A09G011_PFC_PCLK             1
> +#define R9A09G011_PMC_CORE_CLOCK       2
> +#define R9A09G011_GIC_CLK              3
> +#define R9A09G011_RAMA_ACLK            4

Missing ROM_ACLK?

> +

No need for this blank line, as this is not a register boundary.

> +#define R9A09G011_SEC_ACLK             5
> +#define R9A09G011_SEC_PCLK             6
> +#define R9A09G011_SEC_TCLK             7
> +#define R9A09G011_DMAA_ACLK            8
> +#define R9A09G011_TSU0_PCLK            9
> +#define R9A09G011_TSU1_PCLK            10
> +
> +#define R9A09G011_CST_TRACECLK         11
> +#define R9A09G011_CST_SB_CLK           12
> +#define R9A09G011_CST_AHB_CLK          13
> +#define R9A09G011_CST_ATB_SB_CLK       14

Missing CST_TS_SB_CLK?
Yes, it shares a bit with CST_ATB_SB_CLK, cfr.
ETH0_CLK_AXI and ETH1_CLK_AXI.

> +
> +#define R9A09G011_SDI0_ACLK            15
> +#define R9A09G011_SDI0_IMCLK           16
> +#define R9A09G011_SDI0_IMCLK2          17
> +#define R9A09G011_SDI0_CLK_HS          18
> +#define R9A09G011_SDI1_ACLK            19
> +#define R9A09G011_SDI1_IMCLK           20
> +#define R9A09G011_SDI1_IMCLK2          21
> +#define R9A09G011_SDI1_CLK_HS          22
> +#define R9A09G011_EMM_ACLK             23
> +#define R9A09G011_EMM_IMCLK            24
> +#define R9A09G011_EMM_IMCLK2           25
> +#define R9A09G011_EMM_CLK_HS           26
> +#define R9A09G011_NFI_ACLK             27
> +#define R9A09G011_NFI_NF_CLK           28
> +
> +#define R9A09G011_PCI_ACLK             29
> +#define R9A09G011_PCI_CLK_PMU          30
> +#define R9A09G011_PCI_APB_CLK          31
> +#define R9A09G011_USB_ACLK_H           32
> +#define R9A09G011_USB_ACLK_P           33
> +#define R9A09G011_USB_PCLK             34
> +#define R9A09G011_ETH_CLK_AXI          35
> +#define R9A09G011_ETH_CLK_CHI          36
> +#define R9A09G011_ETH_GPTP_EXT         37

s/ETH/ETH0/ for the three above?

> +
> +#define R9A09G011_SDT_CLK              38
> +#define R9A09G011_SDT_CLKAPB           39
> +#define R9A09G011_SDT_CLK48            40
> +#define R9A09G011_GRP_CLK              41
> +#define R9A09G011_CIF_P0_CLK           42
> +#define R9A09G011_CIF_P1_CLK           43
> +#define R9A09G011_CIF_APB_CLK          44
> +#define R9A09G011_DCI_CLKAXI           45
> +#define R9A09G011_DCI_CLKAPB           46
> +#define R9A09G011_DCI_CLKDCI2          47
> +
> +#define R9A09G011_HMI_PCLK             48
> +#define R9A09G011_LCI_PCLK             49
> +#define R9A09G011_LCI_ACLK             50
> +#define R9A09G011_LCI_VCLK             51
> +#define R9A09G011_LCI_LPCLK            52
> +
> +#define R9A09G011_AUI_CLK              53
> +#define R9A09G011_AUI_CLKAXI           54
> +#define R9A09G011_AUI_CLKAPB           55
> +#define R9A09G011_AUMCLK               56
> +#define R9A09G011_GMCLK0               57
> +#define R9A09G011_GMCLK1               58
> +#define R9A09G011_MTR_CLK0             59
> +#define R9A09G011_MTR_CLK1             60
> +#define R9A09G011_MTR_CLKAPB           61
> +#define R9A09G011_GFT_CLK              62
> +#define R9A09G011_GFT_CLKAPB           63
> +#define R9A09G011_GFT_MCLK             64
> +
> +#define R9A09G011_ATGA_CLK             65
> +#define R9A09G011_ATGA_CLKAPB          66
> +#define R9A09G011_ATGB_CLK             67
> +#define R9A09G011_ATGB_CLKAPB          68
> +#define R9A09G011_SYC_CNT_CLK          69
> +
> +#define R9A09G011_GRPA_PCLK            70

CPERI_GRPA_PCLK

> +#define R9A09G011_TIM0_CLK             71
> +#define R9A09G011_TIM1_CLK             72
> +#define R9A09G011_TIM2_CLK             73
> +#define R9A09G011_TIM3_CLK             74
> +#define R9A09G011_TIM4_CLK             75
> +#define R9A09G011_TIM5_CLK             76
> +#define R9A09G011_TIM6_CLK             77
> +#define R9A09G011_TIM7_CLK             78
> +#define R9A09G011_IIC01_PCLK           79

IIC0_PCLK?

> +
> +#define R9A09G011_GRPB_PCLK            80

CPERI_GRPB_PCLK

> +#define R9A09G011_TIM8_CLK             81
> +#define R9A09G011_TIM9_CLK             82
> +#define R9A09G011_TIM10_CLK            83
> +#define R9A09G011_TIM11_CLK            84
> +#define R9A09G011_TIM12_CLK            85
> +#define R9A09G011_TIM13_CLK            86
> +#define R9A09G011_TIM14_CLK            87
> +#define R9A09G011_TIM15_CLK            88
> +#define R9A09G011_IIC23_PCLK           89

IIC1_PCLK?

> +
> +#define R9A09G011_GRPC_PCLK            90

CPERI_GRPC_PCLK?

> +#define R9A09G011_TIM16_CLK            91
> +#define R9A09G011_TIM17_CLK            92
> +#define R9A09G011_TIM18_CLK            93
> +#define R9A09G011_TIM19_CLK            94
> +#define R9A09G011_TIM20_CLK            95
> +#define R9A09G011_TIM21_CLK            96
> +#define R9A09G011_TIM22_CLK            97
> +#define R9A09G011_TIM23_CLK            98
> +#define R9A09G011_WDT0_PCLK            99
> +#define R9A09G011_WDT0_CLK             100
> +#define R9A09G011_WDT1_PCLK            101
> +#define R9A09G011_WDT1_CLK             102
> +
> +#define R9A09G011_GRPD_PCLK            103

CPERI_GRPD_PCLK?

> +#define R9A09G011_TIM24_CLK            104
> +#define R9A09G011_TIM25_CLK            105
> +#define R9A09G011_TIM26_CLK            106
> +#define R9A09G011_TIM27_CLK            107
> +#define R9A09G011_TIM28_CLK            108
> +#define R9A09G011_TIM29_CLK            109
> +#define R9A09G011_TIM30_CLK            110
> +#define R9A09G011_TIM31_CLK            111
> +
> +#define R9A09G011_GRPE_PCLK            112

CPERI_GRPE_PCLK?

> +#define R9A09G011_PWM0_CLK             113
> +#define R9A09G011_PWM1_CLK             114
> +#define R9A09G011_PWM2_CLK             115
> +#define R9A09G011_PWM3_CLK             116
> +#define R9A09G011_PWM4_CLK             117
> +#define R9A09G011_PWM5_CLK             118
> +#define R9A09G011_PWM6_CLK             119
> +#define R9A09G011_PWM7_CLK             120
> +
> +#define R9A09G011_GRPF_PCLK            121

CPERI_GRPF_PCLK?

> +#define R9A09G011_PWM8_CLK             122
> +#define R9A09G011_PWM9_CLK             123
> +#define R9A09G011_PWM10_CLK            124
> +#define R9A09G011_PWM11_CLK            125
> +#define R9A09G011_PWM12_CLK            126
> +#define R9A09G011_PWM13_CLK            127
> +#define R9A09G011_PWM14_CLK            128
> +#define R9A09G011_PWM15_CLK            129
> +
> +#define R9A09G011_GRPG_PCLK            130

CPERI_GRPG_PCLK?

> +#define R9A09G011_GRPH_PCLK            131

CPERI_GRPH_PCLK?

> +#define R9A09G011_URT_PCLK             132
> +#define R9A09G011_URT0_CLK             133
> +#define R9A09G011_URT1_CLK             134
> +#define R9A09G011_CSI0_CLK             135
> +#define R9A09G011_CSI1_CLK             136
> +#define R9A09G011_CSI2_CLK             137
> +#define R9A09G011_CSI3_CLK             138
> +#define R9A09G011_CSI4_CLK             139
> +#define R9A09G011_CSI5_CLK             140
> +
> +#define R9A09G011_ICB_ACLK1            141

Missing (shared) ICB_GIC_CLK?

> +#define R9A09G011_ICB_MPCLK1           142
> +#define R9A09G011_ICB_SPCLK1           143
> +#define R9A09G011_ICB_CLK48            144
> +#define R9A09G011_ICB_CLK48_2          145
> +#define R9A09G011_ICB_CLK48_3          146
> +#define R9A09G011_ICB_CLK48_4L         147

Missing (shared) ICB_CLK48_4R?

> +#define R9A09G011_ICB_CLK48_5          148
> +#define R9A09G011_ICB_CST_ATB_SB_CLK   149
> +#define R9A09G011_ICB_CST_CS_CLK       150
> +#define R9A09G011_ICB_CLK100_1         151
> +#define R9A09G011_ICB_ETH0_CLK_AXI     152
> +#define R9A09G011_ICB_DCI_CLKAXI       153
> +#define R9A09G011_ICB_SYC_CNT_CLK      154
> +
> +#define R9A09G011_ICB_DRPA_ACLK                155
> +#define R9A09G011_ICB_RFX_ACLK         156

Missing (shared) ICB_RFX_PCLK5?

> +#define R9A09G011_ICB_MMC_ACLK         157
> +
> +#define R9A09G011_ICB_MPCLK3           158
> +#define R9A09G011_ICB_CIMA_CLK         159
> +#define R9A09G011_ICB_CIMB_CLK         160
> +#define R9A09G011_ICB_BIMA_CLK         161
> +#define R9A09G011_ICB_FCD_CLKAXI       162
> +#define R9A09G011_ICB_VD_ACLK4         163
> +#define R9A09G011_ICB_MPCLK4           164
> +#define R9A09G011_ICB_VCD_PCLK4                165
> +
> +#define R9A09G011_CA53_CLK             166
> +#define R9A09G011_CA53_ACLK            167
> +#define R9A09G011_CA53_APCLK_DBG       168

Missing (shared) CST_APB_CA53_CLK?

> +#define R9A09G011_CA53_ATCLK           169

Missing (shared) CST_CS_CLK?

> +#define R9A09G011_CA53_TSCLK           170

Missing (shared) CST_TS_CLK?

> +#define R9A09G011_CA53_APCLK_REG       171
> +
> +#define R9A09G011_DRPA_ACLK            172
> +#define R9A09G011_DRPA_DCLK            173
> +#define R9A09G011_DRPA_INITCLK         174
> +
> +#define R9A09G011_RAMB_ACLK            175

Would it make sense to decouple this into
RAMB0_ACLK, RAMB1_ACLK, RAMB2_ACLK, RAMB3_ACLK?

> +
> +#define R9A09G011_CIMA_CLKAPB          176
> +#define R9A09G011_CIMA_CLK             177
> +#define R9A09G011_CIMB_CLK             178
> +#define R9A09G011_FAFA_CLK             179
> +#define R9A09G011_STG_CLKAXI           180
> +#define R9A09G011_STG_CLK0             181
> +
> +#define R9A09G011_BIMA_CLKAPB          182
> +#define R9A09G011_BIMA_CLK             183
> +#define R9A09G011_FAFB_CLK             184
> +#define R9A09G011_FCD_CLK              185
> +#define R9A09G011_FCD_CLKAXI           186
> +
> +#define R9A09G011_RIM_CLK              187
> +#define R9A09G011_VCD_ACLK             188

Mising (shared) VCD_PCLK?

> +#define R9A09G011_JPG0_CLK             189
> +#define R9A09G011_JPG0_ACLK            190
> +
> +#define R9A09G011_MMC_CORE_DDRC_CLK    191
> +#define R9A09G011_MMC_ACLK             192
> +#define R9A09G011_MMC_PCLK             193
> +#define R9A09G011_DDI_APBCLK           194
> +
> +/* Resets */
> +#define R9A09G011_SYS_RST_N            0
> +#define R9A09G011_PFC_PRESETN          1
> +#define R9A09G011_RAMA_ARESETN         2
> +#define R9A09G011_ROM_ARESETN          3
> +#define R9A09G011_DMAA_ARESETN         4
> +#define R9A09G011_SEC_ARESETN          5
> +#define R9A09G011_SEC_PRESETN          6
> +#define R9A09G011_SEC_RSTB             7
> +#define R9A09G011_TSU0_RESETN          8
> +#define R9A09G011_TSU1_RESETN          9
> +#define R9A09G011_PMC_RESET_N          10
> +
> +#define R9A09G011_CST_NTRST            11
> +#define R9A09G011_CST_NPOTRST          12

Missing (shared) CST_NTRST?

> +#define R9A09G011_CST_CS_RESETN                13
> +#define R9A09G011_CST_TS_RESETN                14
> +#define R9A09G011_CST_TRESETN          15
> +#define R9A09G011_CST_SB_RESETN                16
> +#define R9A09G011_CST_AHB_RESETN       17
> +#define R9A09G011_CST_TS_SB_RESETN     18
> +#define R9A09G011_CST_APB_CA53_RESETN  19
> +#define R9A09G011_CST_ATB_SB_RESETN    20
> +
> +#define R9A09G011_SDI0_IXRST           21
> +#define R9A09G011_SDI1_IXRST           22
> +#define R9A09G011_EMM_IXRST            23
> +#define R9A09G011_NFI_MARESETN         24
> +#define R9A09G011_NFI_REG_RST_N                25
> +#define R9A09G011_USB_PRESET_N         26
> +#define R9A09G011_USB_DRD_RESET                27
> +#define R9A09G011_USB_ARESETN_P                28
> +#define R9A09G011_USB_ARESETN_H                29
> +#define R9A09G011_ETH0_RST_HW_N                30
> +#define R9A09G011_PCI_ARESETN          31
> +
> +#define R9A09G011_SDT_RSTSYSAX         32
> +#define R9A09G011_GRP_RESETN           33
> +#define R9A09G011_CIF_RST_N            34
> +#define R9A09G011_DCU_RSTSYSAX         35
> +#define R9A09G011_HMI_RST_N            36
> +#define R9A09G011_HMI_PRESETN          37
> +#define R9A09G011_LCI_PRESETN          38
> +#define R9A09G011_LCI_ARESETN          39
> +
> +#define R9A09G011_AUI_RSTSYSAX         40
> +#define R9A09G011_MTR_RSTSYSAX         41
> +#define R9A09G011_GFT_RSTSYSAX         42
> +#define R9A09G011_ATGA_RSTSYSAX                43
> +#define R9A09G011_ATGB_RSTSYSAX                44
> +#define R9A09G011_SYC_RST_N            45
> +
> +#define R9A09G011_TIM_GPA_PRESETN      46
> +#define R9A09G011_TIM_GPB_PRESETN      47
> +#define R9A09G011_TIM_GPC_PRESETN      48
> +#define R9A09G011_TIM_GPD_PRESETN      49
> +#define R9A09G011_PWM_GPE_PRESETN      50
> +#define R9A09G011_PWM_GPF_PRESETN      51
> +#define R9A09G011_CSI_GPG_PRESETN      52
> +#define R9A09G011_CSI_GPH_PRESETN      53
> +#define R9A09G011_IIC_GPA_PRESETN      54
> +#define R9A09G011_IIC_GPB_PRESETN      55
> +#define R9A09G011_URT_PRESETN          56
> +#define R9A09G011_WDT0_PRESETN         57
> +#define R9A09G011_WDT1_PRESETN         58
> +
> +#define R9A09G011_ICB_PD_AWO_RST_N     59
> +#define R9A09G011_ICB_PD_MMC_RST_N     60
> +#define R9A09G011_ICB_PD_VD0_RST_N     61
> +#define R9A09G011_ICB_PD_VD1_RST_N     62
> +#define R9A09G011_ICB_PD_RFX_RST_N     63
> +
> +#define R9A09G011_CA53_NCPUPORESET0    64
> +#define R9A09G011_CA53_NCPUPORESET1    65
> +#define R9A09G011_CA53_NCORERESET0     66
> +#define R9A09G011_CA53_NCORERESET1     67
> +#define R9A09G011_CA53_NPRESETDBG      68
> +#define R9A09G011_CA53_L2RESET         69
> +#define R9A09G011_CA53_NMISCRESET_HM   70
> +#define R9A09G011_CA53_NMISCRESET_SM   71
> +#define R9A09G011_CA53_NARESET         72
> +
> +#define R9A09G011_DRPA_ARESETN         73
> +
> +#define R9A09G011_RAMB_ARESETN         74

Would it make sense to decouple this into
RAMB0_ARESETN, RAMB1_ARESETN, RAMB2_ARESETN, RAMB3_ARESETN?

> +
> +#define R9A09G011_CIMA_RSTSYSAX                75
> +#define R9A09G011_CIMB_RSTSYSAX                76
> +#define R9A09G011_FAFA_RSTSYSAX                77
> +#define R9A09G011_STG_RSTSYSAX         78
> +
> +#define R9A09G011_BIMA_RSTSYSAX                79
> +#define R9A09G011_FAFB_RSTSYSAX                80
> +#define R9A09G011_FCD_RSTSYSAX         81
> +#define R9A09G011_RIM_RSTSYSAX         82
> +#define R9A09G011_VCD_RESETN           83
> +#define R9A09G011_JPG_XRESET           84
> +
> +#define R9A09G011_MMC_CORE_DDRC_RSTN   85
> +#define R9A09G011_MMC_ARESETN_N                86
> +#define R9A09G011_MMC_PRESETN          87
> +#define R9A09G011_DDI_PWROK            88
> +#define R9A09G011_DDI_RESET            89
> +#define R9A09G011_DDI_RESETN_APB       90
> +
> +#endif /* __DT_BINDINGS_CLOCK_R9A09G011_CPG_H__ */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
