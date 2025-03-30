Return-Path: <linux-renesas-soc+bounces-15058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C2AA7598E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Mar 2025 12:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1E693ABBAA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Mar 2025 10:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51521B0F1E;
	Sun, 30 Mar 2025 10:24:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D6E19D074
	for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Mar 2025 10:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743330251; cv=none; b=nx5V63s48S5cHI7lJfS9OFiVfwi9D/DklHAPMj6jIEXuAT24n2EdC5UFMiGmBwBQI1cvw/ERMJ6coAWGutGqJ+gCMgO4En6etQDsivwaGLx/UvGB/DjTEAuYUhskhnGIHvLVKim+/XkAcaO73+BBL3kMi5OID1fTDOASI4IGXmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743330251; c=relaxed/simple;
	bh=n1YzpsCYepBVostIyxWCizOlxF/kj07ELu6/S5ZEtP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EH14iBCq5lCWbruivoJywSVKnj01wJcUlKdukbWHiuT+zBL0wxVQSGhv83V7URpsdCofljKAhtCSDpxHwyclUYHHkTJy4syS/iAR2I75YDQ0tFAeF57iR0ZqqkaBjyAd2Kb0TSfseppIV+eICBs21vQQaDubOP1rmWybQPBn/ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: X5IqqMAFSNi3CvRRKevGwQ==
X-CSE-MsgGUID: NGroiOWSQzun0ZRcDcTxjg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 30 Mar 2025 19:24:07 +0900
Received: from localhost.localdomain (unknown [10.226.92.49])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 23FC040078A5;
	Sun, 30 Mar 2025 19:24:03 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 1/2] drm: renesas: rz-du: Drop bpp variable from struct rzg2l_du_format_info
Date: Sun, 30 Mar 2025 11:23:52 +0100
Message-ID: <20250330102357.56010-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250330102357.56010-1-biju.das.jz@bp.renesas.com>
References: <20250330102357.56010-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the unused variable bpp from struct rzg2l_du_format_info.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 3 ---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index 90c6269ccd29..1a428ab3c424 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -38,19 +38,16 @@ static const struct rzg2l_du_format_info rzg2l_du_format_infos[] = {
 	{
 		.fourcc = DRM_FORMAT_XRGB8888,
 		.v4l2 = V4L2_PIX_FMT_XBGR32,
-		.bpp = 32,
 		.planes = 1,
 		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_ARGB8888,
 		.v4l2 = V4L2_PIX_FMT_ABGR32,
-		.bpp = 32,
 		.planes = 1,
 		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_RGB888,
 		.v4l2 = V4L2_PIX_FMT_BGR24,
-		.bpp = 24,
 		.planes = 1,
 		.hsub = 1,
 	}
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
index 876e97cfbf45..e2c599f115c6 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
@@ -23,7 +23,6 @@ struct sg_table;
 struct rzg2l_du_format_info {
 	u32 fourcc;
 	u32 v4l2;
-	unsigned int bpp;
 	unsigned int planes;
 	unsigned int hsub;
 };
-- 
2.43.0


