Return-Path: <linux-renesas-soc+bounces-10953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D90DE9E5789
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 14:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E115B163CA3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 13:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C73212B33;
	Thu,  5 Dec 2024 13:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tR/pFGfW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6FAE56C;
	Thu,  5 Dec 2024 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733406332; cv=none; b=onqvUOmDRoHK50wns8+x8RSxSCGAnSO72noIspIc/9NXEqCuLVn/HKc42DCda1eAsh7uagZx9RUYqv4g8gfhAsUzj3DLI8TTnaGKNm8BKGPq6cej0HHzV6cEe4Zu5NOgqwMMxMErEM6c5wGBd/Ieer15mXBhW2cFCkEokYU64ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733406332; c=relaxed/simple;
	bh=KlExZAtg0Kis5bLL/z3uSjKTU7Vnw5SzSNzHDs3ef7g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oWNnasKTSWH/1lq47HA9NpXO989d1/AIDO06e3gKSalEi17WGWpErOTzWspv7BNAI1EQI6jIx8E8QQJzuPdm7OxT8oSGz8G0Y67+Mt/C9WxxBHUxVsF4h9HAaQdxIoWCH1juZc/Ifgq6P6yDOelwRf6k4Jo4O6h/YGH9lry2+mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tR/pFGfW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8CD83E;
	Thu,  5 Dec 2024 14:44:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733406298;
	bh=KlExZAtg0Kis5bLL/z3uSjKTU7Vnw5SzSNzHDs3ef7g=;
	h=From:Subject:Date:To:Cc:From;
	b=tR/pFGfW732svcGgNMRqq7iJxjOVpe1MlH1agJkBZil47fs/n9YG+WIYxfCmIT2wi
	 uaieqGoK04awZ3tkvt2U+SrYMJhSlOaRy61KUWf9CY3qjskbTwKBU/+sEyNTuna0Kw
	 z70800sORk8bMIyshIHwWCp1FmWafU3OSmluX+qo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 00/10] drm: Add DSI/DP support for Renesas r8a779h0 V4M
 and grey-hawk board
Date: Thu, 05 Dec 2024 15:44:55 +0200
Message-Id: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFiuUWcC/1XMQQ6CMBCF4auQWTumLRLBFfcwLMZ2gFlIzdQQD
 endrbhy+b/kfRskVuEEl2oD5VWSxKWEO1TgZ1omRgmlwRl3ssa0qJ4UpxlDEuy8sWMTmMm3UB4
 P5VFeu3YdSs+SnlHfO77a7/pznKn/nNWiwXPdElvqmuCol8CU4nKLpOHo4x2GnPMHtcTBX60AA
 AA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2246;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=KlExZAtg0Kis5bLL/z3uSjKTU7Vnw5SzSNzHDs3ef7g=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUa5uOpxV2VVU3bb8dbMufSnS3cON3Mn9QI99q
 KQ7DMImdiiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1GubgAKCRD6PaqMvJYe
 9f9vD/4zr15OyDkgh0dJJzfSs/l3ztcF2gGAXihxLanqZczBzhNkhyeLexswCj11yvzXCdrMVVt
 01iVi5M2WUyeiITUBCTSGUdHAtuibbpI7NuLzjp7k9QQaJg/qIBDbM/6tFQEG2JMvgcQ3QMvrj+
 RoUcA8Qa4G6/5/lrk+q3pXWTaW60/8RxJm9kiJfR5gFaoEh41bO2u9JPQwjlWh066RiHNqXbCWi
 J17x5ZrLvFcf1GPa91aIH5IpO169LKtGrTTreAYNKQ3KkIgtsaaqp0kbNAJSCNyKIADy1khxVTJ
 49EAVgCVVPkOnEq2VK1MT7cPJd0ZG20IcnvPrYrmxvkHJZZqxciJyBmZt/BrFOyuF1cdoY6LiGS
 UCvw4y6q64uJqu091JMpYGWGTy77rZRep3AkuyRIsyXwVk+5MISKZUENa0ZNOi+9rbjgIlDX5q0
 spzVaReL9qTjFPwXCNeoXEEJa3xskla4g6qTvTafZQRUMQdWxAQzPY33tgwGT/y8YmGULNsruI9
 ocIB2wfQ6pcJh7u/tDkCpR0ICYilGKF0YNSmGhLUZhO7Db7gTo72WbWLlWnASM2Fsh0MYDeELDw
 08x5xug0VA1RTWxGJJX8SmADZnQCG+ox62JBe5+apcbghNLNxb3bm8h01vgIPD5+YJ6U+7yF2FH
 +ME4xxYFKdH7J+Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add everything needed to support the DSI output on Renesas r8a779h0
(V4M) SoC, and the DP output (via sn65dsi86 DSI to DP bridge) on the
Renesas grey-hawk board.

Overall the DSI and the board design is almost identical to Renesas
r8a779g0 and white-hawk board.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Changes in v2:
- Add the DT binding with a new conditional block, so that we can set
  only the port@0 as required
- Drop port@1 from r8a779h0.dtsi (there's no port@1)
- Add a new patch to write DPTSR only if num_crtcs > 1
- Drop RCAR_DU_FEATURE_NO_DPTSR (not needed anymore)
- Add Cc: stable to the fix, and move it as first patch
- Added the tags from reviews
- Link to v1: https://lore.kernel.org/r/20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com

---
Tomi Valkeinen (10):
      drm/rcar-du: dsi: Fix PHY lock bit check
      drm/rcar-du: Write DPTSR only if there are more than one crtc
      dt-bindings: display: bridge: renesas,dsi-csi2-tx: Add r8a779h0
      dt-bindings: display: renesas,du: Add r8a779h0
      clk: renesas: r8a779h0: Add display clocks
      drm/rcar-du: dsi: Add r8a779h0 support
      drm/rcar-du: Add support for r8a779h0
      arm64: dts: renesas: gray-hawk-single: Fix indentation
      arm64: dts: renesas: r8a779h0: Add display support
      arm64: dts: renesas: gray-hawk-single: Add DisplayPort support

 .../display/bridge/renesas,dsi-csi2-tx.yaml        |   1 +
 .../devicetree/bindings/display/renesas,du.yaml    |  52 ++++++++-
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 119 ++++++++++++++++++---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |  73 +++++++++++++
 drivers/clk/renesas/r8a779h0-cpg-mssr.c            |   4 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      |  18 ++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c    |  16 +--
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |   4 +-
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   |   1 -
 9 files changed, 264 insertions(+), 24 deletions(-)
---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20241008-rcar-gh-dsi-9c01f5deeac8

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


