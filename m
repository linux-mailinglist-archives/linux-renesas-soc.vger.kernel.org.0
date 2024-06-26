Return-Path: <linux-renesas-soc+bounces-6818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F14918A34
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 19:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 673481C221A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 17:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1CC190047;
	Wed, 26 Jun 2024 17:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ckj/VK2V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68371EEDD;
	Wed, 26 Jun 2024 17:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719423396; cv=none; b=KLgILbwfD7udjI9dGvZkzxLhiJTf9nTtCcAHvn3j0hdRIVE62taLzlHLKtQVZvo60XjMjsLYb05wjZoWAylm8X1sifUfG51GP8kJ8et1WPmF2+fCGDlRz5N33y49nSd7463FmNEQh4Q6n66iOCFCfnlKTr0rXcNn7iBgBqCcYfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719423396; c=relaxed/simple;
	bh=qe2bPquUZEShCZho+Y8YhuOaLl8qM06smReqUVDhYHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOnh5kO8A3nlvSlT6yT15Vo7J6bCa1JYXFrioklFneK3cu/iBe38XfpKtCoDF+XF71hUeC3GbmpD2gVp392O6B71gi1PeuP2mamHXvFhofgfualXQmygGd/tRLyGJnoYqz6Fj4fYvOw1K72mppTNgr4qdwgzhB81vam7zfL4BwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ckj/VK2V; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-44639c3d8e7so2841631cf.1;
        Wed, 26 Jun 2024 10:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719423393; x=1720028193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Nd62EjnxQiIzL7RUvLHFtF1c40V4Dgh1LQ7M/zkVP0=;
        b=Ckj/VK2VcosIfbdutRTaS+51deJvZaduhFaM3sRSGctgmjoSOBy3k5ws3R3OFQT/Jo
         WJYdyLcawWDkuFxHMj9l3YXKr78F/7RFEBdFav4LTQ/iqfpxFj9a+ArhZR8yw88vBwq/
         36itaa+idqG+NPmNXLDHgUIzwqp8/20Vamuq0rijy1dp7UijB6lVlVKWhyW/Q0zmzjCi
         gmkOZdoZg9zgrpypU+FvbMDHy80dgrrqw3+/WZ+hqp8xjBhKeSXWEWsnaW/MjX2VldLL
         /EBk2BjcJs7BW8r8y2EHCFWmtkho6DiObFQxQSef8zSieFdAsOhZzAgYL4sfKVe/ZOKe
         NW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719423393; x=1720028193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Nd62EjnxQiIzL7RUvLHFtF1c40V4Dgh1LQ7M/zkVP0=;
        b=QnyvqyDSZ62iM65pRR5c0EJ5uYEtNWAIcM6Gy2FWrHzHBDNO+XB6KB+E9LXnHQxmkN
         +6Oj0SLncTlzgn+ddBB7x2Gsb4XyANiqusJBjg8rib/IboZ/HRhaVDz8+QA59AUwfozP
         jN12tsGuTKPcoADvuWakiDjJ9cCpc+V/PNr7pWOd5m8Jo+eEypA/B01SzoXqBtUbhuci
         +hzl5MWk2qfkjPoXLLjXXm185XH7ONnaMB9roXS50qI4K/OisOwOvdw6COiOSsEQHRz0
         QPVjZZ/2ukdnEecdKPX4nnu2lkH9j2ySa4JStIhkZbzQES0h6uYluabsdsg+A8TLdWO3
         Cw9A==
X-Forwarded-Encrypted: i=1; AJvYcCWXYda5vKg5j6etvgLI9rZLLpbaRCPFTZU3PQE1IusVBg6tXIghn+kDiCcPneeXUsbXruCbckXALLxj4xX8QrqGx6Ci4P4BAeuZIhHD9mimnxJaic8GbMkeGBLjfhTaISCEMeaxPW9AFr4G7Au3kl+/6Sdazj+es3C4eA5EMs8hsY+4w0zMk4Nni3C/ISR7xZEd6akBWUaaPmnbunw2D5NiLDR7pJSG
X-Gm-Message-State: AOJu0Yzem6mc9eXtxWaSr3zSAU106dsqy31PoR6rwmUIiqfy5zKp+Sv+
	/sjGRQLQptju4saN3uhTwhl9Asug05R4OVZcvm+sWT4kLVm7b0MLSplLXYf1SatH6c5mlyyc0AI
	wUqx3YviC5gKPB4hjiwHkQ1/FqYI=
X-Google-Smtp-Source: AGHT+IFAHeu3t47701NFZxa01zmPKbTQh8U+/WgRlTYh9ZVyxYb0fRlzd6ciOW3WIv2A40wwXcN9w8GvH6+cv+MFyQE=
X-Received: by 2002:ac8:5f90:0:b0:445:9387:25f6 with SMTP id
 d75a77b69052e-445938727e9mr28597471cf.50.1719423393231; Wed, 26 Jun 2024
 10:36:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240610233221.242749-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVOvdU4ajB_f9OtQ8ao0Aodg+Rb9eGTmbNGC8o+aW-hzg@mail.gmail.com>
In-Reply-To: <CAMuHMdVOvdU4ajB_f9OtQ8ao0Aodg+Rb9eGTmbNGC8o+aW-hzg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Jun 2024 18:35:36 +0100
Message-ID: <CA+V-a8sqJBo2Q7+-_AYtFkmzYrxAjvJ7mLXgpLcmZNuGWi0BDA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] clk: renesas: Add family-specific clock driver
 for RZ/V2H(P)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Jun 26, 2024 at 11:07=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Jun 11, 2024 at 1:32=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add family-specific clock driver for RZ/V2H(P) SoCs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - Introduced family specific config option
> > - Now using register indexes for CLKON/CLKMON/RST/RSTMON
> > - Introduced PLL_CONF macro
> > - Dropped function pointer to get PLL_CLK1/2 offsets
> > - Added range check for core clks
> > - Dropped NULLified clocks check
> > - Updated commit description
>
> Thanks for the update!
>
> > --- /dev/null
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > +/**
> > + * struct rzv2h_cpg_priv - Clock Pulse Generator Private Data
> > + *
> > + * @rcdev: Reset controller entity
> > + * @dev: CPG device
> > + * @base: CPG register block base address
> > + * @clks: Array containing all Core and Module Clocks
> > + * @num_core_clks: Number of Core Clocks in clks[]
> > + * @num_mod_clks: Number of Module Clocks in clks[]
> > + * @num_resets: Number of Module Resets in info->resets[]
> > + * @num_hw_resets: Number of resets supported by HW
> > + * @last_dt_core_clk: ID of the last Core Clock exported to DT
> > + * @info: Pointer to platform data
> > + */
> > +struct rzv2h_cpg_priv {
> > +       struct reset_controller_dev rcdev;
> > +       struct device *dev;
> > +       void __iomem *base;
> > +
> > +       struct clk **clks;
> > +       unsigned int num_core_clks;
> > +       unsigned int num_mod_clks;
> > +       unsigned int num_resets;
> > +       unsigned int num_hw_resets;
>
> This is not really used, so please drop it.
>
OK, I will drop it.

> > +       unsigned int last_dt_core_clk;
> > +
> > +       const struct rzv2h_cpg_info *info;
> > +};
>
> > +static struct clk
> > +*rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
> > +                              void *data)
> > +{
> > +       unsigned int clkidx =3D clkspec->args[1];
> > +       struct rzv2h_cpg_priv *priv =3D data;
> > +       struct device *dev =3D priv->dev;
> > +       const char *type;
> > +       int range_check;
> > +       struct clk *clk;
> > +
> > +       switch (clkspec->args[0]) {
> > +       case CPG_CORE:
> > +               type =3D "core";
> > +               if (clkidx > priv->last_dt_core_clk) {
> > +                       dev_err(dev, "Invalid %s clock index %u\n", typ=
e, clkidx);
> > +                       return ERR_PTR(-EINVAL);
> > +               }
> > +               clk =3D priv->clks[clkidx];
> > +               break;
> > +
> > +       case CPG_MOD:
> > +               type =3D "module";
> > +               range_check =3D 15 - (clkidx % 16);
> > +               if (range_check < 0 || clkidx >=3D priv->num_mod_clks) =
{
>
> range_check is never negative
> (leftover from sparse number space?)
>
Agreed (we are doing % 16). I will drop this check.

> > +                       dev_err(dev, "Invalid %s clock index %u\n", typ=
e,
> > +                               clkidx);
> > +                       return ERR_PTR(-EINVAL);
> > +               }
> > +               clk =3D priv->clks[priv->num_core_clks + clkidx];
> > +               break;
> > +
> > +       default:
> > +               dev_err(dev, "Invalid CPG clock type %u\n", clkspec->ar=
gs[0]);
> > +               return ERR_PTR(-EINVAL);
> > +       }
> > +
> > +       if (IS_ERR(clk))
> > +               dev_err(dev, "Cannot get %s clock %u: %ld", type, clkid=
x,
> > +                       PTR_ERR(clk));
> > +       else
> > +               dev_dbg(dev, "clock (%u, %u) is %pC at %lu Hz\n",
> > +                       clkspec->args[0], clkspec->args[1], clk,
> > +                       clk_get_rate(clk));
> > +       return clk;
> > +}
>
> > +/**
> > + * struct mod_clock - Module clock
> > + *
> > + * @hw: handle between common and hardware-specific interfaces
> > + * @off: register offset
> > + * @bit: ON/MON bit
> > + * @monoff: monitor register offset
> > + * @monbit: montor bit
> > + * @priv: CPG private data
> > + */
> > +struct mod_clock {
> > +       struct clk_hw hw;
> > +       u8 on_index;
> > +       u8 on_bit;
> > +       u16 mon_index;
> > +       u8 mon_bit;
>
> I noticed clock on and clock mon bits are related.
> Clock on bits use only the lower 16 bits in a register, while clock
> monitor bits use all 32 bits, hence:
>
>     mon_index =3D on_index / 2
>     mon_bit =3D (on_index % 2) * 16 + on_bit
>
> Except for clocks without monitor bits, and for CGC_SPI_clk_spi and
> CGC_SPI_clk_spix2, which share an on-bit, but have separate mon-bits.
> So you cannot use these formulas.
>
Ahh we could have  saved some memory!

> Reset bits do not have such a relationship, as resets marked reserved
> are skipped in the reset monitoring bit range.
>
Yep.

>
> > +       struct rzv2h_cpg_priv *priv;
> > +};
> > +
> > +#define to_mod_clock(_hw) container_of(_hw, struct mod_clock, hw)
> > +
> > +static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enable)
> > +{
> > +       struct mod_clock *clock =3D to_mod_clock(hw);
> > +       unsigned int reg =3D GET_CLK_ON_OFFSET(clock->on_index);
> > +       struct rzv2h_cpg_priv *priv =3D clock->priv;
> > +       u32 bitmask =3D BIT(clock->on_bit);
> > +       struct device *dev =3D priv->dev;
> > +       u32 value;
> > +       int error;
> > +
> > +       dev_dbg(dev, "CLK_ON 0x%x/%pC %s\n", reg, hw->clk,
> > +               enable ? "ON" : "OFF");
> > +
> > +       value =3D bitmask << 16;
> > +       if (enable)
> > +               value |=3D bitmask;
> > +
> > +       writel(value, priv->base + reg);
> > +
> > +       if (!enable)
> > +               return 0;
> > +
> > +       reg =3D GET_CLK_MON_OFFSET(clock->mon_index);
>
> What if a clock does not have a clock monitor bit?
> Clock bits in registers CPG_CLKON_22 and later do not have corresponding
> clock monitor bits.
>
Oops I had missed this case.

I'll introduce a macro (NO_MON_REG_INDEX) for clocks which do not have
monitor support and add a check above to skip clk monitor operation if
clock->mon_index =3D=3D NO_MON_REG_INDEX.

/* monitor index for clocks which do not have CLKMON support */
#define NO_MON_REG_INDEX    0xff

Does this sound OK?

> > +       bitmask =3D BIT(clock->mon_bit);
> > +       error =3D readl_poll_timeout_atomic(priv->base + reg, value,
> > +                                         value & bitmask, 0, 10);
> > +       if (error)
> > +               dev_err(dev, "Failed to enable CLK_ON %p\n",
> > +                       priv->base + reg);
> > +
> > +       return error;
> > +}
>
> > --- /dev/null
> > +++ b/drivers/clk/renesas/rzv2h-cpg.h
>
> > +/**
> > + * struct rzv2h_cpg_info - SoC-specific CPG Description
> > + *
> > + * @core_clks: Array of Core Clock definitions
> > + * @num_core_clks: Number of entries in core_clks[]
> > + * @last_dt_core_clk: ID of the last Core Clock exported to DT
> > + * @num_total_core_clks: Total number of Core Clocks (exported + inter=
nal)
> > + *
> > + * @mod_clks: Array of Module Clock definitions
> > + * @num_mod_clks: Number of entries in mod_clks[]
> > + * @num_hw_mod_clks: Number of Module Clocks supported by the hardware
> > + *
> > + * @resets: Array of Module Reset definitions
> > + * @num_resets: Number of entries in resets[]
> > + * @num_hw_resets: Number of resets supported by the hardware
> > + *
> > + * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
> > + *                 should not be disabled without a knowledgeable driv=
er
> > + * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
> > + */
> > +struct rzv2h_cpg_info {
> > +       /* Core Clocks */
> > +       const struct cpg_core_clk *core_clks;
> > +       unsigned int num_core_clks;
> > +       unsigned int last_dt_core_clk;
> > +       unsigned int num_total_core_clks;
> > +
> > +       /* Module Clocks */
> > +       const struct rzv2h_mod_clk *mod_clks;
> > +       unsigned int num_mod_clks;
> > +       unsigned int num_hw_mod_clks;
> > +
> > +       /* Resets */
> > +       const struct rzv2h_reset *resets;
> > +       unsigned int num_resets;
> > +       unsigned int num_hw_resets;
>
> This is not really used, so please drop it.
>
OK.

Cheers,
Prabhakar

