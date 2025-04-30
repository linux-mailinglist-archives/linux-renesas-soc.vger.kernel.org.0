Return-Path: <linux-renesas-soc+bounces-16534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 193B6AA55AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 22:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BE091BA1F01
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 20:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5CC2BD911;
	Wed, 30 Apr 2025 20:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ND2tOdRc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2F529AAE5;
	Wed, 30 Apr 2025 20:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045680; cv=none; b=YClYodlZEwB7c9cXLgf3vIye76qPMO+yQfYyDrJJZ6tikkv/YpPIra813aHl+x+mEVLe6sBPcUjA7uR6wnFucNKZnV3aaTu5WgPGes0acPtQMKBEo7pf4AmVHFP16soZONeZ3vFjdA8YA3jN0/TSoOlvR83GoTW+Y38DmA46VeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045680; c=relaxed/simple;
	bh=FIJkWQx3n/GTNGDF5K35mmGtmtWCI+csZwK3UZSRaDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pokNtNxn2d13juOlSWxAQrm8TYwl5cYwmxzIg80JFLgF7Ru58gimIecq4PuHuyP8pdBynG88tB7icd0ATmn+ugOrPG/K6V0o4K8nfPw2i8IgQ7CHZXlao3C3XqmC1oDYl4A8U/lxsNzhT9w2zX12vIrFSlQWbnl6q8htBwgCOzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ND2tOdRc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394a823036so2375565e9.0;
        Wed, 30 Apr 2025 13:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746045676; x=1746650476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h+0oEo+2af6mgwBNbFoSGUGqEO4NAM3HORidCXlgox4=;
        b=ND2tOdRcmc6WTIZZDIbyo5BdYmvkhZkzTQN6DfqvE7eC7VZnl3Xe04Um1cXHwlEPbE
         +qc0X9Gb3vVYLRcKnl97YyYAJXYFyAOYLtgI7P1g2IbAy8hJrh/5xSDjtyY09jLxbCPB
         jFq0tY7VaW3PSrN2p12NPaVE5vKG+WAr8uSaWYGK3lKp2cFub6tbL5KBTk3rLMLk9GIs
         Ck3KFEnh3h86OfbDaXOgTeyXli9Xdw4+0m6RVrmORJ0hoTP1s05W1duqPu5h35GzZcd2
         dNUDD7+zFnjP4PabNY8eZK8w2JZJaLYCmHTvCfkVUw/mNsxq6grdB7BH3WK212giTHL2
         IFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045676; x=1746650476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+0oEo+2af6mgwBNbFoSGUGqEO4NAM3HORidCXlgox4=;
        b=O2GaTv01HuHfgrEXVI3rA4XUZU03R6vL2qPCtAWuDIAQzzGgrZe870J+fuUUQ9jQyg
         +mExR9yI+Tw6UjdE4UznzlPSpABJP09wcwOlVMNgUEtHOb8zDWs2p0DvqQggZ9sKMT0d
         BBWNnzkTjoTEQC0HmkFuixfmQZphnuiLqTV8KPhA2NRxtTnSTs+BHHtyMQO2uq+I/iU6
         6punxOip0hllpo069KpJhaTjC/ZKDz1HQ+QI6caGtcCjbUoY3btP+oHfpYVcOx3QWvxJ
         n/mfQ5Gv3+4mm5jz583yBCfum9y0rq1zsf0oaUnEHn9qkxAfQGalZfHuWW7Z50b+tyqF
         sXuA==
X-Forwarded-Encrypted: i=1; AJvYcCWItla51zKmr9AUYdazAXfchnc0d5JGFZQXsadJj635fVtNau9gIke2vb1cZXc5lkALNkO6Pd29EE8G6/Nb@vger.kernel.org, AJvYcCWPkta0gtvahqxsN8ui3EeCPrn5qZllC1pGbSCQvCBtI4Y3Nd0KpDYZ0R8n2hM/44es80jhiu9ufqjy@vger.kernel.org, AJvYcCX2JmHe1RqGOtEOgjWIgI8RfQef+bjdYYJgU5nTrcr9E/yf7IwySRN6kQw5wH5QpJ6KPsOtnxRp5M7e@vger.kernel.org, AJvYcCXg4BOY0URwRqegBYs/4jZgnjMuO6ETDZatLc55kjbDB34FVCKTp06v8uMImOWAZWz+wXW2ptX9zEvYLKhV5E6fbYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUWXtUZXts+CjJsLDSa/UFGnYEpitsWyzACgMFrXZP2qJOrHXf
	PnK+28TWEj6lQFus1eXQzLBGjhZ1yINhqx/jMK1nUyWUYr55gveK
X-Gm-Gg: ASbGncu9fDk+DH9PIyrhQaK1W1BKMwMe4kMIS8OwFlhYSFprya8ZKiSNY63dzpazNEY
	/f8Tt+p/IWsaI9TLUIdTL3nm1AVWXE4PMlFJTuOPcCc3Za5KMiatkUSLoATCDVO5SaB4S8jWcKZ
	fuMhE/88ejf6PVy1rzjXq36Aj+4M6Ech6gPjroHcySjmIW40TQExUKSlonuox60zw0YvK6qTqhF
	1oF0kPmgBQiT2g/3ttlP2MY/oRsaE0Tc9+m5/LprwtCHVdLM7s7XslXLZsRv5vs/56uGr6MWZUx
	sc+BCQzMHvtfm2+9vfqw/ZEPmXdZ4mORRA58ptb2J2upj3n5oEmGrTdYYtxn38n+kGM9xmAnEFE
	=
X-Google-Smtp-Source: AGHT+IHHmfa6fAuAP9K0xRCIe3d5NwavvgE5Lxi1iFdup1Eg0ZUBMyCbHPbI1/0iVqt3FxkC0l9x7A==
X-Received: by 2002:a05:600c:35cc:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-441b1f33a80mr37929995e9.12.1746045676217;
        Wed, 30 Apr 2025 13:41:16 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:41:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 00/15] Add support for DU and DSI on the Renesas RZ/V2H(P) SoC
Date: Wed, 30 Apr 2025 21:40:57 +0100
Message-ID: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the Display Unit (DU) and MIPI DSI
interface on the Renesas RZ/V2H(P) SoC. The initial patches add PLLDSI
clocks and reset entries for the DSI and LCDC and the later patches add
support for the DU and DSI drivers. The DU block is similar to the
RZ/G2L SoC, but the DSI interface is slightly different. The patches
include updates to the device tree bindings, clock and reset
controllers, and the DU driver to accommodate these changes.

Note, my initial intention was to split the clock patches and the DU/DSI
driver patches into two separate series. However, I found that sending
them together will make it easier for the reviewers to understand clock
related changes.

Note, the clock patches apply on top of the below patch series:
- https://lore.kernel.org/all/20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v3->v4:
- Corrected parameter name in rzv2h_dsi_get_pll_parameters_values()
  description freq_millihz
- Used MILLI instead of KILO
- Made use of mul_u32_u32() for multiplication
- In rzv2h_dphy_find_ulpsexit() made the array static const.

v2->v3:
- Update the commit message for patch 1/15 to clarify the purpose
  of `renesas-rzv2h-dsi.h` header
- Used mul_u32_u32() in rzv2h_cpg_plldsi_div_determine_rate()
- Replaced *_mhz to *_millihz for clarity
- Updated u64->u32 for fvco limits
- Initialized the members in declaration order for
  RZV2H_CPG_PLL_DSI_LIMITS() macro
- Used clk_div_mask() in rzv2h_cpg_plldsi_div_recalc_rate()
- Replaced `unsigned long long` with u64
- Dropped rzv2h_cpg_plldsi_clk_recalc_rate() and reused
  rzv2h_cpg_pll_clk_recalc_rate() instead
- In rzv2h_cpg_plldsi_div_set_rate() followed the same style
  of RMW-operation as done in the other functions
- Renamed rzv2h_cpg_plldsi_set_rate() to rzv2h_cpg_pll_set_rate()
- Dropped rzv2h_cpg_plldsi_clk_register() and reused
  rzv2h_cpg_pll_clk_register() instead
- Added a guard in renesas-rzv2h-dsi.h header
- Reverted CSDIV0_DIVCTL2() to use DDIV_PACK()
- Renamed plleth_lpclk_div4 -> cdiv4_plleth_lpclk
- Renamed plleth_lpclk -> plleth_lpclk_gear
- Collected reviewed tag from Krzysztof for patch 3/15
- Dropped !dsi->info check in rzg2l_mipi_dsi_probe() as it
  is not needed.
- Simplified V2H DSI timings array to save space
- Switched to use fsleep() instead of udelay()

v1->v2:
- Rebased the changes on top of v6.15-rc1
- Kept the sort order for schema validation
- Added  `port@1: false` for RZ/V2H(P) SoC
- Added enum for RZ/V2H as suggested by Krzysztof as the list
  will grow in the future (while adding RZ/G3E SoC).
- Added Reviewed-by tag from Biju and Krzysztof.
- Replaced individual flags as reset flag
- Dropped unused macros
- Added missing LPCLK flag to rzvv2h info
- Dropped FCP and VSP documentation patch and sent them separately

Cheers,
Prabhakar

Lad Prabhakar (15):
  clk: renesas: rzv2h-cpg: Add support for DSI clocks
  clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
  dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2H(P) SoC
  dt-bindings: display: bridge: renesas,dsi: Add support for RZ/V2H(P)
    SoC
  drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
  drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
  drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
  drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
  drm: renesas: rz-du: mipi_dsi: Add OF data support
  drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency
    calculations
  drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
  drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for
    RZ/V2H(P)
  drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring
    VCLK and mode validation
  drm: renesas: rz-du: mipi_dsi: Add support for LPCLK handling
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

 .../bindings/display/bridge/renesas,dsi.yaml  | 116 +++-
 .../bindings/display/renesas,rzg2l-du.yaml    |  23 +-
 drivers/clk/renesas/r9a09g057-cpg.c           |  63 +++
 drivers/clk/renesas/rzv2h-cpg.c               | 237 ++++++++-
 drivers/clk/renesas/rzv2h-cpg.h               |  17 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  11 +
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 498 ++++++++++++++++--
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  36 +-
 include/linux/clk/renesas-rzv2h-dsi.h         | 211 ++++++++
 9 files changed, 1144 insertions(+), 68 deletions(-)
 create mode 100644 include/linux/clk/renesas-rzv2h-dsi.h

-- 
2.49.0


