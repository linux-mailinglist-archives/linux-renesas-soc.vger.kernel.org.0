Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93E3F2CF691
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Dec 2020 23:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgLDWDn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Dec 2020 17:03:43 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:52140 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgLDWDn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 17:03:43 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95EDB1A80;
        Fri,  4 Dec 2020 23:01:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607119309;
        bh=DhAKNOE0UZN2oEqKd8blw01MGj/95HAG/fZjobT0FkM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lZ5YaRQD20tlTvkaaMeIeun4y+c+ah8IiXeOC592XjhPFKnpQEp0jDY0wZyQzCo72
         cs+/llH9ACZuYMlTngNen+6Y22sI7zq57tk8+oAs4bRgPtEClorf/PViQbWducJfxN
         obkGAe20lZItDaoEcRGzPA+Hv5EbaMJIn7Nj1t9s=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 9/9] drm: rcar-du: Drop local encoder variable
Date:   Sat,  5 Dec 2020 00:01:39 +0200
Message-Id: <20201204220139.15272-10-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The local encoder variable is an alias for &renc->base, and is only use
twice. It doesn't help much, drop it, along with the
rcar_encoder_to_drm_encoder() macro that is then unused.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 6 ++----
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h | 2 --
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 49c0b27e2f5a..9a565bd3380d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -61,7 +61,6 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 struct device_node *enc_node)
 {
 	struct rcar_du_encoder *renc;
-	struct drm_encoder *encoder;
 	struct drm_bridge *bridge;
 	int ret;
 
@@ -108,12 +107,11 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 
 	rcdu->encoders[output] = renc;
 	renc->output = output;
-	encoder = rcar_encoder_to_drm_encoder(renc);
 
 	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
 		enc_node, output);
 
-	ret = drm_encoder_init(&rcdu->ddev, encoder, &rcar_du_encoder_funcs,
+	ret = drm_encoder_init(&rcdu->ddev, &renc->base, &rcar_du_encoder_funcs,
 			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret < 0)
 		goto error;
@@ -127,7 +125,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	 * Attach the bridge to the encoder. The bridge will create the
 	 * connector.
 	 */
-	return drm_bridge_attach(encoder, bridge, NULL, 0);
+	return drm_bridge_attach(&renc->base, bridge, NULL, 0);
 
 error:
 	kfree(renc);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
index df9be4524301..73560563fb31 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
@@ -22,8 +22,6 @@ struct rcar_du_encoder {
 #define to_rcar_encoder(e) \
 	container_of(e, struct rcar_du_encoder, base)
 
-#define rcar_encoder_to_drm_encoder(e)	(&(e)->base)
-
 int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 enum rcar_du_output output,
 			 struct device_node *enc_node);
-- 
Regards,

Laurent Pinchart

