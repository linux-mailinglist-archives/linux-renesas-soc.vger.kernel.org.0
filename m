Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FAC9636730
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Nov 2022 18:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238891AbiKWRak (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Nov 2022 12:30:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238578AbiKWRaL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2022 12:30:11 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A7E9F5DB94
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Nov 2022 09:30:10 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,187,1665414000"; 
   d="scan'208";a="143666685"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Nov 2022 02:30:10 +0900
Received: from localhost.localdomain (unknown [10.226.92.61])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A90AC40AE61C;
        Thu, 24 Nov 2022 02:30:07 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 17/19] drm: rcar-du: Add rcar_du_lib_vsps_init()
Date:   Wed, 23 Nov 2022 17:29:04 +0000
Message-Id: <20221123172906.2919734-18-biju.das.jz@bp.renesas.com>
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

Add rcar_du_lib_vsps_init() to RCar DU kms lib to handle both
rcar_du_vsp_init() and rzg2l_du_vsp_init().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Rebased to drm-misc-next.
v5:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 88 +---------------------
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c | 89 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h |  5 ++
 3 files changed, 95 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 01ffe36f9d44..6f3352a6a264 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -69,92 +69,6 @@ static const struct drm_mode_config_funcs rcar_du_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
-{
-	const struct device_node *np = rcdu->dev->of_node;
-	const char *vsps_prop_name = "renesas,vsps";
-	struct of_phandle_args args;
-	struct {
-		struct device_node *np;
-		unsigned int crtcs_mask;
-	} vsps[RCAR_DU_MAX_VSPS] = { { NULL, }, };
-	unsigned int vsps_count = 0;
-	unsigned int cells;
-	unsigned int i;
-	int ret;
-
-	/*
-	 * First parse the DT vsps property to populate the list of VSPs. Each
-	 * entry contains a pointer to the VSP DT node and a bitmask of the
-	 * connected DU CRTCs.
-	 */
-	ret = of_property_count_u32_elems(np, vsps_prop_name);
-	if (ret < 0) {
-		/* Backward compatibility with old DTBs. */
-		vsps_prop_name = "vsps";
-		ret = of_property_count_u32_elems(np, vsps_prop_name);
-	}
-	cells = ret / rcdu->num_crtcs - 1;
-	if (cells > 1)
-		return -EINVAL;
-
-	for (i = 0; i < rcdu->num_crtcs; ++i) {
-		unsigned int j;
-
-		ret = of_parse_phandle_with_fixed_args(np, vsps_prop_name,
-						       cells, i, &args);
-		if (ret < 0)
-			goto error;
-
-		/*
-		 * Add the VSP to the list or update the corresponding existing
-		 * entry if the VSP has already been added.
-		 */
-		for (j = 0; j < vsps_count; ++j) {
-			if (vsps[j].np == args.np)
-				break;
-		}
-
-		if (j < vsps_count)
-			of_node_put(args.np);
-		else
-			vsps[vsps_count++].np = args.np;
-
-		vsps[j].crtcs_mask |= BIT(i);
-
-		/*
-		 * Store the VSP pointer and pipe index in the CRTC. If the
-		 * second cell of the 'renesas,vsps' specifier isn't present,
-		 * default to 0 to remain compatible with older DT bindings.
-		 */
-		rcdu->crtcs[i].vsp = &rcdu->vsps[j];
-		rcdu->crtcs[i].vsp_pipe = cells >= 1 ? args.args[0] : 0;
-	}
-
-	/*
-	 * Then initialize all the VSPs from the node pointers and CRTCs bitmask
-	 * computed previously.
-	 */
-	for (i = 0; i < vsps_count; ++i) {
-		struct rcar_du_vsp *vsp = &rcdu->vsps[i];
-
-		vsp->index = i;
-		vsp->dev = rcdu;
-
-		ret = rcar_du_vsp_init(vsp, vsps[i].np, vsps[i].crtcs_mask);
-		if (ret < 0)
-			goto error;
-	}
-
-	return 0;
-
-error:
-	for (i = 0; i < ARRAY_SIZE(vsps); ++i)
-		of_node_put(vsps[i].np);
-
-	return ret;
-}
-
 static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
 {
 	const struct device_node *np = rcdu->dev->of_node;
@@ -326,7 +240,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 
 	/* Initialize the compositors. */
 	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE)) {
-		ret = rcar_du_vsps_init(rcdu);
+		ret = rcar_du_lib_vsps_init(rcdu, rcar_du_vsp_init);
 		if (ret < 0)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
index 21777d782018..cac82728c9f9 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -624,3 +624,92 @@ int rcar_du_properties_init(struct rcar_du_device *rcdu)
 
 	return 0;
 }
+
+int rcar_du_lib_vsps_init(struct rcar_du_device *rcdu,
+			  int (*rcar_du_vsp_init_fn)(struct rcar_du_vsp *vsp,
+						     struct device_node *np,
+						     unsigned int crtcs))
+{
+	const struct device_node *np = rcdu->dev->of_node;
+	const char *vsps_prop_name = "renesas,vsps";
+	struct of_phandle_args args;
+	struct {
+		struct device_node *np;
+		unsigned int crtcs_mask;
+	} vsps[RCAR_DU_MAX_VSPS] = { { NULL, }, };
+	unsigned int vsps_count = 0;
+	unsigned int cells;
+	unsigned int i;
+	int ret;
+
+	/*
+	 * First parse the DT vsps property to populate the list of VSPs. Each
+	 * entry contains a pointer to the VSP DT node and a bitmask of the
+	 * connected DU CRTCs.
+	 */
+	ret = of_property_count_u32_elems(np, vsps_prop_name);
+	if (ret < 0) {
+		/* Backward compatibility with old DTBs. */
+		vsps_prop_name = "vsps";
+		ret = of_property_count_u32_elems(np, vsps_prop_name);
+	}
+	cells = ret / rcdu->num_crtcs - 1;
+	if (cells > 1)
+		return -EINVAL;
+
+	for (i = 0; i < rcdu->num_crtcs; ++i) {
+		unsigned int j;
+
+		ret = of_parse_phandle_with_fixed_args(np, vsps_prop_name,
+						       cells, i, &args);
+		if (ret < 0)
+			goto error;
+
+		/*
+		 * Add the VSP to the list or update the corresponding existing
+		 * entry if the VSP has already been added.
+		 */
+		for (j = 0; j < vsps_count; ++j) {
+			if (vsps[j].np == args.np)
+				break;
+		}
+
+		if (j < vsps_count)
+			of_node_put(args.np);
+		else
+			vsps[vsps_count++].np = args.np;
+
+		vsps[j].crtcs_mask |= BIT(i);
+
+		/*
+		 * Store the VSP pointer and pipe index in the CRTC. If the
+		 * second cell of the 'renesas,vsps' specifier isn't present,
+		 * default to 0 to remain compatible with older DT bindings.
+		 */
+		rcdu->crtcs[i].vsp = &rcdu->vsps[j];
+		rcdu->crtcs[i].vsp_pipe = cells >= 1 ? args.args[0] : 0;
+	}
+
+	/*
+	 * Then initialize all the VSPs from the node pointers and CRTCs bitmask
+	 * computed previously.
+	 */
+	for (i = 0; i < vsps_count; ++i) {
+		struct rcar_du_vsp *vsp = &rcdu->vsps[i];
+
+		vsp->index = i;
+		vsp->dev = rcdu;
+
+		ret = rcar_du_vsp_init_fn(vsp, vsps[i].np, vsps[i].crtcs_mask);
+		if (ret < 0)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	for (i = 0; i < ARRAY_SIZE(vsps); ++i)
+		of_node_put(vsps[i].np);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
index 8fcba1b9c28f..033750260668 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -54,4 +54,9 @@ int rcar_du_encoders_init(struct rcar_du_device *rcdu,
 
 int rcar_du_properties_init(struct rcar_du_device *rcdu);
 
+int rcar_du_lib_vsps_init(struct rcar_du_device *rcdu,
+			  int (*rcar_du_vsp_init_fn)(struct rcar_du_vsp *vsp,
+						     struct device_node *np,
+						     unsigned int crtcs));
+
 #endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

