Return-Path: <linux-renesas-soc+bounces-18786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 651F6AE9E87
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 15:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA4C93A46CD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 13:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A1728BAAD;
	Thu, 26 Jun 2025 13:22:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B45289E0D;
	Thu, 26 Jun 2025 13:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944148; cv=none; b=uQL6zgVhN8vKnFetdxcNa8A4XH89J7r2LFaV/+wfI6qT3BU+IVs8PjPO3sgT3Sdra0xiCOJwqX+9UH3qb8T1IX0dLO19uQhNvpyjFiBLWOSqtU747I/wJv4T+ZVu2P7j+CGJWBzh2pRFrAo49Uf8ZMKiu+uPkqIaR1XXPN2BIWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944148; c=relaxed/simple;
	bh=mV9mNsEWH/V5Q2P6cS/JQcjMaDc3Rijx9fBYLM4n7Mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTDWjH144ySA0KQsHAA8vy3XoxTIlWg6eHyz8UMVNfX6kOlnrQdzpWRnmXHgbKAy14VUWMlKVW47NMwZ1WLyMzsnJYqF0vCc5e6Ffu7go5z3pGMWO3jE/XNLvzrZS3fHWhmC8ssMxh0eolhSfdE5LFzu5gsmlLHcRWvgoshljCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d219896edeso102440585a.1;
        Thu, 26 Jun 2025 06:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750944145; x=1751548945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8hDBb4/b+eNSRxSeGUOjC6YvOZSs2hSxxLjv9B1kfc=;
        b=pyvDHdV2/cChNrb497rGo0S1BgPoBV3ts9A3TPYAkvsKszfa7Hyzxxk0UtOae3jV70
         wHGD5X1rmhRlfM0yV+n27zQuyDomr+ksQxpoDt1pnb5oTz0xmR911hu7w7QSeQtEKyUn
         8Ukna+Myj/F71KoYXcYhL3Lprg6tRRZpMpHWu48f5WJIp+UOd32zEekA5/u+EUya5CM1
         KLiZH6vMaJyW/SKE7YTdiYgXG2h3QuFUXt6cxniIwXk8ItYghfa8y7oq5a3vhUeeXWaT
         rMOlZcs6uHF1r+T6PgtP2QxTautT6QYWf0gYaQCqPUcQcOAccDqujGMJ4KgLWIYCh4nI
         RdYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj/ynQo9ZWwRNiBWxrZnNQdplmHiuOnz9wEZrUBHHz2EOoxHrU84CvLHlESYMBIIzs0ri7QpQt8OVk@vger.kernel.org, AJvYcCVuZAXq0leclSaFGT0KxI3MVBgAOli4GOh8nlLTBt8PDcNdtkwvKiJkgJz9YxkyIprFia0sw8qWANU8GyRs@vger.kernel.org, AJvYcCWmG2Lg38rx9Jba4ZcNHICH0MkrAGvxH8owO2ZYCAo6dFHqZOuNq5kJySkf5WC1xOh8sbRvUoJ9y1vW@vger.kernel.org, AJvYcCXOEhiiuMolOvqEmI6Y9uxUNIqhz2cMzZI+VZ9hNbcEvx0KGyhTv7Ng+09Dwewlr7sFFG43rM9ij1D2fJO9VHeoeK0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo469uHANnWG2UYJLXVKDuD1WnQi87JtVF6ycv7d6LUYhrk4n2
	9lv1EXb2+bN+uC0OQ8WLtBRhx20P6qsnhcBU1XdCsh22XLFNyDc4/SK6ayZl4QBE
X-Gm-Gg: ASbGncvZ33Vl16sO8Enu7aknHewTtfUbxjjA89tGxT0Knb8F4Nr2SCezl4xURkHkv9J
	R0YlqbCV3IhnlQGs3vX1nUjMDRyqIyqZMKYI350Wd1tSTOe4WQX/Dpl6surXT8NqTlU9Pqe+7gx
	VMjoaY+VVlLQ9oIlRRYe5UPjlmu7LVqdx1WvD5DNYu59a6r+jd60dpbUYWmLEyNIEmxWxU96K3m
	VahLTD1VwMpuaL8nV1SA3AtsnuuUVdSkuyM+SdLsY5o1FxOmsYojW7U9ntiN+AfATFUpKtvgvcK
	K++2Nh3SjG6vC3qfzlUXCJ46L0gPB282pwGR7p5Yt0F4FVOVfTjGx8Siopp5blBpM4rnak6bv9W
	UMT6LP3Qp4/JJSQF0Q6Anuzf5lcez
X-Google-Smtp-Source: AGHT+IEAymfAGWqa1lsc+lE9aekt+GQmzOq8aWOhlreKofdFa70OokYDqTp4i8/hZux35lG7OKU96A==
X-Received: by 2002:a05:620a:7004:b0:7c7:ba67:38a with SMTP id af79cd13be357-7d4296920c1mr1162621385a.6.1750944144634;
        Thu, 26 Jun 2025 06:22:24 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443150adesm378585a.26.2025.06.26.06.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 06:22:24 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d412988b14so97565685a.3;
        Thu, 26 Jun 2025 06:22:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNy6i86XkyaVNTZAgIUZSt1s9WmUMYW6X7DQLgk9QOjK+k1wlhiDP4rTFCmUmDB2oVYkFr14cLW02I@vger.kernel.org, AJvYcCUSo3KGRhHPZKEVW4WDFS3i48pjyES51AfBJvya780NMApbdVZ3M/RJTZlQlfgg9nkuZYiAYSGJTBvoumgk@vger.kernel.org, AJvYcCUdbKItAQVz20QuyJYVT3cWuTyUYDW2k8X0axzF+uQAo6JxUpRKgV7zjjqMzSfDACE0j0/rO7qW776lQjLv42cHBSI=@vger.kernel.org, AJvYcCUlO/6kAh2YeY5nO9IrCBpFaRD4K9SRXdouxtQGeX8oppSwN/PQ871p6o205npRNqO/B3OTXg8D7uEL@vger.kernel.org
X-Received: by 2002:a05:620a:1a28:b0:7d4:2922:14a4 with SMTP id
 af79cd13be357-7d4296e5269mr1006485085a.23.1750944143752; Thu, 26 Jun 2025
 06:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624173030.472196-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250624173030.472196-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250624173030.472196-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 15:22:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsA4mC+D8ftx74_XeuBjpv-9EQN0rgVLPsxjmrO3+rWg@mail.gmail.com>
X-Gm-Features: Ac12FXyZOhKLUwzapIWzq_IcowUr7r_QEZiZS2TBQeWgQqz_SzAvs4KKWCo_QvU
Message-ID: <CAMuHMdWsA4mC+D8ftx74_XeuBjpv-9EQN0rgVLPsxjmrO3+rWg@mail.gmail.com>
Subject: Re: [PATCH 4/6] clk: renesas: rzv2h: Add fixed-factor module clocks
 with status reporting
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 24 Jun 2025 at 19:30, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for fixed-factor module clocks that can report their enable
> status through the module status monitor. Introduce a new clock type,
> CLK_TYPE_FF_MOD_STATUS, and define the associated structure,
> rzv2h_ff_mod_status_clk, to manage these clocks.
>
> Implement the .is_enabled callback by reading the module status register
> using monitor index and bit definitions. Provide a helper macro,
> DEF_FIXED_MOD_STATUS, to simplify the definition of such clocks.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

One early review comment below...

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +static struct clk_ops rzv2h_clk_ff_mod_status_ops;

This is an empty block of 200 bytes, consuming memory even when running
on a different platform.

> +static struct clk * __init
> +rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
> +                                       struct rzv2h_cpg_priv *priv)
> +{
> +       struct rzv2h_ff_mod_status_clk *clk_hw_data;
> +       struct clk_init_data init = { };
> +       struct clk_fixed_factor *fix;
> +       const struct clk *parent;
> +       const char *parent_name;
> +       int ret;
> +
> +       WARN_DEBUG(core->parent >= priv->num_core_clks);
> +       parent = priv->clks[core->parent];
> +       if (IS_ERR(parent))
> +               return ERR_CAST(parent);
> +
> +       parent_name = __clk_get_name(parent);
> +       parent = priv->clks[core->parent];
> +       if (IS_ERR(parent))
> +               return ERR_CAST(parent);
> +
> +       clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
> +       if (!clk_hw_data)
> +               return ERR_PTR(-ENOMEM);
> +
> +       clk_hw_data->priv = priv;
> +       clk_hw_data->conf = core->cfg.fixed_mod;
> +
> +       rzv2h_clk_ff_mod_status_ops = clk_fixed_factor_ops;

This overwrites rzv2h_clk_ff_mod_status_ops in every call (currently
there is only one).

> +       rzv2h_clk_ff_mod_status_ops.is_enabled = rzv2h_clk_ff_mod_status_is_enabled;

If there would be multiple calls, there is a short time window where
rzv2h_clk_ff_mod_status_ops.is_enabled is NULL, possibly affecting
already-registered clocks of the same type.

Hence I think you better store rzv2h_clk_ff_mod_status_ops inside
rzv2h_cpg_priv (so it is allocated dynamically), and initialize it from
rzv2h_cpg_probe (so it is initialized once).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

