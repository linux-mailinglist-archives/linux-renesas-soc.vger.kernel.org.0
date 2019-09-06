Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68B12AB9EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2019 15:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393545AbfIFNxt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Sep 2019 09:53:49 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:53993 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393553AbfIFNxs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Sep 2019 09:53:48 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A8387FF80F;
        Fri,  6 Sep 2019 13:53:44 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] drm: rcar-du: kms: Update CMM in atomic commit tail
Date:   Fri,  6 Sep 2019 15:54:35 +0200
Message-Id: <20190906135436.10622-9-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update CMM settings at in the atomic commit tail helper method.
The CMM is updated with new gamma values provided to the driver
in the GAMMA_LUT blob property.

When resuming from system suspend, the DU driver is responsible for
reprogramming and enabling the CMM unit if it was in use at the time the
system entered the suspend state.  Force the color_mgmt_changed flag to
true if the DRM gamma lut color transformation property was set in the
CRTC state duplicated at suspend time, as the CMM gets reprogrammed only
if said flag is active in the rcar_du_atomic_commit_update_cmm() method.

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---

Daniel could you have a look if resume bits are worth being moved to the
DRM core? The color_mgmt_changed flag is set to false when the state is
duplicated if I read the code correctly, but when this happens in a
suspend/resume sequence its value should probably be restored to true if
any color management property was set in the crtc state when system entered
suspend.

---

 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 20 ++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 38 +++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 018480a8f35c..d1003d31cfaf 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/wait.h>

+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
@@ -482,6 +483,25 @@ static int rcar_du_pm_suspend(struct device *dev)
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
+		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+		if (!crtc_state)
+			continue;
+
+		/*
+		 * Force re-enablement of CMM after system resume if any
+		 * of the DRM color transformation properties was set in
+		 * the state saved at system suspend time.
+		 */
+		if (crtc_state->gamma_lut)
+			crtc_state->color_mgmt_changed = true;
+	}

 	return drm_mode_config_helper_resume(rcdu->ddev);
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 294630e56992..fc30fff0eb8d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -22,6 +22,7 @@
 #include <linux/of_platform.h>
 #include <linux/wait.h>

+#include "rcar_cmm.h"
 #include "rcar_du_crtc.h"
 #include "rcar_du_drv.h"
 #include "rcar_du_encoder.h"
@@ -368,6 +369,40 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
  * Atomic Check and Update
  */

+static void rcar_du_atomic_commit_update_cmm(struct drm_crtc *crtc,
+					     struct drm_crtc_state *old_state)
+{
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+	struct rcar_cmm_config cmm_config = {};
+	struct device *dev = rcrtc->dev->dev;
+	struct drm_property_blob *lut_blob;
+
+	if (!rcrtc->cmm || !crtc->state->color_mgmt_changed)
+		return;
+
+	if (!crtc->state->gamma_lut) {
+		cmm_config.lut.enable = false;
+		rcar_cmm_setup(rcrtc->cmm, &cmm_config);
+		return;
+	}
+
+	lut_blob = crtc->state->gamma_lut;
+	if (lut_blob->length != (CM2_LUT_SIZE * sizeof(struct drm_color_lut))) {
+		/*
+		 * We only accept fully populated LUT tables;
+		 * be loud here, otherwise the CMM gets silently ignored.
+		 */
+		dev_err(dev, "invalid gamma lut size of %lu bytes\n",
+			lut_blob->length);
+		return;
+	}
+
+	cmm_config.lut.enable = true;
+	cmm_config.lut.table = (struct drm_color_lut *)lut_blob->data;
+
+	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
+}
+
 static int rcar_du_atomic_check(struct drm_device *dev,
 				struct drm_atomic_state *state)
 {
@@ -410,6 +445,9 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 			rcdu->dpad1_source = rcrtc->index;
 	}

+	for_each_old_crtc_in_state(old_state, crtc, crtc_state, i)
+		rcar_du_atomic_commit_update_cmm(crtc, crtc_state);
+
 	/* Apply the atomic update. */
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 	drm_atomic_helper_commit_planes(dev, old_state,
--
2.23.0

