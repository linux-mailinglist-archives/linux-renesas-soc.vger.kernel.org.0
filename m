Return-Path: <linux-renesas-soc+bounces-17731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E42AC9483
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 19:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4647A22E30
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 17:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A902356DE;
	Fri, 30 May 2025 17:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuPG9E3k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1040B76034;
	Fri, 30 May 2025 17:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748625535; cv=none; b=nj/dhOwnOfzJ/yYRr/qISErOtaTWM7bGKPA8zyLyETwXMU75IP/cLl3GYpnASY4PSaNKV6BQzWkA+C0y3ZMXcNxr/mungCs2SJD3zdyt/bUFCgIHCPNqcIiA6riqZ1YTNjXmjASsXc7v/LVmFqXmZNa5yoGhFCfmUSKQeS5AFKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748625535; c=relaxed/simple;
	bh=9/0bdtA1vR5+4Kh5awQTth/q83szk0nQIqT+94YgRY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QolgB+eCu2pqP7Fl1Fc4V1VGcb4lDwT7XBuRxS9U1DZ55qvC46iAyEBDPMB1ALpXRR5L+cVqYnAWrBR+3Rq6bY5fyEDryhON5o5JW4OVretS5+Pc08o0cvpa1Z94OjvxpmptdHvHaYESguwitp10sT8Yfw2R2SB4CZU85piypiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuPG9E3k; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a36748920cso2446930f8f.2;
        Fri, 30 May 2025 10:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748625531; x=1749230331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ynEvrykvvMU0ksBhHKWbakf97c/AyKOyZ1b6YiZ4xoU=;
        b=OuPG9E3kHuEeWVzKgg7sq3vzHG3hAZabraG/5me70gGTTvr4x7awtM+jKvp+bLsd0i
         UKziSchmr79gsLc2jT7cbtvj7ZDUpK3ZVatgQEk1N1czxK/q2fQuydSkmtVAII1W9+WM
         dhXZX/BU+7DeDnZdZbRnD33IuwDRIbVh6rLtO6HutPOuykRC9CJ8ELOUM4ZHMn+LYRqE
         FuVh1QaS6WJF6+Hw05aIvn739m1XRwb4s+HwaJxi0VIN/ML3tk0slc8HszE3OZbnkVqF
         0UDXI4qOXRKNSYnyGBRw9TZDhHOjAgN7XSLtQ3nyHSVAa7X3IhrD3nVfGJNI7o25KCML
         eriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748625531; x=1749230331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ynEvrykvvMU0ksBhHKWbakf97c/AyKOyZ1b6YiZ4xoU=;
        b=tMDY1RMVTsKwEwDnmZf87/T+jWQEI3xe2XSM+oWSU3c+LCDjxsSSceTMolLbjO6RFv
         f/qCd2gR+payFCjZrwCnBNqs22BcNwonekc3SfvJs7XuIw4Kq9GCRGAKk+U1xlwG3qAX
         8SYjK+Ebt9XhJKtKvOILmNbrwdvjO21jCUxTvDbJ6a193UrndHSAmb9iEZBOLyFhd/oD
         oxXQHTgzvxkqFbl7kcYcxMRJ8jBQ+zOobq/F2ONyZU6PhmLFAl8iJS9oreWGQ1st1+cy
         vKUJ6RsZ8KEtdutvdlzPepuxi66LDn0a3H7qCY0wfArOCB70ziDw3C/aNyNqcqrcdrp5
         ZZDw==
X-Forwarded-Encrypted: i=1; AJvYcCUGzcRN0LhIpQt2wERSI1tNyTVQF75J2xo44FvyNeEdX5t/ReHN7R08GWpDrGmnX6d/X9AmzCIBJQuSPvO9@vger.kernel.org, AJvYcCWvGCb48s+OWrsiB6YLDlhpgt7At5Vj99yzrIOhPhrxiYi+/4+MMVz8ryAOr8brFoY4B54V7Ock1mr9KnyvE6w9uK4=@vger.kernel.org, AJvYcCXB+s/nCyrvHRYvIJjFx5ySx6fmJEUy82CE6MS6HbpPKfvJujrf5pWEwu7y3oiSCw5ns81YgU8NuKB1@vger.kernel.org, AJvYcCXkQuCL7+OH+Qnwe1D7yMfijwn3zATJkZ9Bxu6nX/kXgds8O2HCO15lc2aMYrqXvnnfF56bEKLlBTK0@vger.kernel.org
X-Gm-Message-State: AOJu0YxINZ9NKexZTO5iBhvv4nqgi1Hx16j4tek7dN2kizNAf/dgA80A
	m61Y+GMRiVMkcCKBlhTrDOLRFbr96jhiATR+eLr5w416V9qHYo+lrLB6
X-Gm-Gg: ASbGnctW0yxJnEWF8ku8DMXqEsXnGOXtpz60MQWP6XQIVSCXr0eMy2GRAWjVGM7P61M
	eegRurCp0nythZmvhek2fAhjmrRkGyGlOxLRKQzLHfVVqLvmHE2GXMVJi0JdA25g+DsYg71H7zS
	HyJkSP5tH0C9F73Jv0QJtnCMZ8hYc9vM+JHhOYDEADlvfw/J0zFVQ51y2bX7HWthw4vACpO4IG9
	TNfEZt/wCQF7fg1rlJMj+urIadjn/7HL/Rs5IxwV5nm1L65CYFqSmap4pkYqUigHxGjGVj8SDNY
	A0vVAVXbQkRv/3KCYKOLsXNH03Z9ksqkYMmwFZeYnDYy14M1o7frwz/og/cg21RRegtUsdT45WH
	K/HnaXJc8pA==
X-Google-Smtp-Source: AGHT+IEp6Pb6coP//ft8xEoxnN0XG2mGL8lYvmKsSoDN6jZiXpCVG5HXqDoz0TnLlIZVoVTUVF/FDw==
X-Received: by 2002:a05:6000:2204:b0:3a4:c713:7d8 with SMTP id ffacd0b85a97d-3a4f89a765fmr2551757f8f.16.1748625531267;
        Fri, 30 May 2025 10:18:51 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972c1sm5395963f8f.68.2025.05.30.10.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:18:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 0/4] Add support for DU/DSI clocks and DSI driver support for the Renesas RZ/V2H(P) SoC
Date: Fri, 30 May 2025 18:18:37 +0100
Message-ID: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
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
series [0], but has now been split into 4 patches due to dependencies
on the clock driver, making it easier to review and merge.

[0] https://lore.kernel.org/all/20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Note: This patch series applies on top of the following patch series:
[1] https://lore.kernel.org/all/20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

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

Lad Prabhakar (4):
  clk: renesas: rzv2h-cpg: Add support for DSI clocks
  clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
  dt-bindings: display: bridge: renesas,dsi: Add support for RZ/V2H(P)
    SoC
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

 .../bindings/display/bridge/renesas,dsi.yaml  | 116 ++++--
 drivers/clk/renesas/r9a09g057-cpg.c           |  63 ++++
 drivers/clk/renesas/rzv2h-cpg.c               | 278 +++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h               |  17 +
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 345 ++++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
 include/linux/clk/renesas-rzv2h-dsi.h         | 210 +++++++++++
 7 files changed, 1025 insertions(+), 38 deletions(-)
 create mode 100644 include/linux/clk/renesas-rzv2h-dsi.h

-- 
2.49.0


