Return-Path: <linux-renesas-soc+bounces-13579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A86A4200F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 14:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87B5F3A667F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 13:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D794124634F;
	Mon, 24 Feb 2025 13:13:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D2923BD1D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 13:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740402796; cv=none; b=f38ZdK9M3KeB1y5aoODzzYcnez1bVRTkfQ77GeaanPpNVyrjX5qUbeue/l15EMpthKVpUhMf3CVaErJhHQYc2XRef35GACy8Zb7+9lGdstrLmMAreMejM1AWNg6dXL9bIwxNAmN4lnGKgvHkzpnLSZkfJtaJ6W2vsN+0arbcE5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740402796; c=relaxed/simple;
	bh=U/p6Hf1aPo/jyh9aJkYUUNjbqRaQDYUpS1xiPqiXrWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c+nN5ctVd1poL23EwZ3G9tghF9KR6aEvUe0Hjyk5YcgTvYbcXDhp1U8SQeSzeAUwcbSmJ13WQqa7rkIrcKCvxthjWvXkrIQpE9KD2HvV+oLsQj2/dqr5DaI9CNhKfl6ZPHQAJRl+tPPDTi1Z2PtTBbjnmoaPM2iEMUL+NOlyxDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: BlbQH/1RSbS/npZc3QhclA==
X-CSE-MsgGUID: oG8i6lFGR1yNHiXPyM6EPw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Feb 2025 22:13:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.231])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8944F402EC50;
	Mon, 24 Feb 2025 22:13:12 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v6 05/12] irqchip/renesas-rzv2h: Use devm_reset_control_get_exclusive_deasserted()
Date: Mon, 24 Feb 2025 13:11:21 +0000
Message-ID: <20250224131253.134199-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224131253.134199-1-biju.das.jz@bp.renesas.com>
References: <20250224131253.134199-1-biju.das.jz@bp.renesas.com>
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
v5->v6:
 * No change.
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


