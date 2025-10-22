Return-Path: <linux-renesas-soc+bounces-23449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9FBBFEA1D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 02:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FF431A05C14
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 00:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC612D5A0C;
	Wed, 22 Oct 2025 23:59:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3EB2F1FEC;
	Wed, 22 Oct 2025 23:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761177599; cv=none; b=Wrpve7cg/kpXMQQ3u6UQMUpx8dihlj5GSIJRppQFNcUoiIJWDdehlu3Ykip9/Z02PcGRS8brkyYje7yth1r3vxQ0WYjTlrwC61gL0do9J57M/NMTSQuT+5B5mKgMAfjU7yhXTU92h9XOzhLHAWjK7lqohmUOQy8GmodjgQFGHQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761177599; c=relaxed/simple;
	bh=gnJIvBFi7ZJJwNI/2XNu0t39DNmcGZE20tAkocMgY1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GrqshQ26mGm6nIic5Tf37dAdIzIAEqmbTxIWhPNOn1rpF3YP2G7Jr1Et0IkWjGeJ1gtlepyc4FPeqoHrCwjMqLGGVHUT7CDy/c6p4/oXvstHUnHdroUJI//xzbaEABknW98vNd0InoV1WNm6eFQ++4/JUQoalOoSaQh3qmf+NM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: aqTRmPl1R0WZnHEVicak4w==
X-CSE-MsgGUID: Y5BA4fmkSy2BKEfZ7Ud2rA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Oct 2025 08:59:56 +0900
Received: from lenovo-p330 (unknown [132.158.152.96])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id BBA3E4017D81;
	Thu, 23 Oct 2025 08:59:52 +0900 (JST)
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hien Huynh <hien.huynh.px@renesas.com>,
	Nghia Vo <nghia.vo.zn@renesas.com>,
	Hugo Villeneuve <hugo@hugovil.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 2/2] drm: renesas: rz-du: Set DSI divider based on target MIPI device
Date: Wed, 22 Oct 2025 19:59:03 -0400
Message-ID: <20251022235903.1091453-3-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251022235903.1091453-1-chris.brandt@renesas.com>
References: <20251022235903.1091453-1-chris.brandt@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before the MIPI DSI clock source can be configured, the target divide
ratio needs to be known.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

---
v1->v2:
- Add spaces around '/' in comments
- Add target argument in new API

v2->v3:
- Add missing period in comment (Hugo)
- Changed '1' to 'PLL5_TARGET_DSI' (Hugo)
- Added Reviewed-by and Tested-by (Biju)
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 3b52dfc0ea1e..c9c5510bdd3e 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -7,6 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/clk/renesas.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -732,6 +733,24 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	drm_bridge_add(&dsi->bridge);
 
+	/*
+	 * Report required division ratio setting for the MIPI clock dividers.
+	 * Assume the default clock source is FOUTPOSTDIV (PLL/2) being fed to the DSI-PHY, but also
+	 * the DSI-PHY must be 16x the MIPI-DSI HS clock.
+	 *
+	 * pllclk / 2 = vclk * DSI divider
+	 * pllclk = vclk * DSI divider * 2
+	 *
+	 * hsclk = (vclk * DSI divider * 2) / 16
+	 *
+	 * vclk * bpp = hsclk * 8 * num_lanes
+	 * vclk * bpp = ((vclk * DSI divider * 2) / 16) * 8 * num_lanes
+	 *   which simplifies to...
+	 * DSI divider = bpp / num_lanes
+	 */
+	rzg2l_cpg_dsi_div_set_divider(mipi_dsi_pixel_format_to_bpp(dsi->format) / dsi->lanes,
+				      PLL5_TARGET_DSI);
+
 	return 0;
 }
 
-- 
2.50.1


