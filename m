Return-Path: <linux-renesas-soc+bounces-24759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B124AC6C66E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 03:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8F1C43671F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 02:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33CDF286D4B;
	Wed, 19 Nov 2025 02:33:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65228286426;
	Wed, 19 Nov 2025 02:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763519623; cv=none; b=Z0mYsGpgyI1tVRKP30/+UwRoNQRjJPsHNd0i8RGWcaIBVho8MLPS38C8mKqyq+mmSPTOnsHHiqADlI8E5zY3stDMLsYGMS266ixRi79c1QrEGMltJUrTKjqHb0KNXmANoU/Si2yg0Wl4QhvF5NpYMMMFohMvrRDMaPQjvlIcCLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763519623; c=relaxed/simple;
	bh=VB8ORur26AfHKzid7pwzHVWYodcQsjcARxK3eUX3LXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jmncKTyOUyekHuoWVrLb09adq8PGBkTsZCxgPDciuQEvx3ezvmy3NgT4sZXztljrKjZKZGE6FbkVu8/2DXyFDL3LTTlt9wJIGetDJdv1R2znANv0JtdWiYsepBdPeUXsjIOuVyUUQi4Tz9FwVXsSfOEdDBmyI4LngzUlOAXFdbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: JbJhE5jERtGgN44cUygdoA==
X-CSE-MsgGUID: xZysjspTTrqpkHxZTLWEQw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 19 Nov 2025 11:28:32 +0900
Received: from lenovo-p330 (unknown [132.158.152.96])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E134640CCF88;
	Wed, 19 Nov 2025 11:28:28 +0900 (JST)
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
Subject: [PATCH v5 2/2] drm: renesas: rz-du: mipi_dsi: Set DSI divider
Date: Tue, 18 Nov 2025 21:27:44 -0500
Message-ID: <20251119022744.1599235-3-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251119022744.1599235-1-chris.brandt@renesas.com>
References: <20251119022744.1599235-1-chris.brandt@renesas.com>
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

v3->v4:
- Fixed up the comments
- Fixed the match for the divider to set (was missing a * 2)

v4->v5:
- Rename patch title (Hugo)
- Add bpp varable for easy reuse (Hugo)
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 3b52dfc0ea1e..7f03ea8052e2 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -7,6 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/clk/renesas.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -692,6 +693,7 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 				      struct mipi_dsi_device *device)
 {
 	struct rzg2l_mipi_dsi *dsi = host_to_rzg2l_mipi_dsi(host);
+	int bpp;
 	int ret;
 
 	if (device->lanes > dsi->num_data_lanes) {
@@ -701,7 +703,8 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 		return -EINVAL;
 	}
 
-	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
+	bpp = mipi_dsi_pixel_format_to_bpp(device->format);
+	switch (bpp) {
 	case 24:
 		break;
 	case 18:
@@ -732,6 +735,22 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	drm_bridge_add(&dsi->bridge);
 
+	/*
+	 * Report the required division ratio setting for the MIPI clock dividers.
+	 *
+	 * VCO-->[POSTDIV1,2]--FOUTPOSTDIV-->|   |-->[1/(DSI DIV A * B)]--> MIPI_DSI_VCLK
+	 *            |                      |-->|
+	 *            |-->[1/2]---FOUT1PH0-->|   |-->[1/16]---------------> hsclk (MIPI-PHY)
+	 *
+	 * vclk * bpp = hsclk * 8 * num_lanes
+	 *
+	 * vclk * DSI_AB_divider = hsclk * 16
+	 *
+	 *   which simplifies to...
+	 * DSI_AB_divider = bpp * 2 / num_lanes
+	 */
+	rzg2l_cpg_dsi_div_set_divider(bpp * 2 / dsi->lanes, PLL5_TARGET_DSI);
+
 	return 0;
 }
 
-- 
2.50.1


