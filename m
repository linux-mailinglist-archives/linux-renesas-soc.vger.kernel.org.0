Return-Path: <linux-renesas-soc+bounces-12639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2D5A208E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 563681884954
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6049B188CA9;
	Tue, 28 Jan 2025 10:47:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F92919CC0C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 10:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738061271; cv=none; b=IQlCh6B0Fka/07Yv7yYVWbk1OnX+zpEMDuzOrvibhzp99RDYv0iYTSTQ8o8xX72T6rh3gB3Cg6jaIv+gnpRk68E6bmIPK62za6UMPFa+lI7e3iMmXYxMINETZx9cB7D2nmUkMvHJq0SNBPmv9Ide9p5Lkq4t2VOvXm+uDq2SAcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738061271; c=relaxed/simple;
	bh=RrQHduzY3t4a8L44Ieyjataik0t2hAlIZm5+mS4n9CE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SzapQoLcp1le0AcoCUx1efe6JIDWFYXjWTNha6k74tb6v/yibFlzFlewaPVu1p8wh+UBt19aMCdcY3vaP5u+nlp8puutIQJCJt9rQ3QKhRZjhIVn7VGQ2mlVN0ChyR5azoAkgsjm/e3jCrxOuPNgHzqBh8lLh44SkSgcAeA1cK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: WPxk0mEDTQi2OtucrEFfkw==
X-CSE-MsgGUID: USCj9ToiROujVAbUQGpe7A==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Jan 2025 19:47:49 +0900
Received: from localhost.localdomain (unknown [10.226.93.131])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id AB6B741FAD3F;
	Tue, 28 Jan 2025 19:47:34 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v3 05/13] irqchip/renesas-rzv2h: Use devm_reset_control_get_exclusive_deasserted()
Date: Tue, 28 Jan 2025 10:46:55 +0000
Message-ID: <20250128104714.80807-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_reset_control_get_exclusive_deasserted() to simplify
rzv2h_icu_init().

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Replaced 'goto put_dev' by 'return xxx' as put_device() called by
   devm_add_action_or_reset().
v1->v2:
 * Split the simplification patch into two.
 * Updated commit header and description.
 * Replaced devm_reset_control_get_optional_exclusive_deasserted()->
   devm_reset_control_get_exclusive_deasserted().
 * Moved simplification using devm_pm_runtime_enable() to next patch.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index fd678947df83..95df8e0755e3 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -461,13 +461,10 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 		return ret;
 	}
 
-	resetn = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(resetn))
-		return PTR_ERR(resetn);
-
-	ret = reset_control_deassert(resetn);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to deassert resetn pin, %d\n", ret);
+	resetn = devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL);
+	if (IS_ERR(resetn)) {
+		ret = PTR_ERR(resetn);
+		dev_err(&pdev->dev, "failed to acquire deasserted reset: %d\n", ret);
 		return ret;
 	}
 
@@ -498,7 +495,6 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 	pm_runtime_put(&pdev->dev);
 pm_disable:
 	pm_runtime_disable(&pdev->dev);
-	reset_control_assert(resetn);
 
 	return ret;
 }
-- 
2.43.0


