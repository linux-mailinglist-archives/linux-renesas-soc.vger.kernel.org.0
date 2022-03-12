Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0304D7128
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Mar 2022 22:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbiCLVzh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 12 Mar 2022 16:55:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbiCLVzg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Mar 2022 16:55:36 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7E8852A70F
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Mar 2022 13:54:30 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,177,1643641200"; 
   d="scan'208";a="113308973"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Mar 2022 06:54:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CEC8D4007521;
        Sun, 13 Mar 2022 06:54:27 +0900 (JST)
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
Subject: [PATCH 2/7] drm: rcar-du: Add num_rpf to struct rcar_du_device_info
Date:   Sat, 12 Mar 2022 21:54:12 +0000
Message-Id: <20220312215417.8023-3-biju.das.jz@bp.renesas.com>
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

Number of RPF's VSP is different on R-Car and RZ/G2L
 R-Car Gen3 -> 5 RPFs
 R-Car Gen2 -> 4 RPFs
 RZ/G2L -> 2 RPFs

Add num_rpf to struct rcar_du_device_info to support later
SoC without any code changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFC->v1:
 * Fixed the comment for num_rpf s/rpf's/RPFs/ and s/vsp/VSP/
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-12-biju.das.jz@bp.renesas.com/
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 17 +++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h |  2 ++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c |  6 +-----
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 957ea97541d5..1bc7325aa356 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -55,6 +55,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
@@ -77,6 +78,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
 			.port = 1,
 		},
 	},
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
@@ -104,6 +106,7 @@ static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
 			.port = 2,
 		},
 	},
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
@@ -133,6 +136,7 @@ static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(1),
 };
 
@@ -163,6 +167,7 @@ static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(1),
 };
 
@@ -190,6 +195,7 @@ static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
 		},
 	},
 	.num_lvds = 2,
+	.num_rpf = 4,
 	.lvds_clk_mask =  BIT(1) | BIT(0),
 };
 
@@ -220,6 +226,7 @@ static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(1),
 };
 
@@ -272,6 +279,7 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 		},
 	},
 	.num_lvds = 2,
+	.num_rpf = 4,
 };
 
 /* M2-W (r8a7791) and M2-N (r8a7793) are identical */
@@ -297,6 +305,7 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7792_info = {
@@ -317,6 +326,7 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
 			.port = 1,
 		},
 	},
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7794_info = {
@@ -340,6 +350,7 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 			.port = 1,
 		},
 	},
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7795_info = {
@@ -373,6 +384,7 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(2) | BIT(1),
 };
 
@@ -403,6 +415,7 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(1),
 };
 
@@ -433,6 +446,7 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(1),
 };
 
@@ -459,6 +473,7 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
@@ -486,6 +501,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
 		},
 	},
 	.num_lvds = 2,
+	.num_rpf = 5,
 	.lvds_clk_mask =  BIT(1) | BIT(0),
 };
 
@@ -505,6 +521,7 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
 			.port = 1,
 		},
 	},
+	.num_rpf = 5,
 	.dsi_clk_mask =  BIT(1) | BIT(0),
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 101f42df86ea..68c5de59d18d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -69,6 +69,7 @@ struct rcar_du_output_routing {
  * @channels_mask: bit mask of available DU channels
  * @routes: array of CRTC to output routes, indexed by output (RCAR_DU_OUTPUT_*)
  * @num_lvds: number of internal LVDS encoders
+ * @num_rpf: max number of RPFs in VSP
  * @dpll_mask: bit mask of DU channels equipped with a DPLL
  * @dsi_clk_mask: bitmask of channels that can use the DSI clock as dot clock
  * @lvds_clk_mask: bitmask of channels that can use the LVDS clock as dot clock
@@ -80,6 +81,7 @@ struct rcar_du_device_info {
 	unsigned int channels_mask;
 	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
 	unsigned int num_lvds;
+	unsigned int num_rpf;
 	unsigned int dpll_mask;
 	unsigned int dsi_clk_mask;
 	unsigned int lvds_clk_mask;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index b7fc5b069cbc..cf045a203aa5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -415,11 +415,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 	if (ret < 0)
 		return ret;
 
-	 /*
-	  * The VSP2D (Gen3) has 5 RPFs, but the VSP1D (Gen2) is limited to
-	  * 4 RPFs.
-	  */
-	num_planes = rcdu->info->gen >= 3 ? 5 : 4;
+	num_planes = rcdu->info->num_rpf;
 
 	vsp->planes = kcalloc(num_planes, sizeof(*vsp->planes), GFP_KERNEL);
 	if (!vsp->planes)
-- 
2.17.1

