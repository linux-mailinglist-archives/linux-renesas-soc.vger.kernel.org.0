Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A2348CA30
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 18:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355955AbiALRqw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 12:46:52 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:52952 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1343961AbiALRqt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 12:46:49 -0500
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; 
   d="scan'208";a="106270372"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jan 2022 02:46:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7B16B4005E1F;
        Thu, 13 Jan 2022 02:46:46 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC 12/28] drm: rcar-du: Add max_width and max_height to struct rcar_du_device_info
Date:   Wed, 12 Jan 2022 17:45:56 +0000
Message-Id: <20220112174612.10773-13-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There are some differences related to max frame size supported by different
R-Car/RZ-G family of SoC's

Max frame size supported by R-Car Gen1 & R-Car Gen2 is 4095x2047
Max frame size supported by R-Car Gen3 is 8190x8190
Max frame size supported by RZ/G2L is 1920x1080

Add max_width and max_height to struct rcar_du_device_info to support later
SoC without any code changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 36 +++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h |  4 +++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 17 +++++--------
 3 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 5ca7cd085794..7a492323afb3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -57,6 +57,8 @@ static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
@@ -80,6 +82,8 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
 		},
 	},
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
@@ -108,6 +112,8 @@ static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
 		},
 	},
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
@@ -138,6 +144,8 @@ static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(1),
 };
 
@@ -169,6 +177,8 @@ static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(1),
 };
 
@@ -197,6 +207,8 @@ static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
 	},
 	.num_lvds = 2,
 	.num_rpf = 4,
+	.max_width = 8190,
+	.max_height = 8190,
 	.lvds_clk_mask =  BIT(1) | BIT(0),
 };
 
@@ -228,6 +240,8 @@ static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(1),
 };
 
@@ -250,6 +264,8 @@ static const struct rcar_du_device_info rcar_du_r8a7779_info = {
 			.port = 1,
 		},
 	},
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7790_info = {
@@ -281,6 +297,8 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 	},
 	.num_lvds = 2,
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 /* M2-W (r8a7791) and M2-N (r8a7793) are identical */
@@ -307,6 +325,8 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7792_info = {
@@ -328,6 +348,8 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
 		},
 	},
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7794_info = {
@@ -352,6 +374,8 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 		},
 	},
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7795_info = {
@@ -386,6 +410,8 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(2) | BIT(1),
 };
 
@@ -417,6 +443,8 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(1),
 };
 
@@ -448,6 +476,8 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(1),
 };
 
@@ -475,6 +505,8 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
@@ -503,6 +535,8 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
 	},
 	.num_lvds = 2,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.lvds_clk_mask =  BIT(1) | BIT(0),
 };
 
@@ -523,6 +557,8 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
 		},
 	},
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dsi_clk_mask =  BIT(1) | BIT(0),
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 9792a77590be..2f0ccc9e67d1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -70,6 +70,8 @@ struct rcar_du_output_routing {
  * @routes: array of CRTC to output routes, indexed by output (RCAR_DU_OUTPUT_*)
  * @num_lvds: number of internal LVDS encoders
  * @num_rpf: max number of rpf's in vsp
+ * @max_width: max frame width
+ * @max_height: max frame height
  * @dpll_mask: bit mask of DU channels equipped with a DPLL
  * @dsi_clk_mask: bitmask of channels that can use the DSI clock as dot clock
  * @lvds_clk_mask: bitmask of channels that can use the LVDS clock as dot clock
@@ -82,6 +84,8 @@ struct rcar_du_device_info {
 	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
 	unsigned int num_lvds;
 	unsigned int num_rpf;
+	unsigned int max_width;
+	unsigned int max_height;
 	unsigned int dpll_mask;
 	unsigned int dsi_clk_mask;
 	unsigned int lvds_clk_mask;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 190dbb7f15dd..5857705aac20 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -834,17 +834,12 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	dev->mode_config.funcs = &rcar_du_mode_config_funcs;
 	dev->mode_config.helper_private = &rcar_du_mode_config_helper;
 
-	if (rcdu->info->gen < 3) {
-		dev->mode_config.max_width = 4095;
-		dev->mode_config.max_height = 2047;
-	} else {
-		/*
-		 * The Gen3 DU uses the VSP1 for memory access, and is limited
-		 * to frame sizes of 8190x8190.
-		 */
-		dev->mode_config.max_width = 8190;
-		dev->mode_config.max_height = 8190;
-	}
+	/*
+	 * The Gen3 DU uses the VSP1 for memory access, and is limited
+	 * to frame sizes of 8190x8190.
+	 */
+	dev->mode_config.max_width = rcdu->info->max_width;
+	dev->mode_config.max_height = rcdu->info->max_height;
 
 	rcdu->num_crtcs = hweight8(rcdu->info->channels_mask);
 
-- 
2.17.1

