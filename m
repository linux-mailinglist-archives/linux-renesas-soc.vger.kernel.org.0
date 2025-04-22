Return-Path: <linux-renesas-soc+bounces-16219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0A5A95FAF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Apr 2025 09:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF790169285
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Apr 2025 07:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3881EB1B6;
	Tue, 22 Apr 2025 07:41:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE0C524C;
	Tue, 22 Apr 2025 07:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745307686; cv=none; b=X/2nuMwAUz/QrfSbAkdTephUzvjqlBfHlQX+lBWG/Ngwfhsc0YnpDdfBRQCnzd+77cL4fmOcgZmubGBV8/XbDJZvaTu8CH2Uameax0r2fnIwoXwdE25iqa2RcIuBHER0wM3sI57wW2oFQeEgEBsx5APwwaZsZAHuIXBbb4+kBkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745307686; c=relaxed/simple;
	bh=FxOW94RSk0PhfFr/bcRz1bIIkwQd1iZ7rYc2ls+gbhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5Cm1fsd9p6/kz/Ml9QpEInNhJRst2iKdiHPmR1FjxVOG+MofZgDtzwjibSFbisU7zUOdIXwWyNRuxuN9PYq0d4mOGl+e5A9YBzSsGQr3NG+yKWB5ncHiCVw1YhA5f8BlgM0Mr2YOrGgqpZ+4fm/JhC+KNTIDjeA4cKnjlsFDuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so1547300241.1;
        Tue, 22 Apr 2025 00:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745307681; x=1745912481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CchbbGjqvUvjIqESIBqdCzQiBA7qsjtrrzbifnEpKqk=;
        b=RSpSp0ajuVg8GxYgupymLh37kJzQ5mT+SurO5X6yEcW8Z05tg1/kfvIDmttooO2UoD
         hndZIXQzDiNpgrBjKaNHecPIqh54FoXJePo2cSr+E+HEx1wTKnCO7tLEm/SBt++ddH4c
         SLZi6Vp/Zk8/AieJmWvKKKi3Zbo301CrViWx1omRHGcUHIM5GobpOKaUXBGTX6B/Xdt2
         1TVqqU8GuNZq3y0PjhWLoC/FuxWlmSnL5TTCLogm0ipGLFiry4Pf9w4tKlKaLQivZwUM
         Qp5X/Jxca9daWsvKgRBKr/HW6srudhkxLlUCpam6gorThKgKUprJLH8ZunVXxYyWQ0gH
         eMgA==
X-Forwarded-Encrypted: i=1; AJvYcCUlveypS3bZXsmVdvk/Aw5mREHaVgTgcLzvy0BNJVsl70w2DywU695cpc3uZlXgXAq0mhDUFU9TGjzXDOxdyfixJr4=@vger.kernel.org, AJvYcCWVA5HU6Nl3eDfVHLqT5s0+dVGBlWDpI8F3J4vJh/fJCHtT1Coh8Blhwy78QyFTzw1CegmwTCmi0PA6@vger.kernel.org, AJvYcCWcFX856CQbuDRxYzuj8Dp/2G0lYZQjwZPLcN5QIeWsBrpVaOzt7WrcCdPpJQoJTOYp8NW/iWV+tECm@vger.kernel.org, AJvYcCXhyn6kSbnAbR7uToNZT4wfLs2qdaWkfwOSvhdp66h0ExV1xfpNRBRIQjYv0TcxH1BdiYek1z1phYB43+HY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx9OgzLamtQB4D0q2UdDWvKDaCzTNzkplsWWwivvTTtCwYreYn
	R5XWq28Y1COOzDWt0lLqkp2P4o9Nsgkx9DDAo3dZqfzJitsAtupQeX9/U1Rz
X-Gm-Gg: ASbGncshra5DV/QOdqUhQMDxsJ20tww6v9d8faOTHZdy6+FMjlRmFQr1h10ycN2KcQV
	OgrLRlb7WcFB0v/W8xdLQgGiD8CeERput6+sIdV8k8d5KnIZvnfRykS7LRFIB4em+Xu7yKFw7if
	JcuLIetyfBHdQhMqbCAhiNkvV9uANQ5NhqeyTLpqEcHIuhZfwpJI2iUJDeFCCxwwJVbEzhp2rM2
	LtwxF8CQGvOXB9wvDmRx6nYGTNE5Nm4F1/LHCi7+pXUtuh1cfkJy0wtbc15aanFwUouj1sJciK2
	EER77S4SIF6sLOF6Ly6QG93ZfvlNbxQPvOqf94d/rbKNU7wyhSAli8EOUzm2OQbgnrGdvaM37gc
	oGkE=
X-Google-Smtp-Source: AGHT+IHcUQZUEexCvSUT1zjP8LMLjqDuURWPRPRNEprBILwEitFTscx+/3xSURl2HwbOud5CUO8YzA==
X-Received: by 2002:a05:6102:226f:b0:4c4:e415:6737 with SMTP id ada2fe7eead31-4cb802368f5mr7887164137.23.1745307681024;
        Tue, 22 Apr 2025 00:41:21 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4cb7dde4512sm1994847137.18.2025.04.22.00.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 00:41:20 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so1547275241.1;
        Tue, 22 Apr 2025 00:41:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHSa7nRFESbfAVlwjFKqopdauUQIY6dwdykDEAPBepX8qrhBoKDauNC9Big0V1uLl5vvAcpJYZtIoO7/Lz@vger.kernel.org, AJvYcCVVazg+jfwaKjHpFhSaxhtLfEiqpSuTzLEoLSnsVg8hMxXZCBqh5qxEBbZE2UQcuE+wWT0mYQwvRJNS@vger.kernel.org, AJvYcCVsnCtQnnH1lkH5USOemUVUNwN/1kSnecR9elIh6MlxQSAkPj3WP9oIfm7kLdOG/+t3FG7YHHVj6oPiFYDbPenboWM=@vger.kernel.org, AJvYcCWUhfbeEjQL3DLelHoch8RWhE8xIKQTcPpeMkBCakGnE/cYAghM2vFd1wO7DE9+skVCJU7nphYthySp@vger.kernel.org
X-Received: by 2002:a05:6102:3235:b0:4bb:cdc0:5dd7 with SMTP id
 ada2fe7eead31-4cb801fcb0emr7598638137.16.1745307679790; Tue, 22 Apr 2025
 00:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250418184658.456398-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250418184658.456398-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Apr 2025 09:41:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWs7R9rtS7Ur6PP9e3m9ghkM1jc_Xn3QOWG4rvTtB2omA@mail.gmail.com>
X-Gm-Features: ATxdqUFBeCs2oJ7izTqYxFnW1BxjoUqkEqYOurERQsS1p8loeCSNnydQw8JebiM
Message-ID: <CAMuHMdWs7R9rtS7Ur6PP9e3m9ghkM1jc_Xn3QOWG4rvTtB2omA@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY
 frequency calculations
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 18 Apr 2025 at 20:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
> precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
> high accuracy.
>
> These changes prepare the driver for upcoming RZ/V2H(P) SoC support.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Replaced `unsigned long long` with `u64`
> - Replaced *_mhz with *_millihz` in functions

Thanks for the update!

> @@ -203,8 +203,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
>   */
>
>  static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> -                                   unsigned long hsfreq)
> +                                   u64 hsfreq_millihz)
>  {
> +       unsigned long hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, KILO);

MILLI (everywhere)

It's a strange world where KILO == MILLI ;-)

    include/linux/units.h:#define KILO      1000UL
    include/linux/units.h-#define MILLI     1000UL

>         const struct rzg2l_mipi_dsi_timings *dphy_timings;
>         unsigned int i;
>         u32 dphyctrl0;
> @@ -277,6 +278,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>                                   const struct drm_display_mode *mode)
>  {
>         unsigned long hsfreq, vclk_rate;
> +       u64 hsfreq_millihz;
>         unsigned int bpp;
>         u32 txsetr;
>         u32 clstptsetr;
> @@ -305,9 +307,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>          */
>         bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
>         vclk_rate = clk_get_rate(dsi->vclk);
> -       hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
> +       hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp * KILO * 1ULL, dsi->lanes);

The "* 1ULL" only makes the last factor unsigned long long.
"vclk_rate * bpp" is still unsigned long, causing overflow on 32-bit.
As there is no rounding variant of mul_u64_u32_div(), you probably
want to use mul_u32_u32() instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

