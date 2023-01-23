Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09485677983
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jan 2023 11:48:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbjAWKsN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 05:48:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjAWKsM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 05:48:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD26213D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 02:48:09 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C9F42D9;
        Mon, 23 Jan 2023 11:48:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674470881;
        bh=ev24KVXIoqBCO08u8Wzn61epN2ywZVgMmMvPPLt2MsM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TZxfXk7j+kyKMGvpYQ/auhy7nffDGxHMGNLEYaXhw0excUX51oBxpBzYaqV762RW7
         K4Z7UMb9p+36V3n+2z5ihLSKm5JnOMjUmkR8XMbw8AFK2kly0oZ0pzJ/NUouRIt54s
         V8RF8kIbP2QjMYNdSaIgEC4rUbBdvKeIuMHKHYYU=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 2/7] drm: rcar-du: lvds: Add runtime PM
Date:   Mon, 23 Jan 2023 12:47:37 +0200
Message-Id: <20230123104742.227460-3-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123104742.227460-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20230123104742.227460-1-tomi.valkeinen+renesas@ideasonboard.com>
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

Add simple runtime PM suspend and resume functionality.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/Kconfig     |  1 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 43 +++++++++++++++++++++++++----
 2 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index a8f862c68b4f..17cb98ce7530 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -39,6 +39,7 @@ config DRM_RCAR_USE_LVDS
 config DRM_RCAR_LVDS
 	def_tristate DRM_RCAR_DU
 	depends on DRM_RCAR_USE_LVDS
+	depends on PM
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select OF_FLATTREE
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 81a060c2fe3f..7cf515e43079 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -16,6 +16,7 @@
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
 
@@ -316,8 +317,8 @@ int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq)
 
 	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
 
-	ret = clk_prepare_enable(lvds->clocks.mod);
-	if (ret < 0)
+	ret = pm_runtime_resume_and_get(lvds->dev);
+	if (ret)
 		return ret;
 
 	__rcar_lvds_pll_setup_d3_e3(lvds, freq, true);
@@ -337,7 +338,7 @@ void rcar_lvds_pclk_disable(struct drm_bridge *bridge)
 
 	rcar_lvds_write(lvds, LVDPLLCR, 0);
 
-	clk_disable_unprepare(lvds->clocks.mod);
+	pm_runtime_put_sync(lvds->dev);
 }
 EXPORT_SYMBOL_GPL(rcar_lvds_pclk_disable);
 
@@ -396,8 +397,8 @@ static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
 	u32 lvdcr0;
 	int ret;
 
-	ret = clk_prepare_enable(lvds->clocks.mod);
-	if (ret < 0)
+	ret = pm_runtime_resume_and_get(lvds->dev);
+	if (ret)
 		return;
 
 	/* Enable the companion LVDS encoder in dual-link mode. */
@@ -551,7 +552,7 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
 		lvds->companion->funcs->atomic_disable(lvds->companion,
 						       old_bridge_state);
 
-	clk_disable_unprepare(lvds->clocks.mod);
+	pm_runtime_put_sync(lvds->dev);
 }
 
 static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
@@ -844,6 +845,8 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	pm_runtime_enable(&pdev->dev);
+
 	drm_bridge_add(&lvds->bridge);
 
 	return 0;
@@ -855,6 +858,8 @@ static int rcar_lvds_remove(struct platform_device *pdev)
 
 	drm_bridge_remove(&lvds->bridge);
 
+	pm_runtime_disable(&pdev->dev);
+
 	return 0;
 }
 
@@ -913,11 +918,37 @@ static const struct of_device_id rcar_lvds_of_table[] = {
 
 MODULE_DEVICE_TABLE(of, rcar_lvds_of_table);
 
+static int rcar_lvds_runtime_suspend(struct device *dev)
+{
+	struct rcar_lvds *lvds = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(lvds->clocks.mod);
+
+	return 0;
+}
+
+static int rcar_lvds_runtime_resume(struct device *dev)
+{
+	struct rcar_lvds *lvds = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(lvds->clocks.mod);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static const struct dev_pm_ops rcar_lvds_pm_ops = {
+	SET_RUNTIME_PM_OPS(rcar_lvds_runtime_suspend, rcar_lvds_runtime_resume, NULL)
+};
+
 static struct platform_driver rcar_lvds_platform_driver = {
 	.probe		= rcar_lvds_probe,
 	.remove		= rcar_lvds_remove,
 	.driver		= {
 		.name	= "rcar-lvds",
+		.pm	= &rcar_lvds_pm_ops,
 		.of_match_table = rcar_lvds_of_table,
 	},
 };
-- 
2.34.1

