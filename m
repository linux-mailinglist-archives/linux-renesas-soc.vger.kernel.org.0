Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3E9667797F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jan 2023 11:48:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbjAWKsI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 05:48:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbjAWKsI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 05:48:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76AE1423E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 02:48:01 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6842710B;
        Mon, 23 Jan 2023 11:47:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674470879;
        bh=+JXekmAURtAs7Is3U4JBWPY+yYQzq5YGA/QwsCqwis8=;
        h=From:To:Cc:Subject:Date:From;
        b=BmiEcKOP3YlC3WuNRlkGAQmh+ktrHZQqFB9ddqjArliWHeBzAK19jR2mKD+BawO6I
         xRq2Uc5ejp9NPA242n8gBYVLuE3ApDOl+w7WFwKUS4bh/pOotBxUPWwtodWcIka12m
         QAvxpmrllRzFWLlPRfjBgnBcrBk2HVM7ePQaw4m8=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 0/7] drm: rcar-du: Misc patches
Date:   Mon, 23 Jan 2023 12:47:35 +0200
Message-Id: <20230123104742.227460-1-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Hi,

Diff to v2:
- Depend on PM in Kconfig to ensure runtime PM works
- Fix access to DEFR7 in "drm: rcar-du: Stop accessing non-existant
  registers on gen4"
- Use pm_runtime_put_sync() instead of pm_runtime_put()
- Add missing line feed
- Fix lvsd typo in commit message

 Tomi

Koji Matsuoka (1):
  drm: rcar-du: lvds: Fix stop sequence

Tomi Valkeinen (6):
  drm: rcar-du: dsi: add 'select RESET_CONTROLLER'
  drm: rcar-du: lvds: Add runtime PM
  drm: rcar-du: lvds: Add reset control
  drm: rcar-du: Add quirk for H3 ES1.x pclk workaround
  drm: rcar-du: Fix setting a reserved bit in DPLLCR
  drm: rcar-du: Stop accessing non-existant registers on gen4

 drivers/gpu/drm/rcar-du/Kconfig         |  3 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 39 +++++++----
 drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 49 ++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 24 ++++---
 drivers/gpu/drm/rcar-du/rcar_du_regs.h  |  8 +--
 drivers/gpu/drm/rcar-du/rcar_lvds.c     | 87 +++++++++++++++++++++++--
 7 files changed, 177 insertions(+), 35 deletions(-)

Interdiff against v2:
diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 151e400b996d..742f6f2c8de8 100644
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
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index c2209d427bb7..152602236377 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -151,14 +151,16 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 	if (rcdu->info->gen < 4)
 		rcar_du_group_setup_pins(rgrp);
 
-	/*
-	 * TODO: Handle routing of the DU output to CMM dynamically, as we
-	 * should bypass CMM completely when no color management feature is
-	 * used.
-	 */
-	defr7 |= (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0) |
-		 (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
-	rcar_du_group_write(rgrp, DEFR7, defr7);
+	if (rcdu->info->gen < 4) {
+		/*
+		 * TODO: Handle routing of the DU output to CMM dynamically, as
+		 * we should bypass CMM completely when no color management
+		 * feature is used.
+		 */
+		defr7 |= (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0) |
+			 (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
+		rcar_du_group_write(rgrp, DEFR7, defr7);
+	}
 
 	if (rcdu->info->gen >= 2) {
 		if (rcdu->info->gen < 4)
@@ -194,13 +196,10 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
  */
 int rcar_du_group_get(struct rcar_du_group *rgrp)
 {
-	struct rcar_du_device *rcdu = rgrp->dev;
-
 	if (rgrp->use_count)
 		goto done;
 
-	if (rcdu->info->gen < 4)
-		rcar_du_group_setup(rgrp);
+	rcar_du_group_setup(rgrp);
 
 done:
 	rgrp->use_count++;
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 8fa5f7400179..8cd86a3d65a5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -345,7 +345,7 @@ void rcar_lvds_pclk_disable(struct drm_bridge *bridge)
 
 	rcar_lvds_write(lvds, LVDPLLCR, 0);
 
-	pm_runtime_put(lvds->dev);
+	pm_runtime_put_sync(lvds->dev);
 }
 EXPORT_SYMBOL_GPL(rcar_lvds_pclk_disable);
 
@@ -580,7 +580,7 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
 		lvds->companion->funcs->atomic_disable(lvds->companion,
 						       old_bridge_state);
 
-	pm_runtime_put(lvds->dev);
+	pm_runtime_put_sync(lvds->dev);
 }
 
 static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
@@ -877,6 +877,7 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 	if (IS_ERR(lvds->rstc))
 		return dev_err_probe(&pdev->dev, PTR_ERR(lvds->rstc),
 				     "failed to get cpg reset\n");
+
 	pm_runtime_enable(&pdev->dev);
 
 	drm_bridge_add(&lvds->bridge);
-- 
2.34.1

