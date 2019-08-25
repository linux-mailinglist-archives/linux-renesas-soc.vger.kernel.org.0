Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDF19C429
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Aug 2019 15:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbfHYNvY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Aug 2019 09:51:24 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:33751 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728668AbfHYNvX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Aug 2019 09:51:23 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 184EAC0003;
        Sun, 25 Aug 2019 13:51:18 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli@fpond.eu, airlied@linux.ie, daniel@ffwll.ch
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/14] drm: rcar-du: Force CMM enablement when resuming
Date:   Sun, 25 Aug 2019 15:51:54 +0200
Message-Id: <20190825135154.11488-15-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When resuming from system suspend, the DU driver is responsible for
reprogramming and enabling the CMM unit if it was in use at the time
the system entered the suspend state.

Force the color_mgmt_changed flag to true if any of the DRM color
transformation properties was set in the CRTC state duplicated at
suspend time, as the CMM gets reprogrammed only if said flag is active in
the rcar_du_atomic_commit_update_cmm() method.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 018480a8f35c..6e38495fb78f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/wait.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
@@ -482,6 +483,26 @@ static int rcar_du_pm_suspend(struct device *dev)
 static int rcar_du_pm_resume(struct device *dev)
 {
 	struct rcar_du_device *rcdu = dev_get_drvdata(dev);
+	struct drm_atomic_state *state = rcdu->ddev->mode_config.suspend_state;
+	unsigned int i;
+
+	for (i = 0; i < rcdu->num_crtcs; ++i) {
+		struct drm_crtc *crtc = &rcdu->crtcs[i].crtc;
+		struct drm_crtc_state *crtc_state;
+
+		crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
+		if (!crtc_state)
+			continue;
+
+		/*
+		 * Force re-enablement of CMM after system resume if any
+		 * of the DRM color transformation properties was set in
+		 * the state saved at system suspend time.
+		 */
+		if (crtc_state->gamma_lut || crtc_state->degamma_lut ||
+		    crtc_state->ctm)
+			crtc_state->color_mgmt_changed = true;
+	}
 
 	return drm_mode_config_helper_resume(rcdu->ddev);
 }
-- 
2.22.0

