Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C296569EE24
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Feb 2023 06:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbjBVFGc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Feb 2023 00:06:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjBVFGb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Feb 2023 00:06:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D022F796
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Feb 2023 21:06:29 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05CE29DE;
        Wed, 22 Feb 2023 06:06:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677042387;
        bh=imn2q5E5nIdnrwQDNKhiRNX21Oip/rmQqdjeh/f+bg4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GwJk1TUNHz3AVPvYTLDhl9hsCYyEiOKgfwRbVGOAyYqMU6fHtKOI9nsjNpIP8qNUl
         c3ZwrDQg0sdUsojNODRBT4CWCZzA02Lx6DMTB5WMAZCBppvYZz3MO42E3Eyz2Bofox
         LhoqJvZn1GiA6pJLg86y/RAY/fqYMwnUVFPthaFE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 1/2] drm: rcar-du: Don't write unimplemented ESCR and OTAR registers on Gen3
Date:   Wed, 22 Feb 2023 07:06:22 +0200
Message-Id: <20230222050623.29080-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222050623.29080-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20230222050623.29080-1-laurent.pinchart+renesas@ideasonboard.com>
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

The ESCR and OTAR registers are not present in all DU channels on Gen3
SoCs. ESCR only exists in channels that can be routed to an LVDS or
DPAD, and OTAR in channels that can be routed to a DPAD. Skip writing
those registers for other channels. This replaces the DU gen check, as
Gen4 doesn't have LVDS or DPAD outputs.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 5e552b326162..d6d29be6b4f4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -298,12 +298,25 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		escr = params.escr;
 	}
 
-	if (rcdu->info->gen < 4) {
+	/*
+	 * The ESCR register only exists in DU channels that can output to an
+	 * LVDS or DPAT, and the OTAR register in DU channels that can output
+	 * to a DPAD.
+	 */
+	if ((rcdu->info->routes[RCAR_DU_OUTPUT_DPAD0].possible_crtcs |
+	     rcdu->info->routes[RCAR_DU_OUTPUT_DPAD1].possible_crtcs |
+	     rcdu->info->routes[RCAR_DU_OUTPUT_LVDS0].possible_crtcs |
+	     rcdu->info->routes[RCAR_DU_OUTPUT_LVDS1].possible_crtcs) &
+	    BIT(rcrtc->index)) {
 		dev_dbg(rcrtc->dev->dev, "%s: ESCR 0x%08x\n", __func__, escr);
 
 		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);
+	}
+
+	if ((rcdu->info->routes[RCAR_DU_OUTPUT_DPAD0].possible_crtcs |
+	     rcdu->info->routes[RCAR_DU_OUTPUT_DPAD1].possible_crtcs) &
+	    BIT(rcrtc->index))
 		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? OTAR13 : OTAR02, 0);
-	}
 
 	/* Signal polarities */
 	dsmr = ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DSMR_VSL : 0)
-- 
Regards,

Laurent Pinchart

