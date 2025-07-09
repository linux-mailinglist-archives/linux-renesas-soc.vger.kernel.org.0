Return-Path: <linux-renesas-soc+bounces-19470-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA51AFF358
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 22:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBB293BBCB6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 20:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4167B23FC41;
	Wed,  9 Jul 2025 20:56:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7DA235046;
	Wed,  9 Jul 2025 20:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752094589; cv=none; b=BEm1Ccp86sDGsDDNTU2ekaOij6ptdpOHZJsBr/5n4vsJlS2YcH2YSMCWiGOl8YTkEEsRlZi9nfU7dvQVXwFBFyteSCPu8Z7LOIqzRar2n91X76zM+2plLc8rK2LTT1o0ce10L09oMp3wVNDBhkTvKXudPSzRsU7kxywL7aJnUs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752094589; c=relaxed/simple;
	bh=qFuj5gOjFkE6XZ1s9BkZdJPQR7Gvi/e3FNTZ72Y6Ss0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B4RLKTC5YydMBIbWxpEkzzL1y+ZRM9vuN4mLU18YFH1HvQGG64+WgNiZFWpP9pmZX1TgwEYclNpxgagBgDuq9xjbm9Hwm1jAAXJdNBUXOj45tJhQhTNffWz2+gnZXDrgtdED7rFjv56TSSowsDj1JM92B7h6cNY1xotqDGaiVoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 3eTOhX2BT7Wt1OabKVbXFw==
X-CSE-MsgGUID: SJo+7XyXSg2CAle8HVE0gw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Jul 2025 05:56:26 +0900
Received: from lenovo-p330.. (unknown [132.158.152.96])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id AFA314095591;
	Thu, 10 Jul 2025 05:56:22 +0900 (JST)
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
Subject: [PATCH 2/2] drm: renesas: rz-du: Set DSI divider based on target MIPI device
Date: Wed,  9 Jul 2025 16:55:32 -0400
Message-ID: <20250709205532.747596-3-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709205532.747596-1-chris.brandt@renesas.com>
References: <20250709205532.747596-1-chris.brandt@renesas.com>
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
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 4ad0be03a5b4..a8796df43f75 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -7,6 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/clk/renesas.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -666,6 +667,22 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	drm_bridge_add(&dsi->bridge);
 
+	/* Report required division ratio setting for the MIPI clock dividers
+	 * Assume the default clock source is FOUTPOSTDIV (PLL/2) being fed to the DSI-PHY, but also
+	 * the DSI-PHY must be 16x the MIPI-DSI HS clock.
+	 *
+	 * pllclk/2 = vclk * DSI divider
+	 * pllclk = vclk * DSI divider * 2
+	 *
+	 * hsclk = (vclk * DSI divider * 2) / 16
+	 *
+	 * vclk * bpp = hsclk * 8 * num_lanes
+	 * vclk * bpp = ((vclk * DSI divider * 2) / 16) * 8 * num_lanes
+	 *   which simplifies to...
+	 * DSI divider = bpp / num_lanes
+	 */
+	rzg2l_cpg_dsi_div_set_divider(mipi_dsi_pixel_format_to_bpp(dsi->format) / dsi->lanes);
+
 	return 0;
 }
 
-- 
2.49.0


