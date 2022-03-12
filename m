Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA004D7131
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Mar 2022 22:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbiCLVzt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 12 Mar 2022 16:55:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbiCLVzs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Mar 2022 16:55:48 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D82A036E25
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Mar 2022 13:54:41 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,177,1643641200"; 
   d="scan'208";a="113308993"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Mar 2022 06:54:41 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 41A4A4007521;
        Sun, 13 Mar 2022 06:54:39 +0900 (JST)
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
Subject: [PATCH 6/7] drm: rcar-du: Factorise rcar_du_vsp{complete,enable,plane_atomic_check}
Date:   Sat, 12 Mar 2022 21:54:16 +0000
Message-Id: <20220312215417.8023-7-biju.das.jz@bp.renesas.com>
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

RZ/G2L does not have group/plane registers compared to RCar, hence it
needs a different CRTC implementation. Factorise rcar_du_vsp{complete,
enable,plane_atomic_check} so that it can support later SoC without any
code changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFC->v1:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c |  3 +++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h |  9 +++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 12 ++++++++----
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 2b2c0653b0fe..5b245b2a379f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -38,6 +38,9 @@ static struct rcar_du_crtc_helper_funcs crtc_helper_funcs = {
 	.du_planes_init = rcar_du_planes_init,
 	.du_crtc_create = rcar_du_crtc_create,
 	.du_atomic_check_planes = rcar_du_atomic_check_planes,
+	.__du_plane_setup = __rcar_du_plane_setup,
+	.__du_plane_atomic_check = __rcar_du_plane_atomic_check,
+	.du_crtc_finish_page_flip = rcar_du_crtc_finish_page_flip,
 };
 
 static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 164cd9854aaf..bb2146621eb4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -66,6 +66,9 @@ struct rcar_du_output_routing {
  * @du_planes_init: pointer to du_plane_init function
  * @du_crtc_create: pointer to du_crtc_create function
  * @du_atomic_check_planes: pointer to du_atomic_check_planes function
+ * @__du_plane_setup: pointer to __du_plane_setup function
+ * @__du_plane_atomic_check: pointer to __du_plane_atomic_check function
+ * @du_crtc_finish_page_flip: pointer to du_crtc_finish_page_flip function
  */
 struct rcar_du_crtc_helper_funcs {
 	int (*du_planes_init)(struct rcar_du_group *rgrp);
@@ -73,6 +76,12 @@ struct rcar_du_crtc_helper_funcs {
 			      unsigned int hwindex);
 	int (*du_atomic_check_planes)(struct drm_device *dev,
 				      struct drm_atomic_state *state);
+	void (*__du_plane_setup)(struct rcar_du_group *rgrp,
+				 const struct rcar_du_plane_state *state);
+	int (*__du_plane_atomic_check)(struct drm_plane *plane,
+				       struct drm_plane_state *state,
+				const struct rcar_du_format_info **format);
+	void (*du_crtc_finish_page_flip)(struct rcar_du_crtc *rcrtc);
 };
 
 /*
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index cf045a203aa5..41928a94c903 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -35,12 +35,13 @@
 static void rcar_du_vsp_complete(void *private, unsigned int status, u32 crc)
 {
 	struct rcar_du_crtc *crtc = private;
+	struct rcar_du_device *rcdu = crtc->dev;
 
 	if (crtc->vblank_enable)
 		drm_crtc_handle_vblank(&crtc->crtc);
 
 	if (status & VSP1_DU_STATUS_COMPLETE)
-		rcar_du_crtc_finish_page_flip(crtc);
+		rcdu->info->fns->du_crtc_finish_page_flip(crtc);
 	if (status & VSP1_DU_STATUS_WRITEBACK)
 		rcar_du_writeback_complete(crtc);
 
@@ -82,7 +83,7 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 	else
 		state.hwindex = crtc->index % 2;
 
-	__rcar_du_plane_setup(crtc->group, &state);
+	rcdu->info->fns->__du_plane_setup(crtc->group, &state);
 
 	/*
 	 * Ensure that the plane source configuration takes effect by requesting
@@ -294,12 +295,15 @@ static void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
 					  struct drm_atomic_state *state)
 {
+	struct rcar_du_vsp *vsp = to_rcar_vsp_plane(plane)->vsp;
+	struct rcar_du_device *rcdu = vsp->dev;
+
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct rcar_du_vsp_plane_state *rstate = to_rcar_vsp_plane_state(new_plane_state);
 
-	return __rcar_du_plane_atomic_check(plane, new_plane_state,
-					    &rstate->format);
+	return rcdu->info->fns->__du_plane_atomic_check(plane, new_plane_state,
+							&rstate->format);
 }
 
 static void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
-- 
2.17.1

