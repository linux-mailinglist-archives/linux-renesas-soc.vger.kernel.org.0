Return-Path: <linux-renesas-soc+bounces-17459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E685AC263A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 17:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1D0D1C0164B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 15:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE83C20B7EE;
	Fri, 23 May 2025 15:18:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6461B625;
	Fri, 23 May 2025 15:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748013536; cv=none; b=oH0tQnFdXsMa82lasJi0ngEN4lfPHI5TdMsv96PkluegEYe96sokkPZUso6LyipHHbjVX8CTMJpN7pMzk2iMndPj9u20Fsogk2OVqM7E14J8sBqybIzNkM2q3O7myqFgb5/JdrFtxYYwaS9OtmYDkVVpX+1eG7yrhAC0jIaWg1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748013536; c=relaxed/simple;
	bh=JzbWPNFBaN6XORxvyrgp/fdQDALDHI1BuZLkqv0gg8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uFapnjlgal93ZHDGdLO61dUFevYkM0pzzxIQgZS278dzBHJQhfKqKlMJ76RpJyweu1PKmzgL0Ek0LwB8B9BWh0td+VlFpv94UFt5iWyhk0PJh8qq7GnymGNi9ugfFveO+CO63VMNRFXGNBJCINuM+NHux+L4o3DHUrWGE3AAtVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f5373067b3so116288356d6.2;
        Fri, 23 May 2025 08:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748013532; x=1748618332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUlujxEaEdi/ZnXb2x/YmWYgGPLEJZ1h5LPkWsQToHU=;
        b=o5LTPj1BvAR84F243XuiQuoIitOMtt/tkKRuVAvwupdkEFcRQjA2P+do0Y4+Nup/9o
         UV8suwfwsT0OpRRYBhQ7UyCHgX5vr3IPGAwRqXeZSX6Ke+uMeyraeUECaUzbFpFsNHtE
         Xf/emSD06pi3GmUPHjvlxCbkYE2VKqN6Y8ZXYxr8LVZZFRrC31lSUtS1qMPL6kdxwMo3
         5+PBOk8TtFPl4JoZE4hbCng8OeMDcIvHW8JeVhG8uDNCoynx+pQ9bUQv5bDFBMZ91kOZ
         ZWZmadtElYfZkLf7iYEyLOkGvJorbohSazjno8wFakLjDO+nu+Pk67skPJlZfbz3w1N4
         TFKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7TuK6b9GA7e32GLN2F8uIygmmJn6S6Q2yFIRiVsTlkNPDaecRu61mxQXjkIeu2eAfZ7B0f7Vn3Pxx@vger.kernel.org, AJvYcCVMDNymurl/O2wT3LJgXIP1Z0ZMA2bMqqABB/MKRgfXKogDIGMVG0rd4M6waQ0/19Qc6W/raUWUojliD12p@vger.kernel.org, AJvYcCVOmsCxSxF22VtGdKwOzZ4YAEU9tSK6zS5tYmOF0zn0MkmatLNIXJvz3FPTOj9QBuWvhK03vvUJSfnL8syAgk929cA=@vger.kernel.org, AJvYcCWBTNtJl0e2oNI/S83Ct9pPnwpY6+KzXP2rVG61e0TeuDouo4DuxJxfRd/4921biyPxxeE1h6gmepZy@vger.kernel.org
X-Gm-Message-State: AOJu0YySNrQ08RxwsyRfrfp3wKxmQvN3Yoxi4m5nCKFqcPlIKZY9sJSk
	1wIhlEt59CeSYiZx/S2TWykXtz1Ur2nbqI63bh5BOt+wHdxweVRVkyXmtACCc9porUQ=
X-Gm-Gg: ASbGncujxzWLqIzk1aV405c4dBZ+dFtmDYJThH0G9wFZ9B5q0ifEk98yRSam8MVJ9FH
	UtJVKrnoFjJkfLWtdfQwO2OWUpmh/jvMNZkxjP4F/6EyX9yTsbxW0oJg9XmnECklpswXJ2Tc5GB
	wzmlecQlqZjVJuqx78y0M8SkGWl0Gtai3Rt1O0T2nHG67oi6B0+aRyf5VK2WzFhX9yg/rIM6L46
	OC+NnxvZoBE31rLcpLDgqRqAtSQ2Il0fE544jK+wJLUaOJ0HvOVLsm4YHmfK3BGs1HwO+7Na3l5
	V7xqhJyLAiECFbvA60YCD1txMN0UN2PCpQWVmTLq7azOr71Ctk89ByFNiCROJgl//RD3IUCZuoR
	CwmBA7+hABxAWbQ==
X-Google-Smtp-Source: AGHT+IHp8A2Qx2QDuA8jJndKxg3Q6eGK3Vg4y2WlPh7F6jfevPb6GrHKE6qIihI7fR3bDFny08J/nA==
X-Received: by 2002:a05:6214:400a:b0:6f4:c423:67b4 with SMTP id 6a1803df08f44-6f8b2c59904mr445633896d6.10.1748013531694;
        Fri, 23 May 2025 08:18:51 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096583csm115951986d6.92.2025.05.23.08.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 08:18:50 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f2b04a6169so102859696d6.1;
        Fri, 23 May 2025 08:18:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpj6T1aJm73lDbhjKixIV3CSFzh3PpeE58xG0EeT9qteoH4HzlfoHZL6hq5QLHhwN2EKCK+VBWgYNh@vger.kernel.org, AJvYcCWeOyv5Mt73xWB8IytjHSh7zlF3AohLa5JnLfGI30afGCLFr0+xXt0F9ySN47Xjef9iUDuw2guJ4rOlWUMj@vger.kernel.org, AJvYcCXCfHhOXRt6/KR80MHjnaqw0RFb75IGMVEq+qJdAh4es+LjB+pzPU9oNYH2XD1XUhH/EmK/33UvNu3D@vger.kernel.org, AJvYcCXKa2biDzn9BOS0LT9+CFeSCH1petbuD3JxdVLneqB1eWZkQ734Sntc1M9i44xOC92U15yRtYa3jNtM7VBlcmhL8lA=@vger.kernel.org
X-Received: by 2002:a05:6214:1308:b0:6f8:a7c6:22ca with SMTP id
 6a1803df08f44-6f8b2c5f2bbmr442981216d6.16.1748013530224; Fri, 23 May 2025
 08:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250512184302.241417-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250512184302.241417-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 17:18:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX5_P4R43HOPuZc3JSAOQ5O2xOBDVhVVg1SxU1ucPdbPA@mail.gmail.com>
X-Gm-Features: AX0GCFsg_XSn4r6_gauahCGD7VbDyx79Ezig6sAhQFHM9qfPwmiMO6CmvkImCB0
Message-ID: <CAMuHMdX5_P4R43HOPuZc3JSAOQ5O2xOBDVhVVg1SxU1ucPdbPA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
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
	linux-clk@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar, Fabrizio,

On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add DSI support for Renesas RZ/V2H(P) SoC.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2022 Renesas Electronics Corporation
>   */
>  #include <linux/clk.h>
> +#include <linux/clk/renesas-rzv2h-dsi.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> @@ -30,6 +31,9 @@
>
>  #define RZ_MIPI_DSI_FEATURE_16BPP      BIT(0)
>
> +#define RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA       (80 * MEGA)
> +#define RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA       (1500 * MEGA)

RZV2H_MIPI_DPHY_FOUT_M{IN,AX}_IN_MHZ?

> +
>  struct rzg2l_mipi_dsi;
>
>  struct rzg2l_mipi_dsi_hw_info {
> @@ -40,6 +44,7 @@ struct rzg2l_mipi_dsi_hw_info {
>                               u64 *hsfreq_millihz);
>         unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
>                                             unsigned long mode_freq);
> +       const struct rzv2h_pll_div_limits *cpg_dsi_limits;
>         u32 phy_reg_offset;
>         u32 link_reg_offset;
>         unsigned long max_dclk;
> @@ -47,6 +52,11 @@ struct rzg2l_mipi_dsi_hw_info {
>         u8 features;
>  };
>
> +struct rzv2h_dsi_mode_calc {
> +       unsigned long mode_freq;
> +       u64 mode_freq_hz;

Interesting... I guess mode_freq is not in Hz?

> +};
> +
>  struct rzg2l_mipi_dsi {
>         struct device *dev;
>         void __iomem *mmio;

> +static u16 rzv2h_dphy_find_ulpsexit(unsigned long freq)
> +{
> +       static const unsigned long hsfreq[] = {
> +               1953125UL,
> +               3906250UL,
> +               7812500UL,
> +               15625000UL,
> +       };
> +       static const u16 ulpsexit[] = {49, 98, 195, 391};
> +       unsigned int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(hsfreq); i++) {
> +               if (freq <= hsfreq[i])
> +                       break;
> +       }
> +
> +       if (i == ARRAY_SIZE(hsfreq))
> +               i -= 1;

i--

> +
> +       return ulpsexit[i];
> +}
> +
> +static u16 rzv2h_dphy_find_timings_val(unsigned long freq, u8 index)
> +{
> +       const struct rzv2h_mipi_dsi_timings *timings;
> +       u16 i;
> +
> +       timings = &rzv2h_dsi_timings_tables[index];
> +       for (i = 0; i < timings->len; i++) {
> +               unsigned long hsfreq = timings->hsfreq[i] * 10000000UL;

(I wanted to say "MEGA", but then I noticed the 7th zero ;-)

10 * MEGA?

> +
> +               if (freq <= hsfreq)
> +                       break;
> +       }
> +
> +       if (i == timings->len)
> +               i -= 1;

i--

> +
> +       return timings->start_index + i;
> +};
> +
>  static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 data)
>  {
>         iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
> @@ -308,6 +479,158 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
>         return 0;
>  }
>
> +static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi,
> +                                             unsigned long mode_freq)
> +{
> +       struct rzv2h_plldsi_parameters *dsi_parameters = &dsi->dsi_parameters;
> +       u64 hsfreq_millihz, mode_freq_hz, mode_freq_millihz;
> +       struct rzv2h_plldsi_parameters cpg_dsi_parameters;
> +       unsigned int bpp, i;
> +
> +       bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> +
> +       for (i = 0; i < 10; i += 1) {
> +               unsigned long hsfreq;
> +               bool parameters_found;
> +
> +               mode_freq_hz = mode_freq * MILLI + i;

KILO?

And I guess you want to use mul_u32_u32(), as mode_freq_hz is u64?

> +               mode_freq_millihz = mode_freq_hz * MILLI * 1ULL;

Why * 1ULL?

> +               parameters_found = rzv2h_dsi_get_pll_parameters_values(dsi->info->cpg_dsi_limits,
> +                                                                      &cpg_dsi_parameters,
> +                                                                      mode_freq_millihz);
> +               if (!parameters_found)
> +                       continue;
> +
> +               hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(cpg_dsi_parameters.freq_millihz * bpp,
> +                                                      dsi->lanes);
> +               parameters_found = rzv2h_dsi_get_pll_parameters_values(&rzv2h_plldsi_div_limits,
> +                                                                      dsi_parameters,
> +                                                                      hsfreq_millihz);
> +               if (!parameters_found)
> +                       continue;
> +
> +               if (abs(dsi_parameters->error_millihz) >= 500)
> +                       continue;
> +
> +               hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
> +               if (hsfreq >= RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA &&
> +                   hsfreq <= RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA) {
> +                       dsi->mode_calc.mode_freq_hz = mode_freq_hz;
> +                       dsi->mode_calc.mode_freq = mode_freq;
> +                       return MODE_OK;
> +               }
> +       }
> +
> +       return MODE_CLOCK_RANGE;
> +}

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> @@ -40,6 +40,39 @@
>  #define DSIDPHYTIM3_THS_TRAIL(x)       ((x) << 8)
>  #define DSIDPHYTIM3_THS_ZERO(x)                ((x) << 0)
>
> +/* RZ/V2H DPHY Registers */
> +#define PLLENR                         0x000
> +#define PLLENR_PLLEN                   BIT(0)
> +
> +#define PHYRSTR                                0x004
> +#define PHYRSTR_PHYMRSTN               BIT(0)
> +
> +#define PLLCLKSET0R                    0x010
> +#define PLLCLKSET0R_PLL_S(x)           ((x) << 0)

 #define PLLCLKSET0R_PLL_S GENMASK(2, 0)

and after that you can use FIELD_PREP(PLLCLKSET0R_PLL_S, x) in the code.
More opportunities for masks below...

> +#define PLLCLKSET0R_PLL_P(x)           ((x) << 8)
> +#define PLLCLKSET0R_PLL_M(x)           ((x) << 16)
> +
> +#define PLLCLKSET1R                    0x014
> +#define PLLCLKSET1R_PLL_K(x)           ((x) << 0)
> +
> +#define PHYTCLKSETR                    0x020
> +#define PHYTCLKSETR_TCLKTRAILCTL(x)    ((x) << 0)
> +#define PHYTCLKSETR_TCLKPOSTCTL(x)     ((x) << 8)
> +#define PHYTCLKSETR_TCLKZEROCTL(x)     ((x) << 16)
> +#define PHYTCLKSETR_TCLKPRPRCTL(x)     ((x) << 24)
> +
> +#define PHYTHSSETR                     0x024
> +#define PHYTHSSETR_THSEXITCTL(x)       ((x) << 0)
> +#define PHYTHSSETR_THSTRAILCTL(x)      ((x) << 8)
> +#define PHYTHSSETR_THSZEROCTL(x)       ((x) << 16)
> +#define PHYTHSSETR_THSPRPRCTL(x)       ((x) << 24)
> +
> +#define PHYTLPXSETR                    0x028
> +#define PHYTLPXSETR_TLPXCTL(x)         ((x) << 0)
> +
> +#define PHYCR                          0x030
> +#define PHYCR_ULPSEXIT(x)              ((x) << 0)
> +
>  /* --------------------------------------------------------*/
>
>  /* Link Status Register */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

