Return-Path: <linux-renesas-soc+bounces-30064-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLprCWrgv2ml9wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30064-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:28:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C4A2E9324
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D47383035D49
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 12:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D443806BE;
	Sun, 22 Mar 2026 12:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOvc/7LN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BBD3806A8
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 12:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182272; cv=none; b=uqdqZNmNsZaCeXBvyYNLmKRNTe9bMwnFqQpCD2xiwGtJc9GFYfxX0tBp0aCyB8KvPo1I5dV87jWIk4O6TxvBWoALrMSsZKvTTbY+r54lOoUfA1Q4CiBgHM6fVf+1cIEhc1d3EpfYma7ZUOuZhyLG7G3lphCROX7fZ1plOPf9Bz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182272; c=relaxed/simple;
	bh=V3170Kcxf+SwGKUeN/ScFDYmS/C0wM7P/06+kYpoLP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VkYi0sCTglnQ52pt+H8Ru8JclNHUM6fFLYszgCYyW+jx1vlYT3h5OACdfcsyf/+owSQM7jJGjJLC+kdtkW7BNUKV1+4jq+puMcYgwzMAFQFfui7R4yCPEJexCEcb9XL3SpjmGa/4eQGGrTlj5WI3l+JxnzZBJklTULq845EQcA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOvc/7LN; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439c56e822eso3354072f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 05:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774182268; x=1774787068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Bx5j4FaZKX5iw5JrPcGDY49H4qgRYZDbXdV3Cc+dJs=;
        b=WOvc/7LN3B8g71UjAFWiSHaOcwx5kxIbOonChX/xa1Rtlz6rH5InT++8uOtZN6YGtj
         KOW1w56U52xM3tHljwecBhlmVyzHhgxgwXVi8hokXEOxJttmFR6CZK12flvHfWQR6iez
         ySxp4WhB5k6+F/BWHAvn4+PYExBOKLqxo51VIxnNyV1bUa5QPFGMYZVC8BIcfwltbdV9
         O5yo+ONts6n7uiH9C1YafSMQ2zBov/i5/qhhPNrZJb8zl2/VRNbjOsWUWdMMZwoARdNv
         o26ATgoJJgBnzAtHJEly8+8uS3x971+8P070HuLd0Mn/rPR90ijGued1vjI1ulTyE8m6
         y5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774182268; x=1774787068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Bx5j4FaZKX5iw5JrPcGDY49H4qgRYZDbXdV3Cc+dJs=;
        b=qE+SN4ZVMcdoWUyHBxX7UTuHHMu06cQIkdo674sOjel2Se7STDFk7HseQYWmJE3nZD
         DYYUko3/he0arerUUrdR0c5vUiJs5gxHcozwqFjpA3Rm5BXkbKkGdBQxJjHyue8/n/TU
         4LT6W2ppY+3Nv4lGUPfKOgnoCDbQSB9lRUlnh95K3m2cMT10JMcgX/m/vt9BwXiuFGQd
         7kNMJtm//EUsSow9z6reAQ+i7Pvh7XglyCajXoh9ivncykJ1AlCRyYyckocy9FvCHhWd
         b8zwhXvcxiVstOOS9FKlTrCYflqa0jrdXlCi2XpZGAd6GzwQwZ4qoPGNkrJLP5O/6Z9L
         cBpA==
X-Forwarded-Encrypted: i=1; AJvYcCV68Ce3M7zL4eYAJeeouC+dogiXFGP55KwdB6Nz25lGfw0Zu8E1gdrR4esJ3B85UOn8SKO808omIVAt3flB8MeDgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaAxQd2gMQny2lY3/YAc3StAc2k+YBCZmxey/4RpoUfwyuoovP
	XcF6Ql+K9VwN7gN0ik9vylJcNKzS1UPfesSo4Fib+tM4vWfGnEQhuKYQjYiLRg==
X-Gm-Gg: ATEYQzx4xowYeHDPkNQ5jPgzuZrIyAccU1wNKmqMOpT8iMYtnEZSKqBJgqVrZCFplBu
	JxDtYcaN7I892RwuZTfuCTPZU0zyAFOg1gtbPnanFo1z2j+KiHU/JemMReH3jpnEcIKDV0yxa4k
	yCbkf1vrnSyMTOb4LZ9rmgR6hWpzzCSNLKTsH/45WLuEfDaYiHpgmmw0vpavehUMVumA/D+GkHB
	YgsGk2Oo4B8zOM/79pEmXW9goUjQ96J/GYedwARHo7o29XMzmP31pLj+OI6y9qL8eADzFZ9v2FX
	uYtfNYKs/gO9pAPeM+ds58+uNu1GT9AY4I4MF7fXfhCnpIlCnZ1kJIFVnxhd6DGGG120VWPtZYg
	Cs7eVw01drp+SRXm3VIgnoWZnZ8Z9aX0ipSN06wbtd19MxRgN0vSnQ/WHiYia2JmOFkyLQhOaut
	l6xew2FUbfstufo9aiwMXIe8T5guBv7uTE3B0TDtLbXeZ8KCbK
X-Received: by 2002:a05:6000:250e:b0:43b:4dd4:6856 with SMTP id ffacd0b85a97d-43b64238854mr15485470f8f.8.1774182268067;
        Sun, 22 Mar 2026 05:24:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1bdc:7f84:18bc:1e56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm21072695f8f.19.2026.03.22.05.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:24:27 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 04/15] irqchip/renesas-rzg2l: Replace single irq_chip with per-region irq_chip instances
Date: Sun, 22 Mar 2026 12:23:47 +0000
Message-ID: <20260322122421.132474-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
References: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30064-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: A9C4A2E9324
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
v5->v6:
 * No change.
v5:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 61 ++++++++++++++++++++++++-----
 1 file changed, 51 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index ed8044b0a339..a0f03f81d5ef 100644
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


