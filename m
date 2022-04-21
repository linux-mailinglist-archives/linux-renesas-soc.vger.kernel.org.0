Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3DE509A11
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 10:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235079AbiDUIFh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 04:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiDUIFg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 04:05:36 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACCE11DA42;
        Thu, 21 Apr 2022 01:02:47 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id d198so3007981qkc.12;
        Thu, 21 Apr 2022 01:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JS19xcD6LNTnBbdmni9cWeEjFiCX9oJ/TIi1UwXhMpI=;
        b=mvQ54pJxvqebhCaZNE2Bw31fV7RTVVMaiWdhgZXteR3vAkC5h6kLEQmu8dHzIG4U1L
         Y7cc9ZojtjpUx36eSEJyyvTAfcFG8PWFlXqaatNzd3xLeX6bevA4rh47gnaglLxVRGY1
         z3vJGvNru1HsfrjiqriK94FBNrfynsm/7ySFxuwmtQlB6BiTwdcrIeIFxM0eV/2+eup4
         5xU0cIi6xWk27nfvKb9//D7sIQcT6PH4wl/geIL9KKQGAuQG3B4yeFYUvR/wukILpYjm
         M2HAeG8XeFYxFyCvpVxdpWpvDEQbIMIKMjL7dVRbUgclcj627fbvbqVJYudu030fT3S8
         mbuQ==
X-Gm-Message-State: AOAM533yZ68Ii9O9FxIvwlnHf4h4/1ccdGn+fAru5Cj3WXocykm65D+3
        rTf+sKvJv3dYAu9IMHB+SkPOQjRmznD8EW9R
X-Google-Smtp-Source: ABdhPJxDFA0skZ5QIZmolP71GNLDZf+TjicyIaOS6MB+V8z2qsRSUVljbmDAlqQDJKjABLuPWn/42Q==
X-Received: by 2002:a05:620a:1495:b0:69e:6de0:e8f1 with SMTP id w21-20020a05620a149500b0069e6de0e8f1mr14777099qkj.426.1650528166603;
        Thu, 21 Apr 2022 01:02:46 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id u129-20020a376087000000b0067e401d7177sm2765649qkb.3.2022.04.21.01.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 01:02:46 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-2edbd522c21so43248927b3.13;
        Thu, 21 Apr 2022 01:02:46 -0700 (PDT)
X-Received: by 2002:a81:6ccb:0:b0:2f1:68f1:d90e with SMTP id
 h194-20020a816ccb000000b002f168f1d90emr22742571ywc.62.1650528165845; Thu, 21
 Apr 2022 01:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220318175113.8956-1-biju.das.jz@bp.renesas.com> <20220318175113.8956-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220318175113.8956-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Apr 2022 10:02:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9Rt6_VQ4oU-FAAM=vdrG22Qc2yBHTrEd-NrAu3FejWw@mail.gmail.com>
Message-ID: <CAMuHMdV9Rt6_VQ4oU-FAAM=vdrG22Qc2yBHTrEd-NrAu3FejWw@mail.gmail.com>
Subject: Re: [PATCH 3/9] clk: renesas: rzg2l: Add DSI divider clk support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Biju,

On Fri, Mar 18, 2022 at 6:51 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> M3 clock is sourced from DSI Divider (DSIDIVA * DSIDIVB)
>
> This patch add support for DSI divider clk by combaining
> DSIDIVA and DSIDIVB .
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> RFC->V1
>  * Removed LUT and added an equation for computing VCLK.

Thanks for the update!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -279,6 +282,114 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
>         return clk_hw->clk;
>  }
>
> +struct dsi_div_hw_data {
> +       struct clk_hw hw;
> +       u32 conf;
> +       unsigned long rate;
> +       struct rzg2l_cpg_priv *priv;
> +};
> +
> +#define to_dsi_div_hw_data(_hw)        container_of(_hw, struct dsi_div_hw_data, hw)
> +
> +static unsigned long rzg2l_cpg_dsi_div_recalc_rate(struct clk_hw *hw,
> +                                                  unsigned long parent_rate)
> +{
> +       struct dsi_div_hw_data *dsi_div = to_dsi_div_hw_data(hw);
> +
> +       return dsi_div->rate;
> +}
> +
> +static long rzg2l_cpg_dsi_div_round_rate(struct clk_hw *hw,
> +                                        unsigned long rate,
> +                                        unsigned long *parent_rate)

Please implement the determine_rate() instead.

> +

Please drop the blank line.

> +{
> +       struct dsi_div_hw_data *dsi_div = to_dsi_div_hw_data(hw);
> +       struct rzg2l_cpg_priv *priv = dsi_div->priv;
> +
> +       dsi_div->rate = rate;
> +
> +       priv->pll5_params.pl5_intin = rate / MEGA;

.round_rate() (and .determine_rate()) is used to check if a rate
is supported, without actually changing the clock rate.  Hence this
should not operate on priv->pll5_params, but on a local variable.

> +       priv->pll5_params.pl5_fracin = ((rate % MEGA) << 24) / MEGA;

While this works fine on 64-bit (RZ/G2L is arm64, so that's OK),
"(rate % MEGA) << 24" will overflow when compile-testing on 32-bit.
Taking into account the 64-by-32 division, I think this should be:

    div_u64(((u64)rate % MEGA) << 24, MEGA);

> +       priv->pll5_params.pl5_refdiv = 2;
> +       priv->pll5_params.pl5_postdiv1 = 1;
> +       priv->pll5_params.pl5_postdiv2 = 1;
> +       priv->pll5_params.clksrc = 1;
> +       priv->pll5_params.dsi_div_a = 1;
> +       priv->pll5_params.dsi_div_b = 2;
> +
> +       priv->pll5_params.frequency =
> +               EXTAL_FREQ_IN_MEGA_HZ * MEGA / priv->pll5_params.pl5_refdiv *
> +               ((((priv->pll5_params.pl5_intin << 24) + priv->pll5_params.pl5_fracin)) >> 24) /
> +               (priv->pll5_params.pl5_postdiv1 * priv->pll5_params.pl5_postdiv2);
> +
> +       if (priv->pll5_params.clksrc)
> +               priv->pll5_params.frequency /= 2;
> +
> +       *parent_rate = priv->pll5_params.frequency;
> +
> +       return dsi_div->rate;
> +}
> +
> +static int rzg2l_cpg_dsi_div_set_rate(struct clk_hw *hw,
> +                                     unsigned long rate,
> +                                     unsigned long parent_rate)
> +{
> +       struct dsi_div_hw_data *dsi_div = to_dsi_div_hw_data(hw);
> +       struct rzg2l_cpg_priv *priv = dsi_div->priv;
> +

You should update priv->pll5_params here, instead of in your
.round_rate() callback.

> +       writel(CPG_PL5_SDIV_DIV_DSI_A_WEN | CPG_PL5_SDIV_DIV_DSI_B_WEN |
> +              (priv->pll5_params.dsi_div_a << 0) | (priv->pll5_params.dsi_div_b << 8),
> +              priv->base + CPG_PL5_SDIV);
> +
> +       return 0;
> +}

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
