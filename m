Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB21D73A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 12:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731100AbfJOKpH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 06:45:07 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:42715 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731071AbfJOKpH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 06:45:07 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C1AD5C0012;
        Tue, 15 Oct 2019 10:45:01 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        Harsha.ManjulaMallikarjun@in.bosch.com, ezequiel@collabora.com,
        seanpaul@chromium.org, linux-renesas-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/8] drm: rcar-du: crtc: Control CMM operations
Date:   Tue, 15 Oct 2019 12:46:18 +0200
Message-Id: <20191015104621.62514-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Implement CMM handling in the crtc begin and enable atomic callbacks,
and enable CMM unit through the Display Extensional Functions
register at group setup time.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 79 +++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_group.c |  5 ++
 drivers/gpu/drm/rcar-du/rcar_du_regs.h  |  5 ++
 3 files changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 23f1d6cc1719..4bc50a3f4a00 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -21,6 +21,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
+#include "rcar_cmm.h"
 #include "rcar_du_crtc.h"
 #include "rcar_du_drv.h"
 #include "rcar_du_encoder.h"
@@ -474,6 +475,70 @@ static void rcar_du_crtc_wait_page_flip(struct rcar_du_crtc *rcrtc)
 	rcar_du_crtc_finish_page_flip(rcrtc);
 }
 
+/* -----------------------------------------------------------------------------
+ * Color Management Module (CMM)
+ */
+static int rcar_du_cmm_enable(struct drm_crtc *crtc)
+{
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+	if (!rcrtc->cmm)
+		return 0;
+
+	return rcar_cmm_enable(rcrtc->cmm);
+}
+
+static void rcar_du_cmm_disable(struct drm_crtc *crtc)
+{
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+	if (!rcrtc->cmm)
+		return;
+
+	rcar_cmm_disable(rcrtc->cmm);
+}
+
+static int rcar_du_cmm_check(struct drm_crtc *crtc,
+			     struct drm_crtc_state *state)
+{
+	struct drm_property_blob *drm_lut = state->gamma_lut;
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+	struct device *dev = rcrtc->dev->dev;
+
+	if (!rcrtc->cmm || !drm_lut)
+		return 0;
+
+	/* We only accept fully populated LUT tables. */
+	if (CM2_LUT_SIZE * sizeof(struct drm_color_lut) !=
+	    drm_lut->length) {
+		dev_err(dev, "invalid gamma lut size: %lu bytes\n",
+			drm_lut->length);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void rcar_du_cmm_setup(struct drm_crtc *crtc)
+{
+	struct drm_property_blob *drm_lut = crtc->state->gamma_lut;
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+	struct rcar_cmm_config cmm_config = {};
+
+	if (!rcrtc->cmm)
+		return;
+
+	if (drm_lut) {
+		cmm_config.lut.enable = true;
+		cmm_config.lut.table = (struct drm_color_lut *)drm_lut->data;
+
+	} else {
+		cmm_config.lut.enable = false;
+	}
+
+	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
+}
+
 /* -----------------------------------------------------------------------------
  * Start/Stop and Suspend/Resume
  */
@@ -619,6 +684,8 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
 	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 		rcar_du_vsp_disable(rcrtc);
 
+	rcar_du_cmm_disable(crtc);
+
 	/*
 	 * Select switch sync mode. This stops display operation and configures
 	 * the HSYNC and VSYNC signals as inputs.
@@ -631,6 +698,7 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
 					   DSYSR_TVM_SWITCH);
 
 	rcar_du_group_start_stop(rcrtc->group, false);
+
 }
 
 /* -----------------------------------------------------------------------------
@@ -642,6 +710,11 @@ static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
 {
 	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(state);
 	struct drm_encoder *encoder;
+	int ret;
+
+	ret = rcar_du_cmm_check(crtc, state);
+	if (ret)
+		return ret;
 
 	/* Store the routes from the CRTC output to the DU outputs. */
 	rstate->outputs = 0;
@@ -667,6 +740,7 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(crtc->state);
 	struct rcar_du_device *rcdu = rcrtc->dev;
 
+	rcar_du_cmm_enable(crtc);
 	rcar_du_crtc_get(rcrtc);
 
 	/*
@@ -686,6 +760,7 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 	}
 
 	rcar_du_crtc_start(rcrtc);
+	rcar_du_cmm_setup(crtc);
 }
 
 static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -739,6 +814,10 @@ static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
 	 */
 	rcar_du_crtc_get(rcrtc);
 
+	/* If the active state changed, we let .atomic_enable handle CMM. */
+	if (crtc->state->color_mgmt_changed && !crtc->state->active_changed)
+		rcar_du_cmm_setup(crtc);
+
 	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 		rcar_du_vsp_atomic_begin(rcrtc);
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 9eee47969e77..583de800a66d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -135,6 +135,7 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
 static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 {
 	struct rcar_du_device *rcdu = rgrp->dev;
+	u32 defr7 = DEFR7_CODE;
 
 	/* Enable extended features */
 	rcar_du_group_write(rgrp, DEFR, DEFR_CODE | DEFR_DEFE);
@@ -147,6 +148,10 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 
 	rcar_du_group_setup_pins(rgrp);
 
+	defr7 |= (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0) |
+		 (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
+	rcar_du_group_write(rgrp, DEFR7, defr7);
+
 	if (rcdu->info->gen >= 2) {
 		rcar_du_group_setup_defr8(rgrp);
 		rcar_du_group_setup_didsr(rgrp);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
index bc87f080b170..fb9964949368 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
@@ -197,6 +197,11 @@
 #define DEFR6_MLOS1		(1 << 2)
 #define DEFR6_DEFAULT		(DEFR6_CODE | DEFR6_TCNE1)
 
+#define DEFR7			0x000ec
+#define DEFR7_CODE		(0x7779 << 16)
+#define DEFR7_CMME1		BIT(6)
+#define DEFR7_CMME0		BIT(4)
+
 /* -----------------------------------------------------------------------------
  * R8A7790-only Control Registers
  */
-- 
2.23.0

