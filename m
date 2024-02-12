Return-Path: <linux-renesas-soc+bounces-2614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E09851262
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 12:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 458C41C21ECF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 11:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCEC39847;
	Mon, 12 Feb 2024 11:37:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AA839857
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2024 11:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707737854; cv=none; b=gg9Uy/cz1yiffpWf2jnqIQEl7stxqh94UXS+1DM22Yh90PJCZe8c9B12zoxvwT86RSg5ay3MnaeHOXCTMLxeICVoGsJB9imRNbpLuEEMkocx6LMjoP4LadTtOtUIMOenaVkmemuN61KdCnaogMpteZifWCR0BVkpMP4J6RtiYIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707737854; c=relaxed/simple;
	bh=31kDQYqSZnacSM6donzI6RHn00VE0l2Nf29t4XKA6LE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DB4djtbagHpuKWqOWtwFMPjYSQct0/k1Rwz+12Y0INgR2OFVDFSHGviy9Lq1Xami/H25wQevFyycSaXGuW1arIv7kliZhj8EBZ/xiUNMb0bov7+0FmR9qsoDNNoMIrREPAAZdom0f+LldW5BOJsJkE74IGdQ+2sghj5pNIZhSJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,263,1705330800"; 
   d="scan'208";a="197568527"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 12 Feb 2024 20:37:29 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id DD75741A9A88;
	Mon, 12 Feb 2024 20:37:26 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/5] irqchip/renesas-rzg2l: Use TIEN for enable/disable
Date: Mon, 12 Feb 2024 11:37:11 +0000
Message-Id: <20240212113712.71878-5-biju.das.jz@bp.renesas.com>
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

Use TIEN for enable/disable and avoid modifying TINT source selection
register.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index c48c8e836dd1..fbee400985a9 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -35,7 +35,6 @@
 #define TSSR(n)				(0x30 + ((n) * 4))
 #define TIEN				BIT(7)
 #define TSSEL_SHIFT(n)			(8 * (n))
-#define TSSEL_MASK			GENMASK(7, 0)
 #define IRQ_MASK			0x3
 
 #define TSSR_OFFSET(n)			((n) % 4)
@@ -178,8 +177,7 @@ static void rzg2l_irqc_irq_disable(struct irq_data *d)
 
 		raw_spin_lock(&priv->lock);
 		reg = readl_relaxed(priv->base + TSSR(tssr_index));
-		reg &= ~(TSSEL_MASK << TSSEL_SHIFT(tssr_offset));
-		writel_relaxed(reg, priv->base + TSSR(tssr_index));
+		rzg2l_tint_endisable(priv, reg, tssr_offset, tssr_index, false);
 		raw_spin_unlock(&priv->lock);
 	}
 	irq_chip_disable_parent(d);
@@ -190,7 +188,6 @@ static void rzg2l_irqc_irq_enable(struct irq_data *d)
 	unsigned int hw_irq = irqd_to_hwirq(d);
 
 	if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ) {
-		unsigned long tint = (uintptr_t)irq_data_get_irq_chip_data(d);
 		struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 		u32 offset = hw_irq - IRQC_TINT_START;
 		u32 tssr_offset = TSSR_OFFSET(offset);
@@ -199,8 +196,7 @@ static void rzg2l_irqc_irq_enable(struct irq_data *d)
 
 		raw_spin_lock(&priv->lock);
 		reg = readl_relaxed(priv->base + TSSR(tssr_index));
-		reg |= (TIEN | tint) << TSSEL_SHIFT(tssr_offset);
-		writel_relaxed(reg, priv->base + TSSR(tssr_index));
+		rzg2l_tint_endisable(priv, reg, tssr_offset, tssr_index, true);
 		raw_spin_unlock(&priv->lock);
 	}
 	irq_chip_enable_parent(d);
-- 
2.25.1


