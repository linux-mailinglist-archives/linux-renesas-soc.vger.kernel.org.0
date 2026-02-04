Return-Path: <linux-renesas-soc+bounces-27886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CG5HJAFXg2mJlQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 15:26:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7C8E7106
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 15:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEADC3037E5A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 14:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3349041322E;
	Wed,  4 Feb 2026 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfWlpROV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AA5410D3E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 14:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215007; cv=none; b=qxkLC5m6bT/OSJlpWwwgfb4ERRbrpnN80JDcdp87LPsxY8jqrUCTh4AqY6IV6oN3AF265PvmfFhyshB1qaqRF9ZAzed+j8TE3otBcDT6xD/E4uWgfYLscaxdEqEt9//GansTpOlJOLyXYnwnJYKqAUGEAzwgedjKXshpHRWsftc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215007; c=relaxed/simple;
	bh=o22U+8vY0dnnJkZ0gE8DL8cxlUxYyX5mY0s7rT0nJlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzVLveS2chYIfd8STr1C86iCNthuXixpiHh1Ce2CmJ01p7JuFss1KEnOl433wxVUkmrNGCExAUwmOKJ/gfRROjgg5OqTmhIBv6pGlRoJjD9GQ2smIO/XBxDQqC88+wNcbV0/vfYL+0oES30zu7E/zHsBQzGGR0rAUO4X9Zp++FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfWlpROV; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-658034ce0e3so10884693a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 06:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770215005; x=1770819805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vZGh2mgpsYmBnSmPEEEfEUpJ8/hDIu2t+YRg9j8bgk=;
        b=BfWlpROVlpw1uMlk66hzPmQ4MHY6CYukQCpitwRjEdcuFxIN4SZGH1cwcqYUMIjZTT
         p2XYVGOsemDq0f6cFk+BET7dIrwQS5cHMXaarQ3eWTn2JaV9AUeVL7dKQBdZ3eJRC40a
         42Xopp4GqkaAlWGLEkzr/pwoSdqIMvTDKxkXmRtUg80qizFRrh9jkCz5EbV7xmo9OdPA
         nfdm65h8i33IFAYd+Zr1FsWi22IlyGtbeHCUyH9wqsPE9EzV0Jv6DHohYiyWPi4NzZ/5
         i+AQB/VJFY02QDQm4f9f5CGwbkejHuaLO8QJQf16zIX9jirPgurdPqa29cW4oluL+uIb
         JgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770215005; x=1770819805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3vZGh2mgpsYmBnSmPEEEfEUpJ8/hDIu2t+YRg9j8bgk=;
        b=scXa4NoezE9DivigwQU7eikiN7KpoHHjiFMYfr/pj2bYIFLLCzMp67cEhAhGC2eSre
         7eEd0TqL38+ZNNu9uoTDDi4nz2oD6ayNIw26WjjBGaC6mXp6iBznruEAt6phYwZg3yyv
         uZS545ymfeiebXfHWfHsF70JR/FDmUacJ3xeGGAu5pSDe8latZiKaleHZJ5JmPBKJvzq
         SycH7lEwL1Kv7to+GonJsOG3inYK+4FztZ9of7qdSe6v8RkI8PgJs6SeA1mvT77eRv3+
         z/DqM6wQdWTWupjgWipF8tKUIQL7ZD+lUZPW8jlxPaP+oFNbInICm8kvYOQB/UgVjKYV
         gzxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvwrqba9ZCdkC0/LQ97hTSj9CpGKLfKruir+NmInoJCFADzsn1iAfsUJK8CMD3HaAEOPXody4+wVO230r9O4Yuqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc8/1pFge5Jtcnt/goS07NC0DzvKYRuT7p6OcSe61doYdY4h9v
	TCh3FBzJOUnAtL+Ilfo/DgqziInCBxhaIK+VzWgHTCV1nm6Wi4z4kRg6FSqcfm+R
X-Gm-Gg: AZuq6aJ/r6hPJiKU8c8G9NAc+JIquB/k1MjO8oUQIxzphHSlZ7v8x6PboU3PSVfpLpn
	nKC7zIDUe/2nVbqtUMaHMAIPxJ8t3R76pxQfZ1MX4078mmN42mgD+VRiJCDs2pwrN3wgBxqXQX8
	VybQlAh45eKeY2ePJ97o4mdVe1g71Spnd7PDDxNqnkfVUeMh6ilnQiJJVxut0WSIUmqKUkYtWJD
	JLJufq7k03KippTFdPqkW8tpY8U15rtaFbOAOSGgc7eLv8Kax1pm63sy2+8kzQ1MZjQYzic8dkU
	F81dS0ncsGWFURN+g1XyQ2tKwL3t1fgk3GVNvmd99rj75DMenQNsX/3Yr7UVdMvbC9ywO66uy+z
	SvrsaCYIbvTPnIXepgUUPqOONcbQtaXS6bLhdG7d2/ZYsBZFyNMYCR3/YebkkWv6x8UsRvD6M7x
	aj6agUccY8hGp4yWfFFZSe89ykSGcC6TR9LEI=
X-Received: by 2002:a17:907:971e:b0:b87:d3af:de68 with SMTP id a640c23a62f3a-b8e9ef25d95mr181125766b.7.1770215004658;
        Wed, 04 Feb 2026 06:23:24 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3c9f:a100:4d45:ebc7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea001ea7dsm129038366b.47.2026.02.04.06.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 06:23:24 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/8] irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macro
Date: Wed,  4 Feb 2026 14:23:11 +0000
Message-ID: <20260204142320.103184-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204142320.103184-1-biju.das.jz@bp.renesas.com>
References: <20260204142320.103184-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27886-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EA7C8E7106
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of IRQs in RZ/G2L and RZ/G3L SoC are different.
Introduce struct rzg2l_hw_info to handle the hardware differences and
replace the macro IRQC_NUM_IRQ with num_irq variable in struct
rzg2l_hw_info.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


