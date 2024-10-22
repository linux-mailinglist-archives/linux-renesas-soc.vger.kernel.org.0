Return-Path: <linux-renesas-soc+bounces-9964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D6B9A9C5A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 10:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A6C81F232BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 08:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DB715B102;
	Tue, 22 Oct 2024 08:25:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11930158D7B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Oct 2024 08:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729585505; cv=none; b=mtjDq4p3ihpubTs+qJK+D6RRQcBCX1dlACBH441OpuZXH0DLCd2ZuEp3UJjBT6YiZ2EeZ/1Bkcjs81bzNya4o2xX8w9Sg6e3QpoeeWdY7xx/b2dJToxjArHWcQx8TdczH9m/xQoE1bRRsLOBZeqpBYNFVivaA+m6UK5oG+7ysUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729585505; c=relaxed/simple;
	bh=xGGGp2fjHwvpxTkrKABbwwZE5P4G5L4imiE79pLHht8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q1EJ6YfuMVF3+Hu7YCqj+Zs/YLQscSHWtK2gZSRh3AW05lj4YXFITyaJdrE/Gykew7ewEnljJrKwSyCzieE+b2BDG5D8pIUqJ6e8vvXyc2gtnI3mnlOGp6k2fWXNIGOOQclqGLxwmPXvvshY0SyVBo29mo4D5sDKOOEPfBw6fxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,222,1725289200"; 
   d="scan'208";a="226623645"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Oct 2024 17:24:56 +0900
Received: from localhost.localdomain (unknown [10.226.92.236])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B6AA74003FAB;
	Tue, 22 Oct 2024 17:24:40 +0900 (JST)
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
Subject: [PATCH v2 1/2] drm: renesas: rz-du: Drop DU_MCR0_DPI_OE macro
Date: Tue, 22 Oct 2024 09:24:23 +0100
Message-ID: <20241022082433.32513-2-biju.das.jz@bp.renesas.com>
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

The DPI_OE bit is removed from the latest RZ/G2UL and RZ/G2L hardware
manual. So, drop this macro.

Fixes: b330f1480172 ("drm: renesas: rz-du: Add RZ/G2UL DU Support")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Added Fixes tag.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index c4c1474d487e..6e7aac6219be 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -28,7 +28,6 @@
 #include "rzg2l_du_vsp.h"
 
 #define DU_MCR0			0x00
-#define DU_MCR0_DPI_OE		BIT(0)
 #define DU_MCR0_DI_EN		BIT(8)
 
 #define DU_DITR0		0x10
@@ -217,14 +216,9 @@ static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *rcrtc)
 
 static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool start)
 {
-	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(rcrtc->crtc.state);
 	struct rzg2l_du_device *rcdu = rcrtc->dev;
-	u32 val = DU_MCR0_DI_EN;
 
-	if (rstate->outputs & BIT(RZG2L_DU_OUTPUT_DPAD0))
-		val |= DU_MCR0_DPI_OE;
-
-	writel(start ? val : 0, rcdu->mmio + DU_MCR0);
+	writel(start ? DU_MCR0_DI_EN : 0, rcdu->mmio + DU_MCR0);
 }
 
 static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)
-- 
2.43.0


