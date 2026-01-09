Return-Path: <linux-renesas-soc+bounces-26551-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF44D0BDAE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 19:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1477030274D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 18:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577D0241103;
	Fri,  9 Jan 2026 18:36:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7CA23C50A
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 18:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983760; cv=none; b=g2DiBAjMdIwMDeNSPZpHKCyz1VcxLsYcqBhE2d5qnWDZE7LwlQ/t4qrR6p0xfKXjJGFvLAf/oCDkj4mKenDz9AeK/SASH2YumPoOdGFT8kjD/itFKyCXvR1t/ZMVXHXHcyagzPYiaDtH/j6iBzNAmQmaUH41ZsCK6aPhQ9ebmTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983760; c=relaxed/simple;
	bh=/OswgkBEItc3w8E3juVd/K2jBM1nZ0KXsKSQ6/hrhT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZfnTfepctquVhfhB645q2fIrJkJfSvinKAOqq056oc/z4woe8G7gXxE3MyrgaRdApVPu0LQjWR2euVlThY3256v+0n17UIfXNtK0gArBb8phAYPCFloCJuPgmKxtZ9W2Et6OPUnU1NAu5dIzmvi/6jrFlGnmrIoXlY3PO3/j3n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-93f63c8592cso2222600241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 10:35:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767983756; x=1768588556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kI7MDthQA3ktqoj3LLmvl8KmAEBVvsPZr76uV+u11SI=;
        b=vfu4IQKWxZTq9R8zMGLFOd4k6Ho0/ZpuD+JK4zh0sMImeMVyE8hWfWAz9CLeA5lgDR
         HYvQjEhnLvv6b+E35OXf8ZykRyoxZLNLXG+mKNDNORHlVES56mMFVYSNimKlJseJfa3p
         NLjVJ9Sdoe8FFDx2VO0W0AHabaRrUf4Q1De8R+AL0Q7ocXC/zdcblYvGE+z1aTsCiwTu
         DJXszbE7WoeAP7V86BzgBYTkl3YxUnoYawKD8hY3jpk+h0aNtqmVp1G7JT9I1KInX/GJ
         ZMTeyAPtbe5VcWWOj+tarVOMSsViiEzQ+N6U/gOkQXmJYfYmCLek8rABLlGsx0U5QWlv
         9RBg==
X-Forwarded-Encrypted: i=1; AJvYcCWRPW4uAcg9+B8AnZgb+Y96Z6pGp5QITuBdriQjWyY24KBuQuRm3zPlpPQ5zuwhVQtqOfOwVuGP8PiDkUiLnFDYow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuBr6eaf7/pcgsC2Fg3IMPc+ebHT2an2NJ9zpzKqV5FU8UXPST
	NBejUthgVGvWKrKtqC0AkDVn4P2j+v/Q4srdJnHHaNrtENCDm7nsZcjv6nQPXzok
X-Gm-Gg: AY/fxX7WHGvrIBppG1oBec7HDRht+yADsPeSpKYgq71jZu5WXjIsmMtZBR/NOpjSgYb
	RlULM3yMU5Ampr5ALxd8RG1aUTNyWomsnoKx7sIAM8hKvcJmTlfUMlFvxnjnHnh3xbzWYNU1/25
	D4zd/SXqlk9m/b3OZCA2PgVPOsmY6bGLUhlEulJrPigexnXzbXfSwZ/CbcXJyrCYFchyAMdsaKW
	GeUl0oLvAjHn6D3w/Oc0kE7SHJAkeeaUx3vB7i0NSUSPOBqlIC5fA66ESUVmHVBP+lPpHgzmwPb
	jR4qb3F80VuowspS0mXN9qTu1ZHpgyVXETX2Pi6xpVQP7N2TLgtdNTINBhmlkJbs9uzcRCN3EiE
	Qc2NLWaUZJCA4Ff3vHkDs8IpF6WrFH85zaHjRmqQSXFZTPqpxMV2pyPZkUCsIhsu2ZIZkHMuYp2
	twpEp31xMv+CzGBG2Xe2GQqSvJWRUqBewtg27Sjas/QOGhPZAujs+bwS70HO8=
X-Google-Smtp-Source: AGHT+IElRwdKgmLNkwYN2ZMc4M0lB8g2fTloZYtwZZrdJ1OACRGCb6Nx29EG5lLlZd2LqEvBQuFD7A==
X-Received: by 2002:a05:6102:3ca3:b0:5db:dad4:840 with SMTP id ada2fe7eead31-5ec75709a83mr6200489137.12.1767983755827;
        Fri, 09 Jan 2026 10:35:55 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944122d3040sm9597453241.4.2026.01.09.10.35.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 10:35:55 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5ecddf73062so2252293137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 10:35:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9RXREE9SGCv28XC8L/n7SyOhVG+eW5KV5dImXls0K9IowoysN3vjojBnoN5nqcgwB4dK6hE/y4QP31W4PlLnaZQ==@vger.kernel.org
X-Received: by 2002:a05:6102:50ab:b0:5e5:6396:48e2 with SMTP id
 ada2fe7eead31-5ec7573b1dfmr6430422137.16.1767983754869; Fri, 09 Jan 2026
 10:35:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <1d7a6c1380a80d82680e606a8523c76e0000390a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <1d7a6c1380a80d82680e606a8523c76e0000390a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:35:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-CSVVDHXEXA5GwjERKaUHO4xxd9HCX0nez0vtCT18PA@mail.gmail.com>
X-Gm-Features: AZwV_Qhl0ZCxFQW4Tw2z2j1hLTuejm9SEcPf1C0HVyWLKtwLrOiE5-4aIHJu94g
Message-ID: <CAMuHMdW-CSVVDHXEXA5GwjERKaUHO4xxd9HCX0nez0vtCT18PA@mail.gmail.com>
Subject: Re: [PATCH 03/22] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
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

On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add support for the PLLDSI{0,1} clocks in the r9a09g047 CPG driver.
>
> Introduce CLK_PLLDSI{0,1} also, introduce the
> rzg3e_cpg_pll_dsi{0,1}_limits structures to describe the frequency
> constraints specific to the RZ/G3E SoC.
>
> On Renesas RZ/G3E:
>
>  - PLLDSI0 maximum output frequency: 1218 MHz
>  - PLLDSI1 maximum output frequency: 609 MHz
>
> These limits are enforced through the newly added
> RZG3E_CPG_PLL_DSI{0,1}_LIMITS().
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -153,6 +153,26 @@ struct rzv2h_pll_div_pars {
>                 .k = { .min = -32768, .max = 32767 },                   \
>         }                                                               \
>
> +#define RZG3E_CPG_PLL_DSI0_LIMITS(name)                                        \
> +       static const struct rzv2h_pll_limits (name) = {                 \
> +               .fout = { .min = 25 * MEGA, .max = 1218 * MEGA },       \
> +               .fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },     \
> +               .m = { .min = 64, .max = 533 },                         \
> +               .p = { .min = 1, .max = 4 },                            \
> +               .s = { .min = 0, .max = 6 },                            \
> +               .k = { .min = -32768, .max = 32767 },                   \
> +       }                                                               \
> +
> +#define RZG3E_CPG_PLL_DSI1_LIMITS(name)                                        \
> +       static const struct rzv2h_pll_limits (name) = {                 \
> +               .fout = { .min = 25 * MEGA, .max = 609 * MEGA },        \
> +               .fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },     \
> +               .m = { .min = 64, .max = 533 },                         \
> +               .p = { .min = 1, .max = 4 },                            \
> +               .s = { .min = 0, .max = 6 },                            \
> +               .k = { .min = -32768, .max = 32767 },                   \
> +       }                                                               \
> +
>  #ifdef CONFIG_CLK_RZV2H
>  bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
>                         struct rzv2h_pll_pars *pars, u64 freq_millihz);

So these definitions are shared with the DRM driver, and thus are a
hard dependency from DRM to clock driver.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

