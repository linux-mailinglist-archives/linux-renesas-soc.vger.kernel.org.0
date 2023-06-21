Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2572A737D98
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jun 2023 10:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbjFUIK6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Jun 2023 04:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbjFUIK4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2023 04:10:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5328910DA
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jun 2023 01:10:55 -0700 (PDT)
Received: from uno.lan (unknown [IPv6:2001:b07:5d2e:52c9:1cf0:b3bc:c785:4625])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E60DBD77;
        Wed, 21 Jun 2023 10:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687335017;
        bh=Ap0cu7IR+Hff/WHhknNnXA/M5CqBHc7utucP7RaYZ5k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B5iSl4AJJdmDGvJ5vLqTJQzCgaE30efpe52Flv0DMVIpieUHthkpnYn3SRyP9Urn9
         X3cNOxw+AB5GdNUtW0LZfRXYM53pUfrwzdeALTyRGglHzyPi6ifuTocGBXGi32IEnK
         ZOh8gscMCA9Dq4B/X3+jeF+jJcs9dcMScGvn5Tks=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Simon Ser <contact@emersion.fr>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
        xaver.hugl@gmail.com, Melissa Wen <mwen@igalia.com>,
        wayland-devel <wayland-devel@lists.freedesktop.org>,
        mdaenzer@redhat.com, Uma Shankar <uma.shankar@intel.com>,
        Victoria Brekenfeld <victoria@system76.com>, aleixpol@kde.org,
        Sebastian Wick <sebastian.wick@redhat.com>,
        Joshua Ashton <joshua@froggi.es>, airlied@gmail.com,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        daniel@ffwll.ch, harry.wentland@amd.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        Rodrigo.Siqueira@amd.com, sunpeng.li@amd.com, tzimmermann@suse.de,
        Xinhui.Pan@amd.com,
        DRI Development <dri-devel@lists.freedesktop.org>,
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [RFC 4/9] drm/drm_color_mgmt: add function to create 3D LUT modes supported
Date:   Wed, 21 Jun 2023 10:10:26 +0200
Message-Id: <20230621081031.7876-5-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
References: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Melissa Wen <mwen@igalia.com>

DRM color function to create modes for lut3d mode property from an array
of drm_color_lut3d_mode modes supported by the HW and advertise to
userspace. Userspace can get the description of a specific mode in the
enum list from its blob data.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 43 +++++++++++++++++++++++++++++++-
 include/drm/drm_color_mgmt.h     |  4 +++
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index f92633b3b67e..6ce48007cdd4 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -104,7 +104,7 @@
  *	LUT3D property. A mode specifies size, stride, bit depth and color
  *	format and depends on the underlying hardware). If drivers support
  *	multiple 3D LUT modes, they should be declared in a array of
- *	drm_color_lut3d_mode and they will be advertised as an enum.
+ *	drm_mode_lut3d_mode and they will be advertised as an enum.
  *
  * “GAMMA_LUT”:
  *	Blob property to set the gamma lookup table (LUT) mapping pixel data
@@ -228,6 +228,47 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_enable_color_mgmt);
 
+int drm_crtc_create_lut3d_mode_property(struct drm_crtc *crtc,
+					const struct drm_mode_lut3d_mode modes[],
+					unsigned int num_modes)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_property_blob *blob;
+	struct drm_property *prop;
+	char *name;
+	int ret;
+
+	if (dev->mode_config.lut3d_mode_property)
+		return 0;
+
+	prop = drm_property_create(dev, DRM_MODE_PROP_ENUM, "LUT3D_MODE", num_modes);
+	if (!prop)
+		return -EINVAL;
+
+	for (int i = 0; i < num_modes; i++) {
+		blob = drm_property_create_blob(dev, sizeof(modes[i]), &modes[i]);
+		if (IS_ERR(blob))
+			return PTR_ERR(blob);
+
+		name = kasprintf(GFP_KERNEL, "lut3d_%d_%dbit",
+				 modes[i].lut_size, modes[i].bit_depth);
+		if (!name)
+			return -ENOMEM;
+
+		ret = drm_property_add_enum(prop, blob->base.id, name);
+		if (ret) {
+			drm_property_blob_put(blob);
+			kfree(name);
+			return ret;
+		}
+		kfree(name);
+	}
+	dev->mode_config.lut3d_mode_property = prop;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_create_lut3d_mode_property);
+
 /**
  * drm_mode_crtc_set_gamma_size - set the gamma table size
  * @crtc: CRTC to set the gamma table size for
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 81c298488b0c..af9305925572 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -59,6 +59,10 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 				bool has_ctm,
 				uint gamma_lut_size);
 
+int drm_crtc_create_lut3d_mode_property(struct drm_crtc *crtc,
+					const struct drm_mode_lut3d_mode modes[],
+					unsigned int num_modes);
+
 int drm_mode_crtc_set_gamma_size(struct drm_crtc *crtc,
 				 int gamma_size);
 
-- 
2.40.1

