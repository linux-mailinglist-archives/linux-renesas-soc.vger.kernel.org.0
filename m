Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80F6C5B35F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Sep 2022 13:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiIILAS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Sep 2022 07:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbiIILAL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2022 07:00:11 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 813404D83C
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 03:59:52 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 771661F8F0;
        Fri,  9 Sep 2022 10:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1662721190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EyDy+6IAZ2kEPBVMbNVEMOJA0fO7qOzTOLnLFYNp5X8=;
        b=0aie82vvYwxy+Io0tzq+uJJ9Hq2rLNZ7PheR40W45DrI/75QnTq2dPsrt1gC8vrBEluvNp
        aaTuc4LNJAR52EobJc87amatR4O4DVMToYVrjxJ61BLFYSCW6I9pgBMuP7PiahGGmYnzkl
        nlSRjYYstdpllbvZzdpDMsHohIpiRPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1662721190;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EyDy+6IAZ2kEPBVMbNVEMOJA0fO7qOzTOLnLFYNp5X8=;
        b=dM9LQGxzdZxJbq4jYSd1V0T9PIRp36CcfiOj9MQCSFyW+2EWKJ/XrLF5VGClLKjN6bPvYi
        40pl7n2PFo49IEAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 25C8213AE9;
        Fri,  9 Sep 2022 10:59:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id qE5lCKYcG2M0BwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 09 Sep 2022 10:59:50 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com,
        kherbst@redhat.com, lyude@redhat.com,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jyri.sarha@iki.fi,
        tomba@kernel.org, sam@ravnborg.org
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/4] drm/plane: Remove drm_plane_init()
Date:   Fri,  9 Sep 2022 12:59:44 +0200
Message-Id: <20220909105947.6487-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220909105947.6487-1-tzimmermann@suse.de>
References: <20220909105947.6487-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Open-code drm_plane_init() and remove the function from DRM. The
implementation of drm_plane_init() is a simple wrapper around a call
to drm_universal_plane_init(), so drivers can just use that instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_modeset_helper.c       |  3 +-
 drivers/gpu/drm/drm_plane.c                | 32 ----------------------
 drivers/gpu/drm/nouveau/dispnv04/overlay.c | 13 +++++----
 drivers/gpu/drm/shmobile/shmob_drm_plane.c |  7 +++--
 drivers/gpu/drm/tilcdc/tilcdc_plane.c      |  9 +++---
 include/drm/drm_plane.h                    |  8 +-----
 6 files changed, 17 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
index bd609a978848..611dd01fb604 100644
--- a/drivers/gpu/drm/drm_modeset_helper.c
+++ b/drivers/gpu/drm/drm_modeset_helper.c
@@ -100,8 +100,7 @@ EXPORT_SYMBOL(drm_helper_mode_fill_fb_struct);
  * This is the minimal list of formats that seem to be safe for modeset use
  * with all current DRM drivers.  Most hardware can actually support more
  * formats than this and drivers may specify a more accurate list when
- * creating the primary plane.  However drivers that still call
- * drm_plane_init() will use this minimal format list as the default.
+ * creating the primary plane.
  */
 static const uint32_t safe_modeset_formats[] = {
 	DRM_FORMAT_XRGB8888,
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 726f2f163c26..0f14b4d3bb10 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -482,38 +482,6 @@ void drm_plane_unregister_all(struct drm_device *dev)
 	}
 }
 
-/**
- * drm_plane_init - Initialize a legacy plane
- * @dev: DRM device
- * @plane: plane object to init
- * @possible_crtcs: bitmask of possible CRTCs
- * @funcs: callbacks for the new plane
- * @formats: array of supported formats (DRM_FORMAT\_\*)
- * @format_count: number of elements in @formats
- * @is_primary: plane type (primary vs overlay)
- *
- * Legacy API to initialize a DRM plane.
- *
- * New drivers should call drm_universal_plane_init() instead.
- *
- * Returns:
- * Zero on success, error code on failure.
- */
-int drm_plane_init(struct drm_device *dev, struct drm_plane *plane,
-		   uint32_t possible_crtcs,
-		   const struct drm_plane_funcs *funcs,
-		   const uint32_t *formats, unsigned int format_count,
-		   bool is_primary)
-{
-	enum drm_plane_type type;
-
-	type = is_primary ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
-	return drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
-					formats, format_count,
-					NULL, type, NULL);
-}
-EXPORT_SYMBOL(drm_plane_init);
-
 /**
  * drm_plane_cleanup - Clean up the core plane usage
  * @plane: plane to cleanup
diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index 37e63e98cd08..33f29736024a 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -296,9 +296,10 @@ nv10_overlay_init(struct drm_device *device)
 		break;
 	}
 
-	ret = drm_plane_init(device, &plane->base, 3 /* both crtc's */,
-			     &nv10_plane_funcs,
-			     formats, num_formats, false);
+	ret = drm_universal_plane_init(device, &plane->base, 3 /* both crtc's */,
+				       &nv10_plane_funcs,
+				       formats, num_formats, NULL,
+				       DRM_PLANE_TYPE_OVERLAY, NULL);
 	if (ret)
 		goto err;
 
@@ -475,9 +476,9 @@ nv04_overlay_init(struct drm_device *device)
 	if (!plane)
 		return;
 
-	ret = drm_plane_init(device, &plane->base, 1 /* single crtc */,
-			     &nv04_plane_funcs,
-			     formats, 2, false);
+	ret = drm_universal_plane_init(device, &plane->base, 1 /* single crtc */,
+				       &nv04_plane_funcs, formats, 2, NULL,
+				       DRM_PLANE_TYPE_OVERLAY, NULL);
 	if (ret)
 		goto err;
 
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
index 54228424793a..6c5f0cbe7d95 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
@@ -252,9 +252,10 @@ int shmob_drm_plane_create(struct shmob_drm_device *sdev, unsigned int index)
 	splane->index = index;
 	splane->alpha = 255;
 
-	ret = drm_plane_init(sdev->ddev, &splane->plane, 1,
-			     &shmob_drm_plane_funcs, formats,
-			     ARRAY_SIZE(formats), false);
+	ret = drm_universal_plane_init(sdev->ddev, &splane->plane, 1,
+				       &shmob_drm_plane_funcs,
+				       formats, ARRAY_SIZE(formats), NULL,
+				       DRM_PLANE_TYPE_OVERLAY, NULL);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index 0ccf791301cb..cf77a8ce7398 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -105,11 +105,10 @@ int tilcdc_plane_init(struct drm_device *dev,
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	int ret;
 
-	ret = drm_plane_init(dev, plane, 1,
-			     &tilcdc_plane_funcs,
-			     priv->pixelformats,
-			     priv->num_pixelformats,
-			     true);
+	ret = drm_universal_plane_init(dev, plane, 1, &tilcdc_plane_funcs,
+				       priv->pixelformats,
+				       priv->num_pixelformats,
+				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
 	if (ret) {
 		dev_err(dev->dev, "Failed to initialize plane: %d\n", ret);
 		return ret;
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 89ea54652e87..910cb941f3d5 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -631,7 +631,7 @@ struct drm_plane {
 	unsigned int format_count;
 	/**
 	 * @format_default: driver hasn't supplied supported formats for the
-	 * plane. Used by the drm_plane_init compatibility wrapper only.
+	 * plane. Used by the non-atomic driver compatibility wrapper only.
 	 */
 	bool format_default;
 
@@ -762,12 +762,6 @@ int drm_universal_plane_init(struct drm_device *dev,
 			     const uint64_t *format_modifiers,
 			     enum drm_plane_type type,
 			     const char *name, ...);
-int drm_plane_init(struct drm_device *dev,
-		   struct drm_plane *plane,
-		   uint32_t possible_crtcs,
-		   const struct drm_plane_funcs *funcs,
-		   const uint32_t *formats, unsigned int format_count,
-		   bool is_primary);
 void drm_plane_cleanup(struct drm_plane *plane);
 
 __printf(10, 11)
-- 
2.37.2

