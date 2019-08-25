Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3FCC9C430
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Aug 2019 15:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728667AbfHYNvQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Aug 2019 09:51:16 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:46153 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728653AbfHYNvO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Aug 2019 09:51:14 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 05739C0006;
        Sun, 25 Aug 2019 13:51:08 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli@fpond.eu, airlied@linux.ie, daniel@ffwll.ch
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v3 11/14] drm: rcar-du: crtc: Enable and disable CMMs
Date:   Sun, 25 Aug 2019 15:51:51 +0200
Message-Id: <20190825135154.11488-12-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable/disable the CMM associated with a CRTC at CRTC start and stop
time and enable the CMM unit through the Display Extensional Functions
register at group setup time.

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 7 +++++++
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 8 ++++++++
 drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 5 +++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 23f1d6cc1719..3dac605c3a67 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -21,6 +21,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
+#include "rcar_cmm.h"
 #include "rcar_du_crtc.h"
 #include "rcar_du_drv.h"
 #include "rcar_du_encoder.h"
@@ -619,6 +620,9 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
 	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 		rcar_du_vsp_disable(rcrtc);
 
+	if (rcrtc->cmm)
+		rcar_cmm_disable(rcrtc->cmm);
+
 	/*
 	 * Select switch sync mode. This stops display operation and configures
 	 * the HSYNC and VSYNC signals as inputs.
@@ -686,6 +690,9 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 	}
 
 	rcar_du_crtc_start(rcrtc);
+
+	if (rcrtc->cmm)
+		rcar_cmm_enable(rcrtc->cmm);
 }
 
 static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 9eee47969e77..25d0fc125d7a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -147,6 +147,14 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 
 	rcar_du_group_setup_pins(rgrp);
 
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CMM)) {
+		u32 defr7 = DEFR7_CODE
+			  | (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0)
+			  | (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
+
+		rcar_du_group_write(rgrp, DEFR7, defr7);
+	}
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
2.22.0

