Return-Path: <linux-renesas-soc+bounces-16310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 894F5A9A73F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 11:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5E761889E48
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 09:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5CDC201035;
	Thu, 24 Apr 2025 09:00:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001531B040B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Apr 2025 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745485222; cv=none; b=sqsqx+77Li3cDX8+F6Yy7dKh2qo4N0LNlZCur/7vN9tnqt1xIqFcSM9+ZPrLAS7WkH24XYBspOZ+1cfgwM+CI1emsSlpkMAG6H+a5A1PKk2gQwcQ4mGAo9e7YpBdhjj6k2Pch663QYuunmBdkjiN5GcwRu28y1YPa5xErs1r+Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745485222; c=relaxed/simple;
	bh=46LqrgDPTs6A+R+Cp1fctdgmgrtFjUp4TuMjLuINPZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o43IrFDiUtIVGUcYGsH9zG/pwUfkSbzSN25hU7VqxcmzGpdnTmwfdPGrn5LyAJgNjr4OIOjRlcq4o73TXpoXj11vc1aGLt+jViWY3Qrs6tKNR+mzOVpZmWoUJ3eTuYPvqyFMFTxMoJwdpch16s7JSlYiSoDOsCfg694TCcuktKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: TEL2OoDiT9GftMFGt/ABsw==
X-CSE-MsgGUID: zASjhOBYSxayRu2FIqjgFQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Apr 2025 18:00:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.69])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id AC7964005B3F;
	Thu, 24 Apr 2025 18:00:16 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 4/7] memory: renesas-rpc-if: Add regmap to struct rpcif_info
Date: Thu, 24 Apr 2025 09:59:52 +0100
Message-ID: <20250424090000.136804-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424090000.136804-1-biju.das.jz@bp.renesas.com>
References: <20250424090000.136804-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RZ/G3E XSPI has different regmap compared to RPC-IF. Add regmap to
struct rpcif_info in order to support RZ/G3E XSPI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Collected tag.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/memory/renesas-rpc-if.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 9f3ac5cb9ff4..56b2e944beca 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -32,6 +32,7 @@ static const struct regmap_access_table rpcif_volatile_table = {
 };
 
 struct rpcif_info {
+	const struct regmap_config *regmap_config;
 	enum rpcif_type type;
 	u8 strtim;
 };
@@ -588,8 +589,8 @@ static int rpcif_probe(struct platform_device *pdev)
 	rpc->base = devm_platform_ioremap_resource_byname(pdev, "regs");
 	if (IS_ERR(rpc->base))
 		return PTR_ERR(rpc->base);
-
-	rpc->regmap = devm_regmap_init(dev, NULL, rpc, &rpcif_regmap_config);
+	rpc->info = of_device_get_match_data(dev);
+	rpc->regmap = devm_regmap_init(dev, NULL, rpc, rpc->info->regmap_config);
 	if (IS_ERR(rpc->regmap)) {
 		dev_err(dev, "failed to init regmap for rpcif, error %ld\n",
 			PTR_ERR(rpc->regmap));
@@ -602,7 +603,6 @@ static int rpcif_probe(struct platform_device *pdev)
 		return PTR_ERR(rpc->dirmap);
 
 	rpc->size = resource_size(res);
-	rpc->info = of_device_get_match_data(dev);
 	rpc->rstc = devm_reset_control_array_get_exclusive(dev);
 	if (IS_ERR(rpc->rstc))
 		return PTR_ERR(rpc->rstc);
@@ -633,21 +633,25 @@ static void rpcif_remove(struct platform_device *pdev)
 }
 
 static const struct rpcif_info rpcif_info_r8a7796 = {
+	.regmap_config = &rpcif_regmap_config,
 	.type = RPCIF_RCAR_GEN3,
 	.strtim = 6,
 };
 
 static const struct rpcif_info rpcif_info_gen3 = {
+	.regmap_config = &rpcif_regmap_config,
 	.type = RPCIF_RCAR_GEN3,
 	.strtim = 7,
 };
 
 static const struct rpcif_info rpcif_info_rz_g2l = {
+	.regmap_config = &rpcif_regmap_config,
 	.type = RPCIF_RZ_G2L,
 	.strtim = 7,
 };
 
 static const struct rpcif_info rpcif_info_gen4 = {
+	.regmap_config = &rpcif_regmap_config,
 	.type = RPCIF_RCAR_GEN4,
 	.strtim = 15,
 };
-- 
2.43.0


