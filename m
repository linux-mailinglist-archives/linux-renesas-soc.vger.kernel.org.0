Return-Path: <linux-renesas-soc+bounces-21290-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10937B42682
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 18:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA0FF3BCF60
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 16:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC77D2C0F62;
	Wed,  3 Sep 2025 16:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i69K8/fH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE5E2C027F;
	Wed,  3 Sep 2025 16:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756916250; cv=none; b=Kj3aNFrAehllUcZ5hyy7c3Mnrc5jBUlhHpdVpKWPjpNqu2louBKkFgkt07M2/JRRiXVpyptYMICAv5UsXMfSF7IdN4rLXro5cRDhP2Kf+h00cYE9OHFTAICpX4ayWijrfRAgCm+pc2MfhNXO+xjBmw4yzODkepZVqvNgAJdnAf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756916250; c=relaxed/simple;
	bh=CCln4rPb3P+0/6GwoT/lBnSgMtAhhtryaHSoqSLxhb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iD8AZTkWTjFShoQA+ttBG/U0SDhD172vgDRo03lKfUVae3jkLy7Khxwt6yPAUmuQrMffO2OBtUw9xElcnOhqVVKsQZbsolD3ulr2XoLLjcWQlvp7a3jSYtAd8wcugb8bq2tmbBfNvUaeqKKEaznNTQ89GZ2Tf54r1Rcg5p9/sZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i69K8/fH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3dea538b826so74751f8f.2;
        Wed, 03 Sep 2025 09:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756916247; x=1757521047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zhI3DRe5+X+SOWNKbXoFOHpSP7IEamKPQO7YKwNjIhM=;
        b=i69K8/fHUgbvRh7BwpHUYknmLVnuMpT3Qo+bFZyphm1gSN8zdDs/aUijOlpgM9t9+w
         6H6cb4VlNzAo5ki1Qh2hogoFrKPKdJcgCVe80Bil7JCcWtYYeB7vhvoODyFLFTzVE+aN
         oVnXBJAGNzJOY4pRfjouCswG6plv/rG8ZXgeMT6rgUk7eRPVts1XAJ3J+MrDDr7UD6R8
         y5g6Re6rm32EDIrSFxCjmfCJRT01/zahUy0invWbTu4GmPK5s7asgexLc6nDHL/xaK0i
         2h62SPZVPlDtz+2mTaLGl7YrDOW0wGghbhVDJIDM4J/P+lb2M45TfU90vop+jgM2xboO
         ylVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916247; x=1757521047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhI3DRe5+X+SOWNKbXoFOHpSP7IEamKPQO7YKwNjIhM=;
        b=d4KmlHR7MF9kmXuNqjP2/wZqdOLiXesOycSSRPm3tRuxyC9OgedegwUPP7IIzyr79I
         ExCabcrlUXBRrQu3JdoGxGF3X3sQmQ6TanmyYh8bQ+R3jafwYJ3sLMuTtNcuSzkm4xGW
         tNb56Dw7nIq2v45Wm8OnFuTyl7xabyJBcVq0/34HTAqmK9lgqJersGL/ybDdE1eoYu/j
         2LiWs5gIhhXnztYvMoJmjE6SLGoWrq3JBDu5S6RPOi/SwBE1Vy+/s+7d6qjAeCoZVKUY
         DngkWAMoC38YQ3DY427TJ09EHAx5A/btplewsbX+8dA2BwHnGYB+M7LYQTrCtQT0psks
         Gmcg==
X-Forwarded-Encrypted: i=1; AJvYcCUc04AVYcrKd9HC7oMu47NHlDuO3tVkobT08vr5tWHlZW1iTr4u2MpG+KPgclGPJpSLbV5vpEr5mahMwIQ3@vger.kernel.org, AJvYcCVEptEmbX8daBH6tBOaWWJ+p41hdHChF44K4dIvevHMzlQR7eTCBVxa47r7ZyPmsGeCSxOcNl7SAVLP@vger.kernel.org, AJvYcCW2atzLL5o/n/j8rvdu5kYD1twy/bAvQuFdBjQtjfrAvSOce0DqQ9VrDMst0RwdMLkJSQTeZD1gDwg8@vger.kernel.org, AJvYcCWaN228wDiaY+So8Hir77PE4zAdPXUBpvE4HCU0X9Vls9jRdimcPRdYssgdkNvvMCm9FuXg2a5JIINlqmVG9S5hD4k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8yQB1ZJ3mpGXvRIAYeHBszTv6iBbNC969Dq44Ja6y1UhDmorQ
	H+ApGaCVqfj/CGG2ZGBs4dJtA4nrb3R71uLAdneU/jAqVoC4unH8Y9nU
X-Gm-Gg: ASbGncsuzZW/ZLi2oxMI5Wy+ySV805aCe3/NMWoXOK4xK4Qr4/68xsvL8Fggf9dV7Az
	SB65KPHZZVnVVAB8LhXOwi5Du2LaxItu74d5TTmoBvbWhQxiY4Hsj3+rtvJVFqM+cfeFG4M0og1
	5n08n9Qv4Erl+QkphrUkf5SgbBRwEWJo9kApezDy797C9qIeVpuGIbcx6nL6dZFAi3Rp/sdCMta
	GPSIWC4qSU+Y/7AMpgMQI2tD/uLXn+1bREBK8p1J5UPZw806yXnTi3wvFcJvGW2PsQwh91SvzoE
	ZQZzz/uSJOuWNdOMPqnarAam5ymt6zxSwDfCdqAMlsEEc4gtvUV/PaVNKaPXUxVxc5OZ682hxzw
	7bZpJ+uiYz4r5Iqp4MwaudVuCm1SGK+iiW/ud9FMqFQrpDnquiw06ojt+BeZ/2KmiWww=
X-Google-Smtp-Source: AGHT+IGQvSyrqgXepsg7T3rt6MRb4D5lOt6u9g5K86HhZIiJtDR8DJpMha1fmoke+OZcXHmTNn9xUg==
X-Received: by 2002:a05:6000:40d9:b0:3dc:1473:18bb with SMTP id ffacd0b85a97d-3dc14731910mr4074650f8f.39.1756916246607;
        Wed, 03 Sep 2025 09:17:26 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:9019:aa0f:b6e4:7952])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3db72983560sm5645734f8f.1.2025.09.03.09.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:17:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 0/6] Add support for DU/DSI clocks and DSI driver support for the Renesas RZ/V2H(P) SoC
Date: Wed,  3 Sep 2025 17:17:12 +0100
Message-ID: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds DU/DSI clocks and provides support for the
MIPI DSI interface on the RZ/V2H(P) SoC. It was originally part of
series [0], but has now been split into 6 patches due to dependencies
on the clock driver, making it easier to review and merge.

[0] https://lore.kernel.org/all/20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v7->v8:
- Added reviewed-by tags from Tomi, Geert and Biju
- Dropped rzv2h_get_pll_dsi_info() helper and opencoded instead.
- Dropped is_plldsi parameter from rzv2h_cpg_pll_clk_register()
- Updated commit message for patch 5/6 and 6/6
- Switched to use devm_clk_get() instead of devm_clk_get_optional()
  as lpclk clock is available on all SoCs.
- Simplified check in rzv2h_mipi_dsi_dphy_init() for PLL parameters
- Renamed start_index member to base_value in struct rzv2h_mipi_dsi_timings
- Added comments in the code for DSI arrays and their usage
- Added comments in the code for sleeps
- Rebased the changes on next-20250902

v6->v7:
- Renamed pllclk to pllrefclk in DT binding
- Added a new patch to add instance field to struct pll
- Renamed rzv2h_pll_div_limits to rzv2h_pll_limits
- Included fout_min and fout_max in the rzv2h_pll_limits structure
- Renamed rzv2h_plldsi_parameters to rzv2h_pll_div_pars and re-structured
  for readability
- Dropped rzv2h_dsi_get_pll_parameters_values() instead added modular apis
  to calculate the PLL parameters ie rzv2h_get_pll_pars/rzv2h_get_pll_div_pars/
  rzv2h_get_pll_dtable_pars
- Dropped plldsi_limits from rzv2h_cpg_info structure
- Updated the DSI driver to use the new PLL APIs
- Included the LPCLK patch
- Rebased the changes on next-20250728

v5-> v6:
- Renamed CPG_PLL_STBY_SSCGEN_WEN to CPG_PLL_STBY_SSC_EN_WEN
- Updated CPG_PLL_CLK1_DIV_K, CPG_PLL_CLK1_DIV_M, and
  CPG_PLL_CLK1_DIV_P macros to use GENMASK
- Updated req->rate in rzv2h_cpg_plldsi_div_determine_rate()
- Dropped the cast in rzv2h_cpg_plldsi_div_set_rate()
- Dropped rzv2h_cpg_plldsi_round_rate() and implemented
  rzv2h_cpg_plldsi_determine_rate() instead
- Made use of FIELD_PREP()
- Moved CPG_CSDIV1 macro in patch 2/4
- Dropped two_pow_s in rzv2h_dsi_get_pll_parameters_values()
- Used mul_u32_u32() while calculating output_m and output_k_range
- Used div_s64() instead of div64_s64() while calculating
  pll_k
- Used mul_u32_u32() while calculating fvco and fvco checks
- Rounded the final output using DIV_U64_ROUND_CLOSEST()
- Renamed CLK_DIV_PLLETH_LPCLK to CLK_CDIV4_PLLETH_LPCLK
- Renamed CLK_CSDIV_PLLETH_LPCLK to CLK_PLLETH_LPCLK_GEAR
- Renamed CLK_PLLDSI_SDIV2 to CLK_PLLDSI_GEAR
- Renamed plldsi_sdiv2 to plldsi_gear
- Preserved the sort order (by part number).
- Added reviewed tag from Geert.
- Made use of GENMASK() macro for PLLCLKSET0R_PLL_*,
  PHYTCLKSETR_* and PHYTHSSETR_* macros.
- Replaced 10000000UL with 10 * MEGA
- Renamed mode_freq_hz to mode_freq_khz in rzv2h_dsi_mode_calc
- Replaced `i -= 1;` with `i--;`
- Renamed RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA to
  RZV2H_MIPI_DPHY_FOUT_MIN_IN_MHZ and
  RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA to
  RZV2H_MIPI_DPHY_FOUT_MAX_IN_MHZ.

Cheers,
Prabhakar

Lad Prabhakar (6):
  clk: renesas: rzv2h-cpg: Add instance field to struct pll
  clk: renesas: rzv2h-cpg: Add support for DSI clocks
  clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
  dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
    RZ/V2N
  drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

 .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++--
 drivers/clk/renesas/r9a09g057-cpg.c           |  62 +++
 drivers/clk/renesas/rzv2h-cpg.c               | 298 +++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h               |  29 +-
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 451 ++++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
 include/linux/clk/renesas-rzv2h-cpg-pll.h     | 395 +++++++++++++++
 7 files changed, 1349 insertions(+), 40 deletions(-)
 create mode 100644 include/linux/clk/renesas-rzv2h-cpg-pll.h

-- 
2.51.0


