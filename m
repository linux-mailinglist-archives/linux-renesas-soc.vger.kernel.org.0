Return-Path: <linux-renesas-soc+bounces-14258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6293FA5BF38
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 12:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3161174920
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 11:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143192343C1;
	Tue, 11 Mar 2025 11:36:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E432505AC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Mar 2025 11:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741693005; cv=none; b=TbezZ9x9I0XFrTAyf/Exr8/xBo3OfqkY4LfMff9IhqmShfYtaYv0z02PwTGx1u0Blp8TeK3EAA5XSU31KmqIQffzkvSgYsjSFNx//7lnAbuVq/P9EulgMOgayqVG/PLYeT2+ixetj72GVlorBMtU+3sYvIXvMhcsgImJR6nZPFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741693005; c=relaxed/simple;
	bh=kRz3LZLSTNipWPTUXOeVLfuE36Z+s4UNvJ2DXS55MBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4l/wX2mm6yw6KZU2bCEQFGK4k8xCcJ6wrjY3AwvsWsJ6OPDnNjxa9mYCbec01ly/tQWaJ8nOarSnBBVtaANam8BXRgimuj9aN2owXsywSf+TN3tiDcaEqf6gwWuMz9+qobhxIfCDeXcr2+DReBNXe5n4kQfGj2WxXtitZ52psI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: sisJ8PGlQrGwnqdAN44eNw==
X-CSE-MsgGUID: Y5F5sQpmSqy9TT5699erUw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 11 Mar 2025 20:36:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.227])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id F214942AA21B;
	Tue, 11 Mar 2025 20:36:40 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 5/9] memory: renesas-rpc-if: Move rpcif_info definitions near to the user
Date: Tue, 11 Mar 2025 11:36:11 +0000
Message-ID: <20250311113620.4312-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move rpcif_info definitions near to the user.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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


