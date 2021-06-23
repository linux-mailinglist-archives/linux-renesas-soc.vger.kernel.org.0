Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1BF63B1267
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 05:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhFWDt5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 23:49:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57852 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbhFWDt4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:49:56 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E06B029DB;
        Wed, 23 Jun 2021 05:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624420057;
        bh=+5aH/H/M6nzfLzGxtXlYfgqFs3kKXJpUWC0YdeCkVEk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CIOBbSjyRT2BwXp7ykRgiK3MMDb2CgY8OP0DIeqhrM8YhKxzCYoGb7vVXQhzJdlSp
         E7C2OewlQPiCIGfkeKFYwD/3ic10GTO/1a46xA/Q0sdDbU7PIuKPINKOSvXkLjBsRO
         EpgPkIVIRVsRAu7wb8qQT4t7zFJV106kmUCKpBf4=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [RFC PATCH 06/15] drm: rcar-du: dsi: Shorten mipi_dsi variable name to dsi
Date:   Wed, 23 Jun 2021 06:46:47 +0300
Message-Id: <20210623034656.10316-7-laurent.pinchart+renesas@ideasonboard.com>
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
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 331 ++++++++++++------------
 1 file changed, 161 insertions(+), 170 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 17cff0305c6c..fbc8ba154e28 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -119,40 +119,35 @@ static const struct vco_cntrl_value vco_cntrl_table[] = {
 	{ /* sentinel */ },
 };
 
-static void rcar_mipi_dsi_write(struct rcar_mipi_dsi *mipi_dsi,
-				u32 reg, u32 data)
+static void rcar_mipi_dsi_write(struct rcar_mipi_dsi *dsi, u32 reg, u32 data)
 {
-	iowrite32(data, mipi_dsi->mmio + reg);
+	iowrite32(data, dsi->mmio + reg);
 }
 
-static u32 rcar_mipi_dsi_read(struct rcar_mipi_dsi *mipi_dsi, u32 reg)
+static u32 rcar_mipi_dsi_read(struct rcar_mipi_dsi *dsi, u32 reg)
 {
-	return ioread32(mipi_dsi->mmio + reg);
+	return ioread32(dsi->mmio + reg);
 }
 
-static void rcar_mipi_dsi_clr(struct rcar_mipi_dsi *mipi_dsi,
-			     u32 reg, u32 clr)
+static void rcar_mipi_dsi_clr(struct rcar_mipi_dsi *dsi, u32 reg, u32 clr)
 {
-	rcar_mipi_dsi_write(mipi_dsi, reg,
-			rcar_mipi_dsi_read(mipi_dsi, reg) & ~clr);
+	rcar_mipi_dsi_write(dsi, reg, rcar_mipi_dsi_read(dsi, reg) & ~clr);
 }
 
-static void rcar_mipi_dsi_set(struct rcar_mipi_dsi *mipi_dsi,
-				u32 reg, u32 set)
+static void rcar_mipi_dsi_set(struct rcar_mipi_dsi *dsi, u32 reg, u32 set)
 {
-	rcar_mipi_dsi_write(mipi_dsi, reg,
-			    rcar_mipi_dsi_read(mipi_dsi, reg) | set);
+	rcar_mipi_dsi_write(dsi, reg, rcar_mipi_dsi_read(dsi, reg) | set);
 }
 
-static int rcar_mipi_dsi_phtw_test(struct rcar_mipi_dsi *mipi_dsi, u32 phtw)
+static int rcar_mipi_dsi_phtw_test(struct rcar_mipi_dsi *dsi, u32 phtw)
 {
 	unsigned int timeout;
 	u32 status;
 
-	rcar_mipi_dsi_write(mipi_dsi, PHTW, phtw);
+	rcar_mipi_dsi_write(dsi, PHTW, phtw);
 
 	for (timeout = 10; timeout > 0; --timeout) {
-		status = rcar_mipi_dsi_read(mipi_dsi, PHTW);
+		status = rcar_mipi_dsi_read(dsi, PHTW);
 		if (!(status & PHTW_DWEN) &&
 		    !(status & PHTW_CWEN))
 			break;
@@ -161,8 +156,7 @@ static int rcar_mipi_dsi_phtw_test(struct rcar_mipi_dsi *mipi_dsi, u32 phtw)
 	}
 
 	if (!timeout) {
-		dev_err(mipi_dsi->dev,
-			"failed to test phtw with data %x\n", phtw);
+		dev_err(dsi->dev, "failed to test phtw with data %x\n", phtw);
 		return -ETIMEDOUT;
 	}
 
@@ -183,7 +177,7 @@ struct dsi_setup_info {
 	unsigned int n;
 };
 
-static void rcar_mipi_dsi_parametters_calc(struct rcar_mipi_dsi *mipi_dsi,
+static void rcar_mipi_dsi_parametters_calc(struct rcar_mipi_dsi *dsi,
 					struct clk *clk, unsigned long target,
 					struct dsi_setup_info *setup_info)
 {
@@ -202,8 +196,8 @@ static void rcar_mipi_dsi_parametters_calc(struct rcar_mipi_dsi *mipi_dsi,
 	 * The range out Fout is [40 - 1250] Mhz
 	 */
 	fout_target = target *
-			mipi_dsi_pixel_format_to_bpp(mipi_dsi->format) /
-			(2 * mipi_dsi->lanes);
+			mipi_dsi_pixel_format_to_bpp(dsi->format) /
+			(2 * dsi->lanes);
 	if (fout_target < 40000000 || fout_target > 1250000000)
 		return;
 
@@ -261,21 +255,21 @@ static void rcar_mipi_dsi_parametters_calc(struct rcar_mipi_dsi *mipi_dsi,
 	}
 
 done:
-	dev_dbg(mipi_dsi->dev,
+	dev_dbg(dsi->dev,
 		"%pC %lu Hz -> Fout %lu Hz (target %lu Hz, error %d.%02u%%), PLL M/N/DIV %u/%u/%u\n",
 		clk, fin, fout, fout_target, setup_info->err / 100,
 		setup_info->err % 100, setup_info->m,
 		setup_info->n, setup_info->div);
-	dev_dbg(mipi_dsi->dev,
+	dev_dbg(dsi->dev,
 		"vco_cntrl = 0x%x\tprop_cntrl = 0x%x\thsfreqrange = 0x%x\n",
 		setup_info->vco_cntrl,
 		setup_info->prop_cntrl,
 		setup_info->hsfreqrange);
 }
 
-static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *mipi_dsi)
+static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi)
 {
-	struct drm_display_mode *mode = &mipi_dsi->display_mode;
+	struct drm_display_mode *mode = &dsi->display_mode;
 	u32 setr;
 	u32 vprmset0r;
 	u32 vprmset1r;
@@ -284,17 +278,17 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *mipi_dsi)
 	u32 vprmset4r;
 
 	/* Configuration for Pixel Stream and Packet Header */
-	if (mipi_dsi_pixel_format_to_bpp(mipi_dsi->format) == 24)
-		rcar_mipi_dsi_write(mipi_dsi, TXVMPSPHSETR,
+	if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 24)
+		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR,
 					TXVMPSPHSETR_DT_RGB24);
-	else if (mipi_dsi_pixel_format_to_bpp(mipi_dsi->format) == 18)
-		rcar_mipi_dsi_write(mipi_dsi, TXVMPSPHSETR,
+	else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 18)
+		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR,
 					TXVMPSPHSETR_DT_RGB18);
-	else if (mipi_dsi_pixel_format_to_bpp(mipi_dsi->format) == 16)
-		rcar_mipi_dsi_write(mipi_dsi, TXVMPSPHSETR,
+	else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 16)
+		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR,
 					TXVMPSPHSETR_DT_RGB16);
 	else {
-		dev_warn(mipi_dsi->dev, "unsupported format");
+		dev_warn(dsi->dev, "unsupported format");
 		return;
 	}
 
@@ -302,7 +296,7 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *mipi_dsi)
 	setr = TXVMSETR_HSABPEN_EN | TXVMSETR_HBPBPEN_EN |
 	       TXVMSETR_HFPBPEN_EN | TXVMSETR_SYNSEQ_PULSES |
 	       TXVMSETR_PIXWDTH | TXVMSETR_VSTPM;
-	rcar_mipi_dsi_write(mipi_dsi, TXVMSETR, setr);
+	rcar_mipi_dsi_write(dsi, TXVMSETR, setr);
 
 	/* Configuration for Video Parameters */
 	vprmset0r = ((mode->flags & DRM_MODE_FLAG_PVSYNC) ?
@@ -323,16 +317,16 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *mipi_dsi)
 	vprmset4r = TXVMVPRMSET4R_HFP(mode->hsync_start - mode->hdisplay) |
 		    TXVMVPRMSET4R_HBP(mode->htotal - mode->hsync_end);
 
-	rcar_mipi_dsi_write(mipi_dsi, TXVMVPRMSET0R, vprmset0r);
-	rcar_mipi_dsi_write(mipi_dsi, TXVMVPRMSET1R, vprmset1r);
-	rcar_mipi_dsi_write(mipi_dsi, TXVMVPRMSET2R, vprmset2r);
-	rcar_mipi_dsi_write(mipi_dsi, TXVMVPRMSET3R, vprmset3r);
-	rcar_mipi_dsi_write(mipi_dsi, TXVMVPRMSET4R, vprmset4r);
+	rcar_mipi_dsi_write(dsi, TXVMVPRMSET0R, vprmset0r);
+	rcar_mipi_dsi_write(dsi, TXVMVPRMSET1R, vprmset1r);
+	rcar_mipi_dsi_write(dsi, TXVMVPRMSET2R, vprmset2r);
+	rcar_mipi_dsi_write(dsi, TXVMVPRMSET3R, vprmset3r);
+	rcar_mipi_dsi_write(dsi, TXVMVPRMSET4R, vprmset4r);
 }
 
-static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *mipi_dsi)
+static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi)
 {
-	struct drm_display_mode *mode = &mipi_dsi->display_mode;
+	struct drm_display_mode *mode = &dsi->display_mode;
 	struct dsi_setup_info setup_info = {.err = -1 };
 	unsigned int timeout;
 	int ret, i;
@@ -343,44 +337,44 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *mipi_dsi)
 	u32 vclkset;
 
 	/* Checking valid format */
-	dsi_format = mipi_dsi_pixel_format_to_bpp(mipi_dsi->format);
+	dsi_format = mipi_dsi_pixel_format_to_bpp(dsi->format);
 	if (dsi_format < 0) {
-		dev_warn(mipi_dsi->dev, "invalid format");
+		dev_warn(dsi->dev, "invalid format");
 		return -EINVAL;
 	}
 
 	/* Parametters Calulation */
-	rcar_mipi_dsi_parametters_calc(mipi_dsi, mipi_dsi->clocks.extal,
-					mode->clock * 1000, &setup_info);
+	rcar_mipi_dsi_parametters_calc(dsi, dsi->clocks.extal,
+				       mode->clock * 1000, &setup_info);
 
 	/* LPCLK enable */
-	rcar_mipi_dsi_set(mipi_dsi, LPCLKSET, LPCLKSET_CKEN);
+	rcar_mipi_dsi_set(dsi, LPCLKSET, LPCLKSET_CKEN);
 
 	/* CFGCLK enabled */
-	rcar_mipi_dsi_set(mipi_dsi, CFGCLKSET, CFGCLKSET_CKEN);
+	rcar_mipi_dsi_set(dsi, CFGCLKSET, CFGCLKSET_CKEN);
 
-	rcar_mipi_dsi_clr(mipi_dsi, PHYSETUP, PHYSETUP_RSTZ);
-	rcar_mipi_dsi_clr(mipi_dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
+	rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_RSTZ);
+	rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
 
-	rcar_mipi_dsi_set(mipi_dsi, PHTC, PHTC_TESTCLR);
-	rcar_mipi_dsi_clr(mipi_dsi, PHTC, PHTC_TESTCLR);
+	rcar_mipi_dsi_set(dsi, PHTC, PHTC_TESTCLR);
+	rcar_mipi_dsi_clr(dsi, PHTC, PHTC_TESTCLR);
 
 	/* PHY setting */
-	phy_setup = rcar_mipi_dsi_read(mipi_dsi, PHYSETUP);
+	phy_setup = rcar_mipi_dsi_read(dsi, PHYSETUP);
 	phy_setup &= ~PHYSETUP_HSFREQRANGE_MASK;
 	phy_setup |= PHYSETUP_HSFREQRANGE(setup_info.hsfreqrange);
-	rcar_mipi_dsi_write(mipi_dsi, PHYSETUP, phy_setup);
+	rcar_mipi_dsi_write(dsi, PHYSETUP, phy_setup);
 
 	for (i = 0; i < ARRAY_SIZE(phtw); i++) {
-		ret = rcar_mipi_dsi_phtw_test(mipi_dsi, phtw[i]);
+		ret = rcar_mipi_dsi_phtw_test(dsi, phtw[i]);
 		if (ret < 0)
 			return ret;
 	}
 
 	/* PLL Clock Setting */
-	rcar_mipi_dsi_clr(mipi_dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
-	rcar_mipi_dsi_set(mipi_dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
-	rcar_mipi_dsi_clr(mipi_dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
+	rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
+	rcar_mipi_dsi_set(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
+	rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
 
 	clockset2 = CLOCKSET2_M(setup_info.m) | CLOCKSET2_N(setup_info.n) |
 		    CLOCKSET2_VCO_CNTRL(setup_info.vco_cntrl);
@@ -388,45 +382,45 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *mipi_dsi)
 		    CLOCKSET3_INT_CNTRL(0) |
 		    CLOCKSET3_CPBIAS_CNTRL(0x10) |
 		    CLOCKSET3_GMP_CNTRL(1);
-	rcar_mipi_dsi_write(mipi_dsi, CLOCKSET2, clockset2);
-	rcar_mipi_dsi_write(mipi_dsi, CLOCKSET3, clockset3);
+	rcar_mipi_dsi_write(dsi, CLOCKSET2, clockset2);
+	rcar_mipi_dsi_write(dsi, CLOCKSET3, clockset3);
 
-	rcar_mipi_dsi_clr(mipi_dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
-	rcar_mipi_dsi_set(mipi_dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
+	rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
+	rcar_mipi_dsi_set(dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
 	udelay(10);
-	rcar_mipi_dsi_clr(mipi_dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
+	rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
 
 	ppisetr = PPISETR_DLEN_3 | PPISETR_CLEN;
-	rcar_mipi_dsi_write(mipi_dsi, PPISETR, ppisetr);
+	rcar_mipi_dsi_write(dsi, PPISETR, ppisetr);
 
-	rcar_mipi_dsi_set(mipi_dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
-	rcar_mipi_dsi_set(mipi_dsi, PHYSETUP, PHYSETUP_RSTZ);
+	rcar_mipi_dsi_set(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
+	rcar_mipi_dsi_set(dsi, PHYSETUP, PHYSETUP_RSTZ);
 	usleep_range(400, 500);
 
 	/* Checking PPI clock status register */
 	for (timeout = 10; timeout > 0; --timeout) {
-		if ((rcar_mipi_dsi_read(mipi_dsi, PPICLSR) & PPICLSR_STPST) &&
-		    (rcar_mipi_dsi_read(mipi_dsi, PPIDLSR) & PPIDLSR_STPST) &&
-		    (rcar_mipi_dsi_read(mipi_dsi, CLOCKSET1) & CLOCKSET1_LOCK))
+		if ((rcar_mipi_dsi_read(dsi, PPICLSR) & PPICLSR_STPST) &&
+		    (rcar_mipi_dsi_read(dsi, PPIDLSR) & PPIDLSR_STPST) &&
+		    (rcar_mipi_dsi_read(dsi, CLOCKSET1) & CLOCKSET1_LOCK))
 			break;
 
 		usleep_range(1000, 2000);
 	}
 
 	if (!timeout) {
-		dev_err(mipi_dsi->dev, "failed to enable PPI clock\n");
+		dev_err(dsi->dev, "failed to enable PPI clock\n");
 		return -ETIMEDOUT;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(phtw2); i++) {
-		ret = rcar_mipi_dsi_phtw_test(mipi_dsi, phtw2[i]);
+		ret = rcar_mipi_dsi_phtw_test(dsi, phtw2[i]);
 		if (ret < 0)
 			return ret;
 	}
 
 	/* Enable DOT clock */
 	vclkset = VCLKSET_CKEN;
-	rcar_mipi_dsi_set(mipi_dsi, VCLKSET, vclkset);
+	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
 
 	if (dsi_format == 24)
 		vclkset |= VCLKSET_BPP_24;
@@ -435,31 +429,31 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *mipi_dsi)
 	else if (dsi_format == 16)
 		vclkset |= VCLKSET_BPP_16;
 	else {
-		dev_warn(mipi_dsi->dev, "unsupported format");
+		dev_warn(dsi->dev, "unsupported format");
 		return -EINVAL;
 	}
 	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_DIV(setup_info.div) |
-			VCLKSET_LANE(mipi_dsi->lanes - 1);
+			VCLKSET_LANE(dsi->lanes - 1);
 
-	rcar_mipi_dsi_set(mipi_dsi, VCLKSET, vclkset);
+	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
 
 	/* After setting VCLKSET register, enable VCLKEN */
-	rcar_mipi_dsi_set(mipi_dsi, VCLKEN, VCLKEN_CKEN);
+	rcar_mipi_dsi_set(dsi, VCLKEN, VCLKEN_CKEN);
 
-	dev_dbg(mipi_dsi->dev, "DSI device is started\n");
+	dev_dbg(dsi->dev, "DSI device is started\n");
 
 	return 0;
 }
 
-static void rcar_mipi_dsi_shutdown(struct rcar_mipi_dsi *mipi_dsi)
+static void rcar_mipi_dsi_shutdown(struct rcar_mipi_dsi *dsi)
 {
-	rcar_mipi_dsi_clr(mipi_dsi, PHYSETUP, PHYSETUP_RSTZ);
-	rcar_mipi_dsi_clr(mipi_dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
+	rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_RSTZ);
+	rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
 
-	dev_dbg(mipi_dsi->dev, "DSI device is shutdown\n");
+	dev_dbg(dsi->dev, "DSI device is shutdown\n");
 }
 
-static int rcar_mipi_dsi_start_hs_clock(struct rcar_mipi_dsi *mipi_dsi)
+static int rcar_mipi_dsi_start_hs_clock(struct rcar_mipi_dsi *dsi)
 {
 	/*
 	 * In HW manual, we need to check TxDDRClkHS-Q Stable? but it dont
@@ -469,13 +463,13 @@ static int rcar_mipi_dsi_start_hs_clock(struct rcar_mipi_dsi *mipi_dsi)
 	u32 status;
 
 	/* Start HS clock */
-	rcar_mipi_dsi_set(mipi_dsi, PPICLCR, PPICLCR_TXREQHS);
+	rcar_mipi_dsi_set(dsi, PPICLCR, PPICLCR_TXREQHS);
 
 	for (timeout = 10; timeout > 0; --timeout) {
-		status = rcar_mipi_dsi_read(mipi_dsi, PPICLSR);
+		status = rcar_mipi_dsi_read(dsi, PPICLSR);
 
 		if (status & PPICLSR_TOHS) {
-			rcar_mipi_dsi_set(mipi_dsi, PPICLSCR, PPICLSCR_TOHS);
+			rcar_mipi_dsi_set(dsi, PPICLSCR, PPICLSCR_TOHS);
 			break;
 		}
 
@@ -483,26 +477,26 @@ static int rcar_mipi_dsi_start_hs_clock(struct rcar_mipi_dsi *mipi_dsi)
 	}
 
 	if (!timeout) {
-		dev_err(mipi_dsi->dev, "failed to enable HS clock\n");
+		dev_err(dsi->dev, "failed to enable HS clock\n");
 		return -ETIMEDOUT;
 	}
 
-	dev_dbg(mipi_dsi->dev, "Start High Speed Clock");
+	dev_dbg(dsi->dev, "Start High Speed Clock");
 
 	return 0;
 }
 
-static int rcar_mipi_dsi_start_video(struct rcar_mipi_dsi *mipi_dsi)
+static int rcar_mipi_dsi_start_video(struct rcar_mipi_dsi *dsi)
 {
 	unsigned int timeout;
 	u32 status;
 
 	/* Check status of Tranmission */
 	for (timeout = 10; timeout > 0; --timeout) {
-		status = rcar_mipi_dsi_read(mipi_dsi, LINKSR);
+		status = rcar_mipi_dsi_read(dsi, LINKSR);
 		if (!(status & LINKSR_LPBUSY) &&
 		    !(status & LINKSR_HSBUSY)) {
-			rcar_mipi_dsi_clr(mipi_dsi, TXVMCR, TXVMCR_VFCLR);
+			rcar_mipi_dsi_clr(dsi, TXVMCR, TXVMCR_VFCLR);
 			break;
 		}
 
@@ -510,15 +504,15 @@ static int rcar_mipi_dsi_start_video(struct rcar_mipi_dsi *mipi_dsi)
 	}
 
 	if (!timeout) {
-		dev_err(mipi_dsi->dev, "Failed to enable Video clock\n");
+		dev_err(dsi->dev, "Failed to enable Video clock\n");
 		return -ETIMEDOUT;
 	}
 
 	/* Check Clear Video mode FIFO */
 	for (timeout = 10; timeout > 0; --timeout) {
-		status = rcar_mipi_dsi_read(mipi_dsi, TXVMSR);
+		status = rcar_mipi_dsi_read(dsi, TXVMSR);
 		if (status & TXVMSR_VFRDY) {
-			rcar_mipi_dsi_set(mipi_dsi, TXVMCR, TXVMCR_EN_VIDEO);
+			rcar_mipi_dsi_set(dsi, TXVMCR, TXVMCR_EN_VIDEO);
 			break;
 		}
 
@@ -526,13 +520,13 @@ static int rcar_mipi_dsi_start_video(struct rcar_mipi_dsi *mipi_dsi)
 	}
 
 	if (!timeout) {
-		dev_err(mipi_dsi->dev, "Failed to enable Video clock\n");
+		dev_err(dsi->dev, "Failed to enable Video clock\n");
 		return -ETIMEDOUT;
 	}
 
 	/* Check Video transmission */
 	for (timeout = 10; timeout > 0; --timeout) {
-		status = rcar_mipi_dsi_read(mipi_dsi, TXVMSR);
+		status = rcar_mipi_dsi_read(dsi, TXVMSR);
 		if (status & TXVMSR_RDY)
 			break;
 
@@ -540,11 +534,11 @@ static int rcar_mipi_dsi_start_video(struct rcar_mipi_dsi *mipi_dsi)
 	}
 
 	if (!timeout) {
-		dev_err(mipi_dsi->dev, "Failed to enable Video clock\n");
+		dev_err(dsi->dev, "Failed to enable Video clock\n");
 		return -ETIMEDOUT;
 	}
 
-	dev_dbg(mipi_dsi->dev, "Start video transferring");
+	dev_dbg(dsi->dev, "Start video transferring");
 
 	return 0;
 }
@@ -556,9 +550,9 @@ static int rcar_mipi_dsi_start_video(struct rcar_mipi_dsi *mipi_dsi)
 static int rcar_mipi_dsi_attach(struct drm_bridge *bridge,
 				enum drm_bridge_attach_flags flags)
 {
-	struct rcar_mipi_dsi *mipi_dsi = bridge_to_rcar_mipi_dsi(bridge);
+	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
 
-	return drm_bridge_attach(bridge->encoder, mipi_dsi->next_bridge, bridge,
+	return drm_bridge_attach(bridge->encoder, dsi->next_bridge, bridge,
 				 flags);
 }
 
@@ -566,23 +560,23 @@ static void rcar_mipi_dsi_mode_set(struct drm_bridge *bridge,
 				   const struct drm_display_mode *mode,
 				   const struct drm_display_mode *adjusted_mode)
 {
-	struct rcar_mipi_dsi *mipi_dsi = bridge_to_rcar_mipi_dsi(bridge);
+	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
 
-	mipi_dsi->display_mode = *adjusted_mode;
+	dsi->display_mode = *adjusted_mode;
 }
 
 static void rcar_mipi_dsi_enable(struct drm_bridge *bridge)
 {
-	struct rcar_mipi_dsi *mipi_dsi = bridge_to_rcar_mipi_dsi(bridge);
+	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
 	int ret;
 
-	rcar_mipi_dsi_set_display_timing(mipi_dsi);
+	rcar_mipi_dsi_set_display_timing(dsi);
 
-	ret = rcar_mipi_dsi_start_hs_clock(mipi_dsi);
+	ret = rcar_mipi_dsi_start_hs_clock(dsi);
 	if (ret < 0)
 		return;
 
-	ret = rcar_mipi_dsi_start_video(mipi_dsi);
+	ret = rcar_mipi_dsi_start_video(dsi);
 	if (ret < 0)
 		return;
 
@@ -612,20 +606,20 @@ static const struct drm_bridge_funcs rcar_mipi_dsi_bridge_ops = {
 
 int rcar_mipi_dsi_clk_enable(struct drm_bridge *bridge)
 {
-	struct rcar_mipi_dsi *mipi_dsi = bridge_to_rcar_mipi_dsi(bridge);
+	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
 	int ret;
 
-	reset_control_deassert(mipi_dsi->rstc);
+	reset_control_deassert(dsi->rstc);
 
-	ret = clk_prepare_enable(mipi_dsi->clocks.mod);
+	ret = clk_prepare_enable(dsi->clocks.mod);
 	if (ret < 0)
 		return ret;
 
-	ret = clk_prepare_enable(mipi_dsi->clocks.dsi);
+	ret = clk_prepare_enable(dsi->clocks.dsi);
 	if (ret < 0)
 		return ret;
 
-	ret = rcar_mipi_dsi_startup(mipi_dsi);
+	ret = rcar_mipi_dsi_startup(dsi);
 	if (ret < 0)
 		return ret;
 
@@ -635,16 +629,16 @@ EXPORT_SYMBOL_GPL(rcar_mipi_dsi_clk_enable);
 
 void rcar_mipi_dsi_clk_disable(struct drm_bridge *bridge)
 {
-	struct rcar_mipi_dsi *mipi_dsi = bridge_to_rcar_mipi_dsi(bridge);
+	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
 
-	rcar_mipi_dsi_shutdown(mipi_dsi);
+	rcar_mipi_dsi_shutdown(dsi);
 
 	/* Disable DSI clock and reset HW */
-	clk_disable_unprepare(mipi_dsi->clocks.dsi);
+	clk_disable_unprepare(dsi->clocks.dsi);
 
-	clk_disable_unprepare(mipi_dsi->clocks.mod);
+	clk_disable_unprepare(dsi->clocks.mod);
 
-	reset_control_assert(mipi_dsi->rstc);
+	reset_control_assert(dsi->rstc);
 }
 EXPORT_SYMBOL_GPL(rcar_mipi_dsi_clk_disable);
 
@@ -655,13 +649,13 @@ EXPORT_SYMBOL_GPL(rcar_mipi_dsi_clk_disable);
 static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 					struct mipi_dsi_device *device)
 {
-	struct rcar_mipi_dsi *mipi_dsi = host_to_rcar_mipi_dsi(host);
+	struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
 
-	if (device->lanes > mipi_dsi->num_data_lanes)
+	if (device->lanes > dsi->num_data_lanes)
 		return -EINVAL;
 
-	mipi_dsi->lanes = device->lanes;
-	mipi_dsi->format = device->format;
+	dsi->lanes = device->lanes;
+	dsi->format = device->format;
 
 	return 0;
 }
@@ -681,7 +675,7 @@ static const struct mipi_dsi_host_ops rcar_mipi_dsi_host_ops = {
  * Probe & Remove
  */
 
-static int rcar_mipi_dsi_parse_dt(struct rcar_mipi_dsi *mipi_dsi)
+static int rcar_mipi_dsi_parse_dt(struct rcar_mipi_dsi *dsi)
 {
 	struct device_node *local_output = NULL;
 	struct device_node *remote_input = NULL;
@@ -692,10 +686,10 @@ static int rcar_mipi_dsi_parse_dt(struct rcar_mipi_dsi *mipi_dsi)
 	int ret = 0;
 	int len, num_lanes;
 
-	local_output = of_graph_get_endpoint_by_regs(mipi_dsi->dev->of_node,
+	local_output = of_graph_get_endpoint_by_regs(dsi->dev->of_node,
 						     1, 0);
 	if (!local_output) {
-		dev_dbg(mipi_dsi->dev, "unconnected port@1\n");
+		dev_dbg(dsi->dev, "unconnected port@1\n");
 		ret = -ENODEV;
 		goto done;
 	}
@@ -706,15 +700,14 @@ static int rcar_mipi_dsi_parse_dt(struct rcar_mipi_dsi *mipi_dsi)
 	 */
 	remote = of_graph_get_remote_port_parent(local_output);
 	if (!remote) {
-		dev_dbg(mipi_dsi->dev, "unconnected endpoint %pOF\n",
-				local_output);
+		dev_dbg(dsi->dev, "unconnected endpoint %pOF\n", local_output);
 		ret = -ENODEV;
 		goto done;
 	}
 
 	if (!of_device_is_available(remote)) {
-		dev_dbg(mipi_dsi->dev, "connected entity %pOF is disabled\n",
-				remote);
+		dev_dbg(dsi->dev, "connected entity %pOF is disabled\n",
+			remote);
 		ret = -ENODEV;
 		goto done;
 	}
@@ -737,8 +730,8 @@ static int rcar_mipi_dsi_parse_dt(struct rcar_mipi_dsi *mipi_dsi)
 		goto done;
 	}
 
-	mipi_dsi->next_bridge = of_drm_find_bridge(remote);
-	if (!mipi_dsi->next_bridge) {
+	dsi->next_bridge = of_drm_find_bridge(remote);
+	if (!dsi->next_bridge) {
 		ret = -EPROBE_DEFER;
 		goto done;
 	}
@@ -746,8 +739,8 @@ static int rcar_mipi_dsi_parse_dt(struct rcar_mipi_dsi *mipi_dsi)
 	/* Get lanes information */
 	prop = of_find_property(local_output, "data-lanes", &len);
 	if (!prop) {
-		mipi_dsi->num_data_lanes = 4;
-		dev_dbg(mipi_dsi->dev,
+		dsi->num_data_lanes = 4;
+		dev_dbg(dsi->dev,
 			"failed to find data lane information, using default\n");
 		goto done;
 	}
@@ -755,11 +748,11 @@ static int rcar_mipi_dsi_parse_dt(struct rcar_mipi_dsi *mipi_dsi)
 	num_lanes = len / sizeof(u32);
 
 	if (num_lanes < 1 || num_lanes > 4) {
-		dev_err(mipi_dsi->dev, "data lanes definition is not correct\n");
+		dev_err(dsi->dev, "data lanes definition is not correct\n");
 		return -EINVAL;
 	}
 
-	mipi_dsi->num_data_lanes = num_lanes;
+	dsi->num_data_lanes = num_lanes;
 done:
 	of_node_put(local_output);
 	of_node_put(remote_input);
@@ -768,43 +761,41 @@ static int rcar_mipi_dsi_parse_dt(struct rcar_mipi_dsi *mipi_dsi)
 	return ret;
 }
 
-static struct clk *rcar_mipi_dsi_get_clock(struct rcar_mipi_dsi *mipi_dsi,
+static struct clk *rcar_mipi_dsi_get_clock(struct rcar_mipi_dsi *dsi,
 					   const char *name,
 					   bool optional)
 {
 	struct clk *clk;
 
-	clk = devm_clk_get(mipi_dsi->dev, name);
+	clk = devm_clk_get(dsi->dev, name);
 	if (!IS_ERR(clk))
 		return clk;
 
 	if (PTR_ERR(clk) == -ENOENT && optional)
 		return NULL;
 
-	dev_err_probe(mipi_dsi->dev, PTR_ERR(clk), "failed to get %s clock\n",
+	dev_err_probe(dsi->dev, PTR_ERR(clk), "failed to get %s clock\n",
 		      name ? name : "module");
 
 	return clk;
 }
 
-static int rcar_mipi_dsi_get_clocks(struct rcar_mipi_dsi *mipi_dsi)
+static int rcar_mipi_dsi_get_clocks(struct rcar_mipi_dsi *dsi)
 {
-	mipi_dsi->clocks.mod = rcar_mipi_dsi_get_clock(mipi_dsi, NULL, false);
-	if (IS_ERR(mipi_dsi->clocks.mod))
-		return PTR_ERR(mipi_dsi->clocks.mod);
+	dsi->clocks.mod = rcar_mipi_dsi_get_clock(dsi, NULL, false);
+	if (IS_ERR(dsi->clocks.mod))
+		return PTR_ERR(dsi->clocks.mod);
 
-	mipi_dsi->clocks.extal = rcar_mipi_dsi_get_clock(mipi_dsi, "extal",
-							 true);
-	if (IS_ERR(mipi_dsi->clocks.extal))
-		return PTR_ERR(mipi_dsi->clocks.extal);
+	dsi->clocks.extal = rcar_mipi_dsi_get_clock(dsi, "extal", true);
+	if (IS_ERR(dsi->clocks.extal))
+		return PTR_ERR(dsi->clocks.extal);
 
-	mipi_dsi->clocks.dsi = rcar_mipi_dsi_get_clock(mipi_dsi, "dsi", true);
-	if (IS_ERR(mipi_dsi->clocks.dsi))
-		return PTR_ERR(mipi_dsi->clocks.dsi);
+	dsi->clocks.dsi = rcar_mipi_dsi_get_clock(dsi, "dsi", true);
+	if (IS_ERR(dsi->clocks.dsi))
+		return PTR_ERR(dsi->clocks.dsi);
 
-	if (!mipi_dsi->clocks.extal && !mipi_dsi->clocks.dsi) {
-		dev_err(mipi_dsi->dev,
-			"no input clock (extal, dclkin.0)\n");
+	if (!dsi->clocks.extal && !dsi->clocks.dsi) {
+		dev_err(dsi->dev, "no input clock (extal, dclkin.0)\n");
 		return -EINVAL;
 	}
 
@@ -814,61 +805,61 @@ static int rcar_mipi_dsi_get_clocks(struct rcar_mipi_dsi *mipi_dsi)
 static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct rcar_mipi_dsi *mipi_dsi;
+	struct rcar_mipi_dsi *dsi;
 	struct resource *mem;
 	int ret;
 
-	mipi_dsi = devm_kzalloc(&pdev->dev, sizeof(*mipi_dsi), GFP_KERNEL);
-	if (mipi_dsi == NULL)
+	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
+	if (dsi == NULL)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, mipi_dsi);
+	platform_set_drvdata(pdev, dsi);
 
-	mipi_dsi->dev = dev;
-	mipi_dsi->info = of_device_get_match_data(&pdev->dev);
+	dsi->dev = dev;
+	dsi->info = of_device_get_match_data(&pdev->dev);
 
-	ret = rcar_mipi_dsi_parse_dt(mipi_dsi);
+	ret = rcar_mipi_dsi_parse_dt(dsi);
 	if (ret < 0)
 		return ret;
 
 	/* Acquire resources. */
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mipi_dsi->mmio = devm_ioremap_resource(&pdev->dev, mem);
-	if (IS_ERR(mipi_dsi->mmio))
-		return PTR_ERR(mipi_dsi->mmio);
+	dsi->mmio = devm_ioremap_resource(&pdev->dev, mem);
+	if (IS_ERR(dsi->mmio))
+		return PTR_ERR(dsi->mmio);
 
-	ret = rcar_mipi_dsi_get_clocks(mipi_dsi);
+	ret = rcar_mipi_dsi_get_clocks(dsi);
 	if (ret < 0)
 		return ret;
 
-	mipi_dsi->rstc = devm_reset_control_get(&pdev->dev, NULL);
-	if (IS_ERR(mipi_dsi->rstc)) {
+	dsi->rstc = devm_reset_control_get(&pdev->dev, NULL);
+	if (IS_ERR(dsi->rstc)) {
 		dev_err(&pdev->dev, "failed to get cpg reset\n");
-		return PTR_ERR(mipi_dsi->rstc);
+		return PTR_ERR(dsi->rstc);
 	}
 
 	/* Initialize the DSI host. */
-	mipi_dsi->host.dev = dev;
-	mipi_dsi->host.ops = &rcar_mipi_dsi_host_ops;
-	ret = mipi_dsi_host_register(&mipi_dsi->host);
+	dsi->host.dev = dev;
+	dsi->host.ops = &rcar_mipi_dsi_host_ops;
+	ret = mipi_dsi_host_register(&dsi->host);
 	if (ret < 0)
 		return ret;
 
 	/* Initialize the DRM bridge. */
-	mipi_dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;
-	mipi_dsi->bridge.of_node = pdev->dev.of_node;
-	drm_bridge_add(&mipi_dsi->bridge);
+	dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;
+	dsi->bridge.of_node = pdev->dev.of_node;
+	drm_bridge_add(&dsi->bridge);
 
 	return 0;
 }
 
 static int rcar_mipi_dsi_remove(struct platform_device *pdev)
 {
-	struct rcar_mipi_dsi *mipi_dsi = platform_get_drvdata(pdev);
+	struct rcar_mipi_dsi *dsi = platform_get_drvdata(pdev);
 
-	drm_bridge_remove(&mipi_dsi->bridge);
+	drm_bridge_remove(&dsi->bridge);
 
-	mipi_dsi_host_unregister(&mipi_dsi->host);
+	mipi_dsi_host_unregister(&dsi->host);
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart

