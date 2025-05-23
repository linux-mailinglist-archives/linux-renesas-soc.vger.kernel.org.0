Return-Path: <linux-renesas-soc+bounces-17453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ABCAC2551
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 16:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 263415440EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 14:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC102957A8;
	Fri, 23 May 2025 14:46:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C385C25760;
	Fri, 23 May 2025 14:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748011607; cv=none; b=NJhUt2Ld1Ma9B73GkxwywKrjCxfrUxxAXMFYt8GWvjqivTJzyUzCmH0DZgh/S+DnRYoIhMbcXUkidDuAB/R3orTCYD0iywkUWjR/xOyCTXO+MFVrpzyFLrQXAa/D7z5P+e7bw6Rn5UITAVMOwHx7g5Dn7ZIA7Fua4TzChfgN5co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748011607; c=relaxed/simple;
	bh=HiFOdJZe5roxIuT5bKk20cXktATgE23oiaWu7kfhOqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VirTnywLWNzQRBRPNGTx9cR0F3/b2LMHygaTRMj45Qb+EBFegvGMzbLXPZCuLLILabwg74oiJmwGkMy9etFJpYKbq5NCfSExtmd31gCg7vEhHMAZOr+wPP2COjQwbcPmW4+IBA0YyP1ShbyiTT07G+e1QZB278wtaTGgI9CZHog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3dc6b2a8647so20296935ab.2;
        Fri, 23 May 2025 07:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748011604; x=1748616404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghdI2uqqe2O4Wmd68hFPGrigGpfsBMc5eDJtKxJn5bI=;
        b=vjicjp/4xsP3G9Mb6Usvuy2/pjI1ndDdm7tNUQnNwYwAzvb1FQNsSPxQOYJB7TpPuB
         SoyHZzXmxX0KlbXmPAkUaSysZt4qJlHZqSRA0E3PLqHlHyB8bwBDrBYFKJBnDnL57bqD
         2Y6KbTUE71dePonAJ8muZR9wQKhhE89IMRDGp60duMC3k3iaO8YzjiLNA8FjBLsh40VA
         TJBUp2C2GBaX9z7wrcNdYeONp5zSFv/JeoUk1hrfKwa0rm8AVGOTCfCpm+HOjWlRWwVT
         dFYYXIlrVaygZBMEu2H8DZ0T3jy462E2Yz/VVvOryVIftqC4qpoQ34dKVOULxGWySrM4
         qnAA==
X-Forwarded-Encrypted: i=1; AJvYcCUQSpJAixz/vT4woPCEfFbx/Ba3yhb7xgj1yQNLQyBddS4sPDOXe04e5kJsAPvpqBEMuZf6hZlrLFpvy1V+AaeEcPY=@vger.kernel.org, AJvYcCVO4qDFCXAzP3ATkdHmQ0bAZE97vUKNM247I7F0gkeZHVz90qGU3uGarq3+S8tp41hfrUuJcrqj7wIf6NZ1@vger.kernel.org, AJvYcCWMKROFmFqb2kVLO0WrAMMy8LTuCfGY4AW8Jqc0dPnct2vJIZayQK/XTUsEx70PNLA1HAvTqHkx03PX@vger.kernel.org, AJvYcCWVMpiiqOFO1d+tN8rOZEzm6Fm275yn6u2FHnDAHiaR8QWjSh1b6DjnSIXHLmPKsJkQox611fTEKhQk@vger.kernel.org
X-Gm-Message-State: AOJu0YzF5aM7ffPokY5bGorvkFppxlVS2JSaXSWKEx3NVNlIRdxNKiVc
	wxKU86/SWAUXdtXTuLxJ/WOfQMXCwTDLrUOCR6WFS68FZPL0OxZiEBbHU0hzrJ8+I4s=
X-Gm-Gg: ASbGncvK5+FBz+pS/0q0bVS7Vy+ZFBIJyJbyaxKC7hwd78Wn9g4nOZGIp78E5TF9KzT
	EuoPzAbo0POGXHO8utSmCLM3DiShuT+8LYJuli+u56fWqbz248mn+f3gtHhFTPrOZFSKYA/3qz0
	EGp5CXZEZ2HPUxeH37aJarYz8HK16aKN9mTnPoEUXvaIHT/lg6wkbKNeDMm2Fv1J9zHJ5nxj4zR
	hA4cLedfzH/3IqWgKeu9mK57nV+DzF8C7gOY/oVCkP//Iv35L2YzVFxzzXPYA/zCs74bKuTUfUJ
	klQu5IO0K6WstV3IoZYE2OKWiwYECMtDL9Nh6nUChwT2pPXqv/0IZLvvXz1yc5CmbY4Q+tQe26j
	+blA0Nml2NjhRvA==
X-Google-Smtp-Source: AGHT+IFPGqGxfZsnaUJRDPmSNVeNAm5Cj5OwuuwCMO1g/YtfSHJ4hU/SmlYKGWm45TdD6B+AQmKajQ==
X-Received: by 2002:a05:6870:2a4c:b0:29f:97af:a1a0 with SMTP id 586e51a60fabf-2e3c84d532amr16045579fac.24.1748011593386;
        Fri, 23 May 2025 07:46:33 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e3c075bdfdsm3562700fac.25.2025.05.23.07.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 07:46:32 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72bd5f25ea6so2513064a34.1;
        Fri, 23 May 2025 07:46:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVT92M5qpwDwODEn9CZlYffbjxWG9Tm6n1ubLIrwcOjf4tlzhpr81BmH4AlLVEZX3SVz2gj60IlWK5i@vger.kernel.org, AJvYcCVfF5b/XJlhcZZt2NZcOfk4kJzgG8n40ttpY9Lnak25TTKmzu2mSa7luP75XsePLraIT6EXVPV7QSZ6@vger.kernel.org, AJvYcCW31504SGf2BaDj1T2FXWNFMFLv2noXgQCJhHD6aYla/byGrYHR/XL+c+NFYtCpKS2iBAQmLjoflCJF42yY@vger.kernel.org, AJvYcCXJTN7/2NpuY6gf2eczdDx2kIodoTScUlpKod33SCH2/LS5jDYDOanqlc1MNFEHm2rkThz4uXASG+1W4TBcCxvtV+Q=@vger.kernel.org
X-Received: by 2002:a05:6830:6887:b0:72b:a3f3:deb6 with SMTP id
 46e09a7af769-734f984a750mr15833524a34.4.1748011592230; Fri, 23 May 2025
 07:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250512184302.241417-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250512184302.241417-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 16:46:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9NM3SPeZAxDnh=ez0uBvt9077_64oJe9A727p1r9QOg@mail.gmail.com>
X-Gm-Features: AX0GCFv_GjXouNvqk1PpQnSfRmAzXOHXMmh8i0A88wx3URx0tlvPZOD5l0uuRfQ
Message-ID: <CAMuHMdV9NM3SPeZAxDnh=ez0uBvt9077_64oJe9A727p1r9QOg@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] clk: renesas: r9a09g057: Add clock and reset
 entries for DSI and LCDC
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
> Add clock and reset entries for the DSI and LCDC peripherals.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c

> @@ -58,6 +60,9 @@ enum clk_ids {
>         CLK_SMUX2_GBE0_RXCLK,
>         CLK_SMUX2_GBE1_TXCLK,
>         CLK_SMUX2_GBE1_RXCLK,
> +       CLK_DIV_PLLETH_LPCLK,

CLK_CDIV4_PLLETH_LPCLK?

> +       CLK_CSDIV_PLLETH_LPCLK,

CLK_PLLETH_LPCLK_GEAR?

> +       CLK_PLLDSI_SDIV2,

CLK_PLLDSI_GEAR?

>         CLK_PLLGPU_GEAR,
>
>         /* Module Clocks */

> @@ -148,6 +182,12 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
>         DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
>         DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
>         DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
> +       DEF_FIXED(".cdiv4_plleth_lpclk", CLK_DIV_PLLETH_LPCLK, CLK_PLLETH, 1, 4),
> +       DEF_CSDIV(".plleth_lpclk_gear", CLK_CSDIV_PLLETH_LPCLK, CLK_DIV_PLLETH_LPCLK,
> +                 CSDIV0_DIVCTL2, dtable_16_128),
> +
> +       DEF_PLLDSI_DIV(".plldsi_sdiv2", CLK_PLLDSI_SDIV2, CLK_PLLDSI,

".plldsi_gear", CLK_PLLDSI_GEAR ...


> +                      CSDIV1_DIVCTL2, dtable_2_32),
>
>         DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
>

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

