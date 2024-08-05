Return-Path: <linux-renesas-soc+bounces-7734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 963D8947F32
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 18:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 528A1281B6A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 16:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE3515B97A;
	Mon,  5 Aug 2024 16:22:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DE11547DC
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Aug 2024 16:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722874932; cv=none; b=BAQRtsFrcB9jMLH3xMLWrGF1zQRsoBC0WQjuCvHULHU3oIuI1zoLQRHK+LlfmSI4oflalQNLBCb71XBRf9OJ7Y7vE0g0G6rVHDF60aIcT4pgCq4h/PJys2UPzkBApcUSVtJZ9jXtmTrcyBgvbPxON/qKWK3YAtJqKGfrn1Bwdp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722874932; c=relaxed/simple;
	bh=OeYjNe/w5i582MPFt92xbmrQGYyYP5+9IHbF+3Iv+yQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iV9SnzfZPTNBa0OWeSoMuHpE2Q7z0CzeHgRJbTvZO25cHh1NTcCjIqtjoqxjNF5w66gnnOCX2/7aXrFsoEgcHBhbYfUI904WGfQeu0rxXYGtdIN5BfRjWeCG++B/F8eiZISQhaAnq3YQuP6FgoUTEiaYM/tBSIf+C2rZUbpgmEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,265,1716217200"; 
   d="scan'208";a="218709933"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Aug 2024 01:22:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.197])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 492BB4008C7C;
	Tue,  6 Aug 2024 00:52:56 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 2/4] drm: renesas: rz-du: Add RZ/G2UL DU Support
Date: Mon,  5 Aug 2024 16:52:36 +0100
Message-ID: <20240805155242.151661-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
References: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LCD controller is composed of Frame Compression Processor (FCPVD),
Video Signal Processor (VSPD), and Display Unit (DU).

It has DPI interface and supports a maximum resolution of WXGA along
with 2 RPFs to support the blending of two picture layers and raster
operations (ROPs).

The DU module is connected to VSPD. Add RZ/G2UL DU support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Avoided the line break in rzg2l_du_start_stop() for rstate.
 * Replaced port->du_output in  struct rzg2l_du_output_routing and
   dropped using the port number to indicate the output type in
   rzg2l_du_encoders_init().
 * Updated rzg2l_du_r9a07g043u_info and rzg2l_du_r9a07g044_info
v1->v2:
 * No change.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  8 +++++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 18 ++++++++++++++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  5 +++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |  4 ++--
 4 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 6e7aac6219be..fd7675c7f181 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -28,6 +28,7 @@
 #include "rzg2l_du_vsp.h"
 
 #define DU_MCR0			0x00
+#define DU_MCR0_DPI_OE		BIT(0)
 #define DU_MCR0_DI_EN		BIT(8)
 
 #define DU_DITR0		0x10
@@ -216,9 +217,14 @@ static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *rcrtc)
 
 static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool start)
 {
+	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(rcrtc->crtc.state);
 	struct rzg2l_du_device *rcdu = rcrtc->dev;
+	u32 val = DU_MCR0_DI_EN;
 
-	writel(start ? DU_MCR0_DI_EN : 0, rcdu->mmio + DU_MCR0);
+	if (rstate->outputs == BIT(RZG2L_DU_OUTPUT_DPAD0))
+		val |= DU_MCR0_DPI_OE;
+
+	writel(start ? val : 0, rcdu->mmio + DU_MCR0);
 }
 
 static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index e5eca8691a33..69b8e216ee1a 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -25,21 +25,35 @@
  * Device Information
  */
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a07g043u_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.du_output = RZG2L_DU_OUTPUT_INVALID,
+		},
+		[RZG2L_DU_OUTPUT_DPAD0] = {
+			.possible_outputs = BIT(0),
+			.du_output = RZG2L_DU_OUTPUT_DPAD0,
+		},
+	},
+};
+
 static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	.channels_mask = BIT(0),
 	.routes = {
 		[RZG2L_DU_OUTPUT_DSI0] = {
 			.possible_outputs = BIT(0),
-			.port = 0,
+			.du_output = RZG2L_DU_OUTPUT_DSI0,
 		},
 		[RZG2L_DU_OUTPUT_DPAD0] = {
 			.possible_outputs = BIT(0),
-			.port = 1,
+			.du_output = RZG2L_DU_OUTPUT_DPAD0,
 		}
 	}
 };
 
 static const struct of_device_id rzg2l_du_of_table[] = {
+	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
 	{ /* sentinel */ }
 };
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index 58806c2a8f2b..ab82b5c86d6e 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -29,7 +29,7 @@ enum rzg2l_du_output {
 /*
  * struct rzg2l_du_output_routing - Output routing specification
  * @possible_outputs: bitmask of possible outputs
- * @port: device tree port number corresponding to this output route
+ * @du_output: DU output
  *
  * The DU has 2 possible outputs (DPAD0, DSI0). Output routing data
  * specify the valid SoC outputs, which CRTC can drive the output, and the type
@@ -37,7 +37,7 @@ enum rzg2l_du_output {
  */
 struct rzg2l_du_output_routing {
 	unsigned int possible_outputs;
-	unsigned int port;
+	unsigned int du_output;
 };
 
 /*
@@ -53,6 +53,7 @@ struct rzg2l_du_device_info {
 #define RZG2L_DU_MAX_CRTCS		1
 #define RZG2L_DU_MAX_VSPS		1
 #define RZG2L_DU_MAX_DSI		1
+#define RZG2L_DU_OUTPUT_INVALID		-1
 
 struct rzg2l_du_device {
 	struct device *dev;
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index 07b312b6f81e..361350f2999e 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -183,8 +183,8 @@ static int rzg2l_du_encoders_init(struct rzg2l_du_device *rcdu)
 
 		/* Find the output route corresponding to the port number. */
 		for (i = 0; i < RZG2L_DU_OUTPUT_MAX; ++i) {
-			if (rcdu->info->routes[i].port == ep.port) {
-				output = i;
+			if (i == rcdu->info->routes[i].du_output) {
+				output = rcdu->info->routes[i].du_output;
 				break;
 			}
 		}
-- 
2.43.0


