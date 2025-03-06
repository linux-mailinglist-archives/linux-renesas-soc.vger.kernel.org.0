Return-Path: <linux-renesas-soc+bounces-14122-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E77A5527B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 18:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1250C17582D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 17:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B9925C6E6;
	Thu,  6 Mar 2025 17:09:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AEC825CC9B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Mar 2025 17:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280984; cv=none; b=ULzN4GCIbjeH3VY+YgWULqqHtVIokU8xmKei+JIg6UqZhZLj/hbeYlbi6wjGd6NNPb5uOzSeB3qr8e9FJxRqBtKcDXR1AflNEAP+TQMrwywY01NV2m0DbflQvt3R4cNPxek7+Tu0YyYXgC0JWrNzNMyWaUZyeZE0BKjMJNUZkYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280984; c=relaxed/simple;
	bh=WXsdI7++GC0qz5HKi4/eK3gWti0N2pRNyfhsZ2Ko2rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XwPL/k0/TXGMsJMfmueiixTFLro8Pv7IqQARjYRqSC/4G2bpYctTPKHrzxDnXreOGbjwalNAMOBl9zrNGlk4CAz3Q6QmBrvpo7h6GqcucSYN72A10Ng1qMZqIgu3dxNXxGtuK6jz3lvdLbCxHg6sTu0TDavMtZ0uWnjKaAMvmDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: gjG0eJrmTruf6BKC8rdpJA==
X-CSE-MsgGUID: nq+llaoRT0aT1AvHZTkxjQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Mar 2025 02:09:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.10])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id BA1AC400857C;
	Fri,  7 Mar 2025 02:09:40 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/8] memory: renesas-rpc-if: Move rpcif_info definitions near to the user
Date: Thu,  6 Mar 2025 17:09:14 +0000
Message-ID: <20250306170924.241257-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306170924.241257-1-biju.das.jz@bp.renesas.com>
References: <20250306170924.241257-1-biju.das.jz@bp.renesas.com>
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


