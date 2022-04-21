Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFDC5099B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 09:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358914AbiDUHsy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 03:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386466AbiDUHsR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 03:48:17 -0400
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9BD51CFEA;
        Thu, 21 Apr 2022 00:44:25 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id b17so3101234qvf.12;
        Thu, 21 Apr 2022 00:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x/C2V/rznWNGQsuCioSZMR+9YfGIDZLNLCJXl9I/3O4=;
        b=fTuhfU0fYXsW6MG2UWNALBQ/FbeqZGsO6YMuq+L4+BoArIX+tfg96N/6I2Hfyk8vEK
         0s3UPqXA9iQZEnD4CBZ8FXc5h6pgUIQ7XoqcHhx6E4LxKorpX1g8mLuLYtZYV4SiG3m4
         PhwtqqWJuQNvGg1th0loCpanJ44RwD/vbmYhKlpikken2IL9K8upxc0sQsGVigCBdRFT
         jG+Kr9AbX7HHcU6Kmv7SGqH0/7nQ9mPN/b4yPEYy69nU/GQW88XhbPugRldBHr/wWxVJ
         ETMfzldoA+0s3lW2g8NKeBKm7s6bT0ski5FS2mPncGc/DmTgTtd5/DIkY3YdcIKwfIxJ
         nbuw==
X-Gm-Message-State: AOAM531uIJXvKsyprxtyqVbJRcN3l8bkHjHO36kMZfJcGarPjEccRkrM
        4V8pPziILD9Mq9d5QDa2pMY0xexvEHkP392S
X-Google-Smtp-Source: ABdhPJx8vKTzNVDpLH71rcLks7RrdZ8nJdMfnH67uYlsa4Akm/VHF0SjBsEer0ttqQdlGINFW3yIhQ==
X-Received: by 2002:a05:6214:2268:b0:446:66a8:85ca with SMTP id gs8-20020a056214226800b0044666a885camr11692061qvb.21.1650527064925;
        Thu, 21 Apr 2022 00:44:24 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id k14-20020ac85fce000000b002f344fc0e0bsm1824729qta.38.2022.04.21.00.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 00:44:24 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id j2so7299171ybu.0;
        Thu, 21 Apr 2022 00:44:24 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr24106688ybq.393.1650527064136; Thu, 21
 Apr 2022 00:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220318175113.8956-1-biju.das.jz@bp.renesas.com> <20220318175113.8956-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220318175113.8956-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Apr 2022 09:44:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWvk9_Lr4VfGERrV4L7Q78v_zrZN-iS7p5ioxUUBGdT5Q@mail.gmail.com>
Message-ID: <CAMuHMdWvk9_Lr4VfGERrV4L7Q78v_zrZN-iS7p5ioxUUBGdT5Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] clk: renesas: rzg2l: Add FOUTPOSTDIV clk support
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
> PLL5 generates FOUTPOSTDIV clk and is sourced by LCDC/DSI modules.
> The FOUTPOSTDIV is connected to PLL5_4 MUX. Video clock is sourced
> from DSI divider which is connected to PLL5_4 MUX.
>
> This patch adds support for generating FOUTPOSTDIV clk.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> RFC->V1:
>  * Removed LUT.
>  * Replaced magic numbers with macros.

Thanks for the update!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c

> @@ -266,6 +278,131 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
>         return clk_hw->clk;
>  }
>
> +struct sipll5 {
> +       struct clk_hw hw;
> +       u32 conf;
> +       struct rzg2l_cpg_priv *priv;
> +};
> +
> +#define to_sipll5(_hw) container_of(_hw, struct sipll5, hw)
> +
> +static unsigned long rzg2l_cpg_sipll5_recalc_rate(struct clk_hw *hw,
> +                                                 unsigned long parent_rate)
> +{
> +       struct sipll5 *sipll5 = to_sipll5(hw);
> +       struct rzg2l_cpg_priv *priv = sipll5->priv;
> +
> +       return priv->pll5_params.frequency;
> +}
> +
> +static long rzg2l_cpg_sipll5_round_rate(struct clk_hw *hw,
> +                                       unsigned long rate,
> +                                       unsigned long *parent_rate)
> +{
> +       struct sipll5 *sipll5 = to_sipll5(hw);
> +       struct rzg2l_cpg_priv *priv = sipll5->priv;
> +
> +       return priv->pll5_params.frequency;
> +}
> +
> +static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
> +                                    unsigned long rate,
> +                                    unsigned long parent_rate)
> +{

The above 3 functions all ignore their input rates and parent_rates,
as you rely on setting up pll5_params in the DSI divider (patch 3),
and the clock core propagating up to all parents (PLL5_4 in patch 2,
and FOUTPOSDIV here), right?

I think it would help to document that somewhere.

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
