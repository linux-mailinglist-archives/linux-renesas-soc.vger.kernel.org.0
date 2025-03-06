Return-Path: <linux-renesas-soc+bounces-14121-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C28A5527A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 18:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60EFA1751BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 17:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD7625D902;
	Thu,  6 Mar 2025 17:09:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4227025CC9B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Mar 2025 17:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280982; cv=none; b=oZJnDIg8CasgMloOAIkEjDYcvx5NhBJmo7OQokEkArYEoUr7a/sSDJNbJf+aJcVvrad/5HbugUbza/dcJbaE00lAvQ6zvANUOc5uCg5GQBKXxW0fPIF1llB38vnrQXN2btY1qLMIWcHtRBo1cVj2h1n2nAN+I4N24w7nZ/m7sx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280982; c=relaxed/simple;
	bh=9edTabE1KbtMXA/jCUu47UoExaEkmqYvdLsfnH67Ubo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cas2JFtGZl6mLTgFcqM/wNLmu3pGV6qLtdkLXfFis10maFjag21m7N3c/vKcwGYkOdXr1fjpjc/JmkJMrHl3jISbUhV35+nYkF3K2w5rsS+XiNdb0FG75hGnsxfeDWw6Os5wVQ+rDjqh5aajeKUIMZ2rh82Tkfw08EHutQwjSRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 362Fsf4YSG+vpXxq0pduCg==
X-CSE-MsgGUID: KaXRl/NmT/iwg5WLdYqLZg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Mar 2025 02:09:40 +0900
Received: from localhost.localdomain (unknown [10.226.92.10])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D707640031E1;
	Fri,  7 Mar 2025 02:09:37 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/8] memory: renesas-rpc-if: Use devm_reset_control_array_get_exclusive()
Date: Thu,  6 Mar 2025 17:09:13 +0000
Message-ID: <20250306170924.241257-4-biju.das.jz@bp.renesas.com>
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

Replace devm_*_get_exclusive()->devm_*_array_get_exclusive() to support
existing SoCs along with RZ/G3E as RZ/G3E has 2 resets.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
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


