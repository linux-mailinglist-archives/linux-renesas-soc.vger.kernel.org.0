Return-Path: <linux-renesas-soc+bounces-18002-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD493AD2A1D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 00:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 504CF1714F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B0B22ACFB;
	Mon,  9 Jun 2025 22:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhJm09YN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF1022A4D1;
	Mon,  9 Jun 2025 22:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509814; cv=none; b=mMlBNOXwvai4o+SYS1XZtlMs8tTeRsAJ7++Gp3HVgN8X+lfHanRIf7/acVRm0laBa/hspXLwc5fn442h2HBW7FVxmGqfCnNNJ1yM87XAf7SiuMKLe8K6C73uX7XEtjH29K2Oxb18pzCc1ZRggqM4DhPIXQxWyY1wz5JnTzt6lnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509814; c=relaxed/simple;
	bh=8+NIZs5JoCFFTJdYzLhMCg8qAmw91wco5+ib07Bx00I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTOoSsNxP/3aL8bOEqOdiD3cvmnxG0Cq2wLlGo8SxluEmh+0bPk+jVl/vt+ZobZ6DIXtN0HhKl6F4DMD80kD6OVxi9GcgZ4/GDYlek2K2ZyTREQScO1eC02jngkau1ThBk7X8Vei0WNssPiH2qPOuGEfXskgSG8tMArvyaW1/is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhJm09YN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a522224582so2951082f8f.3;
        Mon, 09 Jun 2025 15:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749509811; x=1750114611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1N8ZwCXLYPuIDKUJfDBDkh4IH3GXGxMbLgP9a9nmFT0=;
        b=KhJm09YNlTHUQXqL6fIznRk03U8DYF4v+4zY2R1Kl9f6pplXJ9L1qbdvX4xyFgZwGo
         4tdf7Hd7pineDxsGD1/TSuCUsK+ixpwroTUet7PY0fxaadsEyPzte90eBiuVR4zgBlX/
         /MfXtvdbTfeH2WAbeSBPVKTbyRBQJL5Ak3UW5XtOQ3gCjn7Y7HqwJsIx1eoZLjun/bIl
         Ssmj6CE3tRyKcAqz+SNuaHRo21kubMprV9B72GcRwcnLqvpw95tSaGsDuNhaL/aeiOu0
         7SNTs3grtU8pU44Nu3tzrYh3N8s35R01dFVNCUgtVGnhOPP8bBDMusZvu5N7Aywyhv92
         JQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509811; x=1750114611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1N8ZwCXLYPuIDKUJfDBDkh4IH3GXGxMbLgP9a9nmFT0=;
        b=GN2yEEwdKtZogwWB+PSMUaUqRhNtlWvhrDsk4PYf0jmj9/NAvBoIwhJ+pzPWoUGw5U
         8L73gFanWSPQpxaD6uQVcL231wwJecHAajSv+jXOKpTFU51WoGavmPwlHKgSUE5HbmWP
         ocedwo9iPh9VLikwDkBpjfeKVZMOHaF4YaRocJXll7eSPy+f4Boc7g+hHQ8m1Lex4xLq
         xYAX8a39vx1f/hkNR6Cw5mpP9krk/v5sT0E5RI3ecKrfMELIlZ7e4KPWedMDz6Pv83+g
         JGLH6xqPOaXS/ToKUMq11RXVs1mT3ZV8gmniGO5Px8fX8l86Zaygx8kQ8LQ9O1VDTXxk
         fQ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCULoNIhNoWgLUAJ5mH3Xb72+E2ft0K0jqAzHDSpfM+ODrZIZ+elnePvOdam9K5VEpvVXYMBi07aeWj3rJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEOaq0fqSYA9Pvq3oHoQowU4d7TPIg2bAQvzrmniqLwpK2z9fu
	WKsl8hy+O5xFcpHQmRi8T1Pw0h+letzZDbd067JGhFyDByOEXtjlzOPO
X-Gm-Gg: ASbGnctEOzuN/YhX5bgwBL/w4lpy/AZPDpQXifGzzsd5pkCBsSzQyKgY77/5kczGOaO
	QFTcSGVBDI/CIo3YXwXEnKi6gvTJ5+LKUxQFOpvf+lcMALKkrd1i2WNsDj0HDGiuyoQJNLnKti3
	wrxvOJ7tsta/uWvNeSPYGA7aj8rxq6ool1VtJxqJUQC91dzKT40VU9k3PrkD/kWTIVSRqRFzLYh
	rJZX0hNURVJ9nCHUnxGocMtP54C2dY0PTAlDeUUFyEs1JB7km1zslJ3cmloEWK27mHqhj9ieuXu
	1kzdc0uFk/Pwy4tLJIZcPw6yyJHcmvi44G+L8MaDFrmrCXQEqekM8PuGbNnz+IG21B3S0vGKtfU
	Ivuz809fMU8ST0dQyMig=
X-Google-Smtp-Source: AGHT+IGmYbZe347X9QsV2lLtl48DDy7LyU1rtDFPKvU7qKEb8+0/r7x68rS02oOnJ7Bhau5TPGraEA==
X-Received: by 2002:a5d:584c:0:b0:3a3:648e:1b74 with SMTP id ffacd0b85a97d-3a53188a8admr11524621f8f.6.1749509810650;
        Mon, 09 Jun 2025 15:56:50 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:56:49 -0700 (PDT)
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
Subject: [PATCH v7 4/9] drm: renesas: rz-du: mipi_dsi: Add OF data support
Date: Mon,  9 Jun 2025 23:56:25 +0100
Message-ID: <20250609225630.502888-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

n preparation for adding support for the Renesas RZ/V2H(P) SoC, this patch
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v6->v7:
- No change

v5->v6:
- Added min_dclk above max_dclk in rzg2l_mipi_dsi_hw_info
- Added Reviewed-by tag from Laurent

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
index b08274e5dfcf..85074e0c3cc4 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -34,10 +34,23 @@
 
 #define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
 
+struct rzg2l_mipi_dsi;
+
+struct rzg2l_mipi_dsi_hw_info {
+	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
+	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
+	u32 phy_reg_offset;
+	u32 link_reg_offset;
+	unsigned long min_dclk;
+	unsigned long max_dclk;
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
@@ -174,22 +187,22 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 
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
@@ -305,7 +318,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
 
-	ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
+	ret = dsi->info->dphy_init(dsi, hsfreq);
 	if (ret < 0)
 		goto err_phy;
 
@@ -357,7 +370,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	return 0;
 
 err_phy:
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 
 	return ret;
@@ -365,7 +378,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 
 static void rzg2l_mipi_dsi_stop(struct rzg2l_mipi_dsi *dsi)
 {
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 }
 
@@ -615,10 +628,12 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
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
@@ -905,6 +920,8 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dsi);
 	dsi->dev = &pdev->dev;
 
+	dsi->info = of_device_get_match_data(&pdev->dev);
+
 	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
 	if (ret < 0)
 		return dev_err_probe(dsi->dev, ret,
@@ -948,13 +965,13 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
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
@@ -975,7 +992,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	return 0;
 
 err_phy:
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 err_pm_disable:
 	pm_runtime_disable(dsi->dev);
@@ -992,8 +1009,16 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
+	.dphy_init = rzg2l_mipi_dsi_dphy_init,
+	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.link_reg_offset = 0x10000,
+	.min_dclk = 5803,
+	.max_dclk = 148500,
+};
+
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
-	{ .compatible = "renesas,rzg2l-mipi-dsi" },
+	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 26d8a37ee635..d8082a87d874 100644
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


