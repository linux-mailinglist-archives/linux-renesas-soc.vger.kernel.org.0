Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E52C1D346F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 17:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbgENPHK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 May 2020 11:07:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39768 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbgENPHJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 May 2020 11:07:09 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0125B259;
        Thu, 14 May 2020 17:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589468828;
        bh=5FGPTrgZceHOPzO7FIcH6Gx6954XCnoKXy/ymuM7vRw=;
        h=From:To:Cc:Subject:Date:From;
        b=Hu1B2QGa8y4CLA/2jsXnrzrx6EmI5yvQ0OnCej0ui4hkzVnA4lhdcjkMb8QG6yG8H
         dw2ST8/8B0QOCd8udHw+Sh8Kgz/IKflwouWjg6LgVKD0gQEshTMmLegpTzuJ7KKWBo
         nzseT5fgqD7e80TsB7TjOhbrSsg43Mr4asib72lQ=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 1/2] drm: rcar-du: Iterate over connectors in rcar_du_crtc_atomic_check()
Date:   Thu, 14 May 2020 18:06:56 +0300
Message-Id: <20200514150657.25431-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace iteration over encoders with iteration over connectors. This is
a bit more aligned with the atomic framework, but more importantly, the
change prepares for code that will need to access the connector.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index d73e88ddecd0..fbe927278634 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -685,7 +685,9 @@ static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
 				     struct drm_crtc_state *state)
 {
 	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(state);
-	struct drm_encoder *encoder;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *connector;
+	unsigned int i;
 	int ret;
 
 	ret = rcar_du_cmm_check(crtc, state);
@@ -695,15 +697,17 @@ static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
 	/* Store the routes from the CRTC output to the DU outputs. */
 	rstate->outputs = 0;
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, state->encoder_mask) {
-		struct rcar_du_encoder *renc;
+	for_each_new_connector_in_state(state->state, connector, conn_state, i) {
+		struct drm_encoder *encoder = conn_state->best_encoder;
+
+		if (!encoder)
+			continue;
 
 		/* Skip the writeback encoder. */
 		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
 			continue;
 
-		renc = to_rcar_encoder(encoder);
-		rstate->outputs |= BIT(renc->output);
+		rstate->outputs |= BIT(to_rcar_encoder(encoder)->output);
 	}
 
 	return 0;
-- 
Regards,

Laurent Pinchart

