Return-Path: <linux-renesas-soc+bounces-17452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F13AC254D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 16:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D1837A7DF4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 14:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A6C294A1B;
	Fri, 23 May 2025 14:45:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A1D25760;
	Fri, 23 May 2025 14:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748011537; cv=none; b=sg+KcYDIAEi0SAymmIQ0WXwTnHfZ4ojXn2XyAt9ygH/K/ZW1Plh2ouC+vVeHj0EPlsc55YTmHIF5wGwXW0/E2Ksxzwmclt5CxK7mCIYnMLgDZQO+90+BuAY45wrGHHs6f9AQmdRQnZOWbuhPRCwq1KmVIxLOm0YT9C7neg4F13g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748011537; c=relaxed/simple;
	bh=Lz2RKDzTbu1gCOxurvGRRIxFGt//Q2t5IeR7Ykyhiog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kybmiZ/x50euY9EYv3RKmktw3zlSrx5fVjUHhqOxpmQtLfk0nDX5XmIQt7clMgHcaBGuFUeAMGnwo4efAwZuwa6HjllbllhANWb4Tw1SSbERsvWesoRGI0wln9WfVBxr4hIWmssh63QwG0em5C5mD5nQX/YgNGU2TkVcqbb9gyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60119cd50b6so4523a12.0;
        Fri, 23 May 2025 07:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748011527; x=1748616327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7NaEY0NZOLUpgJiSQNcYfkRMwiosdL/jRVixVhXKM0=;
        b=Lc5Dg0AJKWcz+zIEjRvCdAls1yWgFxf1s1+ZLnfN3CFx+mqvqnUnyoH0UeUrk57Eew
         HowBjUlLXAaN9qUAg36wXGI3ce8QPRwEI3h1SxwCJMo+nU2wzXlrFWMX4KF2EvCQkEsz
         TC/yEyaayoP0SW/pwmAPZ99E/kiISfBTsoUdcq1mqaCvfOPP828FsL7+L+CTa3p8XzW+
         Ss1xYAuFunQ96sF2Gl8bUoSoDfQIM0ep7Tqy+74aIprA6VTVoKhRve8GrHv/NhmAcCw0
         ykwdI1MT7O9goZGbAaLgwCJM7QmDl9H7Xv57P+iOa4imOi77AWs+h1x8avzWxTTfIK9u
         oRXg==
X-Forwarded-Encrypted: i=1; AJvYcCUCZWlO9opQciNfKozcqwB0t1hDT1Wb9zz2ZB0Xqfy8b5gU/2lZk+Aoo1VdnOsxz4KPKU9J+K75P6b9@vger.kernel.org, AJvYcCUb+ijV6bcsP+EzTxljcCQ+iesprVGnX8ZUcQay91keiSHpNZ+I06Dt8ESQemmLN37wwzrl9WzY6f8pyxWFRlO5rQ8=@vger.kernel.org, AJvYcCVEEd9JOraOCAEPrhjXqfpilZwfs6VoqIbrW9QGCS1+larVpdIV81nMH0EJx6lWWFFMRrwUUoUlhgecIzC3@vger.kernel.org, AJvYcCXqwgY+hE4x2rcM8xRCoAVJM1uMGz0I5vRHKpRhM1Ft2quUgAZS9JdPZ1S4SE4c/3Wf/ojyFBG8iYNh@vger.kernel.org
X-Gm-Message-State: AOJu0YytYa1m+PTAcWhPYuajuT8jRipGOaE5cnyb0siHlqhcEgJFaH9Z
	KGPnDt7U4lJRMaRITpsXbu8qi0oLJfwSnGe1XerTIronNBQiJh8Pk4dEU1GBtQP55gE=
X-Gm-Gg: ASbGncteS+tmbqUvayoA1vpIxvqt4u5p+z5d53NxeldDtLQAdO1uBIP1GKwBD2XgJtC
	ZWUvE5GxETwYnVWx2dLw2dGqB893kq02Sb1rVGuvfTsyvnlQlfWzs3Y5FlkqY9772kfBZuuwz2i
	fVgUX8uFxnRXKfiB4ZDtBusPTd4ywI8xJs6s3/AxN3qherxd3unmk1R80Lk+wFZe7pS+pWI8s7W
	Tcsopm8zhp8x5lZfDjS5jLQSPNtm5PnzhkFaKLT6sPBIGL+5r+vT6IjC0YPReDdDklSdycCKgHa
	HBOnuaVdu7rqPCcMiHJL7GLXYfvEvqg4rhtS4wijp0Jw7zgLRQhn5KvIW0GmA2Gtliqxkym+YKQ
	vNnrBKT5jkhLe9WkX12a++jLq
X-Google-Smtp-Source: AGHT+IGGMhn62fyovxwzBeGRizk65bfJEscCpvJ37job3VY9RrbaBl87lpAIUyrnYsQ4HLqtyMSNrw==
X-Received: by 2002:a05:6402:350d:b0:601:31e6:6987 with SMTP id 4fb4d7f45d1cf-60131e66c10mr25280054a12.22.1748011527303;
        Fri, 23 May 2025 07:45:27 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d4f2f06sm12017431a12.9.2025.05.23.07.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 07:45:26 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acb39c45b4eso1291211766b.1;
        Fri, 23 May 2025 07:45:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVEOINwZh9c0Y+qG+amePwvxefbJNyRiphmZqkABwZNG3oX0X/mcSdtbKh7yrD9ZfCgd5jUQ7ChMAJ@vger.kernel.org, AJvYcCVY9EbuqQqdhutBvezOZdJ2Jdma/G1Lu7CwJ0vIA+crDQjcuppIYnUSq6KsLG0GaEsvgJ8CsTkccZ1WHt+zZ+rtndY=@vger.kernel.org, AJvYcCWq/+WeYv/tegdNkvN4OuWd99+MfrddAoX+DYo6tuPZ+SYFsZzD6Py+9UXvvqpvDRkG89z/3n8KZJZ6@vger.kernel.org, AJvYcCX6jT4MWO4h9THnWLFMGO5NIiKWTFH/RZUuZpgDej577vqPYGPGDBWR8bUeRZwZiNFbNMjcVmGIpIXfwyT2@vger.kernel.org
X-Received: by 2002:a17:907:7616:b0:ad5:3743:3fa1 with SMTP id
 a640c23a62f3a-ad5374340b4mr1918375866b.50.1748011524663; Fri, 23 May 2025
 07:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250512184302.241417-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250512184302.241417-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 16:45:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU=iuVFo=VJjV7UM-fLTeZk9TwyOJwojOVOSJiniRneHA@mail.gmail.com>
X-Gm-Features: AX0GCFvwamvYpsMtpBtvtgSH2uA4aQNl0Kcj7dnLwfU9z0V0YTsH6E-TkSjjegU
Message-ID: <CAMuHMdU=iuVFo=VJjV7UM-fLTeZk9TwyOJwojOVOSJiniRneHA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Prabhakar <prabhakar.csengg@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar, Fabrizio,

On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for PLLDSI and PLLDSI divider clocks.
>
> Introduce the `renesas-rzv2h-dsi.h` header to centralize and share
> PLLDSI-related data structures, limits, and algorithms between the RZ/V2H
> CPG and DSI drivers.
>
> The DSI PLL is functionally similar to the CPG's PLLDSI, but has slightly
> different parameter limits and omits the programmable divider present in
> CPG. To ensure precise frequency calculations-especially for milliHz-level
> accuracy needed by the DSI driver-the shared algorithm allows both drivers
> to compute PLL parameters consistently using the same logic and input
> clock.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -48,6 +53,7 @@
>  #define CPG_PLL_STBY(x)                ((x))
>  #define CPG_PLL_STBY_RESETB    BIT(0)
>  #define CPG_PLL_STBY_RESETB_WEN        BIT(16)
> +#define CPG_PLL_STBY_SSCGEN_WEN BIT(18)

CPG_PLL_STBY_SSC_EN_WEN?

>  #define CPG_PLL_CLK1(x)                ((x) + 0x004)
>  #define CPG_PLL_CLK1_KDIV(x)   ((s16)FIELD_GET(GENMASK(31, 16), (x)))

You are already using FIELD_GET() for extracting the K, M, P, and
S fields, but are still still open-coding shifts for writing in
rzv2h_cpg_pll_set_rate().

What about replacing CPG_PLL_CLK1_KDIV() by:

    #define CPG_PLL_CLK1_DIV_K    GENMASK(31,16)

Then the code can use:

    (s16)FIELD_GET(CPG_PLL_CLK1_DIV_K, clk1)

for reading and:

    FIELD_PREP(CPG_PLL_CLK1_DIV_K, (u16)k) | ...

for writing?

Same for the M, P, and S fields (but without the s16/u16 casts, as
they are unsigned, unlike K).

>  #define CPG_PLL_CLK1_MDIV(x)   FIELD_GET(GENMASK(15, 6), (x))

> @@ -198,6 +227,188 @@ static int rzv2h_cpg_pll_clk_enable(struct clk_hw *hw)
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
> +       div &= clk_div_mask(ddiv.width);
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
> +       u64 rate_millihz;
> +
> +       /*
> +        * Adjust the requested clock rate (`req->rate`) to ensure it falls within
> +        * the supported range of 5.44 MHz to 187.5 MHz.
> +        */
> +       req->rate = clamp(req->rate, 5440000UL, 187500000UL);
> +
> +       rate_millihz = mul_u32_u32(req->rate, MILLI);
> +       if (rate_millihz == dsi_dividers->error_millihz + dsi_dividers->freq_millihz)
> +               goto exit_determine_rate;
> +
> +       if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
> +                                                dsi_dividers, rate_millihz)) {
> +               dev_err(priv->dev,
> +                       "failed to determine rate for req->rate: %lu\n",
> +                       req->rate);
> +               return -EINVAL;
> +       }
> +
> +exit_determine_rate:
> +       req->best_parent_rate = req->rate * dsi_dividers->csdiv;

Shouldn't this also update req->rate with the actual rate?

    req->rate = DIV_ROUND_CLOSEST_ULL(dsi_dividers->freq_millihz, MILLI);

Would it help the DSI driver if this clock would provide a
.recalc_accuracy() callback that takes into account the difference
between req->rate and dsi_dividers->freq_millihz?
Or would that be considered abuse of the accuracy concept?

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
> +       bool div_found = false;
> +       u32 val, shift, div;
> +
> +       div = dsi_dividers->csdiv;
> +       for (clkt = dsi_div->dtable; clkt->div; clkt++) {
> +               if (clkt->div == div) {
> +                       div_found = true;
> +                       break;
> +               }
> +       }
> +
> +       if (!div_found)
> +               return -EINVAL;
> +
> +       shift = ddiv.shift;
> +       val = readl(priv->base + ddiv.offset) | DDIV_DIVCTL_WEN(shift);
> +       val &= ~(clk_div_mask(ddiv.width) << shift);
> +       val |= (u32)clkt->val << shift;

No need for the cast.

> +       writel(val, priv->base + ddiv.offset);
> +
> +       return 0;
> +};
> +
> +static const struct clk_ops rzv2h_cpg_plldsi_div_ops = {
> +       .recalc_rate = rzv2h_cpg_plldsi_div_recalc_rate,
> +       .determine_rate = rzv2h_cpg_plldsi_div_determine_rate,
> +       .set_rate = rzv2h_cpg_plldsi_div_set_rate,
> +};

> +static long rzv2h_cpg_plldsi_round_rate(struct clk_hw *hw,
> +                                       unsigned long rate,
> +                                       unsigned long *parent_rate)
> +{
> +       return clamp(rate, 25000000UL, 375000000UL);

This only brings the desired rate into the supported range, but does
not round it to the nearest rate that is actually supported.

> +}
> +
> +static int rzv2h_cpg_pll_set_rate(struct clk_hw *hw,
> +                                 unsigned long rate,
> +                                 unsigned long parent_rate)
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

This is where you want to use FIELD_PREP().

> +              priv->base + CPG_PLL_CLK1(offset));
> +
> +       /* Output clock setting 2 */
> +       val = readl(priv->base + CPG_PLL_CLK2(offset));
> +       writel((val & ~GENMASK(2, 0)) | dsi_dividers->s,

(val & ~CPG_PLL_CLK2_DIV_S) | FIELD_PREP(...)

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
> +};
> +
>  static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
>                                                    unsigned long parent_rate)
>  {

> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -100,6 +100,7 @@ struct smuxed {
>  #define CPG_CDDIV3             (0x40C)
>  #define CPG_CDDIV4             (0x410)
>  #define CPG_CSDIV0             (0x500)
> +#define CPG_CSDIV1             (0x504)

Unused until [PATCH v5 2/4], so please move it there.

>
>  #define CDDIV0_DIVCTL1 DDIV_PACK(CPG_CDDIV0, 4, 3, 1)
>  #define CDDIV0_DIVCTL2 DDIV_PACK(CPG_CDDIV0, 8, 3, 2)

> --- /dev/null
> +++ b/include/linux/clk/renesas-rzv2h-dsi.h
> @@ -0,0 +1,211 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Renesas RZ/V2H(P) DSI CPG helper
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +#ifndef __RENESAS_RZV2H_DSI_H__
> +#define __RENESAS_RZV2H_DSI_H__
> +
> +#include <linux/limits.h>
> +#include <linux/math.h>
> +#include <linux/math64.h>
> +#include <linux/units.h>
> +
> +#define OSC_CLK_IN_MEGA                (24 * MEGA)
> +
> +struct rzv2h_pll_div_limits {
> +       struct {
> +               u32 min;
> +               u32 max;
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
> +       u64 freq_millihz;
> +       s64 error_millihz;
> +       u16 m;
> +       s16 k;
> +       u8 csdiv;
> +       u8 p;
> +       u8 s;
> +};
> +
> +#define RZV2H_CPG_PLL_DSI_LIMITS(name)                                 \
> +       static const struct rzv2h_pll_div_limits (name) = {             \
> +               .fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },     \
> +               .m = { .min = 64, .max = 533 },                         \
> +               .p = { .min = 1, .max = 4 },                            \
> +               .s = { .min = 0, .max = 6 },                            \
> +               .k = { .min = -32768, .max = 32767 },                   \
> +               .csdiv = { .min = 2, .max = 32 },                       \
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
> + * @freq_millihz: Target output frequency in millihertz
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
> +rzv2h_dsi_get_pll_parameters_values(const struct rzv2h_pll_div_limits *limits,
> +                                   struct rzv2h_plldsi_parameters *pars,
> +                                   u64 freq_millihz)
> +{
> +       struct rzv2h_plldsi_parameters p, best;
> +
> +       /* Initialize best error to maximum possible value */
> +       best.error_millihz = S64_MAX;
> +
> +       for (p.csdiv = limits->csdiv.min; p.csdiv <= limits->csdiv.max; p.csdiv += 2) {
> +               for (p.p = limits->p.min; p.p <= limits->p.max; p.p++) {
> +                       u32 fref = OSC_CLK_IN_MEGA / p.p;
> +
> +                       for (p.s = limits->s.min; p.s <= limits->s.max; p.s++) {
> +                               u16 two_pow_s = 1 << p.s;
> +                               u16 divider = two_pow_s * p.csdiv;

No need for two_pow_s.  You can initialize divider = p.csdiv << s.min
at the start of the loop, and multiply by two after each iteration.

> +
> +                               for (p.m = limits->m.min; p.m <= limits->m.max; p.m++) {
> +                                       u64 output_m, output_k_range;
> +                                       s64 pll_k, output_k;
> +                                       u64 fvco, output;
> +
> +                                       /*
> +                                        * The frequency generated by the combination of the
> +                                        * PLL + divider is calculated as follows:
> +                                        *
> +                                        * Freq = Ffout / csdiv
> +                                        *
> +                                        * With:
> +                                        * Ffout = Ffvco / 2^(pll_s)
> +                                        * Ffvco = (pll_m + (pll_k / 65536)) * Ffref
> +                                        * Ffref = 24MHz / pll_p
> +                                        *
> +                                        * Freq can also be rewritten as:
> +                                        * Freq = Ffvco / (2^(pll_s) * csdiv))
> +                                        *      = Ffvco / divider
> +                                        *      = (pll_m * Ffref) / divider + ((pll_k / 65536) * Ffref) / divider
> +                                        *      = output_m + output_k
> +                                        *
> +                                        * Every parameter has been determined at this point, but pll_k.
> +                                        * Considering that:
> +                                        * -32768 <= pll_k <= 32767
> +                                        * Then:
> +                                        * -0.5 <= (pll_k / 65536) < 0.5
> +                                        * Therefore:
> +                                        * -Ffref / (2 * divider) <= output_k < Ffref / (2 * divider)
> +                                        */
> +
> +                                       /* Compute output M component (in mHz) */
> +                                       output_m = DIV_ROUND_CLOSEST_ULL(p.m * fref * 1000ULL,

"p.m * fref" may overflow => mul_u32_u32(p.m, fref) * MILLI;

> +                                                                        divider);
> +                                       /* Compute range for output K (in mHz) */
> +                                       output_k_range = DIV_ROUND_CLOSEST_ULL(fref * 1000ULL,

mul_u32_u32(fref, MILLI)

> +                                                                              divider * 2);
> +                                       /*
> +                                        * No point in continuing if we can't achieve the
> +                                        * desired frequency
> +                                        */
> +                                       if (freq_millihz <  (output_m - output_k_range) ||
> +                                           freq_millihz >= (output_m + output_k_range))
> +                                               continue;
> +
> +                                       /*
> +                                        * Compute the K component
> +                                        *
> +                                        * Since:
> +                                        * Freq = output_m + output_k
> +                                        * Then:
> +                                        * output_k = Freq - output_m
> +                                        *          = ((pll_k / 65536) * Ffref) / divider
> +                                        * Therefore:
> +                                        * pll_k = (output_k * 65536 * divider) / Ffref
> +                                        */
> +                                       output_k = freq_millihz - output_m;
> +                                       pll_k = div64_s64(output_k * 65536ULL * divider, fref);

div_s64(), as fref is 32-bit.

> +                                       pll_k = DIV_S64_ROUND_CLOSEST(pll_k, 1000);

MILLI

> +
> +                                       /* Validate K value within allowed limits */
> +                                       if (pll_k < limits->k.min || pll_k > limits->k.max)
> +                                               continue;
> +
> +                                       p.k = pll_k;
> +
> +                                       /* Compute (Ffvco * 65536) */
> +                                       fvco = ((p.m * 65536ULL) + p.k) * fref;

mul_u32(p.m * 65536 + p.k, fref)

I guess the compiler is sufficiently smart to turn that into a shift.
The alternative would be to use a cast (I try to avoid them) and a shift:

mul_u32((u64)p.m << 16 + p.k, fref)

> +                                       if ((fvco < (limits->fvco.min * 65536ULL)) ||
> +                                           (fvco > (limits->fvco.max * 65536ULL)))

mul_u32_u32(..., 65536) for both

> +                                               continue;
> +
> +                                       /* PLL_M component of (output * 65536 * PLL_P) */
> +                                       output = p.m * 65536ULL * OSC_CLK_IN_MEGA;

mul_u32(p.m * 65536, OSC_CLK_IN_MEGA)

> +                                       /* PLL_K component of (output * 65536 * PLL_P) */
> +                                       output += p.k * OSC_CLK_IN_MEGA;
> +                                       /* Make it in mHz */
> +                                       output *= 1000ULL;

No need for the ULL => MILLI

> +                                       output /= 65536ULL * p.p * divider;

mul_u32()

No rounding for the division?

> +
> +                                       p.error_millihz = freq_millihz - output;
> +                                       p.freq_millihz = output;
> +
> +                                       /* If an exact match is found, return immediately */
> +                                       if (p.error_millihz == 0) {
> +                                               *pars = p;
> +                                               return true;
> +                                       }
> +
> +                                       /* Update best match if error is smaller */
> +                                       if (abs(best.error_millihz) > abs(p.error_millihz))
> +                                               best = p;
> +                               }
> +                       }
> +               }
> +       }
> +
> +       /* If no valid parameters were found, return false */
> +       if (best.error_millihz == S64_MAX)
> +               return false;
> +
> +       *pars = best;
> +       return true;
> +}
> +
> +#endif /* __RENESAS_RZV2H_DSI_H__ */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

