Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16A8F3766B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 16:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728936AbfFFOWa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 10:22:30 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:54361 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729042AbfFFOW3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 10:22:29 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E7AB32000A;
        Thu,  6 Jun 2019 14:22:25 +0000 (UTC)
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
Subject: [PATCH 20/20] drm: rcar-du: kms: Update CMM in atomic commit tail
Date:   Thu,  6 Jun 2019 16:22:20 +0200
Message-Id: <20190606142220.1392-21-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
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
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 5a910a04e1d9..29a2020a46b5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -21,6 +21,7 @@
 #include <linux/of_platform.h>
 #include <linux/wait.h>
 
+#include "rcar_cmm.h"
 #include "rcar_du_crtc.h"
 #include "rcar_du_drv.h"
 #include "rcar_du_encoder.h"
@@ -367,6 +368,38 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
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
+	    (old_state->gamma_lut->base.id !=
+	    crtc->state->gamma_lut->base.id))
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
@@ -409,6 +442,9 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
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

