Return-Path: <linux-renesas-soc+bounces-2612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F11B851266
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 12:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E9BBB28681
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 11:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C8F3984A;
	Mon, 12 Feb 2024 11:37:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77AD638FB2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2024 11:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707737850; cv=none; b=KB1hjaIvE+DHyB31g+jgW0IrsvlX1I7T3Igl01JnyV/4/BI3ZuOyXcLV6JeW0keMFGUNvrpXnijDiVaft+ARCgsYUle9fxwySk4JrkczuLMFPOEfUjZVQf9GxlqaC+KdSIE9UL6yL0NX2UsLAPk2rbnoxshX4e2SgdIfJnVBO2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707737850; c=relaxed/simple;
	bh=gSvCi7qd29H+tj2NAmf+fBPay38d9/OwVw4izpJKzoo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WCC176k0IqBvjirEKsFTNDBnz8NVKrG3IgbVl0ZiZolGWxyrOTGySUyNZDHhTXB+0ioQBCqnyxAe+pfZlAazIp+nM2rm1yzlvC+FY7n/OdfsXAZFMacI3/hZQpflyQmRM0NspOtwSNn/elF0r3STzd2mNam65gAMshFnptg0P0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,263,1701097200"; 
   d="scan'208";a="193656668"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Feb 2024 20:37:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 09F7141A9A83;
	Mon, 12 Feb 2024 20:37:23 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/5] irqchip/renesas-rzg2l: Fix spurious TINT IRQ
Date: Mon, 12 Feb 2024 11:37:10 +0000
Message-Id: <20240212113712.71878-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240212113712.71878-1-biju.das.jz@bp.renesas.com>
References: <20240212113712.71878-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per RZ/G2L hardware manual Rev.1.45 section 8.8.3 Precaution when
changing interrupt settings, we need to mask the interrupts while
setting the interrupt detection method. Apart from this we need to clear
interrupt status after setting TINT interrupt detection method to the
edge type.

First disable TINT enable and then set TINT source. After that set edge
type and then clear the interrupt status register.

Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller driver")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 46 ++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 74c8cbb790e9..c48c8e836dd1 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -117,6 +117,40 @@ static void rzg2l_clear_tint_int(struct rzg2l_irqc_priv *priv,
 	}
 }
 
+static void rzg2l_tint_endisable(struct rzg2l_irqc_priv *priv, u32 reg,
+				 u32 tssr_offset, u32 tssr_index,
+				 bool enable)
+{
+	if (enable)
+		reg |= TIEN << TSSEL_SHIFT(tssr_offset);
+	else
+		reg &= ~(TIEN << TSSEL_SHIFT(tssr_offset));
+
+	writel_relaxed(reg, priv->base + TSSR(tssr_index));
+}
+
+static void rzg2l_disable_tint_and_set_tint_source(struct irq_data *d,
+						   struct rzg2l_irqc_priv *priv,
+						   u32 reg, u32 tssr_offset,
+						   u8 tssr_index)
+{
+	unsigned long tint = (uintptr_t)irq_data_get_irq_chip_data(d);
+	u32 val;
+
+	rzg2l_tint_endisable(priv, reg, tssr_offset, tssr_index, false);
+	val = (reg >> TSSEL_SHIFT(tssr_offset)) & ~TIEN;
+	if (tint != val) {
+		reg |= tint << TSSEL_SHIFT(tssr_offset);
+		writel_relaxed(reg, priv->base + TSSR(tssr_index));
+	}
+}
+
+static bool rzg2l_is_tint_enabled(struct rzg2l_irqc_priv *priv, u32 reg,
+				  u32 tssr_offset)
+{
+	return !!(reg & (TIEN << TSSEL_SHIFT(tssr_offset)));
+}
+
 static void rzg2l_irqc_eoi(struct irq_data *d)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
@@ -214,8 +248,11 @@ static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
 	u32 titseln = hwirq - IRQC_TINT_START;
+	u32 tssr_offset = TSSR_OFFSET(titseln);
+	u8 tssr_index = TSSR_INDEX(titseln);
+	bool tint_enable;
 	u8 index, sense;
-	u32 reg;
+	u32 reg, tssr;
 
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_RISING:
@@ -237,10 +274,17 @@ static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
 	}
 
 	raw_spin_lock(&priv->lock);
+	tssr = readl_relaxed(priv->base + TSSR(tssr_index));
+	tint_enable = rzg2l_is_tint_enabled(priv, tssr, tssr_offset);
+	rzg2l_disable_tint_and_set_tint_source(d, priv, tssr,
+					       tssr_offset, tssr_index);
 	reg = readl_relaxed(priv->base + TITSR(index));
 	reg &= ~(IRQ_MASK << (titseln * TITSEL_WIDTH));
 	reg |= sense << (titseln * TITSEL_WIDTH);
 	writel_relaxed(reg, priv->base + TITSR(index));
+	rzg2l_clear_tint_int(priv, hwirq);
+	if (tint_enable)
+		rzg2l_tint_endisable(priv, tssr, tssr_offset, tssr_index, true);
 	raw_spin_unlock(&priv->lock);
 
 	return 0;
-- 
2.25.1


