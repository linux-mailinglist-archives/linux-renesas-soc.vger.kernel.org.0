Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4E3514588
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 11:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356661AbiD2JmS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 05:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356615AbiD2JmP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 05:42:15 -0400
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D46CBCB64;
        Fri, 29 Apr 2022 02:38:58 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id kc16so4061656qvb.7;
        Fri, 29 Apr 2022 02:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nudFKhXjhEig6BzP6/5oc0q5ZOTrxAigg1sCcPr3Rtk=;
        b=nNqe7a2WgxN9D7wlwR55Ny+aDKW4SS6fLWmyPPpIYiDvFY0lN1xvcwT8ZPBGI6gNER
         DTwVV10FHlbA+i+vZkwucrgD4scjBQN7vhD5Dgk9hoW+O39ULY4aj7eMscYxtiZc7QGq
         TpXvTF8NWuzJaDRn0Opi715hEi2ES0DtBndjpPBEwpp9ps5rC91AqlZWgiSDIO8s06He
         KYsfEWEG/WNvyb/IRO2SDUwyVtgBslDnmLckrLMAS9Ruikf4RN5/8LRNNSTcCqjmday/
         rZ3U5bItVZvuZjAwV1eVeg0rv11lDNDR/47DKje4ewYdtzSihIFa4GKHcFMAN0RXCQs3
         PBrg==
X-Gm-Message-State: AOAM532P6VxCK7ZSfaWnZnYkNmwEHY+NfA46er7rBxEGIuPZjFdiGib+
        TPQFaHx9czYNa0cOncLZkvGT4LfveYYF2qDv
X-Google-Smtp-Source: ABdhPJyo7cb2SFLEFDTogUbH9v0ddrTmoMs4fH0Y4Y2ehAz0QxNzADM2/8Ijaw96hOf+FO73Xte3Mw==
X-Received: by 2002:a0c:fc4a:0:b0:456:3d44:9771 with SMTP id w10-20020a0cfc4a000000b004563d449771mr15812298qvp.53.1651225137635;
        Fri, 29 Apr 2022 02:38:57 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 9-20020a05620a070900b0069e60da45aasm1185328qkc.60.2022.04.29.02.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 02:38:57 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-2f16645872fso79364457b3.4;
        Fri, 29 Apr 2022 02:38:56 -0700 (PDT)
X-Received: by 2002:a81:1cd5:0:b0:2f4:c3fc:2174 with SMTP id
 c204-20020a811cd5000000b002f4c3fc2174mr37706998ywc.512.1651225136357; Fri, 29
 Apr 2022 02:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220427094823.3319-1-biju.das.jz@bp.renesas.com> <20220427094823.3319-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220427094823.3319-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Apr 2022 11:38:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUo6J7_hfsoDYprMc7Tk79D4FxQiXJ7hFH8s_6nzptsUw@mail.gmail.com>
Message-ID: <CAMuHMdUo6J7_hfsoDYprMc7Tk79D4FxQiXJ7hFH8s_6nzptsUw@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] clk: renesas: rzg2l: Add DSI divider clk support
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

On Wed, Apr 27, 2022 at 11:48 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> M3 clock is sourced from DSI Divider (DSIDIVA * DSIDIVB)
>
> This patch add support for DSI divider clk by combining
> DSIDIVA and DSIDIVB .
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> V1->V2:
>  * Replaced round_rate with determine_rate
>  * Update rate variable during set_rate
>  * Added get_vclk_parent_rate helper function
>  * Replaced pll5_params with mux_dsi_div_params for dsi div values.

Thanks for the update!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c

> +static unsigned long rzg2l_cpg_get_vclk_parent_rate(struct clk_hw *hw,
> +                                                   unsigned long rate)
> +{
> +       unsigned long parent_rate;

Please drop the blank line.

> +
> +       struct dsi_div_hw_data *dsi_div = to_dsi_div_hw_data(hw);
> +       struct rzg2l_cpg_priv *priv = dsi_div->priv;
> +       struct rzg2l_pll5_param params;

Reverse Xmas tree order?

> +
> +       parent_rate = rzg2l_cpg_get_foutpostdiv_rate(&params, rate);
> +
> +       if (priv->mux_dsi_div_params.clksrc)
> +               parent_rate /= 2;
> +
> +       return parent_rate;
> +}
> +
> +static int rzg2l_cpg_dsi_div_determine_rate(struct clk_hw *hw,
> +                                           struct clk_rate_request *req)
> +{
> +       req->best_parent_rate = rzg2l_cpg_get_vclk_parent_rate(hw, req->rate);
> +
> +       return 0;

So any value of req->rate passed is supported, and req->rate never
needs to be updated?

> +}
> +
> +static int rzg2l_cpg_dsi_div_set_rate(struct clk_hw *hw,
> +                                     unsigned long rate,
> +                                     unsigned long parent_rate)
> +{
> +       struct dsi_div_hw_data *dsi_div = to_dsi_div_hw_data(hw);
> +       struct rzg2l_cpg_priv *priv = dsi_div->priv;
> +
> +       /*
> +        * MUX -->DIV_DSI_{A,B} -->M3 -->VCLK
> +        *
> +        * Based on the dot clock, the DSI divider clock sets the divider value,
> +        * calculates the pll parameters for generating FOUTPOSTDIV and the clk
> +        * source for the MUX and propagates that info to the parents.
> +        */
> +
> +       if (!rate)
> +               return -EINVAL;
> +
> +       dsi_div->rate = rate;

So any non-zero value of rate is supported?

> +       writel(CPG_PL5_SDIV_DIV_DSI_A_WEN | CPG_PL5_SDIV_DIV_DSI_B_WEN |
> +              (priv->mux_dsi_div_params.dsi_div_a << 0) |
> +              (priv->mux_dsi_div_params.dsi_div_b << 8),
> +              priv->base + CPG_PL5_SDIV);
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
