Return-Path: <linux-renesas-soc+bounces-13090-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FB8A32E91
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 19:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71F143A1A69
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 18:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D30D261587;
	Wed, 12 Feb 2025 18:20:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AD826138E;
	Wed, 12 Feb 2025 18:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739384452; cv=none; b=p+3GmsAKJCYjDNywegdqvv+C+JXKXKfXpTGY7uIVJKfJce3THtlYT/wksf5upZwtWrwQvOUaOWiUzicv/d+dNnHUQMhRbolQP/U6/IeOmsiAIufaGZedQG92ARVlpD1jvWS/jD3sCITv44RrNugMHugFyViXKhktvJjOXGtJ5Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739384452; c=relaxed/simple;
	bh=SeKeybV3HwnyPr3Mcna/un6cuNEMPYe7H11t5Zmg1EM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EpniHryBzioxnRJvINBTlOvA6gcjqWTY1oqTlYr3VnKFHWVFLr54ed2a/JOJPOY4m4yq5EsJnxotM3QZ9mTAtAc+hNhvqYkROL9enBrk6/f7vtda8oeL5uJkHXRtRxIHF3M7TX6a/hyZA33Ml+OYLYm94rbHNEfWc/75XI6E1nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: wxHS4QMqQuO6ombSwsl29Q==
X-CSE-MsgGUID: L1zptE7qRaO4kLvsrNcUqw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Feb 2025 03:20:48 +0900
Received: from mulinux.example.org (unknown [10.226.93.8])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 135FA4019C77;
	Thu, 13 Feb 2025 03:20:45 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/6] irqchip/renesas-rzg2l: Use devm_reset_control_get_exclusive_deasserted()
Date: Wed, 12 Feb 2025 18:20:30 +0000
Message-Id: <20250212182034.366167-3-fabrizio.castro.jz@renesas.com>
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

Use devm_reset_control_get_exclusive_deasserted() to simplify
rzg2l_irqc_common_init().

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index a7c3a3cc6b9f..a29c40466137 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -562,14 +562,10 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
 		return ret;
 	}
 
-	resetn = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(resetn))
+	resetn = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(resetn)) {
+		dev_err(dev, "failed to acquire deasserted reset: %d\n", ret);
 		return PTR_ERR(resetn);
-
-	ret = reset_control_deassert(resetn);
-	if (ret) {
-		dev_err(dev, "failed to deassert resetn pin, %d\n", ret);
-		return ret;
 	}
 
 	pm_runtime_enable(dev);
@@ -609,7 +605,6 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
 	pm_runtime_put(dev);
 pm_disable:
 	pm_runtime_disable(dev);
-	reset_control_assert(resetn);
 	return ret;
 }
 
-- 
2.34.1


