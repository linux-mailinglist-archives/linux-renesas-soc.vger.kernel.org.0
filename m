Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81206511A1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Apr 2022 16:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237853AbiD0O3h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Apr 2022 10:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237829AbiD0O3e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 10:29:34 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7368D616D;
        Wed, 27 Apr 2022 07:26:23 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id c1so1355265qkf.13;
        Wed, 27 Apr 2022 07:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fxg7grC2BecBXWztAOFsLafunDqDSGdheVKilDNTqYw=;
        b=RErNBuDEsmT1IPoS4ZG4UAQy0ntiDoNe2vnOZKf0oHVk7kY3og0B+QIlIY8CDDfkl2
         mAvzQaYrqLwn8FIBHVwUkBYQTwo6szoSOjMyHbSUtpKoBK7jSmsUZoyCTUG4skvv6FGt
         bdWIgWp27Wc7xtZZLxGymEaC28si1+Rn8DALisjkFV4fLevfWp95MwFAv28fnClAftjw
         HH0wRoGprvoB6aYzeHEt8rS75xDMXb6xRg1ml0m585JQzXI4QbgHuj0vq74icfZWQ6bd
         Mr7YHC1EYcUDtoo6vL/BWOCJp9gX5KGl96qKXOb16fGfdsmubPssPaXm3pjot0I9kWq2
         rNpA==
X-Gm-Message-State: AOAM530wieY0bKE5s7TSaPb5pvLgaTZvLRdZ2OaWxDBlRUZWWopACKtm
        qjIqonX4yod8JNkL4sIDqZRGJf9FhpaQag==
X-Google-Smtp-Source: ABdhPJxoPJl+BS7WBPw3ur0EW+/DlJ/5QUTS6WUYGVkDwjgifpPIRnP8UnT8AbLdTVq/HspybTOJ/w==
X-Received: by 2002:a05:620a:4085:b0:69e:b1eb:696 with SMTP id f5-20020a05620a408500b0069eb1eb0696mr16399686qko.672.1651069581984;
        Wed, 27 Apr 2022 07:26:21 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 2-20020ac84e82000000b002f1f95ce5fbsm10121954qtp.3.2022.04.27.07.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 07:26:21 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id i38so3628346ybj.13;
        Wed, 27 Apr 2022 07:26:21 -0700 (PDT)
X-Received: by 2002:a25:d393:0:b0:648:4871:3b91 with SMTP id
 e141-20020a25d393000000b0064848713b91mr17159902ybf.506.1651069581197; Wed, 27
 Apr 2022 07:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220425064201.459633-1-yoshihiro.shimoda.uh@renesas.com> <20220425064201.459633-6-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220425064201.459633-6-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Apr 2022 16:26:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNs+Cv58dvDcG_e1PheSzjFcAPP_QiTYQ-iULTWjZSAA@mail.gmail.com>
Message-ID: <CAMuHMdUNs+Cv58dvDcG_e1PheSzjFcAPP_QiTYQ-iULTWjZSAA@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] clk: renesas: cpg-mssr: Add support for R-Car V4H
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
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

Hi Shimoda-san,

On Mon, Apr 25, 2022 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Initial CPG support for R-Car V4H (r8a779g0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * r8a779g0 Clock Pulse Generator / Module Standby and Software Reset
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + *
> + * Based on r8a779g0-cpg-mssr.c

I.e. based on itself? ;-)

> +static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
> +       /* External Clock Inputs */
> +       DEF_INPUT("extal",      CLK_EXTAL),
> +       DEF_INPUT("extalr",     CLK_EXTALR),
> +
> +       /* Internal Core Clocks */
> +       DEF_BASE(".main", CLK_MAIN,     CLK_TYPE_GEN4_MAIN, CLK_EXTAL),
> +       DEF_BASE(".pll1", CLK_PLL1,     CLK_TYPE_GEN4_PLL1, CLK_MAIN),
> +       DEF_BASE(".pll2", CLK_PLL2,     CLK_TYPE_GEN4_PLL2, CLK_MAIN),
> +       DEF_BASE(".pll3", CLK_PLL3,     CLK_TYPE_GEN4_PLL3, CLK_MAIN),
> +       DEF_BASE(".pll4", CLK_PLL4,     CLK_TYPE_GEN4_PLL4, CLK_MAIN),
> +       DEF_BASE(".pll5", CLK_PLL5,     CLK_TYPE_GEN4_PLL5, CLK_MAIN),
> +       DEF_BASE(".pll6", CLK_PLL6,     CLK_TYPE_GEN4_PLL6, CLK_MAIN),
> +
> +       DEF_FIXED(".pll1_div2", CLK_PLL1_DIV2,  CLK_PLL1,       2, 1),
> +       DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2,  CLK_PLL2,       2, 1),
> +       DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2,  CLK_PLL3,       2, 1),
> +       DEF_FIXED(".pll4_div2", CLK_PLL4_DIV2,  CLK_PLL4,       2, 1),
> +       DEF_FIXED(".pll5_div2", CLK_PLL5_DIV2,  CLK_PLL5,       2, 1),
> +       DEF_FIXED(".pll5_div4", CLK_PLL5_DIV4,  CLK_PLL5_DIV2,  2, 1),
> +       DEF_FIXED(".pll6_div2", CLK_PLL6_DIV2,  CLK_PLL6,       2, 1),
> +       DEF_FIXED(".s0",        CLK_S0,         CLK_PLL1_DIV2,  2, 1),
> +       DEF_FIXED(".s0_vio",    CLK_S0_VIO,     CLK_PLL1_DIV2,  2, 1),
> +       DEF_FIXED(".s0_vc",     CLK_S0_VC,      CLK_PLL1_DIV2,  2, 1),
> +       DEF_FIXED(".s0_hsc",    CLK_S0_HSC,     CLK_PLL1_DIV2,  2, 1),
> +       DEF_FIXED(".sv_vip",    CLK_SV_VIP,     CLK_PLL1_DIV2,  2, 1),

CLK_SV_VIP runs at 640 instead of 800 MHz, so CLK_PLL1 / 5?

> +       DEF_FIXED(".sv_ir",     CLK_SV_IR,      CLK_PLL1_DIV2,  2, 1),

Likewise for CLK_SV_IR.

> +       DEF_BASE(".sdsrc",      CLK_SDSRC,      CLK_TYPE_GEN4_SDSRC, CLK_PLL5),
> +       DEF_RATE(".oco",        CLK_OCO,        32768),
> +
> +       DEF_BASE(".rpcsrc",     CLK_RPCSRC,             CLK_TYPE_GEN4_RPCSRC, CLK_PLL5),
> +       DEF_BASE(".rpc",        R8A779G0_CLK_RPC,       CLK_TYPE_GEN4_RPC, CLK_RPCSRC),

"rpc".

> +       DEF_BASE("rpcd2",       R8A779G0_CLK_RPCD2,     CLK_TYPE_GEN4_RPCD2, R8A779G0_CLK_RPC),

Please move "rpc" and "rpcd2" to Core Clock Outputs below,
as they are not Internal Core Clocks.

> +       DEF_FIXED(".vio",       CLK_VIO,        CLK_PLL5_DIV2,  3, 1),
> +       DEF_FIXED(".vc",        CLK_VC,         CLK_PLL5_DIV2,  3, 1),
> +
> +       /* Core Clock Outputs */
> +       DEF_FIXED("s0d2",       R8A779G0_CLK_S0D2,      CLK_S0,         2, 1),
> +       DEF_FIXED("s0d3",       R8A779G0_CLK_S0D3,      CLK_S0,         3, 1),
> +       DEF_FIXED("s0d4",       R8A779G0_CLK_S0D4,      CLK_S0,         4, 1),
> +       DEF_FIXED("cl16m",      R8A779G0_CLK_CL16M,     CLK_S0,         48, 1),
> +       DEF_FIXED("s0d1_vio",   R8A779G0_CLK_S0D1_VIO,  CLK_S0_VIO,     1, 1),
> +       DEF_FIXED("s0d2_vio",   R8A779G0_CLK_S0D2_VIO,  CLK_S0_VIO,     2, 1),
> +       DEF_FIXED("s0d4_vio",   R8A779G0_CLK_S0D4_VIO,  CLK_S0_VIO,     4, 1),
> +       DEF_FIXED("s0d8_vio",   R8A779G0_CLK_S0D8_VIO,  CLK_S0_VIO,     8, 1),
> +       DEF_FIXED("s0d1_vc",    R8A779G0_CLK_S0D1_VC,   CLK_S0_VC,      1, 1),
> +       DEF_FIXED("s0d2_vc",    R8A779G0_CLK_S0D2_VC,   CLK_S0_VC,      2, 1),
> +       DEF_FIXED("s0d4_vc",    R8A779G0_CLK_S0D4_VC,   CLK_S0_VC,      4, 1),
> +       DEF_FIXED("s0d2_mm",    R8A779G0_CLK_S0D2_MM,   CLK_S0,         2, 1),
> +       DEF_FIXED("s0d4_mm",    R8A779G0_CLK_S0D4_MM,   CLK_S0,         4, 1),
> +       DEF_FIXED("cl16m_mm",   R8A779G0_CLK_CL16M_MM,  CLK_S0,         48, 1),
> +       DEF_FIXED("s0d2_u3dg",  R8A779G0_CLK_S0D2_U3DG, CLK_S0,         2, 1),
> +       DEF_FIXED("s0d4_u3dg",  R8A779G0_CLK_S0D4_U3DG, CLK_S0,         4, 1),
> +       DEF_FIXED("s0d2_rt",    R8A779G0_CLK_S0D2_RT,   CLK_S0,         2, 1),
> +       DEF_FIXED("s0d3_rt",    R8A779G0_CLK_S0D3_RT,   CLK_S0,         3, 1),
> +       DEF_FIXED("s0d4_rt",    R8A779G0_CLK_S0D4_RT,   CLK_S0,         4, 1),
> +       DEF_FIXED("s0d6_rt",    R8A779G0_CLK_S0D6_RT,   CLK_S0,         6, 1),
> +       DEF_FIXED("s0d24_rt",   R8A779G0_CLK_S0D24_RT,  CLK_S0,         24, 1),
> +       DEF_FIXED("cl16m_rt",   R8A779G0_CLK_CL16M_RT,  CLK_S0,         48, 1),
> +       DEF_FIXED("s0d2_per",   R8A779G0_CLK_S0D2_PER,  CLK_S0,         2, 1),
> +       DEF_FIXED("s0d3_per",   R8A779G0_CLK_S0D3_PER,  CLK_S0,         3, 1),

Missing "s0d4_per".

> +       DEF_FIXED("s0d6_per",   R8A779G0_CLK_S0D6_PER,  CLK_S0,         6, 1),
> +       DEF_FIXED("s0d12_per",  R8A779G0_CLK_S0D12_PER, CLK_S0,         12, 1),
> +       DEF_FIXED("s0d24_per",  R8A779G0_CLK_S0D24_PER, CLK_S0,         24, 1),
> +       DEF_FIXED("cl16m_per",  R8A779G0_CLK_CL16M_PER, CLK_S0,         48, 1),
> +       DEF_FIXED("s0d1_hsc",   R8A779G0_CLK_S0D1_HSC,  CLK_S0_HSC,     1, 1),
> +       DEF_FIXED("s0d2_hsc",   R8A779G0_CLK_S0D2_HSC,  CLK_S0_HSC,     2, 1),
> +       DEF_FIXED("s0d4_hsc",   R8A779G0_CLK_S0D4_HSC,  CLK_S0_HSC,     4, 1),
> +       DEF_FIXED("cl16m_hsc",  R8A779G0_CLK_CL16M_HSC, CLK_S0_HSC,     48, 1),
> +       DEF_FIXED("s0d2_cc",    R8A779G0_CLK_S0D2_CC,   CLK_S0,         2, 1),
> +       DEF_FIXED("svd1_ir",    R8A779G0_CLK_SVD1_IR,   CLK_SV_IR,      1, 1),
> +       DEF_FIXED("svd2_ir",    R8A779G0_CLK_SVD2_IR,   CLK_SV_IR,      2, 1),
> +       DEF_FIXED("svd1_vip",   R8A779G0_CLK_SVD1_VIP,  CLK_SV_VIP,     1, 1),
> +       DEF_FIXED("svd2_vip",   R8A779G0_CLK_SVD2_VIP,  CLK_SV_VIP,     2, 1),
> +       DEF_FIXED("s0d2_cc",    R8A779G0_CLK_S0D2_CC,   CLK_S0,         2, 1),

"s0d2_cc" is already defined 5 lines above.

> +       DEF_FIXED("cbfusa",     R8A779G0_CLK_CBFUSA,    CLK_EXTAL,      2, 1),
> +       DEF_FIXED("cpex",       R8A779G0_CLK_CPEX,      CLK_EXTAL,      2, 1),
> +       DEF_FIXED("viobus",     R8A779G0_CLK_VIOBUS,    CLK_VIO,        1, 1),
> +       DEF_FIXED("viobusd2",   R8A779G0_CLK_VIOBUSD2,  CLK_VIO,        2, 1),
> +       DEF_FIXED("vcbus",      R8A779G0_CLK_VCBUS,     CLK_VC,         1, 1),
> +       DEF_FIXED("vcbusd2",    R8A779G0_CLK_VCBUSD2,   CLK_VC,         2, 1),
> +
> +       DEF_GEN4_SD("sd0",      R8A779G0_CLK_SD0,       CLK_SDSRC,      0x870),
> +       DEF_DIV6P1("mso",       R8A779G0_CLK_MSO,       CLK_PLL5_DIV4,  0x87c),
> +
> +       DEF_GEN4_OSC("osc",     R8A779G0_CLK_OSC,       CLK_EXTAL,      8),
> +       DEF_GEN4_MDSEL("r",     R8A779G0_CLK_R, 29, CLK_EXTALR, 1, CLK_OCO, 1),
> +};
> +
> +static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
> +       DEF_MOD("hscif0",       514,    R8A779G0_CLK_S0D3_PER),
> +       DEF_MOD("hscif1",       515,    R8A779G0_CLK_S0D3_PER),
> +       DEF_MOD("hscif2",       516,    R8A779G0_CLK_S0D3_PER),
> +       DEF_MOD("hscif3",       517,    R8A779G0_CLK_S0D3_PER),
> +};
> +
> +/*
> + * CPG Clock Data
> + */
> +/*
> + *   MD         EXTAL          PLL1    PLL2    PLL3    PLL4    PLL5    PLL6    OSC
> + * 14 13 (MHz)
> + * ----------------------------------------------------------------

You may want to make the horizontal line longer.

> + * 0  0         16.66 / 1      x192    x204    x192    x144    x192    x168    /8
> + * 0  1         20    / 1      x160    x170    x160    x120    x160    x140    /8
> + * 1  0         Prohibited setting
> + * 1  1         33.33 / 2      x192    x204    x192    x144    x192    x168    /8

The last column values (OSC) should be /15, /19, resp. /38.

> + */
> +#define CPG_PLL_CONFIG_INDEX(md)       ((((md) & BIT(14)) >> 13) | \
> +                                        (((md) & BIT(13)) >> 13))
> +
> +static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] = {
> +       /* EXTAL div    PLL1 mult/div   PLL2 mult/div   PLL3 mult/div   PLL4 mult/div   PLL5 mult/div   PLL6 mult/div   OSC prediv */
> +       { 1,            192,    1,      204,    1,      192,    1,      144,    1,      192,    1,      168,    1,      8,      },
> +       { 1,            160,    1,      170,    1,      160,    1,      120,    1,      160,    1,      140,    1,      8,      },
> +       { 0,            0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      },
> +       { 2,            192,    1,      204,    1,      192,    1,      144,    1,      192,    1,      168,    1,      8,      },

The last column values should be 15, 19, 0, resp. 38.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
