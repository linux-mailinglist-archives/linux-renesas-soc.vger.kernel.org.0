Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1334DB09C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Mar 2022 14:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356094AbiCPNMl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Mar 2022 09:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356087AbiCPNMk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Mar 2022 09:12:40 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5033F66C89
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Mar 2022 06:11:18 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,186,1643641200"; 
   d="scan'208";a="114619613"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 16 Mar 2022 22:11:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6157B429C363;
        Wed, 16 Mar 2022 22:11:15 +0900 (JST)
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
Subject: [PATCH v2 4/7] drm: rcar-du: Move rcar_du_output_name() to rcar_du_common.c
Date:   Wed, 16 Mar 2022 13:10:57 +0000
Message-Id: <20220316131100.30685-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L SoC's does not have group/plane registers compared to RCar, hence it
needs a different CRTC implementation.

Move rcar_du_output_name() to a new common file rcar_du_common.c, So that
the same function can be reused by RZ/G2L SoC later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
RFC->v1:
 New patch
---
 drivers/gpu/drm/rcar-du/Makefile         |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_common.c | 30 ++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c    | 20 ----------------
 3 files changed, 31 insertions(+), 20 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_common.c

diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index e7275b5e7ec8..331e12d65a6b 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 rcar-du-drm-y := rcar_du_crtc.o \
+		 rcar_du_common.o \
 		 rcar_du_drv.o \
 		 rcar_du_encoder.o \
 		 rcar_du_group.o \
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_common.c b/drivers/gpu/drm/rcar-du/rcar_du_common.c
new file mode 100644
index 000000000000..f9f9908cda6d
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_common.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * rcar_du_common.c  --  R-Car Display Unit Common
+ *
+ * Copyright (C) 2013-2022 Renesas Electronics Corporation
+ *
+ * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
+ */
+
+#include "rcar_du_drv.h"
+
+const char *rcar_du_output_name(enum rcar_du_output output)
+{
+	static const char * const names[] = {
+		[RCAR_DU_OUTPUT_DPAD0] = "DPAD0",
+		[RCAR_DU_OUTPUT_DPAD1] = "DPAD1",
+		[RCAR_DU_OUTPUT_DSI0] = "DSI0",
+		[RCAR_DU_OUTPUT_DSI1] = "DSI1",
+		[RCAR_DU_OUTPUT_HDMI0] = "HDMI0",
+		[RCAR_DU_OUTPUT_HDMI1] = "HDMI1",
+		[RCAR_DU_OUTPUT_LVDS0] = "LVDS0",
+		[RCAR_DU_OUTPUT_LVDS1] = "LVDS1",
+		[RCAR_DU_OUTPUT_TCON] = "TCON",
+	};
+
+	if (output >= ARRAY_SIZE(names) || !names[output])
+		return "UNKNOWN";
+
+	return names[output];
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 4640c356a532..f6e234dafb72 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -591,26 +591,6 @@ static const struct of_device_id rcar_du_of_table[] = {
 
 MODULE_DEVICE_TABLE(of, rcar_du_of_table);
 
-const char *rcar_du_output_name(enum rcar_du_output output)
-{
-	static const char * const names[] = {
-		[RCAR_DU_OUTPUT_DPAD0] = "DPAD0",
-		[RCAR_DU_OUTPUT_DPAD1] = "DPAD1",
-		[RCAR_DU_OUTPUT_DSI0] = "DSI0",
-		[RCAR_DU_OUTPUT_DSI1] = "DSI1",
-		[RCAR_DU_OUTPUT_HDMI0] = "HDMI0",
-		[RCAR_DU_OUTPUT_HDMI1] = "HDMI1",
-		[RCAR_DU_OUTPUT_LVDS0] = "LVDS0",
-		[RCAR_DU_OUTPUT_LVDS1] = "LVDS1",
-		[RCAR_DU_OUTPUT_TCON] = "TCON",
-	};
-
-	if (output >= ARRAY_SIZE(names) || !names[output])
-		return "UNKNOWN";
-
-	return names[output];
-}
-
 /* -----------------------------------------------------------------------------
  * DRM operations
  */
-- 
2.17.1

