Return-Path: <linux-renesas-soc+bounces-8075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D744295BBEE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 18:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31239B26835
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 16:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671B01CCEEE;
	Thu, 22 Aug 2024 16:28:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6612A1CC155
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 16:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724344122; cv=none; b=iAlG32qcbmWbRtF068PPlUqgwqEzZyFAyAEFDq8LVh0xvoXaLmiBOEJ3IhDF3DpNoSOj8k5urtHpi09VbxnwM27jvwpXVeQH5Ys7jKwRsbMVuCLXNi3BSMu71fhESOkSvNBxJRIX3+eKqwevqVoiexKzZbYgSfkPXI0vNlTselY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724344122; c=relaxed/simple;
	bh=kiz2aE4jAEzZI70CXGeMSOfESDIXJ93r158KlxKciks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/sxe9sOHsyOgn7xR9tN/gxO8A4329t6AgZpFeMoUPsQmO/EkxVLKerzDI0oQNcqIyIYhq1JP5rMobLgBTwp3uKcEOt9j5GuK/WscIez1As33iUn4YX3yWQ63mEsu48jprHuXiDT5dfZTQrQBik7LVIjSk846v++dpRqecnS+nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,167,1719846000"; 
   d="scan'208";a="216311618"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Aug 2024 01:23:38 +0900
Received: from localhost.localdomain (unknown [10.226.92.15])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2930D4007CF2;
	Fri, 23 Aug 2024 01:23:33 +0900 (JST)
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
Subject: [PATCH v4 2/4] drm: renesas: rz-du: Add RZ/G2UL DU Support
Date: Thu, 22 Aug 2024 17:23:15 +0100
Message-ID: <20240822162320.5084-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
References: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
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
v3->v4:
 * Used "&" instead of "==" in rzg2l_du_start_stop() for scalability.
 * Restored port variable in struct rzg2l_du_output_routing
 * Updated rzg2l_du_encoders_init() to handle port based on hardware indices.
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
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 11 +++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |  3 ++-
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 6e7aac6219be..c4c1474d487e 100644
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
+	if (rstate->outputs & BIT(RZG2L_DU_OUTPUT_DPAD0))
+		val |= DU_MCR0_DPI_OE;
+
+	writel(start ? val : 0, rcdu->mmio + DU_MCR0);
 }
 
 static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index e5eca8691a33..bc7c381f92ac 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -25,6 +25,16 @@
  * Device Information
  */
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a07g043u_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DPAD0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+	},
+};
+
 static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	.channels_mask = BIT(0),
 	.routes = {
@@ -40,6 +50,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 };
 
 static const struct of_device_id rzg2l_du_of_table[] = {
+	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
 	{ /* sentinel */ }
 };
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index 07b312b6f81e..b99217b4e05d 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -183,7 +183,8 @@ static int rzg2l_du_encoders_init(struct rzg2l_du_device *rcdu)
 
 		/* Find the output route corresponding to the port number. */
 		for (i = 0; i < RZG2L_DU_OUTPUT_MAX; ++i) {
-			if (rcdu->info->routes[i].port == ep.port) {
+			if (rcdu->info->routes[i].possible_outputs &&
+			    rcdu->info->routes[i].port == ep.port) {
 				output = i;
 				break;
 			}
-- 
2.43.0


