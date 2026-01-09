Return-Path: <linux-renesas-soc+bounces-26555-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CC81ED0BE89
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 19:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5310E3006474
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 18:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E172D1F4E;
	Fri,  9 Jan 2026 18:44:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0202737FC
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 18:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767984245; cv=none; b=Ckpr4VxzDc14DHncIKnzB6JW/IopQOhVj9qGoUJXjXT+i+C55EiEFZey82erV/vNIQCe+Ql30oJtk68LJtuH+PGmS9Ki/J3l5L7GudtxC7RWOjElGpJIYWXg8nOFvjNak05CFjlNhWiJpTmrQHkh2jAPThBFcmUeJY2XBLHrFEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767984245; c=relaxed/simple;
	bh=FforcZHx+WfqiWtBEUyUVqYbzjzY+TSio1HjgEUFkao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7774L49IfZKMDa9JzA288LzZA8eNXLKTOE4MNNnTT4+BC8t9Dp4qZwhvxXqUnSrHdHUITJFrLaIb05yPsPhyNuwLIInSlNp5bIh6Pgl85bbKUVNUugSIn3fcEkzvzoo8OaSKwqExwKGLDY2VwhaosHOhaB0RI8G7F08E87w6fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81e98a1f55eso391746b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 10:44:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767984243; x=1768589043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owKRR1yw9zmwxecUjh86QCCGN7unQ2k03XZJfdt7ufo=;
        b=bOCidhUyCKjMIXezRKDYKb0EGM5OY+8x7znHlY2JCxm5XjzBQpccGkyNaXWvyKM+PC
         S9q7KbsxROc5Piw0NE6383yk3DGVW5lxvmsc5GX6WgPMt2uX1he3LCbg1fE0EhQWfnZw
         4fFIvHtAdfbU6TFIuHdTENMXP/4GX7FiB/XsRf15ooT9XdlpJDcaWK8bkEJXt1ocD//f
         /O10s/ILQWH+ALg+xPzKGNSt7smCMwTMs5Gd+9wStaHYZeRntKIn3D/qHofeLidz83Fi
         dwaCI0GMalrsSfAYTjgsofiiXMJu0LJhPWn31Uz9D4qlI7GNAMCGwvknP8yZTkiqyF6s
         7AAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2JaSObLEJX5AumTGjRZCTfNFu0vHH+lOPr+Vwlyp0XeSc82d9vZ9TSl+relGIdrDQN5rvtbpRbA924GZj7JI5+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt1QZJV465bhi0xvwrqf+pr+J2E2rFu68FfHtKqHXOJMAoxnMd
	pOqF9cJ9Q4CBcJ3ILxsBY2z7SH1O7EtSV0SijdbWIDzldReatdvR07j/O0WEPBT+
X-Gm-Gg: AY/fxX5Js2SV5O+/F9Ioo9A9NKJt0xG4LuWEGGZmZOUigcSsjwStNxY7DSryBp4XTyC
	HNIM8kUtoEa1j7TQHZKGJZqZMWpPhL8oUq9TP7MlOY6timmYCvvfCbmOWDw8WwUu2MGsAUxnNzX
	UlyGzx8qbGGoWCQWbX5NYygoPw27bwn4QvBjtV1jxsIBEZDGo6sF5ZlT6Or13WNKlW/483jAjV0
	uuepUCR8l5D2EUhQZtZe2F2dUUsPedyG9dPqPtEAZf9VO5tWydjFGoJ9at/mNLTiTzft/f48DmJ
	051TGehYrsLWzhAsybDVR7s0MVAFvUs0xgBXIJox0YF6msX2BM27ltg3N7PWMofepLGp5wX8KmT
	4huuJQLl1MEmUpdlmkftpLcIuzsB/T03oxdxNSPGUtNijPwcjdjd0rrQpCJv8kRHKcC5yEg3Emi
	Z3u5zgy+SOaFoWitLzawuP2ZX0E5biKAoLooHjD5DMe073Y2Q=
X-Google-Smtp-Source: AGHT+IE+mJtgSNczX/LZP1uNqQwRbz0/zBdU11pI8R10iRoAjTzbBGV5mtrIapta0mxMzcB7a9VxaQ==
X-Received: by 2002:a05:6a00:1d8e:b0:81a:7950:e19d with SMTP id d2e1a72fcca58-81b7dc55013mr9845948b3a.15.1767984243515;
        Fri, 09 Jan 2026 10:44:03 -0800 (PST)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com. [74.125.82.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b98sm10888259b3a.20.2026.01.09.10.44.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 10:44:03 -0800 (PST)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-11f1fb91996so5619062c88.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 10:44:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtAXN1Kiw8zEraeDQBLuPQ2lLh8tVKDoy8PVVwZuxC6ScqQjJHTeAGaF5GWiSLtpuD/VxB14MtkQXhKBRBEISQXw==@vger.kernel.org
X-Received: by 2002:a05:6102:3e86:b0:5db:eeb6:812c with SMTP id
 ada2fe7eead31-5ecbb161af3mr3548015137.43.1767983931089; Fri, 09 Jan 2026
 10:38:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <cdd044968c1d199ad41ec84ed71162725cb2ec66.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <cdd044968c1d199ad41ec84ed71162725cb2ec66.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:38:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVpgnCXVzuZ7ZJQ8dy4Yae=zse3pq=r-g3frymbSVRpVg@mail.gmail.com>
X-Gm-Features: AZwV_QjPxiRlZoVjD9lDA1offfLVFh-eBcX3h9n60XoTGjHhb5ZXNJrajC-uZ0U
Message-ID: <CAMuHMdVpgnCXVzuZ7ZJQ8dy4Yae=zse3pq=r-g3frymbSVRpVg@mail.gmail.com>
Subject: Re: [PATCH 06/22] clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
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

Hi Tommaso,

On Wed, 26 Nov 2025 at 15:10, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add support for the SMUX2_DSI0_CLK and SMUX2_DSI1_CLK clock muxes
> present on the r9a09g047 SoC.
>
> These muxes select between CDIV7_DSI{0,1}_CLK and CSDIV_2to16_PLLDSI{0,1}
> using the CPG_SSEL3 register (SELCTL0 and SELCTL1 bits).
>
> According to the hardware manual, when LVDS0 or LVDS1 outputs are used,
> SELCTL0 or SELCTL1 must be set accordingly.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -64,6 +64,8 @@ enum clk_ids {
>         CLK_SMUX2_GBE0_RXCLK,
>         CLK_SMUX2_GBE1_TXCLK,
>         CLK_SMUX2_GBE1_RXCLK,
> +       CLK_SMUX2_DSI0_CLK,
> +       CLK_SMUX2_DSI1_CLK,

Please move these up, before CLK_SMUX2_GBE0_TXCLK.

>         CLK_PLLDTY_DIV16,
>         CLK_PLLVDO_CRU0,
>         CLK_PLLVDO_GPU,
> @@ -143,6 +145,8 @@ RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
>  #define PLLDSI1                PLL_PACK_LIMITS(0x160, 1, 1, &rzg3e_cpg_pll_dsi1_limits)
>
>  /* Mux clock tables */
> +static const char * const smux2_dsi0_clk[] = { ".plldsi0_div7", ".plldsi0_csdiv" };
> +static const char * const smux2_dsi1_clk[] = { ".plldsi1_div7", ".plldsi1_csdiv" };
>  static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
>  static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
>  static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1_rxclk" };
> @@ -218,6 +222,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
>                        CSDIV1_DIVCTL3, dtable_2_16_plldsi),
>         DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
>         DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
> +       DEF_PLLDSI_SMUX(".smux2_dsi0_clk", CLK_SMUX2_DSI0_CLK,
> +                       SSEL3_SELCTL0, smux2_dsi0_clk),
> +       DEF_PLLDSI_SMUX(".smux2_dsi1_clk", CLK_SMUX2_DSI1_CLK,
> +                       SSEL3_SELCTL1, smux2_dsi1_clk),

Why can't these use the existing DEF_SMUX()?
>
>         /* Core Clocks */
>         DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

