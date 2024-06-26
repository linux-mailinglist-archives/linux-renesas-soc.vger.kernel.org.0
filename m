Return-Path: <linux-renesas-soc+bounces-6788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3EB917D48
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 12:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ABD51F23012
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 10:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7441741E2;
	Wed, 26 Jun 2024 10:07:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBB525774;
	Wed, 26 Jun 2024 10:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719396428; cv=none; b=YSal+jDuQvJkrSIhCz6fim1yqVJzeGTGINtd3LGLTwLsMBDxLi2xn0yZX5AIhF/+gXyCRrOOtR3jVEmTmRehl28t/OOlSEwbp1eg4Duv3IUL/6gTu1PBpr48X2FxzTXZPCZQ+UqUm0kVAfjswuXie2sm7UQhR+zu0fwqLfTtwN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719396428; c=relaxed/simple;
	bh=aR/97qeSbn18O3NS4bsqOWeOeOT+obXcoaLAykOPu1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUZr1mlLlRu62GlAPs4I6cs98nd8N3kHXp5VSFXAFTZaW2vEf/iB7jkA9rD2HIz40W2irvXSxg+YVxSjBjkUt2c2UzFdnYk8vRZaQZFaoThYjhir9R3uAGsTv8jl4JcC9uvcJ1yo1i6Cef+mUA+Lvup5hhzQzY2OTb9vcw6P4kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e02bda4aba3so6639581276.3;
        Wed, 26 Jun 2024 03:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396425; x=1720001225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbcDecEpoCfuC6cxB+0B2qANyo8ssQBOCs0i1cC/tic=;
        b=bWxxC69EGlWyvjvHp5EaIj1PTaFjFmZ0lpAfvb12h2rnifyCgR2vehaqrfgE0cBpWN
         bZQpt91uWikz3qGckJMzjTiGdOLraQ/KJ2avTaU0iYXFnGVVWTRdQD8MrovuamAAPqCH
         CKWSxqXvqRoS5pwwjDRXpgzR9boeGOt8WqU80nj8BzOAuxZwlmuIhEOcA8O4Q5nhuXpu
         Q3ZVbV9EDQnicqvQcckpAJ2rCJqYnib99B+qNbGIr6ltYSbJY3nYjn8GGhtpMG2EgyVS
         rSzZJTvYJSuon0byPpWUHP/1OgFQGA3/NiNoHtW+Uz3r6d0GU+MrYsxwfcXiPcdDOrYT
         bYfg==
X-Forwarded-Encrypted: i=1; AJvYcCWLaIUWwlPo+0OQxHP+DqUVQIWY10vX/ydE0Q5Q2SknrcrpXpW0TT2lzG2Ns+bwCQ9VIJCNPfU/LOvw0Gd40TbQmqvVmQKK0ZnK4ZeCSnq/eK9jQFQBa0QuJoYLd9SU409oalc4z3bwZT2mMehZ0NLWLW9VyQw23N4AxR9gr+OMEYQiQf31Zqwuf0hF/54pb6yKehHwRlCiGqMqlXBHJ16If9VJTXy2
X-Gm-Message-State: AOJu0YzFNsr6BZo8lSi6PbUy8ebVLRYtGh6HaoA1zmhj0SLEm4Vu6mOe
	BkIrp/eLDthhMaTN3NeJRjI9CyhoeUy3jGUhbPtayeo3WAkzYTZxUlCD+wkZ
X-Google-Smtp-Source: AGHT+IGumklIXAna1x2FNMfdIwzRc3e+xnhGRUCODVFCZUtWexWpLOOyXq1Gz3EmuZf+mvfIYwD2/A==
X-Received: by 2002:a05:6902:348:b0:dfb:b21:b5dc with SMTP id 3f1490d57ef6-e0303f5cf47mr10161891276.25.1719396424864;
        Wed, 26 Jun 2024 03:07:04 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e65db5ecsm4274565276.62.2024.06.26.03.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 03:07:04 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-648b9d03552so1335657b3.2;
        Wed, 26 Jun 2024 03:07:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwldvCz5DFk/FgZ08OrB90pGkp/7sPEOkxNRuc8/WthZ3unMJgxKF9Z8hCPNaHuIME9ZDDp0Ry6FuoWq4vvYK60OQm2IhCWNZJwMgao/PbaFL/yCrBfrss5mStNZa9AKxerG43jUFv7JEvIx0nRdNaB62Pn131KhtM0WJwOBMi3ncNhTnuApWH1O+K52J91GjXl2wpJ7on6xSbGA3d0bclCcUl356a
X-Received: by 2002:a05:690c:ecd:b0:632:5b24:c0c with SMTP id
 00721157ae682-643a990bee0mr114814987b3.5.1719396423455; Wed, 26 Jun 2024
 03:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240610233221.242749-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240610233221.242749-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jun 2024 12:06:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOvdU4ajB_f9OtQ8ao0Aodg+Rb9eGTmbNGC8o+aW-hzg@mail.gmail.com>
Message-ID: <CAMuHMdVOvdU4ajB_f9OtQ8ao0Aodg+Rb9eGTmbNGC8o+aW-hzg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] clk: renesas: Add family-specific clock driver
 for RZ/V2H(P)
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, Jun 11, 2024 at 1:32=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add family-specific clock driver for RZ/V2H(P) SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Introduced family specific config option
> - Now using register indexes for CLKON/CLKMON/RST/RSTMON
> - Introduced PLL_CONF macro
> - Dropped function pointer to get PLL_CLK1/2 offsets
> - Added range check for core clks
> - Dropped NULLified clocks check
> - Updated commit description

Thanks for the update!

> --- /dev/null
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +/**
> + * struct rzv2h_cpg_priv - Clock Pulse Generator Private Data
> + *
> + * @rcdev: Reset controller entity
> + * @dev: CPG device
> + * @base: CPG register block base address
> + * @clks: Array containing all Core and Module Clocks
> + * @num_core_clks: Number of Core Clocks in clks[]
> + * @num_mod_clks: Number of Module Clocks in clks[]
> + * @num_resets: Number of Module Resets in info->resets[]
> + * @num_hw_resets: Number of resets supported by HW
> + * @last_dt_core_clk: ID of the last Core Clock exported to DT
> + * @info: Pointer to platform data
> + */
> +struct rzv2h_cpg_priv {
> +       struct reset_controller_dev rcdev;
> +       struct device *dev;
> +       void __iomem *base;
> +
> +       struct clk **clks;
> +       unsigned int num_core_clks;
> +       unsigned int num_mod_clks;
> +       unsigned int num_resets;
> +       unsigned int num_hw_resets;

This is not really used, so please drop it.

> +       unsigned int last_dt_core_clk;
> +
> +       const struct rzv2h_cpg_info *info;
> +};

> +static struct clk
> +*rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
> +                              void *data)
> +{
> +       unsigned int clkidx =3D clkspec->args[1];
> +       struct rzv2h_cpg_priv *priv =3D data;
> +       struct device *dev =3D priv->dev;
> +       const char *type;
> +       int range_check;
> +       struct clk *clk;
> +
> +       switch (clkspec->args[0]) {
> +       case CPG_CORE:
> +               type =3D "core";
> +               if (clkidx > priv->last_dt_core_clk) {
> +                       dev_err(dev, "Invalid %s clock index %u\n", type,=
 clkidx);
> +                       return ERR_PTR(-EINVAL);
> +               }
> +               clk =3D priv->clks[clkidx];
> +               break;
> +
> +       case CPG_MOD:
> +               type =3D "module";
> +               range_check =3D 15 - (clkidx % 16);
> +               if (range_check < 0 || clkidx >=3D priv->num_mod_clks) {

range_check is never negative
(leftover from sparse number space?)

> +                       dev_err(dev, "Invalid %s clock index %u\n", type,
> +                               clkidx);
> +                       return ERR_PTR(-EINVAL);
> +               }
> +               clk =3D priv->clks[priv->num_core_clks + clkidx];
> +               break;
> +
> +       default:
> +               dev_err(dev, "Invalid CPG clock type %u\n", clkspec->args=
[0]);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       if (IS_ERR(clk))
> +               dev_err(dev, "Cannot get %s clock %u: %ld", type, clkidx,
> +                       PTR_ERR(clk));
> +       else
> +               dev_dbg(dev, "clock (%u, %u) is %pC at %lu Hz\n",
> +                       clkspec->args[0], clkspec->args[1], clk,
> +                       clk_get_rate(clk));
> +       return clk;
> +}

> +/**
> + * struct mod_clock - Module clock
> + *
> + * @hw: handle between common and hardware-specific interfaces
> + * @off: register offset
> + * @bit: ON/MON bit
> + * @monoff: monitor register offset
> + * @monbit: montor bit
> + * @priv: CPG private data
> + */
> +struct mod_clock {
> +       struct clk_hw hw;
> +       u8 on_index;
> +       u8 on_bit;
> +       u16 mon_index;
> +       u8 mon_bit;

I noticed clock on and clock mon bits are related.
Clock on bits use only the lower 16 bits in a register, while clock
monitor bits use all 32 bits, hence:

    mon_index =3D on_index / 2
    mon_bit =3D (on_index % 2) * 16 + on_bit

Except for clocks without monitor bits, and for CGC_SPI_clk_spi and
CGC_SPI_clk_spix2, which share an on-bit, but have separate mon-bits.
So you cannot use these formulas.

Reset bits do not have such a relationship, as resets marked reserved
are skipped in the reset monitoring bit range.


> +       struct rzv2h_cpg_priv *priv;
> +};
> +
> +#define to_mod_clock(_hw) container_of(_hw, struct mod_clock, hw)
> +
> +static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enable)
> +{
> +       struct mod_clock *clock =3D to_mod_clock(hw);
> +       unsigned int reg =3D GET_CLK_ON_OFFSET(clock->on_index);
> +       struct rzv2h_cpg_priv *priv =3D clock->priv;
> +       u32 bitmask =3D BIT(clock->on_bit);
> +       struct device *dev =3D priv->dev;
> +       u32 value;
> +       int error;
> +
> +       dev_dbg(dev, "CLK_ON 0x%x/%pC %s\n", reg, hw->clk,
> +               enable ? "ON" : "OFF");
> +
> +       value =3D bitmask << 16;
> +       if (enable)
> +               value |=3D bitmask;
> +
> +       writel(value, priv->base + reg);
> +
> +       if (!enable)
> +               return 0;
> +
> +       reg =3D GET_CLK_MON_OFFSET(clock->mon_index);

What if a clock does not have a clock monitor bit?
Clock bits in registers CPG_CLKON_22 and later do not have corresponding
clock monitor bits.

> +       bitmask =3D BIT(clock->mon_bit);
> +       error =3D readl_poll_timeout_atomic(priv->base + reg, value,
> +                                         value & bitmask, 0, 10);
> +       if (error)
> +               dev_err(dev, "Failed to enable CLK_ON %p\n",
> +                       priv->base + reg);
> +
> +       return error;
> +}

> --- /dev/null
> +++ b/drivers/clk/renesas/rzv2h-cpg.h

> +/**
> + * struct rzv2h_cpg_info - SoC-specific CPG Description
> + *
> + * @core_clks: Array of Core Clock definitions
> + * @num_core_clks: Number of entries in core_clks[]
> + * @last_dt_core_clk: ID of the last Core Clock exported to DT
> + * @num_total_core_clks: Total number of Core Clocks (exported + interna=
l)
> + *
> + * @mod_clks: Array of Module Clock definitions
> + * @num_mod_clks: Number of entries in mod_clks[]
> + * @num_hw_mod_clks: Number of Module Clocks supported by the hardware
> + *
> + * @resets: Array of Module Reset definitions
> + * @num_resets: Number of entries in resets[]
> + * @num_hw_resets: Number of resets supported by the hardware
> + *
> + * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
> + *                 should not be disabled without a knowledgeable driver
> + * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
> + */
> +struct rzv2h_cpg_info {
> +       /* Core Clocks */
> +       const struct cpg_core_clk *core_clks;
> +       unsigned int num_core_clks;
> +       unsigned int last_dt_core_clk;
> +       unsigned int num_total_core_clks;
> +
> +       /* Module Clocks */
> +       const struct rzv2h_mod_clk *mod_clks;
> +       unsigned int num_mod_clks;
> +       unsigned int num_hw_mod_clks;
> +
> +       /* Resets */
> +       const struct rzv2h_reset *resets;
> +       unsigned int num_resets;
> +       unsigned int num_hw_resets;

This is not really used, so please drop it.

> +
> +       /* Critical Module Clocks that should not be disabled */
> +       const unsigned int *crit_mod_clks;
> +       unsigned int num_crit_mod_clks;
> +};
> +
> +#endif /* __RENESAS_RZV2H_CPG_H__ */

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

