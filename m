Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB44C582A54
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Jul 2022 18:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232782AbiG0QIb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Jul 2022 12:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232334AbiG0QI3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 12:08:29 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1CF134AD77
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Jul 2022 09:08:29 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,195,1654527600"; 
   d="scan'208";a="127555176"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Jul 2022 01:08:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.195])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 51BFE4018A35;
        Thu, 28 Jul 2022 01:08:25 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 07/10] drm: rcar-du: Move rcar_du_properties_init()
Date:   Wed, 27 Jul 2022 17:07:50 +0100
Message-Id: <20220727160753.1774761-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
References: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move rcar_du_properties_init() to RCar DU kms lib, so that it can be
shared by both RCar and RZ/G2L kms drivers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 16 ----------------
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c | 16 ++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h |  2 ++
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 7586520e1871..b3ebe694be6e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -74,22 +74,6 @@ static const struct drm_mode_config_funcs rcar_du_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-static int rcar_du_properties_init(struct rcar_du_device *rcdu)
-{
-	/*
-	 * The color key is expressed as an RGB888 triplet stored in a 32-bit
-	 * integer in XRGB8888 format. Bit 24 is used as a flag to disable (0)
-	 * or enable source color keying (1).
-	 */
-	rcdu->props.colorkey =
-		drm_property_create_range(&rcdu->ddev, 0, "colorkey",
-					  0, 0x01ffffff);
-	if (rcdu->props.colorkey == NULL)
-		return -ENOMEM;
-
-	return 0;
-}
-
 static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
 {
 	const struct device_node *np = rcdu->dev->of_node;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
index d41fee590ee4..a56f3d6db321 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -617,3 +617,19 @@ int rcar_du_encoders_init(struct rcar_du_device *rcdu,
 
 	return num_encoders;
 }
+
+int rcar_du_properties_init(struct rcar_du_device *rcdu)
+{
+	/*
+	 * The color key is expressed as an RGB888 triplet stored in a 32-bit
+	 * integer in XRGB8888 format. Bit 24 is used as a flag to disable (0)
+	 * or enable source color keying (1).
+	 */
+	rcdu->props.colorkey =
+		drm_property_create_range(&rcdu->ddev, 0, "colorkey",
+					  0, 0x01ffffff);
+	if (rcdu->props.colorkey == NULL)
+		return -ENOMEM;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
index 02d6ed5aa154..b04c42bbae5c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -52,4 +52,6 @@ int rcar_du_encoders_init(struct rcar_du_device *rcdu,
 						 enum rcar_du_output output,
 						 struct device_node *enc_node));
 
+int rcar_du_properties_init(struct rcar_du_device *rcdu);
+
 #endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

