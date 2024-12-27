Return-Path: <linux-renesas-soc+bounces-11721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F1B9FD5B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Dec 2024 16:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C66C1188636E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Dec 2024 15:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428011DD525;
	Fri, 27 Dec 2024 15:49:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2BB1FB3;
	Fri, 27 Dec 2024 15:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735314549; cv=none; b=UiM8VqZr6gUhNkMQCSZqWuG59PfbGfHdKN9p0K4rkgmwd7Se4GuFM0STxFnXHO4Nx1TEFFYGlfOMn+RgyVLMIUlHsU4bXRoH9ZHh4kFq0CG4xpe5Ey4JfEnNK8v+6xrSXMQpHF21t7zSb54U2wXA1hZnqRpLTPb/p+45Z8ZSAQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735314549; c=relaxed/simple;
	bh=nedBCebPEnb/r+XzOI9kh2d/mrCPoN3/SLDO3LVBqSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bzkzALmSBKXEF/8eG3c7m6NBB859xfIRmcHEZRvpfsI5n8FppTTgCCszGzkxpBBvpyyqIO5D+zAmUEh72QIRCtHs4E1ji6FISAIWM2lWuCrZShPvNT2u/ps0RLdHdIWeq1N1SKTFnhG6t1wlRLReoOAnm+mzgXZQpflZOzJ0Chs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85c4b4cf73aso1214697241.2;
        Fri, 27 Dec 2024 07:49:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735314544; x=1735919344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liY2ltfA/VEfCMMP+cXsD4WG5R1EIFc6QwmtjeKusJI=;
        b=Tay9bbk5t+e0VlWu4ui9qREjZjQJe3u0mITsx1OjZbmDR1vFOiE0hl9+vNY6PgM6Jl
         S6y98oJDsM50W5UyHO3Uix5iZx/WWHgrYGIKe1W6OS/1ZV8omgf5vhm3XwneVbRQBIjS
         hVFw48e02oH+Rq7JYsrrQRwhNbz4F7QDsD8+PxakP7kK50XoJzLVMoAAIhml5qosKIx5
         OHaMZ44WJycCVxeiqYQpXfD+9tlbXE5HNfq4xo9E2t9Raw/Erfcnxe/Cd+OWsIYAJ6YB
         PAfrZRPVwjAwNCzQU1WUGhKqZ/SbTa3n8rQ1PihlipldxInss+lTN1fOowRlt5WSN+zz
         w8Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUlWMHoAO/CEajV5YpSLd3KnR30bVwJ50vrxbyNReePlqQcjtrECraWeo3qG/2aVvem2xb4/lSvBkmv31HB@vger.kernel.org, AJvYcCVJ6y8MjfpbgFxqp8NMnHSOMH+CSPcgu6QWhMiZU5HqGhxMZwFEJEeM03gG+2bKfOyGn3x2ql8HUXtUIPy9HrSs/R4=@vger.kernel.org, AJvYcCXYovjxAfD4dPOIN7Nzvgt/wRT9AA/bp2y7a0WloCYuBMsR6zR+XePpp41eXyOS96ysVhDwMWLDHCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4y0s5ECM19rPvHwSnQP63C94UmJpuATU/flH+nZJB8wpcsgnc
	kF2smjW5pregdQ/s0O4LAs9lTGnGxUZL1m9ZGoyCno3L/zkYXEWOiUqZUQRu
X-Gm-Gg: ASbGncuCVeFdt/nbSIeVM58a5hSFJyR/wcXI6K+GrlD1D+mZhoe2v21D0AtvkSusm5X
	r9S1JicxuXxlsvQGLrnTPJQefLlxml8/jCQLvSrl6TCfEFOk9QfnNq2l8m7mEWS6AbcgSA+2WRp
	1S1rMy4vLXYo9FWxh2z+qS10iBd/J3tblI7gaZaAZf0ODe1pno+EAnZ9LJhz74QuSXO2e1dwvWT
	c0FvHPILgbWrnp+/R1zxUkZHP0dX62KtKE1pdw7CDIgvsb2jEYxV+9EnZDQ0Yw6CdTjiO13xGrq
	7UFdbXnaJ3fzfGfCfpM=
X-Google-Smtp-Source: AGHT+IGA+YcNgGRxYoapv6VaJ1PLx8O1cKuHb+dOdGbAWlanE3i6hyr1A7bfszoxUMWoXgL99VjRhA==
X-Received: by 2002:a05:6102:dd1:b0:4af:fca2:1b7 with SMTP id ada2fe7eead31-4b2cc37da95mr22998448137.14.1735314542823;
        Fri, 27 Dec 2024 07:49:02 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98be8asm3027050137.2.2024.12.27.07.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 07:49:02 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4aff5b3845eso2519342137.2;
        Fri, 27 Dec 2024 07:49:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUy7QitHqWiTFAigwWFhQYpbgln3AeGr6z4+BWj8XN/34CiY3C7BlN9Q0pa3Z2Nmsd8rxEZnfOm5g=@vger.kernel.org, AJvYcCWGOF8umkEsGLvJ1xdDWGlFo6NhGHDFR3qlYtIl3c24cz9LsY8qcXOWCHa/5BJg0bOTNaw85UfFsdp9DPQ3iunmjOs=@vger.kernel.org, AJvYcCWyIOgXW0SCx+Q5gHn1oadSsJ0Sa9ao0maSbQPuJZ7sEV5OfjF4vnG09nYXwVmYa2fCwDGXK/foV2TkDudJ@vger.kernel.org
X-Received: by 2002:a05:6102:cc8:b0:4af:ef85:dae4 with SMTP id
 ada2fe7eead31-4b2cc313a2cmr22207098137.5.1735314541984; Fri, 27 Dec 2024
 07:49:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241223173708.384108-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241223173708.384108-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Dec 2024 16:48:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHnnpNa7rzDcU706eQHeBw5c88P769zCcQXzUrkHdijA@mail.gmail.com>
Message-ID: <CAMuHMdXHnnpNa7rzDcU706eQHeBw5c88P769zCcQXzUrkHdijA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] clk: renesas: rzv2h: Switch MSTOP configuration to
 per-bit basis
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, Dec 23, 2024 at 6:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Refactor MSTOP handling to switch from group-based to per-bit
> configuration. Introduce atomic counters for each MSTOP bit and update
> enable/disable logic.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -145,4 +145,6 @@ const struct rzv2h_cpg_info r9a09g047_cpg_info __init=
const =3D {
>         /* Resets */
>         .resets =3D r9a09g047_resets,
>         .num_resets =3D ARRAY_SIZE(r9a09g047_resets),
> +
> +       .num_mstop_bits =3D 208,

Note to self: to be folded into commit 61302a455696728c ("clk: renesas:
rzv2h: Add support for RZ/G3E SoC") in renesas-clk.

>  };
> diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9=
a09g057-cpg.c
> index 59dadedb2217..a45b4020996b 100644
> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> @@ -275,4 +275,6 @@ const struct rzv2h_cpg_info r9a09g057_cpg_info __init=
const =3D {
>         /* Resets */
>         .resets =3D r9a09g057_resets,
>         .num_resets =3D ARRAY_SIZE(r9a09g057_resets),
> +
> +       .num_mstop_bits =3D 192,

Note to self: to be folded into commit 7bd4cb3d6b7c43f0 ("clk:
renesas: rzv2h: Add MSTOP support") in renesas-clk, just like the
rest below.

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -43,6 +43,8 @@
>
>  #define CPG_BUS_1_MSTOP                (0xd00)
>  #define CPG_BUS_MSTOP(m)       (CPG_BUS_1_MSTOP + ((m) - 1) * 4)
> +/* On RZ/V2H(P) and RZ/G3E CPG_BUS_m_MSTOP starts from m =3D 1 */

If you think you need this comment, please move it two lines up,
as it also applies to those lines.

> +#define GET_MSTOP_IDX(mask)    ((FIELD_GET(BUS_MSTOP_IDX_MASK, (mask))) =
- 1)

I think subtracting one here is the wrong abstraction (see below)...

>
>  #define KDIV(val)              ((s16)FIELD_GET(GENMASK(31, 16), (val)))
>  #define MDIV(val)              FIELD_GET(GENMASK(15, 6), (val))
> @@ -68,6 +70,7 @@
>   * @resets: Array of resets
>   * @num_resets: Number of Module Resets in info->resets[]
>   * @last_dt_core_clk: ID of the last Core Clock exported to DT
> + * @mstop_count: Array of mstop

Array of mstop values?

>   * @rcdev: Reset controller entity
>   */
>  struct rzv2h_cpg_priv {
> @@ -82,17 +85,13 @@ struct rzv2h_cpg_priv {
>         unsigned int num_resets;
>         unsigned int last_dt_core_clk;
>
> +       atomic_t *mstop_count;
> +
>         struct reset_controller_dev rcdev;
>  };

> @@ -446,36 +445,65 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_c=
lk *core,
>  }
>
>  static void rzv2h_mod_clock_mstop_enable(struct rzv2h_cpg_priv *priv,
> -                                        struct mod_clock *clock)
> +                                        u32 mstop_data)
>  {
> +       u16 mstop_mask =3D FIELD_GET(BUS_MSTOP_BITS_MASK, (mstop_data));

No need for parentheses around mstop_data.

> +       u16 mstop_index =3D GET_MSTOP_IDX(mstop_data);
> +       unsigned int index =3D mstop_index * 16;

mstop_index already has one subtracted inside GET_MSTOP_IDX(),
because you need that for indexing priv->mstop_count[]...

>         unsigned long flags;
> -       u32 val;
> +       unsigned int i;
> +       u32 val =3D 0;
>
>         spin_lock_irqsave(&priv->rmw_lock, flags);
> -       if (!refcount_read(&clock->mstop->ref_cnt)) {
> -               val =3D clock->mstop->mask << 16;
> -               writel(val, priv->base + CPG_BUS_MSTOP(clock->mstop->idx)=
);
> -               refcount_set(&clock->mstop->ref_cnt, 1);
> -       } else {
> -               refcount_inc(&clock->mstop->ref_cnt);
> +       for_each_set_bit(i, (unsigned long *)&mstop_mask, 16) {

Please make mstop_mask unsigned long instead of using a
non-portable cast.

> +               if (!atomic_read(&priv->mstop_count[index + i]))
> +                       val |=3D BIT(i) << 16;
> +               atomic_inc(&priv->mstop_count[index + i]);
>         }
> +       if (val)
> +               writel(val, priv->base + CPG_BUS_MSTOP(mstop_index + 1));

... hence you have to re-add one here, which will be subtracted again
inside CPG_BUS_MSTOP().

So what about:
  1. Dropping macro GET_MSTOP_IDX(),
  2. Using mstop_index =3D FIELD_GET(BUS_MSTOP_BITS_MASK, mstop_data),
     so you can call CPG_BUS_MSTOP(mstop_index) directly,
  3. Letting priv->mstop_count point 16 entries before the allocated
     array, so you can index it by the logical mstop number directly.


>         spin_unlock_irqrestore(&priv->rmw_lock, flags);
>  }
>
>  static void rzv2h_mod_clock_mstop_disable(struct rzv2h_cpg_priv *priv,
> -                                         struct mod_clock *clock)
> +                                         u32 mstop_data)
>  {
> +       u16 mstop_mask =3D FIELD_GET(BUS_MSTOP_BITS_MASK, (mstop_data));
> +       u16 mstop_index =3D GET_MSTOP_IDX(mstop_data);
> +       unsigned int index =3D mstop_index * 16;
>         unsigned long flags;
> -       u32 val;
> +       unsigned int i;
> +       u32 val =3D 0;
>
>         spin_lock_irqsave(&priv->rmw_lock, flags);
> -       if (refcount_dec_and_test(&clock->mstop->ref_cnt)) {
> -               val =3D clock->mstop->mask << 16 | clock->mstop->mask;
> -               writel(val, priv->base + CPG_BUS_MSTOP(clock->mstop->idx)=
);
> +       for_each_set_bit(i, (unsigned long *)&mstop_mask, 16) {
> +               if (!atomic_read(&priv->mstop_count[index + i]) ||
> +                   atomic_dec_and_test(&priv->mstop_count[index + i]))

Why the first part of the check?
Because you only enable, and never disable, mstop bits in the initial
synchronization in rzv2h_cpg_register_mod_clk()?

> +                       val |=3D BIT(i) << 16 | BIT(i);
>         }
> +       if (val)
> +               writel(val, priv->base + CPG_BUS_MSTOP(mstop_index + 1));
>         spin_unlock_irqrestore(&priv->rmw_lock, flags);
>  }
>
> +static int rzv2h_mod_clock_is_enabled(struct clk_hw *hw)
> +{
> +       struct mod_clock *clock =3D to_mod_clock(hw);
> +       struct rzv2h_cpg_priv *priv =3D clock->priv;
> +       u32 bitmask;
> +       u32 offset;
> +
> +       if (clock->mon_index >=3D 0) {
> +               offset =3D GET_CLK_MON_OFFSET(clock->mon_index);
> +               bitmask =3D BIT(clock->mon_bit);
> +       } else {
> +               offset =3D GET_CLK_ON_OFFSET(clock->on_index);
> +               bitmask =3D BIT(clock->on_bit);
> +       }
> +
> +       return readl(priv->base + offset) & bitmask;
> +}
> +
>  static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enable)
>  {
>         struct mod_clock *clock =3D to_mod_clock(hw);
> @@ -489,15 +517,19 @@ static int rzv2h_mod_clock_endisable(struct clk_hw =
*hw, bool enable)
>         dev_dbg(dev, "CLK_ON 0x%x/%pC %s\n", reg, hw->clk,
>                 enable ? "ON" : "OFF");
>
> +       if ((rzv2h_mod_clock_is_enabled(hw) && enable) ||
> +           (!rzv2h_mod_clock_is_enabled(hw) && !enable))
> +               return 0;

This may call rzv2h_mod_clock_is_enabled() twice, as readl() is a
compiler barrier.  You can avoid that using:

    bool enabled =3D rzv2h_mod_clock_is_enabled(hw);
    if (enabled =3D=3D enable)
            return 0;

> +
>         value =3D bitmask << 16;
>         if (enable) {
>                 value |=3D bitmask;
>                 writel(value, priv->base + reg);
> -               if (clock->mstop)
> -                       rzv2h_mod_clock_mstop_enable(priv, clock);
> +               if (clock->mstop_data !=3D BUS_MSTOP_NONE)
> +                       rzv2h_mod_clock_mstop_enable(priv, clock->mstop_d=
ata);
>         } else {
> -               if (clock->mstop)
> -                       rzv2h_mod_clock_mstop_disable(priv, clock);
> +               if (clock->mstop_data !=3D BUS_MSTOP_NONE)
> +                       rzv2h_mod_clock_mstop_disable(priv, clock->mstop_=
data);
>                 writel(value, priv->base + reg);
>         }
>

> @@ -647,13 +619,16 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_c=
lk *mod,
>
>         priv->clks[id] =3D clock->hw.clk;
>
> -       if (mod->mstop_data !=3D BUS_MSTOP_NONE) {
> -               clock->mstop =3D rzv2h_cpg_get_mstop(priv, clock, mod->ms=
top_data);
> -               if (!clock->mstop) {
> -                       clk =3D ERR_PTR(-ENOMEM);
> -                       goto fail;
> -               }
> -       }
> +       /*
> +        * Ensure the module clocks and MSTOP bits are synchronized when =
they are
> +        * turned ON by the bootloader. Enable MSTOP bits for module cloc=
ks that were
> +        * turned ON in an earlier boot stage. Skip critical clocks, as t=
hey will be
> +        * turned ON immediately upon registration, and the MSTOP counter=
 will be
> +        * updated through the rzv2h_mod_clock_enable() path.
> +        */
> +       if (clock->mstop_data !=3D BUS_MSTOP_NONE &&
> +           !mod->critical && rzv2h_mod_clock_is_enabled(&clock->hw))
> +               rzv2h_mod_clock_mstop_enable(priv, clock->mstop_data);
>
>         return;
>
> @@ -922,6 +897,13 @@ static int __init rzv2h_cpg_probe(struct platform_de=
vice *pdev)
>         if (!clks)
>                 return -ENOMEM;
>
> +       priv->mstop_count =3D devm_kmalloc_array(dev, info->num_mstop_bit=
s,
> +                                              sizeof(*priv->mstop_count)=
, GFP_KERNEL);

devm_kcalloc() ...

> +       if (!priv->mstop_count)
> +               return -ENOMEM;
> +       for (i =3D 0; i < info->num_mstop_bits; i++)
> +               atomic_set(&priv->mstop_count[i], 0);

... so you don't need to zero them.

> +
>         priv->resets =3D devm_kmemdup(dev, info->resets, sizeof(*info->re=
sets) *
>                                     info->num_resets, GFP_KERNEL);
>         if (!priv->resets)

The general idea behind it LGTM.

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

