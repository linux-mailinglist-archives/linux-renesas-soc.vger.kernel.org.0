Return-Path: <linux-renesas-soc+bounces-16996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE85BAB435E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78C144A3893
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D070B29C336;
	Mon, 12 May 2025 18:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHAJleQj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FB029824A;
	Mon, 12 May 2025 18:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074238; cv=none; b=CyzuW7jOKZLE8ly75G6ZitBqrDayJKq5RhX2JislfJXmjm9bVtSKHdJolKdXx9+M9Kxbg7vxWIZtlejTdQ9VxIOqiY3kkrUDYf0hvwl3Q7WDF45sZMcxrVZg3kl5p7pYxSpSObjq3PWqVkKiUxgT4SAu1hq8Dorib2SvHaHXcPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074238; c=relaxed/simple;
	bh=E0G9yZ7FEhKXUI4bE5GYDIx4aaW5kkgyNN6CB5URc1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RHrMCi6JnhRm61OjEdZafi00mX7bhFPtrjy+aPzAFT9dgxba5cDU4QF5v1GIxokxTpfc8rLbXyAqt5rTh/sbLua3wM33o8owyIhtHF2rWiNuJz2/z49mpsJWxmizQsDP+sPeHPIkvoCOxLNalNzoezjckNLbnr8MCQdIYfxGIHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHAJleQj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a0b9303998so2445486f8f.0;
        Mon, 12 May 2025 11:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747074235; x=1747679035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amLZpBJMN7X2H2vlhMlGUhKnumpCz2RuD1ueFv4+O2g=;
        b=SHAJleQjD81D1WMA3Uks5ukWj/jUkhQnNyXyLg47dvLWyriCs5GMEqCR4oc/pTwQUR
         1HUzLj3dE5/P4ZrjNQJQCiV18cHZ8uL+isSCD1qNYw9cF3s0W7N0m1afI0fOgTAJCT7S
         Zo+MkWzCFM63UUt3+ialbmgy54MO9zC+Uzz5AVW/Lxo6cYX3gJh415Wim1NyTeXsEMiJ
         axodfi8Ia3+LziruoorlWk5ZTV+fwXLvROOH7KXXdSytMjRYWgI3fgOdt3b2OZv0Oogk
         aTyZD94FtxK8b//3RKiRZtvpAgq5RjsDGygjF33Og1iv2agFCa1/hoGa2UvaoGs8/e4H
         4Jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074235; x=1747679035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amLZpBJMN7X2H2vlhMlGUhKnumpCz2RuD1ueFv4+O2g=;
        b=aqORdrYkVGSo8oxOQzDzqc0Q06y8yrPM18B6pUvO2kAzkGuiEI3mXU7YCNPHpbdEWe
         N3mNhXwx3g/M/MpB/2MTuyIXPQP64pavHfmufuR2eBoJdU7Tb4r3FKFVfYUca96gmEYD
         0CiImcxs+s4wyLtrPoMkdr6ZbBnubkGYT6JwzCBu5y0jtT4N4SI2cZ9hQCX4RpPdulIw
         Bw0FYhpfq4VYl5E5bXGAYBf3cc+kCfteGkM83lCOHtyS12tWeiJdnVEG+7xSqyHVVpjs
         X5o5yTgHa+9jamxT5MRmlQwXv6itwNB96cO1K4naaf3OhLlsjNe44K67WxSaI2QbZqk5
         oFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA3bJG+qPXeafSFTcBCi41VhE+s4PtJJ2nUek2rkrsQcwP8LazVLalrRh480X429zvIKlJhMQOpJpIG8AZ@vger.kernel.org, AJvYcCWbxol6Z+nleaJBDXDiENU0BbPWkWEWdlRCfQuzPjvG8/b1CXPJwa0ElI6FNGfaU5/8y7OalFfkx3vn@vger.kernel.org
X-Gm-Message-State: AOJu0YxWlf93ZcB9nqw1ZibsSrzNyrV0UrOcpdTbmhNPUuRQsT3chU1l
	A2ws1+6tGcY2nHW3PMWAx7YLWQu2oSYlLnXTOA5OZ7bhUBnVFk/P
X-Gm-Gg: ASbGncvwZLdhdH722QuX9MTS8dzNq6nf/8gnYnCcts4reHK0Qnt7+JHsRXp9YbGS2FO
	/QW6+3sheaZOBSQsYU92CFF8wqFlt7zLlHAikY7EyXuUFxPbSZO2Et3B523KEOPAmrpPsBz792G
	tiJp2zour5DgRyOxGIslKcd+xQo9YaHvvwrNuADmttsNhq6zV7KHirWUByLDJ65vcySYiGHa8gQ
	v7WOzbLKiWic95gqwTGIufMOyzhJAO8jpkgINmD06eXFleIB4c6nUR0ZH4Z0EXBkFDxvWWB8mPz
	WswwpqHSLh+1G9u5QKzCihpxIAGReIELShhd0Q6ZCCxFt5FLt/hgQvWgARuGxbo/xo04PU0gEps
	+xvuL0WdfL5M=
X-Google-Smtp-Source: AGHT+IGifdJP7ug23PtYNjvhG2POc/iiuYgvwDeqquz7Lfoza7aSCRMXPY0dc5gyvUImWBTklaYphw==
X-Received: by 2002:a5d:5010:0:b0:3a0:aeba:47d8 with SMTP id ffacd0b85a97d-3a340d28f88mr349942f8f.29.1747074234771;
        Mon, 12 May 2025 11:23:54 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:23:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 06/12] drm: renesas: rz-du: mipi_dsi: Add OF data support
Date: Mon, 12 May 2025 19:23:24 +0100
Message-ID: <20250512182330.238259-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In preparation for adding support for the Renesas RZ/V2H(P) SoC, this patch
introduces a mechanism to pass SoC-specific information via OF data in the
DSI driver. This enables the driver to adapt dynamically to various
SoC-specific requirements without hardcoding configurations.

The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to the one
on the RZ/G2L SoC. While the LINK registers are shared between the two
SoCs, the D-PHY registers differ. Also the VCLK range differs on both these
SoCs. To accommodate these differences `struct rzg2l_mipi_dsi_hw_info` is
introduced and as now passed as OF data.

These changes lay the groundwork for the upcoming RZ/V2H(P) SoC support by
allowing SoC-specific data to be passed through OF.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
- Dropped RZ_MIPI_DSI_FEATURE_DPHY_RST feature flag
- Added Reviewed tag from Biju

v3->v4:
- No changes

v2->v3:
- Dropped !dsi->info check in rzg2l_mipi_dsi_probe() as it is not needed.

v1->v2:
- Added DPHY_RST as feature flag
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 51 ++++++++++++++-----
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  2 -
 2 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 3f6988303e63..00c2bc6e9d6c 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -28,10 +28,23 @@
 
 #include "rzg2l_mipi_dsi_regs.h"
 
+struct rzg2l_mipi_dsi;
+
+struct rzg2l_mipi_dsi_hw_info {
+	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
+	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
+	u32 phy_reg_offset;
+	u32 link_reg_offset;
+	unsigned long max_dclk;
+	unsigned long min_dclk;
+};
+
 struct rzg2l_mipi_dsi {
 	struct device *dev;
 	void __iomem *mmio;
 
+	const struct rzg2l_mipi_dsi_hw_info *info;
+
 	struct reset_control *rstc;
 	struct reset_control *arstc;
 	struct reset_control *prstc;
@@ -164,22 +177,22 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 
 static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 data)
 {
-	iowrite32(data, dsi->mmio + reg);
+	iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
 }
 
 static void rzg2l_mipi_dsi_link_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 data)
 {
-	iowrite32(data, dsi->mmio + LINK_REG_OFFSET + reg);
+	iowrite32(data, dsi->mmio + dsi->info->link_reg_offset + reg);
 }
 
 static u32 rzg2l_mipi_dsi_phy_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
 {
-	return ioread32(dsi->mmio + reg);
+	return ioread32(dsi->mmio + dsi->info->phy_reg_offset + reg);
 }
 
 static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
 {
-	return ioread32(dsi->mmio + LINK_REG_OFFSET + reg);
+	return ioread32(dsi->mmio + dsi->info->link_reg_offset + reg);
 }
 
 /* -----------------------------------------------------------------------------
@@ -294,7 +307,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 			 mode->clock * MILLI, vclk_rate);
 	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
 
-	ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
+	ret = dsi->info->dphy_init(dsi, hsfreq);
 	if (ret < 0)
 		goto err_phy;
 
@@ -337,7 +350,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	return 0;
 
 err_phy:
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 
 	return ret;
@@ -345,7 +358,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 
 static void rzg2l_mipi_dsi_stop(struct rzg2l_mipi_dsi *dsi)
 {
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 }
 
@@ -587,10 +600,12 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 				 const struct drm_display_info *info,
 				 const struct drm_display_mode *mode)
 {
-	if (mode->clock > 148500)
+	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
+
+	if (mode->clock > dsi->info->max_dclk)
 		return MODE_CLOCK_HIGH;
 
-	if (mode->clock < 5803)
+	if (mode->clock < dsi->info->min_dclk)
 		return MODE_CLOCK_LOW;
 
 	return MODE_OK;
@@ -716,6 +731,8 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dsi);
 	dsi->dev = &pdev->dev;
 
+	dsi->info = of_device_get_match_data(&pdev->dev);
+
 	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
 	if (ret < 0)
 		return dev_err_probe(dsi->dev, ret,
@@ -759,13 +776,13 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
+	ret = dsi->info->dphy_init(dsi, 80000000);
 	if (ret < 0)
 		goto err_phy;
 
 	txsetr = rzg2l_mipi_dsi_link_read(dsi, TXSETR);
 	dsi->num_data_lanes = min(((txsetr >> 16) & 3) + 1, num_data_lanes);
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 
 	/* Initialize the DRM bridge. */
@@ -782,7 +799,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	return 0;
 
 err_phy:
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 err_pm_disable:
 	pm_runtime_disable(dsi->dev);
@@ -797,8 +814,16 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
+	.dphy_init = rzg2l_mipi_dsi_dphy_init,
+	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.link_reg_offset = 0x10000,
+	.max_dclk = 148500,
+	.min_dclk = 5803,
+};
+
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
-	{ .compatible = "renesas,rzg2l-mipi-dsi" },
+	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 1dbc16ec64a4..16efe4dc59f4 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -41,8 +41,6 @@
 #define DSIDPHYTIM3_THS_ZERO(x)		((x) << 0)
 
 /* --------------------------------------------------------*/
-/* Link Registers */
-#define LINK_REG_OFFSET			0x10000
 
 /* Link Status Register */
 #define LINKSR				0x10
-- 
2.49.0


