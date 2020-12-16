Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69D902DC1D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 15:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725550AbgLPOJ3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 09:09:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbgLPOJ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 09:09:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD102C061794
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Dec 2020 06:08:48 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0181B2CF;
        Wed, 16 Dec 2020 15:08:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608127727;
        bh=xDhAJsuDilp8jZ/4Z/DUGj+NjGmBY/n8bhVCAiZBYl0=;
        h=From:To:Cc:Subject:Date:From;
        b=e4+sPhwTM5YT4NCU5GsUEb+gxIQ1dGwVtrKVboynDkp3/ZAQo/dcWUFbXY97DVKqb
         UsQ7i2C0mcknzF1Yq0yHmycPMoKGtRda4UfO2o33b715JW8hdDgddQ2+s4a1KuEE14
         iaS+QDEjM5Ya02hD+s0tXaHOjLMu3UAsIBW1HlaY=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v2] drm: rcar-du: Fix leak of CMM platform device reference
Date:   Wed, 16 Dec 2020 16:08:36 +0200
Message-Id: <20201216140836.31328-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The device references acquired by of_find_device_by_node() are not
released by the driver. Fix this by registering a cleanup action.

Fixes: 8de707aeb452 ("drm: rcar-du: kms: Initialize CMM instances")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Only set rcdu->cmms[] if the CMM config option is enabled
- Use platform_device_put()
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 92dfa3d4c011..fdb8a0d127ad 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -14,6 +14,7 @@
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -726,8 +727,12 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
 		 * disabled: return 0 and let the DU continue probing.
 		 */
 		ret = rcar_cmm_init(pdev);
-		if (ret)
+		if (ret) {
+			platform_device_put(pdev);
 			return ret == -ENODEV ? 0 : ret;
+		}
+
+		rcdu->cmms[i] = pdev;
 
 		/*
 		 * Enforce suspend/resume ordering by making the CMM a provider
@@ -739,13 +744,20 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
 				"Failed to create device link to CMM%u\n", i);
 			return -EINVAL;
 		}
-
-		rcdu->cmms[i] = pdev;
 	}
 
 	return 0;
 }
 
+static void rcar_du_modeset_cleanup(struct drm_device *dev, void *res)
+{
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rcdu->cmms); ++i)
+		platform_device_put(rcdu->cmms[i]);
+}
+
 int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 {
 	static const unsigned int mmio_offsets[] = {
@@ -766,6 +778,10 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	if (ret)
 		return ret;
 
+	ret = drmm_add_action(&rcdu->ddev, rcar_du_modeset_cleanup, NULL);
+	if (ret)
+		return ret;
+
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
 	dev->mode_config.normalize_zpos = true;
-- 
Regards,

Laurent Pinchart

