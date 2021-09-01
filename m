Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9BC33FE693
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Sep 2021 02:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239077AbhIAXuO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 19:50:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53766 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235391AbhIAXuN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 19:50:13 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4EDF1909;
        Thu,  2 Sep 2021 01:49:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630540154;
        bh=KR+5ekX2d7jbFxpRvg5s+HRzyRMzZ198XHNPIp2ghgg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OxpYBnfqPpr3kLhTcfrGIHXxISWsGQrRVUXPdf2fTkLEIlh/g4zSeCYDQaABBqzrx
         TCnMJMALK3epIW7VS+BC7lve8DikMiMS1tu7mLLGvUEBaUKYwR3tEpAAQ7u709KXd3
         khBme0lOeUXzrespriNV+YKTbNp/gTa72mKuD350=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 5/5] drm: rcar-du: Add r8a779a0 device support
Date:   Thu,  2 Sep 2021 00:49:07 +0100
Message-Id: <20210901234907.1608896-6-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901234907.1608896-1-kieran.bingham@ideasonboard.com>
References: <20210901234907.1608896-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Extend the rcar_du_device_info structure and rcar_du_output enum to
support DSI outputs and utilise these additions to provide support for
the R8A779A0 V3U platform.

While the DIDSR register field is now named "DSI/CSI-2-TX-IF0 Dot Clock
Select" the existing define LVDS0 is used, and is directly compatible
from other DU variants.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---

I can add a macro named DIDSR_LDCS_DSI0 duplicating DIDSR_LDCS_LVDS0 if
it's deemed better.

v2:
 - No longer requires a direct interface with the DSI encoder
 - Use correct field naming (LDCS)
 - Remove per-crtc clock feature.

 drivers/gpu/drm/rcar-du/rcar_du_crtc.h  |  2 ++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 20 ++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  2 ++
 drivers/gpu/drm/rcar-du/rcar_du_group.c |  2 ++
 4 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 440e6b4fbb58..26e79b74898c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -96,6 +96,8 @@ struct rcar_du_crtc_state {
 enum rcar_du_output {
 	RCAR_DU_OUTPUT_DPAD0,
 	RCAR_DU_OUTPUT_DPAD1,
+	RCAR_DU_OUTPUT_DSI0,
+	RCAR_DU_OUTPUT_DSI1,
 	RCAR_DU_OUTPUT_HDMI0,
 	RCAR_DU_OUTPUT_HDMI1,
 	RCAR_DU_OUTPUT_LVDS0,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 8a094d5b9c77..8b4c8851b6bc 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -489,6 +489,25 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
 	.lvds_clk_mask =  BIT(1) | BIT(0),
 };
 
+static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
+	.gen = 3,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_VSP1_SOURCE,
+	.channels_mask = BIT(1) | BIT(0),
+	.routes = {
+		/* R8A779A0 has two MIPI DSI outputs. */
+		[RCAR_DU_OUTPUT_DSI0] = {
+			.possible_crtcs = BIT(0),
+			.port = 0,
+		},
+		[RCAR_DU_OUTPUT_DSI1] = {
+			.possible_crtcs = BIT(1),
+			.port = 1,
+		},
+	},
+	.dsi_clk_mask =  BIT(1) | BIT(0),
+};
+
 static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
 	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
@@ -513,6 +532,7 @@ static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a77980", .data = &rcar_du_r8a77970_info },
 	{ .compatible = "renesas,du-r8a77990", .data = &rcar_du_r8a7799x_info },
 	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
+	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 5fe9152454ff..cf98d43d72d0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -57,6 +57,7 @@ struct rcar_du_output_routing {
  * @routes: array of CRTC to output routes, indexed by output (RCAR_DU_OUTPUT_*)
  * @num_lvds: number of internal LVDS encoders
  * @dpll_mask: bit mask of DU channels equipped with a DPLL
+ * @dsi_clk_mask: bitmask of channels that can use the DSI clock as dot clock
  * @lvds_clk_mask: bitmask of channels that can use the LVDS clock as dot clock
  */
 struct rcar_du_device_info {
@@ -67,6 +68,7 @@ struct rcar_du_device_info {
 	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
 	unsigned int num_lvds;
 	unsigned int dpll_mask;
+	unsigned int dsi_clk_mask;
 	unsigned int lvds_clk_mask;
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index a984eef265d2..27c912bab76e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -124,6 +124,8 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
 		if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index))
 			didsr |= DIDSR_LDCS_LVDS0(i)
 			      |  DIDSR_PDCS_CLK(i, 0);
+		else if (rcdu->info->dsi_clk_mask & BIT(rcrtc->index))
+			didsr |= DIDSR_LDCS_LVDS0(i);
 		else
 			didsr |= DIDSR_LDCS_DCLKIN(i)
 			      |  DIDSR_PDCS_CLK(i, 0);
-- 
2.30.2

