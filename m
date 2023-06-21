Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2769737D78
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jun 2023 10:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbjFUILH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Jun 2023 04:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbjFUILE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2023 04:11:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06E51718
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jun 2023 01:11:00 -0700 (PDT)
Received: from uno.lan (unknown [IPv6:2001:b07:5d2e:52c9:1cf0:b3bc:c785:4625])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC2E915E9;
        Wed, 21 Jun 2023 10:10:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687335024;
        bh=L0Or/dRrc/G1jwhGCHOAPe0GtoeuM6ImRaeCz+srIco=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h9BXmzIAr2Dwm2Vp3+BxB/W4AVimJ9SAHWOf7JjPEREb4WifvjXRwZHq6pLW8QdRr
         cF7jEvCXpEK92/LdLt0Fu5hKLJCto4rm1V8QOtF7u0bFaGeDfbsO8fGICAVo2NXX5z
         pViuoMXWfiIilrRo4VfJGmWN/NUXOkoiEP1Q7I4Q=
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
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [RFC 8/9] drm: rcar-du: kms: Configure the CLU
Date:   Wed, 21 Jun 2023 10:10:30 +0200
Message-Id: <20230621081031.7876-9-jacopo.mondi@ideasonboard.com>
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

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Link the DRM 3D-CLU configuration to the CMM setup configuration.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index a2d477dc5a51..895a23161f7b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -521,19 +521,23 @@ static int rcar_du_cmm_check(struct drm_crtc *crtc,
 			     struct drm_crtc_state *state)
 {
 	struct drm_property_blob *drm_lut = state->gamma_lut;
+	struct drm_property_blob *drm_clu = state->lut3d;
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
 	struct device *dev = rcrtc->dev->dev;
 
-	if (!drm_lut)
-		return 0;
-
-	/* We only accept fully populated LUT tables. */
-	if (drm_color_lut_size(drm_lut) != CM2_LUT_SIZE) {
+	/* We only accept fully populated LUTs. */
+	if (drm_lut && drm_color_lut_size(drm_lut) != CM2_LUT_SIZE) {
 		dev_err(dev, "invalid gamma lut size: %zu bytes\n",
 			drm_lut->length);
 		return -EINVAL;
 	}
 
+	if (drm_clu && drm_color_lut_size(drm_clu) != CM2_CLU_SIZE) {
+		dev_err(dev, "invalid cubic lut size: %zu bytes\n",
+			drm_clu->length);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -555,6 +559,15 @@ static void rcar_du_cmm_setup(struct rcar_du_crtc *rcrtc,
 				     ? new_state->gamma_lut->data : NULL;
 	}
 
+	if (!old_state ||
+	    !old_state->lut3d != !new_state->lut3d ||
+	    (old_state->lut3d && new_state->lut3d &&
+	     old_state->lut3d->base.id != new_state->lut3d->base.id)) {
+		cmm_config.clu.update = true;
+		cmm_config.clu.table = new_state->lut3d
+				     ? new_state->lut3d->data : NULL;
+	}
+
 	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
 }
 
-- 
2.40.1

