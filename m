Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E42E674FC7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jan 2023 09:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjATIuw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Jan 2023 03:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjATIuu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 03:50:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A7874960
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jan 2023 00:50:47 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C818A4C;
        Fri, 20 Jan 2023 09:50:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674204631;
        bh=mBWgjwANgxtaKNaPyOvD4uadOL9Rm/ZrDucvycYRZX0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ib5dDMAavVGqZKpXdl9aTIZUwljaLJ/Kw7USc8426en2JZ2/+bqIiqFjbNlZVrIHe
         YSFdiyApMNLAcWHTEvgGjtXyFWfwZh58ignUNMCt0mZsbydgYDZorXEOb3x0jkdeOQ
         AXqTnDQlq0T7MEfJiU895TMG/tw2SAk4lxTlRzPw=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v2 2/7] drm: rcar-du: lvds: Add runtime PM
Date:   Fri, 20 Jan 2023 10:50:04 +0200
Message-Id: <20230120085009.604797-3-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
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
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 43 +++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 81a060c2fe3f..8e1be51fbee6 100644
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
+	pm_runtime_put(lvds->dev);
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
+	pm_runtime_put(lvds->dev);
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

