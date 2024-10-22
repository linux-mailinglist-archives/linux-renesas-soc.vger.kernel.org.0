Return-Path: <linux-renesas-soc+bounces-9965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D46969A9C5B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 10:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C0A81F2355E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 08:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A747158D7B;
	Tue, 22 Oct 2024 08:25:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DCD1714BA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Oct 2024 08:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729585507; cv=none; b=DZswMcqJ/LeX/02ULfiuif4N+b5AIV6caekV1GzCAem6sRriH4BeZ2PxXW6h5n6txFX8aKMJE6fg+U5zI/pozzBKe/G364D8hq8osOcfUpo7ODn0DDpqdUJULgwpdAdSaZGcJ+ldwQ+eZ08muxUYNAXd2MA+K6a2SMib2J4Vp1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729585507; c=relaxed/simple;
	bh=V1++dtSoJmL+8x4dywEDnzZKPGeqBOuWIvuux/U42YE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CeHG1kjvEO+bisgzTPJHd8o8d+tr9T0JlrbrwybWXpZQQY4btXjNODkpb1Io/EIe+GISgqsNkrUoJtPPgfAwaKr19/k2y5MppnaxfQCqLWSeKvWyZdn8W3N/skpJb6+kyi9b3vpCKWEBmGRBger9FqwFovyWEZwl63B0R6zGJc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,222,1725289200"; 
   d="scan'208";a="222639851"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Oct 2024 17:25:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.236])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id EB336400754D;
	Tue, 22 Oct 2024 17:24:44 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 2/2] drm: renesas: rz-du: rzg2l_du_encoder: Fix max dot clock for DPI
Date: Tue, 22 Oct 2024 09:24:24 +0100
Message-ID: <20241022082433.32513-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022082433.32513-1-biju.das.jz@bp.renesas.com>
References: <20241022082433.32513-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the RZ/G2UL hardware manual Table 33.4 Clock List, the maximum
dot clock for the DPI interface is 83.5 MHz. Add mode_valid callback
to reject modes greater than 83.5 MHz.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v2:
 * Moved .mode_valid from crtc to encoder as the new state is not
   available in crtc and instead, we could check renc->output for
   .mode_valid() function of drm_encoder.
 * Dropped rzg2l_du_crtc_atomic_check().
---
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index 339cbaaea0b5..564ab4cb3d37 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -10,6 +10,7 @@
 #include <linux/export.h>
 #include <linux/of.h>
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_panel.h>
@@ -24,6 +25,22 @@
 static const struct drm_encoder_funcs rzg2l_du_encoder_funcs = {
 };
 
+static enum drm_mode_status
+rzg2l_du_encoder_mode_valid(struct drm_encoder *encoder,
+			    const struct drm_display_mode *mode)
+{
+	struct rzg2l_du_encoder *renc = to_rzg2l_encoder(encoder);
+
+	if (renc->output == RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83500)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static const struct drm_encoder_helper_funcs rzg2l_du_encoder_helper_funcs = {
+	.mode_valid = rzg2l_du_encoder_mode_valid,
+};
+
 int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 			  enum rzg2l_du_output output,
 			  struct device_node *enc_node)
@@ -48,6 +65,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 		return PTR_ERR(renc);
 
 	renc->output = output;
+	drm_encoder_helper_add(&renc->base, &rzg2l_du_encoder_helper_funcs);
 
 	/* Attach the bridge to the encoder. */
 	ret = drm_bridge_attach(&renc->base, bridge, NULL,
-- 
2.43.0


