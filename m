Return-Path: <linux-renesas-soc+bounces-16543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6575EAA55E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 22:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 365601B644C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 20:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489A02D2684;
	Wed, 30 Apr 2025 20:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lspd+pXG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8F42D1133;
	Wed, 30 Apr 2025 20:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045692; cv=none; b=nyj53SabLyZ2EwhglwjQnejl+6hO2lC97urFqjr8vlCVcI6hTxcbZ+yd7mI6B1JWITSa4KcwiKWjGQvdIcQfIan6teSqvauENM3StXUga92ks/zs2doW+ZStaLekoxmKHZWaOp61k/E0zZ1iJ14Ug/pYgZ5zQZ1Jw/sNgmSe/DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045692; c=relaxed/simple;
	bh=o6o3O2k8DhnwSGiYLtIeL/AJt4wX/kh2NdA6Zdz7nio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sPDJc1MXKuU5yX1JWiYtKtTbLlsFCDm+8pp7fWTAqBeM+EJiIR6g+NEfFRhVsonyBLianWMxtfIxg1R8PyGBr7ZZwBOky04RgG2+nL1rjMFqy+COIYlYK0Zl9FrvwxdL3HHjzTo5k+w59vx1lHhb88lMDrsODebAqD8WqU981r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lspd+pXG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3995ff6b066so104222f8f.3;
        Wed, 30 Apr 2025 13:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746045688; x=1746650488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdHVlv+Wt0T+RNvnXR/CEU/ln6WGQvZ6QYYazSH6yMM=;
        b=lspd+pXG57f3srtMTvHVtZMR3wINiq7UH2rpVmVJS6WL2a38hVs1Idtpk8YqTjnA6P
         uMjW+hHZonsstQybFyx95qoVklSdOTfQvdJzmBK9a5+SDMP9hqonj2ri+zuz1pD/GHdK
         DUj8R6pwTbIe4vujcrw+cYKzo2XHpAivYTm9rM4x6TvOV0igrfKJpznSJFNj+Bdw6Zh5
         q1EfBoNLyFlZAGCIzqP+JVwc7UoEdK6Jx2Ou8rlt1qrLbWRtxGOO1v5aeTM/5R8TuSq1
         XqtWjAVzLrvDOFFwiwiaEaEYw96+d5WFO8Q4A9uHEA0owfTbKdWt5ETUgtsAuyTiWy4/
         aFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045688; x=1746650488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdHVlv+Wt0T+RNvnXR/CEU/ln6WGQvZ6QYYazSH6yMM=;
        b=jrDIeoClW3lDlupc4vrXm7nGpB2kAWA6fddFD0iwVCbJCDrk/kzVrqelEKq7fAjzmC
         0XBO8k/pCR8iaYZCe8DJOkF0YLofG5TZ4nVhQqGgv39Q8cYG+wl1zrlSwdqvrz3lwN7M
         8cwFGt+NDT47LpdsjfUeIWDFcme3wcTKzO/igf5N1A405vdteYEMn9WyGFKeuC6ZtBvB
         heUwEcBfECcpvnkyZdL2967pnzylGm4xXCKUxPKz/loc3IfgiLhiICQKsD9ozwr1VAiJ
         qwuo+gtzvNsRvLbilzDnL7xTuZu+LynV0HCnhIWs5tu3OxSKuudQ0xgwu0JK0n4Iy2C9
         TJDw==
X-Forwarded-Encrypted: i=1; AJvYcCUAFTEJMup9qvnDA7tymJxeJ+h+kpwdb0xdZBp20Ipq3zq1sIYCpuZZBz6V8v4fpZnHa0MYRr0fD1EY@vger.kernel.org, AJvYcCUDBoAPe5kFjEPeJKg6spJMLzVBHPFmBZOuF9Kxx1iyvjGglJh1J6ef8JetRWOcmK9gSOQtYh0zGBzy@vger.kernel.org, AJvYcCUaic7oOoCIpTN1KIHICwvCjPv1nkSG2ZbQVV43q8KrzYXY90PFb4cZeeS//8Den+7FgSXL1T+tUGXSkbyt@vger.kernel.org, AJvYcCV60UJsJu3ganN/hw1VTIhW7LEP7dwaUvi1jy5QCwc+6T2agtQ3Dxp5zOZ8PI9cMLC72+uOVtU4XooR3x6O2ecj3FM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtbVMLwN9Sb0b8UhBmQjY9KE6PWBgfMgAskidFE+5yvE/EhCJA
	0uqqddsFqHgIgEpg+Khogjc5vvLTQMFTfjtwWNC5XHEBJx2zVLIv
X-Gm-Gg: ASbGncvCH+oh7QmnTtk4h3/oBQx8DtCF29pZNpfoAikcji7z8Hv6UyBkV8GsyYVCUbt
	agf84A3nrqxgx5yYdAcYlhSBSZrzhxdppLaoXGS3Uco+GfBH6uq6UF2zCwbFqSPfnBCMRLusLA9
	8keLd5MpTkq5tp3SCG2Bo3DzKPkWPw8Md84Pr8jClu11cqA9yDvesg/MLH95+fs+eTn6lQg46W3
	JZpRE+Mq1uRPdihzovx3iW0nz0+Z9n0WldT4+xHPfcG18N0XelHmp6eOFffK14aIUbIj0lpkP0g
	wFJC3iMr9ZI4Nmr0i1N9TZaf/5HUJ61KvoCX/adIuM71g9lyBNgf1HXNHpPsxI/5ZPQRL0SJ+1E
	EAb0OcmUHhA==
X-Google-Smtp-Source: AGHT+IGrGVz3l7nxhUwn5J4c4U2Mfe8x4kHiO67bslT+JuNjwQKln1+3tyq6cjIwttJYt9+I2uPPzg==
X-Received: by 2002:a5d:64c8:0:b0:38d:e401:fd61 with SMTP id ffacd0b85a97d-3a09307d07amr344752f8f.49.1746045688423;
        Wed, 30 Apr 2025 13:41:28 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:41:27 -0700 (PDT)
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
Subject: [PATCH v4 09/15] drm: renesas: rz-du: mipi_dsi: Add OF data support
Date: Wed, 30 Apr 2025 21:41:06 +0100
Message-ID: <20250430204112.342123-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
v3->v4:
- No changes

v2->v3:
- Dropped !dsi->info check in rzg2l_mipi_dsi_probe() as it is not needed.

v1->v2:
- Added DPHY_RST as feature flag
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 65 ++++++++++++++-----
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  2 -
 2 files changed, 48 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 911c955a3a76..ed259627f5e8 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -28,10 +28,26 @@
 
 #include "rzg2l_mipi_dsi_regs.h"
 
+#define RZ_MIPI_DSI_FEATURE_DPHY_RST	BIT(0)
+
+struct rzg2l_mipi_dsi;
+
+struct rzg2l_mipi_dsi_hw_info {
+	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
+	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
+	u32 phy_reg_offset;
+	u32 link_reg_offset;
+	unsigned long max_dclk;
+	unsigned long min_dclk;
+	u8 features;
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
@@ -164,22 +180,22 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 
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
@@ -291,7 +307,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	vclk_rate = clk_get_rate(dsi->vclk);
 	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
 
-	ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
+	ret = dsi->info->dphy_init(dsi, hsfreq);
 	if (ret < 0)
 		goto err_phy;
 
@@ -334,7 +350,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	return 0;
 
 err_phy:
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 
 	return ret;
@@ -342,7 +358,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 
 static void rzg2l_mipi_dsi_stop(struct rzg2l_mipi_dsi *dsi)
 {
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 }
 
@@ -584,10 +600,12 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
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
@@ -713,6 +731,8 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dsi);
 	dsi->dev = &pdev->dev;
 
+	dsi->info = of_device_get_match_data(&pdev->dev);
+
 	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
 	if (ret < 0)
 		return dev_err_probe(dsi->dev, ret,
@@ -728,10 +748,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
-	dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
-	if (IS_ERR(dsi->rstc))
-		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
-				     "failed to get rst\n");
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_DPHY_RST) {
+		dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
+		if (IS_ERR(dsi->rstc))
+			return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
+					     "failed to get rst\n");
+	}
 
 	dsi->arstc = devm_reset_control_get_exclusive(dsi->dev, "arst");
 	if (IS_ERR(dsi->arstc))
@@ -756,13 +778,13 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
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
@@ -779,7 +801,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	return 0;
 
 err_phy:
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 err_pm_disable:
 	pm_runtime_disable(dsi->dev);
@@ -794,8 +816,17 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
+	.dphy_init = rzg2l_mipi_dsi_dphy_init,
+	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.link_reg_offset = 0x10000,
+	.max_dclk = 148500,
+	.min_dclk = 5803,
+	.features = RZ_MIPI_DSI_FEATURE_DPHY_RST,
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


