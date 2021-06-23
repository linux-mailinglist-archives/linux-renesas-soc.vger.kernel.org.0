Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFB33B1262
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 05:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbhFWDty (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 23:49:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57852 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhFWDtx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:49:53 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D79FE2B;
        Wed, 23 Jun 2021 05:47:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624420055;
        bh=6YHeycy3w8mXfUECYDAtPmFCj9NkM38GgzsvDYObxoM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QgbsFaSszIEbRCzBKWRnsXmOlsXUfijPfGQEv0QlLqCuxno2xOGzqptH/W8tRKNA2
         V5WS5RIAI+tEZrzc/nCoU2sMpoJy5uVRUyLXLFPgqomAVCvPjQtc+7RVZiFpRhuIWA
         QN7Vh59+YSVKs6MAa0wJpBfOTWLUlhHRCfLYSTo4=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [RFC PATCH 02/15] drm: rcar-du: Add R-Car DSI driver
Date:   Wed, 23 Jun 2021 06:46:43 +0300
Message-Id: <20210623034656.10316-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: LUU HOAI <hoai.luu.ub@renesas.com>

The driver supports the MIPI DSI/CSI-2 TX encoder found in the R-Car V3U
SoC. It currently supports DSI mode only.

Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/Kconfig              |   6 +
 drivers/gpu/drm/rcar-du/Makefile             |   1 +
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c      | 896 +++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h      |  26 +
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h | 172 ++++
 5 files changed, 1101 insertions(+)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index b47e74421e34..8cb94fe90639 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -38,6 +38,12 @@ config DRM_RCAR_LVDS
 	help
 	  Enable support for the R-Car Display Unit embedded LVDS encoders.
 
+config DRM_RCAR_MIPI_DSI
+	tristate "R-Car DU MIPI DSI Encoder Support"
+	depends on DRM && DRM_BRIDGE && OF
+	help
+	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
+
 config DRM_RCAR_VSP
 	bool "R-Car DU VSP Compositor Support" if ARM
 	default y if ARM64
diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 4d1187ccc3e5..adc1b49d02cf 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
 obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
 obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
 obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
+obj-$(CONFIG_DRM_RCAR_MIPI_DSI)	+= rcar_mipi_dsi.o
 
 # 'remote-endpoint' is fixed up at run-time
 DTC_FLAGS_rcar_du_of_lvds_r8a7790 += -Wno-graph_endpoint
diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
new file mode 100644
index 000000000000..ef2a9b283b4e
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -0,0 +1,896 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rcar_mipi_dsi.c  --  R-Car MIPI DSI Encoder
+ *
+ * Copyright (C) 2020 Renesas Electronics Corporation
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+#include "rcar_mipi_dsi_regs.h"
+
+struct rcar_mipi_dsi {
+	struct device *dev;
+	const struct rcar_mipi_dsi_device_info *info;
+	struct reset_control *rstc;
+
+	struct mipi_dsi_host host;
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct drm_connector connector;
+
+	void __iomem *mmio;
+	struct {
+		struct clk *mod;
+		struct clk *extal;
+		struct clk *dsi;
+	} clocks;
+
+	struct drm_display_mode display_mode;
+	enum mipi_dsi_pixel_format format;
+	unsigned int num_data_lanes;
+	unsigned int lanes;
+};
+
+#define bridge_to_rcar_mipi_dsi(b) \
+	container_of(b, struct rcar_mipi_dsi, bridge)
+
+#define connector_to_rcar_mipi_dsi(c) \
+	container_of(c, struct rcar_mipi_dsi, connector)
+
+#define host_to_rcar_mipi_dsi(c) \
+	container_of(c, struct rcar_mipi_dsi, host)
+
+static const u32 phtw[] = {
+	0x01020114, 0x01600115, /* General testing */
+	0x01030116, 0x0102011d, /* General testing */
+	0x011101a4, 0x018601a4, /* 1Gbps testing */
+	0x014201a0, 0x010001a3, /* 1Gbps testing */
+	0x0101011f,		/* 1Gbps testing */
+};
+
+static const u32 phtw2[] = {
+	0x010c0130, 0x010c0140, /* General testing */
+	0x010c0150, 0x010c0180, /* General testing */
+	0x010c0190,
+	0x010a0160, 0x010a0170,
+	0x01800164, 0x01800174,	/* 1Gbps testing */
+};
+
+static const u32 hsfreqrange_table[][2] = {
+	{80000000,   0x00}, {90000000,   0x10}, {100000000,  0x20},
+	{110000000,  0x30}, {120000000,  0x01}, {130000000,  0x11},
+	{140000000,  0x21}, {150000000,  0x31}, {160000000,  0x02},
+	{170000000,  0x12}, {180000000,  0x22}, {190000000,  0x32},
+	{205000000,  0x03}, {220000000,  0x13}, {235000000,  0x23},
+	{250000000,  0x33}, {275000000,  0x04}, {300000000,  0x14},
+	{325000000,  0x25}, {350000000,  0x35}, {400000000,  0x05},
+	{450000000,  0x16}, {500000000,  0x26}, {550000000,  0x37},
+	{600000000,  0x07}, {650000000,  0x18}, {700000000,  0x28},
+	{750000000,  0x39}, {800000000,  0x09}, {850000000,  0x19},
+	{900000000,  0x29}, {950000000,  0x3a}, {1000000000, 0x0a},
+	{1050000000, 0x1a}, {1100000000, 0x2a}, {1150000000, 0x3b},
+	{1200000000, 0x0b}, {1250000000, 0x1b}, {1300000000, 0x2b},
+	{1350000000, 0x3c}, {1400000000, 0x0c}, {1450000000, 0x1c},
+	{1500000000, 0x2c}, {1550000000, 0x3d}, {1600000000, 0x0d},
+	{1650000000, 0x1d}, {1700000000, 0x2e}, {1750000000, 0x3e},
+	{1800000000, 0x0e}, {1850000000, 0x1e}, {1900000000, 0x2f},
+	{1950000000, 0x3f}, {2000000000, 0x0f}, {2050000000, 0x40},
+	{2100000000, 0x41}, {2150000000, 0x42}, {2200000000, 0x43},
+	{2250000000, 0x44}, {2300000000, 0x45}, {2350000000, 0x46},
+	{2400000000, 0x47}, {2450000000, 0x48}, {2500000000, 0x49},
+	{ /* sentinel */ },
+};
+
+struct vco_cntrl_value {
+	u32 min_freq;
+	u32 max_freq;
+	u16 value;
+};
+
+static const struct vco_cntrl_value vco_cntrl_table[] = {
+	{ .min_freq = 40000000,   .max_freq = 55000000,   .value = 0x3f},
+	{ .min_freq = 52500000,   .max_freq = 80000000,   .value = 0x39},
+	{ .min_freq = 80000000,   .max_freq = 110000000,  .value = 0x2f},
+	{ .min_freq = 105000000,  .max_freq = 160000000,  .value = 0x29},
+	{ .min_freq = 160000000,  .max_freq = 220000000,  .value = 0x1f},
+	{ .min_freq = 210000000,  .max_freq = 320000000,  .value = 0x19},
+	{ .min_freq = 320000000,  .max_freq = 440000000,  .value = 0x0f},
+	{ .min_freq = 420000000,  .max_freq = 660000000,  .value = 0x09},
+	{ .min_freq = 630000000,  .max_freq = 1149000000, .value = 0x03},
+	{ .min_freq = 1100000000, .max_freq = 1152000000, .value = 0x01},
+	{ .min_freq = 1150000000, .max_freq = 1250000000, .value = 0x01},
+	{ /* sentinel */ },
+};
+
+static void rcar_mipi_dsi_write(struct rcar_mipi_dsi *mipi_dsi,
+				u32 reg, u32 data)
+{
+	iowrite32(data, mipi_dsi->mmio + reg);
+}
+
+static u32 rcar_mipi_dsi_read(struct rcar_mipi_dsi *mipi_dsi, u32 reg)
+{
+	return ioread32(mipi_dsi->mmio + reg);
+}
+
+static void rcar_mipi_dsi_clr(struct rcar_mipi_dsi *mipi_dsi,
+			     u32 reg, u32 clr)
+{
+	rcar_mipi_dsi_write(mipi_dsi, reg,
+			rcar_mipi_dsi_read(mipi_dsi, reg) & ~clr);
+}
+
+static void rcar_mipi_dsi_set(struct rcar_mipi_dsi *mipi_dsi,
+				u32 reg, u32 set)
+{
+	rcar_mipi_dsi_write(mipi_dsi, reg,
+			    rcar_mipi_dsi_read(mipi_dsi, reg) | set);
+}
+
+static int rcar_mipi_dsi_phtw_test(struct rcar_mipi_dsi *mipi_dsi, u32 phtw)
+{
+	unsigned int timeout;
+	u32 status;
+
+	rcar_mipi_dsi_write(mipi_dsi, PHTW, phtw);
+
+	for (timeout = 10; timeout > 0; --timeout) {
+		status = rcar_mipi_dsi_read(mipi_dsi, PHTW);
+		if (!(status & PHTW_DWEN) &&
+		    !(status & PHTW_CWEN))
+			break;
+
+		usleep_range(1000, 2000);
+	}
+
+	if (!timeout) {
+		dev_err(mipi_dsi->dev,
+			"failed to test phtw with data %x\n", phtw);
+		return -ETIMEDOUT;
+	}
+
+	return timeout;
+}
+
+/* -----------------------------------------------------------------------------
+ * Hardware Setup
+ */
+
+struct dsi_setup_info {
+	unsigned int err;
+	u16 vco_cntrl;
+	u16 prop_cntrl;
+	u16 hsfreqrange;
+	u16 div;
+	unsigned int m;
+	unsigned int n;
+};
+
+static void rcar_mipi_dsi_parametters_calc(struct rcar_mipi_dsi *mipi_dsi,
+					struct clk *clk, unsigned long target,
+					struct dsi_setup_info *setup_info)
+{
+
+	const struct vco_cntrl_value *vco_cntrl;
+	unsigned long fout_target;
+	unsigned long fin, fout;
+	unsigned long hsfreq;
+	unsigned int divider;
+	unsigned int n;
+	unsigned int i;
+	unsigned int err;
+
+	/*
+	 * Calculate Fout = dot clock * ColorDepth / (2 * Lane Count)
+	 * The range out Fout is [40 - 1250] Mhz
+	 */
+	fout_target = target *
+			mipi_dsi_pixel_format_to_bpp(mipi_dsi->format) /
+			(2 * mipi_dsi->lanes);
+	if (fout_target < 40000000 || fout_target > 1250000000)
+		return;
+
+	/* Find vco_cntrl */
+	for (vco_cntrl = vco_cntrl_table; vco_cntrl->min_freq != 0; vco_cntrl++) {
+		if (fout_target > vco_cntrl->min_freq &&
+			fout_target <= vco_cntrl->max_freq) {
+			setup_info->vco_cntrl = vco_cntrl->value;
+			if (fout_target >= 1150000000)
+				setup_info->prop_cntrl = 0x0c;
+			else
+				setup_info->prop_cntrl = 0x0b;
+			break;
+		}
+	}
+
+	/* Add divider */
+	setup_info->div = (setup_info->vco_cntrl & 0x30) >> 4;
+
+	/* Find hsfreqrange */
+	hsfreq = fout_target * 2;
+	for (i = 0; i < ARRAY_SIZE(hsfreqrange_table); i++) {
+		if (hsfreq > hsfreqrange_table[i][0] &&
+			hsfreq <= hsfreqrange_table[i+1][0]) {
+			setup_info->hsfreqrange = hsfreqrange_table[i+1][1];
+			break;
+		}
+	}
+
+	/*
+	 * Calculate n and m for PLL clock
+	 * Following the HW manual the ranges of n and m are
+	 * n = [3-8] and m = [64-625]
+	 */
+	fin = clk_get_rate(clk);
+	divider = 1 << setup_info->div;
+	for (n = 3; n < 9; n++) {
+		unsigned long fpfd;
+		unsigned int m;
+
+		fpfd = fin / n;
+
+		for (m = 64; m < 626; m++) {
+			fout = fpfd * m / divider;
+			err = abs((long)(fout - fout_target) * 10000 /
+					(long)fout_target);
+			if (err < setup_info->err) {
+				setup_info->m = m - 2;
+				setup_info->n = n - 1;
+				setup_info->err = err;
+				if (err == 0)
+					goto done;
+			}
+		}
+	}
+
+done:
+	dev_dbg(mipi_dsi->dev,
+		"%pC %lu Hz -> Fout %lu Hz (target %lu Hz, error %d.%02u%%), PLL M/N/DIV %u/%u/%u\n",
+		clk, fin, fout, fout_target, setup_info->err / 100,
+		setup_info->err % 100, setup_info->m,
+		setup_info->n, setup_info->div);
+	dev_dbg(mipi_dsi->dev,
+		"vco_cntrl = 0x%x\tprop_cntrl = 0x%x\thsfreqrange = 0x%x\n",
+		setup_info->vco_cntrl,
+		setup_info->prop_cntrl,
+		setup_info->hsfreqrange);
+}
+
+static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *mipi_dsi)
+{
+	struct drm_display_mode *mode = &mipi_dsi->display_mode;
+	u32 setr;
+	u32 vprmset0r;
+	u32 vprmset1r;
+	u32 vprmset2r;
+	u32 vprmset3r;
+	u32 vprmset4r;
+
+	/* Configuration for Pixel Stream and Packet Header */
+	if (mipi_dsi_pixel_format_to_bpp(mipi_dsi->format) == 24)
+		rcar_mipi_dsi_write(mipi_dsi, TXVMPSPHSETR,
+					TXVMPSPHSETR_DT_RGB24);
+	else if (mipi_dsi_pixel_format_to_bpp(mipi_dsi->format) == 18)
+		rcar_mipi_dsi_write(mipi_dsi, TXVMPSPHSETR,
+					TXVMPSPHSETR_DT_RGB18);
+	else if (mipi_dsi_pixel_format_to_bpp(mipi_dsi->format) == 16)
+		rcar_mipi_dsi_write(mipi_dsi, TXVMPSPHSETR,
+					TXVMPSPHSETR_DT_RGB16);
+	else {
+		dev_warn(mipi_dsi->dev, "unsupported format");
+		return;
+	}
+
+	/* Configuration for Blanking sequence and Input Pixel */
+	setr = TXVMSETR_HSABPEN_EN | TXVMSETR_HBPBPEN_EN |
+	       TXVMSETR_HFPBPEN_EN | TXVMSETR_SYNSEQ_PULSES |
+	       TXVMSETR_PIXWDTH | TXVMSETR_VSTPM;
+	rcar_mipi_dsi_write(mipi_dsi, TXVMSETR, setr);
+
+	/* Configuration for Video Parameters */
+	vprmset0r = ((mode->flags & DRM_MODE_FLAG_PVSYNC) ?
+		TXVMVPRMSET0R_VSPOL_HIG : TXVMVPRMSET0R_VSPOL_LOW) |
+		((mode->flags & DRM_MODE_FLAG_PHSYNC) ?
+		TXVMVPRMSET0R_HSPOL_HIG : TXVMVPRMSET0R_HSPOL_LOW) |
+		TXVMVPRMSET0R_CSPC_RGB | TXVMVPRMSET0R_BPP_24;
+
+	vprmset1r = TXVMVPRMSET1R_VACTIVE(mode->vdisplay) |
+		    TXVMVPRMSET1R_VSA(mode->vsync_end - mode->vsync_start);
+
+	vprmset2r = TXVMVPRMSET2R_VFP(mode->vsync_start - mode->vdisplay) |
+		    TXVMVPRMSET2R_VBP(mode->vtotal - mode->vsync_end);
+
+	vprmset3r = TXVMVPRMSET3R_HACTIVE(mode->hdisplay) |
+		    TXVMVPRMSET3R_HSA(mode->hsync_end - mode->hsync_start);
+
+	vprmset4r = TXVMVPRMSET4R_HFP(mode->hsync_start - mode->hdisplay) |
+		    TXVMVPRMSET4R_HBP(mode->htotal - mode->hsync_end);
+
+	rcar_mipi_dsi_write(mipi_dsi, TXVMVPRMSET0R, vprmset0r);
+	rcar_mipi_dsi_write(mipi_dsi, TXVMVPRMSET1R, vprmset1r);
+	rcar_mipi_dsi_write(mipi_dsi, TXVMVPRMSET2R, vprmset2r);
+	rcar_mipi_dsi_write(mipi_dsi, TXVMVPRMSET3R, vprmset3r);
+	rcar_mipi_dsi_write(mipi_dsi, TXVMVPRMSET4R, vprmset4r);
+}
+
+static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *mipi_dsi)
+{
+	struct drm_display_mode *mode = &mipi_dsi->display_mode;
+	struct dsi_setup_info setup_info = {.err = -1 };
+	unsigned int timeout;
+	int ret, i;
+	int dsi_format;
+	u32 phy_setup;
+	u32 clockset2, clockset3;
+	u32 ppisetr;
+	u32 vclkset;
+
+	/* Checking valid format */
+	dsi_format = mipi_dsi_pixel_format_to_bpp(mipi_dsi->format);
+	if (dsi_format < 0) {
+		dev_warn(mipi_dsi->dev, "invalid format");
+		return -EINVAL;
+	}
+
+	/* Parametters Calulation */
+	rcar_mipi_dsi_parametters_calc(mipi_dsi, mipi_dsi->clocks.extal,
+					mode->clock * 1000, &setup_info);
+
+	/* LPCLK enable */
+	rcar_mipi_dsi_set(mipi_dsi, LPCLKSET, LPCLKSET_CKEN);
+
+	/* CFGCLK enabled */
+	rcar_mipi_dsi_set(mipi_dsi, CFGCLKSET, CFGCLKSET_CKEN);
+
+	rcar_mipi_dsi_clr(mipi_dsi, PHYSETUP, PHYSETUP_RSTZ);
+	rcar_mipi_dsi_clr(mipi_dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
+
+	rcar_mipi_dsi_set(mipi_dsi, PHTC, PHTC_TESTCLR);
+	rcar_mipi_dsi_clr(mipi_dsi, PHTC, PHTC_TESTCLR);
+
+	/* PHY setting */
+	phy_setup = rcar_mipi_dsi_read(mipi_dsi, PHYSETUP);
+	phy_setup &= ~PHYSETUP_HSFREQRANGE_MASK;
+	phy_setup |= PHYSETUP_HSFREQRANGE(setup_info.hsfreqrange);
+	rcar_mipi_dsi_write(mipi_dsi, PHYSETUP, phy_setup);
+
+	for (i = 0; i < ARRAY_SIZE(phtw); i++) {
+		ret = rcar_mipi_dsi_phtw_test(mipi_dsi, phtw[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* PLL Clock Setting */
+	rcar_mipi_dsi_clr(mipi_dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
+	rcar_mipi_dsi_set(mipi_dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
+	rcar_mipi_dsi_clr(mipi_dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
+
+	clockset2 = CLOCKSET2_M(setup_info.m) | CLOCKSET2_N(setup_info.n) |
+		    CLOCKSET2_VCO_CNTRL(setup_info.vco_cntrl);
+	clockset3 = CLOCKSET3_PROP_CNTRL(setup_info.prop_cntrl) |
+		    CLOCKSET3_INT_CNTRL(0) |
+		    CLOCKSET3_CPBIAS_CNTRL(0x10) |
+		    CLOCKSET3_GMP_CNTRL(1);
+	rcar_mipi_dsi_write(mipi_dsi, CLOCKSET2, clockset2);
+	rcar_mipi_dsi_write(mipi_dsi, CLOCKSET3, clockset3);
+
+	rcar_mipi_dsi_clr(mipi_dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
+	rcar_mipi_dsi_set(mipi_dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
+	udelay(10);
+	rcar_mipi_dsi_clr(mipi_dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
+
+	ppisetr = PPISETR_DLEN_3 | PPISETR_CLEN;
+	rcar_mipi_dsi_write(mipi_dsi, PPISETR, ppisetr);
+
+	rcar_mipi_dsi_set(mipi_dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
+	rcar_mipi_dsi_set(mipi_dsi, PHYSETUP, PHYSETUP_RSTZ);
+	usleep_range(400, 500);
+
+	/* Checking PPI clock status register */
+	for (timeout = 10; timeout > 0; --timeout) {
+		if ((rcar_mipi_dsi_read(mipi_dsi, PPICLSR) & PPICLSR_STPST) &&
+		    (rcar_mipi_dsi_read(mipi_dsi, PPIDLSR) & PPIDLSR_STPST) &&
+		    (rcar_mipi_dsi_read(mipi_dsi, CLOCKSET1) & CLOCKSET1_LOCK))
+			break;
+
+		usleep_range(1000, 2000);
+	}
+
+	if (!timeout) {
+		dev_err(mipi_dsi->dev, "failed to enable PPI clock\n");
+		return -ETIMEDOUT;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(phtw2); i++) {
+		ret = rcar_mipi_dsi_phtw_test(mipi_dsi, phtw2[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Enable DOT clock */
+	vclkset = VCLKSET_CKEN;
+	rcar_mipi_dsi_set(mipi_dsi, VCLKSET, vclkset);
+
+	if (dsi_format == 24)
+		vclkset |= VCLKSET_BPP_24;
+	else if (dsi_format == 18)
+		vclkset |= VCLKSET_BPP_18;
+	else if (dsi_format == 16)
+		vclkset |= VCLKSET_BPP_16;
+	else {
+		dev_warn(mipi_dsi->dev, "unsupported format");
+		return -EINVAL;
+	}
+	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_DIV(setup_info.div) |
+			VCLKSET_LANE(mipi_dsi->lanes - 1);
+
+	rcar_mipi_dsi_set(mipi_dsi, VCLKSET, vclkset);
+
+	/* After setting VCLKSET register, enable VCLKEN */
+	rcar_mipi_dsi_set(mipi_dsi, VCLKEN, VCLKEN_CKEN);
+
+	dev_dbg(mipi_dsi->dev, "DSI device is started\n");
+
+	return 0;
+}
+
+static void rcar_mipi_dsi_shutdown(struct rcar_mipi_dsi *mipi_dsi)
+{
+	rcar_mipi_dsi_clr(mipi_dsi, PHYSETUP, PHYSETUP_RSTZ);
+	rcar_mipi_dsi_clr(mipi_dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
+
+	dev_dbg(mipi_dsi->dev, "DSI device is shutdown\n");
+}
+
+static int rcar_mipi_dsi_start_hs_clock(struct rcar_mipi_dsi *mipi_dsi)
+{
+	/*
+	 * In HW manual, we need to check TxDDRClkHS-Q Stable? but it dont
+	 * write how to check. So we skip this check in this patch
+	 */
+	unsigned int timeout;
+	u32 status;
+
+	/* Start HS clock */
+	rcar_mipi_dsi_set(mipi_dsi, PPICLCR, PPICLCR_TXREQHS);
+
+	for (timeout = 10; timeout > 0; --timeout) {
+		status = rcar_mipi_dsi_read(mipi_dsi, PPICLSR);
+
+		if (status & PPICLSR_TOHS) {
+			rcar_mipi_dsi_set(mipi_dsi, PPICLSCR, PPICLSCR_TOHS);
+			break;
+		}
+
+		usleep_range(1000, 2000);
+	}
+
+	if (!timeout) {
+		dev_err(mipi_dsi->dev, "failed to enable HS clock\n");
+		return -ETIMEDOUT;
+	}
+
+	dev_dbg(mipi_dsi->dev, "Start High Speed Clock");
+
+	return 0;
+}
+
+static int rcar_mipi_dsi_start_video(struct rcar_mipi_dsi *mipi_dsi)
+{
+	unsigned int timeout;
+	u32 status;
+
+	/* Check status of Tranmission */
+	for (timeout = 10; timeout > 0; --timeout) {
+		status = rcar_mipi_dsi_read(mipi_dsi, LINKSR);
+		if (!(status & LINKSR_LPBUSY) &&
+		    !(status & LINKSR_HSBUSY)) {
+			rcar_mipi_dsi_clr(mipi_dsi, TXVMCR, TXVMCR_VFCLR);
+			break;
+		}
+
+		usleep_range(1000, 2000);
+	}
+
+	if (!timeout) {
+		dev_err(mipi_dsi->dev, "Failed to enable Video clock\n");
+		return -ETIMEDOUT;
+	}
+
+	/* Check Clear Video mode FIFO */
+	for (timeout = 10; timeout > 0; --timeout) {
+		status = rcar_mipi_dsi_read(mipi_dsi, TXVMSR);
+		if (status & TXVMSR_VFRDY) {
+			rcar_mipi_dsi_set(mipi_dsi, TXVMCR, TXVMCR_EN_VIDEO);
+			break;
+		}
+
+		usleep_range(1000, 2000);
+	}
+
+	if (!timeout) {
+		dev_err(mipi_dsi->dev, "Failed to enable Video clock\n");
+		return -ETIMEDOUT;
+	}
+
+	/* Check Video transmission */
+	for (timeout = 10; timeout > 0; --timeout) {
+		status = rcar_mipi_dsi_read(mipi_dsi, TXVMSR);
+		if (status & TXVMSR_RDY)
+			break;
+
+		usleep_range(1000, 2000);
+	}
+
+	if (!timeout) {
+		dev_err(mipi_dsi->dev, "Failed to enable Video clock\n");
+		return -ETIMEDOUT;
+	}
+
+	dev_dbg(mipi_dsi->dev, "Start video transferring");
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * Bridge
+ */
+
+static int rcar_mipi_dsi_attach(struct drm_bridge *bridge,
+				enum drm_bridge_attach_flags flags)
+{
+	struct rcar_mipi_dsi *mipi_dsi = bridge_to_rcar_mipi_dsi(bridge);
+
+	return drm_bridge_attach(bridge->encoder, mipi_dsi->next_bridge, bridge,
+				 flags);
+}
+
+static void rcar_mipi_dsi_mode_set(struct drm_bridge *bridge,
+				   const struct drm_display_mode *mode,
+				   const struct drm_display_mode *adjusted_mode)
+{
+	struct rcar_mipi_dsi *mipi_dsi = bridge_to_rcar_mipi_dsi(bridge);
+
+	mipi_dsi->display_mode = *adjusted_mode;
+}
+
+static void rcar_mipi_dsi_enable(struct drm_bridge *bridge)
+{
+	struct rcar_mipi_dsi *mipi_dsi = bridge_to_rcar_mipi_dsi(bridge);
+	int ret;
+
+	rcar_mipi_dsi_set_display_timing(mipi_dsi);
+
+	ret = rcar_mipi_dsi_start_hs_clock(mipi_dsi);
+	if (ret < 0)
+		return;
+
+	ret = rcar_mipi_dsi_start_video(mipi_dsi);
+	if (ret < 0)
+		return;
+
+}
+
+static enum drm_mode_status
+rcar_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
+				const struct drm_display_info *info,
+				const struct drm_display_mode *mode)
+{
+	if (mode->clock > 297000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static const struct drm_bridge_funcs rcar_mipi_dsi_bridge_ops = {
+	.attach = rcar_mipi_dsi_attach,
+	.mode_set = rcar_mipi_dsi_mode_set,
+	.enable = rcar_mipi_dsi_enable,
+	.mode_valid = rcar_mipi_dsi_bridge_mode_valid,
+};
+
+/* -----------------------------------------------------------------------------
+ * Clock Setting
+ */
+
+int rcar_mipi_dsi_clk_enable(struct drm_bridge *bridge)
+{
+	struct rcar_mipi_dsi *mipi_dsi = bridge_to_rcar_mipi_dsi(bridge);
+	int ret;
+
+	reset_control_deassert(mipi_dsi->rstc);
+
+	ret = clk_prepare_enable(mipi_dsi->clocks.mod);
+	if (ret < 0)
+		return ret;
+
+	ret = clk_prepare_enable(mipi_dsi->clocks.dsi);
+	if (ret < 0)
+		return ret;
+
+	ret = rcar_mipi_dsi_startup(mipi_dsi);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rcar_mipi_dsi_clk_enable);
+
+void rcar_mipi_dsi_clk_disable(struct drm_bridge *bridge)
+{
+	struct rcar_mipi_dsi *mipi_dsi = bridge_to_rcar_mipi_dsi(bridge);
+
+	rcar_mipi_dsi_shutdown(mipi_dsi);
+
+	/* Disable DSI clock and reset HW */
+	clk_disable_unprepare(mipi_dsi->clocks.dsi);
+
+	clk_disable_unprepare(mipi_dsi->clocks.mod);
+
+	reset_control_assert(mipi_dsi->rstc);
+}
+EXPORT_SYMBOL_GPL(rcar_mipi_dsi_clk_disable);
+
+/* -----------------------------------------------------------------------------
+ * Host setting
+ */
+
+static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
+					struct mipi_dsi_device *device)
+{
+	struct rcar_mipi_dsi *mipi_dsi = host_to_rcar_mipi_dsi(host);
+
+	if (device->lanes > mipi_dsi->num_data_lanes)
+		return -EINVAL;
+
+	mipi_dsi->lanes = device->lanes;
+	mipi_dsi->format = device->format;
+
+	return 0;
+}
+
+static int rcar_mipi_dsi_host_detach(struct mipi_dsi_host *host,
+					struct mipi_dsi_device *device)
+{
+	return 0;
+}
+
+static const struct mipi_dsi_host_ops rcar_mipi_dsi_host_ops = {
+	.attach = rcar_mipi_dsi_host_attach,
+	.detach = rcar_mipi_dsi_host_detach,
+};
+
+/* -----------------------------------------------------------------------------
+ * Probe & Remove
+ */
+
+static int rcar_mipi_dsi_parse_dt(struct rcar_mipi_dsi *mipi_dsi)
+{
+	struct device_node *local_output = NULL;
+	struct device_node *remote_input = NULL;
+	struct device_node *remote = NULL;
+	struct device_node *node;
+	struct property *prop;
+	bool is_bridge = false;
+	int ret = 0;
+	int len, num_lanes;
+
+	local_output = of_graph_get_endpoint_by_regs(mipi_dsi->dev->of_node,
+						     1, 0);
+	if (!local_output) {
+		dev_dbg(mipi_dsi->dev, "unconnected port@1\n");
+		ret = -ENODEV;
+		goto done;
+	}
+
+	/*
+	 * Locate the connected entity and
+	 * infer its type from the number of endpoints.
+	 */
+	remote = of_graph_get_remote_port_parent(local_output);
+	if (!remote) {
+		dev_dbg(mipi_dsi->dev, "unconnected endpoint %pOF\n",
+				local_output);
+		ret = -ENODEV;
+		goto done;
+	}
+
+	if (!of_device_is_available(remote)) {
+		dev_dbg(mipi_dsi->dev, "connected entity %pOF is disabled\n",
+				remote);
+		ret = -ENODEV;
+		goto done;
+	}
+
+	remote_input = of_graph_get_remote_endpoint(local_output);
+
+	for_each_endpoint_of_node(remote, node) {
+		if (node != remote_input) {
+			/*
+			 * The endpoint which is not input node must be bridge
+			 */
+			is_bridge = true;
+			of_node_put(node);
+			break;
+		}
+	}
+
+	if (!is_bridge) {
+		ret = -ENODEV;
+		goto done;
+	}
+
+	mipi_dsi->next_bridge = of_drm_find_bridge(remote);
+	if (!mipi_dsi->next_bridge) {
+		ret = -EPROBE_DEFER;
+		goto done;
+	}
+
+	/* Get lanes information */
+	prop = of_find_property(local_output, "data-lanes", &len);
+	if (!prop) {
+		mipi_dsi->num_data_lanes = 4;
+		dev_dbg(mipi_dsi->dev,
+			"failed to find data lane information, using default\n");
+		goto done;
+	}
+
+	num_lanes = len / sizeof(u32);
+
+	if (num_lanes < 1 || num_lanes > 4) {
+		dev_err(mipi_dsi->dev, "data lanes definition is not correct\n");
+		return -EINVAL;
+	}
+
+	mipi_dsi->num_data_lanes = num_lanes;
+done:
+	of_node_put(local_output);
+	of_node_put(remote_input);
+	of_node_put(remote);
+
+	return ret;
+}
+
+static struct clk *rcar_mipi_dsi_get_clock(struct rcar_mipi_dsi *mipi_dsi,
+					   const char *name,
+					   bool optional)
+{
+	struct clk *clk;
+
+	clk = devm_clk_get(mipi_dsi->dev, name);
+	if (!IS_ERR(clk))
+		return clk;
+
+	if (PTR_ERR(clk) == -ENOENT && optional)
+		return NULL;
+
+	if (PTR_ERR(clk) != -EPROBE_DEFER)
+		dev_err(mipi_dsi->dev, "failed to get %s clock\n",
+			name ? name : "module");
+
+	return clk;
+}
+
+static int rcar_mipi_dsi_get_clocks(struct rcar_mipi_dsi *mipi_dsi)
+{
+	mipi_dsi->clocks.mod = rcar_mipi_dsi_get_clock(mipi_dsi, NULL, false);
+	if (IS_ERR(mipi_dsi->clocks.mod))
+		return PTR_ERR(mipi_dsi->clocks.mod);
+
+	mipi_dsi->clocks.extal = rcar_mipi_dsi_get_clock(mipi_dsi, "extal",
+							 true);
+	if (IS_ERR(mipi_dsi->clocks.extal))
+		return PTR_ERR(mipi_dsi->clocks.extal);
+
+	mipi_dsi->clocks.dsi = rcar_mipi_dsi_get_clock(mipi_dsi, "dsi", true);
+	if (IS_ERR(mipi_dsi->clocks.dsi))
+		return PTR_ERR(mipi_dsi->clocks.dsi);
+
+	if (!mipi_dsi->clocks.extal && !mipi_dsi->clocks.dsi) {
+		dev_err(mipi_dsi->dev,
+			"no input clock (extal, dclkin.0)\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rcar_mipi_dsi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rcar_mipi_dsi *mipi_dsi;
+	struct resource *mem;
+	int ret;
+
+	mipi_dsi = devm_kzalloc(&pdev->dev, sizeof(*mipi_dsi), GFP_KERNEL);
+	if (mipi_dsi == NULL)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, mipi_dsi);
+
+	mipi_dsi->dev = dev;
+	mipi_dsi->info = of_device_get_match_data(&pdev->dev);
+
+	ret = rcar_mipi_dsi_parse_dt(mipi_dsi);
+	if (ret < 0)
+		return ret;
+
+	/* Initialize the DRM bridge. */
+	mipi_dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;
+	mipi_dsi->bridge.of_node = pdev->dev.of_node;
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	mipi_dsi->mmio = devm_ioremap_resource(&pdev->dev, mem);
+	if (IS_ERR(mipi_dsi->mmio))
+		return PTR_ERR(mipi_dsi->mmio);
+
+	ret = rcar_mipi_dsi_get_clocks(mipi_dsi);
+	if (ret < 0)
+		return ret;
+
+	mipi_dsi->rstc = devm_reset_control_get(&pdev->dev, NULL);
+	if (IS_ERR(mipi_dsi->rstc)) {
+		dev_err(&pdev->dev, "failed to get cpg reset\n");
+		return PTR_ERR(mipi_dsi->rstc);
+	}
+
+	/* Initialize the DST host. */
+	mipi_dsi->host.dev = dev;
+	mipi_dsi->host.ops = &rcar_mipi_dsi_host_ops;
+	ret = mipi_dsi_host_register(&mipi_dsi->host);
+	if (ret < 0)
+		return ret;
+
+	drm_bridge_add(&mipi_dsi->bridge);
+
+	return 0;
+}
+
+static int rcar_mipi_dsi_remove(struct platform_device *pdev)
+{
+	struct rcar_mipi_dsi *mipi_dsi = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&mipi_dsi->bridge);
+
+	mipi_dsi_host_unregister(&mipi_dsi->host);
+
+	return 0;
+}
+
+static const struct of_device_id rcar_mipi_dsi_of_table[] = {
+	{ .compatible = "renesas,r8a779a0-mipi-dsi" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, rcar_mipi_dsi_of_table);
+
+static struct platform_driver rcar_mipi_dsi_platform_driver = {
+	.probe          = rcar_mipi_dsi_probe,
+	.remove         = rcar_mipi_dsi_remove,
+	.driver         = {
+		.name   = "rcar-mipi-dsi",
+		.of_match_table = rcar_mipi_dsi_of_table,
+	},
+};
+
+module_platform_driver(rcar_mipi_dsi_platform_driver);
+
+MODULE_DESCRIPTION("Renesas R-Car MIPI DSI Encoder Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
new file mode 100644
index 000000000000..a937ab7ddcd4
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * rcar_mipi_dsi.h  --  R-Car MIPI_DSI Encoder
+ *
+ * Copyright (C) 2020 Renesas Electronics Corporation
+ */
+
+#ifndef __RCAR_MIPI_DSI_H__
+#define __RCAR_MIPI_DSI_H__
+
+struct drm_bridge;
+
+#if IS_ENABLED(CONFIG_DRM_RCAR_MIPI_DSI)
+int rcar_mipi_dsi_clk_enable(struct drm_bridge *bridge);
+void rcar_mipi_dsi_clk_disable(struct drm_bridge *bridge);
+
+#else
+static inline int rcar_mipi_dsi_clk_enable(struct drm_bridge *bridge)
+{
+	return -ENOSYS;
+}
+static inline void rcar_mipi_dsi_clk_disable(struct drm_bridge *bridge) { }
+
+#endif /* CONFIG_DRM_RCAR_MIPI_DSI */
+
+#endif /* __RCAR_MIPI_DSI_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
new file mode 100644
index 000000000000..0e7a9274749f
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
@@ -0,0 +1,172 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * rcar_mipi_dsi_regs.h  --  R-Car MIPI DSI Interface Registers Definitions
+ *
+ * Copyright (C) 2020 Renesas Electronics Corporation
+ */
+
+#ifndef __RCAR_MIPI_DSI_REGS_H__
+#define __RCAR_MIPI_DSI_REGS_H__
+
+#define LINKSR				0x010
+#define LINKSR_LPBUSY			(1 << 1)
+#define LINKSR_HSBUSY			(1 << 0)
+
+/*
+ * Video Mode Register
+ */
+#define TXVMSETR			0x180
+#define TXVMSETR_SYNSEQ_PULSES		(0 << 16)
+#define TXVMSETR_SYNSEQ_EVENTS		(1 << 16)
+#define TXVMSETR_VSTPM			(1 << 15)
+#define TXVMSETR_PIXWDTH		(1 << 8)
+#define TXVMSETR_VSEN_EN		(1 << 4)
+#define TXVMSETR_VSEN_DIS		(0 << 4)
+#define TXVMSETR_HFPBPEN_EN		(1 << 2)
+#define TXVMSETR_HFPBPEN_DIS		(0 << 2)
+#define TXVMSETR_HBPBPEN_EN		(1 << 1)
+#define TXVMSETR_HBPBPEN_DIS		(0 << 1)
+#define TXVMSETR_HSABPEN_EN		(1 << 0)
+#define TXVMSETR_HSABPEN_DIS		(0 << 0)
+
+#define TXVMCR				0x190
+#define TXVMCR_VFCLR			(1 << 12)
+#define TXVMCR_EN_VIDEO			(1 << 0)
+
+#define TXVMSR				0x1a0
+#define TXVMSR_STR			(1 << 16)
+#define TXVMSR_VFRDY			(1 << 12)
+#define TXVMSR_ACT			(1 << 8)
+#define TXVMSR_RDY			(1 << 0)
+
+#define TXVMSCR				0x1a4
+#define TXVMSCR_STR			(1 << 16)
+
+#define TXVMPSPHSETR			0x1c0
+#define TXVMPSPHSETR_DT_RGB16		(0x0e << 16)
+#define TXVMPSPHSETR_DT_RGB18		(0x1e << 16)
+#define TXVMPSPHSETR_DT_RGB18_LS	(0x2e << 16)
+#define TXVMPSPHSETR_DT_RGB24		(0x3e << 16)
+#define TXVMPSPHSETR_DT_YCBCR16		(0x2c << 16)
+
+#define TXVMVPRMSET0R			0x1d0
+#define TXVMVPRMSET0R_HSPOL_HIG		(0 << 17)
+#define TXVMVPRMSET0R_HSPOL_LOW		(1 << 17)
+#define TXVMVPRMSET0R_VSPOL_HIG		(0 << 16)
+#define TXVMVPRMSET0R_VSPOL_LOW		(1 << 16)
+#define TXVMVPRMSET0R_CSPC_RGB		(0 << 4)
+#define TXVMVPRMSET0R_CSPC_YCbCr	(1 << 4)
+#define TXVMVPRMSET0R_BPP_16		(0 << 0)
+#define TXVMVPRMSET0R_BPP_18		(1 << 0)
+#define TXVMVPRMSET0R_BPP_24		(2 << 0)
+
+#define TXVMVPRMSET1R			0x1d4
+#define TXVMVPRMSET1R_VACTIVE(x)	(((x) & 0x7fff) << 16)
+#define TXVMVPRMSET1R_VSA(x)		(((x) & 0xfff) << 0)
+
+#define TXVMVPRMSET2R			0x1d8
+#define TXVMVPRMSET2R_VFP(x)		(((x) & 0x1fff) << 16)
+#define TXVMVPRMSET2R_VBP(x)		(((x) & 0x1fff) << 0)
+
+#define TXVMVPRMSET3R			0x1dc
+#define TXVMVPRMSET3R_HACTIVE(x)	(((x) & 0x7fff) << 16)
+#define TXVMVPRMSET3R_HSA(x)		(((x) & 0xfff) << 0)
+
+#define TXVMVPRMSET4R			0x1e0
+#define TXVMVPRMSET4R_HFP(x)		(((x) & 0x1fff) << 16)
+#define TXVMVPRMSET4R_HBP(x)		(((x) & 0x1fff) << 0)
+
+/*
+ * PHY-Protocol Interface (PPI) Registers
+ */
+#define PPISETR				0x700
+#define PPISETR_DLEN_0			(0x1 << 0)
+#define PPISETR_DLEN_1			(0x3 << 0)
+#define PPISETR_DLEN_2			(0x7 << 0)
+#define PPISETR_DLEN_3			(0xf << 0)
+#define PPISETR_CLEN			(1 << 8)
+
+#define PPICLCR				0x710
+#define PPICLCR_TXREQHS			(1 << 8)
+#define PPICLCR_TXULPSEXT		(1 << 1)
+#define PPICLCR_TXULPSCLK		(1 << 0)
+
+#define PPICLSR				0x720
+#define PPICLSR_HSTOLP			(1 << 27)
+#define PPICLSR_TOHS			(1 << 26)
+#define PPICLSR_STPST			(1 << 0)
+
+#define PPICLSCR			0x724
+#define PPICLSCR_HSTOLP			(1 << 27)
+#define PPICLSCR_TOHS			(1 << 26)
+
+#define PPIDLSR				0x760
+#define PPIDLSR_STPST			(0xf << 0)
+
+/*
+ * Clocks registers
+ */
+#define LPCLKSET			0x1000
+#define LPCLKSET_CKEN			(1 << 8)
+#define LPCLKSET_LPCLKDIV(x)		(((x) & 0x3f) << 0)
+
+#define CFGCLKSET			0x1004
+#define CFGCLKSET_CKEN			(1 << 8)
+#define CFGCLKSET_CFGCLKDIV(x)		(((x) & 0x3f) << 0)
+
+#define DOTCLKDIV			0x1008
+#define DOTCLKDIV_CKEN			(1 << 8)
+#define DOTCLKDIV_DOTCLKDIV(x)		(((x) & 0x3f) << 0)
+
+#define VCLKSET				0x100c
+#define VCLKSET_CKEN			(1 << 16)
+#define VCLKSET_COLOR_RGB		(0 << 8)
+#define VCLKSET_COLOR_YCC		(1 << 8)
+#define VCLKSET_DIV(x)			(((x) & 0x3) << 4)
+#define VCLKSET_BPP_16			(0 << 2)
+#define VCLKSET_BPP_18			(1 << 2)
+#define VCLKSET_BPP_18L			(2 << 2)
+#define VCLKSET_BPP_24			(3 << 2)
+#define VCLKSET_LANE(x)			(((x) & 0x3) << 0)
+
+#define VCLKEN				0x1010
+#define VCLKEN_CKEN			(1 << 0)
+
+#define PHYSETUP			0x1014
+#define PHYSETUP_HSFREQRANGE(x)		(((x) & 0x7f) << 16)
+#define PHYSETUP_HSFREQRANGE_MASK	(0x7f << 16)
+#define PHYSETUP_CFGCLKFREQRANGE(x)	(((x) & 0x3f) << 8)
+#define PHYSETUP_SHUTDOWNZ		(1 << 1)
+#define PHYSETUP_RSTZ			(1 << 0)
+
+#define CLOCKSET1			0x101c
+#define CLOCKSET1_LOCK_PHY		(1 << 17)
+#define CLOCKSET1_LOCK			(1 << 16)
+#define CLOCKSET1_CLKSEL		(1 << 8)
+#define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
+#define CLOCKSET1_CLKINSEL_DIG		(1 << 2)
+#define CLOCKSET1_CLKINSEL_DU		(1 << 3)
+#define CLOCKSET1_SHADOW_CLEAR		(1 << 1)
+#define CLOCKSET1_UPDATEPLL		(1 << 0)
+
+#define CLOCKSET2			0x1020
+#define CLOCKSET2_M(x)			(((x) & 0xfff) << 16)
+#define CLOCKSET2_VCO_CNTRL(x)		(((x) & 0x3f) << 8)
+#define CLOCKSET2_N(x)			(((x) & 0xf) << 0)
+
+#define CLOCKSET3			0x1024
+#define CLOCKSET3_PROP_CNTRL(x)		(((x) & 0x3f) << 24)
+#define CLOCKSET3_INT_CNTRL(x)		(((x) & 0x3f) << 16)
+#define CLOCKSET3_CPBIAS_CNTRL(x)	(((x) & 0x7f) << 8)
+#define CLOCKSET3_GMP_CNTRL(x)		(((x) & 0x3) << 0)
+
+#define PHTW				0x1034
+#define PHTW_DWEN			(1 << 24)
+#define PHTW_TESTDIN_DATA(x)		(((x) & 0xff) << 16)
+#define PHTW_CWEN			(1 << 8)
+#define PHTW_TESTDIN_CODE(x)		(((x) & 0xff) << 0)
+
+#define PHTC				0x103c
+#define PHTC_TESTCLR			(1 << 0)
+
+#endif /* __RCAR_MIPI_DSI_REGS_H__ */
-- 
Regards,

Laurent Pinchart

