Return-Path: <linux-renesas-soc+bounces-2615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7F0851263
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 12:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81B571C21EC6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 11:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4F13984D;
	Mon, 12 Feb 2024 11:37:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B53E39843
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2024 11:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707737855; cv=none; b=CUuIcAnSdZOqN2eM63Pr76gMSLXwoqgDWZrEGGgMquGUh0vVPjRhZtxvj1Lf8AUrAJOtNe4FjwxA8lMcC3jNBsuxzQAUM6ce8fhGfCOgHlUtpXk1whJfNMj2nIvvwI1X4iY4JDwM14llt8pwBPfzXqXMQNeCiTAySVbpSv9k9YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707737855; c=relaxed/simple;
	bh=vEEAnlGYzCjMLHkQe/STbJ3xSxHiNog/FQ0K7+D2Vok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JXZi8xBacQQVneluIRKW9R6Q9iOLJh1P8sXZaESuMK6dLyiAe74RXclb+CUtTPzoLyqWL8Tn+HlVw7brGTtVb5jVlJGE1hxmN/vn7EQJ6a2hp0dbXjcwBfpUSd0lIfC99E+CF70ZT+VPCs+aLdOrrtVXXZEw9Tg/KaJKeVlcsEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,263,1701097200"; 
   d="scan'208";a="193656674"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Feb 2024 20:37:32 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C94B941A9A88;
	Mon, 12 Feb 2024 20:37:29 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/5] irqchip/renesas-rzg2l: Simplify rzg2l_irqc_irq_{en,dis}able()
Date: Mon, 12 Feb 2024 11:37:12 +0000
Message-Id: <20240212113712.71878-6-biju.das.jz@bp.renesas.com>
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

Simplify rzg2l_irqc_irq_{en,dis}able() by moving common code to
rzg2l_tint_irq_endisable().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index fbee400985a9..bfac2c0ecf01 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -164,7 +164,7 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
 	irq_chip_eoi_parent(d);
 }
 
-static void rzg2l_irqc_irq_disable(struct irq_data *d)
+static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
 {
 	unsigned int hw_irq = irqd_to_hwirq(d);
 
@@ -177,28 +177,20 @@ static void rzg2l_irqc_irq_disable(struct irq_data *d)
 
 		raw_spin_lock(&priv->lock);
 		reg = readl_relaxed(priv->base + TSSR(tssr_index));
-		rzg2l_tint_endisable(priv, reg, tssr_offset, tssr_index, false);
+		rzg2l_tint_endisable(priv, reg, tssr_offset, tssr_index, enable);
 		raw_spin_unlock(&priv->lock);
 	}
+}
+
+static void rzg2l_irqc_irq_disable(struct irq_data *d)
+{
+	rzg2l_tint_irq_endisable(d, false);
 	irq_chip_disable_parent(d);
 }
 
 static void rzg2l_irqc_irq_enable(struct irq_data *d)
 {
-	unsigned int hw_irq = irqd_to_hwirq(d);
-
-	if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ) {
-		struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
-		u32 offset = hw_irq - IRQC_TINT_START;
-		u32 tssr_offset = TSSR_OFFSET(offset);
-		u8 tssr_index = TSSR_INDEX(offset);
-		u32 reg;
-
-		raw_spin_lock(&priv->lock);
-		reg = readl_relaxed(priv->base + TSSR(tssr_index));
-		rzg2l_tint_endisable(priv, reg, tssr_offset, tssr_index, true);
-		raw_spin_unlock(&priv->lock);
-	}
+	rzg2l_tint_irq_endisable(d, true);
 	irq_chip_enable_parent(d);
 }
 
-- 
2.25.1


