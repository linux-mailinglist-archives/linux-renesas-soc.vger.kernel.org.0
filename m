Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C111D737D94
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jun 2023 10:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjFUILJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Jun 2023 04:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbjFUILF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2023 04:11:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 779AC1981
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jun 2023 01:11:02 -0700 (PDT)
Received: from uno.lan (unknown [IPv6:2001:b07:5d2e:52c9:1cf0:b3bc:c785:4625])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B61FE2C96;
        Wed, 21 Jun 2023 10:10:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687335026;
        bh=Nz5xxiQsV7L8tjRBWm4HkFoJy2viyWnaSexoVo6LVwE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qEy/Jrd+AP3vUp/wSwq9Zb5ZDKTXSGg51A8nUv24Lwogw+ZcXK41ZGglw0/Q4t0aE
         7aXEvjXlWPC879/ne7Qd/fvqKoxtXjCndntS/+lxpK1X6glJq/Bwtk3+uwJEYeMTm+
         sNgcXFaXtomYjMZ+rsYPNMwIM7ODEQOFa4dZYjV0=
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
Subject: [RFC 9/9] drm: rcar-du: crtc: Enable 3D LUT
Date:   Wed, 21 Jun 2023 10:10:31 +0200
Message-Id: <20230621081031.7876-10-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
References: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
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

Enable the 3D LUT in rcar_du_crtc by first creating a property for
the supported 3d lut modes and by calling the drm_crtc_enable_lut3d()
helper.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_cmm.h     | 14 ++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 23 +++++++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.h b/drivers/gpu/drm/rcar-du/rcar_cmm.h
index 277b9e4d9cc4..eed9e480a96f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_cmm.h
+++ b/drivers/gpu/drm/rcar-du/rcar_cmm.h
@@ -8,6 +8,8 @@
 #ifndef __RCAR_CMM_H__
 #define __RCAR_CMM_H__
 
+#include <drm/drm_fourcc.h>
+
 #define CM2_LUT_SIZE		256
 #define CM2_CLU_SIZE		(17 * 17 * 17)
 
@@ -43,6 +45,16 @@ void rcar_cmm_disable(struct platform_device *pdev);
 
 int rcar_cmm_setup(struct platform_device *pdev,
 		   const struct rcar_cmm_config *config);
+
+static const struct drm_mode_lut3d_mode rcar_cmm_3dlut_modes[] = {
+	{
+		.lut_size = 17,
+		.lut_stride = {17, 17, 17},
+		.bit_depth = 8,
+		.color_format = DRM_FORMAT_XRGB16161616,
+		.flags = 0,
+	},
+};
 #else
 static inline int rcar_cmm_init(struct platform_device *pdev)
 {
@@ -63,6 +75,8 @@ static inline int rcar_cmm_setup(struct platform_device *pdev,
 {
 	return 0;
 }
+
+static const struct drm_mode_lut3d_mode rcar_cmm_3dlut_modes[] = { };
 #endif /* IS_ENABLED(CONFIG_DRM_RCAR_CMM) */
 
 #endif /* __RCAR_CMM_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 895a23161f7b..126083d226d2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -571,6 +571,24 @@ static void rcar_du_cmm_setup(struct rcar_du_crtc *rcrtc,
 	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
 }
 
+static int rcar_du_cmm_enable_color_mgmt(struct rcar_du_crtc *rcrtc)
+{
+	struct drm_crtc *crtc = &rcrtc->crtc;
+	int ret;
+
+	drm_mode_crtc_set_gamma_size(crtc, CM2_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(crtc, 0, false, CM2_LUT_SIZE);
+
+	ret = drm_crtc_create_lut3d_mode_property(crtc, rcar_cmm_3dlut_modes,
+						  ARRAY_SIZE(rcar_cmm_3dlut_modes));
+	if (ret)
+		return ret;
+
+	drm_crtc_enable_lut3d(crtc, 0);
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------------
  * Start/Stop and Suspend/Resume
  */
@@ -1355,8 +1373,9 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 		rcrtc->cmm = rcdu->cmms[swindex];
 		rgrp->cmms_mask |= BIT(hwindex % 2);
 
-		drm_mode_crtc_set_gamma_size(crtc, CM2_LUT_SIZE);
-		drm_crtc_enable_color_mgmt(crtc, 0, false, CM2_LUT_SIZE);
+		ret = rcar_du_cmm_enable_color_mgmt(rcrtc);
+		if (ret)
+			return ret;
 	}
 
 	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
-- 
2.40.1

