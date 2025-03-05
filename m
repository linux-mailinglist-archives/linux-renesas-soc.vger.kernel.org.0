Return-Path: <linux-renesas-soc+bounces-14025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF54A5056D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 17:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B80E87A5CCC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 16:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C25E24CEDF;
	Wed,  5 Mar 2025 16:42:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CB324BC0B;
	Wed,  5 Mar 2025 16:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741192950; cv=none; b=p7Wlo7Es9awWc2gwqTzEzR62FdSMludGpTQ1antkiJes2pnFEbuDZx8REinHUHk/aXVD1elUVd991yteLwn33pDbGeVUwoUNokcK7BCY3d8sNw8sroqHdmW6P+8P2b3EfnqOvWtC8hZx+XSSvIazpFp5mVtHWNBheCwxkgUswfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741192950; c=relaxed/simple;
	bh=v2bC8FFbsHFQ+oIjsi5FxgR9LhFtPAuFVczGyddcUHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUnIX/SqwT0qi9wnrcA+CgWoloy/BlIBsepybEwaSRJ9DFtEN38j+Y9Xt2tb+CgdPaI+3+Z+fsZpJrMiEBLWqx9I30DexkPrO7ZVFASsgg0AKgbWz4+b/GmW2u4hrzCootFrL+ACmPeGXKtsNBvW3NrFiWQYe9W4cn5LK2NodBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8670d630d2dso2745971241.1;
        Wed, 05 Mar 2025 08:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741192947; x=1741797747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4vTIQ0DhMh9OUEzfzPMvZMgphKpmGzHqJ1FgLuOLUI=;
        b=ulF2HpOBnqU7U8K5pzMDVQ2eatHokhbvJEGuOCjD5jK4iGEsebI406NjtX6QJ9guk4
         lOPQPjXepIUDDfh4sXWJWXL7W5nWM7GqYs3fSYmvjDGhKJxj7qSwKVG0mfNz11S+Fmwi
         21i1xjUqnlRZmH7jCEeryob5e5lLJd3v0MGs2PHVLdbYrqInEg7EHF/RKPu9C3faDtNw
         KQF7i41kEyBFpmvpIGv+QSlM6zBl/336CqFI3/FbjxYGNj5W+fmA5+u0V987cpIQfE5w
         Q7QD9FSc5T6iai61FeJI94eenoWrMIUXtpUGDARLJA4K65lCda2OD5RSdVXyQwJQfOBP
         hDvA==
X-Forwarded-Encrypted: i=1; AJvYcCUFinN0Eto+UpUfZQ8xdgo0Z31fMdaNYU13DU5Rt9PnVhkH2VO1wfFHz16U08RPVbikqlmU2nvsHH4=@vger.kernel.org, AJvYcCUb6g37U+nKBlHxPJdk94RM/MWD1UbN+rxl95bErSOvG9YBG2O23XZSH8LMqQN1WN30d1dGf//L9YiGI/eHoqF81BA=@vger.kernel.org, AJvYcCWRNhQ7OSMbCIdaVRdQPR/9ZeJvaftpIil6IxDtAbMbocXKL+GGZnrPX8O1F4P7lVs2dA6TqjfzZccJl/wN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1V65nwCAVdVQnriZ0cwJrrPP2J5Zk88T/eXbVYHFPvtEvE2U+
	w5au80sPNCQp5ofsD9jiRRRQItt2QrziBXG59LICCLPxBKH9ih/1EkfN0D3Y
X-Gm-Gg: ASbGncsyr/9h+Y+zd6g8ocPFjqFEEDrxM3ie9ULYKzils+PZhwvsTXnO/4Fgg51BdFo
	f83WzqKXIx2yqxndQ98wcIGrNJc/hljnknOHCw+X2QWvWBIro0gCmcZfguz7b0S2tHgD+sEYgX+
	RVXKiD0i1DZc9mB5KAdEEwhn15qHEnlqbfu/c+8QQXRfLbF2CHu7U9Ek4kG25GDoJGM7Qe9yHbx
	71l4zTSLZvTzi9DJHZ3tsFv5Thks2lShitNIup9U3gB466OaAZQlDUOywHQbBkBp62gqmoqMqV7
	GXJAhloa0Ow8eNuJyivEMMmUfh8g2lzE1gtWonU0nEjqseaf1OpC0wfn9ZAioYd/s2cg0NTtefx
	AQ9x0c+4=
X-Google-Smtp-Source: AGHT+IFFtCtiSARMd93pL0JyJOCyudDAU1sswKA7btgzw1lh+0ugQN9Buc+cVifymfI57YymC8sOdw==
X-Received: by 2002:a05:6102:b07:b0:4bb:4c52:6730 with SMTP id ada2fe7eead31-4c2e280451fmr2566802137.12.1741192946620;
        Wed, 05 Mar 2025 08:42:26 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c16ba4f676sm2463084137.21.2025.03.05.08.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 08:42:26 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-8670d630d2dso2745948241.1;
        Wed, 05 Mar 2025 08:42:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVb7yy8e8GFcZXpzZMwgDGdMqCy8eNWGuDhUbmIFTqfklmZyXGwf0vyRD8rQUTkrvlUltnFh9Oam6g=@vger.kernel.org, AJvYcCVvFvmfx/2yC/N79JlFenrlbx9eKZGYhiVaVBaDplhK1U5IUi63fG5bMPEpHuDciUldjzsklFe6YFWvnTtz@vger.kernel.org, AJvYcCWRvXqh3D0r0mhB6OmAhbMf5NKHnj7soLiOm/oDdwI2p69bHNXzCUNlDBRWo5Oh4HGAj2Ww3T8DSVU4YToN777nq+M=@vger.kernel.org
X-Received: by 2002:a05:6102:32ce:b0:4c1:8f9b:19f1 with SMTP id
 ada2fe7eead31-4c2e27ffc52mr2603751137.11.1741192945781; Wed, 05 Mar 2025
 08:42:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218114353.406684-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250218114353.406684-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250218114353.406684-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Mar 2025 17:42:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUhZ_qV=16jnWD6cPfuMmZpDUeRMTUgbqy=Mkzp-29=bA@mail.gmail.com>
X-Gm-Features: AQ5f1JoObU_XsJCx6coiJEfiVkW7n6cWn9_elHJ_cqxW739WqN_mxEOGIWm_0-8
Message-ID: <CAMuHMdUhZ_qV=16jnWD6cPfuMmZpDUeRMTUgbqy=Mkzp-29=bA@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: rzv2h-cpg: Add support for enabling PLLs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

Thanks for your patch!

On Tue, 18 Feb 2025 at 12:44, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Some RZ/V2H(P) SoC variants do not have a GPU, resulting in PLLGPU being
> disabled by default in TF-A. Add support for enabling PLL clocks in the
> RZ/V2H(P) CPG driver to manage this.

Does it make sense to enable the GPU PLL if no GPU is present?

> Introduce `is_enabled` and `enable` callbacks to handle PLL state
> transitions. With the `enable` callback, PLLGPU will be turned ON only
> when the GPU node is enabled; otherwise, it will remain off. Define new
> macros for PLL standby and monitor registers to facilitate this process.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/clk/renesas/rzv2h-cpg.c | 57 +++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
> index 1ebaefb36133..d7230a7e285c 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -56,9 +56,16 @@
>
>  #define CPG_CLKSTATUS0         (0x700)
>
> +#define PLL_STBY_RESETB                BIT(0)
> +#define PLL_STBY_RESETB_WEN    BIT(16)

Please move these just below the definition of PLL_STBY_OFFSET().
(Hmm, [KMP]DIV() should be below PLL_CLK1_OFFSET(), and
 SDIV() below PLL_CLK2_OFFSET()).

> +#define PLL_MON_RESETB         BIT(0)
> +#define PLL_MON_LOCK           BIT(4)

Please move these just below the definition of PLL_MON_OFFSET().

> +
>  #define PLL_CLK_ACCESS(n)      (!!((n) & BIT(31)))
>  #define PLL_CLK1_OFFSET(n)     FIELD_GET(GENMASK(15, 0), (n))
>  #define PLL_CLK2_OFFSET(n)     (PLL_CLK1_OFFSET(n) + (0x4))
> +#define PLL_STBY_OFFSET(n)     (PLL_CLK1_OFFSET(n) - (0x4))

Let's subtract 4...

> +#define PLL_MON_OFFSET(n)      (PLL_STBY_OFFSET(n) + (0x10))

... and add 0x10. Where are we now? ;-)

I think it would be better to store the PLL base offset instead of the
PLL CLK1 offset in cpg_core_clk.cfg.conf, and define offsets
relative to that:

    #define CPG_PLL_STBY    0x000
    #define CPG_PLL_CLK1    0x004
    #define CPG_PLL_CLK2    0x008
    #define CPG_PLL_MON     0x010

>
>  /**
>   * struct rzv2h_cpg_priv - Clock Pulse Generator Private Data
> @@ -144,6 +151,54 @@ struct ddiv_clk {
>
>  #define to_ddiv_clock(_div) container_of(_div, struct ddiv_clk, div)
>
> +static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
> +{
> +       struct pll_clk *pll_clk = to_pll(hw);
> +       struct rzv2h_cpg_priv *priv = pll_clk->priv;
> +       u32 mon_offset = PLL_MON_OFFSET(pll_clk->conf);
> +       u32 val;
> +
> +       val = readl(priv->base + mon_offset);

As mon_offset is used only once, you can combine the above 4 lines
into a single line.

> +
> +       /* Ensure both RESETB and LOCK bits are set */
> +       return (val & (PLL_MON_RESETB | PLL_MON_LOCK)) ==
> +              (PLL_MON_RESETB | PLL_MON_LOCK);
> +}
> +
> +static int rzv2h_cpg_pll_clk_enable(struct clk_hw *hw)
> +{
> +       bool enabled = rzv2h_cpg_pll_clk_is_enabled(hw);
> +       struct pll_clk *pll_clk = to_pll(hw);
> +       struct rzv2h_cpg_priv *priv = pll_clk->priv;
> +       u32 conf = pll_clk->conf;
> +       unsigned long flags = 0;
> +       u32 stby_offset;
> +       u32 mon_offset;
> +       u32 val;
> +       int ret;
> +
> +       if (enabled)

    if (!rzv2h_cpg_pll_clk_is_enabled(hw))

for brevity.

> +               return 0;
> +
> +       stby_offset = PLL_STBY_OFFSET(conf);
> +       mon_offset = PLL_MON_OFFSET(conf);
> +
> +       val = PLL_STBY_RESETB_WEN | PLL_STBY_RESETB;
> +       spin_lock_irqsave(&priv->rmw_lock, flags);
> +       writel(val, priv->base + stby_offset);
> +       spin_unlock_irqrestore(&priv->rmw_lock, flags);

A single writel does not need protection by a spinlock.

> +
> +       /* ensure PLL is in normal mode */
> +       ret = readl_poll_timeout(priv->base + mon_offset, val,
> +                                (val & (PLL_MON_RESETB | PLL_MON_LOCK)) ==
> +                                (PLL_MON_RESETB | PLL_MON_LOCK), 0, 250000);

How long does this typically take?
I.e. would it make sense to use a non-zero delay_us()?

> +       if (ret)
> +               dev_err(priv->dev, "Failed to enable PLL 0x%x/%pC\n",
> +                       stby_offset, hw->clk);
> +
> +       return ret;
> +}
> +
>  static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
>                                                    unsigned long parent_rate)
>  {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

