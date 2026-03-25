Return-Path: <linux-renesas-soc+bounces-30277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKvEBfo2xGnkxQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:26:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AB632B343
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BB68A3031D63
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667093D524D;
	Wed, 25 Mar 2026 19:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="angQLEkK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8907238D6A9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 19:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466702; cv=none; b=JWeW9Vd1dNkMvfaZfPQGmkbnaufAI7KBLecNQK+CSozPSkNa4GxBmMQQ9z7QgFaZ9nAaU2OyOF5I/JeDlc1Yoivi6+4aaKmoitDmA4fk0JB2rOXvk7YJEMsTLeDOExGl2JVE/fn6k5uRZm11HpV0RlTv7rJjBpAoCr1hGqnkR2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466702; c=relaxed/simple;
	bh=TBAyoHYcg9szQDKjuRXs4MLswJOF/ifY/+cc2oxvTVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N86fmrJt5hxcUVjNkNXyz+PhnqXxLXeKrPunw+fQM5jtA278TljMP08jBZb1lVQyuo+2ZXhAmju7Dq7siYKgyhvza7elvB3JTSgc/6MPxNGl/4RHGNWiml539o62V7pe/xcs2sMaUxPMRBvgqs5IoAwbyp9y18sIsK2TgCOHk84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=angQLEkK; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b41b545d9so154124f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466699; x=1775071499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qb3Fw2ZUR/5V86uQf7OFMn0yo1Xhu5r3j6ypekd2sas=;
        b=angQLEkK1gdQEI67nVtSrksC2ik5beFL13VQSKRq4BeMSs9MyZikaS7bTLZXS/34pt
         pqme8oIZWdovGh76A/LMNO9Dd6u0Ja/jSJfRDlK82bYEhkP037AgXL9iBbceLq81Vce6
         kbT2iu/uCyLhvb6MCYbUC2Gu+Jk9AClR8kHZ/obCbZOQ3VvuDt1Bn8H+Oqqvkqu8UDpO
         xAM8zgdSAhWa7NTbTD/aU1H5HbO0zOy4TP+hprctX+iaOguijZUPxwZW6egTfHpXeb/g
         15Fa7Nl/qrEGSGEd8o/ydYdr/c1dEavWIPPvL6+Q/UosQuH+PIjv96JYsAfhyV+PEx8B
         6jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466699; x=1775071499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qb3Fw2ZUR/5V86uQf7OFMn0yo1Xhu5r3j6ypekd2sas=;
        b=Pqgqmyk8PuIXTdrGH8DVyYy6t/CoCS7o5Z6w5aWOnYs+GIZaoFBpdBsaRBAPeWvgy/
         HliVQ/aT6KlsJxlc7zGA5pQubEyKc7+X2GU2flxTZMef4/xPdhvDoykUIc8fCi2npVGN
         zmn7lt4ZCPXslcO33fdM/T8c8Ti3mK417F5acHtY8tAQ3TwTkfoTHmu9LBV7f56fzN8Z
         P/1h4GKmeQKRWcHTzV6KZlSmyePxmytCZYBS1a+KgoG8wLaycj0kudYTaWLac6fUegqp
         0sf8j/7lriRFBHQSl6mFf9H7/HlIPF0Q54Ujudp494jUf4CDCBw/OI/zKBq7fSiNZZf6
         eX2A==
X-Forwarded-Encrypted: i=1; AJvYcCUi3LusiME5leCtsREsWjLid/eFa/2AnWJ3wt+85yWhdnbFOcAaMTlrh8bhrFgjtmTKikA/yYs28/r/U1QoOua3Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmA7t4XcyXcTBsQxG4T+cTyAEV7kFMlXDKtKdCd9urcFGJHi61
	cIlsq7OVYNDESJXWepqqvkcDNKVgbEM8as2akNOpyvM2AleIEtRfgV1Y
X-Gm-Gg: ATEYQzwuCnRX44mdr+O2JgxOAH7fRRuqFuvfl1y0MCdoOR8kbdALdUqg7o7LXOLkOa1
	qdgX0f6R6wtnHelCSouUG1v70yPGWtmD6kQxy9e7x2qrpc83ZV2SGtxoYahjneVS4BurRkfO2NG
	uOxbCMh4mDOq2SSJoMPUWrTohymX45bICHBFctBN2npJitAnmwLsVL+1VyHck2bRiXtLoTFdPop
	xnlgZ+lFhgQnRxCVwqck4stCN9bdQlSIws3OSVBi0KqCa93QRqBlTwE99ZKHmeT3vNmXnRNhA81
	xOfbZdLaKc1Znn08+kLVfu9VeRtTg7u6XECctKKpzDRgUhi0zVn6FxqfRir9q/5PHHFdXPfpCNF
	tjt5FrhAKncZtlWzcmElznrarGqYCHZsFXAA5SESl9/Z+bOPLFTbwSgwTHLgg5XcJuexmodxsvc
	BDiLOHTDDuAn2DFotj0OiF2ssH52S29aOoXRlK27agAFfUYnH0
X-Received: by 2002:a5d:5d85:0:b0:43b:54c9:7d1b with SMTP id ffacd0b85a97d-43b88a1acccmr7512385f8f.41.1774466698777;
        Wed, 25 Mar 2026 12:24:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:24:58 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 05/16] irqchip/renesas-rzg2l: Replace single irq_chip with per-region irq_chip instances
Date: Wed, 25 Mar 2026 19:24:20 +0000
Message-ID: <20260325192451.172562-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
References: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30277-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 18AB632B343
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The driver previously used a single irq_chip instance shared across all
interrupt types, relying on dispatcher callbacks to differentiate between
IRQ and TINT regions at runtime.

Replace the per-SoC irq_chip and its dispatcher callbacks with
dedicated irq_chip instances for each interrupt region: IRQ and
TINT. Subsequent patches will add per-region callbacks for IRQ and
TINT from the common code.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change.
v5->v6:
 * No change.
v5:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 61 ++++++++++++++++++++++++-----
 1 file changed, 51 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 8587d4c5f110..1d1df4953368 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -71,14 +71,16 @@ struct rzg2l_irqc_reg_cache {
 /**
  * struct rzg2l_irqc_priv - IRQ controller private data structure
  * @base:	Controller's base address
- * @irqchip:	Pointer to struct irq_chip
+ * @irq_chip:	Pointer to struct irq_chip for irq
+ * @tint_chip:	Pointer to struct irq_chip for tint
  * @fwspec:	IRQ firmware specific data
  * @lock:	Lock to serialize access to hardware registers
  * @cache:	Registers cache for suspend/resume
  */
 static struct rzg2l_irqc_priv {
 	void __iomem			*base;
-	const struct irq_chip		*irqchip;
+	const struct irq_chip		*irq_chip;
+	const struct irq_chip		*tint_chip;
 	struct irq_fwspec		fwspec[IRQC_NUM_IRQ];
 	raw_spinlock_t			lock;
 	struct rzg2l_irqc_reg_cache	cache;
@@ -434,7 +436,7 @@ static struct syscore rzg2l_irqc_syscore = {
 	.ops = &rzg2l_irqc_syscore_ops,
 };
 
-static const struct irq_chip rzg2l_irqc_chip = {
+static const struct irq_chip rzg2l_irqc_irq_chip = {
 	.name			= "rzg2l-irqc",
 	.irq_eoi		= rzg2l_irqc_eoi,
 	.irq_mask		= irq_chip_mask_parent,
@@ -451,7 +453,41 @@ static const struct irq_chip rzg2l_irqc_chip = {
 				  IRQCHIP_SKIP_SET_WAKE,
 };
 
-static const struct irq_chip rzfive_irqc_chip = {
+static const struct irq_chip rzg2l_irqc_tint_chip = {
+	.name			= "rzg2l-irqc",
+	.irq_eoi		= rzg2l_irqc_eoi,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_disable		= rzg2l_irqc_irq_disable,
+	.irq_enable		= rzg2l_irqc_irq_enable,
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
+static const struct irq_chip rzfive_irqc_irq_chip = {
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
+static const struct irq_chip rzfive_irqc_tint_chip = {
 	.name			= "rzfive-irqc",
 	.irq_eoi		= rzg2l_irqc_eoi,
 	.irq_mask		= rzfive_irqc_mask,
@@ -472,6 +508,7 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 			    unsigned int nr_irqs, void *arg)
 {
 	struct rzg2l_irqc_priv *priv = domain->host_data;
+	const struct irq_chip *chip;
 	unsigned long tint = 0;
 	irq_hw_number_t hwirq;
 	unsigned int type;
@@ -491,13 +528,15 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 	if (hwirq > IRQC_IRQ_COUNT) {
 		tint = TINT_EXTRACT_GPIOINT(hwirq);
 		hwirq = TINT_EXTRACT_HWIRQ(hwirq);
+		chip = priv->tint_chip;
+	} else {
+		chip = priv->irq_chip;
 	}
 
 	if (hwirq > (IRQC_NUM_IRQ - 1))
 		return -EINVAL;
 
-	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, priv->irqchip,
-					    (void *)(uintptr_t)tint);
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, chip, (void *)(uintptr_t)tint);
 	if (ret)
 		return ret;
 
@@ -529,7 +568,8 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2l_irqc_priv *priv,
 }
 
 static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_node *parent,
-				   const struct irq_chip *irq_chip)
+				   const struct irq_chip *irq_chip,
+				   const struct irq_chip *tint_chip)
 {
 	struct irq_domain *irq_domain, *parent_domain;
 	struct device_node *node = pdev->dev.of_node;
@@ -545,7 +585,8 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 	if (!rzg2l_irqc_data)
 		return -ENOMEM;
 
-	rzg2l_irqc_data->irqchip = irq_chip;
+	rzg2l_irqc_data->irq_chip = irq_chip;
+	rzg2l_irqc_data->tint_chip = tint_chip;
 
 	rzg2l_irqc_data->base = devm_of_iomap(dev, dev->of_node, 0, NULL);
 	if (IS_ERR(rzg2l_irqc_data->base))
@@ -585,12 +626,12 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 
 static int rzg2l_irqc_probe(struct platform_device *pdev, struct device_node *parent)
 {
-	return rzg2l_irqc_common_probe(pdev, parent, &rzg2l_irqc_chip);
+	return rzg2l_irqc_common_probe(pdev, parent, &rzg2l_irqc_irq_chip, &rzg2l_irqc_tint_chip);
 }
 
 static int rzfive_irqc_probe(struct platform_device *pdev, struct device_node *parent)
 {
-	return rzg2l_irqc_common_probe(pdev, parent, &rzfive_irqc_chip);
+	return rzg2l_irqc_common_probe(pdev, parent, &rzfive_irqc_irq_chip, &rzfive_irqc_tint_chip);
 }
 
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzg2l_irqc)
-- 
2.43.0


