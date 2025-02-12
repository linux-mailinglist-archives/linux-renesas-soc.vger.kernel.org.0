Return-Path: <linux-renesas-soc+bounces-13091-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB743A32E93
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 19:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6034164479
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 18:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8CB263C93;
	Wed, 12 Feb 2025 18:20:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A782C26281C;
	Wed, 12 Feb 2025 18:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739384454; cv=none; b=NRIaDybl9hBJMxnZaNO7//r8G5zRUHKCFvP7of4ZmMmGt9EUCuB9XsonpLmLTUIhSIzGLHw+prY7i6UpOqQS/WSHbmOgjrK1dhvt/YPDMS5RBtId/PBTmad4UU7uHMhQHTyOofATOdZT3wIglQwi6YSKghOlmZc2IW3yjE0JuMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739384454; c=relaxed/simple;
	bh=5nRCIC1DaX34CwK51phYnjIqMk+Xx30+NQK9eUKVCSM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=acZwELsvQvJCzW8L747JNAlrGdUEIZG8M+uWAubIYDUMdjOQv6ZFYukRPYl93fuhz5hRIW+SwzlBu+2U9FKlpIzMzDiDbYS0BNi8VD6g8WjA6PLiHp9DnHHdfg3dS6RAc5IYdswdcQe0a46dcJrDYimtXyr81JF8KpQM+d+OV4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: T7JQLoU1SZ603wHrW09sAg==
X-CSE-MsgGUID: Miqdh1UUQkK8kwtCEsPH/w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Feb 2025 03:20:51 +0900
Received: from mulinux.example.org (unknown [10.226.93.8])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 226444019C63;
	Thu, 13 Feb 2025 03:20:48 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/6] irqchip/renesas-rzg2l: Use devm_pm_runtime_enable()
Date: Wed, 12 Feb 2025 18:20:31 +0000
Message-Id: <20250212182034.366167-4-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212182034.366167-1-fabrizio.castro.jz@renesas.com>
References: <20250212182034.366167-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify rzg2l_irqc_common_init() by using devm_pm_runtime_enable().

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index a29c40466137..c024023a1832 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -568,11 +568,16 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
 		return PTR_ERR(resetn);
 	}
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret < 0) {
+		dev_err(dev, "devm_pm_runtime_enable failed: %d\n", ret);
+		return ret;
+	}
+
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
 		dev_err(dev, "pm_runtime_resume_and_get failed: %d\n", ret);
-		goto pm_disable;
+		return ret;
 	}
 
 	raw_spin_lock_init(&rzg2l_irqc_data->lock);
@@ -603,8 +608,7 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
 
 pm_put:
 	pm_runtime_put(dev);
-pm_disable:
-	pm_runtime_disable(dev);
+
 	return ret;
 }
 
-- 
2.34.1


