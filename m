Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7D496DD9F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Apr 2023 13:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjDKLpa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Apr 2023 07:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbjDKLp2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Apr 2023 07:45:28 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2D14546B1;
        Tue, 11 Apr 2023 04:45:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,336,1673881200"; 
   d="scan'208";a="155597457"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Apr 2023 20:44:08 +0900
Received: from localhost.localdomain (unknown [10.226.93.123])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D27234008C6C;
        Tue, 11 Apr 2023 20:44:03 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 17/17] drm: rcar-du: Add rcar_du_lib_vsps_init()
Date:   Tue, 11 Apr 2023 12:42:35 +0100
Message-Id: <20230411114235.366042-18-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411114235.366042-1-biju.das.jz@bp.renesas.com>
References: <20230411114235.366042-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add rcar_du_lib_vsps_init() to RCar DU kms lib to handle both
rcar_du_vsp_init() and rzg2l_du_vsp_init().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * Rebased to drm-tip.
v1->v6:
 * Rebased on drm-misc-next and DU-next.
v1:
 * Created the lib suggested by Laurent.
Ref:
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220316131100.30685-6-biju.das.jz@bp.renesas.com/
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
index 438a56c550f2..b9949dbd3c33 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -653,3 +653,92 @@ int rcar_du_properties_init(struct rcar_du_device *rcdu)
 
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
index 50e92a19d98c..81bb38eadbe0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -53,4 +53,9 @@ int rcar_du_encoders_init(struct rcar_du_device *rcdu,
 
 int rcar_du_properties_init(struct rcar_du_device *rcdu);
 
+int rcar_du_lib_vsps_init(struct rcar_du_device *rcdu,
+			  int (*rcar_du_vsp_init_fn)(struct rcar_du_vsp *vsp,
+						     struct device_node *np,
+						     unsigned int crtcs));
+
 #endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

