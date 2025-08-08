Return-Path: <linux-renesas-soc+bounces-20136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C4EB1E64F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 12:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DEDF189A9F5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 10:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33E3274B4F;
	Fri,  8 Aug 2025 10:14:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC1926563F;
	Fri,  8 Aug 2025 10:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754648080; cv=none; b=TepAr+t/nKNrXMz/pH0wAMBXl2Is/Wl8XEkd7OsmP/DeCHzLBglbn+CuOLD2UXDENDf+/A99jELsaKXuBNPTtogQ/cSLZrDYk0NKqru9PPWJ/DcUJHI624wbloubDzsbnSmV6Wye3n21jFRL+AMl2sP7FmbTABOIZQ/aH6xU6cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754648080; c=relaxed/simple;
	bh=w/qdwjVHNDDZLzDsuDbzSZxr4tkdnan/L4SP6s1ArI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F48nGcVx4faX/3SI7YZX1wo5pDEAdMHgtfCrgD8edOM17zmAVA9rNQgjRnJDTQRTO1YJ/z07/XygGGWpMmSr97YImRdJ37TEJ/mjWM55Ioq+n9zqZwa4JVvQxbIH/rulJomglb+nDyj8r+H4PlgCEjfrCs0Pd3tXhN+YI+Hgvrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-539345ebfc8so576957e0c.2;
        Fri, 08 Aug 2025 03:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754648076; x=1755252876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+X/CNJY/y+tjuDsD+fIjck3ajvT+Qgzz/ied6wiOqeI=;
        b=hwFVOAAKa8R7en6mpFypIMTqMtsF7cmmKC6OPOUSOaY7BS3Z4eJ+shs7VXpB9+dO4t
         i/1vvgUb+Ykt9V+gBObG7nJU1hkjkjeStcBQAhh8O+E1+gtv39GM0BqGZSJM6mtnYMlL
         BrKE9CIWak5wzu5Il/soglGrPD98OTtyWsYMhFQ2Y2u48cY085w3dygHAlQVIAxx9Ple
         F35D9Zq0A4lgrIX29XYH55oWp2umuGmjiJ/pzGnuEeois4bF3QMY+dgUkGM3LbTI02eR
         7btfmxM6SKZdCRKZQ/nHS+aVg0hjwGSlREqtbpaH8pYWzbikRKPiNJG7uiBoGhc/rpS1
         XR+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVX3VtQ1ilcdDabK4Y87TbW+7GpBw94g3uGQ7qlnJtZA2y1s97gefYKSBE5elN1OmpmRjey5j9KEe8W+gQA@vger.kernel.org, AJvYcCVgXQFkU44myJvYBbfjBfcectez6yDQ0WV+Wo6gYuIRopUB0/IcWlgAVHSRXYpaSZcVpRKIMPpMGnM=@vger.kernel.org, AJvYcCWRUKhEDRkIqXDZkInXItEl4z8TrXIUEoj/zla3+kRUubjfZbqGsm2aKnEAgJ5K4x4ygcVjO4t/wb26Pfnrf9O6ZSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxziBXEfDRxnp3PmOJI6z+vLKKRrEzT7BTj6wJL0bl/rPTDUkqD
	yEkzUTm4s6JUbwKC3Cwo3EWCBElwL69hEbVKYw24JrrkoYjW74oMvNnNK74XH0ra
X-Gm-Gg: ASbGnctlNeGWysQq7x8vI2HmUguPEkehQ3k9BHEkzJqpGsFigTDPSN1hX6u49so4eFN
	90jVWxUU5Sc51oqgCg+RWWbc64w7s9O4M9rEQ6eGgFD+WnkzsKblVDUWOO7dt+UbwgY8c9mE1GG
	XvGweKJ+MnBlW/oX4fhplTcaq2LT17kQFMGpXPR1jSAWZupWdkG5NI8A3tqVWyV/8smIqLYznXJ
	tN0oRpVcV4jaRL3PDjyGyu495bICc3+pom3TXhnOQ+z7YEVOcba4q8S9pkx5Js9ONS1Ad3BhPHn
	v1/yW3+HQsxVIdqBmVvTd7OnxuxVmd2gfFRS+KXsJ/BbZlC16qKc/sP/rg+DHmkS+X+T5RfiI7H
	QP6ZFuKDrA7yGJa70Pgb6zPiB0nsmTPUpzMvaJAsBrprhxhxoRmBKEACYk8sL
X-Google-Smtp-Source: AGHT+IGyf7c8vpJVbbTV813K3r2dn8r1ipoyvMxvS+clsTp6jK1AQkYIP1MojOmR8fZPKcG2LkRDvA==
X-Received: by 2002:a05:6122:3188:b0:534:8213:af78 with SMTP id 71dfb90a1353d-53a52edd2fbmr818727e0c.8.1754648076301;
        Fri, 08 Aug 2025 03:14:36 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b01ae75fsm967335e0c.10.2025.08.08.03.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 03:14:36 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4fe234cf176so902001137.2;
        Fri, 08 Aug 2025 03:14:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWA+/Tue0u6gZE8ojCGcJBaYCKylgfB1fwh9q6ZDFz4Z2BIrdXYdkEWmKa2Pe26EmFJYnDDDyBSmbn31HVjfqOIrj8=@vger.kernel.org, AJvYcCX3hWTLM3lKRw1BKMP/4Z3YZtx5YUTYLG6y6VWF3L1Ea3L/DuOgUaHxi3VUX1vgOg8+61ABgF/pKSA=@vger.kernel.org, AJvYcCXYF/jUbRHWfoEY/doRim5Qg0j1btvd6e/9maAJYv8FFb2PLGbHu5FUrUQ+uoE4CNqqJlmm20jMacisBrT2@vger.kernel.org
X-Received: by 2002:a67:e7c6:0:b0:4fb:142:f4d3 with SMTP id
 ada2fe7eead31-506106dff09mr754537137.25.1754648075474; Fri, 08 Aug 2025
 03:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807164353.1543461-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250807164353.1543461-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Aug 2025 12:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJT3+dnikgULm7FXFwussc-9o9h8eoDP-Np9Y6JZNHYg@mail.gmail.com>
X-Gm-Features: Ac12FXzLjHvfiWdxpbcJMwCTtxegBmK5u0avy7Dc0PmNxHeD6juiVvnmd9LOZ84
Message-ID: <CAMuHMdVJT3+dnikgULm7FXFwussc-9o9h8eoDP-Np9Y6JZNHYg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add module reset support for RZ/T2H
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 7 Aug 2025 at 18:44, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for module reset handling on the RZ/T2H SoC. Unlike earlier
> CPG/MSSR variants, RZ/T2H uses a unified set of Module Reset Control
> Registers (MRCR) where both reset and deassert actions are done via
> read-modify-write (RMW) to the same register.
>
> Introduce a new MRCR offset table (mrcr_for_rzt2h) for RZ/T2H and assign
> it to both reset_regs and reset_clear_regs. For RZ/T2H, set
> rcdev.nr_resets based on the number of MRCR registers rather than the
> number of module clocks.
>
> Update the reset/assert/deassert/status operations to perform RMW when
> handling RZ/T2H-specific layout. This enables proper reset sequencing for
> modules on RZ/T2H without affecting the behavior of other supported SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -137,6 +137,22 @@ static const u16 srcr_for_gen4[] = {
>         0x2C60, 0x2C64, 0x2C68, 0x2C6C, 0x2C70, 0x2C74,
>  };
>
> +static const u16 mrcr_for_rzt2h[] = {
> +       0x240,  /* MRCTLA */
> +       0x244,  /* Reserved */
> +       0x248,  /* Reserved */
> +       0x24C,  /* Reserved */
> +       0x250,  /* MRCTLE */
> +       0x254,  /* Reserved */
> +       0x258,  /* Reserved */
> +       0x25C,  /* Reserved */
> +       0x260,  /* MRCTLI */
> +       0x264,  /* Reserved */
> +       0x268,  /* Reserved */
> +       0x26C,  /* Reserved */
> +       0x270,  /* MRCTLM */
> +};
> +
>  /*
>   * Software Reset Clearing Register offsets
>   */
> @@ -686,12 +702,16 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
>
>         dev_dbg(priv->dev, "reset %u%02u\n", reg, bit);
>
> +       if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
> +               bitmask = readl(priv->pub.base0 + priv->reset_regs[reg]) | bitmask;

bitmask |= ...

>         /* Reset module */
>         writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);

However, you should hold the &priv->pub.rmw_lock spinlock everywhere
you do an RMW operation.

>         /* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
>         udelay(35);

Please read "6.5.1 Notes on Module Reset Control Register Operation"...

> +       if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
> +               bitmask = readl(priv->pub.base0 + priv->reset_clear_regs[reg]) & ~bitmask;
>         /* Release module from reset state */
>         writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);

Hence I think it would be worthwhile to have your own struct
reset_control_ops mrcr_reset_ops with its own set of callbacks.

> @@ -764,7 +788,16 @@ static int cpg_mssr_reset_controller_register(struct cpg_mssr_priv *priv)
>         priv->rcdev.of_node = priv->dev->of_node;
>         priv->rcdev.of_reset_n_cells = 1;
>         priv->rcdev.of_xlate = cpg_mssr_reset_xlate;
> -       priv->rcdev.nr_resets = priv->num_mod_clks;
> +
> +       /*
> +        * RZ/T2H (and family) has the Module Reset Control Registers
> +        * which allows control resets of certain modules.
> +        * The number of resets is not equal to the number of module clocks.
> +        */
> +       if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
> +               priv->rcdev.nr_resets = ARRAY_SIZE(mrcr_for_rzt2h) * 32;
> +       else
> +               priv->rcdev.nr_resets = priv->num_mod_clks;

I guess this is fine for now, but probably we will have to introduce
a proper nr_resets field when the next RZ/T* SoC is introduced...

>         return devm_reset_controller_register(priv->dev, &priv->rcdev);
>  }
>
> @@ -1166,6 +1199,8 @@ static int __init cpg_mssr_common_init(struct device *dev,
>                 priv->control_regs = stbcr;
>         } else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
>                 priv->control_regs = mstpcr_for_rzt2h;
> +               priv->reset_regs = mrcr_for_rzt2h;
> +               priv->reset_clear_regs = mrcr_for_rzt2h;

With its own set of reset callbacks directly accessing mrcr_for_rzt2h,
this could be dropped.  However, if you want to keep on using
cpg_mssr_status(), you do have to keep the assignment to
priv->reset_regs.

>         } else if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4) {
>                 priv->status_regs = mstpsr_for_gen4;
>                 priv->control_regs = mstpcr_for_gen4;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

