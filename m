Return-Path: <linux-renesas-soc+bounces-20704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D29D8B2C51C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 15:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C96C61645E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 13:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F06C33CE84;
	Tue, 19 Aug 2025 13:14:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF830322A2A;
	Tue, 19 Aug 2025 13:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755609264; cv=none; b=tTpC6kMfqcTdsUxQDpKc75iukvvGarjwCPaS+qwJS/wiuvASkkkat0TgNi6b+l5LVStnJ+eb8qXpjjAeBVYJtwyjp7WibIlwyabvYFdWD+OLet5UPm9LU+vsV9zxCx9OFFv2cW4KdjB4R0xKjIJ0/zZIgCwguwsj1wuLl5CjutU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755609264; c=relaxed/simple;
	bh=8SUfbaZGZo0VZTbvgk/ko9LnIBhsuX0tjyIVlqzRAUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D9yCYa9+Es99/9QbxVYSzIzAuc1ysySICmN7H1bGc0v5UO8pS3CWFhP3I474DOQ++7JXO6JO3ZrfuFk+jEPSybmkwOn7RLCNkdZv2DS7A/kykuAMV4AYKxInWgxOtyuHAH/XNxw8mLiIHyr++okDPnH18uUPWJ3jaMTBQA8KpvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-53b171ca696so2117282e0c.0;
        Tue, 19 Aug 2025 06:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609261; x=1756214061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cClO6zHEQrfoJMz2Ox6tdZxUhk3Ecays5stT+RWYVyI=;
        b=YFIofIALjP6t/oGgltVmnjj1A3r5Z/equM3LitAe/KqR7PMn74UqRzuw6e0V5h87u2
         r5g2dXpkHF74ovcdkeVHqj+S1tjO+I9RioeAelGgwmGRdj7mGI612zUPlmbfJxOA5Twm
         tcbgFHCV/tfovbpa/aPapTVn3SaGl/TzNYaRBYOLaDcR5Ax60SfyjJGUPRcsDq+tXTX9
         UewkA8yTrYy+S96/zhcDqQgRemZU8tOZu6PVFLtV26X/jXQZQfAzPBWpzMaA0bI9HsEl
         Tv7Kbf61FtYakQTgx3V8+mMza52zvr7N7f6kBFJYySINhGQHDRJFybHrPR2PbrNaUN25
         0Ulg==
X-Forwarded-Encrypted: i=1; AJvYcCUEF2q0ygmracL+DgyvgLb1LrXTqIPPgLjon6ku5qq7skl06x7r6bLXHx+cjXHfQMjWqHRul7FNOQkQ@vger.kernel.org, AJvYcCVjgQ0yCVoQqmoB6wOENDaAhrrNIcv0VU+vFFUYu/K5jmEJtW6pozf5jRVrzhzIjCwMV6lZ1qEiK8fCWsvp@vger.kernel.org, AJvYcCWar2KAZ1Yi5khFXQBDQjei6to/sto5Bf3b5XPpCWClA8zvwYZvAS8Z/w4PVvKf0v/gFsWljbCzyePB@vger.kernel.org, AJvYcCXRlfk6qw66YLOGWPBiPXFwAdB8zHJBxDEitq32V/9dl4FMUWIFJ8+YqnbRc3r/YYdw44NbnPnKz/SrGzQq+r2XrcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGypdj/OGHLEojXouUQLLPXdW1EOhi6PJcqHnfJwC7KumzocQb
	5T4ZSoCXIvATm2s7WQ4NePTbfnEMX5qKte8enBCZmakse/Hh9gEXh4yriGOZvFBg
X-Gm-Gg: ASbGncuW0doYqxjm/QDt/FfDok7kaFv3fZvC9YIRqKeSktkkXIQ5bgN98CjbpNLUTIv
	B0uarRtzHn+uvjC/Mc904u4Prd6pAGXfzHaJz8b+kYJ4nMm/ONIhTlnDkhb3l7vUkxJncOZRLAu
	Eyu5K6g1LltgDcoY48ZhPU/XnqUKlSUvSJ3RHWlUTgRQ38AKQMw9Epye+km318PzNGCVO//+c08
	ta6OHzULsuMgGPy7PqU7ETsMCjVpz9ftdEB/HdaczFfqJ8AJW425k/PW/j9iyLzxZCFiNmIFIVr
	/Q2lmQ849lulRBEc0zMfFhHPbSmN+l5KoMwIzzm686LiDxLo3PWkk3Aj5WEtV58ZacnetGg5yHg
	zY17ffGLQzRxq36pOjmY9sA8is+Sm/7OKu4TTfsMMvhWTjo3eMwleTppFNcdd
X-Google-Smtp-Source: AGHT+IEq+NsTL5hSJtM2YHeVDcUSY7EZoHKrEnf4RhHbglFBMhXTzH6J04tchItb1usbPAZekXlq7w==
X-Received: by 2002:a05:6122:2528:b0:531:19f4:ec19 with SMTP id 71dfb90a1353d-53b5d2b22cdmr911157e0c.9.1755609261395;
        Tue, 19 Aug 2025 06:14:21 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bf216ccsm2558658e0c.30.2025.08.19.06.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 06:14:20 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-50f8af33918so1736924137.2;
        Tue, 19 Aug 2025 06:14:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWww0xuMT0KJv+o3moRQkIzp78DCMsecberYgQQ/oqcubU6ZCxHdYfanVAq1kl6pY3+QHwko69lid0O@vger.kernel.org, AJvYcCXDaPTX18bj9qXY8yuaS79iKgPxQe1SwJ3m3pkF1ZP0etca4A3DtvyYRWkANVz2aiiJMXgyBZir+RaDQ1Hb@vger.kernel.org, AJvYcCXUOGbP2C5Ud7AvzgaBkaxl1k6rPsj9moV0a5fYLfOKawcTiRfZZ3342zodPoaJHVY5STm/r6Hy8vVItEwOi0LYT0Y=@vger.kernel.org, AJvYcCXaisjK3oWV93Uy4kHsH3A8kw2zEVxwIYH1vee924dcoiwHbPL1tZJGPGUYcT6KQHtPdcqpu2tQ5mfj@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:4e7:b728:e34b with SMTP id
 ada2fe7eead31-51921c1313emr736920137.3.1755609258938; Tue, 19 Aug 2025
 06:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250728201435.3505594-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250728201435.3505594-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 15:14:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWj=W17j9WHhTR1gH9MZ_fcxve_dOi6eMiL62xphXG+GQ@mail.gmail.com>
X-Gm-Features: Ac12FXzirwmbUHbtZJubjNclxZ4jN6c4IoIckX8DRoXm22ZLrDzBZdlraaPItcA
Message-ID: <CAMuHMdWj=W17j9WHhTR1gH9MZ_fcxve_dOi6eMiL62xphXG+GQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
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
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 28 Jul 2025 at 22:14, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for PLLDSI and PLLDSI divider clocks.
>
> Introduce the `renesas-rzv2h-cpg-pll.h` header to centralize and share
> PLLDSI related data structures, limits, and algorithms between the
> RZ/V2H(P) CPG and DSI drivers.
>
> The DSI PLL is functionally similar to the CPG's PLLDSI, but has slightly
> different parameter limits and omits the programmable divider present in
> CPG. To ensure precise frequency calculations, especially for milliHz-level
> accuracy needed by the DSI driver, the shared algorithm allows both drivers
> to compute PLL parameters consistently using the same logic and input
> clock.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v6->v7:
> - Made struct rzv2h_pll_limits more modular also added Ffout limits
> - Made the alogirithm modular and also added apis based on the
>   needs for lvds and dpi

Thanks for the update!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +static struct rzv2h_pll_dsi_info *rzv2h_get_pll_dsi_info(struct clk_hw *pll_dsi,
> +                                                        struct rzv2h_cpg_priv *priv)
> +{
> +       struct pll_clk *pll_clk = to_pll(pll_dsi);
> +
> +       return &priv->pll_dsi_info[pll_clk->pll.instance];
> +}

This (very simple helper) is used twice, while there are two (almost
three) other locations where it is open-coded.  Perhaps just open-code
it everywhere?

> @@ -246,7 +526,8 @@ static const struct clk_ops rzv2h_cpg_pll_ops = {
>  static struct clk * __init
>  rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
>                            struct rzv2h_cpg_priv *priv,
> -                          const struct clk_ops *ops)
> +                          const struct clk_ops *ops,
> +                          bool is_plldsi)

No need for this parameter...

>  {
>         struct device *dev = priv->dev;
>         struct clk_init_data init;
> @@ -263,6 +544,10 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
>         if (!pll_clk)
>                 return ERR_PTR(-ENOMEM);
>
> +       if (is_plldsi)

... as you can just test "core->type == CLK_TYPE_PLLDSI" here.

> +               priv->pll_dsi_info[core->cfg.pll.instance].pll_dsi_limits =
> +                       core->cfg.pll.limits;
> +
>         parent_name = __clk_get_name(parent);
>         init.name = core->name;
>         init.ops = ops;

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

