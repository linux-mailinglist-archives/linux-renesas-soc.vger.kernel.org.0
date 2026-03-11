Return-Path: <linux-renesas-soc+bounces-29246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9vuCKqvBsWmdFAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:25:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60243269448
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B724F304A8A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 19:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7E23CF032;
	Wed, 11 Mar 2026 19:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ag6Dy0Wv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E579631A07F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 19:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257109; cv=none; b=ZKiEDUD4en7U0W9peqbeozIeDvIsa9b2l2p5qwhnm5k5xvWMo5Y/tZCFxDoqOh12vyoU6RtHyKRrncv03hiGwNDUqwknbpgPdaUrb8E1hIEXuQV2K0HkDDIz1KOCLq0NCu0n3cGmL9PGpdcDfIcFsUc+NRJoWTXQPO3ivBO9Jsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257109; c=relaxed/simple;
	bh=2E6jMa7ABsxErVDYefKJecluauKc2OSpEoG3VqKGCm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fjy+ZhtIijHP+z3LAhWbPR5QjMb4cPiTsZmCzj/wkfaAqvW0aOBYCeObn6QDZDfpase5Ior1/I0/d+HGdqrYPVhHuUSVYVqV8yDRelu/eRtJ8gg1CcGzox9tRtXpS/MqxTiyYQC2ObqESc5nj8lKpYgjs7G1wrEHyY6HztRO7/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ag6Dy0Wv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439ac15f35fso217565f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 12:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773257105; x=1773861905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43m+t9jWY/9aRGNctYAYIHzG3/TvbD02Kz/mm0ecsjM=;
        b=ag6Dy0WvDAofOFfNDWgnvGt1StzRKBLc+FBmFDkx5RwB+HywLy3GemogQdKuyKyFpI
         4ORGJ7nuL/w4NVpZwY1ua5LL16GlBz0M6Ut+YNok+mBgziGk4N1poBTsvPT6uluI8AHh
         8++I20Bs/9SZCIQMlnE9AM31dX0ZX/aKHUljZjAjzUs6DnUcrGXzdqx+nolrNolc21Gm
         HHXXTizfQAq1+ff/WdLkZeKZZ6rBbep0bJljZcmL1YTA+KGxCaXJGxtURrW6IxiyNSnw
         PBRI6ZT3mH6Z0r3hiJWMdQGuGdoKxlMfJUaAXrH32ea1Tl7Hlu4IYPZGB7Ny2lgOxQrY
         wN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257105; x=1773861905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=43m+t9jWY/9aRGNctYAYIHzG3/TvbD02Kz/mm0ecsjM=;
        b=oC5pQoxIZzVEDojVcZB0D7X/dEwEcyEOazKD0Qcfp320gZ+QpROfDL3jrDTtDAkb6A
         lbZfu9JLWEv32rxGlP8bn/e/5XnpGJeuejbT44oRj74odw1zc4DClSM2iFPylCztxCxN
         bvfUHQ7wmqhDGT5E1iVH5FKebZZplwrblGv96UUw2yxHaGGNZ+c+P1mHvpLZJoW6EUBz
         /HFUzjhjrWOuPTocA1jdHqXxMdKsTONkCVowfPxB5bWEYdOTlWWGnUJVDy695CtFrY9M
         /v9YOnKadirFVTOxLxsvAXDh+CGptrm8iK0hnOs3q2usubFJ+edfiBOA0oR8PlfIZ8vO
         PsBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh+wLu0fN3mzWsYh9rkGOCNq/VN0/XOjuZk+2sXVmNypSXxwUFovBZxlc2MphQ/fcruwyLzRrfF4Ml59+iqyPz8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCq3hYxJgpjvaDKSL8ZPBDZhL/N1Ap33YfSDW8dYWsjIVh5Eaf
	vZvWXHopf1kaoo18G1+6QZ9Oto252NuV/rgRA7R6vpekgwcYVaok5XZ4
X-Gm-Gg: ATEYQzy3U0VVQXDpNaJX6DiiTB4nR/By+c6aPvq2+MJETm4x5J1KEzRoQA7unlxq3GF
	5HtS2joCHh8N3ObTklOONVgwEyFoWuh85f0MYk7C4fXnkRL80lVVHJ33vFgjGMr3J1YOBFXmNEI
	E2XXj3ZQNgaB628C3l17BlYU/g7z5qdI7UrS0jxPMt2p1ggcr52h75EJX7tifhnpAX1uyk76Zk/
	oOY3dBu7cyWoDttZX7eh9D/Ltw6kGhzFCKZ/aiKEi0wYFkfJIYzQp5flH1t6s8X4vnCj7OJPCqP
	jsawZNHxfizdZV8USGqYfTZl7d/U09hLDWF9UpWXh0hi5GUKRPUhVCDRD+tFB4r0e9sw8ACYZBT
	DX3ZW4oN2oM8gsd45fUH56Zuqmr9tcfNUkxTi0ydVF6c1Bhixp48dSpAblWOolfMG84ldW5N88T
	joFRulTadxJtVSumRa/HLaLzm6IcQ0MWpHUkz4zvxEpHqlqKMRdXGrQseNpfc=
X-Received: by 2002:a05:6000:1863:b0:439:c510:f97a with SMTP id ffacd0b85a97d-439f8439cafmr7103472f8f.48.1773257105096;
        Wed, 11 Mar 2026 12:25:05 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:38b7:8ca3:cb55:d344])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm1323210f8f.21.2026.03.11.12.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:25:04 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 04/15] irqchip/renesas-rzg2l: Replace single irq_chip with per-region irq_chip instances
Date: Wed, 11 Mar 2026 19:24:35 +0000
Message-ID: <20260311192459.609064-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29246-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 60243269448
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


