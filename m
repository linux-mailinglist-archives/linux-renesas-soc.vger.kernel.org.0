Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F19425BF1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Oct 2021 21:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243965AbhJGTkr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Oct 2021 15:40:47 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:46351 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241947AbhJGTkk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 15:40:40 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 8FFFE2B00A33;
        Thu,  7 Oct 2021 15:38:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 07 Oct 2021 15:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=r21xTV04JhLQh
        FFcwkc0d4AVLdWU1vIuTxgVGoPXBxw=; b=lD2LkqSfEICwKSi6Mysd2UrZDfsbQ
        3KUHFEHbjhhDzP3KIhhx3oOK0AulAzMhOC3NA9Na7co7OJD6p7NGonESvUvQIQkB
        IbMCAAoD9OX5lGi0HusF8xxtKFZVV8ol2vixJ2pMtydgs+R1g/3BnEzZsS36yKLP
        03T+cm5IqiSTa6lu1YCttE9FcgT2+7UXQe9Po7WuQ8ivFclk1yQYneH5wZ4gTuK8
        Jvh9ibX4/wJcQBJhDt9Gz/vXnYIDb41r74qtQKtmfpHD8+T5S2PV9PwXdBAK6z4O
        h0TyLgA4NmptCsjh6zm3RMXJ7w4x/t/dLmCIc3+dt64zBEUds6iwNij9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=r21xTV04JhLQhFFcwkc0d4AVLdWU1vIuTxgVGoPXBxw=; b=jQmliRC/
        gpxmQXwVfsgQHfvdkh18KW1a6VMWWhA6K2NZftJebA8/yuy3VCTS0GdRGvzHcWBz
        Dxd1Vz5vv8k55D2r8zSnrZFm6IawLat0hGkD2hiRuWxUgRdu6KiS+kNSlkjaPj4W
        VnvgppDmKpkaip1PuruTkumwilivd7XjvxHRFL2N+1uW3VLvoaodI+tjYPqtrIkQ
        xy7JC69O+ZUaxSG03TOXh3bc2ow30Ky2tBTYkIMUaCXSHAlrXnHIwcV3GsNPkVvz
        t9rdLsgHzpLo3Vnu2tIrrl2i+rQWtJpHvrQtpLKnkYvzMa6NT1x8aVya74/fb8tC
        ag22FGxG1abgUw==
X-ME-Sender: <xms:xUxfYSNTOIdxNAu-ChnsPn9-sok1uAO2B45aRIDJJWB12sgEArlsGQ>
    <xme:xUxfYQ_05nMXgqEH6718kr1AQSyDnAHgvWoOCzyxc3wWN5DAtnfDZtW4p9LtdfIkC
    lql9UfERa3przVpNw>
X-ME-Received: <xmr:xUxfYZS8z8-tjhxIu2k4i-0tc0bHsKyZtfOEFOr2LG29EN4D2IL9V0DKh5XYtFnn7BXl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
    ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
    fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedvnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:xUxfYSuvM5TecRWD5KHBb1FKEs31m3D2h7M73jJaJQrTM0S3PB8HEw>
    <xmx:xUxfYaf7SYv0b4JlZBoiyK86qgcSSQ-oLOX2bvrAOVn1aAkMJS9UbA>
    <xmx:xUxfYW3MchcnhvO9EYS60BuMVEDQ6g37T_yU6lDeo7uC_mISI2HUSw>
    <xmx:xUxfYa7wDqXq9bxn86-sYQYEypgYecDB5af1UBwLOVYMIUil_s82zR_HtwM>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:38:42 -0400 (EDT)
From:   Fernando Ramos <greenfoo@u92.eu>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-kernel@vger.kernel.org, sean@poorly.run,
        linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 10/20] drm/nouveau: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
Date:   Thu,  7 Oct 2021 21:37:45 +0200
Message-Id: <20211007193755.29579-11-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007193755.29579-1-greenfoo@u92.eu>
References: <20211007193755.29579-1-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
Reviewed-by: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index d7b9f7f8c9e3..86e18a844953 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -42,6 +42,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_scdc_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_drv.h>
 
 #include <nvif/push507c.h>
 
@@ -667,16 +668,18 @@ nv50_audio_component_bind(struct device *kdev, struct device *hda_kdev,
 	struct drm_device *drm_dev = dev_get_drvdata(kdev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
 	struct drm_audio_component *acomp = data;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
 	if (WARN_ON(!device_link_add(hda_kdev, kdev, DL_FLAG_STATELESS)))
 		return -ENOMEM;
 
-	drm_modeset_lock_all(drm_dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(drm_dev, ctx, 0, ret);
 	acomp->ops = &nv50_audio_component_ops;
 	acomp->dev = kdev;
 	drm->audio.component = acomp;
-	drm_modeset_unlock_all(drm_dev);
-	return 0;
+	DRM_MODESET_LOCK_ALL_END(drm_dev, ctx, ret);
+	return ret;
 }
 
 static void
@@ -686,12 +689,14 @@ nv50_audio_component_unbind(struct device *kdev, struct device *hda_kdev,
 	struct drm_device *drm_dev = dev_get_drvdata(kdev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
 	struct drm_audio_component *acomp = data;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
-	drm_modeset_lock_all(drm_dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(drm_dev, ctx, 0, ret);
 	drm->audio.component = NULL;
 	acomp->ops = NULL;
 	acomp->dev = NULL;
-	drm_modeset_unlock_all(drm_dev);
+	DRM_MODESET_LOCK_ALL_END(drm_dev, ctx, ret);
 }
 
 static const struct component_ops nv50_audio_component_bind_ops = {
-- 
2.33.0

