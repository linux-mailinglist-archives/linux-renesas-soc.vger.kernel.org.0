Return-Path: <linux-renesas-soc+bounces-22326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D19B99F7C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 15:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CA5B3B9DB9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 13:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD7F289376;
	Wed, 24 Sep 2025 13:05:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A232E6CA7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 13:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758719135; cv=none; b=P8CZoBsZ6ru87varcMp4hK+k5h1y+7MFSLH9mc9EBJ7zWvQndSJlzcraKavD1pX04A+NheGOQbHo2k7qc/TAq9v5MM8JMZxvmjfIZFUeXGWGcGjNnA/MMj9W0y8fyvly3BD4Byg/J5PTdWMZQpNxq2Jdb+teHEhPWKUVTrjvvBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758719135; c=relaxed/simple;
	bh=5CKhCzt8uwTRTXN1dt78wJGzG2xEgCNEZ1R79yBCn7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RoD+gtDwkDPISGMeLYNGUJDbmVBGY3X1v7jfvUDxtJaNE39+QOe3XpC+lcsMJuMCrqcCMY4Ro9tvsHHKL1MuFgLr1UjGid39jEKjDQbcJj6yJWh588VlJLon9LAcUeOWj9qedK4ymHd6hGOl4h/Ms/eAjAGV3KcLYVRzUmXQgt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-ea5c8833b15so5433817276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 06:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758719132; x=1759323932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dt3FE+JEfBgU4GvIduSmfD+mr673puEsHTiT0sBkYwI=;
        b=NS+Athwz3xt2pKNTOEyiwBBDSRCtnGpg5n0HQJlEab/Mil3AMFAYxuJnq994HWJXvY
         aGRC19WV4uWGUDBrsfhB6jecwYkvX1XYt6yxRmuw+Qgvnvwy+FUfQZXzerskbv7qgEGZ
         I4Upm49vgngAfzgldlIFXqxlHlGopQIamjnu3xUnPZTMuin17Pkpi9THoddxMVOZbg+c
         gpW8Czf5tDxVBOXgRlWs9hWEt2h6c6d/cyVF/5ZNPccDA5d1gsIsxUMZnkvpi4B6/EfS
         G0dkRDFUsu0HuScAP21Hm/lnW7fDTrJQuUUiiT8eidQ/cBEwzcbdHGvuLiTg7bKMd31o
         c4Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXTj1xvzIV4rFMyUpXjIv5egxIUYuuicCGeYcKBySMGupOqsNBrCfwgmRkA/+MNp6zt11xn2K8ygVn4TSPuiTYNxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwmEvZf8/jqTWgCXIywLHbYCLcFg6rpWK05ttLCoCPL1XIyi23
	NVQGPDv5T4B01rEvmrkSFiGvisikXZnbIUKdvw8RaCOxSMkKmlVQbt/wdiqEeAaO
X-Gm-Gg: ASbGnctgUgFJMg0tSfpMXpr2ev5dFyKl6zoBbhF3P00iqYFNDtOvFPhUdlvu5OP5XYm
	jULzFRJcAv8ZvkIAqYOMuyzkWvv1HKX4p8xZBf6CPbYSrknEcXm4D4g28dzNodh+SYBSHn8J0zf
	EsqFN/wBg8d19/BmYuWMc4oARDsdGgPFBSwHmElPVxQ/y25YUjEPPs2o8LNaSBjWldPi9pi+iLZ
	5zyOfwt/qgCFRxx7xL4spBHMvRpKbLfe9TwgeQDG//xMiJhNqAaLtRTDNYtjY2hFfjHlaP2XRfH
	v9PN8rU6IZtAPrzN6pLEHB9GO7P/RmxY2Lzrw3xfp8xGvIHNGz866n6MsVM5wYXWX3No9UZ9ami
	1IU8vW1n1TxenSPhZLJRGLDrStEjslO75fjf/Re7V5cTv6DMOALrU/+RatWSy
X-Google-Smtp-Source: AGHT+IHFAb6+vim7w9jkcrVj2Axx9PeFDUFWUkEEa6Jg3ZzUXaKZaIxQM/MvBoikgBcUhWGVJnFtzg==
X-Received: by 2002:a05:6902:1542:b0:ea5:af77:e48e with SMTP id 3f1490d57ef6-eb32de60eb9mr4945669276.3.1758719131447;
        Wed, 24 Sep 2025 06:05:31 -0700 (PDT)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com. [74.125.224.53])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-eb37ebdb5b2sm64516276.20.2025.09.24.06.05.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 06:05:30 -0700 (PDT)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6353f2937f3so2022293d50.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 06:05:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGFfoOGGc0jrsTwoFfwJ/Jw+4oYHeE1KKIT1F9NfIvD3wGqDKc4LEGPXutehUxV9t8P9OSaK6tGbTraAJE8LqUrQ==@vger.kernel.org
X-Received: by 2002:a05:690e:2593:b0:5fc:53ab:a49c with SMTP id
 956f58d0204a3-636045f7a94mr3388326d50.11.1758719130471; Wed, 24 Sep 2025
 06:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 15:05:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUacF5UfiLTXuWOXAZZvEJ-St5+awkWML_HDp9b38=sXw@mail.gmail.com>
X-Gm-Features: AS18NWC94EGYcxjMXs4Deenf7S5F9QjlUjLF0OPIzRnfMxCF0EhsIC5PeV3xDXg
Message-ID: <CAMuHMdUacF5UfiLTXuWOXAZZvEJ-St5+awkWML_HDp9b38=sXw@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
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
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> +                                              struct clk_rate_request *req)
> +{
> +       struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
> +       struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
> +       struct rzv2h_cpg_priv *priv = dsi_div->priv;
> +       struct rzv2h_pll_div_pars *dsi_params;
> +       struct rzv2h_pll_dsi_info *dsi_info;
> +       u64 rate_millihz;
> +
> +       dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
> +       dsi_params = &dsi_info->pll_dsi_parameters;
> +
> +       rate_millihz = mul_u32_u32(req->rate, MILLI);
> +       if (rate_millihz == dsi_params->div.error_millihz + dsi_params->div.freq_millihz)
> +               goto exit_determine_rate;
> +
> +       if (!rzv2h_get_pll_dtable_pars(dsi_info->pll_dsi_limits, dsi_params, dsi_div->dtable,
> +                                      rate_millihz)) {
> +               dev_err(priv->dev,
> +                       "failed to determine rate for req->rate: %lu\n",
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
> +};

Unneeded semicolon (there are three more below).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

