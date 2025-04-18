Return-Path: <linux-renesas-soc+bounces-16150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3ADA9384D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 16:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F26C171FBD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 14:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE041552EB;
	Fri, 18 Apr 2025 14:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xtg1pvRN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00C61519AC;
	Fri, 18 Apr 2025 14:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744985453; cv=none; b=ldJ85/8rSeEme/wuemi4eHSthkaP0PzRUB3Tz4mf0Y3VIYmkGI2FwQELNt3sFRnqvbU/ufu5ub1fU6y9DdZBeznHYjwWA3tWvqpxdBdKSu5W9yfjDEaqIw+nyj0RPVx2MUEL1c9gGPAro3sOA1UlaRwn+GXaSCkc5dLN0lR/dw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744985453; c=relaxed/simple;
	bh=7Zc6jS31j2u0AY1itNyFpEOaVwW3TojAitpGqvDF6eI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/7AjPt2dVXeZlFcer4gzIEFnJgr+h3CcZVx2YdDfajzQht2yeiEirBQNiTr7Kry+DvvubCWvfgN75AnG5KXWl8YHVhiCmB+fT6IcaSbMW/S6nG82HBYKFOevSZVAMh8+9x5Wg867O86LEkCjoDM/GjD5fiw8pdKXwkHiSGONRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xtg1pvRN; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39d83782ef6so2063602f8f.0;
        Fri, 18 Apr 2025 07:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744985450; x=1745590250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+4iqs0h57Kp8/rbjBz5taHDUwf5MhBA1y6Qwn3HIfw=;
        b=Xtg1pvRN7KYyig9jA88MjXJViAj4KulJizakBPUsWqDfBqBUXLZq3N8FjJcs8VhIcn
         FEo6HQCCg/jWouzAfbaFZm5OwS8dmofFMpv5obR3aKKT07eowMUCXwWMBKAfJNRjSMco
         V2F4MxPT4StV61xAeA9JeszA6VD3zQIOERI6wwDCP5c3u6w1mlV1pCX5p36fN+c++QbC
         SIHWgoapW/WgQ1vC83Y6+jQ5pEE336DbAxLJIzojCCcojZmmYykLWUb6MZdONlxyvtzF
         M2vlkLlwPLVsNrIwy4NqpjKle/9SHvSkxApcaV8uYZiNhzB7adH5uKOI8hNqM0tTIana
         YoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744985450; x=1745590250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+4iqs0h57Kp8/rbjBz5taHDUwf5MhBA1y6Qwn3HIfw=;
        b=j81Sa+KVLrFkKKcFLAJ+2DYsBJJabcx1//5hiBLEtBZqv6w8GpLOX0aYc4VL52zJfe
         bgDYb5sEdbwjzg+NJQC8ISQQPAjiNQqPnfHpTn0TrrfxiBTBHEL6DN8LRmewL+PPvday
         9czvfX89te9LzUSkjWiMvbBx8yTw+KWWVx1EAUCRDOIliJvpo2AqIJukJEaAVmQT2NU8
         dXfD0cWiZRvtutrpl40d6mcnwktFrVPbeYuKAwlw3KCno3xU6up1XPCgiO+hzaW29UmE
         d4MnakSBUpeRqAAYhj7RV8CBmHf+y0loSqk8Okjn8qXTSAIZD9FnDpxCVmaIbDO4ocUl
         miTg==
X-Forwarded-Encrypted: i=1; AJvYcCVjSE33S5h/hk/lu1nNUphfynkBnZOZV+oZujS8MDliZckLakNTm11sOuua5EnMAJJ0Gue6TvGuFHBzgnu3@vger.kernel.org, AJvYcCVluYwvZaYz8NFnP4pZoH07Wfj5EKQ12oZXjDtDiCeqG4lXmDGkH8l7nFWT+G7CVJTxMM9Ejr3muX65mK46GHGvs1g=@vger.kernel.org, AJvYcCX62fnQ8EY7mbn2fXVb2p8SYsdsv8sF8lhbUhoZwZ0XxeNbaAnFXtnTOlZkS9PhZYCpyBwFk/WthrZN@vger.kernel.org, AJvYcCXBzJy2aVWu58g1zs2lLHbu/vtoNEsQ+VY2YzcEGIjwIdbM7g5DbJSfCsNktsYJTJ1xnkHuUTqxXAWw@vger.kernel.org
X-Gm-Message-State: AOJu0YyFfKVGT09O3e10KmLy7ckP/2wMr/srVGdCW78V2K14FP6qFgEF
	mZh4tVaFrGvV/RgEycTFmDKNHTDf2g5T0L6oGmGGxJCen9+yykI8kuvUHJFDz/FtnjPoP9BrTok
	uOAei7g5+aGgXrO+KPjvFpAucL4I=
X-Gm-Gg: ASbGnct5W49KgaHlMzkKH2MxsQP7eCZWBAqfONsdVC8hu3N47QQAfM9tg+IYPSgOsxN
	AWmmazFLCNdSmSXbjQQxygU1BeCtkd85Uh38TMnahkwVqt9v3ht1kgjvqB8fZJ7ZwgVHaYwQEvi
	vlhz8z//O48BtVnhGaksOekxNJtiybJQSqXimdK/5l/lsUj/G6dusxWB16nHJxgkDFow==
X-Google-Smtp-Source: AGHT+IHl9tpgA/X6cm1KcAI4eONzkSnegsGij5ld5XhyA6vN+eGT7ytBy/PX8eLr/WPj2yiqupDHgYfSrkeaXPBrFCE=
X-Received: by 2002:a05:6000:2481:b0:390:e535:8750 with SMTP id
 ffacd0b85a97d-39efbd60d22mr2430124f8f.9.1744985449778; Fri, 18 Apr 2025
 07:10:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVjVEVh+dHKG_afZwyqsXwHj2FR7enHNrfuE9HJ0ELjEA@mail.gmail.com>
In-Reply-To: <CAMuHMdVjVEVh+dHKG_afZwyqsXwHj2FR7enHNrfuE9HJ0ELjEA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 18 Apr 2025 15:10:23 +0100
X-Gm-Features: ATxdqUGhurULd5jkQDU7jJeZchOr269Y4azGw9tpFZslMsIVw--s37FvGHYrIio
Message-ID: <CA+V-a8uLA0urp8hPkUmHqNyH=n1Z2fkMnroc3qw=gq06kHUWfQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
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
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Apr 16, 2025 at 10:27=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar, Fabrizio,
>
> Thanks for your patch!
>
> On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for PLLDSI and PLLDSI divider clocks.
> >
> > The `renesas-rzv2h-dsi.h` header file is added to share the PLL divider
> > algorithm between the CPG and DSI drivers.
>
> Please explain here why the DSI driver needs access to this algorithm.
>
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > @@ -196,6 +225,253 @@ static int rzv2h_cpg_pll_clk_enable(struct clk_hw=
 *hw)
> >         return ret;
> >  }
> >
> > +static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *h=
w,
> > +                                                     unsigned long par=
ent_rate)
> > +{
> > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       struct ddiv ddiv =3D dsi_div->ddiv;
> > +       u32 div;
> > +
> > +       div =3D readl(priv->base + ddiv.offset);
> > +       div >>=3D ddiv.shift;
> > +       div &=3D ((2 << ddiv.width) - 1);
>
> Shouldn't that "2" be "1"?
> GENMASK(ddiv.width - 1, 0), or even better: clk_div_mask(ddiv.width).
>
Agreed, I'll switch to clk_div_mask(ddiv.width)

> > +
> > +       div =3D dsi_div->dtable[div].div;
> > +
> > +       return DIV_ROUND_CLOSEST_ULL(parent_rate, div);
> > +}
> > +
> > +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> > +                                              struct clk_rate_request =
*req)
> > +{
> > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->plldsi_=
div_parameters;
> > +       unsigned long long rate_mhz;
>
> u64?
OK.

> Please use "millihz" instead of "mhz" everywhere, so it becomes very
> clear this is really "mHz" and not "MHz".
>
OK.

> > +
> > +       /*
> > +        * Adjust the requested clock rate (`req->rate`) to ensure it f=
alls within
> > +        * the supported range of 5.44 MHz to 187.5 MHz.
> > +        */
> > +       req->rate =3D clamp(req->rate, 5440000UL, 187500000UL);
> > +
> > +       rate_mhz =3D req->rate * MILLI * 1ULL;
> > +       if (rate_mhz =3D=3D dsi_dividers->error_mhz + dsi_dividers->fre=
q_mhz)
> > +               goto exit_determine_rate;
> > +
> > +       if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
> > +                                                dsi_dividers, rate_mhz=
)) {
> > +               dev_err(priv->dev,
> > +                       "failed to determine rate for req->rate: %lu\n"=
,
> > +                       req->rate);
> > +               return -EINVAL;
> > +       }
> > +
> > +exit_determine_rate:
> > +       req->best_parent_rate =3D req->rate * dsi_dividers->csdiv;
> > +
> > +       return 0;
> > +};
> > +
> > +static int rzv2h_cpg_plldsi_div_set_rate(struct clk_hw *hw,
> > +                                        unsigned long rate,
> > +                                        unsigned long parent_rate)
> > +{
> > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->plldsi_=
div_parameters;
> > +       struct ddiv ddiv =3D dsi_div->ddiv;
> > +       const struct clk_div_table *clkt;
> > +       u32 reg, shift, div;
> > +
> > +       div =3D dsi_dividers->csdiv;
> > +       for (clkt =3D dsi_div->dtable; clkt->div; clkt++) {
> > +               if (clkt->div =3D=3D div)
> > +                       break;
> > +       }
> > +
> > +       if (!clkt->div && !clkt->val)
> > +               return -EINVAL;
>
> No need to check clkt->dev.
>
I'll drop this check and use a bool flag to determine if a div is found.

> > +
> > +       shift =3D ddiv.shift;
> > +       reg =3D readl(priv->base + ddiv.offset);
> > +       reg &=3D ~(GENMASK(shift + ddiv.width, shift));
> > +
> > +       writel(reg | (clkt->val << shift) |
> > +              DDIV_DIVCTL_WEN(shift), priv->base + ddiv.offset);
> > +
> > +       return 0;
>
> This function is very similar to the existing rzv2h_ddiv_set_rate().
> If you can't re-use it as-is, please consider factoring out the common
> part, or at least follow the same style of RMW-operation.
>
Ok, I'll follow the same RMW operation.

> > +};
>
>
> > +static long rzv2h_cpg_plldsi_round_rate(struct clk_hw *hw,
> > +                                       unsigned long rate,
> > +                                       unsigned long *parent_rate)
> > +{
> > +       return clamp(rate, 25000000UL, 375000000UL);
>
> This only rounds rates outside the range from 25 to 375 MHz.
> What about rates between 25 and 375 MHz?
>
> > +}
> > +
> > +static unsigned long rzv2h_cpg_plldsi_clk_recalc_rate(struct clk_hw *h=
w,
> > +                                                     unsigned long par=
ent_rate)
> > +{
> > +       struct pll_clk *pll_clk =3D to_pll(hw);
> > +       struct rzv2h_cpg_priv *priv =3D pll_clk->priv;
> > +       unsigned int val1, val2;
> > +       u64 rate;
> > +
> > +       val1 =3D readl(priv->base + CPG_PLL_CLK1(pll_clk->pll.offset));
> > +       val2 =3D readl(priv->base + CPG_PLL_CLK2(pll_clk->pll.offset));
> > +
> > +       rate =3D mul_u64_u32_shr(parent_rate, (CPG_PLL_CLK1_MDIV(val1) =
<< 16) +
> > +                              CPG_PLL_CLK1_KDIV(val1), 16 + CPG_PLL_CL=
K2_SDIV(val2));
> > +
> > +       return DIV_ROUND_CLOSEST_ULL(rate, CPG_PLL_CLK1_PDIV(val1));
>
> Can't you just reuse the existing rzv2h_cpg_pll_clk_recalc_rate()?
>
Agreed.

> > +}
> > +
> > +static int rzv2h_cpg_plldsi_set_rate(struct clk_hw *hw,
> > +                                    unsigned long rate,
> > +                                    unsigned long parent_rate)
> > +{
> > +       struct pll_clk *pll_clk =3D to_pll(hw);
> > +       struct rzv2h_cpg_priv *priv =3D pll_clk->priv;
> > +       struct rzv2h_plldsi_parameters *dsi_dividers;
> > +       struct pll pll =3D pll_clk->pll;
> > +       u16 offset =3D pll.offset;
> > +       u32 val;
> > +       int ret;
> > +
> > +       /* Put PLL into standby mode */
> > +       writel(CPG_PLL_STBY_RESETB_WEN, priv->base + CPG_PLL_STBY(offse=
t));
> > +       ret =3D readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offs=
et),
> > +                                       val, !(val & CPG_PLL_MON_LOCK),
> > +                                       100, 2000);
> > +       if (ret) {
> > +               dev_err(priv->dev, "Failed to put PLLDSI into standby m=
ode");
> > +               return ret;
> > +       }
> > +
> > +       dsi_dividers =3D &priv->plldsi_div_parameters;
> > +       /* Output clock setting 1 */
> > +       writel((dsi_dividers->k << 16) | (dsi_dividers->m << 6) | (dsi_=
dividers->p),
> > +              priv->base + CPG_PLL_CLK1(offset));
> > +
> > +       /* Output clock setting 2 */
> > +       val =3D readl(priv->base + CPG_PLL_CLK2(offset));
> > +       writel((val & ~GENMASK(2, 0)) | dsi_dividers->s,
> > +              priv->base + CPG_PLL_CLK2(offset));
> > +
> > +       /* Put PLL to normal mode */
> > +       writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB,
> > +              priv->base + CPG_PLL_STBY(offset));
> > +
> > +       /* PLL normal mode transition, output clock stability check */
> > +       ret =3D readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offs=
et),
> > +                                       val, (val & CPG_PLL_MON_LOCK),
> > +                                       100, 2000);
> > +       if (ret) {
> > +               dev_err(priv->dev, "Failed to put PLLDSI into normal mo=
de");
> > +               return ret;
> > +       }
> > +
> > +       return 0;
>
> This function could be reused for non-DSI PLLs?
>
Yes it could be reused, I'll rename this to rzv2h_cpg_pll_set_rate().

> > +};
> > +
> > +static const struct clk_ops rzv2h_cpg_plldsi_ops =3D {
> > +       .recalc_rate =3D rzv2h_cpg_plldsi_clk_recalc_rate,
> > +       .round_rate =3D rzv2h_cpg_plldsi_round_rate,
> > +       .set_rate =3D rzv2h_cpg_plldsi_set_rate,
> > +};
> > +
> > +static struct clk * __init
> > +rzv2h_cpg_plldsi_clk_register(const struct cpg_core_clk *core,
> > +                             struct rzv2h_cpg_priv *priv)
> > +{
> > +       void __iomem *base =3D priv->base;
> > +       struct device *dev =3D priv->dev;
> > +       struct clk_init_data init;
> > +       const struct clk *parent;
> > +       const char *parent_name;
> > +       struct pll_clk *pll_clk;
> > +       int ret;
> > +
> > +       parent =3D priv->clks[core->parent];
> > +       if (IS_ERR(parent))
> > +               return ERR_CAST(parent);
> > +
> > +       pll_clk =3D devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
> > +       if (!pll_clk)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       parent_name =3D __clk_get_name(parent);
> > +       init.name =3D core->name;
> > +       init.ops =3D &rzv2h_cpg_plldsi_ops;
> > +       init.flags =3D 0;
> > +       init.parent_names =3D &parent_name;
> > +       init.num_parents =3D 1;
> > +
> > +       pll_clk->hw.init =3D &init;
> > +       pll_clk->pll =3D core->cfg.pll;
> > +       pll_clk->base =3D base;
> > +       pll_clk->priv =3D priv;
> > +
> > +       /* Disable SSC and turn on PLL clock when init */
> > +       writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB |
> > +              CPG_PLL_STBY_SSCGEN_WEN, base + CPG_PLL_STBY(pll_clk->pl=
l.offset));
>
> Apart from the three lines above, this function does the same as the
> existing rzv2h_cpg_pll_clk_register().  Merge/reuse?
>
Agreed, I'll reuse this function and introduce a bool flag to turn on the P=
LL.

> > +
> > +       ret =3D devm_clk_hw_register(dev, &pll_clk->hw);
> > +       if (ret)
> > +               return ERR_PTR(ret);
> > +
> > +       return pll_clk->hw.clk;
> > +}
> > +
> >  static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
> >                                                    unsigned long parent=
_rate)
> >  {
>
> > --- /dev/null
> > +++ b/include/linux/clk/renesas-rzv2h-dsi.h
> > @@ -0,0 +1,207 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Renesas RZ/V2H(P) DSI CPG helper
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corp.
> > + */
>
> Missing include guard.
>
Ouch, Ill add one.

> > +
> > +#include <linux/limits.h>
> > +#include <linux/math.h>
> > +#include <linux/math64.h>
> > +#include <linux/units.h>
> > +
> > +#define OSC_CLK_IN_MEGA                (24 * MEGA)
> > +
> > +struct rzv2h_plldsi_div_limits {
>
> This structure looks applicable to all RZ/V2H PLLs, so perhaps drop the
> "dsi" part from the name?
>
Agreed.

Cheers,
Prabhakar

