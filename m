Return-Path: <linux-renesas-soc+bounces-6488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E8A90E845
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 12:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 521F4286275
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 10:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912D182C60;
	Wed, 19 Jun 2024 10:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JXNDgq6H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056CF8287C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jun 2024 10:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718792569; cv=none; b=Bx/RBFt2kwdnTB9PXdJPOkV4JzksMssZ0aIBbNjUIGag4BeIlHqWdeZa/bnJM5S7kjUFyn0Bw8x8Vza/FgzvZH5YeWtqx6g3HN+Z2JATo7HjDlyd997L02ls/C6EpngeLB+YSj7tuiKH0DM57pYsDaPrzRP5A7KFMGGbZwqPP0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718792569; c=relaxed/simple;
	bh=xJi0mpw5h2Tl1pzyNtLKb/aNVp40jhtNs1qUQWZHnZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqTX5KztRdr5TItmKtvtUVMO92wBi3CLtEIBNumF70fm7BwB+C6f9tVCo4QnIu96MOKxBNCOHGLJlguE1V1d1LeaWImF4zP6kKgAvLf2pvdsexhka6Kb5rhUeZL9DRrv1pfqbOvNwWnmyvnfcHSQAtPsOEuX2tFMKbHUOqJdgGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JXNDgq6H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6B8F1207;
	Wed, 19 Jun 2024 12:22:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718792543;
	bh=xJi0mpw5h2Tl1pzyNtLKb/aNVp40jhtNs1qUQWZHnZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JXNDgq6HzrxvZxLA9AcvgRN9kJoCjvFQIx9on7K60TVgDVEdq0n2H2mEtzg54UDC/
	 pGR9eheXydcXVUHy2cfIdo01UbiReTweiaOxWJOu+FnbXroXXHkWg3WPRvoZRPETmm
	 N7VJ8gBFDK9n3j1aDgclZHobvCmTgEq8Rhzyi+GY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS R-CAR),
	linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS R-CAR)
Subject: [PATCH 4/4] drm: rcar-du: Add support for R8A779H0
Date: Wed, 19 Jun 2024 12:22:18 +0200
Message-ID: <20240619102219.138927-5-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
References: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for R-Car R8A779H0 V4M which has similar characteristics
as the already supported R-Car V4H R8A779G0, but with a single output
channel.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
BSP patch
https://github.com/renesas-rcar/linux-bsp/commit/f2fc3314dab2052240653c1a31ba3d7c7190038e
---
---
 .../bindings/display/renesas,du.yaml           |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c  | 18 ++++++++++++++++++
 .../gpu/drm/renesas/rcar-du/rcar_du_group.c    | 17 ++++++++++++-----
 3 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index c5b9e6812bce..d369953f16f7 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -41,6 +41,7 @@ properties:
       - renesas,du-r8a77995 # for R-Car D3 compatible DU
       - renesas,du-r8a779a0 # for R-Car V3U compatible DU
       - renesas,du-r8a779g0 # for R-Car V4H compatible DU
+      - renesas,du-r8a779h0 # for R-Car V4M compatible DU
 
   reg:
     maxItems: 1
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index dee530e4c8b2..a1d174b0b00b 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -545,6 +545,23 @@ static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
 	.dsi_clk_mask =  BIT(1) | BIT(0),
 };
 
+static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
+	.gen = 4,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_VSP1_SOURCE
+		  | RCAR_DU_FEATURE_NO_BLENDING,
+	.channels_mask = BIT(0),
+	.routes = {
+		/* R8A779H0 has a single MIPI DSI output. */
+		[RCAR_DU_OUTPUT_DSI0] = {
+			.possible_crtcs = BIT(0),
+			.port = 0,
+		},
+	},
+	.num_rpf = 5,
+	.dsi_clk_mask = BIT(0),
+};
+
 static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
 	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
@@ -571,6 +588,7 @@ static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
 	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
 	{ .compatible = "renesas,du-r8a779g0", .data = &rcar_du_r8a779g0_info },
+	{ .compatible = "renesas,du-r8a779h0", .data = &rcar_du_r8a779h0_info },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
index 2ccd2581f544..361e1d01b817 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
@@ -111,6 +111,8 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
 		/*
 		 * On Gen3 dot clocks are setup through per-group registers,
 		 * only available when the group has two channels.
+		 *
+		 * R-Car V4M (R8A779H0) has only one channel, index is == 0.
 		 */
 		rcrtc = &rcdu->crtcs[rgrp->index * 2];
 		num_crtcs = rgrp->num_crtcs;
@@ -185,11 +187,16 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 		dorcr |= DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
 	rcar_du_group_write(rgrp, DORCR, dorcr);
 
-	/* Apply planes to CRTCs association. */
-	mutex_lock(&rgrp->lock);
-	rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
-			    rgrp->dptsr_planes);
-	mutex_unlock(&rgrp->lock);
+	/*
+	 * Apply planes to CRTCs association, skip for V4M which has a single
+	 * channel.
+	 */
+	if (rcdu->info->gen < 4 || rgrp->num_crtcs > 1) {
+		mutex_lock(&rgrp->lock);
+		rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
+				    rgrp->dptsr_planes);
+		mutex_unlock(&rgrp->lock);
+	}
 }
 
 /*
-- 
2.45.2


