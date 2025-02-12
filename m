Return-Path: <linux-renesas-soc+bounces-13063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C71A32482
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 12:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93AD01884432
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 11:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8FE20A5D2;
	Wed, 12 Feb 2025 11:12:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A9C20B1FB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Feb 2025 11:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739358777; cv=none; b=f6I5SvUVJ8hmsF7pgCvCyyi258OCPeGYd/EobFeyPP70OT3D7RX0gauqQKxX7tua6DVGAWR+MEs+LdrBLHJaZfHvuTFc4n0naye6OxTE7wgLkVC2OUjjmLxUsbK3PvjxCvgGflycF+hXMMLGbM6XHsEJjTzd1hHRS1+JMgpUhMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739358777; c=relaxed/simple;
	bh=1XQn9eHjeO2YTsn8HVY1HT62SjNyuXjLIDYk9Bo+EqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZWAqQDIj5ZV/WyThvL8DLjoZf2RXH9zYvCqmyP8q5c+XY9c8w+hkUJD/i+t1dWTijMhmAu5A8BrvHxbwxJif8dkroB/g8h4PXcA3cISkWH0do1g3oVUnGESsf4jzPnwyD+zm9lfnj+3CqssmFwV0y5/eBGNHL8zQz4RZ4Y9gMcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: B0Tc7krCS7u9KqONkDhgsA==
X-CSE-MsgGUID: oJmOVL26St2+q/zerInLGA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Feb 2025 20:12:52 +0900
Received: from localhost.localdomain (unknown [10.226.92.135])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 25E27425C75D;
	Wed, 12 Feb 2025 20:12:49 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v5 05/12] irqchip/renesas-rzv2h: Use devm_reset_control_get_exclusive_deasserted()
Date: Wed, 12 Feb 2025 11:12:14 +0000
Message-ID: <20250212111231.143277-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212111231.143277-1-biju.das.jz@bp.renesas.com>
References: <20250212111231.143277-1-biju.das.jz@bp.renesas.com>
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
v4->v5:
 * No change.
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
index d724f32dde8f..edae54f9f5da 100644
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


