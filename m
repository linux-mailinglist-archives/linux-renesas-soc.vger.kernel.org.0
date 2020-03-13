Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6048E185009
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2020 21:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbgCMUSD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Mar 2020 16:18:03 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45374 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgCMUSD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Mar 2020 16:18:03 -0400
Received: by mail-lf1-f67.google.com with SMTP id b13so8914679lfb.12;
        Fri, 13 Mar 2020 13:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BMotWAaAKwK3bHlZU4Nk/m5RAzk+ipGY0zwtvW/8Zts=;
        b=bicRCsTBUB8tfIHsGH2fiIPISDECvEwg2qpOocZbR6Q5Hu5nLZnxheMlNJjdFMj1vA
         FetnDYppdslEVeBKEPmwr8WrMhD61IJGWaIa/oOknKOO7ZOiVDeCrZAEt1rRlIeATOeQ
         lQUeg31d/qtLTQvZKVS8oVOgByqbjXAdbpVHUhMzaGLlHiCZgZxTu02M3BybD/yPSiCs
         ahnW70Fy4ZRggNSbvuqsYgGHX+zKz6Rf+am9rpyti9ywgjGu7/JU9lBZnBOAC291pAUi
         D4CS36tpf80ypwbFsaPf5LjIFxXf+7TRNNu+TyrfZhI56yAJSSBqb1LXqZR/fYFBO+Fx
         VZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=BMotWAaAKwK3bHlZU4Nk/m5RAzk+ipGY0zwtvW/8Zts=;
        b=lPUnV6TPVldE1bcQq8ZLtZSR2RSTR1s8U9HZCZijWumjLoJh6ZUEoBMJipgit3MIWV
         ETvLMfexX/EtIXZ2kNd34Qwq7iYSzl9KnMDvxaO3m5b5J2RCmSCsEIO2VQ3VaL3WTzZS
         f8z32VBSl4fZyjIU/V9/lqBI2IltcxZ6WKMaP8SHCRZ2IDyRyaZA02oViA98u2a7Ilgg
         vxLeWMFe00wSSBxxUNuaVzpt2VzZc1kNPUWFC9uHocp19aUZ3zOF97K/XnAFM/2vsS8F
         t9NjNMZjDSGAlZTzKaFXFZZ0NHslafVSurpbIvzPQzCua0hL/12FqinUozog0ICgqGM7
         HdxQ==
X-Gm-Message-State: ANhLgQ35tp4crfGNI/2+k2sWg9lNdeS5cgqxljbMeooAjrvk79IYq3cE
        E4NMd7xXXWgnfYUGwkmxKHY=
X-Google-Smtp-Source: ADFU+vs08U2ulmgppOicKEegEgw20vyZjY26u9u2fNJnhJY6xWGz9lseT5UGyNTnkxc+BLfBZ40pHA==
X-Received: by 2002:ac2:4145:: with SMTP id c5mr9320676lfi.19.1584130680533;
        Fri, 13 Mar 2020 13:18:00 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id v10sm30774074lfb.61.2020.03.13.13.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 13:18:00 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        amd-gfx@lists.freedesktop.org,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Dave Airlie <airlied@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Jose Roberto de Souza <jose.souza@intel.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        virtualization@lists.linux-foundation.org
Subject: [PATCH v1 2/3] drm: drm_simple_encoder_init() => drm_encoder_init()
Date:   Fri, 13 Mar 2020 21:17:43 +0100
Message-Id: <20200313201744.19773-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313201744.19773-1-sam@ravnborg.org>
References: <20200313201744.19773-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

A lot of drivers requires only a basic encoder with no need
to extend the functionality.
This was previously implemented in drm_simple_kms_helper.c
but encoders are not necessarily simple despite no
need for a drm_encoder_funcs for adding functionality.

Move the init function to drm_encoder.c to reflect this.
And adjust the name to drm_encoder_init().

Drop include of drm_simple_kms_helper.h in the touched
drivers as it is no logner required.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Emil Velikov <emil.velikov@collabora.com>
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: "José Roberto de Souza" <jose.souza@intel.com>
---
 drivers/gpu/drm/ast/ast_mode.c          |  3 +-
 drivers/gpu/drm/drm_encoder.c           | 37 ++++++++++++++++++++
 drivers/gpu/drm/drm_simple_kms_helper.c | 45 +------------------------
 drivers/gpu/drm/mgag200/mgag200_mode.c  |  7 ++--
 drivers/gpu/drm/qxl/qxl_display.c       |  7 ++--
 include/drm/drm_encoder.h               |  3 ++
 include/drm/drm_simple_kms_helper.h     |  4 ---
 7 files changed, 46 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index cdd6c46d6557..4f6ace1afaf0 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -40,7 +40,6 @@
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "ast_drv.h"
 #include "ast_tables.h"
@@ -964,7 +963,7 @@ static int ast_encoder_init(struct drm_device *dev)
 	struct drm_encoder *encoder = &ast->encoder;
 	int ret;
 
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
+	ret = drm_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index a76a5f04ab39..e1e90652094c 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -152,6 +152,43 @@ int drm_encoder_init_funcs(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_encoder_init_funcs);
 
+static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
+	.destroy = drm_encoder_cleanup,
+};
+
+/**
+ * drm_simple_init - Initialize a preallocated encoder with basic functionality.
+ * @dev: drm device
+ * @encoder: the encoder to initialize
+ * @encoder_type: user visible type of the encoder
+ *
+ * Initialises a preallocated encoder that has no further functionality.
+ * Settings for possible CRTC and clones are left to their initial values.
+ * The encoder will be cleaned up automatically as part of the mode-setting
+ * cleanup.
+ *
+ * The caller of drm_encoder_init() is responsible for freeing
+ * the encoder's memory after the encoder has been cleaned up. At the
+ * moment this only works reliably if the encoder data structure is
+ * stored in the device structure. Free the encoder's memory as part of
+ * the device release function.
+ *
+ * FIXME: Later improvements to DRM's resource management may allow for
+ *        an automated kfree() of the encoder's memory.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_simple_init(struct drm_device *dev,
+		    struct drm_encoder *encoder,
+		    int encoder_type)
+{
+	return drm_encoder_init_funcs(dev, encoder,
+				      &drm_simple_encoder_funcs_cleanup,
+				      encoder_type, NULL);
+}
+EXPORT_SYMBOL(drm_encoder_init);
+
 /**
  * drm_encoder_cleanup - cleans up an initialised encoder
  * @encoder: encoder to cleanup
diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 24d4433c347b..d70170980839 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -26,51 +26,8 @@
  * entity. Some flexibility for code reuse is provided through a separately
  * allocated &drm_connector object and supporting optional &drm_bridge
  * encoder drivers.
- *
- * Many drivers require only a very simple encoder that fulfills the minimum
- * requirements of the display pipeline and does not add additional
- * functionality. The function drm_simple_encoder_init() provides an
- * implementation of such an encoder.
  */
 
-static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
-	.destroy = drm_encoder_cleanup,
-};
-
-/**
- * drm_simple_encoder_init - Initialize a preallocated encoder with
- *                           basic functionality.
- * @dev: drm device
- * @encoder: the encoder to initialize
- * @encoder_type: user visible type of the encoder
- *
- * Initialises a preallocated encoder that has no further functionality.
- * Settings for possible CRTC and clones are left to their initial values.
- * The encoder will be cleaned up automatically as part of the mode-setting
- * cleanup.
- *
- * The caller of drm_simple_encoder_init() is responsible for freeing
- * the encoder's memory after the encoder has been cleaned up. At the
- * moment this only works reliably if the encoder data structure is
- * stored in the device structure. Free the encoder's memory as part of
- * the device release function.
- *
- * FIXME: Later improvements to DRM's resource management may allow for
- *        an automated kfree() of the encoder's memory.
- *
- * Returns:
- * Zero on success, error code on failure.
- */
-int drm_simple_encoder_init(struct drm_device *dev,
-			    struct drm_encoder *encoder,
-			    int encoder_type)
-{
-	return drm_encoder_init_funcs(dev, encoder,
-				      &drm_simple_encoder_funcs_cleanup,
-				      encoder_type, NULL);
-}
-EXPORT_SYMBOL(drm_simple_encoder_init);
-
 static enum drm_mode_status
 drm_simple_kms_crtc_mode_valid(struct drm_crtc *crtc,
 			       const struct drm_display_mode *mode)
@@ -327,7 +284,7 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 		return ret;
 
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(dev, encoder, DRM_MODE_ENCODER_NONE);
 	if (ret || !connector)
 		return ret;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index d90e83959fca..9de654b2dffd 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -15,7 +15,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "mgag200_drv.h"
 
@@ -1630,12 +1629,10 @@ int mgag200_modeset_init(struct mga_device *mdev)
 
 	mga_crtc_init(mdev);
 
-	ret = drm_simple_encoder_init(mdev->dev, encoder,
-				      DRM_MODE_ENCODER_DAC);
+	ret = drm_encoder_init(mdev->dev, encoder, DRM_MODE_ENCODER_DAC);
 	if (ret) {
 		drm_err(mdev->dev,
-			"drm_simple_encoder_init() failed, error %d\n",
-			ret);
+			"drm_encoder_init() failed, error %d\n", ret);
 		return ret;
 	}
 	encoder->possible_crtcs = 0x1;
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 09583a08e141..43fb05df950c 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -31,7 +31,6 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "qxl_drv.h"
 #include "qxl_object.h"
@@ -1088,11 +1087,9 @@ static int qdev_output_init(struct drm_device *dev, int num_output)
 	drm_connector_init(dev, &qxl_output->base,
 			   &qxl_connector_funcs, DRM_MODE_CONNECTOR_VIRTUAL);
 
-	ret = drm_simple_encoder_init(dev, &qxl_output->enc,
-				      DRM_MODE_ENCODER_VIRTUAL);
+	ret = drm_encoder_init(dev, &qxl_output->enc, DRM_MODE_ENCODER_VIRTUAL);
 	if (ret) {
-		drm_err(dev, "drm_simple_encoder_init() failed, error %d\n",
-			ret);
+		drm_err(dev, "drm_encoder_init() failed, error %d\n", ret);
 		goto err_drm_connector_cleanup;
 	}
 
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 378ab1778be3..8298b696dca8 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -191,6 +191,9 @@ int drm_encoder_init_funcs(struct drm_device *dev,
 			   const struct drm_encoder_funcs *funcs,
 			   int encoder_type, const char *name, ...);
 
+int drm_encoder_init(struct drm_device *dev,
+		     struct drm_encoder *encoder,
+		     int encoder_type);
 /**
  * drm_encoder_index - find the index of a registered encoder
  * @encoder: encoder to find index for
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index a026375464ff..e253ba7bea9d 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -181,8 +181,4 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 			const uint64_t *format_modifiers,
 			struct drm_connector *connector);
 
-int drm_simple_encoder_init(struct drm_device *dev,
-			    struct drm_encoder *encoder,
-			    int encoder_type);
-
 #endif /* __LINUX_DRM_SIMPLE_KMS_HELPER_H */
-- 
2.20.1

