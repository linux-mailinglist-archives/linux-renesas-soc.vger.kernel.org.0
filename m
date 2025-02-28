Return-Path: <linux-renesas-soc+bounces-13812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E059A49E58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 17:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6B1A3AD126
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 16:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6F7188CCA;
	Fri, 28 Feb 2025 16:08:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415A8270041
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Feb 2025 16:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740758908; cv=none; b=boZkUSvpjOIg8kED2vGb3WbkUgLzrYd50cPUgMN4xodMWKudvgcztEQqTQcdFO2aEV1PRiDl81UzaGEuUxq927JLXbTh2Q3PHLvUp8y0wmXyRKZoEFcI6bDY/CIj+71GURHP1nbELsNFW/j4xy3UXGlnN9JnxH9et367ztiWIWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740758908; c=relaxed/simple;
	bh=xFTBcYzC9CYDl4X4iBgqGer+2QL4oDLutW2HOyuX+Ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzvRgKBmbWjGbDNxuKlrd2+KXV7JAs4VYTI3oujmRjoan96X314cCVz56q2XxLTicEGDib6x0d9oFMZ1Frso6G9VbLTLnmZ3FI9YFoklqXwnESqAP/6xSjSAxe6/G2e1rmbYCLJd2bDMLpfsr3/sBRIJANKM4mRoPpjQUHguttk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: a4u3aZc0SIG34GlnRsEFOg==
X-CSE-MsgGUID: d1onAREvQm6dMmJZO5iF8Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Mar 2025 01:08:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.94])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C39A3401C3E9;
	Sat,  1 Mar 2025 01:08:22 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/8] memory: renesas-rpc-if: Use devm_reset_control_array_get_exclusive()
Date: Fri, 28 Feb 2025 16:07:57 +0000
Message-ID: <20250228160810.171413-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228160810.171413-1-biju.das.jz@bp.renesas.com>
References: <20250228160810.171413-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace devm_*_get_exclusive()->devm_*_array_get_exclusive() to support
existing SoCs along with RZ/G3E as RZ/G3E has 2 resets.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/memory/renesas-rpc-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 20d1a6e4a500..ce03fbd82c7a 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -623,7 +623,7 @@ static int rpcif_probe(struct platform_device *pdev)
 
 	rpc->size = resource_size(res);
 	rpc->info = of_device_get_match_data(dev);
-	rpc->rstc = devm_reset_control_get_exclusive(dev, NULL);
+	rpc->rstc = devm_reset_control_array_get_exclusive(dev);
 	if (IS_ERR(rpc->rstc))
 		return PTR_ERR(rpc->rstc);
 
-- 
2.43.0


