Return-Path: <linux-renesas-soc+bounces-27986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGjHKK7OhWlBGwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:21:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 041C7FD264
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9626F30AC531
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 11:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2E2394481;
	Fri,  6 Feb 2026 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVEwddPI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD4E3A0E9F
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770376625; cv=none; b=roJhlXG39D4zk0OTcov2iVCes57FQ0jpBNMT8sR6nXt0wYGlv6pdg43u9JPssbRvwOrtcWSiuIGxI2u4HsWCX0N5dBF9LJbCFO7pmhzZBj4/0E5omwIsYBOpeI62EFEjR5C1tCucBkf14s9A0hVxhIDWnP39gGJQ/bxHW722//w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770376625; c=relaxed/simple;
	bh=86OhowibGWeEfEvV9wCBm+XwXiwHWiOcVYBqqYti1RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psOHNb+XHWDWilMoEYrzaxS2kOFxMVtw8BglSTYLVQIPEKWqA1H7MFhtJfze8LmJRq8TJomJVi0q4PfzNv2KfhZOm5lEvuk0ygvHO9m4rwQj0Ur6S3kC080eXJZdsPFJygHBrlH057/4gx3LH1Cl4uKc12p8WmhMQ+H9D5DK948=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVEwddPI; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4358fb60802so1341764f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 03:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770376623; x=1770981423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHVwM3agHEhyWogQbMgCPjNf0AYujgedtHyS/pdWjpo=;
        b=dVEwddPIMVajx77wdtuMoWwVU7r2r7qzl1S/4bRdfkcMRA/lZkO7pxML0VK8fbLTj0
         ed/2bXycCR0s2P5rABgF3h5bdCtO15leLgSAHJhD+74s+cS/gvjjFlEYdMuBC8YFx82M
         P6G0+3UrozYHLlPPvL5n75Ldb3JX4bwBCH57nxBA5KXumoo/hA0t+/cAVAhZ039/WDvL
         3YER0G+tGs8vtxFDM9rQFLjq56FZyPiExRDexT7oV8/xDT8QUFhBW+7EaWIgKZGlBmcc
         mN3vySlNQhhOg4Nsl+lPKxDuFgXrJHtE5BLrQdcZYTcuU4L3u7u0hPCts/8JuGaMWe1P
         97mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770376623; x=1770981423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WHVwM3agHEhyWogQbMgCPjNf0AYujgedtHyS/pdWjpo=;
        b=p3L6f6qevweS9L7Vfx0Ut2jNe53Kkqd0vwOnebatft7brQVG/7WNLsuRWu/ZDevlzq
         SGLYdQZb52BKlg7+bKPC4GCK6Ij4dqEX4s4wXmnlgRnRuSUAuIS/ztaAVebAlBVSDZUI
         mbjNHdQcLfCWCc81dzUXFT8d7PHjbw2OcED8tYgmQtM09Y2kaifA0gR9TX/bSPIiYhIy
         kJVyPIsFbeqiQB6IoB86a4tKnuEg4yOu/0mNo5xVAzHnyOPlXsdHjPCcAsWJZBHXh+RH
         h6ZUo1cuBE+N6GeUxIz+Xbo0g7SJAPIy6UFc9ET4AlWceLJVJ9TtLORtFQ+sH7JQWon5
         8tmg==
X-Forwarded-Encrypted: i=1; AJvYcCX4+xXyaF29v05lv2IBTm+WHhzR4ZgX8FKBdnI3P1ettS0J8+nXJ6ns4mUe5UiYglDg28y0FFPLOZTjLAoxUj2ZBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTW9JW5x4UehOLgNpHKV/tugqoLPXlT418YXNZoyem8s0W4rgn
	KQNniI/H9RA9p4TaNzGYFdQ3/hL39JqsWaoV6g7e8eP7zENLQnWh5Jed
X-Gm-Gg: AZuq6aKhe+sHBsr3hQTaKA3kMqmS1nqxEnxc0SF7cKCCfdEmt8smr7yvfAEKVgDviVo
	Jzyy2l502kZzycQmeNMavtaol4QAGmB3RbL8XPhalJofKAY0TH65yZEoHXUJCYYPQWJgVTzZFC9
	BFUYf6rJaDcG19DAFL0vZe9HJJ/r+734DrTA0T9ktnbQsD6wvL67YmEQDa2Az5RzulcGGhpx46O
	plqG72PRyvu9YF9w2EWtVx40oG8SvVTSR/FOmxOGv92/DoedGnwhwXM1lxVrt154iGp1161KeNy
	jZBmLDV4oz7cqrK7fVBAcV3O+bZvTLjqI0CsGDmnFM6cmqSF980NJzJ3nPpBWSs3TNaoIN7IYjC
	xPWxDCXZW/RBx12VNa+5Qc9lmEJqeeKq+wEX9lPWbusqCv8kALmCRd6tZI64yXs2QZwh02/8q2O
	Ny1Rc3VAwlicc7sOBV9Chn86hihlkA
X-Received: by 2002:a05:6000:605:b0:436:1405:3ef8 with SMTP id ffacd0b85a97d-4362098779dmr9315241f8f.1.1770376623077;
        Fri, 06 Feb 2026 03:17:03 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fa4csm4746380f8f.26.2026.02.06.03.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:17:02 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 4/9] irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macro
Date: Fri,  6 Feb 2026 11:16:47 +0000
Message-ID: <20260206111658.231934-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
References: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27986-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 041C7FD264
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of IRQs in RZ/G2L and RZ/G3L SoC are different.
Introduce struct rzg2l_hw_info to handle the hardware differences and
replace the macro IRQC_NUM_IRQ with num_irq variable in struct
rzg2l_hw_info.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 46 ++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 20e2b1c4587b..cd9909a85280 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -24,7 +24,6 @@
 #define IRQC_IRQ_COUNT			8
 #define IRQC_TINT_START			(IRQC_IRQ_START + IRQC_IRQ_COUNT)
 #define IRQC_TINT_COUNT			32
-#define IRQC_NUM_IRQ			(IRQC_TINT_START + IRQC_TINT_COUNT)
 
 #define ISCR				0x10
 #define IITSR				0x14
@@ -68,12 +67,21 @@ struct rzg2l_irqc_reg_cache {
 	u32	titsr[2];
 };
 
+/**
+ * struct rzg2l_hw_info - Interrupt Control Unit controller hardware info structure.
+ * @num_irq:		Total Number of interrupts
+ */
+struct rzg2l_hw_info {
+	u8	num_irq;
+};
+
 /**
  * struct rzg2l_irqc_priv - IRQ controller private data structure
  * @base:	Controller's base address
  * @irqchip:	Pointer to struct irq_chip
  * @fwspec:	IRQ firmware specific data
  * @lock:	Lock to serialize access to hardware registers
+ * @info:	Pointer to struct rzg2l_hw_info
  * @cache:	Registers cache for suspend/resume
  */
 static struct rzg2l_irqc_priv {
@@ -81,6 +89,7 @@ static struct rzg2l_irqc_priv {
 	const struct irq_chip		*irqchip;
 	struct irq_fwspec		*fwspec;
 	raw_spinlock_t			lock;
+	const struct rzg2l_hw_info	*info;
 	struct rzg2l_irqc_reg_cache	cache;
 } *rzg2l_irqc_data;
 
@@ -136,7 +145,7 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
 	raw_spin_lock(&priv->lock);
 	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
 		rzg2l_clear_irq_int(priv, hw_irq);
-	else if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
+	else if (hw_irq >= IRQC_TINT_START && hw_irq < priv->info->num_irq)
 		rzg2l_clear_tint_int(priv, hw_irq);
 	raw_spin_unlock(&priv->lock);
 	irq_chip_eoi_parent(d);
@@ -182,7 +191,7 @@ static void rzfive_irqc_mask(struct irq_data *d)
 	raw_spin_lock(&priv->lock);
 	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
 		rzfive_irqc_mask_irq_interrupt(priv, hwirq);
-	else if (hwirq >= IRQC_TINT_START && hwirq < IRQC_NUM_IRQ)
+	else if (hwirq >= IRQC_TINT_START && hwirq < priv->info->num_irq)
 		rzfive_irqc_mask_tint_interrupt(priv, hwirq);
 	raw_spin_unlock(&priv->lock);
 	irq_chip_mask_parent(d);
@@ -196,7 +205,7 @@ static void rzfive_irqc_unmask(struct irq_data *d)
 	raw_spin_lock(&priv->lock);
 	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
 		rzfive_irqc_unmask_irq_interrupt(priv, hwirq);
-	else if (hwirq >= IRQC_TINT_START && hwirq < IRQC_NUM_IRQ)
+	else if (hwirq >= IRQC_TINT_START && hwirq < priv->info->num_irq)
 		rzfive_irqc_unmask_tint_interrupt(priv, hwirq);
 	raw_spin_unlock(&priv->lock);
 	irq_chip_unmask_parent(d);
@@ -207,7 +216,7 @@ static void rzfive_tint_irq_endisable(struct irq_data *d, bool enable)
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
 
-	if (hwirq >= IRQC_TINT_START && hwirq < IRQC_NUM_IRQ) {
+	if (hwirq >= IRQC_TINT_START && hwirq < priv->info->num_irq) {
 		u32 offset = hwirq - IRQC_TINT_START;
 		u32 tssr_offset = TSSR_OFFSET(offset);
 		u8 tssr_index = TSSR_INDEX(offset);
@@ -249,9 +258,10 @@ static void rzfive_irqc_irq_enable(struct irq_data *d)
 
 static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
 {
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hw_irq = irqd_to_hwirq(d);
 
-	if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ) {
+	if (hw_irq >= IRQC_TINT_START && hw_irq < priv->info->num_irq) {
 		struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 		u32 offset = hw_irq - IRQC_TINT_START;
 		u32 tssr_offset = TSSR_OFFSET(offset);
@@ -385,12 +395,13 @@ static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
 
 static int rzg2l_irqc_set_type(struct irq_data *d, unsigned int type)
 {
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hw_irq = irqd_to_hwirq(d);
 	int ret = -EINVAL;
 
 	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
 		ret = rzg2l_irq_set_type(d, type);
-	else if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
+	else if (hw_irq >= IRQC_TINT_START && hw_irq < priv->info->num_irq)
 		ret = rzg2l_tint_set_edge(d, type);
 	if (ret)
 		return ret;
@@ -496,7 +507,7 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 			return -EINVAL;
 	}
 
-	if (hwirq > (IRQC_NUM_IRQ - 1))
+	if (hwirq > (priv->info->num_irq - 1))
 		return -EINVAL;
 
 	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, priv->irqchip,
@@ -520,7 +531,7 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2l_irqc_priv *priv,
 	unsigned int i;
 	int ret;
 
-	for (i = 0; i < IRQC_NUM_IRQ; i++) {
+	for (i = 0; i < priv->info->num_irq; i++) {
 		ret = of_irq_parse_one(np, i, &map);
 		if (ret)
 			return ret;
@@ -532,7 +543,8 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2l_irqc_priv *priv,
 }
 
 static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_node *parent,
-				   const struct irq_chip *irq_chip)
+				   const struct irq_chip *irq_chip,
+				   const struct rzg2l_hw_info *info)
 {
 	struct irq_domain *irq_domain, *parent_domain;
 	struct device_node *node = pdev->dev.of_node;
@@ -554,7 +566,9 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 	if (IS_ERR(rzg2l_irqc_data->base))
 		return PTR_ERR(rzg2l_irqc_data->base);
 
-	rzg2l_irqc_data->fwspec = devm_kcalloc(&pdev->dev, IRQC_NUM_IRQ,
+	rzg2l_irqc_data->info = info;
+
+	rzg2l_irqc_data->fwspec = devm_kcalloc(&pdev->dev, info->num_irq,
 					       sizeof(*rzg2l_irqc_data->fwspec), GFP_KERNEL);
 	if (!rzg2l_irqc_data->fwspec)
 		return -ENOMEM;
@@ -579,7 +593,7 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 
 	raw_spin_lock_init(&rzg2l_irqc_data->lock);
 
-	irq_domain = irq_domain_create_hierarchy(parent_domain, 0, IRQC_NUM_IRQ, dev_fwnode(dev),
+	irq_domain = irq_domain_create_hierarchy(parent_domain, 0, info->num_irq, dev_fwnode(dev),
 						 &rzg2l_irqc_domain_ops, rzg2l_irqc_data);
 	if (!irq_domain) {
 		pm_runtime_put(dev);
@@ -591,14 +605,18 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 	return 0;
 }
 
+static const struct rzg2l_hw_info rzg2l_hw_params = {
+	.num_irq	= IRQC_IRQ_START + IRQC_IRQ_COUNT + IRQC_TINT_COUNT,
+};
+
 static int rzg2l_irqc_probe(struct platform_device *pdev, struct device_node *parent)
 {
-	return rzg2l_irqc_common_probe(pdev, parent, &rzg2l_irqc_chip);
+	return rzg2l_irqc_common_probe(pdev, parent, &rzg2l_irqc_chip, &rzg2l_hw_params);
 }
 
 static int rzfive_irqc_probe(struct platform_device *pdev, struct device_node *parent)
 {
-	return rzg2l_irqc_common_probe(pdev, parent, &rzfive_irqc_chip);
+	return rzg2l_irqc_common_probe(pdev, parent, &rzfive_irqc_chip, &rzg2l_hw_params);
 }
 
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzg2l_irqc)
-- 
2.43.0


