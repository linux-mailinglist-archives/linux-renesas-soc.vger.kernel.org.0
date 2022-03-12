Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9134D712C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Mar 2022 22:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232552AbiCLVzn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 12 Mar 2022 16:55:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbiCLVzm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Mar 2022 16:55:42 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4379834BB9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Mar 2022 13:54:36 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,177,1643641200"; 
   d="scan'208";a="114196808"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Mar 2022 06:54:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A20074005E2B;
        Sun, 13 Mar 2022 06:54:33 +0900 (JST)
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
Subject: [PATCH 4/7] drm: rcar-du: Move rcar_du_output_name() to rcar_du_common.c
Date:   Sat, 12 Mar 2022 21:54:14 +0000
Message-Id: <20220312215417.8023-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220312215417.8023-1-biju.das.jz@bp.renesas.com>
References: <20220312215417.8023-1-biju.das.jz@bp.renesas.com>
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
RFC->v1:
 New patch
---
 drivers/gpu/drm/rcar-du/Makefile         |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_common.c | 30 ++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c    | 20 ----------------
 3 files changed, 31 insertions(+), 20 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_common.c

diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 5b5d9b1821f7..7475c329e2cf 100644
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

