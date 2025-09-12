Return-Path: <linux-renesas-soc+bounces-21833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DA6B55147
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 16:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C4105C0413
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 14:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B1330E831;
	Fri, 12 Sep 2025 14:22:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F0D25C821;
	Fri, 12 Sep 2025 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686931; cv=none; b=rjgG7Z+l8+8I0YC21/oDe8O4eu/z7/T4JeN5+V6RU41j2XmJbEqTH19qcibgULCJiNy+9VY1vppLcGlF8AGl94pf7Z5UySJjbCiG+h3+0DBavEW0wTRhd7g2qVE7oddm6msW6CH4pnFETcii4eY2zRKHvMXGJncuCBRdJnOXiso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686931; c=relaxed/simple;
	bh=jz+ysYMbQla243UbMBjPYvgPHnPp7hmu4bszHrabbBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eYZ8svqMyerblAcOmXPaSqds/SBrPsYVdSyTz1i2rfMhhEixT2AUZ3EE4Q+vkLVtwU6DFJRIJ15FlLX4bxnGlISaiPSk7CggM0WAolSxpLXy4fh7Rd+YMRyvFMgdaNyK+Ujob8Dp/ztSDE+0Kf2m/qxj/tdmoRilyK6XWmPtwDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: WZBfVh83Saeq4lIu0ejOnQ==
X-CSE-MsgGUID: ozZ2EeQITfCOWBDMaJwb3w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 12 Sep 2025 23:22:09 +0900
Received: from lenovo-p330 (unknown [132.158.152.96])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id BD33D4005E3D;
	Fri, 12 Sep 2025 23:22:05 +0900 (JST)
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
Subject: [PATCH v2 2/2] drm: renesas: rz-du: Set DSI divider based on target MIPI device
Date: Fri, 12 Sep 2025 10:20:56 -0400
Message-ID: <20250912142056.2123725-3-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250912142056.2123725-1-chris.brandt@renesas.com>
References: <20250912142056.2123725-1-chris.brandt@renesas.com>
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
v1->v2:
- Add spaces around '/' in comments
- Add target argument in new API
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index f87337c3cbb5..ca0de93d5a1a 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -7,6 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/clk/renesas.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -732,6 +733,23 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	drm_bridge_add(&dsi->bridge);
 
+	/*
+	 * Report required division ratio setting for the MIPI clock dividers
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
+	rzg2l_cpg_dsi_div_set_divider(mipi_dsi_pixel_format_to_bpp(dsi->format) / dsi->lanes, 1);
+
 	return 0;
 }
 
-- 
2.50.1


