Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F346D63672E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Nov 2022 18:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238611AbiKWRa2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Nov 2022 12:30:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238683AbiKWRaF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2022 12:30:05 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5563E8E297
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Nov 2022 09:30:04 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,187,1665414000"; 
   d="scan'208";a="143666671"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Nov 2022 02:30:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.61])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 033B940ADCC6;
        Thu, 24 Nov 2022 02:30:00 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 15/19] drm: rcar-du: Move rcar_du_encoders_init()
Date:   Wed, 23 Nov 2022 17:29:02 +0000
Message-Id: <20221123172906.2919734-16-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123172906.2919734-1-biju.das.jz@bp.renesas.com>
References: <20221123172906.2919734-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L supports only DSI and DPI. Add rcar_du_encoders_init() to handle
the pointer to du_output_name(), so that we can share du_encoders_init()
between RCar and RZ/G2L kms drivers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Updated header files.
v5:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     |  92 +------------------
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c | 102 ++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h |   6 ++
 3 files changed, 110 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index b0b40b1cc37d..94f1602ea707 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -69,95 +69,6 @@ static const struct drm_mode_config_funcs rcar_du_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
-				     enum rcar_du_output output,
-				     struct of_endpoint *ep)
-{
-	struct device_node *entity;
-	int ret;
-
-	/* Locate the connected entity and initialize the encoder. */
-	entity = of_graph_get_remote_port_parent(ep->local_node);
-	if (!entity) {
-		dev_dbg(rcdu->dev, "unconnected endpoint %pOF, skipping\n",
-			ep->local_node);
-		return -ENODEV;
-	}
-
-	if (!of_device_is_available(entity)) {
-		dev_dbg(rcdu->dev,
-			"connected entity %pOF is disabled, skipping\n",
-			entity);
-		of_node_put(entity);
-		return -ENODEV;
-	}
-
-	ret = rcar_du_encoder_init(rcdu, output, entity);
-	if (ret && ret != -EPROBE_DEFER && ret != -ENOLINK)
-		dev_warn(rcdu->dev,
-			 "failed to initialize encoder %pOF on output %s (%d), skipping\n",
-			 entity, rcar_du_output_name(output), ret);
-
-	of_node_put(entity);
-
-	return ret;
-}
-
-static int rcar_du_encoders_init(struct rcar_du_device *rcdu)
-{
-	struct device_node *np = rcdu->dev->of_node;
-	struct device_node *ep_node;
-	unsigned int num_encoders = 0;
-
-	/*
-	 * Iterate over the endpoints and create one encoder for each output
-	 * pipeline.
-	 */
-	for_each_endpoint_of_node(np, ep_node) {
-		enum rcar_du_output output;
-		struct of_endpoint ep;
-		unsigned int i;
-		int ret;
-
-		ret = of_graph_parse_endpoint(ep_node, &ep);
-		if (ret < 0) {
-			of_node_put(ep_node);
-			return ret;
-		}
-
-		/* Find the output route corresponding to the port number. */
-		for (i = 0; i < RCAR_DU_OUTPUT_MAX; ++i) {
-			if (rcdu->info->routes[i].possible_crtcs &&
-			    rcdu->info->routes[i].port == ep.port) {
-				output = i;
-				break;
-			}
-		}
-
-		if (i == RCAR_DU_OUTPUT_MAX) {
-			dev_warn(rcdu->dev,
-				 "port %u references unexisting output, skipping\n",
-				 ep.port);
-			continue;
-		}
-
-		/* Process the output pipeline. */
-		ret = rcar_du_encoders_init_one(rcdu, output, &ep);
-		if (ret < 0) {
-			if (ret == -EPROBE_DEFER) {
-				of_node_put(ep_node);
-				return ret;
-			}
-
-			continue;
-		}
-
-		num_encoders++;
-	}
-
-	return num_encoders;
-}
-
 static int rcar_du_properties_init(struct rcar_du_device *rcdu)
 {
 	/*
@@ -457,7 +368,8 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	}
 
 	/* Initialize the encoders. */
-	ret = rcar_du_encoders_init(rcdu);
+	ret = rcar_du_encoders_init(rcdu, rcar_du_output_name,
+				    rcar_du_encoder_init);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
index a2d56ca56fc3..5fe2a1bd8de2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -15,6 +15,8 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/videodev2.h>
 
 #include "rcar_du_drv.h"
@@ -506,3 +508,103 @@ rcar_du_lib_mode_cfg_helper_get(void)
 {
 	return &rcar_du_mode_config_helper;
 }
+
+static int
+rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
+			  enum rcar_du_output output,
+			  struct of_endpoint *ep,
+			  const char *output_name,
+			  int (*rcar_du_encoder_init_fn)(struct rcar_du_device *r,
+							 enum rcar_du_output op,
+							 struct device_node *d))
+{
+	struct device_node *entity;
+	int ret;
+
+	/* Locate the connected entity and initialize the encoder. */
+	entity = of_graph_get_remote_port_parent(ep->local_node);
+	if (!entity) {
+		dev_dbg(rcdu->dev, "unconnected endpoint %pOF, skipping\n",
+			ep->local_node);
+		return -ENODEV;
+	}
+
+	if (!of_device_is_available(entity)) {
+		dev_dbg(rcdu->dev,
+			"connected entity %pOF is disabled, skipping\n",
+			entity);
+		of_node_put(entity);
+		return -ENODEV;
+	}
+
+	ret = rcar_du_encoder_init_fn(rcdu, output, entity);
+	if (ret && ret != -EPROBE_DEFER && ret != -ENOLINK)
+		dev_warn(rcdu->dev,
+			 "failed to initialize encoder %pOF on output %s (%d), skipping\n",
+			 entity, output_name, ret);
+
+	of_node_put(entity);
+
+	return ret;
+}
+
+int rcar_du_encoders_init(struct rcar_du_device *rcdu,
+			  const char* (*out_name)(enum rcar_du_output output),
+			  int (*encoder_init_fn)(struct rcar_du_device *rcdu,
+						 enum rcar_du_output output,
+						 struct device_node *enc_node))
+{
+	struct device_node *np = rcdu->dev->of_node;
+	struct device_node *ep_node;
+	unsigned int num_encoders = 0;
+
+	/*
+	 * Iterate over the endpoints and create one encoder for each output
+	 * pipeline.
+	 */
+	for_each_endpoint_of_node(np, ep_node) {
+		enum rcar_du_output output;
+		struct of_endpoint ep;
+		unsigned int i;
+		int ret;
+
+		ret = of_graph_parse_endpoint(ep_node, &ep);
+		if (ret < 0) {
+			of_node_put(ep_node);
+			return ret;
+		}
+
+		/* Find the output route corresponding to the port number. */
+		for (i = 0; i < RCAR_DU_OUTPUT_MAX; ++i) {
+			if (rcdu->info->routes[i].possible_crtcs &&
+			    rcdu->info->routes[i].port == ep.port) {
+				output = i;
+				break;
+			}
+		}
+
+		if (i == RCAR_DU_OUTPUT_MAX) {
+			dev_warn(rcdu->dev,
+				 "port %u references unexisting output, skipping\n",
+				 ep.port);
+			continue;
+		}
+
+		/* Process the output pipeline. */
+		ret = rcar_du_encoders_init_one(rcdu, output, &ep,
+						out_name(output),
+						encoder_init_fn);
+		if (ret < 0) {
+			if (ret == -EPROBE_DEFER) {
+				of_node_put(ep_node);
+				return ret;
+			}
+
+			continue;
+		}
+
+		num_encoders++;
+	}
+
+	return num_encoders;
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
index bba68592e73d..1028ce490484 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -46,4 +46,10 @@ rcar_du_lib_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 const struct drm_mode_config_helper_funcs *
 rcar_du_lib_mode_cfg_helper_get(void);
 
+int rcar_du_encoders_init(struct rcar_du_device *rcdu,
+			  const char* (*out_name)(enum rcar_du_output output),
+			  int (*encoder_init_fn)(struct rcar_du_device *rcdu,
+						 enum rcar_du_output output,
+						 struct device_node *enc_node));
+
 #endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

