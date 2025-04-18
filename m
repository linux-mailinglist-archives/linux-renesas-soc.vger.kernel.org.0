Return-Path: <linux-renesas-soc+bounces-16157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A342A93DA4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 20:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8625467893
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 18:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958FD22C325;
	Fri, 18 Apr 2025 18:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dn9aHwf3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A430D139579;
	Fri, 18 Apr 2025 18:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002029; cv=none; b=nxdvgiVjKvcocPWwoB8KvOyMUXhYMmigYR0GFnFRN1Or0ukm07piaipui1lBQRT9fkKEnXO5Q/DI3a9MlFR/7dh5QabadRaFNJKwWdY6h3TOS1rwMHma26oqkBr/u82d8fgQlmVEQnyYBQnx8eGyK/gxm4ULai3l6otFc1CRU/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002029; c=relaxed/simple;
	bh=UCzndLREGOJ1HN8JdvQNSnOAtJ668tQZphVwGg/0G1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O+vl7zQcIVYJD9GUcrkO0ylMaz8tv6IJbzwh46aSsZNkEDdiGMK1C46jhQejxyRGd0+xQR/KC0fagc7NVQeR5cKCC/ZzBuhJ3kd/RtDkzExuRtSH6Qnq+fhn5/WaANOWQXM5VPM/gEM0hGN1iIzH6nqYANYYmiA+m2WXi7oD7D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dn9aHwf3; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso1239927f8f.2;
        Fri, 18 Apr 2025 11:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745002026; x=1745606826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xf3q8YDPAJeeyFaU7k2MToDpz8/U6cAu9PboxW53bls=;
        b=Dn9aHwf3dxyI8JMGzzUIWjUw057gibzyWTcz7MaEOu86H7eDT5FUTtNmF4lcEQCJC8
         F+47vCLht1eaT88uf4R6+fHzNErbaARUw+wb5xsaU1hQ49YIJx8YU3mIzMNWl0F55aEv
         LJyLdrWqlowpVjO0Op8r+eTfzhS6ID4l+1R7obdyzRLYXDlMP7Sp/ckxHUdJLqseucA6
         ndw4/ItQggMcpakAnQwYMYdo5xU6rqC3JxdP/vDowSQ8I1OP28/JsEQ02TjUNjn+dcdb
         YkJVuti58CH1C6qva2nNkifKusVmpYEajdT8LqugqflpbN6tWFGEUNnS0l0YDk3ODan4
         3S4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745002026; x=1745606826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xf3q8YDPAJeeyFaU7k2MToDpz8/U6cAu9PboxW53bls=;
        b=vv12aeotgwY0tvLOzCNDsC245jv1iG3f6OiU1Q5mvr9KqughpoKNEzzXr90xPTYDDW
         38MxCVLq9ddaSudYbelaQjPmT1XiVZtGRIrbr31McvSOlC6jvTm2+847fleOKDD8CmFs
         wFVqMI6yqP040NG5x9QX2HqUv3wFJlKZOZUSgky1DToBNlqzhiQrWF5cws3nUUZnIy8n
         kURm/j52+i8hFRhMqv0x9lSHefhmkjv+5y8etI53BWUffmvUmIOqvu8PE4At2UGBJzqj
         GjmVaLJngv51IJhniL6l7enNEfqnGWA0hy/VnQPEAozeccxeVOb0nEeP03SoLVDVxytL
         ZoCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9Fw1pt0aVJfqARFMtpV8znf+aiN41/nbdekjifyhVIfhxjFE26/g0i3jDpyI9pWHfqUGJx89BKdqb@vger.kernel.org, AJvYcCVYHYyl/GTPJfxXYQM7qS4tR8Le9B7Oq3ADKlzRkUDf1IvxtP1UxtsE5aK7WMkNKydUM7GOJmkOdF12@vger.kernel.org, AJvYcCWBbb/A+XZqn/qsiOTUyKGcZGHuhQEbG1da4gGfIb4Ny7aLAAc+GMceu3ZWZxRLBnDNzkSQSg6mTgq4K1NFLLR9Dik=@vger.kernel.org, AJvYcCWjicdliX8TfF0d9qKuJbW7Qwijhl4zK+ziuOAgs6DAJ5lEZ7dSREUfrGgDGAIq7jHuY9fNh1Atxub+K06N@vger.kernel.org
X-Gm-Message-State: AOJu0YzgN3k6qC64YYUBovaHPEmPK2wTzZyskcZQcxMHP85+36UhayVE
	73Y5RH66QaINg8+nwkJqhcPMx8SPTWfB+8vPotfs0qEHIEBfpblH
X-Gm-Gg: ASbGncsyCDpjiraCnpVmnDydPcnT+LAG/YwLg9S1GmPe2T4Dm25Og1YLtZ1Y1cqE+Wj
	sCnD1rhmm/eLbqruzmJgcf8S1i4fhazec/tCc08IMWOyzngNcOS2F+DqyoKpraK8gO7sRm31vg8
	wieOs88LqmKWtxlHz1zJPIaqCgYGBdIwGo92a1kdG0YoEl6Wf1Xi/ENNumluYEwTnCVU09bgLHh
	GeKoUyLtwfqsPlvjGANu6UeFwEHTKR+Y8ojdZb/lDBuKj/s/TCg6/iM3OMQsQuwgbYXqdOfOaRs
	W8RC3fSiyDh3RjTqD9H/wQT4U/2nV/kqn7taZ/aPsY1UuzM7EC/dk4t5FnixzhnDMA0AA/+NP3o
	F
X-Google-Smtp-Source: AGHT+IHS8vLHpVzBqvxGhBw2n+0p0yJYim/zKB8jUDojxZGyaa9qGnb0KdwqJy/aIiAhn82k2Kx5sQ==
X-Received: by 2002:a5d:584b:0:b0:391:412b:e23f with SMTP id ffacd0b85a97d-39efba3c819mr2746452f8f.15.1745002025495;
        Fri, 18 Apr 2025 11:47:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:47:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
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
Subject: [PATCH v3 00/15] Add support for DU and DSI on the Renesas RZ/V2H(P) SoC
Date: Fri, 18 Apr 2025 19:46:43 +0100
Message-ID: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
- Added a gaurd in renesas-rzv2h-dsi.h header
- Reverted CSDIV0_DIVCTL2() to use DDIV_PACK()
- Renamed plleth_lpclk_div4 -> cdiv4_plleth_lpclk
- Renamed plleth_lpclk -> plleth_lpclk_gear
- Collected reviewed tag from Krzysztof for patch 3/15
- Dropped !dsi->info check in rzg2l_mipi_dsi_probe() as it
  is not needed.
- Simplifed V2H DSI timings array to save space
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


