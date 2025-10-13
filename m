Return-Path: <linux-renesas-soc+bounces-22946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D944BD3811
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CFC354F91C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 14:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE63422A7F1;
	Mon, 13 Oct 2025 14:21:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63BC1D5141
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760365283; cv=none; b=TwFPWW6tqMDFFejahNdoJu5NoD6io+MAqJiY2m0Qu2MoPy5CbhTahvk3WSG19manDoE4CUpZ/5jV/XO7Yk+FRbd2rb51qSU795ZcoEH1nunCQXC8jHFwXuFKAUuUCo0qzgOV7kTT37K9EbeykxCBD2mVTikF8B4haITToxZVO6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760365283; c=relaxed/simple;
	bh=zlA57FXRk3iS29Kzv4WEft+U6fVs9xyP1OQ8Cp0Brq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHBFbZUwMKK3SMCLXclQHNqP10K5tU0yR47PjlWX3MrGXCrMWOCEocW4ggqPst4GpdK77eqzVKW/hr0WOAsEwD/xgabTluc4Etz1vowqk2ieUV+TpM7Z+HHb20J9EihvtqbjXAYTZnSCQFiov5xD6e6PVXhB56X7lrKjO+0bX00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-54a7bf06edfso2607270e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760365280; x=1760970080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wM5BKo03UXTKAaO0inlA90fZOzSgvU3v+GhQ9ytzuNM=;
        b=ck7pStI2D4Qd/mGZQrYwiOnNHaHpDvwyUDolMiafTPE6OLTSYvHolh4P6PIBXBo3sf
         eCcuRyz2Zs8+Y9KqjmojmCiITtLeM7agOuMNt6+N6pExHIBVk7taiDhnIVrn5UFD0CAy
         5ikSc9lT2iusZ26GYWeVCpWcu6sR0xqDk2wXJ4LJHoE2V3+G2wGoSRoa5ysejWNKXD6k
         QVokxG4Yrbdd9tuOO/qnS5q0ZVqD9tv9p2LLmVw8ryogx/+L6gJ+5Q2NoMp0rlc4wDTR
         qaO9L6Yx8H8Muj9lvvQGy/a/nNN/C58B8OKv3U2rB618i4YdIwm6WTpGeM/ye1wws4qo
         Ih/A==
X-Forwarded-Encrypted: i=1; AJvYcCWF7jnKIdElCumbdFU+5lHroT45PqFf1k4B2mfHcgtAP1mD0xmATuVkFgYjlULRdNQ4D2lkf0O3AjJ8odXOPiN6Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiBQ9mthbEHfM/pI+jc5y1A2MGrg00YofYCW9CJ8hzumruoEL8
	hKOxzXYTCSbPTi6ECaSFx3bkVbV7WgZmj+V/QYqULnHun3Ozali9xzPJ6cXZw1Mn
X-Gm-Gg: ASbGncsSsiMxBpLp3FCU5fLPLDuRpH5We8VeKE3DX5c4YSlSBqTWOH2UL+0N75k6e7U
	Rt2LqgNp0aHzyRkBRyrSe7900HerC7jbXiNjWL1UeBq/ql5xj8wyGzpVxz7xk4d+0TFuPqATDzE
	Hs5tHI+JJfnJSq1W0HW2JHjAv9r2r56IdNMCK1+AcCGnO+rqHNhPBbHiJtlPnk+m2YkD+LcNK40
	k8Xpq8+NhDwKobtgXN1sUSmUrF3Mx0A18nZW1LQBL9g7M8ldkQP5erkftjprkk7CsDqkxxOHKA1
	QF5B+1xNxVwORLULLj7btDSg5O47oNdl6xNB5ztWshOj3nFBb+Af5Yn7emnCeMB2OxWyzTDWxOi
	phxJhXBzPVR9q5sTvsZ4HFr5ts9qiorZiaFTFBIGS6A1FIvwk01huUc7zKZpilxROpX5uv9DoJ7
	BYWubvHkOW0Sk94A==
X-Google-Smtp-Source: AGHT+IGDowtdPZB6AyzqMO6BNE4+7mdxgOPu70QTho9yGj+GHlYFdHw+fneIncCyn1EWwxShLj24FQ==
X-Received: by 2002:a05:6122:2002:b0:54a:9927:7a99 with SMTP id 71dfb90a1353d-554b8bbd74emr8081526e0c.13.1760365280065;
        Mon, 13 Oct 2025 07:21:20 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554dc835063sm2877248e0c.9.2025.10.13.07.21.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 07:21:19 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5a0d17db499so3931679137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:21:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMWgk2nkLPerh7OdBADAwlhEKjtiyLiv+3d4PzoKVJjQEZU/5ozndKZ7tU+1Hy+mYvFbRzpqz2iczoP3jqIXuwAQ==@vger.kernel.org
X-Received: by 2002:a05:6102:512b:b0:5d3:ff01:363d with SMTP id
 ada2fe7eead31-5d5e2323bc3mr8711756137.21.1760365279124; Mon, 13 Oct 2025
 07:21:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009160732.1623262-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251009160732.1623262-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251009160732.1623262-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 16:21:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2-YrktT+=D2LVFw5oR+6EOLcPB_Yuh5wnos099W9YHQ@mail.gmail.com>
X-Gm-Features: AS18NWACXzl9qHe2hLpg2jHp4NfY_rtfyBAoBdwcOf1UGmjWi7aFUHns305Ee_M
Message-ID: <CAMuHMdV2-YrktT+=D2LVFw5oR+6EOLcPB_Yuh5wnos099W9YHQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Oct 2025 at 18:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for PLLDSI and its post-dividers to the RZ/V2H CPG driver and
> export a set of helper APIs to allow other consumers (notably the DSI
> driver) to compute and select PLL parameter combinations.
>
> Introduce per-PLL-DSI state in the CPG private structure and implement
> clk ops and registration for PLLDSI and PLLDSI divider clocks. Implement
> rzv2h_cpg_plldsi_determine_rate and rzv2h_cpg_plldsi_set_rate to drive
> PLL programming via the new per-PLL state and add a plldsi divider clk
> with determine/set/recalc operations that cooperate with the PLL
> algorithm.
>
> Centralize PLL parameter types and limits by moving definitions into a
> shared header (include/linux/clk/renesas.h). Add struct rzv2h_pll_limits,
> struct rzv2h_pll_pars and struct rzv2h_pll_div_pars, plus the
> RZV2H_CPG_PLL_DSI_LIMITS() macro to declare DSI PLL limits.
>
> Provide two exported helper functions, rzv2h_get_pll_pars() and
> rzv2h_get_pll_divs_pars(), that perform iterative searches over PLL
> parameters (M, K, P, S) and optional post-dividers to find the best (or
> exact) match for a requested frequency. Export these helpers in the
> "RZV2H_CPG" namespace for use by external drivers.
>
> This change centralizes DSI PLL rate selection logic, prevents duplicate
> implementations in multiple drivers, and enables the DSI driver to
> request accurate PLL rates and program the hardware consistently.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v9->v10:
> - Dropped rzv2h_get_pll_div_pars() helper and opencoded instead.
> - Dropped rzv2h_get_pll_dtable_pars() helper and opencoded instead.
> - Added dummy helpers rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars()
>   in renesas.h for !CONFIG_CLK_RZV2H case.
> - Updated commit message.

Thanks for the update!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> +                                              struct clk_rate_request *req)
> +{
> +       struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
> +       struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
> +       struct rzv2h_cpg_priv *priv = dsi_div->priv;
> +       u8 table[RZV2H_MAX_DIV_TABLES] = { 0 };
> +       struct rzv2h_pll_div_pars *dsi_params;
> +       struct rzv2h_pll_dsi_info *dsi_info;
> +       const struct clk_div_table *div;
> +       u64 rate_millihz;
> +       unsigned int i;
> +
> +       dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
> +       dsi_params = &dsi_info->pll_dsi_parameters;
> +
> +       rate_millihz = mul_u32_u32(req->rate, MILLI);
> +       if (rate_millihz == dsi_params->div.error_millihz + dsi_params->div.freq_millihz)
> +               goto exit_determine_rate;
> +
> +       div = dsi_div->dtable;

This belongs inside the for-initializer below.

> +       i = 0;

Ditto; or better: in the variable declaration at the top of the function.

> +       for (; div->div; div++) {
> +               if (i >= RZV2H_MAX_DIV_TABLES)
> +                       return -EINVAL;
> +               table[i++] = div->div;
> +       }
> +
> +       if (!rzv2h_get_pll_divs_pars(dsi_info->pll_dsi_limits, dsi_params, table, i,
> +                                    rate_millihz)) {
> +               dev_err(priv->dev, "failed to determine rate for req->rate: %lu\n",
> +                       req->rate);
> +               return -EINVAL;
> +       }
> +
> +exit_determine_rate:
> +       req->rate = DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millihz, MILLI);
> +       req->best_parent_rate = req->rate * dsi_params->div.divider_value;
> +       dsi_info->req_pll_dsi_rate = req->best_parent_rate;
> +
> +       return 0;
> +}

The rest LGTM, so with the above fixed, and the field changes factored
out into a separate patch:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

