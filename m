Return-Path: <linux-renesas-soc+bounces-3485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 258088726B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 19:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52BD81C22FD2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 18:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF52C1426F;
	Tue,  5 Mar 2024 18:39:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE843179AB
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Mar 2024 18:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709663982; cv=none; b=vFAUqQhRSrJ11q4EWeAipjXp3gDkdzXTLt6mK9JOqdultpWkhMHtB/pKbpfozL16xjmLY9wtrRsv6YoF6aiMzR7uxotOL/ln60RegosMs+UcO5fBO4yHPAe68uqUSCwZFljK/5dwsnhB/UnAh8b3EnYrWeID/AF6rZ5RZZrXDTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709663982; c=relaxed/simple;
	bh=UEJ+bSs34iK5yxlaOnTeseC+luyjQhCS//7FhqU4dOo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o5wUN2sOzMxitoT33Fa/GtkbAIemWJa56qyXk/VD5M9ZQST/SK+GzJGTP2guCX7lQcisVVdLr4IeiJ7f7Wemq4HXFXhL03uHYqMVRRGtDLJ1/W6dD11Y3FJ1Brp+fn6JxzKoBAzzNye4fAQ+AOr+pzBjNMVk8nCXg0lN3iptRdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,206,1705330800"; 
   d="scan'208";a="196498261"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Mar 2024 03:39:34 +0900
Received: from localhost.localdomain (unknown [10.226.92.185])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 101B34003ED1;
	Wed,  6 Mar 2024 03:39:31 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/5] irqchip/renesas-rzg2l: Rename rzg2l_tint_eoi()
Date: Tue,  5 Mar 2024 18:39:19 +0000
Message-Id: <20240305183922.138727-3-biju.das.jz@bp.renesas.com>
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

Rename rzg2l_tint_eoi()->rzg2l_clear_tint_int() and simplify the code by
removing redundant priv and hw_irq local variables.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Updated commit description rzg2l_tint_eoi()->rzg2l_clear_tint_int().
 * Added Rb tag from Geert.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 5285bc817dd0..599e0aba5cc0 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -109,11 +109,9 @@ static void rzg2l_irq_eoi(struct irq_data *d)
 	}
 }
 
-static void rzg2l_tint_eoi(struct irq_data *d)
+static void rzg2l_clear_tint_int(struct rzg2l_irqc_priv *priv, unsigned int hwirq)
 {
-	unsigned int hw_irq = irqd_to_hwirq(d) - IRQC_TINT_START;
-	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
-	u32 bit = BIT(hw_irq);
+	u32 bit = BIT(hwirq - IRQC_TINT_START);
 	u32 reg;
 
 	reg = readl_relaxed(priv->base + TSCR);
@@ -136,7 +134,7 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
 	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
 		rzg2l_irq_eoi(d);
 	else if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
-		rzg2l_tint_eoi(d);
+		rzg2l_clear_tint_int(priv, hw_irq);
 	raw_spin_unlock(&priv->lock);
 	irq_chip_eoi_parent(d);
 }
-- 
2.25.1


