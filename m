Return-Path: <linux-renesas-soc+bounces-9260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C412598BA89
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2024 13:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78BEE284836
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2024 11:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E7719DFB3;
	Tue,  1 Oct 2024 11:01:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF1E19D891
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Oct 2024 11:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727780512; cv=none; b=DcgyAdey7WDtrdycn6+tvidYlgemNfxgSVb7oCGVEXvWbHPAqebTeoWzjJEdD45r1hUWqthcLJriulPin3u6RxtA7D0ZBIgW4HOA2Q8mPUdRBOz3wKawqeDubo5Z6IymkK1WhrfyQF4TqcHlQSpnsP3Ak0zOsISEu+hYJ94j328=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727780512; c=relaxed/simple;
	bh=4YUrhN+jF3CGNsG2YQVI4mCtr5XAydxKkpMSkPuwO6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R/59IAGLB3eHfm2vl5Xg//6rJcpxy3A30ORpERP/QWGBzDr8W/fjhoLUGX1R3Rv2Sd4+pQeRr6FymMBQWCu0iAbJf5ctyGRVLWkjHf4//Wsfm1KFzZCeBcRM0StcCWSRralzKQ3cA/CvXYB7iXdHyGRoy3uFlISLgV82PS9ERBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,167,1725289200"; 
   d="scan'208";a="220471220"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Oct 2024 20:01:48 +0900
Received: from localhost.localdomain (unknown [10.226.93.56])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id CA9C241E0D1D;
	Tue,  1 Oct 2024 20:01:44 +0900 (JST)
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
Date: Tue,  1 Oct 2024 12:01:34 +0100
Message-ID: <20241001110141.94504-1-biju.das.jz@bp.renesas.com>
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


