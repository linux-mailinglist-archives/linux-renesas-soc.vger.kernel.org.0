Return-Path: <linux-renesas-soc+bounces-26549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B09D0BD90
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 19:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFC56301355C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 18:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F3919CCF7;
	Fri,  9 Jan 2026 18:33:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9D7218845
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 18:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983608; cv=none; b=CI/kEBGvl8N3tsFn2kWlAO96jSUw7RYbksR6JWkVL7bSyJy1U5Ns0CV2Zh5F70SeU48YZnbhMARP4JjtPmLwLMteTXzitqF71Q6EaUhlp98ob0WKzYIh8hXhe/MRMFRr8bPeAO+/UKNwz1kReKzuRPeCc9TfrpZOYXSaB+yBy8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983608; c=relaxed/simple;
	bh=8NvlTqu6j0EpjloynCSX8IQE4vxB8/H2cpLGf91EbfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ejhQMm7SHvxifQEG4J3jAy096+Lft1nb6KQr5yw7ai1zqVF5PPE8z8Cxzw1COurTtTpU5btsCgyzjUQwO/0cQ7yf5ZZGd8v8PvTyDp9luksWZsnBJWPGwGPTY4KJIXg4NY/iWSiG1DBoBEChgw5n/fYzqFAi1LUWv0WlbCkPqLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-3e8f418e051so3232584fac.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 10:33:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767983604; x=1768588404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcttSXs7hZcQIHZPsbTRNE9EfXDmld5bm3jzlnDASfE=;
        b=BAObQvQfLPEznfXl+yLSga47BSZUQaolgKwbFURYVbPvhEC3eiSqnsLNddUix/VLMW
         slDcuO0uvA1LE2/jbOQdkf4Oao7dOX80Jhxv/2u9bu7mutRuVvfohcngaNTlyg6s5Dnu
         07/WrJOTYJCPMo4+R5SS298x4xtoDOGFpUM1qnsvWduRauVZ+NZaTmOXh+aYzfb3la6D
         L72M/nlp86pSE7+awNAphuIxnWpj3cy9+RHbLmnf8kBWgRnzwN48dkjAsuDA0aCiMZNo
         OzJkpODJCNr/b2m99sd4L0Y5wjqJfFDGgk4rOdlv1hppLn2tN9vOck492JIk1wIN8RkQ
         ja3w==
X-Forwarded-Encrypted: i=1; AJvYcCUflvD6NU6DsRvJENZ1Ro/KSCZexX/TiCPlym+MvaZaYYzueEPN1+XYZtJ5NjrW7cxTI6465yjFCVZSAmVeQczjLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfoMX2CGHWbeIqruvCa3ut1iKZvSrntYnXjUZhdL37I96kcII/
	JGz6iXxipziOZYL8G87EtQ4q8FNo7deWW4hdvV2Tv3K34KyGw4jcwybQ4v+U2bpI
X-Gm-Gg: AY/fxX4j30lqqdJiec79rOazr2NgEPc28O73WD+HfhiS4Ssd6N+x16ZztmvO0AuSb0R
	QCvJYgnIR0WhtVDwgsENAOwH0GeUYbpEK7tNiFqqllNHue5XsGGcVZYI49PX42DV/4GPgc1umK6
	VPJMhQ+7UvUjvR3iT/jgZd+pmfSNqTSGFtG1CgXgRRf11wYxlvwLUCzrYzJALrKxJeVTw82ZlQL
	gLzmQU1KVpagfaZtB2YmMzjbuN301wl4ImKWiYH1N6P87P0G8EDLdlCv1OQ7wI2agXE/VzuCdmo
	JmbXWM4+R1Iq5YoKynrwHO9Mc+OlB48AmhKHkJaZZ7nETsIlcO8b2MwD0siAXkEzliIU+ehvCfN
	w5Ge5QWRmoho1rLJws5XyrRHLQOfTmhdGol6GSy8s86uw1+OOi+qtxHMKsNwPR18Ag2xr2yS4zh
	B8C8N/jyV3YhHsXuCvnYS9LXy1G8ajIMQBvsTGaRAMu3KQlZgS
X-Google-Smtp-Source: AGHT+IHduCp0P6XkKJuZ/MerIVpyIu2IoK9Cqi0oBeUG5s+atkWtnyLCIpjg+DQja7bk0Nu8bdRdPA==
X-Received: by 2002:a05:6870:b296:b0:3c8:d325:b7ac with SMTP id 586e51a60fabf-3ffc08f4a15mr6062351fac.4.1767983603877;
        Fri, 09 Jan 2026 10:33:23 -0800 (PST)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com. [209.85.160.46])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffb279e939sm6404170fac.16.2026.01.09.10.33.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 10:33:23 -0800 (PST)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-3f4f9ea26aaso3415031fac.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 10:33:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVju6At2hhU57LpCX9Ufcvb1F4TTcitGSiEp+bNXxhOo5EUf0ComxDtFOGGm+ZoGcLPmC2MuletaBBVHWam7xuXXg==@vger.kernel.org
X-Received: by 2002:a05:6102:3908:b0:5ee:a6f8:f925 with SMTP id
 ada2fe7eead31-5eea6f90e16mr2088665137.8.1767983235950; Fri, 09 Jan 2026
 10:27:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:27:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXU6traB73KaFj0kRtdo4NDT4ynUyfd-4L36=D6cUUd6A@mail.gmail.com>
X-Gm-Features: AZwV_QiFWie1jtTH6cP5clrt_EyRli2uQRED0h6evUp71Jo1c1Hn9WoeLwyfMeU
Message-ID: <CAMuHMdXU6traB73KaFj0kRtdo4NDT4ynUyfd-4L36=D6cUUd6A@mail.gmail.com>
Subject: Re: [PATCH 01/22] clk: renesas: rzv2h: Add PLLDSI clk mux support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add PLLDSI clk mux support to select PLLDSI clock from different clock
> sources.
>
> Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
> them in the clock driver.
>
> Extend the determine_rate callback to calculate and propagate PLL
> parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
> using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

[...]

>  static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
>  {
>         struct pll_clk *pll_clk = to_pll(hw);
> @@ -1085,6 +1213,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
>         case CLK_TYPE_PLLDSI_DIV:
>                 clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
>                 break;
> +       case CLK_TYPE_PLLDSI_SMUX:
> +               clk = rzv2h_cpg_plldsi_smux_clk_register(core, priv);
> +               break;
>         default:
>                 goto fail;
>         }
> diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
> index dc957bdaf5e9..5f6e775612e7 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -203,6 +203,7 @@ enum clk_types {
>         CLK_TYPE_SMUX,          /* Static Mux */
>         CLK_TYPE_PLLDSI,        /* PLLDSI */
>         CLK_TYPE_PLLDSI_DIV,    /* PLLDSI divider */
> +       CLK_TYPE_PLLDSI_SMUX,   /* PLLDSI Static Mux */
>  };
>
>  #define DEF_TYPE(_name, _id, _type...) \
> @@ -241,6 +242,13 @@ enum clk_types {
>                  .dtable = _dtable, \
>                  .parent = _parent, \
>                  .flag = CLK_SET_RATE_PARENT)
> +#define DEF_PLLDSI_SMUX(_name, _id, _smux_packed, _parent_names) \
> +       DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_SMUX, \
> +                .cfg.smux = _smux_packed, \
> +                .parent_names = _parent_names, \
> +                .num_parents = ARRAY_SIZE(_parent_names), \
> +                .flag = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, \
> +                .mux_flags = CLK_MUX_HIWORD_MASK)
>
>  /**
>   * struct rzv2h_mod_clk - Module Clocks definitions

Why do you need a completely new clock type, and can't you just use
the existing CLK_TYPE_SMUX?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

