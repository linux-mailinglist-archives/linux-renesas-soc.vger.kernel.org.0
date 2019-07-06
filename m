Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B130610F9
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Jul 2019 16:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbfGFOHa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 6 Jul 2019 10:07:30 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:42669 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727310AbfGFOH3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 6 Jul 2019 10:07:29 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0F6B5C0004;
        Sat,  6 Jul 2019 14:07:25 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/19] drm: rcar-du: kms: Update CMM in atomic commit tail
Date:   Sat,  6 Jul 2019 16:07:46 +0200
Message-Id: <20190706140746.29132-20-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update CMM settings at in the atomic commit tail helper method.

The CMM is updated with new gamma values provided to the driver
in the GAMMA_LUT blob property.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index b79cda2f5531..f9aece78ca5f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -21,6 +21,7 @@
 #include <linux/of_platform.h>
 #include <linux/wait.h>
 
+#include "rcar_cmm.h"
 #include "rcar_du_crtc.h"
 #include "rcar_du_drv.h"
 #include "rcar_du_encoder.h"
@@ -287,6 +288,37 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
  * Atomic Check and Update
  */
 
+static void rcar_du_atomic_commit_update_cmm(struct drm_crtc *crtc,
+					     struct drm_crtc_state *old_state)
+{
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+	struct rcar_cmm_config cmm_config = {};
+
+	if (!rcrtc->cmm || !crtc->state->color_mgmt_changed)
+		return;
+
+	if (!crtc->state->gamma_lut) {
+		cmm_config.lut.enable = false;
+		rcar_cmm_setup(rcrtc->cmm, &cmm_config);
+
+		return;
+	}
+
+	cmm_config.lut.enable = true;
+	cmm_config.lut.table = (struct drm_color_lut *)
+			       crtc->state->gamma_lut->data;
+
+	/* Set LUT table size to 0 if entries should not be updated. */
+	if (!old_state->gamma_lut ||
+	    old_state->gamma_lut->base.id != crtc->state->gamma_lut->base.id)
+		cmm_config.lut.size = crtc->state->gamma_lut->length
+				    / sizeof(cmm_config.lut.table[0]);
+	else
+		cmm_config.lut.size = 0;
+
+	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
+}
+
 static int rcar_du_atomic_check(struct drm_device *dev,
 				struct drm_atomic_state *state)
 {
@@ -329,6 +361,9 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 			rcdu->dpad1_source = rcrtc->index;
 	}
 
+	for_each_old_crtc_in_state(old_state, crtc, crtc_state, i)
+		rcar_du_atomic_commit_update_cmm(crtc, crtc_state);
+
 	/* Apply the atomic update. */
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 	drm_atomic_helper_commit_planes(dev, old_state,
-- 
2.21.0

