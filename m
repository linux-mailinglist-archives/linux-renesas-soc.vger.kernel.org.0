Return-Path: <linux-renesas-soc+bounces-22327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23883B99FF1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 15:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14413188A103
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 13:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18084A35;
	Wed, 24 Sep 2025 13:17:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD7342AA6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 13:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758719829; cv=none; b=q0mHZM96n2S+hxDNeCxh7IAtA8uqilUzJW5qIWGW8h/I+YsKcjvs2AJmzZs+6fs18f0tNFXqVQzkgKtNbwcv8vhVvLhvpGpZVtf+aUeab/ZasqOZUt84QLKOzjGs5fdF6qw9zjl5PPkrjVXD2YwI71cHmOwmJk75gEfcuNwZW0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758719829; c=relaxed/simple;
	bh=z/C4wkQC8gaVbvYtfUOzohgsubPk5RoreYsa0amGnQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NkNE86COWEByZmqeh/J5URzQBlgthKTfC8eK13FX9scClgYgfFY3qe/gk5JQC+0hxHZKdO6cWquUCxDOr6mppi0ZEL7MzPi1aV9F2ZBqnPEnqigUDRQHKjj6fP2ZNEYd1el/gwPm0Qb8IyYGoT6qhtp5IoGFI/xdYHRo2vkq/+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2445806e03cso89062065ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 06:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758719827; x=1759324627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIlYzxGhD3l9eBjwM++AWTKEOipfMDPpBnbYVK8JQsQ=;
        b=chMS9QwhjDS/+C2x6pJlQyIRagwjYQI1XfhvGjXWbp8ZJxCwF/2foS8LCAl8m7Vq/4
         JKyuj2vA+sQUFxgbGvmqxt04vePPfn0XPY3+35IxtZGTkIt4AklqPByQbJEYH/7FPKKK
         MTpK3V99G+4Tsf6v2yY1cCX+3xprwhZZFIwKds7L3pTVa7eSVuNsWfKKveQlt/mVd1dH
         zMge4LkdE8K33a9anlgpac6hLnWcRIGevE0hb7yH/kSCTZ9Mb+4TnMa9pM//iS4icrnu
         F/2DIYIMuHnsL1kZqvA1HLAJD6tfdmvuGQEU5xD1eTiMyVvdw508zpyM0rG9oCYIlLYi
         TopA==
X-Forwarded-Encrypted: i=1; AJvYcCWCvVhJeVPiiqU4cYe4pMdKdXxc0Xv/d55GY5XTOr6Fk92KYyuN5fUGuW1rKhV5lOv/22EKTmcfRQZhLjSNJzxYTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyab2KfgexFuhsXmTkZeHJ7REwWsG9Ob/g1ZgCcfZAyi7Rr6DWP
	DwDWOCRshTUWf6UQdB4WQQBVJ9WkweCcnNQpQ47RZtGX1QCZYxfcnSEm9ik0Z9ks
X-Gm-Gg: ASbGncvxBOWWmpOedksiIBFDzQ6gk4zvnUBDwgE+ET9HWvrrtDYDAoQQHCNLWMWUSBO
	zwF9KTUJPULCc8Gb919g3Xaoram6oKYff8H7JshhSdtG0SUpmFjrFoKSa3kfxVA5JBQ0tjZ9DBh
	G05ZYS0vtNFpv/ZsDn22Hxk0zsKuhBP372SgrYp9//zRo+2M2x6awjgBsKmBiRZEJrRWA++yWTL
	5p/kF02fKSylnlFUdIrp8aqNWhSVsey5fd3SuGy78l5GfO4Y2QIviyscCjHDHY1MfidD46FZmqw
	YsWneldbDwWalbVRG5Cq/CuXcHdsl2XQRIn1mlXiT7w1DaO5/VlUuyoM8EyLtOPf0Z04BXqP6hF
	+0hiz2xWTEwSVCwmS7a3GxJswJ6IV4r+Pa8NuTw+58OyxIgURXgNahmCaQWjZRJYD
X-Google-Smtp-Source: AGHT+IEHDeB92GeMPAQlXtz3yywBQy9tZMds21B6L960vUrI2mlNV4s4xNZuDFvlJoBVOPb+XeUD/w==
X-Received: by 2002:a17:903:fa5:b0:269:9719:fffd with SMTP id d9443c01a7336-27cc28bbfcdmr76466255ad.1.1758719827087;
        Wed, 24 Sep 2025 06:17:07 -0700 (PDT)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com. [209.85.210.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802de5dbsm191283645ad.84.2025.09.24.06.17.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 06:17:06 -0700 (PDT)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77f22902b46so4352305b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 06:17:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQ8ziWNhiSf7BV1EDaLepzu1HUZjOAvORla6AEk3qSgPadzFzXFhAPu2afP5sFWSUAoXd0alIX7nygppHaGMGcnA==@vger.kernel.org
X-Received: by 2002:a05:6102:4426:b0:5a1:17e3:ea9d with SMTP id
 ada2fe7eead31-5a578c96363mr2082608137.25.1758719489139; Wed, 24 Sep 2025
 06:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250903161718.180488-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250903161718.180488-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 15:11:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUT2Nv9cEw1VsSeRQfNsK7-CxWqDN+S=Txkv6DXMDdCOQ@mail.gmail.com>
X-Gm-Features: AS18NWB3LiRE7h2GD3dAO4aR_IhRpZe13Ufoocoh6CaSUdYv9A8x5d9icvSRroc
Message-ID: <CAMuHMdUT2Nv9cEw1VsSeRQfNsK7-CxWqDN+S=Txkv6DXMDdCOQ@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 3 Sept 2025 at 18:17, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add MIPI DSI support for the Renesas RZ/V2H(P) SoC. Compared to the
> RZ/G2L family, the RZ/V2H(P) requires dedicated D-PHY PLL programming,
> different clock configuration, and additional timing parameter handling.
> The driver introduces lookup tables and helpers for D-PHY timings
> (TCLK*, THS*, TLPX, and ULPS exit) as specified in the RZ/V2H(P) hardware
> manual. ULPS exit timing depends on the LPCLK rate and is now handled
> explicitly.
>
> The implementation also adds support for 16 bpp RGB format, updates the
> clock setup path to use the RZ/V2H PLL divider limits, and provides new
> .dphy_init, .dphy_conf_clks, and .dphy_startup_late_init callbacks to
> match the RZ/V2H sequence.
>
> With these changes, the RZ/V2H(P) can operate the MIPI DSI interface in
> compliance with its hardware specification while retaining support for
> existing RZ/G2L platforms.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c

> +/**
> + * rzv2h_dphy_find_timings_val - Find timing parameter value from lookup tables
> + * @freq: Input frequency in Hz
> + * @index: Index to select timing parameter table (see enum rzv2h_dsi_timing_idx)
> + *
> + * Selects the timing table for the requested parameter, finds the
> + * frequency range entry and returns the register value to program:
> + *
> + *   register_value = timings->base_value + table_index
> + *
> + * Note: frequency table entries are stored as small integers (units of 10):
> + *       threshold_in_hz = (unsigned long)table_entry * 10 * MEGA
> + *
> + * Return: timing register value to be programmed into hardware
> + */
> +static u16 rzv2h_dphy_find_timings_val(unsigned long freq, u8 index)
> +{
> +       const struct rzv2h_mipi_dsi_timings *timings;
> +       u16 i;
> +
> +       /* Get the timing table structure for the requested parameter */
> +       timings = &rzv2h_dsi_timings_tables[index];
> +
> +       /*
> +        * Search through frequency table to find appropriate range
> +        * timings->hsfreq[i] contains frequency values from HW manual
> +        * Convert to Hz by multiplying by 10 * MEGA.
> +        */
> +       for (i = 0; i < timings->len; i++) {
> +               unsigned long hsfreq = timings->hsfreq[i] * 10 * MEGA;
> +
> +               if (freq <= hsfreq)
> +                       break;
> +       }
> +
> +       /* If frequency exceeds table range, use the last entry */
> +       if (i == timings->len)
> +               i--;
> +
> +       /*
> +        * Calculate final register value:
> +        * - timings->base_value: base value for this timing parameter
> +        * - i: index into frequency table (0-based)
> +        * Combined they give the exact register value to program
> +        */
> +       return timings->base_value + i;
> +};

Unneeded semicolon.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

