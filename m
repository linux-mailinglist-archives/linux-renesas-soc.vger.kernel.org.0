Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9FDC37668
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 16:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728887AbfFFOWW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 10:22:22 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:38223 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728990AbfFFOWT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 10:22:19 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4887620011;
        Thu,  6 Jun 2019 14:22:15 +0000 (UTC)
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
Subject: [PATCH 16/20] drm: rcar-du: kms: Collect CMM instances
Date:   Thu,  6 Jun 2019 16:22:16 +0200
Message-Id: <20190606142220.1392-17-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Implement device tree parsing to collect the available CMM instances
described by the 'cmms' property. Associate CMMs with CRTCs and store a
mask of active CMMs in the DU group for later enablement.

Also define a new feature to let each SoC claim support for CMM.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |  7 ++++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h  |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  3 ++
 drivers/gpu/drm/rcar-du/rcar_du_group.h |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c   | 50 +++++++++++++++++++++++++
 5 files changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 2da46e3dc4ae..9f270a54b164 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -1194,6 +1194,13 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 	if (ret < 0)
 		return ret;
 
+	/* CMM might be disabled for this CRTC. */
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CMM) &&
+	    rcdu->cmms[swindex]) {
+		rcrtc->cmm = rcdu->cmms[swindex];
+		rgrp->cmms_mask |= BIT(hwindex % 2);
+	}
+
 	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
 
 	/* Start with vertical blanking interrupt reporting disabled. */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 3b7fc668996f..5f2940c42225 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -39,6 +39,7 @@ struct rcar_du_vsp;
  * @vblank_wait: wait queue used to signal vertical blanking
  * @vblank_count: number of vertical blanking interrupts to wait for
  * @group: CRTC group this CRTC belongs to
+ * @cmm: CMM associated with this CRTC
  * @vsp: VSP feeding video to this CRTC
  * @vsp_pipe: index of the VSP pipeline feeding video to this CRTC
  * @writeback: the writeback connector
@@ -64,6 +65,7 @@ struct rcar_du_crtc {
 	unsigned int vblank_count;
 
 	struct rcar_du_group *group;
+	struct platform_device *cmm;
 	struct rcar_du_vsp *vsp;
 	unsigned int vsp_pipe;
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index a00dccc447aa..300ec60ba31b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/wait.h>
 
+#include "rcar_cmm.h"
 #include "rcar_du_crtc.h"
 #include "rcar_du_group.h"
 #include "rcar_du_vsp.h"
@@ -70,6 +71,7 @@ struct rcar_du_device_info {
 
 #define RCAR_DU_MAX_CRTCS		4
 #define RCAR_DU_MAX_GROUPS		DIV_ROUND_UP(RCAR_DU_MAX_CRTCS, 2)
+#define RCAR_DU_MAX_CMMS		4
 #define RCAR_DU_MAX_VSPS		4
 
 struct rcar_du_device {
@@ -86,6 +88,7 @@ struct rcar_du_device {
 	struct rcar_du_encoder *encoders[RCAR_DU_OUTPUT_MAX];
 
 	struct rcar_du_group groups[RCAR_DU_MAX_GROUPS];
+	struct platform_device *cmms[RCAR_DU_MAX_CMMS];
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
index adbc4f5d8fc5..5a910a04e1d9 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -18,6 +18,7 @@
 #include <drm/drm_vblank.h>
 
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/wait.h>
 
 #include "rcar_du_crtc.h"
@@ -614,6 +615,48 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
 	return ret;
 }
 
+static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
+{
+	const struct device_node *np = rcdu->dev->of_node;
+	unsigned int cells;
+	unsigned int i;
+
+	cells = of_property_count_u32_elems(np, "cmms");
+	if (cells > RCAR_DU_MAX_CMMS || cells > rcdu->num_crtcs) {
+		dev_err(rcdu->dev, "invalid 'cmms' property format\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < cells; ++i) {
+		struct platform_device *pdev;
+		struct device_node *cmm;
+
+		cmm = of_parse_phandle(np, "cmms", i);
+		if (IS_ERR(cmm)) {
+			dev_err(rcdu->dev, "failed to parse 'cmms' property\n");
+			return PTR_ERR(cmm);
+		}
+
+		pdev = of_find_device_by_node(cmm);
+		if (IS_ERR(pdev)) {
+			dev_err(rcdu->dev, "invalid property 'cmms'[%u]\n", i);
+			of_node_put(cmm);
+			return PTR_ERR(pdev);
+		}
+
+		if (!of_device_is_available(cmm)) {
+			/* It's fine to have a phandle to a non-enabled CMM. */
+			of_node_put(cmm);
+			continue;
+		}
+
+		of_node_put(cmm);
+		rcdu->cmms[i] = pdev;
+	}
+
+	return 0;
+}
+
 int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 {
 	static const unsigned int mmio_offsets[] = {
@@ -704,6 +747,13 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
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

