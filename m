Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A42C863ED0A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Dec 2022 10:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbiLAJ5J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Dec 2022 04:57:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbiLAJ5D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2022 04:57:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C9795817;
        Thu,  1 Dec 2022 01:57:01 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 086886D0;
        Thu,  1 Dec 2022 10:56:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669888617;
        bh=t9tBIEv/uPykrIY5yOLQApwzv1u9YPD61ScQWQB6r6Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZrjnEWn9zEcj7Sh6JuG+TvRy4N4fnvQsVQfFTIIsGhZEfyVLjRQCvzYTgYrZn2zZ2
         zMKHVESw4L2XmdJ86zxXEZv1/J+Js8pZ5SLC7EXNgy76UadVZoLfO0SHG93m0cQwhX
         WDBMfnX3cyM9D10K3PXE/t7PNScT8Z0hzH+uwGT8=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v5 7/7] drm: rcar-du: dsi: Add r8A779g0 support
Date:   Thu,  1 Dec 2022 11:56:31 +0200
Message-Id: <20221201095631.89448-8-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201095631.89448-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221201095631.89448-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add DSI support for r8a779g0. The main differences to r8a779a0 are in
the PLL and PHTW setups.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c      | 497 ++++++++++++++-----
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h |   6 +-
 2 files changed, 375 insertions(+), 128 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index a7f2b7f66a17..e10e4d4b89a2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -28,6 +29,31 @@
 #include "rcar_mipi_dsi.h"
 #include "rcar_mipi_dsi_regs.h"
 
+#define MHZ(v) ((u32)((v) * 1000000U))
+
+enum rcar_mipi_dsi_hw_model {
+	RCAR_DSI_V3U,
+	RCAR_DSI_V4H,
+};
+
+struct rcar_mipi_dsi_device_info {
+	enum rcar_mipi_dsi_hw_model model;
+
+	const struct dsi_clk_config *clk_cfg;
+
+	u8 clockset2_m_offset;
+
+	u8 n_min;
+	u8 n_max;
+	u8 n_mul;
+	unsigned long fpfd_min;
+	unsigned long fpfd_max;
+	u16 m_min;
+	u16 m_max;
+	unsigned long fout_min;
+	unsigned long fout_max;
+};
+
 struct rcar_mipi_dsi {
 	struct device *dev;
 	const struct rcar_mipi_dsi_device_info *info;
@@ -50,6 +76,17 @@ struct rcar_mipi_dsi {
 	unsigned int lanes;
 };
 
+struct dsi_setup_info {
+	unsigned long hsfreq;
+	u16 hsfreqrange;
+
+	unsigned long fout;
+	u16 m;
+	u16 n;
+	u16 vclk_divider;
+	const struct dsi_clk_config *clkset;
+};
+
 static inline struct rcar_mipi_dsi *
 bridge_to_rcar_mipi_dsi(struct drm_bridge *bridge)
 {
@@ -62,65 +99,78 @@ host_to_rcar_mipi_dsi(struct mipi_dsi_host *host)
 	return container_of(host, struct rcar_mipi_dsi, host);
 }
 
-static const u32 phtw[] = {
-	0x01020114, 0x01600115, /* General testing */
-	0x01030116, 0x0102011d, /* General testing */
-	0x011101a4, 0x018601a4, /* 1Gbps testing */
-	0x014201a0, 0x010001a3, /* 1Gbps testing */
-	0x0101011f,		/* 1Gbps testing */
-};
-
-static const u32 phtw2[] = {
-	0x010c0130, 0x010c0140, /* General testing */
-	0x010c0150, 0x010c0180, /* General testing */
-	0x010c0190,
-	0x010a0160, 0x010a0170,
-	0x01800164, 0x01800174,	/* 1Gbps testing */
-};
-
 static const u32 hsfreqrange_table[][2] = {
-	{ 80000000U,   0x00 }, { 90000000U,   0x10 }, { 100000000U,  0x20 },
-	{ 110000000U,  0x30 }, { 120000000U,  0x01 }, { 130000000U,  0x11 },
-	{ 140000000U,  0x21 }, { 150000000U,  0x31 }, { 160000000U,  0x02 },
-	{ 170000000U,  0x12 }, { 180000000U,  0x22 }, { 190000000U,  0x32 },
-	{ 205000000U,  0x03 }, { 220000000U,  0x13 }, { 235000000U,  0x23 },
-	{ 250000000U,  0x33 }, { 275000000U,  0x04 }, { 300000000U,  0x14 },
-	{ 325000000U,  0x25 }, { 350000000U,  0x35 }, { 400000000U,  0x05 },
-	{ 450000000U,  0x16 }, { 500000000U,  0x26 }, { 550000000U,  0x37 },
-	{ 600000000U,  0x07 }, { 650000000U,  0x18 }, { 700000000U,  0x28 },
-	{ 750000000U,  0x39 }, { 800000000U,  0x09 }, { 850000000U,  0x19 },
-	{ 900000000U,  0x29 }, { 950000000U,  0x3a }, { 1000000000U, 0x0a },
-	{ 1050000000U, 0x1a }, { 1100000000U, 0x2a }, { 1150000000U, 0x3b },
-	{ 1200000000U, 0x0b }, { 1250000000U, 0x1b }, { 1300000000U, 0x2b },
-	{ 1350000000U, 0x3c }, { 1400000000U, 0x0c }, { 1450000000U, 0x1c },
-	{ 1500000000U, 0x2c }, { 1550000000U, 0x3d }, { 1600000000U, 0x0d },
-	{ 1650000000U, 0x1d }, { 1700000000U, 0x2e }, { 1750000000U, 0x3e },
-	{ 1800000000U, 0x0e }, { 1850000000U, 0x1e }, { 1900000000U, 0x2f },
-	{ 1950000000U, 0x3f }, { 2000000000U, 0x0f }, { 2050000000U, 0x40 },
-	{ 2100000000U, 0x41 }, { 2150000000U, 0x42 }, { 2200000000U, 0x43 },
-	{ 2250000000U, 0x44 }, { 2300000000U, 0x45 }, { 2350000000U, 0x46 },
-	{ 2400000000U, 0x47 }, { 2450000000U, 0x48 }, { 2500000000U, 0x49 },
+	{   MHZ(80), 0x00 }, {   MHZ(90), 0x10 }, {  MHZ(100), 0x20 },
+	{  MHZ(110), 0x30 }, {  MHZ(120), 0x01 }, {  MHZ(130), 0x11 },
+	{  MHZ(140), 0x21 }, {  MHZ(150), 0x31 }, {  MHZ(160), 0x02 },
+	{  MHZ(170), 0x12 }, {  MHZ(180), 0x22 }, {  MHZ(190), 0x32 },
+	{  MHZ(205), 0x03 }, {  MHZ(220), 0x13 }, {  MHZ(235), 0x23 },
+	{  MHZ(250), 0x33 }, {  MHZ(275), 0x04 }, {  MHZ(300), 0x14 },
+	{  MHZ(325), 0x25 }, {  MHZ(350), 0x35 }, {  MHZ(400), 0x05 },
+	{  MHZ(450), 0x16 }, {  MHZ(500), 0x26 }, {  MHZ(550), 0x37 },
+	{  MHZ(600), 0x07 }, {  MHZ(650), 0x18 }, {  MHZ(700), 0x28 },
+	{  MHZ(750), 0x39 }, {  MHZ(800), 0x09 }, {  MHZ(850), 0x19 },
+	{  MHZ(900), 0x29 }, {  MHZ(950), 0x3a }, { MHZ(1000), 0x0a },
+	{ MHZ(1050), 0x1a }, { MHZ(1100), 0x2a }, { MHZ(1150), 0x3b },
+	{ MHZ(1200), 0x0b }, { MHZ(1250), 0x1b }, { MHZ(1300), 0x2b },
+	{ MHZ(1350), 0x3c }, { MHZ(1400), 0x0c }, { MHZ(1450), 0x1c },
+	{ MHZ(1500), 0x2c }, { MHZ(1550), 0x3d }, { MHZ(1600), 0x0d },
+	{ MHZ(1650), 0x1d }, { MHZ(1700), 0x2e }, { MHZ(1750), 0x3e },
+	{ MHZ(1800), 0x0e }, { MHZ(1850), 0x1e }, { MHZ(1900), 0x2f },
+	{ MHZ(1950), 0x3f }, { MHZ(2000), 0x0f }, { MHZ(2050), 0x40 },
+	{ MHZ(2100), 0x41 }, { MHZ(2150), 0x42 }, { MHZ(2200), 0x43 },
+	{ MHZ(2250), 0x44 }, { MHZ(2300), 0x45 }, { MHZ(2350), 0x46 },
+	{ MHZ(2400), 0x47 }, { MHZ(2450), 0x48 }, { MHZ(2500), 0x49 },
 	{ /* sentinel */ },
 };
 
-struct vco_cntrl_value {
+struct dsi_clk_config {
 	u32 min_freq;
 	u32 max_freq;
-	u16 value;
+	u8 vco_cntrl;
+	u8 cpbias_cntrl;
+	u8 gmp_cntrl;
+	u8 int_cntrl;
+	u8 prop_cntrl;
 };
 
-static const struct vco_cntrl_value vco_cntrl_table[] = {
-	{ .min_freq = 40000000U,   .max_freq = 55000000U,   .value = 0x3f },
-	{ .min_freq = 52500000U,   .max_freq = 80000000U,   .value = 0x39 },
-	{ .min_freq = 80000000U,   .max_freq = 110000000U,  .value = 0x2f },
-	{ .min_freq = 105000000U,  .max_freq = 160000000U,  .value = 0x29 },
-	{ .min_freq = 160000000U,  .max_freq = 220000000U,  .value = 0x1f },
-	{ .min_freq = 210000000U,  .max_freq = 320000000U,  .value = 0x19 },
-	{ .min_freq = 320000000U,  .max_freq = 440000000U,  .value = 0x0f },
-	{ .min_freq = 420000000U,  .max_freq = 660000000U,  .value = 0x09 },
-	{ .min_freq = 630000000U,  .max_freq = 1149000000U, .value = 0x03 },
-	{ .min_freq = 1100000000U, .max_freq = 1152000000U, .value = 0x01 },
-	{ .min_freq = 1150000000U, .max_freq = 1250000000U, .value = 0x01 },
+static const struct dsi_clk_config dsi_clk_cfg_v3u[] = {
+	{   MHZ(40),    MHZ(55), 0x3f, 0x10, 0x01, 0x00, 0x0b },
+	{   MHZ(52.5),  MHZ(80), 0x39, 0x10, 0x01, 0x00, 0x0b },
+	{   MHZ(80),   MHZ(110), 0x2f, 0x10, 0x01, 0x00, 0x0b },
+	{  MHZ(105),   MHZ(160), 0x29, 0x10, 0x01, 0x00, 0x0b },
+	{  MHZ(160),   MHZ(220), 0x1f, 0x10, 0x01, 0x00, 0x0b },
+	{  MHZ(210),   MHZ(320), 0x19, 0x10, 0x01, 0x00, 0x0b },
+	{  MHZ(320),   MHZ(440), 0x0f, 0x10, 0x01, 0x00, 0x0b },
+	{  MHZ(420),   MHZ(660), 0x09, 0x10, 0x01, 0x00, 0x0b },
+	{  MHZ(630),  MHZ(1149), 0x03, 0x10, 0x01, 0x00, 0x0b },
+	{ MHZ(1100),  MHZ(1152), 0x01, 0x10, 0x01, 0x00, 0x0b },
+	{ MHZ(1150),  MHZ(1250), 0x01, 0x10, 0x01, 0x00, 0x0c },
+	{ /* sentinel */ },
+};
+
+static const struct dsi_clk_config dsi_clk_cfg_v4h[] = {
+	{   MHZ(40),    MHZ(45.31),  0x2b, 0x00, 0x00, 0x08, 0x0a },
+	{   MHZ(45.31), MHZ(54.66),  0x28, 0x00, 0x00, 0x08, 0x0a },
+	{   MHZ(54.66), MHZ(62.5),   0x28, 0x00, 0x00, 0x08, 0x0a },
+	{   MHZ(62.5),  MHZ(75),     0x27, 0x00, 0x00, 0x08, 0x0a },
+	{   MHZ(75),    MHZ(90.63),  0x23, 0x00, 0x00, 0x08, 0x0a },
+	{   MHZ(90.63), MHZ(109.37), 0x20, 0x00, 0x00, 0x08, 0x0a },
+	{  MHZ(109.37), MHZ(125),    0x20, 0x00, 0x00, 0x08, 0x0a },
+	{  MHZ(125),    MHZ(150),    0x1f, 0x00, 0x00, 0x08, 0x0a },
+	{  MHZ(150),    MHZ(181.25), 0x1b, 0x00, 0x00, 0x08, 0x0a },
+	{  MHZ(181.25), MHZ(218.75), 0x18, 0x00, 0x00, 0x08, 0x0a },
+	{  MHZ(218.75), MHZ(250),    0x18, 0x00, 0x00, 0x08, 0x0a },
+	{  MHZ(250),    MHZ(300),    0x17, 0x00, 0x00, 0x08, 0x0a },
+	{  MHZ(300),    MHZ(362.5),  0x13, 0x00, 0x00, 0x08, 0x0a },
+	{  MHZ(362.5),  MHZ(455.48), 0x10, 0x00, 0x00, 0x08, 0x0a },
+	{  MHZ(455.48), MHZ(500),    0x10, 0x00, 0x00, 0x08, 0x0a },
+	{  MHZ(500),    MHZ(600),    0x0f, 0x00, 0x00, 0x08, 0x0a },
+	{  MHZ(600),    MHZ(725),    0x0b, 0x00, 0x00, 0x08, 0x0a },
+	{  MHZ(725),    MHZ(875),    0x08, 0x00, 0x00, 0x08, 0x0a },
+	{  MHZ(875),   MHZ(1000),    0x08, 0x00, 0x00, 0x08, 0x0a },
+	{ MHZ(1000),   MHZ(1200),    0x07, 0x00, 0x00, 0x08, 0x0a },
+	{ MHZ(1200),   MHZ(1250),    0x03, 0x00, 0x00, 0x08, 0x0a },
 	{ /* sentinel */ },
 };
 
@@ -144,7 +194,7 @@ static void rcar_mipi_dsi_set(struct rcar_mipi_dsi *dsi, u32 reg, u32 set)
 	rcar_mipi_dsi_write(dsi, reg, rcar_mipi_dsi_read(dsi, reg) | set);
 }
 
-static int rcar_mipi_dsi_phtw_test(struct rcar_mipi_dsi *dsi, u32 phtw)
+static int rcar_mipi_dsi_write_phtw(struct rcar_mipi_dsi *dsi, u32 phtw)
 {
 	u32 status;
 	int ret;
@@ -163,32 +213,181 @@ static int rcar_mipi_dsi_phtw_test(struct rcar_mipi_dsi *dsi, u32 phtw)
 	return ret;
 }
 
+static int rcar_mipi_dsi_write_phtw_arr(struct rcar_mipi_dsi *dsi,
+					const u32 *phtw, unsigned int size)
+{
+	for (unsigned int i = 0; i < size; i++) {
+		int ret = rcar_mipi_dsi_write_phtw(dsi, phtw[i]);
+
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+#define WRITE_PHTW(...)                                               \
+	({                                                            \
+		static const u32 phtw[] = { __VA_ARGS__ };            \
+		int ret;                                              \
+		ret = rcar_mipi_dsi_write_phtw_arr(dsi, phtw,         \
+						   ARRAY_SIZE(phtw)); \
+		ret;                                                  \
+	})
+
+static int rcar_mipi_dsi_init_phtw_v3u(struct rcar_mipi_dsi *dsi)
+{
+	return WRITE_PHTW(0x01020114, 0x01600115, 0x01030116, 0x0102011d,
+			  0x011101a4, 0x018601a4, 0x014201a0, 0x010001a3,
+			  0x0101011f);
+}
+
+static int rcar_mipi_dsi_post_init_phtw_v3u(struct rcar_mipi_dsi *dsi)
+{
+	return WRITE_PHTW(0x010c0130, 0x010c0140, 0x010c0150, 0x010c0180,
+			  0x010c0190, 0x010a0160, 0x010a0170, 0x01800164,
+			  0x01800174);
+}
+
+static int rcar_mipi_dsi_init_phtw_v4h(struct rcar_mipi_dsi *dsi,
+				       const struct dsi_setup_info *setup_info)
+{
+	int ret;
+
+	if (setup_info->hsfreq < MHZ(450)) {
+		ret = WRITE_PHTW(0x01010100, 0x011b01ac);
+		if (ret)
+			return ret;
+	}
+
+	ret = WRITE_PHTW(0x01010100, 0x01030173, 0x01000174, 0x01500175,
+			 0x01030176, 0x01040166, 0x010201ad);
+	if (ret)
+		return ret;
+
+	if (setup_info->hsfreq <= MHZ(1000))
+		ret = WRITE_PHTW(0x01020100, 0x01910170, 0x01020171,
+				 0x01110172);
+	else if (setup_info->hsfreq <= MHZ(1500))
+		ret = WRITE_PHTW(0x01020100, 0x01980170, 0x01030171,
+				 0x01100172);
+	else if (setup_info->hsfreq <= MHZ(2500))
+		ret = WRITE_PHTW(0x01020100, 0x0144016b, 0x01000172);
+	else
+		return -EINVAL;
+
+	if (ret)
+		return ret;
+
+	if (dsi->lanes <= 1) {
+		ret = WRITE_PHTW(0x01070100, 0x010e010b);
+		if (ret)
+			return ret;
+	}
+
+	if (dsi->lanes <= 2) {
+		ret = WRITE_PHTW(0x01090100, 0x010e010b);
+		if (ret)
+			return ret;
+	}
+
+	if (dsi->lanes <= 3) {
+		ret = WRITE_PHTW(0x010b0100, 0x010e010b);
+		if (ret)
+			return ret;
+	}
+
+	if (setup_info->hsfreq <= MHZ(1500)) {
+		ret = WRITE_PHTW(0x01010100, 0x01c0016e);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int
+rcar_mipi_dsi_post_init_phtw_v4h(struct rcar_mipi_dsi *dsi,
+				 const struct dsi_setup_info *setup_info)
+{
+	u32 status;
+	int ret;
+
+	if (setup_info->hsfreq <= MHZ(1500)) {
+		WRITE_PHTW(0x01020100, 0x00000180);
+
+		ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+					status & PHTR_TEST, 2000, 10000, false,
+					dsi, PHTR);
+		if (ret < 0) {
+			dev_err(dsi->dev, "failed to test PHTR\n");
+			return ret;
+		}
+
+		WRITE_PHTW(0x01010100, 0x0100016e);
+	}
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------------
  * Hardware Setup
  */
 
-struct dsi_setup_info {
-	unsigned long fout;
-	u16 vco_cntrl;
-	u16 prop_cntrl;
-	u16 hsfreqrange;
-	u16 div;
-	unsigned int m;
-	unsigned int n;
-};
+static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
+				   unsigned long fin_rate,
+				   unsigned long fout_target,
+				   struct dsi_setup_info *setup_info)
+{
+	unsigned int best_err = -1;
+	const struct rcar_mipi_dsi_device_info *info = dsi->info;
+
+	for (unsigned int n = info->n_min; n <= info->n_max; n++) {
+		unsigned long fpfd;
+
+		fpfd = fin_rate / n;
+
+		if (fpfd < info->fpfd_min || fpfd > info->fpfd_max)
+			continue;
+
+		for (unsigned int m = info->m_min; m <= info->m_max; m++) {
+			unsigned int err;
+			u64 fout;
+
+			fout = div64_u64((u64)fpfd * m, dsi->info->n_mul);
+
+			if (fout < info->fout_min || fout > info->fout_max)
+				continue;
+
+			fout = div64_u64(fout, setup_info->vclk_divider);
+
+			if (fout < setup_info->clkset->min_freq ||
+			    fout > setup_info->clkset->max_freq)
+				continue;
+
+			err = abs((long)(fout - fout_target) * 10000 /
+				  (long)fout_target);
+			if (err < best_err) {
+				setup_info->m = m;
+				setup_info->n = n;
+				setup_info->fout = (unsigned long)fout;
+				best_err = err;
+
+				if (err == 0)
+					return;
+			}
+		}
+	}
+}
 
 static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
 					  struct clk *clk, unsigned long target,
 					  struct dsi_setup_info *setup_info)
 {
 
-	const struct vco_cntrl_value *vco_cntrl;
+	const struct dsi_clk_config *clk_cfg;
 	unsigned long fout_target;
-	unsigned long fin, fout;
-	unsigned long hsfreq;
-	unsigned int best_err = -1;
-	unsigned int divider;
-	unsigned int n;
+	unsigned long fin_rate;
 	unsigned int i;
 	unsigned int err;
 
@@ -198,70 +397,53 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
 	 */
 	fout_target = target * mipi_dsi_pixel_format_to_bpp(dsi->format)
 		    / (2 * dsi->lanes);
-	if (fout_target < 40000000 || fout_target > 1250000000)
+	if (fout_target < MHZ(40) || fout_target > MHZ(1250))
 		return;
 
-	/* Find vco_cntrl */
-	for (vco_cntrl = vco_cntrl_table; vco_cntrl->min_freq != 0; vco_cntrl++) {
-		if (fout_target > vco_cntrl->min_freq &&
-		    fout_target <= vco_cntrl->max_freq) {
-			setup_info->vco_cntrl = vco_cntrl->value;
-			if (fout_target >= 1150000000)
-				setup_info->prop_cntrl = 0x0c;
-			else
-				setup_info->prop_cntrl = 0x0b;
+	/* Find PLL settings */
+	for (clk_cfg = dsi->info->clk_cfg; clk_cfg->min_freq != 0; clk_cfg++) {
+		if (fout_target > clk_cfg->min_freq &&
+		    fout_target <= clk_cfg->max_freq) {
+			setup_info->clkset = clk_cfg;
 			break;
 		}
 	}
 
-	/* Add divider */
-	setup_info->div = (setup_info->vco_cntrl & 0x30) >> 4;
+	fin_rate = clk_get_rate(clk);
+
+	switch (dsi->info->model) {
+	case RCAR_DSI_V3U:
+	default:
+		setup_info->vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
+		break;
+
+	case RCAR_DSI_V4H:
+		setup_info->vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
+		break;
+	}
+
+	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info);
 
 	/* Find hsfreqrange */
-	hsfreq = fout_target * 2;
+	setup_info->hsfreq = setup_info->fout * 2;
 	for (i = 0; i < ARRAY_SIZE(hsfreqrange_table); i++) {
-		if (hsfreqrange_table[i][0] >= hsfreq) {
+		if (hsfreqrange_table[i][0] >= setup_info->hsfreq) {
 			setup_info->hsfreqrange = hsfreqrange_table[i][1];
 			break;
 		}
 	}
 
-	/*
-	 * Calculate n and m for PLL clock
-	 * Following the HW manual the ranges of n and m are
-	 * n = [3-8] and m = [64-625]
-	 */
-	fin = clk_get_rate(clk);
-	divider = 1 << setup_info->div;
-	for (n = 3; n < 9; n++) {
-		unsigned long fpfd;
-		unsigned int m;
-
-		fpfd = fin / n;
-
-		for (m = 64; m < 626; m++) {
-			fout = fpfd * m / divider;
-			err = abs((long)(fout - fout_target) * 10000 /
-				  (long)fout_target);
-			if (err < best_err) {
-				setup_info->m = m - 2;
-				setup_info->n = n - 1;
-				setup_info->fout = fout;
-				best_err = err;
-				if (err == 0)
-					goto done;
-			}
-		}
-	}
+	err = abs((long)(setup_info->fout - fout_target) * 10000 / (long)fout_target);
 
-done:
 	dev_dbg(dsi->dev,
-		"%pC %lu Hz -> Fout %lu Hz (target %lu Hz, error %d.%02u%%), PLL M/N/DIV %u/%u/%u\n",
-		clk, fin, setup_info->fout, fout_target, best_err / 100,
-		best_err % 100, setup_info->m, setup_info->n, setup_info->div);
+		"Fout = %u * %lu / (%u * %u * %u) = %lu (target %lu Hz, error %d.%02u%%)\n",
+		setup_info->m, fin_rate, dsi->info->n_mul, setup_info->n,
+		setup_info->vclk_divider, setup_info->fout, fout_target,
+		err / 100, err % 100);
+
 	dev_dbg(dsi->dev,
 		"vco_cntrl = 0x%x\tprop_cntrl = 0x%x\thsfreqrange = 0x%x\n",
-		setup_info->vco_cntrl, setup_info->prop_cntrl,
+		clk_cfg->vco_cntrl, clk_cfg->prop_cntrl,
 		setup_info->hsfreqrange);
 }
 
@@ -324,7 +506,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 {
 	struct dsi_setup_info setup_info = {};
 	unsigned int timeout;
-	int ret, i;
+	int ret;
 	int dsi_format;
 	u32 phy_setup;
 	u32 clockset2, clockset3;
@@ -360,10 +542,19 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	phy_setup |= PHYSETUP_HSFREQRANGE(setup_info.hsfreqrange);
 	rcar_mipi_dsi_write(dsi, PHYSETUP, phy_setup);
 
-	for (i = 0; i < ARRAY_SIZE(phtw); i++) {
-		ret = rcar_mipi_dsi_phtw_test(dsi, phtw[i]);
+	switch (dsi->info->model) {
+	case RCAR_DSI_V3U:
+	default:
+		ret = rcar_mipi_dsi_init_phtw_v3u(dsi);
 		if (ret < 0)
 			return ret;
+		break;
+
+	case RCAR_DSI_V4H:
+		ret = rcar_mipi_dsi_init_phtw_v4h(dsi, &setup_info);
+		if (ret < 0)
+			return ret;
+		break;
 	}
 
 	/* PLL Clock Setting */
@@ -371,12 +562,13 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	rcar_mipi_dsi_set(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
 	rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
 
-	clockset2 = CLOCKSET2_M(setup_info.m) | CLOCKSET2_N(setup_info.n)
-		  | CLOCKSET2_VCO_CNTRL(setup_info.vco_cntrl);
-	clockset3 = CLOCKSET3_PROP_CNTRL(setup_info.prop_cntrl)
-		  | CLOCKSET3_INT_CNTRL(0)
-		  | CLOCKSET3_CPBIAS_CNTRL(0x10)
-		  | CLOCKSET3_GMP_CNTRL(1);
+	clockset2 = CLOCKSET2_M(setup_info.m - dsi->info->clockset2_m_offset)
+		  | CLOCKSET2_N(setup_info.n - 1)
+		  | CLOCKSET2_VCO_CNTRL(setup_info.clkset->vco_cntrl);
+	clockset3 = CLOCKSET3_PROP_CNTRL(setup_info.clkset->prop_cntrl)
+		  | CLOCKSET3_INT_CNTRL(setup_info.clkset->int_cntrl)
+		  | CLOCKSET3_CPBIAS_CNTRL(setup_info.clkset->cpbias_cntrl)
+		  | CLOCKSET3_GMP_CNTRL(setup_info.clkset->gmp_cntrl);
 	rcar_mipi_dsi_write(dsi, CLOCKSET2, clockset2);
 	rcar_mipi_dsi_write(dsi, CLOCKSET3, clockset3);
 
@@ -407,10 +599,19 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 		return -ETIMEDOUT;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(phtw2); i++) {
-		ret = rcar_mipi_dsi_phtw_test(dsi, phtw2[i]);
+	switch (dsi->info->model) {
+	case RCAR_DSI_V3U:
+	default:
+		ret = rcar_mipi_dsi_post_init_phtw_v3u(dsi);
+		if (ret < 0)
+			return ret;
+		break;
+
+	case RCAR_DSI_V4H:
+		ret = rcar_mipi_dsi_post_init_phtw_v4h(dsi, &setup_info);
 		if (ret < 0)
 			return ret;
+		break;
 	}
 
 	/* Enable DOT clock */
@@ -427,8 +628,19 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 		dev_warn(dsi->dev, "unsupported format");
 		return -EINVAL;
 	}
-	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_DIV(setup_info.div)
-		|  VCLKSET_LANE(dsi->lanes - 1);
+
+	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_LANE(dsi->lanes - 1);
+
+	switch (dsi->info->model) {
+	case RCAR_DSI_V3U:
+	default:
+		vclkset |= VCLKSET_DIV_V3U(__ffs(setup_info.vclk_divider));
+		break;
+
+	case RCAR_DSI_V4H:
+		vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
+		break;
+	}
 
 	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
 
@@ -841,8 +1053,39 @@ static int rcar_mipi_dsi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct rcar_mipi_dsi_device_info v3u_data = {
+	.model = RCAR_DSI_V3U,
+	.clk_cfg = dsi_clk_cfg_v3u,
+	.clockset2_m_offset = 2,
+	.n_min = 3,
+	.n_max = 8,
+	.n_mul = 1,
+	.fpfd_min = MHZ(2),
+	.fpfd_max = MHZ(8),
+	.m_min = 64,
+	.m_max = 625,
+	.fout_min = MHZ(320),
+	.fout_max = MHZ(1250),
+};
+
+static const struct rcar_mipi_dsi_device_info v4h_data = {
+	.model = RCAR_DSI_V4H,
+	.clk_cfg = dsi_clk_cfg_v4h,
+	.clockset2_m_offset = 0,
+	.n_min = 1,
+	.n_max = 8,
+	.n_mul = 2,
+	.fpfd_min = MHZ(8),
+	.fpfd_max = MHZ(24),
+	.m_min = 167,
+	.m_max = 1000,
+	.fout_min = MHZ(2000),
+	.fout_max = MHZ(4000),
+};
+
 static const struct of_device_id rcar_mipi_dsi_of_table[] = {
-	{ .compatible = "renesas,r8a779a0-dsi-csi2-tx" },
+	{ .compatible = "renesas,r8a779a0-dsi-csi2-tx", .data = &v3u_data },
+	{ .compatible = "renesas,r8a779g0-dsi-csi2-tx", .data = &v4h_data },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
index 2eaca54636f3..f8114d11f2d1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
@@ -122,7 +122,8 @@
 #define VCLKSET_CKEN			(1 << 16)
 #define VCLKSET_COLOR_RGB		(0 << 8)
 #define VCLKSET_COLOR_YCC		(1 << 8)
-#define VCLKSET_DIV(x)			(((x) & 0x3) << 4)
+#define VCLKSET_DIV_V3U(x)		(((x) & 0x3) << 4)
+#define VCLKSET_DIV_V4H(x)		(((x) & 0x7) << 4)
 #define VCLKSET_BPP_16			(0 << 2)
 #define VCLKSET_BPP_18			(1 << 2)
 #define VCLKSET_BPP_18L			(2 << 2)
@@ -166,6 +167,9 @@
 #define PHTW_CWEN			(1 << 8)
 #define PHTW_TESTDIN_CODE(x)		(((x) & 0xff) << 0)
 
+#define PHTR				0x1038
+#define PHTR_TEST			(1 << 16)
+
 #define PHTC				0x103c
 #define PHTC_TESTCLR			(1 << 0)
 
-- 
2.34.1

