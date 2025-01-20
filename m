Return-Path: <linux-renesas-soc+bounces-12257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD80A169DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 10:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFBBA3A06A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 09:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5771C18801A;
	Mon, 20 Jan 2025 09:47:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC2019AD8D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 09:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737366469; cv=none; b=bRRTzAH2SUSVAVlgY7iPeoOP6EOoH2xGTEaWBI1zHbpD2m4E0leT6ntnOQNCq8s5Nb+TgAHl/fJrCRHB9mMZigsAG6pT7vvYlQ4ome7PZ1fYFKJMc1UERzoY/+gOoKtxSVzPKxWymrTfs0LFp0Dbtw97/bm/yKiGLGqK3fmHuTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737366469; c=relaxed/simple;
	bh=1rg0RpD08+POyxRlqh97SV+43C7zysXd0xAWZJUFxAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pO3DdbfqBcJHP+uvC5j0Rb7jQi+F07rkziJ5hWOadFm/qQE4zYwai8bJqVdL91j/OxzmvYvRDEsgpzpF3Dwzr5XfSFknImjEXuqpBhpNABHL0IlNu3WX8pDwNusBpQOwowKLd2t6DakZvOflElu5kyk9QDl7mbrg1dLS3Xou+/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: h+G5dP41SV+V0X0zeyW5Tg==
X-CSE-MsgGUID: oBPVK0DhR+e1j+3mxw8acQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Jan 2025 18:47:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1E1C4401BF0C;
	Mon, 20 Jan 2025 18:47:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 09/11] irqchip/renesas-rzv2h: Add tien variable to struct rzv2h_hw_info
Date: Mon, 20 Jan 2025 09:47:05 +0000
Message-ID: <20250120094715.25802-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TINT enable position on RZ/G3E is BIT 15 compared to BIT 8 on RZ/V2H.
Add tien variable to struct rzv2h_hw_info to simplify the calculations
when we add support for RZ/G3E and drop the macro ICU_TSSR_TIEN.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzv2h.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 5990dcf72ef0..a1ca34d33c93 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -64,8 +64,6 @@
 #define ICU_TINT_LEVEL_HIGH			2
 #define ICU_TINT_LEVEL_LOW			3
 
-#define ICU_TSSR_TIEN(n)			(BIT(7) << ((n) * 8))
-
 #define ICU_TITSR_K(tint_nr)			((tint_nr) / 16)
 #define ICU_TITSR_TITSEL_N(tint_nr)		((tint_nr) % 16)
 #define ICU_TITSR_TITSEL_PREP(titsel, n)	ICU_IITSR_IITSEL_PREP(titsel, n)
@@ -78,6 +76,7 @@
 /**
  * struct rzv2h_hw_info - Interrupt Control Unit controller hardware info structure.
  * @t_offs: TINT offset
+ * @tien: TIEN mask
  * @tssel_mask: TSSEL mask
  * @tssel_shift: TSSEL shift
  * @max_tssel: TSSEL max value
@@ -85,6 +84,7 @@
  */
 struct rzv2h_hw_info {
 	u16 t_offs;
+	u16 tien;
 	u16 tssel_mask;
 	u8 tssel_shift;
 	u8 max_tssel;
@@ -152,9 +152,9 @@ static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
 	guard(raw_spinlock)(&priv->lock);
 	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(k));
 	if (enable)
-		tssr |= ICU_TSSR_TIEN(tssel_n);
+		tssr |= priv->info->tien << (tssel_n * priv->info->tssel_shift);
 	else
-		tssr &= ~ICU_TSSR_TIEN(tssel_n);
+		tssr &= ~(priv->info->tien << (tssel_n * priv->info->tssel_shift));
 	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(k));
 }
 
@@ -314,7 +314,7 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 
 	titsr_k = ICU_TITSR_K(tint_nr);
 	titsel_n = ICU_TITSR_TITSEL_N(tint_nr);
-	tien = ICU_TSSR_TIEN(titsel_n);
+	tien = priv->info->tien << (titsel_n * priv->info->tssel_shift);
 
 	guard(raw_spinlock)(&priv->lock);
 
@@ -517,6 +517,7 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
 static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.t_offs = 0,
 	.max_tssel = 0x55,
+	.tien = BIT(7),
 	.tssel_mask = GENMASK(6, 0),
 	.tssel_shift = 8,
 	.tssr_k = 4,
-- 
2.43.0


