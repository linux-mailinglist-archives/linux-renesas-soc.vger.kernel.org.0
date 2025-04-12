Return-Path: <linux-renesas-soc+bounces-15882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A67BFA86B3C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Apr 2025 08:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D107E19E358F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Apr 2025 06:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2BF17BB6;
	Sat, 12 Apr 2025 06:13:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E8E2367CE
	for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Apr 2025 06:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744438396; cv=none; b=bWiu0wuYNOwRv+/9V8iEz09fwZiRSveiUALXdD3WNgXu8vwhx9SNaPBNu/laooXlxVxyxc9odux4wE9v+4qHBiZsqYVslRbLJR3a8NXTwtI7cxjoZONaXokSr84ir0AKKsl1zWxOtw8Q3R1pmiieUiT+w6p7oCox/r9zocHgi+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744438396; c=relaxed/simple;
	bh=SwliHp3GHGTEzTMefRyriB69Ya71mVnNAmt8N/n5ehI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WL8YJT4wCaTGXK0Gmqki1JfDHDzd/CWVhVuffJN/UL0n97YMh714xsz0qrkSQpIVSXj2Wq9Q7na2xv45i2mVZEMp5yu8Jo3Ubzy20duApaSKayVHMfifEM+tt44AbI1g2GMLXC0PWKlpggJqX/SmbZ754qYRpTxsCOMXn6MK77c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: rnFd/sagQHef5cMiJ4U7hA==
X-CSE-MsgGUID: fvYR9hHRTs+i1kZVd/Wr5Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 12 Apr 2025 15:13:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.23])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id EC20A4001DA9;
	Sat, 12 Apr 2025 15:13:02 +0900 (JST)
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
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Pavel Machek <pavel@denx.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2] drm: renesas: rz-du: rzg2l_mipi_dsi: Update the comment in rzg2l_mipi_dsi_start_video()
Date: Sat, 12 Apr 2025 07:12:54 +0100
Message-ID: <20250412061258.5447-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing space in the comment in rzg2l_mipi_dsi_start_video().

Reported-by: Pavel Machek <pavel@denx.de>
Closes: https://lore.kernel.org/all/ZPg7STHDn4LbLy7f@duo.ucw.cz/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This issue is noticed while backporting this driver to 6.1.y-cip [1].

[1] https://lore.kernel.org/all/20230905160737.167877-1-biju.das.jz@bp.renesas.com/

v1->v2:
 * Updated commit header path rcar-du->rz-du.
 * Collected tags
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 96c014449547..dc6ab012cdb6 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -479,7 +479,7 @@ static int rzg2l_mipi_dsi_start_video(struct rzg2l_mipi_dsi *dsi)
 	u32 status;
 	int ret;
 
-	/* Configuration for Blanking sequence and start video input*/
+	/* Configuration for Blanking sequence and start video input */
 	vich1set0r = VICH1SET0R_HFPNOLP | VICH1SET0R_HBPNOLP |
 		     VICH1SET0R_HSANOLP | VICH1SET0R_VSTART;
 	rzg2l_mipi_dsi_link_write(dsi, VICH1SET0R, vich1set0r);
-- 
2.43.0


