Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD5303765E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 16:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbfFFOWW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 10:22:22 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:32887 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728824AbfFFOWV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 10:22:21 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B6B5120014;
        Thu,  6 Jun 2019 14:22:17 +0000 (UTC)
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
Subject: [PATCH 17/20] drm: rcar-du: crtc: Enable and disable CMMs
Date:   Thu,  6 Jun 2019 16:22:17 +0200
Message-Id: <20190606142220.1392-18-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable/disable the CMM associated with a CRTC at
atomic_enable()/atomic_disable() time.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 9f270a54b164..e6d3df37c827 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -21,6 +21,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
+#include "rcar_cmm.h"
 #include "rcar_du_crtc.h"
 #include "rcar_du_drv.h"
 #include "rcar_du_encoder.h"
@@ -523,6 +524,7 @@ static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
 		goto error_group;
 
 	rcar_du_crtc_setup(rcrtc);
+
 	rcrtc->initialized = true;
 
 	return 0;
@@ -619,6 +621,9 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
 	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 		rcar_du_vsp_disable(rcrtc);
 
+	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_CMM) && rcrtc->cmm)
+		rcar_cmm_disable(rcrtc->cmm);
+
 	/*
 	 * Select switch sync mode. This stops display operation and configures
 	 * the HSYNC and VSYNC signals as inputs.
@@ -686,6 +691,9 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 	}
 
 	rcar_du_crtc_start(rcrtc);
+
+	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_CMM) && rcrtc->cmm)
+		rcar_cmm_enable(rcrtc->cmm);
 }
 
 static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
-- 
2.21.0

