Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB9217F21
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 19:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729002AbfEHRdv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 13:33:51 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:57131 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728887AbfEHRdv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 13:33:51 -0400
X-Originating-IP: 93.56.79.2
Received: from uno.localdomain (unknown [93.56.79.2])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 31D361BF20A;
        Wed,  8 May 2019 17:33:48 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [RFC 4/9] drm: rcar-du: kms: Create CMM instances
Date:   Wed,  8 May 2019 19:34:23 +0200
Message-Id: <20190508173428.22054-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Implement device tree parsing to collect the available CMM units and
store them in the group to be later enabled at start up time.

Define a new feature to let each SoC claim support for CMM.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  4 ++
 drivers/gpu/drm/rcar-du/rcar_du_group.h |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c   | 68 +++++++++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 1327cd0df90a..aac916a7a46c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/wait.h>
 
+#include "rcar_du_cmm.h"
 #include "rcar_du_crtc.h"
 #include "rcar_du_group.h"
 #include "rcar_du_vsp.h"
@@ -28,6 +29,7 @@ struct rcar_du_encoder;
 #define RCAR_DU_FEATURE_VSP1_SOURCE	BIT(1)	/* Has inputs from VSP1 */
 #define RCAR_DU_FEATURE_INTERLACED	BIT(2)	/* HW supports interlaced */
 #define RCAR_DU_FEATURE_TVM_SYNC	BIT(3)	/* Has TV switch/sync modes */
+#define RCAR_DU_FEATURE_CMM		BIT(4)	/* Has CCM */
 
 #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
 
@@ -69,6 +71,7 @@ struct rcar_du_device_info {
 
 #define RCAR_DU_MAX_CRTCS		4
 #define RCAR_DU_MAX_GROUPS		DIV_ROUND_UP(RCAR_DU_MAX_CRTCS, 2)
+#define RCAR_DU_MAX_CMMS		4
 #define RCAR_DU_MAX_VSPS		4
 
 struct rcar_du_device {
@@ -85,6 +88,7 @@ struct rcar_du_device {
 	struct rcar_du_encoder *encoders[RCAR_DU_OUTPUT_MAX];
 
 	struct rcar_du_group groups[RCAR_DU_MAX_GROUPS];
+	struct rcar_du_cmm cmms[RCAR_DU_MAX_CMMS];
 	struct rcar_du_vsp vsps[RCAR_DU_MAX_VSPS];
 
 	struct {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.h b/drivers/gpu/drm/rcar-du/rcar_du_group.h
index 87950c1f6a52..b0c1466593a3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.h
@@ -22,6 +22,7 @@ struct rcar_du_device;
  * @mmio_offset: registers offset in the device memory map
  * @index: group index
  * @channels_mask: bitmask of populated DU channels in this group
+ * @cmms_mask: bitmask of enabled CMMs in this group
  * @num_crtcs: number of CRTCs in this group (1 or 2)
  * @use_count: number of users of the group (rcar_du_group_(get|put))
  * @used_crtcs: number of CRTCs currently in use
@@ -37,6 +38,7 @@ struct rcar_du_group {
 	unsigned int index;
 
 	unsigned int channels_mask;
+	unsigned int cmms_mask;
 	unsigned int num_crtcs;
 	unsigned int use_count;
 	unsigned int used_crtcs;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index adbc4f5d8fc5..684a60feac5c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -614,6 +614,64 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
 	return ret;
 }
 
+static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
+{
+	const struct device_node *np = rcdu->dev->of_node;
+	unsigned int cells;
+	unsigned int i;
+	int ret;
+
+	/*
+	 * Make sure the DT 'cmms' property is well formed and populate
+	 * the list of enabled CMM.
+	 */
+	cells = of_property_count_u32_elems(np, "cmms");
+	if (cells % 2 || cells > rcdu->num_crtcs * 2) {
+		dev_err(rcdu->dev, "invalid 'cmms' property format\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < cells / 2; ++i) {
+		struct of_phandle_args args;
+		struct rcar_du_group *rgrp;
+		unsigned int crtc;
+
+		ret = of_parse_phandle_with_fixed_args(np, "cmms", 1, i,
+						       &args);
+		if (ret < 0) {
+			dev_err(rcdu->dev, "failed to parse 'cmms' property\n");
+			goto error;
+		}
+
+		crtc = args.args[0];
+		if (crtc >= rcdu->num_crtcs ||
+		    !(rcdu->info->channels_mask & BIT(crtc))) {
+			dev_err(rcdu->dev,
+				"invalid DU channel %u in 'cmms' property\n",
+				crtc);
+			goto error;
+		}
+
+		rcdu->cmms[i].np = args.np;
+		rcdu->cmms[i].crtc = crtc;
+
+		/*
+		 * CMMs are activated by the DU group: store the active CMMs
+		 * indexes in the group.
+		 */
+		rgrp = &rcdu->groups[crtc / 2];
+		rgrp->cmms_mask |= BIT(crtc % 2);
+	}
+
+	return 0;
+
+error:
+	for (; i > 0; --i)
+		of_node_put(rcdu->cmms[i - 1].np);
+
+	return ret;
+}
+
 int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 {
 	static const unsigned int mmio_offsets[] = {
@@ -680,6 +738,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 				   & GENMASK(1, 0);
 		rgrp->num_crtcs = hweight8(rgrp->channels_mask);
 
+		/* The active CMMs mask will be later populated. */
+		rgrp->cmms_mask = 0;
+
 		/*
 		 * If we have more than one CRTCs in this group pre-associate
 		 * the low-order planes with CRTC 0 and the high-order planes
@@ -704,6 +765,13 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 			return ret;
 	}
 
+	/* Initialize the Color Management Modules. */
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CMM)) {
+		ret = rcar_du_cmm_init(rcdu);
+		if (ret < 0)
+			return ret;
+	}
+
 	/* Create the CRTCs. */
 	for (swindex = 0, hwindex = 0; swindex < rcdu->num_crtcs; ++hwindex) {
 		struct rcar_du_group *rgrp;
-- 
2.21.0

