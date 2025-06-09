Return-Path: <linux-renesas-soc+bounces-17998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1D4AD2A12
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 00:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89DC81887714
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B933B225412;
	Mon,  9 Jun 2025 22:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9WrNzjB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56FC2253F8;
	Mon,  9 Jun 2025 22:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509809; cv=none; b=J8C8EjCK9kaSX2WFjt2JevAKJyD/4i7bHvLuihBVYA3qLV2vg8kNqSK2h/uRME+tMpzYiKfWUt/6wsKYa/hYsH9bWxrtOqUTie1BFmG1NmgCEbHppycKPco0USQCVdpTgTDeub4O4YXz+OdoZqRZA9XzzkYPj0XRMBrd4js+J38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509809; c=relaxed/simple;
	bh=BiC/S8e6d+YwQP6yo8wySn738EE3DodC/sCtScKa7Yo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lDLGjWq7ar5FB7zxcFXBKwYrYFPnBEeA4Q3vwoY0akS49Rqf6ckVkRd2B4zoAfciKLq2+9Twiv2mRNBCUrqoWfth//VZS/WJFuQH5fgB15UxkMlfRoHgnlEFO0qOeLhOY3RERoq+GZHnJZpdN3AtjIzv9UiNpwZ0xzqcaPQlNlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9WrNzjB; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a52874d593so4664571f8f.0;
        Mon, 09 Jun 2025 15:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749509806; x=1750114606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2tg4REnvOCyUc7MwuvLcq48UH8TgGrD41gWMRdQ3RA=;
        b=P9WrNzjBksKVwYTcbJ8gEUBQlagr6UOhPETGnlxJaY386tueVOdo+Vh7DeeWoUCpE8
         dvW8Z4lTuh1wel5bsX8+CSM0ol0n3fYfT6Bj+nh+uYTkapGLo8vCYOv262x2UH6Qsrd/
         gjVsTt2nAlc3HksaeGyCCxhA7VRN6MHdpKn0PiPQMHUiMuom3MGISlC/tfmJvo3sH+kp
         xXWiWhNqrel/wRHV/NeX9lTxE7DvEIFul/nHvnNaCAviSb5CXWDG4q4iHdu1XDOBS6Ev
         i7pSZX4Jl6T5wHqF4Togch53waZyvABuknWm7O9NpTflwI/fsf9S/dP3MU6vP4nHOps/
         Cozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509806; x=1750114606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2tg4REnvOCyUc7MwuvLcq48UH8TgGrD41gWMRdQ3RA=;
        b=EFZRHllOYnSKmipA5nQv8SDYnJkat4OeKS4NPKPISJx99/F5Nu7DL1Y2nzDQ/4oO+h
         KnT5XSnNAg2d8hMYb3W/9eamiw76Yt8yR2EX3I1OqqR8xoI1HfpsWRmK73u9GdgF7yW4
         t5ywC1Ka7DWaoMGbkEqjV3ck7wWwBmvKfVDpoh7xdZi4F4Qkj4rJDYtOK/k7yEMX1jiu
         cgWO2GOgM5CkD0yahNNiY1O62nLabATGZFZXURd2NEWcDEbsdzAtI+W2uekn94fKNkpl
         FpFLCssFhC6gsHg0BDoPh1gL1QEoWg2RpucwI6V3yRPkD1MogcxC9qHyz8yGNH9bo60w
         Jbmw==
X-Forwarded-Encrypted: i=1; AJvYcCWHy7FekUQz7yeZGaYb08Rkj7NNt1wuPPP8AN2DhdKHq1nwTDsxNMVe0ul2ii+pDPkj+ZO6/4IwloPfOYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH7ZrQG8DgomYVQ0YkZKYHTrCMLI7nZbrCx4JFuBGUZZTaP8dZ
	tO3Y72+tmLsfeqAtmi24xcWqQ4h1CvDfCTuQRxhzpL8IaPRRHRM4323t
X-Gm-Gg: ASbGncvJn8C5yXyAaMPXOUOiCQmoBCAXoaU2l+aLEEfbfyldriEcFKRFCqmDtN9SdD/
	YVxi9ibb7+BlRm0c3sJF4YEizwnp/BlAwj3jvpZkBcfRhLBZGxtiS6pU0hM+f9CQ55UD/NZLMsv
	h2+KqNyhVKGEcOddnhCyokfQ0yN2sG7nk5dR+H1BsMWXDZoY4DeQ56jLGLqvF/GCms9uD1qy2og
	Z08xRu9KSzwl39057triEkyrH1hEsQOgQFwxfVzJXUu5zKZadk0xqsqaYeiacIcS66gXSiavYHD
	+1WXrmjvTFkQBZDcaD5sIq8rgMVL/PkNKobfBpmp6IPagT0993T7ktC/vFx/LaeP7BJO4wcOTU4
	VLcA0TyQHx9rdWaJWDtc=
X-Google-Smtp-Source: AGHT+IFJahUPqFeA1/CIDgdsJOEop2L5elXHggdcexotI4Nd98oxIGFQEFOWFLGL7BQt6JPOSKk2sA==
X-Received: by 2002:a05:6000:40c7:b0:3a0:a0d1:1131 with SMTP id ffacd0b85a97d-3a5318823c7mr12577315f8f.7.1749509805894;
        Mon, 09 Jun 2025 15:56:45 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:56:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 0/9] drm: renesas: rz-du: mipi_dsi: Prepare driver to support RZ/V2H(P) SoC
Date: Mon,  9 Jun 2025 23:56:21 +0100
Message-ID: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series prepares the MIPI DSI driver to support the Renesas
RZ/V2H(P) SoC. These patches were originally part of series [0], but I have
split them into two parts to make them easier to review and merge.

v6->v7:
- Rebased the changes on drm-misc/next
- Dropped DU patches as they are already applied
- Fixed revie comments from Laurent
- Dropped patch 12/12 from v6 "drm: renesas: rz-du: mipi_dsi: Add
  support for LPCLK clock handling" as suggested by Laurent

v5->v6:
- Added reviewed tag from Biju and Laurent
- Updated commit messages
- Dropped parentheses around the calculation
- Added min_dclk above max_dclk in rzg2l_mipi_dsi_hw_info
- Renamed dphy_late_init to dphy_startup_late_init

v4->v5:
- Split up the series
- Added Reviewed-by tag from Biju
- Dropped feature flags for reset and LPCLK
- Patch 07/12 is new.

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

Lad Prabhakar (9):
  drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
  drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
  drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
  drm: renesas: rz-du: mipi_dsi: Add OF data support
  drm: renesas: rz-du: mipi_dsi: Make "rst" reset control optional for
    RZ/V2H(P)
  drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency
    calculations
  drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
  drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for
    RZ/V2H(P)
  drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring
    VCLK and mode validation

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 151 +++++++++++++-----
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |   2 -
 2 files changed, 114 insertions(+), 39 deletions(-)

-- 
2.49.0


