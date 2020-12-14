Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C40862DA20D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 21:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503414AbgLNUxN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 15:53:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502979AbgLNUxE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 15:53:04 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C9B1C061794
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Dec 2020 12:52:24 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2EB829E7;
        Mon, 14 Dec 2020 21:52:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607979139;
        bh=obAQPA3rmsq2e3TuEwyuEfOxkYNnosTvwaQyFGtT7P0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SKz+hAcOIQo4/P5lG3BElvagvCalLjk24vRjfVf0pABWeN1SZZ24997UXv1SFmo8I
         7klLpini8ZbbbRb8TeFiJJhtTTTuaMCjWAzJI9I3tNVEpz3+1TQ5zFuIDRbffl+WkS
         vZmBz7AdRAAQyaqlMTwhngzFSF1tLHrDMeCW6jno=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 4/9] drm: rcar-du: Use DRM-managed allocation for VSP planes
Date:   Mon, 14 Dec 2020 22:52:03 +0200
Message-Id: <20201214205208.10248-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
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
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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

