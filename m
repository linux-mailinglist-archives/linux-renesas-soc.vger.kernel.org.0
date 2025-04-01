Return-Path: <linux-renesas-soc+bounces-15257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA0EA77DE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 16:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9DFE1890834
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 14:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0002C204C0F;
	Tue,  1 Apr 2025 14:36:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CD4156677
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Apr 2025 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518161; cv=none; b=iT4K52BBu/1fah2Y8AGXGAz+OQTF9yYJn6XE1oej1M4y5jVgAH7FJwx9uQyUlEZt0Zvi8IZ5mydooaERhMtD0BIOseziuDLjb5OUcxCMDg6uS3IkOnWYKWAFP5P+V9iGU6JxWN32QNpS3uFZ+sawYAnowXvvlINQ5nfjVk9IANw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518161; c=relaxed/simple;
	bh=PZrDKokUw7ub7tJkD5Gc+liU04h1dvmaQSOcbmGtch0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E5LsaJY9uUF+45zrtARB3sfLWt9MRyX6P9IoF2dodLKBIhw0FTzwg/Xub93hBLnyEgSy+EUghZnqYWFZyx4tg4Ts5u4McAyvIipo3yR7IRp0FYIxTmMiwtnvQXqs2y9c3Cc7BFqcZUe8iAtksoKExE5X2Xbmnrrq7JBl2cv63cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 8HmITONKSQWwwxV4Psmj8Q==
X-CSE-MsgGUID: q45o1anhTOeLTuqw084kjQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Apr 2025 23:35:59 +0900
Received: from localhost.localdomain (unknown [10.226.92.156])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 29823432BC98;
	Tue,  1 Apr 2025 23:35:56 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 5/9] memory: renesas-rpc-if: Move rpcif_info definitions near to the user
Date: Tue,  1 Apr 2025 15:35:23 +0100
Message-ID: <20250401143537.224047-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401143537.224047-1-biju.das.jz@bp.renesas.com>
References: <20250401143537.224047-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move rpcif_info definitions near to the user.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Collected tag.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/memory/renesas-rpc-if.c | 40 ++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index ce03fbd82c7a..9f3ac5cb9ff4 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -59,26 +59,6 @@ struct rpcif_priv {
 	u32 ddr;		/* DRDRENR or SMDRENR */
 };
 
-static const struct rpcif_info rpcif_info_r8a7796 = {
-	.type = RPCIF_RCAR_GEN3,
-	.strtim = 6,
-};
-
-static const struct rpcif_info rpcif_info_gen3 = {
-	.type = RPCIF_RCAR_GEN3,
-	.strtim = 7,
-};
-
-static const struct rpcif_info rpcif_info_rz_g2l = {
-	.type = RPCIF_RZ_G2L,
-	.strtim = 7,
-};
-
-static const struct rpcif_info rpcif_info_gen4 = {
-	.type = RPCIF_RCAR_GEN4,
-	.strtim = 15,
-};
-
 /*
  * Custom accessor functions to ensure SM[RW]DR[01] are always accessed with
  * proper width.  Requires rpcif_priv.xfer_size to be correctly set before!
@@ -652,6 +632,26 @@ static void rpcif_remove(struct platform_device *pdev)
 	platform_device_unregister(rpc->vdev);
 }
 
+static const struct rpcif_info rpcif_info_r8a7796 = {
+	.type = RPCIF_RCAR_GEN3,
+	.strtim = 6,
+};
+
+static const struct rpcif_info rpcif_info_gen3 = {
+	.type = RPCIF_RCAR_GEN3,
+	.strtim = 7,
+};
+
+static const struct rpcif_info rpcif_info_rz_g2l = {
+	.type = RPCIF_RZ_G2L,
+	.strtim = 7,
+};
+
+static const struct rpcif_info rpcif_info_gen4 = {
+	.type = RPCIF_RCAR_GEN4,
+	.strtim = 15,
+};
+
 static const struct of_device_id rpcif_of_match[] = {
 	{ .compatible = "renesas,r8a7796-rpc-if", .data = &rpcif_info_r8a7796 },
 	{ .compatible = "renesas,rcar-gen3-rpc-if", .data = &rpcif_info_gen3 },
-- 
2.43.0


