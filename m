Return-Path: <linux-renesas-soc+bounces-12942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F0EA2C1AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 12:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BF4C3AAD4F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 11:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDAED1CBA02;
	Fri,  7 Feb 2025 11:37:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDBC1A2C0E
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Feb 2025 11:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928234; cv=none; b=HvKaWpOUGpkGh3kBejdT6MVOIsKSiPFweGbXRl+jxf58+Dh/6JTlDX5ReaLDn4eMpzbDpIGvlqG7guHE8ziSihvQXaxvj4Cd1XlZlWqBwNuXP8KGrs/18Q9C8AZAX8XDQ4p2OoKqLNwZ7PeIzP5WqSAX6awWbu3oTAYPghO7ngM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928234; c=relaxed/simple;
	bh=hcjLjCNWLBg6gthJH0ZUHAlszwckL3co3+4GRKQB9LI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ui5DkQhkU1ylQxAvDvxS/9sZdIl+RmH42knEST5O/3AAhhi1DJBfsQ1zzGzG7apFuEntow+IsQ7efxpfMLlD5WKRR46Qw5xNe3Co1Cx8ph1EQJuwWYNewTBHrRoCYuCqncEsyebON1eMAEC3DAxIjtlnHeWeH1ZDQtSxxswmFxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: jVfrKi5jQSmgoHYooiuEeA==
X-CSE-MsgGUID: mgwl5DCZSZ+Jv6DaRG1mFA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Feb 2025 20:37:13 +0900
Received: from localhost.localdomain (unknown [10.226.93.6])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 965E14004D10;
	Fri,  7 Feb 2025 20:37:10 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v4 04/12] irqchip/renesas-rzv2h: Use devm_reset_control_get_exclusive_deasserted()
Date: Fri,  7 Feb 2025 11:36:36 +0000
Message-ID: <20250207113653.21641-5-biju.das.jz@bp.renesas.com>
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

Use devm_reset_control_get_exclusive_deasserted() to simplify
rzv2h_icu_init().

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Collected tags.
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


