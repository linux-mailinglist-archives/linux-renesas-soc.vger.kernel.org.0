Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 217563B1860
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 13:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbhFWLD0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 07:03:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37088 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbhFWLDY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 07:03:24 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D238B9AA;
        Wed, 23 Jun 2021 13:01:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624446066;
        bh=cKfgRTb1Q+iwwQGCqEV4Omo/2QKYlG00MEcbKKAFWAI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=laX3LKG4ZcicRUWgBkrXJhPhwAKTdg0xxXibWFhgTUUGtXE7sTDlZ7jrP/zYK5P3J
         gX5ghu6Z3ggxHfUTYzK9TnckRj/SQAOyZRigD3RM9gNRrHARugLFVRZdeA52EocL+W
         9Oun15xEZF1HrbmpBT5TvD0rIiKs9zXIGn3orPgM=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [RFC PATCH 16/15] rcar-du: dsi: Unexport clock functions
Date:   Wed, 23 Jun 2021 12:00:59 +0100
Message-Id: <20210623110059.3408353-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The rcar_mipi_dsi_clk_enable and rcar_mipi_dsi_clk_disable functions
are exported so that they can be operated directly from the DU CRTC.

This is not required, and can be handled directly through the bridge.

The functionality is split while moving, as the rcar_mipi_dsi_startup()
and rcar_mipi_dsi_shutdown() are not handling the clocks and so
shouldn't be left in the clock specific functions.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---

This patch extends Laurent's series, and would ultimately be squashed
into the DSI driver.



 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 98 ++++++++++++++-----------
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h | 26 -------
 2 files changed, 54 insertions(+), 70 deletions(-)
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 026026bbb367..4c5ef4de0ea7 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -5,8 +5,6 @@
  * Copyright (C) 2020 Renesas Electronics Corporation
  */
 
-#include "rcar_mipi_dsi.h"
-
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -451,6 +449,33 @@ static void rcar_mipi_dsi_shutdown(struct rcar_mipi_dsi *dsi)
 	dev_dbg(dsi->dev, "DSI device is shutdown\n");
 }
 
+static int rcar_mipi_dsi_clk_enable(struct rcar_mipi_dsi *dsi)
+{
+	int ret;
+
+	reset_control_deassert(dsi->rstc);
+
+	ret = clk_prepare_enable(dsi->clocks.mod);
+	if (ret < 0)
+		return ret;
+
+	ret = clk_prepare_enable(dsi->clocks.dsi);
+	if (ret < 0) {
+		clk_disable_unprepare(dsi->clocks.mod);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void rcar_mipi_dsi_clk_disable(struct rcar_mipi_dsi *dsi)
+{
+	clk_disable_unprepare(dsi->clocks.dsi);
+	clk_disable_unprepare(dsi->clocks.mod);
+
+	reset_control_assert(dsi->rstc);
+}
+
 static int rcar_mipi_dsi_start_hs_clock(struct rcar_mipi_dsi *dsi)
 {
 	/*
@@ -542,13 +567,38 @@ static void rcar_mipi_dsi_enable(struct drm_bridge *bridge)
 	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
 	int ret;
 
+	ret = rcar_mipi_dsi_clk_enable(dsi);
+	if (ret < 0) {
+		dev_err(dsi->dev, "failed to enable DSI clocks\n");
+		return;
+	}
+
+	ret = rcar_mipi_dsi_startup(dsi);
+	if (ret < 0)
+		goto err_dsi_startup;
+
 	rcar_mipi_dsi_set_display_timing(dsi);
 
 	ret = rcar_mipi_dsi_start_hs_clock(dsi);
 	if (ret < 0)
-		return;
+		goto err_dsi_start_hs;
 
 	rcar_mipi_dsi_start_video(dsi);
+
+	return;
+
+err_dsi_start_hs:
+	rcar_mipi_dsi_shutdown(dsi);
+err_dsi_startup:
+	rcar_mipi_dsi_clk_disable(dsi);
+}
+
+static void rcar_mipi_dsi_disable(struct drm_bridge *bridge)
+{
+	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
+
+	rcar_mipi_dsi_shutdown(dsi);
+	rcar_mipi_dsi_clk_disable(dsi);
 }
 
 static enum drm_mode_status
@@ -566,6 +616,7 @@ static const struct drm_bridge_funcs rcar_mipi_dsi_bridge_ops = {
 	.attach = rcar_mipi_dsi_attach,
 	.mode_set = rcar_mipi_dsi_mode_set,
 	.enable = rcar_mipi_dsi_enable,
+	.disable = rcar_mipi_dsi_disable,
 	.mode_valid = rcar_mipi_dsi_bridge_mode_valid,
 };
 
@@ -573,47 +624,6 @@ static const struct drm_bridge_funcs rcar_mipi_dsi_bridge_ops = {
  * Clock Setting
  */
 
-int rcar_mipi_dsi_clk_enable(struct drm_bridge *bridge)
-{
-	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
-	int ret;
-
-	reset_control_deassert(dsi->rstc);
-
-	ret = clk_prepare_enable(dsi->clocks.mod);
-	if (ret < 0)
-		return ret;
-
-	ret = clk_prepare_enable(dsi->clocks.dsi);
-	if (ret < 0)
-		goto err_clock_mod;
-
-	ret = rcar_mipi_dsi_startup(dsi);
-	if (ret < 0)
-		goto err_clock_dsi;
-
-	return 0;
-
-err_clock_dsi:
-	clk_disable_unprepare(dsi->clocks.dsi);
-err_clock_mod:
-	clk_disable_unprepare(dsi->clocks.mod);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(rcar_mipi_dsi_clk_enable);
-
-void rcar_mipi_dsi_clk_disable(struct drm_bridge *bridge)
-{
-	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
-
-	rcar_mipi_dsi_shutdown(dsi);
-
-	clk_disable_unprepare(dsi->clocks.dsi);
-	clk_disable_unprepare(dsi->clocks.mod);
-
-	reset_control_assert(dsi->rstc);
-}
-EXPORT_SYMBOL_GPL(rcar_mipi_dsi_clk_disable);
 
 /* -----------------------------------------------------------------------------
  * Host setting
diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
deleted file mode 100644
index a937ab7ddcd4..000000000000
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * rcar_mipi_dsi.h  --  R-Car MIPI_DSI Encoder
- *
- * Copyright (C) 2020 Renesas Electronics Corporation
- */
-
-#ifndef __RCAR_MIPI_DSI_H__
-#define __RCAR_MIPI_DSI_H__
-
-struct drm_bridge;
-
-#if IS_ENABLED(CONFIG_DRM_RCAR_MIPI_DSI)
-int rcar_mipi_dsi_clk_enable(struct drm_bridge *bridge);
-void rcar_mipi_dsi_clk_disable(struct drm_bridge *bridge);
-
-#else
-static inline int rcar_mipi_dsi_clk_enable(struct drm_bridge *bridge)
-{
-	return -ENOSYS;
-}
-static inline void rcar_mipi_dsi_clk_disable(struct drm_bridge *bridge) { }
-
-#endif /* CONFIG_DRM_RCAR_MIPI_DSI */
-
-#endif /* __RCAR_MIPI_DSI_H__ */
-- 
2.30.2

