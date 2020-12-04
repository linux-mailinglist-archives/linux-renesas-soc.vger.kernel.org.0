Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0ED42CF689
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Dec 2020 23:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgLDWCr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Dec 2020 17:02:47 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:52062 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgLDWCq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 17:02:46 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 197291210;
        Fri,  4 Dec 2020 23:01:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607119307;
        bh=6DzCoxk/jQSlj9PXhtwV6vqLYFaL+nzMhtoRT6W2t60=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aON3x5iPAOg10SZmflw6FUwDQ/E5CTYTaeUCULGJbTD7cd1Dz8vWniuBFiSAAa8c8
         fNFB609HtG4eImlWJMuJLCMHB6tZWyWRjdKmFdJq+lq1SDfzjYdQC0gsc0zi+yDMQP
         e5cfq/0/10w9VUE+qeAWKnGPAzIERp/c0tiHJuas=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/9] drm: rcar-du: Use DRM-managed allocation for VSP planes
Date:   Sat,  5 Dec 2020 00:01:34 +0200
Message-Id: <20201204220139.15272-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

devm_kcalloc() is the wrong API to allocate planes, as the lifetime of
the planes is tied to the DRM device, not the device to driver
binding. drmm_kcalloc() isn't a good option either, as it would result
in the planes being freed before being unregistered during the managed
cleanup of the DRM objects. Use a plain kcalloc(), and cleanup the
planes and free the memory in the existing rcar_du_vsp_cleanup()
handler.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 4dcb1bfbe201..78a886651d9f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -21,6 +21,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/of_platform.h>
 #include <linux/scatterlist.h>
+#include <linux/slab.h>
 #include <linux/videodev2.h>
 
 #include <media/vsp1.h>
@@ -344,6 +345,15 @@ static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
 static void rcar_du_vsp_cleanup(struct drm_device *dev, void *res)
 {
 	struct rcar_du_vsp *vsp = res;
+	unsigned int i;
+
+	for (i = 0; i < vsp->num_planes; ++i) {
+		struct rcar_du_vsp_plane *plane = &vsp->planes[i];
+
+		drm_plane_cleanup(&plane->plane);
+	}
+
+	kfree(vsp->planes);
 
 	put_device(vsp->vsp);
 }
@@ -354,6 +364,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 	struct rcar_du_device *rcdu = vsp->dev;
 	struct platform_device *pdev;
 	unsigned int num_crtcs = hweight32(crtcs);
+	unsigned int num_planes;
 	unsigned int i;
 	int ret;
 
@@ -376,14 +387,13 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 	  * The VSP2D (Gen3) has 5 RPFs, but the VSP1D (Gen2) is limited to
 	  * 4 RPFs.
 	  */
-	vsp->num_planes = rcdu->info->gen >= 3 ? 5 : 4;
+	num_planes = rcdu->info->gen >= 3 ? 5 : 4;
 
-	vsp->planes = devm_kcalloc(rcdu->dev, vsp->num_planes,
-				   sizeof(*vsp->planes), GFP_KERNEL);
+	vsp->planes = kcalloc(num_planes, sizeof(*vsp->planes), GFP_KERNEL);
 	if (!vsp->planes)
 		return -ENOMEM;
 
-	for (i = 0; i < vsp->num_planes; ++i) {
+	for (i = 0; i < num_planes; ++i) {
 		enum drm_plane_type type = i < num_crtcs
 					 ? DRM_PLANE_TYPE_PRIMARY
 					 : DRM_PLANE_TYPE_OVERLAY;
@@ -409,8 +419,10 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		} else {
 			drm_plane_create_alpha_property(&plane->plane);
 			drm_plane_create_zpos_property(&plane->plane, 1, 1,
-						       vsp->num_planes - 1);
+						       num_planes - 1);
 		}
+
+		vsp->num_planes++;
 	}
 
 	return 0;
-- 
Regards,

Laurent Pinchart

