Return-Path: <linux-renesas-soc+bounces-19714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9F5B142BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 22:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4237318C1315
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 20:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE70277C8C;
	Mon, 28 Jul 2025 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gc7RPogS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0281E21FF51;
	Mon, 28 Jul 2025 20:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753733682; cv=none; b=kcQSS9uoAz0OhAlqWHNAIVu1ne3uyDsYjmM2tc2rJamGn9d2LWJxuu9mJRDw4hSLTl5CYli1lgRfbokV8jAQZrHOtINzQv3/kj18b52+YGLLOriP+MTWn3du268Ypa9el8df23ZQzpjLwAdxIVZ0+o45uYaOXBMCIOnO8oDN3CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753733682; c=relaxed/simple;
	bh=/xVwPRnTKKJJsJnefnn7v++SFtx6Ggj9wjdKgv1HzEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bOQB2NSTwIia+uRjCQLBrhsLprOhYfcY/C2U3BOKC6U+fUUl+JF7cX9hz3yn1CVmx7mvHho9T2B1qHS2BciQffDNF/zUchXwu4ur8/iVwDN4Js1PhtU4fq+R5dQFwlkGPdbxk4x3o9d/k3iFxTdVBSScEy26B6D3teeOq7jQrJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gc7RPogS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b7886bee77so1497252f8f.0;
        Mon, 28 Jul 2025 13:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753733679; x=1754338479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T+utp1cms6cgiER7DRRzvLSUrGjn186aBUXh3YlWXY0=;
        b=gc7RPogST6Th/7YStoSKhbOsGtWvR6IZ5xW4DECD/tSAGi5sZtjprns0G94Zrf5tQ5
         m6eUD5+FtpST4zZWHKjG6M/+5OD6J+80QIqbX7kg9EwPmooJQqr6ALOWNjABktkb4kmX
         SpddrfvIqNlGmK7qWPQGouNFwgUfqZNRj8vaeGBPmwvtgOgI+hiSehZsMjQyLK55hzxx
         xoqltQ/yHDJIuX7/sQNVGAmXUWm2P6J/LrD76fLEhr8KbrvM9Sj+R11SX+ahupztsmDJ
         Vih3iCVzCLejsKkvZet5AMEOs5NLKFTPsmYRYyvgwfNPLXtWWPgX0S3+Jn9iYG1qhUX7
         VL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753733679; x=1754338479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+utp1cms6cgiER7DRRzvLSUrGjn186aBUXh3YlWXY0=;
        b=j4f6LzaORl6Cz4kzB9OtgS4VHZVvzfl9b3L4WIPyvAlW9CabtN4cumwLMrpytvTCGm
         0ZiAZpGYfMhzWSjke/I2NVOZtaYxOMBp5dIXEQl/RTbzzJ0No0ZK1VCc8ulEjq/T5bJp
         hOjH1A9L8WRqHy8GgHcdOmXK1steo7bz/9SxNhxsypnC4keIUh/eNMAG8WSW3LL9ryO9
         8XE3UFgzXQ4wkzv5hyc2SC3ZO3U/707eM7q860JvFg1GpSV+UQQEZLyKvRnP96dCWA68
         5Tw6uUwy6sW8bqcwGizH0D4IzIzNNdzYDpALybKolhL3O50YG64bPoUAph3veXTUzIKm
         w6gA==
X-Forwarded-Encrypted: i=1; AJvYcCUnKw0dFdCqK1P+1YSNwiUf93FnVhMbwQeqsBZ2a+loqz8MP5J5eaIR10awtkmPZIXbK7LrCJfqk4o5@vger.kernel.org, AJvYcCXc2S+bFVTsT6tsFzlzgi6gZl3qx5n8hR5zRg/FjalndKlDpXayls89P20IIEE92BD/S5CK6LXfkXoj@vger.kernel.org, AJvYcCXxTkFygY5201ZmFJzLnVa4MggCyH59I9YoZFUFr8RMcvlCFpt+1JVtPV2o21TX2cJm1zDxYqidku1EWaoHo2pGlfU=@vger.kernel.org, AJvYcCXz3V+J7swhFFxuLNk+4Cr94XoACSDtmbL3h+DLEvqroS1XbDFuLag0TPl1+yVZctrYNVLRCvKLf+LcOT8g@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+CR+vHWiWy1sRmIuH5u0IwGUa8LBv0KbiJxY5NA0Wy5AhJvEH
	emBOfSEIjD+ua3k3k8ioI+ShdzfaApPTZXg/iGJdqlRqMeZJpTeWwEEg
X-Gm-Gg: ASbGnctJ91M5NJO3hpdd/6plvb/p8HzRsfDYPIdJ3dDxOZSU2hJtdQpPlfg28byFCbd
	7gDYhubqoE3z5/vRnfEZ5Mo6uIUWfzfxACBUGUM1M54K5OhHcabXtdU/ejXeVnAFUCOCbdHYaTY
	wFomwIXuOCmp19WPvCEM7fGt6cIilyM/eYN14aK8eKbMVzG0wWnYp5OnJgX28BLFu78kFKIFfVz
	OXQYvCJw/1c0cyFSv5jy3vd+gALcBFfqZdwcab2kV5AM5RqNxKyGfQclJQ4afDKVoV3krb275o9
	3omu8EHUfuIg7e2U5KSoYjExyYOl3kALeixsUKFBsaMEgRvHckqdhPptDKL3HO0cBdPQZ2nzXBR
	NoQHqNT+JoQVjh1lwPUiGy2rHbumyG6ZqgVgHUQRlkpw5Sx19UFI0DMjumFHGgrk/S4iq9rYoJY
	ZcfuTGguw=
X-Google-Smtp-Source: AGHT+IEw4hxQDFyvDQPc/gmD3jB62NlzYomDEp60SWewFt3TQhW13eTkug0c+psbKhxHBuIBH7DGBg==
X-Received: by 2002:a05:6000:2003:b0:3b7:8718:f36 with SMTP id ffacd0b85a97d-3b78718165cmr4281120f8f.30.1753733679006;
        Mon, 28 Jul 2025 13:14:39 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78889682bsm4317760f8f.77.2025.07.28.13.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:14:38 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 0/6] Add support for DU/DSI clocks and DSI driver support for the Renesas RZ/V2H(P) SoC
Date: Mon, 28 Jul 2025 21:14:29 +0100
Message-ID: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
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
  drm: renesas: rz-du: mipi_dsi: Add support for LPCLK clock handling
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

 .../bindings/display/bridge/renesas,dsi.yaml  | 120 ++++--
 drivers/clk/renesas/r9a09g057-cpg.c           |  62 +++
 drivers/clk/renesas/rzv2h-cpg.c               | 309 +++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h               |  29 +-
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 350 ++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
 include/linux/clk/renesas-rzv2h-cpg-pll.h     | 395 ++++++++++++++++++
 7 files changed, 1257 insertions(+), 42 deletions(-)
 create mode 100644 include/linux/clk/renesas-rzv2h-cpg-pll.h

-- 
2.50.1


