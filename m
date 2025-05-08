Return-Path: <linux-renesas-soc+bounces-16800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 577E6AAF740
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 11:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C86CE7AE997
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 09:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9D423DE;
	Thu,  8 May 2025 09:56:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E3C4B1E77
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 May 2025 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746698160; cv=none; b=ZThZcw0uRNqL6Gx3SclXrztJzVXMPm0/zP9SCcdKJdkF1InBOGtTMQQFmxNjTj4N2shFHKHqjQnx+xTzKXMGXX92YXHivvXEVaqqxKaSL5aJs831aJfa/7cq/dkMUyaGfLVoixQk48A91YTILgyi4GKPcCtOV/WL3kxZWBpT8X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746698160; c=relaxed/simple;
	bh=ravNo8Cd7oxu0MTk/ZjqLwU6R4wtrojn9CBbzgFy8YU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UuvPcBV0sObokSwrYkJRleZav/OrZgdre1eyjY3mXVjtMfp3Wm+zyOZnq4R8uPgt+BmvX8fSUVdLKnVMVXaGKVpuzBkTLcVCZf24ew7WwsCZ5vUNf8KkKRCD6a33q6B2nN1Sa9/qIuvITt6hbGuIOa0RkttEsS0aidqSX8vvzEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: sc8Ay0zRQNO49xFIWixVQw==
X-CSE-MsgGUID: PX9u/21PREeiPjRebf/kqw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 May 2025 18:50:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.89])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5264442354C8;
	Thu,  8 May 2025 18:50:45 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: hienhuynh <hien.huynh.px@renesas.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm: rz-du: Support panels connected directly to the DPAD output
Date: Thu,  8 May 2025 10:50:35 +0100
Message-ID: <20250508095042.25164-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: hienhuynh <hien.huynh.px@renesas.com>

This patch is based on the commit 73eb5476df72 ("drm: rcar-du: Support
panels connected directly to the DPAD outputs").

The RZ DU driver assumes that a bridge is always connected to the DU
output. This is valid for the HDMI output, but the DPAD output can be
connected directly to a panel, in which case no bridge is available.

To support this use case, detect whether the entities connected to the DU
DPAD output is encoders or panels based on the number of ports of their DT
node, and retrieve the corresponding type of DRM objects. For panels,
additionally create panel bridge instances.

Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 44 +++++++++++++++++--
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index 564ab4cb3d37..5e6dd16705e6 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -22,6 +22,26 @@
  * Encoder
  */
 
+static unsigned int rzg2l_du_encoder_count_ports(struct device_node *node)
+{
+	struct device_node *ports;
+	struct device_node *port;
+	unsigned int num_ports = 0;
+
+	ports = of_get_child_by_name(node, "ports");
+	if (!ports)
+		ports = of_node_get(node);
+
+	for_each_child_of_node(ports, port) {
+		if (of_node_name_eq(port, "port"))
+			num_ports++;
+	}
+
+	of_node_put(ports);
+
+	return num_ports;
+}
+
 static const struct drm_encoder_funcs rzg2l_du_encoder_funcs = {
 };
 
@@ -50,10 +70,26 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 	struct drm_bridge *bridge;
 	int ret;
 
-	/* Locate the DRM bridge from the DT node. */
-	bridge = of_drm_find_bridge(enc_node);
-	if (!bridge)
-		return -EPROBE_DEFER;
+	/*
+	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
+	 * DT node has a single port, assume that it describes a panel and
+	 * create a panel bridge.
+	 */
+	if (output == RZG2L_DU_OUTPUT_DPAD0 && rzg2l_du_encoder_count_ports(enc_node) == 1) {
+		struct drm_panel *panel = of_drm_find_panel(enc_node);
+
+		if (IS_ERR(panel))
+			return PTR_ERR(panel);
+
+		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
+							 DRM_MODE_CONNECTOR_DPI);
+		if (IS_ERR(bridge))
+			return PTR_ERR(bridge);
+	} else {
+		bridge = of_drm_find_bridge(enc_node);
+		if (!bridge)
+			return -EPROBE_DEFER;
+	}
 
 	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %s\n",
 		enc_node, rzg2l_du_output_name(output));
-- 
2.43.0


