Return-Path: <linux-renesas-soc+bounces-23387-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29201BF6F4B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 16:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 659A8482900
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 14:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B7532ED3B;
	Tue, 21 Oct 2025 14:02:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A4C2F5492
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 14:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761055350; cv=none; b=GnydozrrMJZxFK7TATromkLoR/2Y5CLBaYCfSiFvkWHmgqbG7DcLt2XbnzsJoFjpEaspKORAdGZ+88e+Jbe1VRXK/JEpDKgyVKU1q80zTXoFqDUcqjeyIVjGMRFOFlxIy+uBl1566tPDnMLrs6UtZWAZWtae3nIBUgIvkdvf7nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761055350; c=relaxed/simple;
	bh=myPKEpFCfK6VNdq1OrXL5rHyz8ZZmJYmfPQNIlpMmNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdaUQONDDZhimWXQvxYr1yoCyMVTLIrThP30N2BaOUoFL2hRqyMG6KZD+NI0lHWJTR8Dh9LvmCTu0lUPKhx4xuQO3aGeaw6Lm1z1YqZ3VFhpVCpf6jX1eRqWbY37sSaQiR1tjUqnF2NmI948mjLTiSR7OFM/QSqU7mjTIHxbkAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5563c36f6d4so4130787e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 07:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761055347; x=1761660147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXugAlNcvucEYnbbLM3xKX3aXFg6Ylpfx0k5Z7y5qH4=;
        b=AYS7qVVlJN+7wKeT3ZcWVbypuWvYfIPIknPbFuYGDdIgeUrgx3VPRNwxnVPh3uHy0g
         anZQxdeEit7Y+ApTvPJMEjEVdwjP0USSiDj7HkrXUF4OlY4VzWciPwP3Q4upmTPmxHF6
         R9SpByUGE1rZUItoEqu7jlVEaA/R4EjmjW3OakW+akkTFqMYSLRyMU3QsHbsDMOD+Fkf
         dxo48hlMMK6ut/RDAXOyY+mCpOsVj0xv//UjLDe4IOe+TGTa5kWkNU/3WBsf84clA0lQ
         58lLVqCRFN+UMuGQZmK8UVq75wVISrOLXyBqzANHm3eIiidpNQIVr+obWTF6pZ0a9JPk
         6zbw==
X-Forwarded-Encrypted: i=1; AJvYcCXEHIoWl6KQub6EjQV056owz2oqnBwewODDENW4sTlekekhPHr6Tvq14Ws3kK8o6iuuS8c42lm1oQ0efX2/Pv8PFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLaUrTYvJZ/H8y+STysNMu41kK46TfUZ2XuwsCbjPoASTD4Zw+
	KBMEtrhKlAoRMor3McceRd1BHEXAlqqxU95ZB81myrAuQ45xlHiAoosaZC20aYZ3
X-Gm-Gg: ASbGncvz8L61IAMai37BdADJI392Dho62SJ0lLkiFOHltczhkLK/FxgezkH7SSeL1zs
	9AOyUJtl1x/TX+znHckXXkbE2WpeT8IuXL6TH972kkDAYBUgovvqHa0UV0q2L6I+BpKvtvymaNI
	oMl4SFbHb4LWjgLFJ5cSy1xbp0mGunLNmtsmozOdmIV2H7dUsTkbUggQqvaMR2Giv1ImguTTHgA
	tfzDxyGORaSvwGaqrh9fyFHc4eB4/OVfQ6MQtCJQSbk4bVACWgecYFI3gKdv1XztbtfVxQ9Zl/N
	O4ShgkuGMZ6PvvUCiJRf8YkU6ddDISjgAG59SVf3AVtekxLBgdYs813IT9KGuJqLN9JEHtFDpEu
	iaG+Wsf+Yl55IWYLzPtBfPwzlOQ5zbyvmaxqFwDPKK63t95WHIly+6+RdAJTknyeIJynHesroDI
	vcSz3tTJ76/b0Fo+gkicitbzA5rm4w2i75u8Z5ZA==
X-Google-Smtp-Source: AGHT+IFmYDve2H2TuvPofD0W+6mRlq5c0JNUQM66rLmhnC42hwkxH0f2EbDXuN5GKq2D9pqJpyJXYQ==
X-Received: by 2002:a05:6122:6081:b0:54a:a58f:e989 with SMTP id 71dfb90a1353d-5564041ad7emr6220263e0c.8.1761055346956;
        Tue, 21 Oct 2025 07:02:26 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55661f9a0e4sm3546704e0c.9.2025.10.21.07.02.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 07:02:25 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-932e88546a8so662715241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 07:02:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9e1ZeJ4K4E66rKlOT5ZKj4CPoIOdyTuvxbMf3rqLRwaDuGeW9DHwVzTQfsdAh256Wie0dNutByg+Jr+90+DwsoQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2ad3:b0:5d5:f6ae:3914 with SMTP id
 ada2fe7eead31-5d7dd6dae8amr6635478137.22.1761055331143; Tue, 21 Oct 2025
 07:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912142056.2123725-1-chris.brandt@renesas.com> <20250912142056.2123725-2-chris.brandt@renesas.com>
In-Reply-To: <20250912142056.2123725-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 16:02:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVf7dSeqAhtyxDCFuCheQRzwS-8996Rr2Ntui21uiBgdA@mail.gmail.com>
X-Gm-Features: AS18NWAilKOsk0msuDZD61x0CWnEgj86O5ttkvj001Q_uv_hFWGEg6rSKnFmYMU
Message-ID: <CAMuHMdVf7dSeqAhtyxDCFuCheQRzwS-8996Rr2Ntui21uiBgdA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, 
	Hugo Villeneuve <hugo@hugovil.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hi Chris,

On Fri, 12 Sept 2025 at 16:22, Chris Brandt <chris.brandt@renesas.com> wrote:
> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
> Signed-off-by: Nghia Vo <nghia.vo.zn@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -74,6 +74,22 @@
>  #define MSTOP_OFF(conf)                FIELD_GET(GENMASK(31, 16), (conf))
>  #define MSTOP_MASK(conf)       FIELD_GET(GENMASK(15, 0), (conf))
>
> +#define PLL5_FOUTVCO_MIN       800000000
> +#define PLL5_FOUTVCO_MAX       3000000000
> +#define PLL5_POSTDIV_MIN       1
> +#define PLL5_POSTDIV_MAX       7
> +#define PLL5_POSTDIV_DEF       1
> +#define PLL5_REFDIV_MIN                1
> +#define PLL5_REFDIV_MAX                2

Documentation says 1..63?

> +#define PLL5_REFDIV_DEF                1
> +#define PLL5_INTIN_MIN         20
> +#define PLL5_INTIN_MAX         320
> +#define PLL5_INTIN_DEF         125
> +#define PLL5_FRACIN_DEF                0
> +
> +#define PLL5_TARGET_DPI                0
> +#define PLL5_TARGET_DSI                1

These two should become an enum in include/linux/clk/renesas.h,
as their values are passed (as magic numbers) from outside.

> +
>  /**
>   * struct clk_hw_data - clock hardware data
>   * @hw: clock hw
> @@ -129,6 +145,12 @@ struct rzg2l_pll5_param {
>         u8 pl5_spread;
>  };
>
> +/* PLL5 output will be used for DPI or MIPI-DSI */
> +static int dsi_div_target = PLL5_TARGET_DPI;
> +
> +/* Required division ratio for MIPI D-PHY clock changes depending on resolution and lanes. */
> +static int dsi_div_ab;

unsigned int

> +
>  struct rzg2l_pll5_mux_dsi_div_param {
>         u8 clksrc;
>         u8 dsi_div_a;
> @@ -557,24 +579,102 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
>  }
>
>  static unsigned long
> -rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
> +rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_cpg_priv *priv,
> +                              struct rzg2l_pll5_param *params,
>                                unsigned long rate)
>  {
>         unsigned long foutpostdiv_rate, foutvco_rate;
> +       u8 div = 1;
> +       bool found = 0;
> +       int a, b;

unsigned int

> +
> +       if (priv->mux_dsi_div_params.clksrc)
> +               div = 2;
> +
> +       /* Calculate the DIV_DSI_A and DIV_DSI_B based on the final DIV DSI */
> +       for (a = 0; a < 4; a++) {
> +
> +               if (dsi_div_target == PLL5_TARGET_DPI && a == 0)
> +                       continue;       /* 1/1 div not supported for DIV_DSI_A for DPI */
> +
> +               for (b = 0; b < 16; b++) {
> +
> +                       if (dsi_div_target == PLL5_TARGET_DPI && b != 0)
> +                               continue;       /* Only 1/1 div supported for DIV_DSI_B in DPI */
> +
> +                       if (((1 << a) * (b + 1)) == dsi_div_ab) {

"(b + 1) << a"?

> +                               priv->mux_dsi_div_params.dsi_div_a = a;
> +                               priv->mux_dsi_div_params.dsi_div_b = b;
> +
> +                               goto found_dsi_div;
> +                       }
> +               }
> +       }
> +
> +found_dsi_div:
> +       /*
> +        * Below conditions must be set for PLL5 parameters:
> +        * - REFDIV must be between 1 and 2.
> +        * - POSTDIV1/2 must be between 1 and 7.
> +        * - INTIN must be between 20 and 320.
> +        * - FOUTVCO must be between 800MHz and 3000MHz.
> +        */
> +       for (params->pl5_postdiv1 = PLL5_POSTDIV_MIN;
> +            params->pl5_postdiv1 < PLL5_POSTDIV_MAX + 1;
> +            params->pl5_postdiv1++) {
> +               for (params->pl5_postdiv2 = PLL5_POSTDIV_MIN;
> +                    params->pl5_postdiv2 < PLL5_POSTDIV_MAX + 1;
> +                    params->pl5_postdiv2++) {
> +                       foutvco_rate = rate * ((1 << priv->mux_dsi_div_params.dsi_div_a) *

rate * ... << priv->mux_dsi_div_params.dsi_div_a;

> +                                              (priv->mux_dsi_div_params.dsi_div_b + 1)) *
> +                                             div * params->pl5_postdiv1 * params->pl5_postdiv2;
> +                       if (foutvco_rate < PLL5_FOUTVCO_MIN + 1 ||
> +                           foutvco_rate > PLL5_FOUTVCO_MAX - 1)
> +                               continue;
> +
> +                       for (params->pl5_refdiv = PLL5_REFDIV_MIN;
> +                            params->pl5_refdiv < PLL5_REFDIV_MAX + 1;
> +                            params->pl5_refdiv++) {
> +                               params->pl5_intin = (foutvco_rate * params->pl5_refdiv) /
> +                                                   (EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> +                               if (params->pl5_intin < PLL5_INTIN_MIN + 1 ||
> +                                   params->pl5_intin > PLL5_INTIN_MAX - 1)
> +                                       continue;
> +                               params->pl5_fracin = div_u64(((u64)
> +                                                    (foutvco_rate * params->pl5_refdiv) %
> +                                                    (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,

Please move the cast to u64 outside the modulo operation, else
the latter becomes a 64-by-32 modulo, which requires using a helper
from <linux/math64.h> when compile-testing for a 32-bit platform.

> +                                                    EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> +                               found = 1;
> +                               goto found_clk;
> +                       }
> +               }
> +       }
> +
> +found_clk:
> +       if (!found) {
> +               params->pl5_intin = PLL5_INTIN_DEF;
> +               params->pl5_fracin = PLL5_FRACIN_DEF;
> +               params->pl5_refdiv = PLL5_REFDIV_DEF;
> +               params->pl5_postdiv1 = PLL5_POSTDIV_DEF;
> +               params->pl5_postdiv2 = PLL5_POSTDIV_DEF;
> +       }
>
> -       params->pl5_intin = rate / MEGA;
> -       params->pl5_fracin = div_u64(((u64)rate % MEGA) << 24, MEGA);

(u64)(rate % MEGA)

> -       params->pl5_refdiv = 2;
> -       params->pl5_postdiv1 = 1;
> -       params->pl5_postdiv2 = 1;
>         params->pl5_spread = 0x16;
>
>         foutvco_rate = div_u64(mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
> -                                          (params->pl5_intin << 24) + params->pl5_fracin),
> -                              params->pl5_refdiv) >> 24;
> +                      (params->pl5_intin << 24) + params->pl5_fracin),
> +                      params->pl5_refdiv) >> 24;
>         foutpostdiv_rate = DIV_ROUND_CLOSEST_ULL(foutvco_rate,

foutvco_rate is unsigned long, but the division uses the _ULL() macro variant?

>                                                  params->pl5_postdiv1 * params->pl5_postdiv2);
>
> +       /* If foutvco is above 1.5GHz, change parent and recalculate */
> +       if (priv->mux_dsi_div_params.clksrc && foutvco_rate > 1500000000) {
> +               priv->mux_dsi_div_params.clksrc = 0;
> +               dsi_div_ab *= 2;
> +               dsi_div_target = PLL5_TARGET_DSI;       /* Assume MIPI-DSI */
> +               return rzg2l_cpg_get_foutpostdiv_rate(priv, params, rate);
> +       }
> +
>         return foutpostdiv_rate;
>  }
>
> @@ -607,7 +707,7 @@ static unsigned long rzg2l_cpg_get_vclk_parent_rate(struct clk_hw *hw,
>         struct rzg2l_pll5_param params;
>         unsigned long parent_rate;
>
> -       parent_rate = rzg2l_cpg_get_foutpostdiv_rate(&params, rate);
> +       parent_rate = rzg2l_cpg_get_foutpostdiv_rate(priv, &params, rate);
>
>         if (priv->mux_dsi_div_params.clksrc)
>                 parent_rate /= 2;
> @@ -626,6 +726,13 @@ static int rzg2l_cpg_dsi_div_determine_rate(struct clk_hw *hw,
>         return 0;
>  }
>
> +void rzg2l_cpg_dsi_div_set_divider(int divider, int target)

unsigned int divider

> +{
> +       dsi_div_ab = divider;
> +       dsi_div_target = target;
> +}
> +EXPORT_SYMBOL_GPL(rzg2l_cpg_dsi_div_set_divider);
> +
>  static int rzg2l_cpg_dsi_div_set_rate(struct clk_hw *hw,
>                                       unsigned long rate,
>                                       unsigned long parent_rate)
> @@ -859,7 +966,7 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
>
>         vclk_rate = rzg2l_cpg_get_vclk_rate(hw, rate);
>         sipll5->foutpostdiv_rate =
> -               rzg2l_cpg_get_foutpostdiv_rate(&params, vclk_rate);
> +               rzg2l_cpg_get_foutpostdiv_rate(priv, &params, vclk_rate);
>
>         /* Put PLL5 into standby mode */
>         writel(CPG_SIPLL5_STBY_RESETB_WEN, priv->base + CPG_SIPLL5_STBY);
> @@ -949,6 +1056,8 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
>         priv->mux_dsi_div_params.clksrc = 1; /* Use clk src 1 for DSI */
>         priv->mux_dsi_div_params.dsi_div_a = 1; /* Divided by 2 */
>         priv->mux_dsi_div_params.dsi_div_b = 2; /* Divided by 3 */
> +       dsi_div_ab = (1 << priv->mux_dsi_div_params.dsi_div_a) *
> +                    (priv->mux_dsi_div_params.dsi_div_b + 1);

(priv->mux_dsi_div_params.dsi_div_b + 1) << priv->mux_dsi_div_params.dsi_div_a

>
>         return clk_hw->clk;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

