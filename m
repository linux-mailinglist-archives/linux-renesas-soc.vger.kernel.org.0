Return-Path: <linux-renesas-soc+bounces-9258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC3898B9AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2024 12:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6B18B20EA7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2024 10:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F328019DF77;
	Tue,  1 Oct 2024 10:28:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B92D3209
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Oct 2024 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727778510; cv=none; b=GySrVgjQZ+SdqgLUlmTe6rMVfcrABCsgjy8BH42FijmIxgLKmP+Sfx5PKiWGKiXVRzlSoC53iSz8slCozwbkNtTv/f7YiURsJ0tKvSS6PdWoScYDYM9U3x2iR4YHQ1EZt1dzKjk7n6Ob93E1dBUMDOfmBFTkvqdvkBM5X1NLVc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727778510; c=relaxed/simple;
	bh=4YUrhN+jF3CGNsG2YQVI4mCtr5XAydxKkpMSkPuwO6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bSNO9K2hQhPgGIdC0NmVWYk+O32b5h5NzvLnQVIcs7RXiXhIK6/1HWhhiRMiDbsf0M0EZ8wxn3lz+UEJXiC0RHSzwCiOMqPXqyZHFFMcnFqbFiNNOm1/P0P5I4uMyydsnswEJ/nOJw1yVEjklGIhneTL/S0oU6tku+3qmPMPsyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,167,1725289200"; 
   d="scan'208";a="224444664"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Oct 2024 19:28:27 +0900
Received: from localhost.localdomain (unknown [10.226.93.56])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E6AC741D5AFB;
	Tue,  1 Oct 2024 19:28:16 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm: renesas: rz-du: Drop DU_MCR0_DPI_OE macro
Date: Tue,  1 Oct 2024 11:28:12 +0100
Message-ID: <20241001102814.94279-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DPI_OE bit is removed from the latest RZ/G2UL and RZ/G2L hardware
manual. So, drop this macro.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


