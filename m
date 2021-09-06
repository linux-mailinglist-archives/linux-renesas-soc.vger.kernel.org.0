Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 580C9401AAE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 13:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238449AbhIFLpy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 07:45:54 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:36539 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240647AbhIFLpw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 07:45:52 -0400
Received: by mail-vs1-f46.google.com with SMTP id f6so5333772vsr.3;
        Mon, 06 Sep 2021 04:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qT+RPNqUJrJ5QS4YltqwhL61gcCN6tcrHJJtOD0o0o0=;
        b=aU+uoAEHWNyL2tXbh/ds/1JqBROXLYBWIA+K/qlJzWPVK3hsuENAChP3GIWvipihou
         fhKp2QCAC5ayE+z0zruQ9YbgrsqqsY/UDnmM/NsZTpV/uYuBB0fnxMUHHA8PCUbvlDpZ
         WGgtgDGvEEvSSoPPm34iXGqaCll9OzGZ/leMPBF+3T7QQGDtL9x4nCt4fR3RVzrGaOG0
         +61d7NJKLvyDZOlU8nUJSndQDp/dqINcpdZgjcV7HG7ReSfRiO8MX62dMmiry9MSAXMo
         CXqCXaShKpiNymXi+3EYOkhTFUdAuqsFQVFJhlBYxabWkhvDWdbFJ1ZSFQrO+wyOeAeh
         kWeA==
X-Gm-Message-State: AOAM532rR9l5iUr5VBJ5cdN3Xwl8g7Ri2vUuZcmxq64p4dCJzDHPJaSX
        asru1ANz0kyoh447+CRPyp2ZIS4rt1tUHPA8OwpWnBlVLxA=
X-Google-Smtp-Source: ABdhPJwNXJdRzpPNaN3Py+w3o0QlOdJ8K6BagSdwNo8cfz/qflOuHC28ZqvwirUaL4M0sycvbmOtNBNjQf1qY7/CRbs=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr5367592vsl.9.1630928687797;
 Mon, 06 Sep 2021 04:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210804180803.29087-1-biju.das.jz@bp.renesas.com> <20210804180803.29087-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210804180803.29087-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Sep 2021 13:44:36 +0200
Message-ID: <CAMuHMdVSSf6B8k0HeuhSbQ=_SEiRkaBmQbHUm5Jx1ks+a5UQFg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drivers: clk: renesas: rzg2l-cpg: Add SDHI clk mux support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Aug 4, 2021 at 8:08 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SDHI clk mux support to select SDHI clock from different clock
> sources.
>
> As per HW manual, direct clock switching from 533MHz to 400MHz and
> vice versa is not recommended. So added support for handling this
> in mux.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -55,6 +55,15 @@
>  #define GET_REG_SAMPLL_CLK1(val)       ((val >> 22) & 0xfff)
>  #define GET_REG_SAMPLL_CLK2(val)       ((val >> 12) & 0xfff)
>
> +struct sd_hw_data {
> +       struct clk_hw hw;
> +       u32 conf;
> +       u32 mux_flags;

Do you need mux_flags? Or can this be hardcoded to zero?

> +       struct rzg2l_cpg_priv *priv;
> +};
> +
> +#define to_sd_hw_data(_hw)     container_of(_hw, struct sd_hw_data, hw)
> +
>  /**
>   * struct rzg2l_cpg_priv - Clock Pulse Generator Private Data
>   *
> @@ -150,6 +159,100 @@ rzg2l_cpg_mux_clk_register(const struct cpg_core_clk *core,
>         return clk_hw->clk;
>  }
>
> +static int rzg2l_cpg_sd_clk_mux_determine_rate(struct clk_hw *hw,
> +                                              struct clk_rate_request *req)
> +{
> +       struct sd_hw_data *hwdata = to_sd_hw_data(hw);
> +
> +       return clk_mux_determine_rate_flags(hw, req, hwdata->mux_flags);
> +}
> +
> +static int rzg2l_cpg_sd_clk_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct sd_hw_data *hwdata = to_sd_hw_data(hw);
> +       struct rzg2l_cpg_priv *priv = hwdata->priv;
> +       u32 off = GET_REG_OFFSET(hwdata->conf);
> +       u32 shift = GET_SHIFT(hwdata->conf);
> +       const u32 clk_src_266 = 2;
> +       u32 bitmask;
> +
> +       /*
> +        * As per the HW manual, we should not directly switch from 533 MHz to
> +        * 400 MHz and vice versa. To change the setting from 2’b01 (533 MHz)
> +        * to 2’b10 (400 MHz) or vice versa, Switch to 2’b11 (266 MHz) first,
> +        * and then switch to the target setting (2’b01 (533 MHz) or 2’b10
> +        * (400 MHz)).
> +        * Setting a value of '0' to the SEL_SDHI0_SET or SEL_SDHI1_SET clock
> +        * switching register is prohibited.
> +        * The clock mux has 3 input clocks(533 MHz,400 MHz, and 266 MHz), and
> +        * the index to value mapping is done by adding 1 to the index.
> +        */
> +       bitmask = (GENMASK(GET_WIDTH(hwdata->conf) - 1, 0) << shift) << 16;
> +       if (index != clk_src_266)
> +               writel(bitmask | ((clk_src_266 + 1) << shift), priv->base + off);

I'm wondering if you should poll (using readl_poll_timeout()) until
the CPG_CLKSTATUS.SELSDHIx_STS bit is cleared, to indicate switching
has completed?

> +
> +       writel(bitmask | ((index + 1) << shift), priv->base + off);
> +
> +       return 0;
> +}
> +
> +static u8 rzg2l_cpg_sd_clk_mux_get_parent(struct clk_hw *hw)
> +{
> +       struct sd_hw_data *hwdata = to_sd_hw_data(hw);
> +       struct rzg2l_cpg_priv *priv = hwdata->priv;
> +       u32 val = readl(priv->base + GET_REG_OFFSET(hwdata->conf));
> +
> +       val >>= GET_SHIFT(hwdata->conf);
> +       val &= GENMASK(GET_WIDTH(hwdata->conf) - 1, 0);
> +       if (val)
> +               val--;
> +       else
> +               /* Prohibited clk source, change it to 533 MHz(reset value) */
> +               rzg2l_cpg_sd_clk_mux_set_parent(hw, 0);

Please add curly braces (to both branches).

> +
> +       return val;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
