Return-Path: <linux-renesas-soc+bounces-16025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C667A8A363
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 17:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24354440EB2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 15:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973E41EEA59;
	Tue, 15 Apr 2025 15:51:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10654315C;
	Tue, 15 Apr 2025 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732281; cv=none; b=bpZtupQu1YXlW8BISfJpFrpUU6iknp5ulr3ZCNq2FpyxA2FIF/42NhFNb0p7ln0rMk+qmpt2woFdwjryjMEPHXVuEo2qHniVlYpkU/xnj0CfXN1NFVUOhGXSPEjaIe066UNyLMEIk0maLdvUQW8DSKKXQXivWXTaMlqVbH2KBDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732281; c=relaxed/simple;
	bh=h8pYCryFTyz3ogsg8CjJtivghY5nNbY3fs8XAmTefAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ky6mrXNYtS6EaTFbysALQe2CeNeZaKSLxMEaPCwY/obF3StyPxCueNW4FwL3nK5RCYPhGsGNQ9GBjOyqYBs4DzoRIOlXwoedK+R9ZOCPWt2jYcDVgUnTNmyTsALDziTFtYRZBiRwb9HLr4s7qgxkW+Sx0DkZvMw1Io4TDkpd6j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86d75f4e9a1so2183782241.3;
        Tue, 15 Apr 2025 08:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744732273; x=1745337073;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQOaA84/gJX5YcmA1yI2UrffzTTDGmIxxE06BR+8a5Q=;
        b=GvuaecnYUyp5NRqywkySyYs91mVAzaLNan/VqrKgJ+/l+VP/iZksfZUpX1m+VQ9k/Z
         W/A2Wx1N13rQeMk2mCgvXPWkuE1duuDJiubpvqcFxO61E0aDjHkZ3JNDUCpDtSwhL6qR
         77r4+B/WhXlCmxkLimlcTzlEg6fG60BPhPwS9V023hGXchLF9jYOyfF+RN3Q+tZw1P4U
         O7MDee8WLzfzp3aSlv+Zn7yEXLcwB8RMj/NfJMByIPBxqe1q3ilM6bxuAGnjC0sbGeDF
         3IB9jUmlzXJTne+GaZpG9s+m85KOAeNYynKVmVshIUQAYg4xnXMaxP7qWAuUKIkkOaZi
         gDdg==
X-Forwarded-Encrypted: i=1; AJvYcCUo8kLC6Y6+BMlBTMhR1C+MAASYZAAZ2WZM1DONIjtdBZhfFd/GO0E49RT5LtHoOExCbfGFSTm+epZc@vger.kernel.org, AJvYcCV+NTbFm3HN79BaEbjRVZWY1781hK5HB7TQxnTMd083i4Z/kH70WdKOcc4F5hgPxOIbB1dn+RxPGEHb8x8n@vger.kernel.org, AJvYcCVqjNUONnEFIkF9nKIEvmWlfjDNyqOpNLI8CB407AI0UitLKikNaEUacOmtQPRmyYdxnv3Sw+qMDCEKaK0xOYXg+L8=@vger.kernel.org, AJvYcCX8gcHuM931Sl9+wbJogeYfAwaPLYAsRnhXeqSm4DbPFfS9cOkNZWlVF+zUnlbxOc3rOFSfvYJtOnGM@vger.kernel.org
X-Gm-Message-State: AOJu0YyG2ssW/jCV1frT4xSZs4rVM4Eikm5mSDd2HtJocN8yD95aoWEU
	xeQTCxp3xSHQjdbRxfFNePdmgcyPInSJPnTSYhZROzIea/PhMmUrFvDd/iA/
X-Gm-Gg: ASbGncuyuPzWKbsU40dRmFMMo6GHugTkKc23CUoyhouEEf60p5kDXKSLOsGWS2EFaX7
	8mR4G0QT5O9zZdYLQJXOIAqlYqQBK8rioYcze0wN+fQ0Vc/5Pcr1q79kZUpNYO1NREsetj8Mz+z
	4jWBYZzgf9gQ3XZ9/Mi4WS5ZiGmlx2C3StDqiMM/ynpm5Dx1/cURZ7tq07dGwBHIMtCrMcA5kPi
	OV7+7B8k5E8aLv249H/K5KQi8YwcwD+KmPhxdPDAxhjMbi+wcy8eWMWZZT190jKqWViEjoiWkJV
	uNM6vNUkdtoMpeSVr942cwE5Orgrd8YG8/IYdN6ViJDfigBkSYLTqKwC5OFJXIEaLMSQi2MizFQ
	j0Tw=
X-Google-Smtp-Source: AGHT+IGYm29SA0ta3+Nwv6yv8KhX8nXsE95hHyFYJ2IqxbBzl85keeoOy3oHLK5c9YeIwEBcUzeFXw==
X-Received: by 2002:a05:6102:2ad3:b0:4c3:6568:3e18 with SMTP id ada2fe7eead31-4c9e4f1f1a5mr12426613137.15.1744732273403;
        Tue, 15 Apr 2025 08:51:13 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c98ee49csm2585306137.26.2025.04.15.08.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 08:51:11 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4c3183ec801so197087137.1;
        Tue, 15 Apr 2025 08:51:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEFUm8AOCY9eqowOPSW7hT4RmM3xgG/+vr5RD49z3DnHsmnd8Nv6zFBVXZtp8poSyK6rC91ns6U7sJ@vger.kernel.org, AJvYcCVB2n2bJP2RGKFUP5UU3lIt07UMzETHsj1xt7xXS3ZYU54MgwaL7qaBRq8Tumm8FwFo0Or2ymaHEVL65WLK4xjPpLI=@vger.kernel.org, AJvYcCVsG7Kvb6QBkEii/C75r9lIJ+u33AYdZmFgkJDIeMUCZYJ8UeA3tz3zOanIkPFlbi81S5NLgQO8/kla@vger.kernel.org, AJvYcCWthxuQMya7V16yYqaEkK3NfV7CT4uj7t8IzjXRKu5aSDOgdu+4Xe/oLypybb1pC+rNRlofiEHI8PCveopU@vger.kernel.org
X-Received: by 2002:a05:6102:c05:b0:4c1:6feb:83aa with SMTP id
 ada2fe7eead31-4c9e4ee9fe6mr12739669137.9.1744732271060; Tue, 15 Apr 2025
 08:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250408200916.93793-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250408200916.93793-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 17:50:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWj91VbxRbb_pZ23ySbvjzzgfTgy83GXTEtC9CAS=d5Sg@mail.gmail.com>
X-Gm-Features: ATxdqUGU1HbZIqRGMDrZbhA-dxUGjQxgUi_EpOym7TmGQkaFVWVIrulXG2lf2bU
Message-ID: <CAMuHMdWj91VbxRbb_pZ23ySbvjzzgfTgy83GXTEtC9CAS=d5Sg@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] clk: renesas: r9a09g057: Add clock and reset
 entries for DSI and LCDC
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
> Add clock and reset entries for the DSI and LCDC peripherals.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - No changes

You did change CSDIV0_DIVCTL2 to the NO_RMW-variant...

> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c

> @@ -148,6 +182,12 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
>         DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
>         DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
>         DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
> +       DEF_FIXED(".plleth_lpclk_div4", CLK_DIV_PLLETH_LPCLK, CLK_PLLETH, 1, 4),
> +       DEF_CSDIV(".plleth_lpclk", CLK_CSDIV_PLLETH_LPCLK, CLK_DIV_PLLETH_LPCLK,
> +                 CSDIV0_DIVCTL2, dtable_16_128),

The clock names look strange to me: "plleth_lpclk_div4" sounds like it is
"plleth_lpclk" divided by four, but that is not the case here.

> +
> +       DEF_PLLDSI_DIV(".plldsi_sdiv2", CLK_PLLDSI_SDIV2, CLK_PLLDSI,
> +                      CSDIV1_DIVCTL2, dtable_2_32),
>
>         DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
>

> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h

> @@ -117,6 +118,8 @@ struct smuxed {
>
>  #define CSDIV0_DIVCTL0 DDIV_PACK(CPG_CSDIV0, 0, 2, CSDIV_NO_MON)
>  #define CSDIV0_DIVCTL1 DDIV_PACK(CPG_CSDIV0, 4, 2, CSDIV_NO_MON)
> +#define CSDIV0_DIVCTL2 DDIV_PACK_NO_RMW(CPG_CSDIV0, 8, 2, CSDIV_NO_MON)

The documentation says:

    DIVCTL2[3:2] is reserved.
    When writing, read modify write is needed.

So the NO_RMW-logic seems to be inverted?

> +#define CSDIV1_DIVCTL2 DDIV_PACK(CPG_CSDIV1, 8, 4, CSDIV_NO_MON)
>
>  #define SSEL0_SELCTL2  SMUX_PACK(CPG_SSEL0, 8, 1)
>  #define SSEL0_SELCTL3  SMUX_PACK(CPG_SSEL0, 12, 1)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

