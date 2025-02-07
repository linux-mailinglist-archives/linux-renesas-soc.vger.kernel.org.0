Return-Path: <linux-renesas-soc+bounces-12943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DA2A2C1AF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 12:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 700707A430E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 11:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67052417ED;
	Fri,  7 Feb 2025 11:37:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BBB1A9B4C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Feb 2025 11:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928237; cv=none; b=l8g/pWq/ek+zxVO/s4J3CgU17JftFFz6/kfJtMJzqImWkloSRaMCbdxgU8miH6vLMDpbgg3Gu2LQqCv53kzQ6ptsG6qP1RHDtqetnjoAVQSH7RCSUeU2JikDlzTyXajICAuvpY8MdDquQ45UxqtpMpzj4pWcOPuh1U9NrQkZZg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928237; c=relaxed/simple;
	bh=sCWaH8YQA8EZ8nbgrAyLX1Bz/TugEnmOoDJ+vfH7aQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZEb/jCLpbhgwEDtm9RIJBXmFqGRtYOd+dXPvIZBLWtuejQA70i4WZNKZ0CqRWsffkjFqPK7KyP2Vi3ZSISMUr4bWUfpuqUVkc2oSDdI86BQucSb51Z5/EEF6G4QhJRQICe2Xke2uOAwzV9A9KNZRsye6wQVZTf/tjwjoMwlg7/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 0Ois9cKsTT6Omv3yPJZY9w==
X-CSE-MsgGUID: g6b//YXwR4qB/yIAWrqtCg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Feb 2025 20:37:15 +0900
Received: from localhost.localdomain (unknown [10.226.93.6])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9372F4004D10;
	Fri,  7 Feb 2025 20:37:13 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 05/12] irqchip/renesas-rzv2h: Use devm_pm_runtime_enable()
Date: Fri,  7 Feb 2025 11:36:37 +0000
Message-ID: <20250207113653.21641-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250207113653.21641-1-biju.das.jz@bp.renesas.com>
References: <20250207113653.21641-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify rzv2h_icu_init() by using devm_pm_runtime_enable().

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Collected tags.
v2->v3:
 * Updated commit header.
 * Replaced 'goto put_dev' by 'return ret' as put_device() called by
   devm_add_action_or_reset().
v2:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 95df8e0755e3..0211fd936514 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -468,11 +468,16 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 		return ret;
 	}
 
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "devm_pm_runtime_enable failed, %d\n", ret);
+		return ret;
+	}
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "pm_runtime_resume_and_get failed: %d\n", ret);
-		goto pm_disable;
+		return ret;
 	}
 
 	raw_spin_lock_init(&rzv2h_icu_data->lock);
@@ -493,8 +498,6 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 
 pm_put:
 	pm_runtime_put(&pdev->dev);
-pm_disable:
-	pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
-- 
2.43.0


