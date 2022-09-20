Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1169C5BE3E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Sep 2022 12:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbiITKz1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Sep 2022 06:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbiITKzZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Sep 2022 06:55:25 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 67EC96A495
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Sep 2022 03:55:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,330,1654527600"; 
   d="scan'208";a="135560179"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Sep 2022 19:55:24 +0900
Received: from localhost.localdomain (unknown [10.226.92.28])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7AB0B40061A2;
        Tue, 20 Sep 2022 19:55:20 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 3/3] drm: rcar-du: rzg2l_mipi_dsi: Enhance device lanes check
Date:   Tue, 20 Sep 2022 11:55:01 +0100
Message-Id: <20220920105501.396999-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920105501.396999-1-biju.das.jz@bp.renesas.com>
References: <20220920105501.396999-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enhance device lanes check by reading TXSETR register at probe(),
and enforced in rzg2l_mipi_dsi_host_attach().

As per HW manual, we can read TXSETR register only after
DPHY initialization.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8:
 * New patch.
---
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c | 122 ++++++++++++++++-------
 1 file changed, 88 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
index 8579208db218..aa95b85a2964 100644
--- a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
@@ -171,6 +171,11 @@ static void rzg2l_mipi_dsi_link_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 d
 	iowrite32(data, dsi->mmio + LINK_REG_OFFSET + reg);
 }
 
+static u32 rzg2l_mipi_dsi_phy_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
+{
+	return ioread32(dsi->mmio + reg);
+}
+
 static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
 {
 	return ioread32(dsi->mmio + LINK_REG_OFFSET + reg);
@@ -180,19 +185,11 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
  * Hardware Setup
  */
 
-static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
-				  const struct drm_display_mode *mode)
+static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
+				    unsigned long hsfreq)
 {
 	const struct rzg2l_mipi_dsi_timings *dphy_timings;
-	unsigned long hsfreq;
-	unsigned int i, bpp;
-	u32 txsetr;
-	u32 clstptsetr;
-	u32 lptrnstsetr;
-	u32 clkkpt;
-	u32 clkbfht;
-	u32 clkstpt;
-	u32 golpbkt;
+	unsigned int i;
 	u32 dphyctrl0;
 	u32 dphytim0;
 	u32 dphytim1;
@@ -200,19 +197,6 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	u32 dphytim3;
 	int ret;
 
-	/*
-	 * Relationship between hsclk and vclk must follow
-	 * vclk * bpp = hsclk * 8 * lanes
-	 * where vclk: video clock (Hz)
-	 *       bpp: video pixel bit depth
-	 *       hsclk: DSI HS Byte clock frequency (Hz)
-	 *       lanes: number of data lanes
-	 *
-	 * hsclk(bit) = hsclk(byte) * 8
-	 */
-	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = (mode->clock * bpp * 8) / (8 * dsi->lanes);
-
 	/* All DSI global operation timings are set with recommended setting */
 	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
 		dphy_timings = &rzg2l_mipi_dsi_global_timings[i];
@@ -220,12 +204,6 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 			break;
 	}
 
-	ret = pm_runtime_resume_and_get(dsi->dev);
-	if (ret < 0)
-		return ret;
-
-	clk_set_rate(dsi->vclk, mode->clock * 1000);
-
 	/* Initializing DPHY before accessing LINK */
 	dphyctrl0 = DSIDPHYCTRL0_CAL_EN_HSRX_OFS | DSIDPHYCTRL0_CMN_MASTER_EN |
 		    DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR;
@@ -259,10 +237,62 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 
 	ret = reset_control_deassert(dsi->rstc);
 	if (ret < 0)
-		goto err_pm_put;
+		return ret;
 
 	udelay(1);
 
+	return 0;
+}
+
+static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
+{
+	u32 dphyctrl0;
+
+	dphyctrl0 = rzg2l_mipi_dsi_phy_read(dsi, DSIDPHYCTRL0);
+
+	dphyctrl0 &= ~(DSIDPHYCTRL0_EN_LDO1200 | DSIDPHYCTRL0_EN_BGR);
+	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
+
+	reset_control_assert(dsi->rstc);
+}
+
+static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
+				  const struct drm_display_mode *mode)
+{
+	unsigned long hsfreq;
+	unsigned int bpp;
+	u32 txsetr;
+	u32 clstptsetr;
+	u32 lptrnstsetr;
+	u32 clkkpt;
+	u32 clkbfht;
+	u32 clkstpt;
+	u32 golpbkt;
+	int ret;
+
+	/*
+	 * Relationship between hsclk and vclk must follow
+	 * vclk * bpp = hsclk * 8 * lanes
+	 * where vclk: video clock (Hz)
+	 *       bpp: video pixel bit depth
+	 *       hsclk: DSI HS Byte clock frequency (Hz)
+	 *       lanes: number of data lanes
+	 *
+	 * hsclk(bit) = hsclk(byte) * 8
+	 */
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	hsfreq = (mode->clock * bpp * 8) / (8 * dsi->lanes);
+
+	ret = pm_runtime_resume_and_get(dsi->dev);
+	if (ret < 0)
+		return ret;
+
+	clk_set_rate(dsi->vclk, mode->clock * 1000);
+
+	ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
+	if (ret < 0)
+		goto err_phy;
+
 	/* Enable Data lanes and Clock lanes */
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
@@ -301,7 +331,8 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 
 	return 0;
 
-err_pm_put:
+err_phy:
+	rzg2l_mipi_dsi_dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 
 	return ret;
@@ -309,7 +340,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 
 static void rzg2l_mipi_dsi_stop(struct rzg2l_mipi_dsi *dsi)
 {
-	reset_control_assert(dsi->rstc);
+	rzg2l_mipi_dsi_dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 }
 
@@ -666,7 +697,9 @@ static const struct dev_pm_ops rzg2l_mipi_pm_ops = {
 
 static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 {
+	unsigned int num_data_lanes;
 	struct rzg2l_mipi_dsi *dsi;
+	u32 txsetr;
 	int ret;
 
 	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
@@ -681,7 +714,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 		return dev_err_probe(dsi->dev, ret,
 				     "missing or invalid data-lanes property\n");
 
-	dsi->num_data_lanes = ret;
+	num_data_lanes = ret;
 
 	dsi->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dsi->mmio))
@@ -710,6 +743,24 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dsi->dev);
 
+	ret = pm_runtime_resume_and_get(dsi->dev);
+	if (ret < 0)
+		goto err_pm_disable;
+
+	/*
+	 * TXSETR register can be read only after DPHY init. But during probe
+	 * mode->clock and format are not available. So initialize DPHY with
+	 * timing parameters for 80Mbps.
+	 */
+	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000);
+	if (ret < 0)
+		goto err_phy;
+
+	txsetr = rzg2l_mipi_dsi_link_read(dsi, TXSETR);
+	dsi->num_data_lanes = min(((txsetr >> 16) & 3) + 1, num_data_lanes);
+	rzg2l_mipi_dsi_dphy_exit(dsi);
+	pm_runtime_put(dsi->dev);
+
 	/* Initialize the DRM bridge. */
 	dsi->bridge.funcs = &rzg2l_mipi_dsi_bridge_ops;
 	dsi->bridge.of_node = dsi->dev->of_node;
@@ -723,6 +774,9 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_phy:
+	rzg2l_mipi_dsi_dphy_exit(dsi);
+	pm_runtime_put(dsi->dev);
 err_pm_disable:
 	pm_runtime_disable(dsi->dev);
 	return ret;
-- 
2.25.1

