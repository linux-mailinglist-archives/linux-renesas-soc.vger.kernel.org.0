Return-Path: <linux-renesas-soc+bounces-16026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D45EA8A398
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 18:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A716F443472
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 16:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D402820C6;
	Tue, 15 Apr 2025 16:03:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88482DFA2D;
	Tue, 15 Apr 2025 16:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732989; cv=none; b=CGC1Gcof32UxAPIny54TJuf55uinW0rx0zLcUDRkFsq4Skoz3ZM97jA8hOb3eumC8oVi6iG4U4/3xTElydS2Mgda+3YRGhbCPSHg5OAx/jKEb4btnPCjxHpsBmAtU90AGmtUOcg8P76L63/IWZyGosnc9UYdEkCvMLZ8oK8rpgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732989; c=relaxed/simple;
	bh=Hzmc5byleNFyCDdpw7V0x8g7q/DvdasFY7cNHTnX7hY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZ6eRhRX7lcI+iCockbolgvMAg19N9IlP8rp4+XUVfYU8u5TQAw02u4rW5EcTpedBcUeRsp773dAWJIq7f4cn5pOXnt6h4tHH/GCirzPK20QdEEwlYU19hxGszZkW77iGxT6ODtKUfygkVyPxZdd1+4OO8yui4Rkq84Ff9xjn2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70576d2faa1so22148637b3.3;
        Tue, 15 Apr 2025 09:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744732985; x=1745337785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TuEbYlZMiJuO8E2YPXwmbMAltImu0P0byOBQlAv2mMo=;
        b=DCOpTiSQxOgJUZ4TaDngHCBuPEu35Xvep5Xkp47hseyXbRzGZyJBqrdcyCr1qbjIK4
         KvP1MvAcN0NUW9thVfKSJwLxVBPY2Ro0S4jOlNhU5nBh6O6WjY93+qFmjGqdZp6D2weV
         nIowrTELWFiYiJUlgRKMdn15D3mzmlhmsw8bcdgRUtG4MjQHT6VlUtoyZwPlHo1N5XFv
         atlNmwtr9bRilTf+UTh2BT6m9zEQNeJRYuUEqeyx2tefrq5iQ12DpWcrvLIoYfQ9yjnq
         2rPR7j3rUJ3fHJYDpfwhP9V2akGja8iHha8h8AXl7DvyZjb1ctU11T2w+WI4bHQRqa+6
         u/sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcC/TtfqAZap6hidit/mEof9387fd6B5GcM5Ej7leW+wJKkM+BH/8+/SamypHXoU0h3TsPCwtvEBky@vger.kernel.org, AJvYcCVohkvj1d2K+pk3INd0lZBcNuTP5yatRWDcptAaa6g4MP8qFIZvt2aAunax+fiJ0eAIldCOcfw7Pf7d8bpt6QdW1Po=@vger.kernel.org, AJvYcCWR7OW7kaGNiP07aXO6uqsfh/Rdu8Ub6JAJUpZ3Gbf9578cO/qHxz5AEN6W/5zokK1eoNqA+xVCA+lL542K@vger.kernel.org, AJvYcCWv63EB0YtsmBeYzLbqm+gp17/9yMrWWmhfvFnPOVL05pcmyKTKBiQNENkEx4Awfnr6H1UVrhEZKjeH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz1xqRdn50pX9yia3OXVCKnKhRrPsRbCJQA9RiKPL8u7yLRdKd
	TlP6Am2uxoNQQqmh+u1PVDxjNZZpT5Fvcn1fhTR9yM4N8r/yZSe0w7PqZ5Dg
X-Gm-Gg: ASbGncuWIkUhZ1wqa8gXUPRIUM2BJ+lncWI6pmx5l5Pp46KHj/CWqvhRGVDMzORAIh9
	N069b7g4INrWPXckLftSTRg9CmoRgn2S3AUHEm7swF0cvaX2YIzIdg7Uz3C2lkNKLQMhmIQJnVC
	h8pfAagjOWGrGBDELUpQa2mO73OWqSdJ76Wy10qk+q9Qyj4QDGCfFMTUrwanU0Fwozv3TIn1J/I
	Vttk2MKxJyU8RVZ67xI0fRTC+Lzork/8xhIW5NAuuoliQlU9h9KFGiZjyMbd9oIRaYiPKhNyER/
	AxlZ407hTjiegoGw7WgukvOuAHGo7c5/LdMY3DXujDQL4QFnhZr2qu2YxoVi3TZ/iadh9QbIo37
	+iFdXtYI=
X-Google-Smtp-Source: AGHT+IEQjeguuj3kW49E0aLJcog5tbt6WB7qvI5MYHzzjd27grqxYE+yakeUXAde4gMhNxmDrMaHGQ==
X-Received: by 2002:a05:690c:25c4:b0:6fd:42ed:c90 with SMTP id 00721157ae682-705599c9cc1mr273759707b3.16.1744732985109;
        Tue, 15 Apr 2025 09:03:05 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7053e372b6dsm36993467b3.88.2025.04.15.09.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 09:03:04 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e6582542952so4590660276.3;
        Tue, 15 Apr 2025 09:03:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhF9LbkD2oXNG+aWFcw9BEw/H1v6uoXe2b1OWcIUSSWQyTgvLLSEBiJb4W3YND15LDCf/AFxYP1dFp@vger.kernel.org, AJvYcCXSDtM4Fsr7Gr3b/HO/iSm8LPgFKHn+UvnVeMuMfRBEQ4mcSvKsA+AfZwb6Xrg2/Gnl7o7NHNXYgAoYWsK5@vger.kernel.org, AJvYcCXiCwv5tlRmvmln6oDwlnZNCSRgATtkMPLD0V4gflMkvmbi4Doo+V3o7W/sXprWonvZy4ts7jHAAhGUNHMSnzIC4mA=@vger.kernel.org, AJvYcCXvdaP77L/wwYSamDhKZJRNTROmdSZ4oEusXy1xEOBxQp/jeE9ekUn2y1A1SmffzFor1JpVcpMDl5l2@vger.kernel.org
X-Received: by 2002:a05:6122:1d0a:b0:525:9dd5:d55a with SMTP id
 71dfb90a1353d-527c35e7a47mr11730397e0c.8.1744732671704; Tue, 15 Apr 2025
 08:57:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250408200916.93793-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250408200916.93793-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 17:57:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9WhKeMyKfdiLWmLC8mabNe-4ROW5uCZhx6z503GE0Ug@mail.gmail.com>
X-Gm-Features: ATxdqUHtuz_A-xS1tTTRA3AiVheg582GK6_Rn09grQ8w2iOfDNKRllrwvo1MBQw
Message-ID: <CAMuHMdW9WhKeMyKfdiLWmLC8mabNe-4ROW5uCZhx6z503GE0Ug@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for PLLDSI and PLLDSI divider clocks.
>
> The `renesas-rzv2h-dsi.h` header file is added to share the PLL divider
> algorithm between the CPG and DSI drivers.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -196,6 +225,253 @@ static int rzv2h_cpg_pll_clk_enable(struct clk_hw *hw)
>         return ret;
>  }
>
> +static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *hw,
> +                                                     unsigned long parent_rate)
> +{
> +       struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
> +       struct rzv2h_cpg_priv *priv = dsi_div->priv;
> +       struct ddiv ddiv = dsi_div->ddiv;
> +       u32 div;
> +
> +       div = readl(priv->base + ddiv.offset);
> +       div >>= ddiv.shift;
> +       div &= ((2 << ddiv.width) - 1);
> +
> +       div = dsi_div->dtable[div].div;
> +
> +       return DIV_ROUND_CLOSEST_ULL(parent_rate, div);
> +}
> +
> +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> +                                              struct clk_rate_request *req)
> +{
> +       struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
> +       struct rzv2h_cpg_priv *priv = dsi_div->priv;
> +       struct rzv2h_plldsi_parameters *dsi_dividers = &priv->plldsi_div_parameters;
> +       unsigned long long rate_mhz;
> +
> +       /*
> +        * Adjust the requested clock rate (`req->rate`) to ensure it falls within
> +        * the supported range of 5.44 MHz to 187.5 MHz.
> +        */
> +       req->rate = clamp(req->rate, 5440000UL, 187500000UL);
> +
> +       rate_mhz = req->rate * MILLI * 1ULL;

The first multiplication overflows on 32-bit systems.
Probably you wanted to use mul_u32_u32() instead?

More review later, I fell too deep in the wrong rabbit hole ("mhz !=
megaHertz"), again...

> --- /dev/null
> +++ b/include/linux/clk/renesas-rzv2h-dsi.h
> @@ -0,0 +1,207 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Renesas RZ/V2H(P) DSI CPG helper
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#include <linux/limits.h>
> +#include <linux/math.h>
> +#include <linux/math64.h>
> +#include <linux/units.h>
> +
> +#define OSC_CLK_IN_MEGA                (24 * MEGA)
> +
> +struct rzv2h_plldsi_div_limits {
> +       struct {
> +               u64 min;
> +               u64 max;

u32 should be sufficient?

> +       } fvco;
> +
> +       struct {
> +               u16 min;
> +               u16 max;
> +       } m;
> +
> +       struct {
> +               u8 min;
> +               u8 max;
> +       } p;
> +
> +       struct {
> +               u8 min;
> +               u8 max;
> +       } s;
> +
> +       struct {
> +               s16 min;
> +               s16 max;
> +       } k;
> +
> +       struct {
> +               u8 min;
> +               u8 max;
> +       } csdiv;
> +};
> +
> +struct rzv2h_plldsi_parameters {
> +       u64 freq_mhz;
> +       s64 error_mhz;
> +       u16 m;
> +       s16 k;
> +       u8 csdiv;
> +       u8 p;
> +       u8 s;
> +};
> +
> +#define RZV2H_CPG_PLL_DSI_LIMITS(name)                                 \
> +       static const struct rzv2h_plldsi_div_limits (name) = {          \
> +               .m = { .min = 64, .max = 533 },                         \
> +               .p = { .min = 1, .max = 4 },                            \
> +               .s = { .min = 0, .max = 6 },                            \
> +               .k = { .min = -32768, .max = 32767 },                   \
> +               .csdiv = { .min = 2, .max = 32 },                       \
> +               .fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA }      \

Please initialize the members in declaration order.


> +       }                                                               \
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

