Return-Path: <linux-renesas-soc+bounces-13580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8686AA42010
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 14:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D33283A6421
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 13:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F52243968;
	Mon, 24 Feb 2025 13:13:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7C724BBF4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 13:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740402799; cv=none; b=Fomt3oMMx7k8xMTnJb1iY5TaxFcp5oOEnbGn5MUq5sX+5qc8YD1wQwO/IH7+w6C0VsTYkNDrMTsIHruWosyQWoDV02fxu7tDx3fw+GxvUVTpcvvMo882jvBLufo9yT6eMLTEw5/0jEnszYziQeG/d6x1x/nezcXpjw/TZmX9rRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740402799; c=relaxed/simple;
	bh=zcX3fmdu4dA0kQ4rhBKYIwW8O3/QnRteF+M1KQ5lCjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ipfWapE3i87koy4c+kwMCcNktJ5X5gbE3uDS2eFdLqwLKEUboZ0cYT1mw1ywyZMJfktwtdiFglKXOxvgMo5VF/hJf5aInOyTCGKJz+FjmJw+EKEy4pevX8NAgC8MfxwW/9Fai0XnMmC3+fz3BJXJInKu7OU2Atbl9PPL+jHjoBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: itCkPs7nTsOPXNXM8lRGuQ==
X-CSE-MsgGUID: FjB6ZOXATTW/o9ykKMYxTw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Feb 2025 22:13:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.231])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6FB8C402EC50;
	Mon, 24 Feb 2025 22:13:15 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 06/12] irqchip/renesas-rzv2h: Use devm_pm_runtime_enable()
Date: Mon, 24 Feb 2025 13:11:22 +0000
Message-ID: <20250224131253.134199-7-biju.das.jz@bp.renesas.com>
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

Simplify rzv2h_icu_init() by using devm_pm_runtime_enable().

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change.
v4->v5:
 * No change.
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
index edae54f9f5da..10b9b63a1f09 100644
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


