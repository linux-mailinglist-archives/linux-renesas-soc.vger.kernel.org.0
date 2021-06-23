Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 721253B126D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 05:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbhFWDuA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 23:50:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57852 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhFWDuA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:50:00 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1064B5FA4;
        Wed, 23 Jun 2021 05:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624420060;
        bh=oGlKCfEDatg3VLX6mP5P56dVPW4Alf+OG2rOdIOkKh0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Sq5oeccxWq8bgkz8+uyi1wNKxxMVjkF70LTUvk/aozn631Q/pwOGPiOfXSBJRy/sn
         IypI3PxV8ioQL5c3xZknRBjN5RH001VjixMmHvXEhGOjE3sKgDXkgbfGyH//vqaNPW
         6UAAFOK/6uxql1KZ4RzCJRvCh57dJX+nwKNZ9uUA=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [RFC PATCH 13/15] drm: rcar-du: dsi: Various style and typo fixes
Date:   Wed, 23 Jun 2021 06:46:54 +0300
Message-Id: <20210623034656.10316-14-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 148 ++++++++++++------------
 1 file changed, 71 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index db31baecde7d..2ac4171e6c6a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -78,27 +78,27 @@ static const u32 phtw2[] = {
 };
 
 static const u32 hsfreqrange_table[][2] = {
-	{80000000,   0x00}, {90000000,   0x10}, {100000000,  0x20},
-	{110000000,  0x30}, {120000000,  0x01}, {130000000,  0x11},
-	{140000000,  0x21}, {150000000,  0x31}, {160000000,  0x02},
-	{170000000,  0x12}, {180000000,  0x22}, {190000000,  0x32},
-	{205000000,  0x03}, {220000000,  0x13}, {235000000,  0x23},
-	{250000000,  0x33}, {275000000,  0x04}, {300000000,  0x14},
-	{325000000,  0x25}, {350000000,  0x35}, {400000000,  0x05},
-	{450000000,  0x16}, {500000000,  0x26}, {550000000,  0x37},
-	{600000000,  0x07}, {650000000,  0x18}, {700000000,  0x28},
-	{750000000,  0x39}, {800000000,  0x09}, {850000000,  0x19},
-	{900000000,  0x29}, {950000000,  0x3a}, {1000000000, 0x0a},
-	{1050000000, 0x1a}, {1100000000, 0x2a}, {1150000000, 0x3b},
-	{1200000000, 0x0b}, {1250000000, 0x1b}, {1300000000, 0x2b},
-	{1350000000, 0x3c}, {1400000000, 0x0c}, {1450000000, 0x1c},
-	{1500000000, 0x2c}, {1550000000, 0x3d}, {1600000000, 0x0d},
-	{1650000000, 0x1d}, {1700000000, 0x2e}, {1750000000, 0x3e},
-	{1800000000, 0x0e}, {1850000000, 0x1e}, {1900000000, 0x2f},
-	{1950000000, 0x3f}, {2000000000, 0x0f}, {2050000000, 0x40},
-	{2100000000, 0x41}, {2150000000, 0x42}, {2200000000, 0x43},
-	{2250000000, 0x44}, {2300000000, 0x45}, {2350000000, 0x46},
-	{2400000000, 0x47}, {2450000000, 0x48}, {2500000000, 0x49},
+	{ 80000000,   0x00 }, { 90000000,   0x10 }, { 100000000,  0x20 },
+	{ 110000000,  0x30 }, { 120000000,  0x01 }, { 130000000,  0x11 },
+	{ 140000000,  0x21 }, { 150000000,  0x31 }, { 160000000,  0x02 },
+	{ 170000000,  0x12 }, { 180000000,  0x22 }, { 190000000,  0x32 },
+	{ 205000000,  0x03 }, { 220000000,  0x13 }, { 235000000,  0x23 },
+	{ 250000000,  0x33 }, { 275000000,  0x04 }, { 300000000,  0x14 },
+	{ 325000000,  0x25 }, { 350000000,  0x35 }, { 400000000,  0x05 },
+	{ 450000000,  0x16 }, { 500000000,  0x26 }, { 550000000,  0x37 },
+	{ 600000000,  0x07 }, { 650000000,  0x18 }, { 700000000,  0x28 },
+	{ 750000000,  0x39 }, { 800000000,  0x09 }, { 850000000,  0x19 },
+	{ 900000000,  0x29 }, { 950000000,  0x3a }, { 1000000000, 0x0a },
+	{ 1050000000, 0x1a }, { 1100000000, 0x2a }, { 1150000000, 0x3b },
+	{ 1200000000, 0x0b }, { 1250000000, 0x1b }, { 1300000000, 0x2b },
+	{ 1350000000, 0x3c }, { 1400000000, 0x0c }, { 1450000000, 0x1c },
+	{ 1500000000, 0x2c }, { 1550000000, 0x3d }, { 1600000000, 0x0d },
+	{ 1650000000, 0x1d }, { 1700000000, 0x2e }, { 1750000000, 0x3e },
+	{ 1800000000, 0x0e }, { 1850000000, 0x1e }, { 1900000000, 0x2f },
+	{ 1950000000, 0x3f }, { 2000000000, 0x0f }, { 2050000000, 0x40 },
+	{ 2100000000, 0x41 }, { 2150000000, 0x42 }, { 2200000000, 0x43 },
+	{ 2250000000, 0x44 }, { 2300000000, 0x45 }, { 2350000000, 0x46 },
+	{ 2400000000, 0x47 }, { 2450000000, 0x48 }, { 2500000000, 0x49 },
 	{ /* sentinel */ },
 };
 
@@ -109,17 +109,17 @@ struct vco_cntrl_value {
 };
 
 static const struct vco_cntrl_value vco_cntrl_table[] = {
-	{ .min_freq = 40000000,   .max_freq = 55000000,   .value = 0x3f},
-	{ .min_freq = 52500000,   .max_freq = 80000000,   .value = 0x39},
-	{ .min_freq = 80000000,   .max_freq = 110000000,  .value = 0x2f},
-	{ .min_freq = 105000000,  .max_freq = 160000000,  .value = 0x29},
-	{ .min_freq = 160000000,  .max_freq = 220000000,  .value = 0x1f},
-	{ .min_freq = 210000000,  .max_freq = 320000000,  .value = 0x19},
-	{ .min_freq = 320000000,  .max_freq = 440000000,  .value = 0x0f},
-	{ .min_freq = 420000000,  .max_freq = 660000000,  .value = 0x09},
-	{ .min_freq = 630000000,  .max_freq = 1149000000, .value = 0x03},
-	{ .min_freq = 1100000000, .max_freq = 1152000000, .value = 0x01},
-	{ .min_freq = 1150000000, .max_freq = 1250000000, .value = 0x01},
+	{ .min_freq = 40000000,   .max_freq = 55000000,   .value = 0x3f },
+	{ .min_freq = 52500000,   .max_freq = 80000000,   .value = 0x39 },
+	{ .min_freq = 80000000,   .max_freq = 110000000,  .value = 0x2f },
+	{ .min_freq = 105000000,  .max_freq = 160000000,  .value = 0x29 },
+	{ .min_freq = 160000000,  .max_freq = 220000000,  .value = 0x1f },
+	{ .min_freq = 210000000,  .max_freq = 320000000,  .value = 0x19 },
+	{ .min_freq = 320000000,  .max_freq = 440000000,  .value = 0x0f },
+	{ .min_freq = 420000000,  .max_freq = 660000000,  .value = 0x09 },
+	{ .min_freq = 630000000,  .max_freq = 1149000000, .value = 0x03 },
+	{ .min_freq = 1100000000, .max_freq = 1152000000, .value = 0x01 },
+	{ .min_freq = 1150000000, .max_freq = 1250000000, .value = 0x01 },
 	{ /* sentinel */ },
 };
 
@@ -152,8 +152,7 @@ static int rcar_mipi_dsi_phtw_test(struct rcar_mipi_dsi *dsi, u32 phtw)
 
 	for (timeout = 10; timeout > 0; --timeout) {
 		status = rcar_mipi_dsi_read(dsi, PHTW);
-		if (!(status & PHTW_DWEN) &&
-		    !(status & PHTW_CWEN))
+		if (!(status & PHTW_DWEN) && !(status & PHTW_CWEN))
 			break;
 
 		usleep_range(1000, 2000);
@@ -181,9 +180,9 @@ struct dsi_setup_info {
 	unsigned int n;
 };
 
-static void rcar_mipi_dsi_parametters_calc(struct rcar_mipi_dsi *dsi,
-					struct clk *clk, unsigned long target,
-					struct dsi_setup_info *setup_info)
+static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
+					  struct clk *clk, unsigned long target,
+					  struct dsi_setup_info *setup_info)
 {
 
 	const struct vco_cntrl_value *vco_cntrl;
@@ -199,16 +198,15 @@ static void rcar_mipi_dsi_parametters_calc(struct rcar_mipi_dsi *dsi,
 	 * Calculate Fout = dot clock * ColorDepth / (2 * Lane Count)
 	 * The range out Fout is [40 - 1250] Mhz
 	 */
-	fout_target = target *
-			mipi_dsi_pixel_format_to_bpp(dsi->format) /
-			(2 * dsi->lanes);
+	fout_target = target * mipi_dsi_pixel_format_to_bpp(dsi->format)
+		    / (2 * dsi->lanes);
 	if (fout_target < 40000000 || fout_target > 1250000000)
 		return;
 
 	/* Find vco_cntrl */
 	for (vco_cntrl = vco_cntrl_table; vco_cntrl->min_freq != 0; vco_cntrl++) {
 		if (fout_target > vco_cntrl->min_freq &&
-			fout_target <= vco_cntrl->max_freq) {
+		    fout_target <= vco_cntrl->max_freq) {
 			setup_info->vco_cntrl = vco_cntrl->value;
 			if (fout_target >= 1150000000)
 				setup_info->prop_cntrl = 0x0c;
@@ -247,7 +245,7 @@ static void rcar_mipi_dsi_parametters_calc(struct rcar_mipi_dsi *dsi,
 		for (m = 64; m < 626; m++) {
 			fout = fpfd * m / divider;
 			err = abs((long)(fout - fout_target) * 10000 /
-					(long)fout_target);
+				  (long)fout_target);
 			if (err < setup_info->err) {
 				setup_info->m = m - 2;
 				setup_info->n = n - 1;
@@ -283,43 +281,40 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi)
 
 	/* Configuration for Pixel Stream and Packet Header */
 	if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 24)
-		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR,
-					TXVMPSPHSETR_DT_RGB24);
+		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB24);
 	else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 18)
-		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR,
-					TXVMPSPHSETR_DT_RGB18);
+		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB18);
 	else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 16)
-		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR,
-					TXVMPSPHSETR_DT_RGB16);
+		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB16);
 	else {
 		dev_warn(dsi->dev, "unsupported format");
 		return;
 	}
 
 	/* Configuration for Blanking sequence and Input Pixel */
-	setr = TXVMSETR_HSABPEN_EN | TXVMSETR_HBPBPEN_EN |
-	       TXVMSETR_HFPBPEN_EN | TXVMSETR_SYNSEQ_PULSES |
-	       TXVMSETR_PIXWDTH | TXVMSETR_VSTPM;
+	setr = TXVMSETR_HSABPEN_EN | TXVMSETR_HBPBPEN_EN
+	     | TXVMSETR_HFPBPEN_EN | TXVMSETR_SYNSEQ_PULSES
+	     | TXVMSETR_PIXWDTH | TXVMSETR_VSTPM;
 	rcar_mipi_dsi_write(dsi, TXVMSETR, setr);
 
 	/* Configuration for Video Parameters */
-	vprmset0r = ((mode->flags & DRM_MODE_FLAG_PVSYNC) ?
-		TXVMVPRMSET0R_VSPOL_HIG : TXVMVPRMSET0R_VSPOL_LOW) |
-		((mode->flags & DRM_MODE_FLAG_PHSYNC) ?
-		TXVMVPRMSET0R_HSPOL_HIG : TXVMVPRMSET0R_HSPOL_LOW) |
-		TXVMVPRMSET0R_CSPC_RGB | TXVMVPRMSET0R_BPP_24;
+	vprmset0r = (mode->flags & DRM_MODE_FLAG_PVSYNC ?
+		     TXVMVPRMSET0R_VSPOL_HIG : TXVMVPRMSET0R_VSPOL_LOW)
+		  | (mode->flags & DRM_MODE_FLAG_PHSYNC ?
+		     TXVMVPRMSET0R_HSPOL_HIG : TXVMVPRMSET0R_HSPOL_LOW)
+		  | TXVMVPRMSET0R_CSPC_RGB | TXVMVPRMSET0R_BPP_24;
 
-	vprmset1r = TXVMVPRMSET1R_VACTIVE(mode->vdisplay) |
-		    TXVMVPRMSET1R_VSA(mode->vsync_end - mode->vsync_start);
+	vprmset1r = TXVMVPRMSET1R_VACTIVE(mode->vdisplay)
+		  | TXVMVPRMSET1R_VSA(mode->vsync_end - mode->vsync_start);
 
-	vprmset2r = TXVMVPRMSET2R_VFP(mode->vsync_start - mode->vdisplay) |
-		    TXVMVPRMSET2R_VBP(mode->vtotal - mode->vsync_end);
+	vprmset2r = TXVMVPRMSET2R_VFP(mode->vsync_start - mode->vdisplay)
+		  | TXVMVPRMSET2R_VBP(mode->vtotal - mode->vsync_end);
 
-	vprmset3r = TXVMVPRMSET3R_HACTIVE(mode->hdisplay) |
-		    TXVMVPRMSET3R_HSA(mode->hsync_end - mode->hsync_start);
+	vprmset3r = TXVMVPRMSET3R_HACTIVE(mode->hdisplay)
+		  | TXVMVPRMSET3R_HSA(mode->hsync_end - mode->hsync_start);
 
-	vprmset4r = TXVMVPRMSET4R_HFP(mode->hsync_start - mode->hdisplay) |
-		    TXVMVPRMSET4R_HBP(mode->htotal - mode->hsync_end);
+	vprmset4r = TXVMVPRMSET4R_HFP(mode->hsync_start - mode->hdisplay)
+		  | TXVMVPRMSET4R_HBP(mode->htotal - mode->hsync_end);
 
 	rcar_mipi_dsi_write(dsi, TXVMVPRMSET0R, vprmset0r);
 	rcar_mipi_dsi_write(dsi, TXVMVPRMSET1R, vprmset1r);
@@ -347,9 +342,9 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi)
 		return -EINVAL;
 	}
 
-	/* Parametters Calulation */
-	rcar_mipi_dsi_parametters_calc(dsi, dsi->clocks.extal,
-				       mode->clock * 1000, &setup_info);
+	/* Parameters Calculation */
+	rcar_mipi_dsi_parameters_calc(dsi, dsi->clocks.extal,
+				      mode->clock * 1000, &setup_info);
 
 	/* LPCLK enable */
 	rcar_mipi_dsi_set(dsi, LPCLKSET, LPCLKSET_CKEN);
@@ -380,12 +375,12 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi)
 	rcar_mipi_dsi_set(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
 	rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
 
-	clockset2 = CLOCKSET2_M(setup_info.m) | CLOCKSET2_N(setup_info.n) |
-		    CLOCKSET2_VCO_CNTRL(setup_info.vco_cntrl);
-	clockset3 = CLOCKSET3_PROP_CNTRL(setup_info.prop_cntrl) |
-		    CLOCKSET3_INT_CNTRL(0) |
-		    CLOCKSET3_CPBIAS_CNTRL(0x10) |
-		    CLOCKSET3_GMP_CNTRL(1);
+	clockset2 = CLOCKSET2_M(setup_info.m) | CLOCKSET2_N(setup_info.n)
+		  | CLOCKSET2_VCO_CNTRL(setup_info.vco_cntrl);
+	clockset3 = CLOCKSET3_PROP_CNTRL(setup_info.prop_cntrl)
+		  | CLOCKSET3_INT_CNTRL(0)
+		  | CLOCKSET3_CPBIAS_CNTRL(0x10)
+		  | CLOCKSET3_GMP_CNTRL(1);
 	rcar_mipi_dsi_write(dsi, CLOCKSET2, clockset2);
 	rcar_mipi_dsi_write(dsi, CLOCKSET3, clockset3);
 
@@ -436,8 +431,8 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi)
 		dev_warn(dsi->dev, "unsupported format");
 		return -EINVAL;
 	}
-	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_DIV(setup_info.div) |
-			VCLKSET_LANE(dsi->lanes - 1);
+	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_DIV(setup_info.div)
+		|  VCLKSET_LANE(dsi->lanes - 1);
 
 	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
 
@@ -498,8 +493,7 @@ static int rcar_mipi_dsi_start_video(struct rcar_mipi_dsi *dsi)
 	/* Check status of Tranmission */
 	for (timeout = 10; timeout > 0; --timeout) {
 		status = rcar_mipi_dsi_read(dsi, LINKSR);
-		if (!(status & LINKSR_LPBUSY) &&
-		    !(status & LINKSR_HSBUSY)) {
+		if (!(status & LINKSR_LPBUSY) && !(status & LINKSR_HSBUSY)) {
 			rcar_mipi_dsi_clr(dsi, TXVMCR, TXVMCR_VFCLR);
 			break;
 		}
-- 
Regards,

Laurent Pinchart

