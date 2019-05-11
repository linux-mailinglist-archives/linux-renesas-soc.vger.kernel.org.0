Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 298091A985
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 23:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbfEKVHj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 17:07:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58306 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbfEKVHj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 17:07:39 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D154D50;
        Sat, 11 May 2019 23:07:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557608854;
        bh=LaqJQT6TEqzcvHGeZpP78ao6L1MaaEzUsxmXK7DkUpc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UlFNRkKns+6amkU71I+chDhVQbrtu52/qwYmxZsvfG+03xaPLIJFtl33YjLJbFefJ
         sdgLFiHSJi+O0JpjOFZ2nHXKoBxRC/2MgSdYGaQoP3NWExTtOG0LVEY0klg41VpiSH
         rYdskH5LYkQvCuNtO6+fbt8tUWAZ30e0Xoq7JzIs=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 07/10] drm: rcar-du: Skip LVDS1 output on Gen3 when using dual-link LVDS mode
Date:   Sun, 12 May 2019 00:06:59 +0300
Message-Id: <20190511210702.18394-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In dual-link LVDS mode, the LVDS1 encoder is used as a companion for
LVDS0, and both encoders transmit data from DU0. The LVDS1 output of DU1
can't be used in that case, don't create an encoder and connector for
it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 12 ++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 6c91753af7bc..fe046d194944 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -16,6 +16,7 @@
 #include "rcar_du_drv.h"
 #include "rcar_du_encoder.h"
 #include "rcar_du_kms.h"
+#include "rcar_lvds.h"
 
 /* -----------------------------------------------------------------------------
  * Encoder
@@ -97,6 +98,17 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 		}
 	}
 
+	/*
+	 * On Gen3 skip the LVDS1 output if the LVDS1 encoder is used as a
+	 * companion for LVDS0 in dual-link mode.
+	 */
+	if (rcdu->info->gen >= 3 && output == RCAR_DU_OUTPUT_LVDS1) {
+		if (bridge && rcar_lvds_dual_link(bridge)) {
+			ret = -ENOLINK;
+			goto done;
+		}
+	}
+
 	ret = drm_encoder_init(rcdu->ddev, encoder, &encoder_funcs,
 			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index f8f7fff34dff..95c81e59e2f1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -378,7 +378,7 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 	}
 
 	ret = rcar_du_encoder_init(rcdu, output, entity);
-	if (ret && ret != -EPROBE_DEFER)
+	if (ret && ret != -EPROBE_DEFER && ret != -ENOLINK)
 		dev_warn(rcdu->dev,
 			 "failed to initialize encoder %pOF on output %u (%d), skipping\n",
 			 entity, output, ret);
-- 
Regards,

Laurent Pinchart

