Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF41417F23
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 19:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729021AbfEHRdy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 13:33:54 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:34763 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729008AbfEHRdx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 13:33:53 -0400
X-Originating-IP: 93.56.79.2
Received: from uno.localdomain (unknown [93.56.79.2])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A73491BF20C;
        Wed,  8 May 2019 17:33:50 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [RFC 6/9] drm: rcar-du: crtc: Setup the CMM
Date:   Wed,  8 May 2019 19:34:25 +0200
Message-Id: <20190508173428.22054-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Save a reference to the CMM unit associated with the CRTC and set it up
at rcar_du_crtc_setup() time, just after having enabled the compositor.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 38 ++++++++++++++++++++++++--
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  2 ++
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 2da46e3dc4ae..b5a9af8e4df0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -9,6 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/mutex.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/sys_soc.h>
 
@@ -21,6 +22,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
+#include "rcar_du_cmm.h"
 #include "rcar_du_crtc.h"
 #include "rcar_du_drv.h"
 #include "rcar_du_encoder.h"
@@ -478,7 +480,7 @@ static void rcar_du_crtc_wait_page_flip(struct rcar_du_crtc *rcrtc)
  * Start/Stop and Suspend/Resume
  */
 
-static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
+static int rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
 {
 	/* Set display off and background to black */
 	rcar_du_crtc_write(rcrtc, DOOR, DOOR_RGB(0, 0, 0));
@@ -495,8 +497,24 @@ static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
 	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 		rcar_du_vsp_enable(rcrtc);
 
+	/* Enable CMM, if present. */
+	if (rcrtc->cmm) {
+		struct platform_device *pdev;
+		int ret;
+
+		pdev = of_find_device_by_node(rcrtc->cmm->np);
+		if (!pdev)
+			return PTR_ERR(pdev);
+
+		ret = rcar_du_cmm_setup(pdev, rcrtc);
+		if (ret)
+			return ret;
+	}
+
 	/* Turn vertical blanking interrupt reporting on. */
 	drm_crtc_vblank_on(&rcrtc->crtc);
+
+	return 0;
 }
 
 static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
@@ -522,7 +540,10 @@ static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
 	if (ret < 0)
 		goto error_group;
 
-	rcar_du_crtc_setup(rcrtc);
+	ret = rcar_du_crtc_setup(rcrtc);
+	if (ret < 0)
+		goto error_group;
+
 	rcrtc->initialized = true;
 
 	return 0;
@@ -1182,6 +1203,19 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 	rcrtc->index = hwindex;
 	rcrtc->dsysr = (rcrtc->index % 2 ? 0 : DSYSR_DRES) | DSYSR_TVM_TVSYNC;
 
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CMM)) {
+		unsigned int i;
+
+		for (i = 0; i < RCAR_DU_MAX_CMMS; ++i) {
+			struct rcar_du_cmm *cmm = &rcdu->cmms[i];
+
+			if (cmm->crtc != hwindex)
+				continue;
+
+			rcrtc->cmm = cmm;
+		}
+	}
+
 	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
 		primary = &rcrtc->vsp->planes[rcrtc->vsp_pipe].plane;
 	else
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 3b7fc668996f..8b31406bd11b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -19,6 +19,7 @@
 
 #include <media/vsp1.h>
 
+struct rcar_du_cmm;
 struct rcar_du_group;
 struct rcar_du_vsp;
 
@@ -64,6 +65,7 @@ struct rcar_du_crtc {
 	unsigned int vblank_count;
 
 	struct rcar_du_group *group;
+	struct rcar_du_cmm *cmm;
 	struct rcar_du_vsp *vsp;
 	unsigned int vsp_pipe;
 
-- 
2.21.0

