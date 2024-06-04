Return-Path: <linux-renesas-soc+bounces-5837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5578FBAAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 19:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E284B2A51A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 17:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDBD14A4EB;
	Tue,  4 Jun 2024 17:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzJgWGJR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919F614A09A;
	Tue,  4 Jun 2024 17:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522641; cv=none; b=ayiHnVF5QA2Axxez0XhXvPEKgxH4wn+EmABaH8ytV8YjSyFY7L8CvzUC1tZrsH2oL/vGtSAEcFQ64VarGj1X1DlG2hGpoUAljrUo0ujOwI65bdUZZZb3pE7RGyQu67FPzK0cXXYG17PORfhOnHkWW1RpZwCCHy+/pihtOAGt5+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522641; c=relaxed/simple;
	bh=22g2YRq/yOk6TXxIk8B1NPIgi5iFQvER/ySBUuJME7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VAehly6NjZzGrbWoemy5MDlgDGMIz2/EaTqZFCXQe3peqRW+wB5qny7Euaj5kmJaLgXn9slmbeA8uYwT+iVNhpZ6w8tq6NX3Veu8HgsIqKYTfkXG2LiGb7hXxaPcdW4pti7ME2JSnVI4/gq777Fj19U7ZGAIky4adMVU3HEfMZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzJgWGJR; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52b90038cf7so4609775e87.0;
        Tue, 04 Jun 2024 10:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717522638; x=1718127438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9i9+lVOAIcYQ4JpUKOIFfasPtU3V0Xq2VmgmWFAe70=;
        b=UzJgWGJRukelN1QAgW6loMBQb0PaF84Sl5riBs3ub+wpOZ8ss135FXoS/Xy0m5soI7
         ey59NKj0Hh4/QlDYi3pJh44pYop6p3+rvhbwrhsBWJcICowQ1fqyAohp8mbfBWjQyxgX
         f5IIo4ugR1FmJKAKMUxJ3nFATWrvUw2tfPvQSCSz5iNBMOQeanLpU4Acdj/f+Pr7pQf1
         G2NpR0fZJWTRNqfRqYPHLZlU7yXbv2+/me9szX5IIAMCHAwBVB8ipU4sfi6liykllGHy
         6c5pXDxtpT+g/KPIXNA5yutMK9jeq67VacM1hdwe8xZX3YW1e3w4bM4UZtsUJNK3J+Zd
         aLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717522638; x=1718127438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9i9+lVOAIcYQ4JpUKOIFfasPtU3V0Xq2VmgmWFAe70=;
        b=NSE0l1txOOz9RuIYUsHhQD0DHAt1mSj2qhWmaBhHrcAw5xXy1hRLDFzqXeddwa2nmH
         TxZ7h2w+Qa2lQFARnM5gWYcHx4Bhe9C7dat9olggQK4+ymnqbO8RMQCkkk/hYtwiJS9q
         nH9cXjGByE3EUwj6W3z4z1+3cVw836AofXcnAB7XFkNHJP9GnbJPxkXxkZ450CoscpzJ
         yBLSgA3v1e0EJMOpeq9R+3LhBGU0zUGY/lGnwOxcFLmS/mv6fTJO1+ouPaGknnH9oaNO
         KldZg+58ub/tTAEU0xiJEbQaCc8FX1BVCC8ThECG5wdXM1bXn+dTYw1W0IKU+3MaHKQp
         jDiA==
X-Forwarded-Encrypted: i=1; AJvYcCWBunUlcSl1fb0F2uDYN5Ty/gN5t90KHau5cUEzLbzpC9oImUVXKuo9nRPlLGnqgQ/ozNyNKuz0Ii9BdC9fAuev2Wud6WE0RRdOJ6JEiBw52HUi6ApLcGIYMw82Y4jwjSWsE1s3Y4+irNuforvu
X-Gm-Message-State: AOJu0YxKYDrb5Gc3MpqSdurPCH/2Kjx3LHDMS1V2Rg1QP4JsVSwiUgSp
	ipSx54wLsSbHSMFWyjlg/JHkkDmpZxIX2T2SlGTtVKz5GOIb/7e0Ydr6FUNJ
X-Google-Smtp-Source: AGHT+IHmsXa2GaB3v6/1bzFtgsSEsQ6WiTMpOilk5KogWa7uLarMyOKHJCwHEMEAEB13fB6ZCc4xoQ==
X-Received: by 2002:ac2:4adc:0:b0:523:41ba:a297 with SMTP id 2adb3069b0e04-52bab4b1291mr159637e87.5.1717522637412;
        Tue, 04 Jun 2024 10:37:17 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4213c6629bdsm87844085e9.8.2024.06.04.10.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 10:37:16 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 2/2] irqchip/renesas-rzg2l: Add support for RZ/Five SoC
Date: Tue,  4 Jun 2024 18:37:10 +0100
Message-Id: <20240604173710.534132-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604173710.534132-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240604173710.534132-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The IX45 block has additional mask registers (NMSK/IMSK/TMSK) compared
to the RZ/G2L (family) SoC.

A new rzfive_irqc_chip irq_chip is introduced for RZ/Five, where function
pointers for irq_(un)mask and irq_(dis/en)able handle the (un)masking
of the interrupts. The irq_chip pointer is now passed as an init callback
and stored in the priv pointer to differentiate between RZ/G2L and RZ/Five.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Hi Geert, I've restored your RB tag with v5 change (hope that's OK)

Cheers, Prabhakar

v4->v5
- Reversed the operations in rzfive_irqc_irq_disable().

v3->v4
- Renamed rzg2l_irqc_init_helper -> rzg2l_irqc_common_init
- Moved the locks into callers for (un)mask and (en/dis)able functions
- Collected RB tag from Geert

v2->v3
- Added RZ/Five specific irqchip instead of polluting the functions
- Fixed review comments pointed by Biju and Geert
- Updated commit message
- moved locking to respective read/write functions

v1->v2
- Added IRQCHIP_MATCH() for RZ/Five
- Retaining a copy of OF data in priv
- Rebased the changes
---
 drivers/irqchip/irq-renesas-rzg2l.c | 148 +++++++++++++++++++++++++++-
 1 file changed, 145 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index f6484bf15e0b..861a0e5a3e97 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -37,6 +37,8 @@
 #define TSSEL_SHIFT(n)			(8 * (n))
 #define TSSEL_MASK			GENMASK(7, 0)
 #define IRQ_MASK			0x3
+#define IMSK				0x10010
+#define TMSK				0x10020
 
 #define TSSR_OFFSET(n)			((n) % 4)
 #define TSSR_INDEX(n)			((n) / 4)
@@ -69,12 +71,14 @@ struct rzg2l_irqc_reg_cache {
 /**
  * struct rzg2l_irqc_priv - IRQ controller private data structure
  * @base:	Controller's base address
+ * @irqchip:	Pointer to struct irq_chip
  * @fwspec:	IRQ firmware specific data
  * @lock:	Lock to serialize access to hardware registers
  * @cache:	Registers cache for suspend/resume
  */
 static struct rzg2l_irqc_priv {
 	void __iomem			*base;
+	const struct irq_chip		*irqchip;
 	struct irq_fwspec		fwspec[IRQC_NUM_IRQ];
 	raw_spinlock_t			lock;
 	struct rzg2l_irqc_reg_cache	cache;
@@ -138,6 +142,111 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
 	irq_chip_eoi_parent(d);
 }
 
+static void rzfive_irqc_mask_irq_interrupt(struct rzg2l_irqc_priv *priv,
+					   unsigned int hwirq)
+{
+	u32 bit = BIT(hwirq - IRQC_IRQ_START);
+
+	writel_relaxed(readl_relaxed(priv->base + IMSK) | bit, priv->base + IMSK);
+}
+
+static void rzfive_irqc_unmask_irq_interrupt(struct rzg2l_irqc_priv *priv,
+					     unsigned int hwirq)
+{
+	u32 bit = BIT(hwirq - IRQC_IRQ_START);
+
+	writel_relaxed(readl_relaxed(priv->base + IMSK) & ~bit, priv->base + IMSK);
+}
+
+static void rzfive_irqc_mask_tint_interrupt(struct rzg2l_irqc_priv *priv,
+					    unsigned int hwirq)
+{
+	u32 bit = BIT(hwirq - IRQC_TINT_START);
+
+	writel_relaxed(readl_relaxed(priv->base + TMSK) | bit, priv->base + TMSK);
+}
+
+static void rzfive_irqc_unmask_tint_interrupt(struct rzg2l_irqc_priv *priv,
+					      unsigned int hwirq)
+{
+	u32 bit = BIT(hwirq - IRQC_TINT_START);
+
+	writel_relaxed(readl_relaxed(priv->base + TMSK) & ~bit, priv->base + TMSK);
+}
+
+static void rzfive_irqc_mask(struct irq_data *d)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hwirq = irqd_to_hwirq(d);
+
+	raw_spin_lock(&priv->lock);
+	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
+		rzfive_irqc_mask_irq_interrupt(priv, hwirq);
+	else if (hwirq >= IRQC_TINT_START && hwirq < IRQC_NUM_IRQ)
+		rzfive_irqc_mask_tint_interrupt(priv, hwirq);
+	raw_spin_unlock(&priv->lock);
+	irq_chip_mask_parent(d);
+}
+
+static void rzfive_irqc_unmask(struct irq_data *d)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hwirq = irqd_to_hwirq(d);
+
+	raw_spin_lock(&priv->lock);
+	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
+		rzfive_irqc_unmask_irq_interrupt(priv, hwirq);
+	else if (hwirq >= IRQC_TINT_START && hwirq < IRQC_NUM_IRQ)
+		rzfive_irqc_unmask_tint_interrupt(priv, hwirq);
+	raw_spin_unlock(&priv->lock);
+	irq_chip_unmask_parent(d);
+}
+
+static void rzfive_tint_irq_endisable(struct irq_data *d, bool enable)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hwirq = irqd_to_hwirq(d);
+
+	if (hwirq >= IRQC_TINT_START && hwirq < IRQC_NUM_IRQ) {
+		u32 offset = hwirq - IRQC_TINT_START;
+		u32 tssr_offset = TSSR_OFFSET(offset);
+		u8 tssr_index = TSSR_INDEX(offset);
+		u32 reg;
+
+		raw_spin_lock(&priv->lock);
+		if (enable)
+			rzfive_irqc_unmask_tint_interrupt(priv, hwirq);
+		else
+			rzfive_irqc_mask_tint_interrupt(priv, hwirq);
+		reg = readl_relaxed(priv->base + TSSR(tssr_index));
+		if (enable)
+			reg |= TIEN << TSSEL_SHIFT(tssr_offset);
+		else
+			reg &= ~(TIEN << TSSEL_SHIFT(tssr_offset));
+		writel_relaxed(reg, priv->base + TSSR(tssr_index));
+		raw_spin_unlock(&priv->lock);
+	} else {
+		raw_spin_lock(&priv->lock);
+		if (enable)
+			rzfive_irqc_unmask_irq_interrupt(priv, hwirq);
+		else
+			rzfive_irqc_mask_irq_interrupt(priv, hwirq);
+		raw_spin_unlock(&priv->lock);
+	}
+}
+
+static void rzfive_irqc_irq_disable(struct irq_data *d)
+{
+	irq_chip_disable_parent(d);
+	rzfive_tint_irq_endisable(d, false);
+}
+
+static void rzfive_irqc_irq_enable(struct irq_data *d)
+{
+	rzfive_tint_irq_endisable(d, true);
+	irq_chip_enable_parent(d);
+}
+
 static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
 {
 	unsigned int hw_irq = irqd_to_hwirq(d);
@@ -321,7 +430,7 @@ static struct syscore_ops rzg2l_irqc_syscore_ops = {
 	.resume		= rzg2l_irqc_irq_resume,
 };
 
-static const struct irq_chip irqc_chip = {
+static const struct irq_chip rzg2l_irqc_chip = {
 	.name			= "rzg2l-irqc",
 	.irq_eoi		= rzg2l_irqc_eoi,
 	.irq_mask		= irq_chip_mask_parent,
@@ -338,6 +447,23 @@ static const struct irq_chip irqc_chip = {
 				  IRQCHIP_SKIP_SET_WAKE,
 };
 
+static const struct irq_chip rzfive_irqc_chip = {
+	.name			= "rzfive-irqc",
+	.irq_eoi		= rzg2l_irqc_eoi,
+	.irq_mask		= rzfive_irqc_mask,
+	.irq_unmask		= rzfive_irqc_unmask,
+	.irq_disable		= rzfive_irqc_irq_disable,
+	.irq_enable		= rzfive_irqc_irq_enable,
+	.irq_get_irqchip_state	= irq_chip_get_parent_state,
+	.irq_set_irqchip_state	= irq_chip_set_parent_state,
+	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.irq_set_type		= rzg2l_irqc_set_type,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.flags			= IRQCHIP_MASK_ON_SUSPEND |
+				  IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE,
+};
+
 static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 			    unsigned int nr_irqs, void *arg)
 {
@@ -369,7 +495,7 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 	if (hwirq > (IRQC_NUM_IRQ - 1))
 		return -EINVAL;
 
-	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, &irqc_chip,
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, priv->irqchip,
 					    (void *)(uintptr_t)tint);
 	if (ret)
 		return ret;
@@ -401,7 +527,8 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2l_irqc_priv *priv,
 	return 0;
 }
 
-static int rzg2l_irqc_init(struct device_node *node, struct device_node *parent)
+static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *parent,
+				  const struct irq_chip *irq_chip)
 {
 	struct irq_domain *irq_domain, *parent_domain;
 	struct platform_device *pdev;
@@ -422,6 +549,8 @@ static int rzg2l_irqc_init(struct device_node *node, struct device_node *parent)
 	if (!rzg2l_irqc_data)
 		return -ENOMEM;
 
+	rzg2l_irqc_data->irqchip = irq_chip;
+
 	rzg2l_irqc_data->base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
 	if (IS_ERR(rzg2l_irqc_data->base))
 		return PTR_ERR(rzg2l_irqc_data->base);
@@ -472,8 +601,21 @@ static int rzg2l_irqc_init(struct device_node *node, struct device_node *parent)
 	return ret;
 }
 
+static int __init rzg2l_irqc_init(struct device_node *node,
+				  struct device_node *parent)
+{
+	return rzg2l_irqc_common_init(node, parent, &rzg2l_irqc_chip);
+}
+
+static int __init rzfive_irqc_init(struct device_node *node,
+				   struct device_node *parent)
+{
+	return rzg2l_irqc_common_init(node, parent, &rzfive_irqc_chip);
+}
+
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzg2l_irqc)
 IRQCHIP_MATCH("renesas,rzg2l-irqc", rzg2l_irqc_init)
+IRQCHIP_MATCH("renesas,r9a07g043f-irqc", rzfive_irqc_init)
 IRQCHIP_PLATFORM_DRIVER_END(rzg2l_irqc)
 MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
 MODULE_DESCRIPTION("Renesas RZ/G2L IRQC Driver");
-- 
2.34.1


