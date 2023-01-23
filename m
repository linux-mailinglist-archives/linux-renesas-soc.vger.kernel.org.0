Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA3C677984
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jan 2023 11:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjAWKsO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 05:48:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbjAWKsM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 05:48:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA9946B1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 02:48:10 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D0CC308;
        Mon, 23 Jan 2023 11:48:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674470881;
        bh=7OpOxMAIgPLX2eALu1h5q0h7PcbjDfH/Iu6TbdCQudQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S8tck8Ptu9dnRaWdwT1ukyvUeMjkSxQwk0mDlNmwbt/iEWuuNtCch4TV9VdyV73r0
         PxfK5T3cjfX8r1f/xYfR2nylBFWBVOhfYXw8YcdxAWbpqTtOHwNajrN5hJrItdHs9I
         9qEVW+ExZlB3bdS7SGXEXYcS6XnR/KnOLS2bFQZc=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 3/7] drm: rcar-du: lvds: Add reset control
Date:   Mon, 23 Jan 2023 12:47:38 +0200
Message-Id: <20230123104742.227460-4-tomi.valkeinen+renesas@ideasonboard.com>
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

Reset LVDS using the reset control as CPG reset/release is required in
the hardware manual sequence.

Based on a BSP patch from Koji Matsuoka <koji.matsuoka.xm@renesas.com>.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/Kconfig     |  1 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 20 +++++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 17cb98ce7530..742f6f2c8de8 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -44,6 +44,7 @@ config DRM_RCAR_LVDS
 	select DRM_PANEL
 	select OF_FLATTREE
 	select OF_OVERLAY
+	select RESET_CONTROLLER
 
 config DRM_RCAR_USE_MIPI_DSI
 	bool "R-Car DU MIPI DSI Encoder Support"
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 7cf515e43079..a11201e4d31b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -17,6 +17,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
 
@@ -61,6 +62,7 @@ struct rcar_lvds_device_info {
 struct rcar_lvds {
 	struct device *dev;
 	const struct rcar_lvds_device_info *info;
+	struct reset_control *rstc;
 
 	struct drm_bridge bridge;
 
@@ -845,6 +847,11 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	lvds->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(lvds->rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(lvds->rstc),
+				     "failed to get cpg reset\n");
+
 	pm_runtime_enable(&pdev->dev);
 
 	drm_bridge_add(&lvds->bridge);
@@ -924,6 +931,8 @@ static int rcar_lvds_runtime_suspend(struct device *dev)
 
 	clk_disable_unprepare(lvds->clocks.mod);
 
+	reset_control_assert(lvds->rstc);
+
 	return 0;
 }
 
@@ -932,11 +941,20 @@ static int rcar_lvds_runtime_resume(struct device *dev)
 	struct rcar_lvds *lvds = dev_get_drvdata(dev);
 	int ret;
 
+	ret = reset_control_deassert(lvds->rstc);
+	if (ret)
+		return ret;
+
 	ret = clk_prepare_enable(lvds->clocks.mod);
 	if (ret < 0)
-		return ret;
+		goto err_reset_assert;
 
 	return 0;
+
+err_reset_assert:
+	reset_control_assert(lvds->rstc);
+
+	return ret;
 }
 
 static const struct dev_pm_ops rcar_lvds_pm_ops = {
-- 
2.34.1

