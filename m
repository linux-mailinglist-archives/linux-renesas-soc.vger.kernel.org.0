Return-Path: <linux-renesas-soc+bounces-15428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A871DA7D994
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 11:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 403D6188860C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 09:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B683419D898;
	Mon,  7 Apr 2025 09:21:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F4B22371F;
	Mon,  7 Apr 2025 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017719; cv=none; b=oerNNv8lhj+WbgxKhOJlQUteEj/AB2wWFajxLqrJ99MgVVEW9MHa+bUByK87YhRfcx6jfTxH/CV+0ycKM1f7kfJ1RUryKeVpsxHBzcJAOzcKr6AdXQFN6SNehVQ8dJDaNvGpF02g3QB3yeQzHuCqS5qxTbhSUBHJjm5K0tQRTMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017719; c=relaxed/simple;
	bh=QoPmrGpzCaYfMXH1u8wAwxADc4X76vl7sO+0xeqw84c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WDCJcjc6f8a01cwmEwqRs4YFCewAfYfUuxOQwPFw6KgBJXNd4YIL+iqq4JRwIKQdpPzOl/Ah5wg3BFGLfPLxdYkfeG9B+Dna7dcs+J/E2X3qjlIGGfvmPWU7909uxYFddr+ApcjW715wDWc9BsnHP4YIf/bINQ76uIpTmBfmjJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: uCQZrJjYTjeEuDbsNCz8sw==
X-CSE-MsgGUID: I4oWyh6SRjOfRRZ4X0d51w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Apr 2025 18:21:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.133])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5DDA9400388C;
	Mon,  7 Apr 2025 18:21:47 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] mmc: renesas_sdhi: Use of_get_available_child_by_name()
Date: Mon,  7 Apr 2025 10:21:41 +0100
Message-ID: <20250407092144.35268-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the helper of_get_available_child_by_name() to simplify
renesas_sdhi_probe().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index fa6526be3638..e26e7995754e 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1166,12 +1166,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (ret)
 		goto efree;
 
-	rcfg.of_node = of_get_child_by_name(dev->of_node, "vqmmc-regulator");
-	if (!of_device_is_available(rcfg.of_node)) {
-		of_node_put(rcfg.of_node);
-		rcfg.of_node = NULL;
-	}
-
+	rcfg.of_node = of_get_available_child_by_name(dev->of_node, "vqmmc-regulator");
 	if (rcfg.of_node) {
 		rcfg.driver_data = priv->host;
 		rdev = devm_regulator_register(dev, &renesas_sdhi_vqmmc_regulator, &rcfg);
-- 
2.43.0


