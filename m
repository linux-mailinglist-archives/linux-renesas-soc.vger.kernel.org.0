Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29DEA4D7129
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Mar 2022 22:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbiCLVzk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 12 Mar 2022 16:55:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbiCLVzk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Mar 2022 16:55:40 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CDB1C2A70F
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Mar 2022 13:54:33 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,177,1643641200"; 
   d="scan'208";a="113308979"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Mar 2022 06:54:33 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C90764005E2B;
        Sun, 13 Mar 2022 06:54:30 +0900 (JST)
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
Subject: [PATCH 3/7] drm: rcar-du: Add max_width and max_height to struct rcar_du_device_info
Date:   Sat, 12 Mar 2022 21:54:13 +0000
Message-Id: <20220312215417.8023-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220312215417.8023-1-biju.das.jz@bp.renesas.com>
References: <20220312215417.8023-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
RFC->V1:
 * No Change
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-13-biju.das.jz@bp.renesas.com/
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 36 +++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h |  4 +++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 17 +++++--------
 3 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 1bc7325aa356..4640c356a532 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -56,6 +56,8 @@ static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
@@ -79,6 +81,8 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
 		},
 	},
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
@@ -107,6 +111,8 @@ static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
 		},
 	},
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
@@ -137,6 +143,8 @@ static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(1),
 };
 
@@ -168,6 +176,8 @@ static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(1),
 };
 
@@ -196,6 +206,8 @@ static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
 	},
 	.num_lvds = 2,
 	.num_rpf = 4,
+	.max_width = 8190,
+	.max_height = 8190,
 	.lvds_clk_mask =  BIT(1) | BIT(0),
 };
 
@@ -227,6 +239,8 @@ static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(1),
 };
 
@@ -249,6 +263,8 @@ static const struct rcar_du_device_info rcar_du_r8a7779_info = {
 			.port = 1,
 		},
 	},
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7790_info = {
@@ -280,6 +296,8 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 	},
 	.num_lvds = 2,
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 /* M2-W (r8a7791) and M2-N (r8a7793) are identical */
@@ -306,6 +324,8 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7792_info = {
@@ -327,6 +347,8 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
 		},
 	},
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7794_info = {
@@ -351,6 +373,8 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 		},
 	},
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7795_info = {
@@ -385,6 +409,8 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(2) | BIT(1),
 };
 
@@ -416,6 +442,8 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(1),
 };
 
@@ -447,6 +475,8 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(1),
 };
 
@@ -474,6 +504,8 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
@@ -502,6 +534,8 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
 	},
 	.num_lvds = 2,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.lvds_clk_mask =  BIT(1) | BIT(0),
 };
 
@@ -522,6 +556,8 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
 		},
 	},
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dsi_clk_mask =  BIT(1) | BIT(0),
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 68c5de59d18d..b0553b43363b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -70,6 +70,8 @@ struct rcar_du_output_routing {
  * @routes: array of CRTC to output routes, indexed by output (RCAR_DU_OUTPUT_*)
  * @num_lvds: number of internal LVDS encoders
  * @num_rpf: max number of RPFs in VSP
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

