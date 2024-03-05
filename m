Return-Path: <linux-renesas-soc+bounces-3482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 771FE8726B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 19:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CB53B26700
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 18:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED19318EA2;
	Tue,  5 Mar 2024 18:39:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BD114A8D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Mar 2024 18:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709663979; cv=none; b=DhJcoovzI1GJzi5m9QTkwomIYyMfxIxF++tp23MAvAiVxABY+jKA3/rPNqcaSGkK9eUxto6Uj4PfGdQVG0LI5FxE4v/iJIr8izMnL7xAiC+UsEdhgsoNluo+bdiwbFHq8nydykuabTGpyKDSndkoB9MvYZ4Yot1IqkWHNcqEOQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709663979; c=relaxed/simple;
	bh=ahazKZKOviH4mPbZcEO6wWTF8NcreQPhkrWjL4vqsGY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=skN5H5k7Dz0yJumx9q98z6XBLiqxfPZBtwCBq5wVjRaBePYrGFu1y/1aII/vnZC44A/FSlz8af7XNbFaBZwJtkJ9qSso/VwwhI+NWJSYkdQa6dg5+B+w/Jysa+QryJUOBUoDTrZM8i5J5sEH30kTbnv4QggABesFXh4t3pCyOR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,206,1705330800"; 
   d="scan'208";a="200436907"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Mar 2024 03:39:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.185])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id AFD894003ED1;
	Wed,  6 Mar 2024 03:39:34 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/5] irqchip/renesas-rzg2l: Rename rzg2l_irq_eoi()
Date: Tue,  5 Mar 2024 18:39:20 +0000
Message-Id: <20240305183922.138727-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240305183922.138727-1-biju.das.jz@bp.renesas.com>
References: <20240305183922.138727-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename rzg2l_irq_eoi()->rzg2l_clear_irq_int() and simplify the code by
removing redundant priv local variable.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 599e0aba5cc0..8133f05590b6 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -85,10 +85,9 @@ static struct rzg2l_irqc_priv *irq_data_to_priv(struct irq_data *data)
 	return data->domain->host_data;
 }
 
-static void rzg2l_irq_eoi(struct irq_data *d)
+static void rzg2l_clear_irq_int(struct rzg2l_irqc_priv *priv, unsigned int hwirq)
 {
-	unsigned int hw_irq = irqd_to_hwirq(d) - IRQC_IRQ_START;
-	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hw_irq = hwirq - IRQC_IRQ_START;
 	u32 bit = BIT(hw_irq);
 	u32 iitsr, iscr;
 
@@ -132,7 +131,7 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
 
 	raw_spin_lock(&priv->lock);
 	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
-		rzg2l_irq_eoi(d);
+		rzg2l_clear_irq_int(priv, hw_irq);
 	else if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
 		rzg2l_clear_tint_int(priv, hw_irq);
 	raw_spin_unlock(&priv->lock);
-- 
2.25.1


