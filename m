Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19B9D66DF7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jan 2023 14:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjAQNxs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Jan 2023 08:53:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjAQNxG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2023 08:53:06 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5408F3CE0D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jan 2023 05:52:16 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A48B14DA;
        Tue, 17 Jan 2023 14:52:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673963534;
        bh=gqEoZlraEbJMlFqHIIVcwSD4C6uq/6FiErgijUHtE68=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sGst5Ep6px+bRn3jaPjTxWE4iOOW7p8VEFILJT408Jw8JYCL9v1Jy5cbaQZD25P+2
         p4ZMFosyGsHY7VgYLqysuOcJmn4/DA9GOq8E4GjAqLe1TlEVQRY99NscTtBK6xkEJv
         HAlU+uQzSmRmeOP3mgIGncICTPc0x7zeHxZ6QIi4=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH 2/6] drm: rcar-du: lvds: Add reset control
Date:   Tue, 17 Jan 2023 15:51:50 +0200
Message-Id: <20230117135154.387208-3-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
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

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Reset LVDS using the reset control as CPG reset/release is required in
H/W manual sequence.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
[tomi.valkeinen: Rewrite the patch description]
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/Kconfig     |  1 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index a8f862c68b4f..151e400b996d 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -43,6 +43,7 @@ config DRM_RCAR_LVDS
 	select DRM_PANEL
 	select OF_FLATTREE
 	select OF_OVERLAY
+	select RESET_CONTROLLER
 
 config DRM_RCAR_USE_MIPI_DSI
 	bool "R-Car DU MIPI DSI Encoder Support"
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 81a060c2fe3f..674b727cdaa2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -16,6 +16,7 @@
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
 
@@ -60,6 +61,7 @@ struct rcar_lvds_device_info {
 struct rcar_lvds {
 	struct device *dev;
 	const struct rcar_lvds_device_info *info;
+	struct reset_control *rstc;
 
 	struct drm_bridge bridge;
 
@@ -316,6 +318,8 @@ int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq)
 
 	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
 
+	reset_control_deassert(lvds->rstc);
+
 	ret = clk_prepare_enable(lvds->clocks.mod);
 	if (ret < 0)
 		return ret;
@@ -338,6 +342,8 @@ void rcar_lvds_pclk_disable(struct drm_bridge *bridge)
 	rcar_lvds_write(lvds, LVDPLLCR, 0);
 
 	clk_disable_unprepare(lvds->clocks.mod);
+
+	reset_control_assert(lvds->rstc);
 }
 EXPORT_SYMBOL_GPL(rcar_lvds_pclk_disable);
 
@@ -396,6 +402,8 @@ static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
 	u32 lvdcr0;
 	int ret;
 
+	reset_control_deassert(lvds->rstc);
+
 	ret = clk_prepare_enable(lvds->clocks.mod);
 	if (ret < 0)
 		return;
@@ -552,6 +560,7 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
 						       old_bridge_state);
 
 	clk_disable_unprepare(lvds->clocks.mod);
+	reset_control_assert(lvds->rstc);
 }
 
 static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
@@ -844,6 +853,12 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	lvds->rstc = devm_reset_control_get(&pdev->dev, NULL);
+	if (IS_ERR(lvds->rstc)) {
+		dev_err(&pdev->dev, "failed to get cpg reset\n");
+		return PTR_ERR(lvds->rstc);
+	}
+
 	drm_bridge_add(&lvds->bridge);
 
 	return 0;
-- 
2.34.1

