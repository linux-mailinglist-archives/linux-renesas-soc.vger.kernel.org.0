Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAF9E677988
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jan 2023 11:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbjAWKsU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 05:48:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231842AbjAWKsT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 05:48:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A7015569
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 02:48:16 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B61E3CCE;
        Mon, 23 Jan 2023 11:48:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674470884;
        bh=dDTAac55xLx/YGt/Z776k3LIei6Uzm45imM7tk3QwKY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ROIZBIYVlND6nL9mr4PH5P7QkRmHB+i97StV/JmJ+8VYH5EnLF57vPKTmaQnrbarg
         iIKcStEYe9BJTCffKq1MEGCs+wcKyjIw50P+NjMdPhFFyDjoJW9kJe3azZuDMcnjEx
         4D8FUu3mLVX4Fk9j14bnrNfZk1Frd7gSRa1cH3WM=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 7/7] drm: rcar-du: Stop accessing non-existant registers on gen4
Date:   Mon, 23 Jan 2023 12:47:42 +0200
Message-Id: <20230123104742.227460-8-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123104742.227460-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20230123104742.227460-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following registers do not exist on gen4, so we should not write
them: DEF6Rm, DEF7Rm, DEF8Rm, ESCRn, OTARn.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |  8 +++++---
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 24 ++++++++++++++----------
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index b7dd59fe119e..008e172ed43b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -298,10 +298,12 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		escr = params.escr;
 	}
 
-	dev_dbg(rcrtc->dev->dev, "%s: ESCR 0x%08x\n", __func__, escr);
+	if (rcdu->info->gen < 4) {
+		dev_dbg(rcrtc->dev->dev, "%s: ESCR 0x%08x\n", __func__, escr);
 
-	rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);
-	rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? OTAR13 : OTAR02, 0);
+		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);
+		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? OTAR13 : OTAR02, 0);
+	}
 
 	/* Signal polarities */
 	dsmr = ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DSMR_VSL : 0)
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 6da01760ede5..152602236377 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -148,19 +148,23 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 	}
 	rcar_du_group_write(rgrp, DEFR5, DEFR5_CODE | DEFR5_DEFE5);
 
-	rcar_du_group_setup_pins(rgrp);
+	if (rcdu->info->gen < 4)
+		rcar_du_group_setup_pins(rgrp);
 
-	/*
-	 * TODO: Handle routing of the DU output to CMM dynamically, as we
-	 * should bypass CMM completely when no color management feature is
-	 * used.
-	 */
-	defr7 |= (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0) |
-		 (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
-	rcar_du_group_write(rgrp, DEFR7, defr7);
+	if (rcdu->info->gen < 4) {
+		/*
+		 * TODO: Handle routing of the DU output to CMM dynamically, as
+		 * we should bypass CMM completely when no color management
+		 * feature is used.
+		 */
+		defr7 |= (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0) |
+			 (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
+		rcar_du_group_write(rgrp, DEFR7, defr7);
+	}
 
 	if (rcdu->info->gen >= 2) {
-		rcar_du_group_setup_defr8(rgrp);
+		if (rcdu->info->gen < 4)
+			rcar_du_group_setup_defr8(rgrp);
 		rcar_du_group_setup_didsr(rgrp);
 	}
 
-- 
2.34.1

