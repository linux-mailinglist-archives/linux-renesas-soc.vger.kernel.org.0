Return-Path: <linux-renesas-soc+bounces-24186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9781EC3830E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 23:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 381903B80A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 22:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90542F12DF;
	Wed,  5 Nov 2025 22:26:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1452EFDA2;
	Wed,  5 Nov 2025 22:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762381586; cv=none; b=E3DJrZyPqbisgsZZiTtf1YNUGB2ipIcfxAU6Qqfy5GM2zem1vF9+3+R8BnVjIgmxL1ZNZTZw8yBqtYU8GoezrVxJ7c6axGIjQI1zHk9zj71J/eNoD9K0DxJBqUYpK/Nwqq+LadJXzfwebKl6KzkczIlLkg+AjFcQepuVDiUnyvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762381586; c=relaxed/simple;
	bh=THKaYth4Del1mmM4MA9NpxkOS0MB7Qtol/0/sTSVKHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TNguNuIB6CMM6cPXc46O4NaRZd6uDfwN5AvrM7b48Ul5dlFEFRScsbtFGxBwKJSav6OjA0XysxS2jX/0hPKaGcaY4DTys7Eh94wdYg/emFfi4R3kXFUzwkdR8e8M/0ikdErQf7oyw2hZvJVgqZVlB4/uwWkFmjZfHyyZrZLhzjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: YotHcVSZTOSLNRnztNE8eg==
X-CSE-MsgGUID: 5UwqfQe+RzaHm33tQpAaHQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Nov 2025 07:26:23 +0900
Received: from lenovo-p330 (unknown [132.158.152.96])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 29E94409FB89;
	Thu,  6 Nov 2025 07:26:13 +0900 (JST)
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
Subject: [PATCH v4 2/2] drm: renesas: rz-du: Set DSI divider based on target MIPI device
Date: Wed,  5 Nov 2025 17:25:30 -0500
Message-ID: <20251105222530.979537-3-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251105222530.979537-1-chris.brandt@renesas.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
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
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 3b52dfc0ea1e..301550f0ea9f 100644
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
+	rzg2l_cpg_dsi_div_set_divider(mipi_dsi_pixel_format_to_bpp(dsi->format) * 2 / dsi->lanes,
+				      PLL5_TARGET_DSI);
+
 	return 0;
 }
 
-- 
2.50.1


