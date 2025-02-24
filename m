Return-Path: <linux-renesas-soc+bounces-13581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B7AA4202C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 14:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D301F7ABE99
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 13:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E22523BCF6;
	Mon, 24 Feb 2025 13:13:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CEE23BD1D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 13:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740402802; cv=none; b=Qznu6Y+bnBtKE1mT9YQbLJtwhxfjs2Vbr8cqrqkbhc1Ed8OfBAoTWXFmsl/ariYowu6K8BlBTipHf4D+DOKFBgCBd3K7bGRDHuPhPpN4a0jpZFhONCDBBm2KA397vD5u0uJwS1qpzLlpa1bjRoXm+/m36lzMbxp4Jh9Z46OJtBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740402802; c=relaxed/simple;
	bh=A6JsYMIfp2888YgbFd26Gmig30erNKm6aDHvKDFRKNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oi0FrrbimBBzb9Xf07l+Fo7diaue7REK1uff3yD2KEp3sA3CCPvp+7L1Y02ru+5TYrFn3Z28M7Asf5Wk9JmwLnHbOeZtt2jlx5GaTsKbPpKu2EqS+GlEon2OzkXGp0ZigoPKxmZUU41qwsRHu8TrmIb/J0VuDpZpYtm+evuI2RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: QD88d7jfQxmZfbhGplgCoA==
X-CSE-MsgGUID: kjpID4n/T1mcOTpHropVNA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Feb 2025 22:13:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.231])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1986E400F319;
	Mon, 24 Feb 2025 22:13:17 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v6 07/12] irqchip/renesas-rzv2h: Add struct rzv2h_hw_info with t_offs variable
Date: Mon, 24 Feb 2025 13:11:23 +0000
Message-ID: <20250224131253.134199-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224131253.134199-1-biju.das.jz@bp.renesas.com>
References: <20250224131253.134199-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ICU block on the RZ/G3E SoC is almost identical to the one found on
the RZ/V2H SoC, with the following differences:
 - The TINT register base offset is 0x800 instead of zero.
 - The number of GPIO interrupts for TINT selection is 141 instead of 86.
 - The pin index and TINT selection index are not in the 1:1 map
 - The number of TSSR registers is 16 instead of 8
 - Each TSSR register can program 2 TINTs instead of 4 TINTs

Introduce struct rzv2h_hw_info to handle these differences and add t_offs
variable to take care of the TINT register offset difference between
RZ/G3E and RZ/V2H.

Refactor the code by moving rzv2h_icu_init() into rzv2h_icu_init_common()
and pass the variable containing hw difference to support both these SoCs.

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change.
v4->v5:
 * No change.
v3->v4:
 * Updated commit description with register offset->register base offset
 * Fixed typo 15->16 for the number of TSSR register for RZ/G3E.
 * Fixed the typo varable->variable.
 * Collected tag from Geert.
v2->v3:
 * No change.
v1->v2:
 * Collected tags
 * Started aligning kernel doc, struct members and struct initializers in
   a tabular fashion.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 46 +++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 10b9b63a1f09..43b805b6df94 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -80,16 +80,26 @@
 #define ICU_TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
 #define ICU_PB5_TINT				0x55
 
+/**
+ * struct rzv2h_hw_info - Interrupt Control Unit controller hardware info structure.
+ * @t_offs:		TINT offset
+ */
+struct rzv2h_hw_info {
+	u16		t_offs;
+};
+
 /**
  * struct rzv2h_icu_priv - Interrupt Control Unit controller private data structure.
  * @base:	Controller's base address
  * @fwspec:	IRQ firmware specific data
  * @lock:	Lock to serialize access to hardware registers
+ * @info:	Pointer to struct rzv2h_hw_info
  */
 struct rzv2h_icu_priv {
 	void __iomem			*base;
 	struct irq_fwspec		fwspec[ICU_NUM_IRQ];
 	raw_spinlock_t			lock;
+	const struct rzv2h_hw_info	*info;
 };
 
 static inline struct rzv2h_icu_priv *irq_data_to_priv(struct irq_data *data)
@@ -109,7 +119,7 @@ static void rzv2h_icu_eoi(struct irq_data *d)
 			tintirq_nr = hw_irq - ICU_TINT_START;
 			bit = BIT(tintirq_nr);
 			if (!irqd_is_level_type(d))
-				writel_relaxed(bit, priv->base + ICU_TSCLR);
+				writel_relaxed(bit, priv->base + priv->info->t_offs + ICU_TSCLR);
 		} else if (hw_irq >= ICU_IRQ_START) {
 			tintirq_nr = hw_irq - ICU_IRQ_START;
 			bit = BIT(tintirq_nr);
@@ -137,12 +147,12 @@ static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
 	tssel_n = ICU_TSSR_TSSEL_N(tint_nr);
 
 	guard(raw_spinlock)(&priv->lock);
-	tssr = readl_relaxed(priv->base + ICU_TSSR(k));
+	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(k));
 	if (enable)
 		tssr |= ICU_TSSR_TIEN(tssel_n);
 	else
 		tssr &= ~ICU_TSSR_TIEN(tssel_n);
-	writel_relaxed(tssr, priv->base + ICU_TSSR(k));
+	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(k));
 }
 
 static void rzv2h_icu_irq_disable(struct irq_data *d)
@@ -245,8 +255,8 @@ static void rzv2h_clear_tint_int(struct rzv2h_icu_priv *priv, unsigned int hwirq
 	u32 bit = BIT(tint_nr);
 	int k = tint_nr / 16;
 
-	tsctr = readl_relaxed(priv->base + ICU_TSCTR);
-	titsr = readl_relaxed(priv->base + ICU_TITSR(k));
+	tsctr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSCTR);
+	titsr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TITSR(k));
 	titsel = ICU_TITSR_TITSEL_GET(titsr, titsel_n);
 
 	/*
@@ -255,7 +265,7 @@ static void rzv2h_clear_tint_int(struct rzv2h_icu_priv *priv, unsigned int hwirq
 	 */
 	if ((tsctr & bit) && ((titsel == ICU_TINT_EDGE_RISING) ||
 			      (titsel == ICU_TINT_EDGE_FALLING)))
-		writel_relaxed(bit, priv->base + ICU_TSCLR);
+		writel_relaxed(bit, priv->base + priv->info->t_offs + ICU_TSCLR);
 }
 
 static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
@@ -306,21 +316,21 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 
 	guard(raw_spinlock)(&priv->lock);
 
-	tssr = readl_relaxed(priv->base + ICU_TSSR(tssr_k));
+	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
 	tssr &= ~(ICU_TSSR_TSSEL_MASK(tssel_n) | tien);
 	tssr |= ICU_TSSR_TSSEL_PREP(tint, tssel_n);
 
-	writel_relaxed(tssr, priv->base + ICU_TSSR(tssr_k));
+	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
 
-	titsr = readl_relaxed(priv->base + ICU_TITSR(titsr_k));
+	titsr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TITSR(titsr_k));
 	titsr &= ~ICU_TITSR_TITSEL_MASK(titsel_n);
 	titsr |= ICU_TITSR_TITSEL_PREP(sense, titsel_n);
 
-	writel_relaxed(titsr, priv->base + ICU_TITSR(titsr_k));
+	writel_relaxed(titsr, priv->base + priv->info->t_offs + ICU_TITSR(titsr_k));
 
 	rzv2h_clear_tint_int(priv, hwirq);
 
-	writel_relaxed(tssr | tien, priv->base + ICU_TSSR(tssr_k));
+	writel_relaxed(tssr | tien, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
 
 	return 0;
 }
@@ -424,7 +434,8 @@ static void rzv2h_icu_put_device(void *data)
 	put_device(data);
 }
 
-static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
+static int rzv2h_icu_init_common(struct device_node *node, struct device_node *parent,
+				 const struct rzv2h_hw_info *hw_info)
 {
 	struct irq_domain *irq_domain, *parent_domain;
 	struct rzv2h_icu_priv *rzv2h_icu_data;
@@ -490,6 +501,8 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 		goto pm_put;
 	}
 
+	rzv2h_icu_data->info = hw_info;
+
 	/*
 	 * coccicheck complains about a missing put_device call before returning, but it's a false
 	 * positive. We still need &pdev->dev after successfully returning from this function.
@@ -502,6 +515,15 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 	return ret;
 }
 
+static const struct rzv2h_hw_info rzv2h_hw_params = {
+	.t_offs		= 0,
+};
+
+static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
+{
+	return rzv2h_icu_init_common(node, parent, &rzv2h_hw_params);
+}
+
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzv2h_icu)
 IRQCHIP_MATCH("renesas,r9a09g057-icu", rzv2h_icu_init)
 IRQCHIP_PLATFORM_DRIVER_END(rzv2h_icu)
-- 
2.43.0


