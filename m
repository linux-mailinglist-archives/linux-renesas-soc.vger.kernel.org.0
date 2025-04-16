Return-Path: <linux-renesas-soc+bounces-16049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA69A8B547
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 11:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96D4B3AEBE4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 09:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156F0235355;
	Wed, 16 Apr 2025 09:27:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9BD22D7BC;
	Wed, 16 Apr 2025 09:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795644; cv=none; b=CRdr7rUJzf1pRgeA+0TR38frvalCIt9hTwaaQFvBp+PsYqIrIFWOxCIkx1Fukk1KdKYTrdjWxG1QeJTEBox6jzhWY1+x88/LG1fYKUapZX4DLnLehfo2STXYuslvqhQvkAMBWXNVeNQ8brh2epRZTl570ZkWfFXoWcndMzHjycM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795644; c=relaxed/simple;
	bh=B/IWSgC0/On79Ve4Br1YcvgW9dqIwkatN7TcDV9DG0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/kUz/CPn1/UUfB5I3ODQR4AR3/RlwbH6JfS61y1VgWiWJ90DAiuci32ztCvxcAqutOkwOadbH7STUtr9tm9iNJe+/IOcWs61+H+uBX5Z2LJqhMK1+LsbDdRj0ypZIduEH5FVYskGY2ad1HyvTpoAIxpuH0/z1dEAV7lEkPC6+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-52410fb2afeso5046229e0c.3;
        Wed, 16 Apr 2025 02:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744795638; x=1745400438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPBOJO5UG+x/dngfvQ5zlWtvDGsvqEQXdZ75xyrthRw=;
        b=iUdILMTI81JVQSmn/b6mpjStm9JrHa0pvC7DO31GsYnyuNq0Z7Q/d7fizOisQp+tSD
         GIcUwVbAuiH0SQimuLbRZsNIFZdR6ogsbY9ZGErsTYWQulQyADcloHOYOYjnYDb2/Ksi
         Nd7JR6945mHJ+NOFAIGzZVFss+i1TCTDbF7GJhz7TOfwevE214hU9N3XuHRte88jvzF7
         EgnbVlj1Ius1Q0gGfYeJX9mQ1t/PFuqDP8IkSQrtHa2KJblvqw4jwcxdDK6U540nnQM9
         uoWhQUzfF/DMLdGvwIlEI5BhzglN/AtiAHJOrAynclHaiXxG0/uFgoh6MB3MeySNZhGt
         teYA==
X-Forwarded-Encrypted: i=1; AJvYcCU5pPJcU0Ab5OyWa6zQNMsDmyRuaC49yAaS8Cmqm0U12ifcxtB8V9q6To1K0NkqgED0Jb3uRgOng8h6lShB@vger.kernel.org, AJvYcCULK2nu3YpHLe4KCslqdvyNT0z768BwVLHA4BVk4kLWux8l5bhFPNbLUI49zW6YCaQWy57BnTWrut5Z@vger.kernel.org, AJvYcCW7ESWwnLprJ+xVj4LpBCkJE0W1XoWnICKLl1kZ9o84ZFfGyA/Gmt0rS4CsdCMCwMc3TpP8onDxHsu+h9C5kXy8g38=@vger.kernel.org, AJvYcCWWnVwzeqCzhv8uOUU/4zrYzzfz3oqV+TP/zjJZ4gxHQKSdjg43STn+Kf7wxF//zjLyeGf7nU65znXv@vger.kernel.org
X-Gm-Message-State: AOJu0YwdOYShTZ+QuPnw3GhMeZme+KHNJBonOP1BCLIQXwhNARipQbCR
	jdOadQ+IiEO0GDYwcPbbCrbtCcUT6ssJbjDSNX43sn94QTCH7b4k3cWakZAc
X-Gm-Gg: ASbGncvFND+v2Y5ls0vOaREzymkJLFJEkcoAVxjhWCO1KtsaANG5+pnaVgLIqlz6BXu
	paCDfBEIuY9LXXTXxkhbfep9Ur+72nBJgStTn0XBLoAKixAnY/3wMovKcI/S1IaWoK4AhPncTfM
	iCc2V4Guyykola3TdVOrK3lPSA1tUMLa1giyUvC0GiwUCpKfvBU4WoI0LExUJoxkjoAnSHgjuWa
	0qxtg2VJPs4/zcjQKdQMK0mSLG105u2oFzsJ1SZ55stkSnohIGiDsZIMQpN2UBhMyM/4uxiim8J
	d2QxtFfnfvKQanDTthNd6+1xT8Ni7ok9dnfLGeZXqazLQBECz/qeaXJexIhYSuZWXvvl6z8TfK6
	18wZRNjg=
X-Google-Smtp-Source: AGHT+IFpthHu+PoWxTAafnd+xV30SI4d8ZMBk1OZJdw6fBEWF3rRusHEafTqDQe+bTUY5fzer9NC8g==
X-Received: by 2002:a05:6122:3c50:b0:526:1ddd:dcfd with SMTP id 71dfb90a1353d-5290da97e07mr420754e0c.0.1744795638314;
        Wed, 16 Apr 2025 02:27:18 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd4eab6sm3028294e0c.5.2025.04.16.02.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:27:17 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-524168b16d3so5662199e0c.0;
        Wed, 16 Apr 2025 02:27:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8/cTRc9AlVK/zfX1OLgCFUje0BskXK4N7COpCO/UMbRyDYOMT8+7GguL6akndQ3NRPoYiYceGguxCnb0OIYJsjtQ=@vger.kernel.org, AJvYcCUw8kWgU6U4OBY4Upkc0W57aqMmxG0KXGDdCDp50PbZKF52S/HWlUnKzBNPl22ED43P3Hch32VvdiuF@vger.kernel.org, AJvYcCVnXVeZ0o1EuCEszNWXb4NEbEUP7QMKdR+6N4pv3QDJp5Vs2TV+BJpraCDd5jWMRYX83LdtF+l1DFkt@vger.kernel.org, AJvYcCXgoAqypdu9n9GpTUrCSGBcLcoXuXK5i6yI4b/6gtIlJW8GmIyYdITGzsYnQtB4a9Na43Xa8JQ2HTWxnm9Q@vger.kernel.org
X-Received: by 2002:a05:6122:2a55:b0:520:6773:e5ba with SMTP id
 71dfb90a1353d-5290dd6d3f6mr493249e0c.2.1744795636873; Wed, 16 Apr 2025
 02:27:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250408200916.93793-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250408200916.93793-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Apr 2025 11:27:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjVEVh+dHKG_afZwyqsXwHj2FR7enHNrfuE9HJ0ELjEA@mail.gmail.com>
X-Gm-Features: ATxdqUHErCIXYLH43Ye7HXRW9FeYZxSAjZP0fHT2v6HHa72xBFJMLig-6M-q7Xg
Message-ID: <CAMuHMdVjVEVh+dHKG_afZwyqsXwHj2FR7enHNrfuE9HJ0ELjEA@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Prabhakar <prabhakar.csengg@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar, Fabrizio,

Thanks for your patch!

On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for PLLDSI and PLLDSI divider clocks.
>
> The `renesas-rzv2h-dsi.h` header file is added to share the PLL divider
> algorithm between the CPG and DSI drivers.

Please explain here why the DSI driver needs access to this algorithm.

> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> @@ -196,6 +225,253 @@ static int rzv2h_cpg_pll_clk_enable(struct clk_hw *hw)
>         return ret;
>  }
>
> +static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *hw,
> +                                                     unsigned long parent_rate)
> +{
> +       struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
> +       struct rzv2h_cpg_priv *priv = dsi_div->priv;
> +       struct ddiv ddiv = dsi_div->ddiv;
> +       u32 div;
> +
> +       div = readl(priv->base + ddiv.offset);
> +       div >>= ddiv.shift;
> +       div &= ((2 << ddiv.width) - 1);

Shouldn't that "2" be "1"?
GENMASK(ddiv.width - 1, 0), or even better: clk_div_mask(ddiv.width).

> +
> +       div = dsi_div->dtable[div].div;
> +
> +       return DIV_ROUND_CLOSEST_ULL(parent_rate, div);
> +}
> +
> +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> +                                              struct clk_rate_request *req)
> +{
> +       struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
> +       struct rzv2h_cpg_priv *priv = dsi_div->priv;
> +       struct rzv2h_plldsi_parameters *dsi_dividers = &priv->plldsi_div_parameters;
> +       unsigned long long rate_mhz;

u64?
Please use "millihz" instead of "mhz" everywhere, so it becomes very
clear this is really "mHz" and not "MHz".

> +
> +       /*
> +        * Adjust the requested clock rate (`req->rate`) to ensure it falls within
> +        * the supported range of 5.44 MHz to 187.5 MHz.
> +        */
> +       req->rate = clamp(req->rate, 5440000UL, 187500000UL);
> +
> +       rate_mhz = req->rate * MILLI * 1ULL;
> +       if (rate_mhz == dsi_dividers->error_mhz + dsi_dividers->freq_mhz)
> +               goto exit_determine_rate;
> +
> +       if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
> +                                                dsi_dividers, rate_mhz)) {
> +               dev_err(priv->dev,
> +                       "failed to determine rate for req->rate: %lu\n",
> +                       req->rate);
> +               return -EINVAL;
> +       }
> +
> +exit_determine_rate:
> +       req->best_parent_rate = req->rate * dsi_dividers->csdiv;
> +
> +       return 0;
> +};
> +
> +static int rzv2h_cpg_plldsi_div_set_rate(struct clk_hw *hw,
> +                                        unsigned long rate,
> +                                        unsigned long parent_rate)
> +{
> +       struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
> +       struct rzv2h_cpg_priv *priv = dsi_div->priv;
> +       struct rzv2h_plldsi_parameters *dsi_dividers = &priv->plldsi_div_parameters;
> +       struct ddiv ddiv = dsi_div->ddiv;
> +       const struct clk_div_table *clkt;
> +       u32 reg, shift, div;
> +
> +       div = dsi_dividers->csdiv;
> +       for (clkt = dsi_div->dtable; clkt->div; clkt++) {
> +               if (clkt->div == div)
> +                       break;
> +       }
> +
> +       if (!clkt->div && !clkt->val)
> +               return -EINVAL;

No need to check clkt->dev.

> +
> +       shift = ddiv.shift;
> +       reg = readl(priv->base + ddiv.offset);
> +       reg &= ~(GENMASK(shift + ddiv.width, shift));
> +
> +       writel(reg | (clkt->val << shift) |
> +              DDIV_DIVCTL_WEN(shift), priv->base + ddiv.offset);
> +
> +       return 0;

This function is very similar to the existing rzv2h_ddiv_set_rate().
If you can't re-use it as-is, please consider factoring out the common
part, or at least follow the same style of RMW-operation.

> +};


> +static long rzv2h_cpg_plldsi_round_rate(struct clk_hw *hw,
> +                                       unsigned long rate,
> +                                       unsigned long *parent_rate)
> +{
> +       return clamp(rate, 25000000UL, 375000000UL);

This only rounds rates outside the range from 25 to 375 MHz.
What about rates between 25 and 375 MHz?

> +}
> +
> +static unsigned long rzv2h_cpg_plldsi_clk_recalc_rate(struct clk_hw *hw,
> +                                                     unsigned long parent_rate)
> +{
> +       struct pll_clk *pll_clk = to_pll(hw);
> +       struct rzv2h_cpg_priv *priv = pll_clk->priv;
> +       unsigned int val1, val2;
> +       u64 rate;
> +
> +       val1 = readl(priv->base + CPG_PLL_CLK1(pll_clk->pll.offset));
> +       val2 = readl(priv->base + CPG_PLL_CLK2(pll_clk->pll.offset));
> +
> +       rate = mul_u64_u32_shr(parent_rate, (CPG_PLL_CLK1_MDIV(val1) << 16) +
> +                              CPG_PLL_CLK1_KDIV(val1), 16 + CPG_PLL_CLK2_SDIV(val2));
> +
> +       return DIV_ROUND_CLOSEST_ULL(rate, CPG_PLL_CLK1_PDIV(val1));

Can't you just reuse the existing rzv2h_cpg_pll_clk_recalc_rate()?

> +}
> +
> +static int rzv2h_cpg_plldsi_set_rate(struct clk_hw *hw,
> +                                    unsigned long rate,
> +                                    unsigned long parent_rate)
> +{
> +       struct pll_clk *pll_clk = to_pll(hw);
> +       struct rzv2h_cpg_priv *priv = pll_clk->priv;
> +       struct rzv2h_plldsi_parameters *dsi_dividers;
> +       struct pll pll = pll_clk->pll;
> +       u16 offset = pll.offset;
> +       u32 val;
> +       int ret;
> +
> +       /* Put PLL into standby mode */
> +       writel(CPG_PLL_STBY_RESETB_WEN, priv->base + CPG_PLL_STBY(offset));
> +       ret = readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offset),
> +                                       val, !(val & CPG_PLL_MON_LOCK),
> +                                       100, 2000);
> +       if (ret) {
> +               dev_err(priv->dev, "Failed to put PLLDSI into standby mode");
> +               return ret;
> +       }
> +
> +       dsi_dividers = &priv->plldsi_div_parameters;
> +       /* Output clock setting 1 */
> +       writel((dsi_dividers->k << 16) | (dsi_dividers->m << 6) | (dsi_dividers->p),
> +              priv->base + CPG_PLL_CLK1(offset));
> +
> +       /* Output clock setting 2 */
> +       val = readl(priv->base + CPG_PLL_CLK2(offset));
> +       writel((val & ~GENMASK(2, 0)) | dsi_dividers->s,
> +              priv->base + CPG_PLL_CLK2(offset));
> +
> +       /* Put PLL to normal mode */
> +       writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB,
> +              priv->base + CPG_PLL_STBY(offset));
> +
> +       /* PLL normal mode transition, output clock stability check */
> +       ret = readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offset),
> +                                       val, (val & CPG_PLL_MON_LOCK),
> +                                       100, 2000);
> +       if (ret) {
> +               dev_err(priv->dev, "Failed to put PLLDSI into normal mode");
> +               return ret;
> +       }
> +
> +       return 0;

This function could be reused for non-DSI PLLs?

> +};
> +
> +static const struct clk_ops rzv2h_cpg_plldsi_ops = {
> +       .recalc_rate = rzv2h_cpg_plldsi_clk_recalc_rate,
> +       .round_rate = rzv2h_cpg_plldsi_round_rate,
> +       .set_rate = rzv2h_cpg_plldsi_set_rate,
> +};
> +
> +static struct clk * __init
> +rzv2h_cpg_plldsi_clk_register(const struct cpg_core_clk *core,
> +                             struct rzv2h_cpg_priv *priv)
> +{
> +       void __iomem *base = priv->base;
> +       struct device *dev = priv->dev;
> +       struct clk_init_data init;
> +       const struct clk *parent;
> +       const char *parent_name;
> +       struct pll_clk *pll_clk;
> +       int ret;
> +
> +       parent = priv->clks[core->parent];
> +       if (IS_ERR(parent))
> +               return ERR_CAST(parent);
> +
> +       pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
> +       if (!pll_clk)
> +               return ERR_PTR(-ENOMEM);
> +
> +       parent_name = __clk_get_name(parent);
> +       init.name = core->name;
> +       init.ops = &rzv2h_cpg_plldsi_ops;
> +       init.flags = 0;
> +       init.parent_names = &parent_name;
> +       init.num_parents = 1;
> +
> +       pll_clk->hw.init = &init;
> +       pll_clk->pll = core->cfg.pll;
> +       pll_clk->base = base;
> +       pll_clk->priv = priv;
> +
> +       /* Disable SSC and turn on PLL clock when init */
> +       writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB |
> +              CPG_PLL_STBY_SSCGEN_WEN, base + CPG_PLL_STBY(pll_clk->pll.offset));

Apart from the three lines above, this function does the same as the
existing rzv2h_cpg_pll_clk_register().  Merge/reuse?

> +
> +       ret = devm_clk_hw_register(dev, &pll_clk->hw);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return pll_clk->hw.clk;
> +}
> +
>  static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
>                                                    unsigned long parent_rate)
>  {

> --- /dev/null
> +++ b/include/linux/clk/renesas-rzv2h-dsi.h
> @@ -0,0 +1,207 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Renesas RZ/V2H(P) DSI CPG helper
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */

Missing include guard.

> +
> +#include <linux/limits.h>
> +#include <linux/math.h>
> +#include <linux/math64.h>
> +#include <linux/units.h>
> +
> +#define OSC_CLK_IN_MEGA                (24 * MEGA)
> +
> +struct rzv2h_plldsi_div_limits {

This structure looks applicable to all RZ/V2H PLLs, so perhaps drop the
"dsi" part from the name?

> +       struct {
> +               u64 min;
> +               u64 max;
> +       } fvco;
> +
> +       struct {
> +               u16 min;
> +               u16 max;
> +       } m;
> +
> +       struct {
> +               u8 min;
> +               u8 max;
> +       } p;
> +
> +       struct {
> +               u8 min;
> +               u8 max;
> +       } s;
> +
> +       struct {
> +               s16 min;
> +               s16 max;
> +       } k;
> +
> +       struct {
> +               u8 min;
> +               u8 max;
> +       } csdiv;
> +};
> +
> +struct rzv2h_plldsi_parameters {
> +       u64 freq_mhz;
> +       s64 error_mhz;
> +       u16 m;
> +       s16 k;
> +       u8 csdiv;
> +       u8 p;
> +       u8 s;
> +};
> +
> +#define RZV2H_CPG_PLL_DSI_LIMITS(name)                                 \
> +       static const struct rzv2h_plldsi_div_limits (name) = {          \
> +               .m = { .min = 64, .max = 533 },                         \
> +               .p = { .min = 1, .max = 4 },                            \
> +               .s = { .min = 0, .max = 6 },                            \
> +               .k = { .min = -32768, .max = 32767 },                   \
> +               .csdiv = { .min = 2, .max = 32 },                       \
> +               .fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA }      \
> +       }                                                               \
> +
> +/**
> + * rzv2h_dsi_get_pll_parameters_values - Finds the best combination of PLL parameters
> + * and divider value for a given frequency.
> + *
> + * @limits: Pointer to the structure containing the limits for the PLL parameters and
> + * divider values
> + * @pars: Pointer to the structure where the best calculated PLL parameters and divider
> + * values will be stored
> + * @freq: Target output frequency (in mHz)
> + *
> + * This function calculates the best set of PLL parameters (M, K, P, S) and divider
> + * value (CSDIV) to achieve the desired frequency.
> + * There is no direct formula to calculate the PLL parameters and the divider value,
> + * as it's an open system of equations, therefore this function uses an iterative
> + * approach to determine the best solution. The best solution is one that minimizes
> + * the error (desired frequency - actual frequency).
> + *
> + * Return: true if a valid set of divider values is found, false otherwise.
> + */
> +static __maybe_unused bool
> +rzv2h_dsi_get_pll_parameters_values(const struct rzv2h_plldsi_div_limits *limits,
> +                                   struct rzv2h_plldsi_parameters *pars,
> +                                   u64 freq_mhz)
> +{

I haven't reviewed the heavy calculations yet.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

