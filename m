Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E623619E6F9
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Apr 2020 20:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgDDSNK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 4 Apr 2020 14:13:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37812 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgDDSNK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Apr 2020 14:13:10 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBEAB312;
        Sat,  4 Apr 2020 20:13:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586023987;
        bh=0U8UPlPIPmiMkCLHWdZ8T3JpOyKrO7zLDzXlPMKz4ts=;
        h=From:To:Cc:Subject:Date:From;
        b=Y3edNOVnQX/vqtfl+Dyv4g8k8nFER/njqgkAqy9pPsOMQUVHNBRmnJ53GwIxittKy
         OFQlnueDYNpql077rTQdJCkaWmAUhWMDddyA8E51vVmm/0+kKrwFRZ2Ht6uy73zIMW
         SBFo6Ol5FbisTZwVLGmjWkKqShnuNZimFwF/mDds=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Stone <daniel@fooishbar.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm: plane: Verify that no or all planes have a zpos property
Date:   Sat,  4 Apr 2020 21:12:53 +0300
Message-Id: <20200404181253.25873-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The zpos property is used by userspace to sort the order of planes.
While the property is not mandatory for drivers to implement, mixing
planes with and without zpos confuses userspace, and shall not be
allowed. Clarify this in the documentation and warn at runtime if the
drivers mixes planes with and without zpos properties.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/drm_blend.c | 10 ++++++----
 drivers/gpu/drm/drm_plane.c |  9 +++++++++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 88eedee018d3..f1dcad96f341 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -135,7 +135,9 @@
  *	are underneath planes with higher Z position values. Two planes with the
  *	same Z position value have undefined ordering. Note that the Z position
  *	value can also be immutable, to inform userspace about the hard-coded
- *	stacking of planes, see drm_plane_create_zpos_immutable_property().
+ *	stacking of planes, see drm_plane_create_zpos_immutable_property(). If
+ *	any plane has a zpos property (either mutable or immutable), then all
+ *	planes shall have a zpos property.
  *
  * pixel blend mode:
  *	Pixel blend mode is set up with drm_plane_create_blend_mode_property().
@@ -344,10 +346,10 @@ EXPORT_SYMBOL(drm_rotation_simplify);
  * should be set to 0 and max to maximal number of planes for given crtc - 1.
  *
  * If zpos of some planes cannot be changed (like fixed background or
- * cursor/topmost planes), driver should adjust min/max values and assign those
- * planes immutable zpos property with lower or higher values (for more
+ * cursor/topmost planes), drivers shall adjust the min/max values and assign
+ * those planes immutable zpos properties with lower or higher values (for more
  * information, see drm_plane_create_zpos_immutable_property() function). In such
- * case driver should also assign proper initial zpos values for all planes in
+ * case drivers shall also assign proper initial zpos values for all planes in
  * its plane_reset() callback, so the planes will be always sorted properly.
  *
  * See also drm_atomic_normalize_zpos().
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index d6ad60ab0d38..efb9c16ddc21 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -289,6 +289,8 @@ EXPORT_SYMBOL(drm_universal_plane_init);
 
 int drm_plane_register_all(struct drm_device *dev)
 {
+	unsigned int num_planes = 0;
+	unsigned int num_zpos = 0;
 	struct drm_plane *plane;
 	int ret = 0;
 
@@ -297,8 +299,15 @@ int drm_plane_register_all(struct drm_device *dev)
 			ret = plane->funcs->late_register(plane);
 		if (ret)
 			return ret;
+
+		if (plane->zpos_property)
+			num_zpos++;
+		num_planes++;
 	}
 
+	drm_WARN(dev, num_planes != num_zpos,
+		 "Mixing planes with and without zpos property is invalid\n");
+
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

