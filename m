Return-Path: <linux-renesas-soc+bounces-30284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JxAOiw3xGnkxQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:27:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A9B32B3CF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C1C2302086C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143BF35F190;
	Wed, 25 Mar 2026 19:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cpi9cEhR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7166A3A785D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 19:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466708; cv=none; b=oiqVYBrt4lYrdBzVNyj/xnXRIOCua3R8wKSPh78W5NEw2lrf18fkDjUweSvGbrDKFKZQjKMI3G0MkBx1Wpv5h/m/utvWyouHWVGV29Ke4zngYYYNg0cFY+eqImONR5h47yrCphjKAKxKVIDevbFxth8Ee3s4uI7wdYNqvbXGado=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466708; c=relaxed/simple;
	bh=/VSMuWN9Mwsz4XXd5ynJfI8giPIJmU4aZ2YqAwnZRmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FP/SZttXBjWxiP9YhnFQZ+fTZDth8YslWfhl/NwSLICAq/fZKUF2UjqBt7L5+5+ylBieCdbD3wI5mPooBaxwHL0tAvAfogtptc6n/1fkHI+EF5HVyQWZqqmXsAgKRADG0DOqou7NJJMgTCk9k1Ugq10txdd1/KvClAQaTVKR1T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cpi9cEhR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so2086775e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466705; x=1775071505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECSVs8rxLOBS5HhR0ryQNWfNFa3hfvRotJ0eLhtmy8I=;
        b=Cpi9cEhR43VoCe0ZcMpE2Do1coLdkkXAGY/9KIEOLkdM7F1krnhfD7sCa+q/PGS9lZ
         rhxKOxHkpedApfil/Kvyx0A/AkhI5NF4x03ZdPxWJcBnu7y1C8E6ECN5T/ebpSUzoe5o
         pSH8dP1X/O30hSCqgupRR83hVnvKgC5EP8KTz7qrrBQj3cUk9hTU2SSWN0J75nrlep9e
         uBc77ZQf0Cvu6pKdM+rFBoZJ6YkyMFMAMjoekPvpn7g/QJnM3ztP5RLeRA7praQuPzhI
         ci1r9U4aXS6yLCRniuBh75QgdVP/5TvwCvcrNrrNJ9dg8DcnDqTB12hRAKKklT2gnzMx
         JZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466705; x=1775071505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ECSVs8rxLOBS5HhR0ryQNWfNFa3hfvRotJ0eLhtmy8I=;
        b=SxDvyW7ziGGer1W/74aENSh83OHAyQ5P5mSh0GwlZNquOf0FDrMPVMxnqmgmeCs+7E
         TiyaT+/6t364g0CZaXcFs3IUASG0Gd32zgPfAs+SuZKZ0rfxZZ5v7kLyklD7hPlA24Om
         SII46FWLO5wR232q4P9Ec3WSzwgizz5uAZTYA6diGpDeWzZ9l4s1Offi0QD2ulwYW31U
         Rh7MZGIjGX2vTYlhd3L9op6P19vHMG1Nhdxwc1sjHMsngmCXK2NTTZ5LbwPar+ZCFmLd
         R7/oMQgnUy82ikfi51evz1lHimjOkzx4vyHQACEC34h3rrVlCre+iU6h9ItEf6Cr9DuZ
         wN5w==
X-Forwarded-Encrypted: i=1; AJvYcCXhRSMbLZsJ/4CAy32kX1kkeVQ+wSOC77AOtSz4+c+zCr18B8LavTrHxMC/ZfZIegGSKAL3qu0dIskEVNBwFGdksg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP0pZEFib0/r3EPl79b8dFovP8hElKcLZpJbhNdqReDCi1t7Te
	GikD+byjIRscJ68fSltOigecw4VM2GrVv/rn9vgjzpAQz1Yym8HpW20f
X-Gm-Gg: ATEYQzxC6xFscncfCdAAnb/p4WXAQlbAcqL9c1fjuS9Pafpd4rYxlOKvdjm5HhUkGZ/
	/70Nn24Ho+B+rCGxkX6fPTN82cVb9K5p353JYWsHXkC2QfzAdh85VbaaZtqunoNDApam0+JiBQf
	Er+coVsNNYd4CjesRr/8105Dq0nLIqblfDbGYyQgtS6pjNZzPiLZds67Rufvvxs2mzHsg4qWt4C
	BxW9R+Ngm9ADAFmyQthKQhqTXAveiTqpau8+kVoBuuEUT4B9zLB4F4O031VCZI8jkj8bXW/mbHj
	6Bkr/gEov5RHIDDWgfNUd8GIeaxm6hAOm0f/3OKQauNHE80ZOUET1gFY52Jjw8kA1KDykAzeRmU
	6A4RmUaXPXiBdkU6AMQE72GgY9ZAfnNK958eywLh8GR6eI12dpv3KbQCk8PzQRcTMT5zjjFhcO9
	LI42BrhaNrj26ul7GTssf35/LjAqW9Hci2jp1yHbeZ3yUNfS0E
X-Received: by 2002:a05:600c:3b16:b0:487:12c:e7e1 with SMTP id 5b1f17b1804b1-48715fcfb24mr67295285e9.11.1774466704754;
        Wed, 25 Mar 2026 12:25:04 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:25:04 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 12/16] irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macro
Date: Wed, 25 Mar 2026 19:24:27 +0000
Message-ID: <20260325192451.172562-13-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30284-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: A1A9B32B3CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of interrupts in RZ/G2L and RZ/G3L SoC are different.
Introduce struct rzg2l_hw_info to handle the hardware differences and
replace the macro IRQC_NUM_IRQ with num_irq variable in struct
rzg2l_hw_info.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change.
v5->v6:
 * No change.
v4->v5:
 * Dropped the hw_irq range check involving info.num_irq
v3->v4:
 * Updated commit description IRQs->interrupts
 * Replaced the variable type for num_irq in struct rzg2l_hw_info from
   u8->unsigned int
 * Replaced the pointer variable info from irqc_priv and instead embed a
   struct hwinfo into irqc_priv and copy the data into it at probe time.
 * Replaced the check 'hwirq > (priv->info->num_irq - 1)' with
   hwirq >= priv->info.num_irq
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 34 ++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 9fc90f894630..2b7a70bdcba1 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -24,7 +24,6 @@
 #define IRQC_IRQ_COUNT			8
 #define IRQC_TINT_START			(IRQC_IRQ_START + IRQC_IRQ_COUNT)
 #define IRQC_TINT_COUNT			32
-#define IRQC_NUM_IRQ			(IRQC_TINT_START + IRQC_TINT_COUNT)
 
 #define ISCR				0x10
 #define IITSR				0x14
@@ -68,6 +67,14 @@ struct rzg2l_irqc_reg_cache {
 	u32	titsr[2];
 };
 
+/**
+ * struct rzg2l_hw_info - Interrupt Control Unit controller hardware info structure.
+ * @num_irq:		Total Number of interrupts
+ */
+struct rzg2l_hw_info {
+	unsigned int	num_irq;
+};
+
 /**
  * struct rzg2l_irqc_priv - IRQ controller private data structure
  * @base:	Controller's base address
@@ -75,6 +82,7 @@ struct rzg2l_irqc_reg_cache {
  * @tint_chip:	Pointer to struct irq_chip for tint
  * @fwspec:	IRQ firmware specific data
  * @lock:	Lock to serialize access to hardware registers
+ * @info:	Hardware specific data
  * @cache:	Registers cache for suspend/resume
  */
 static struct rzg2l_irqc_priv {
@@ -83,6 +91,7 @@ static struct rzg2l_irqc_priv {
 	const struct irq_chip		*tint_chip;
 	struct irq_fwspec		*fwspec;
 	raw_spinlock_t			lock;
+	struct rzg2l_hw_info		info;
 	struct rzg2l_irqc_reg_cache	cache;
 } *rzg2l_irqc_data;
 
@@ -573,7 +582,7 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 		chip = priv->irq_chip;
 	}
 
-	if (hwirq > (IRQC_NUM_IRQ - 1))
+	if (hwirq >= priv->info.num_irq)
 		return -EINVAL;
 
 	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, chip, (void *)(uintptr_t)tint);
@@ -596,7 +605,7 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2l_irqc_priv *priv,
 	unsigned int i;
 	int ret;
 
-	for (i = 0; i < IRQC_NUM_IRQ; i++) {
+	for (i = 0; i < priv->info.num_irq; i++) {
 		ret = of_irq_parse_one(np, i, &map);
 		if (ret)
 			return ret;
@@ -609,7 +618,8 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2l_irqc_priv *priv,
 
 static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_node *parent,
 				   const struct irq_chip *irq_chip,
-				   const struct irq_chip *tint_chip)
+				   const struct irq_chip *tint_chip,
+				   const struct rzg2l_hw_info info)
 {
 	struct irq_domain *irq_domain, *parent_domain;
 	struct device_node *node = pdev->dev.of_node;
@@ -632,7 +642,9 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 	if (IS_ERR(rzg2l_irqc_data->base))
 		return PTR_ERR(rzg2l_irqc_data->base);
 
-	rzg2l_irqc_data->fwspec = devm_kcalloc(&pdev->dev, IRQC_NUM_IRQ,
+	rzg2l_irqc_data->info = info;
+
+	rzg2l_irqc_data->fwspec = devm_kcalloc(&pdev->dev, info.num_irq,
 					       sizeof(*rzg2l_irqc_data->fwspec), GFP_KERNEL);
 	if (!rzg2l_irqc_data->fwspec)
 		return -ENOMEM;
@@ -657,7 +669,7 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 
 	raw_spin_lock_init(&rzg2l_irqc_data->lock);
 
-	irq_domain = irq_domain_create_hierarchy(parent_domain, 0, IRQC_NUM_IRQ, dev_fwnode(dev),
+	irq_domain = irq_domain_create_hierarchy(parent_domain, 0, info.num_irq, dev_fwnode(dev),
 						 &rzg2l_irqc_domain_ops, rzg2l_irqc_data);
 	if (!irq_domain) {
 		pm_runtime_put_sync(dev);
@@ -669,14 +681,20 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 	return 0;
 }
 
+static const struct rzg2l_hw_info rzg2l_hw_params = {
+	.num_irq	= IRQC_IRQ_START + IRQC_IRQ_COUNT + IRQC_TINT_COUNT,
+};
+
 static int rzg2l_irqc_probe(struct platform_device *pdev, struct device_node *parent)
 {
-	return rzg2l_irqc_common_probe(pdev, parent, &rzg2l_irqc_irq_chip, &rzg2l_irqc_tint_chip);
+	return rzg2l_irqc_common_probe(pdev, parent, &rzg2l_irqc_irq_chip, &rzg2l_irqc_tint_chip,
+				       rzg2l_hw_params);
 }
 
 static int rzfive_irqc_probe(struct platform_device *pdev, struct device_node *parent)
 {
-	return rzg2l_irqc_common_probe(pdev, parent, &rzfive_irqc_irq_chip, &rzfive_irqc_tint_chip);
+	return rzg2l_irqc_common_probe(pdev, parent, &rzfive_irqc_irq_chip, &rzfive_irqc_tint_chip,
+				       rzg2l_hw_params);
 }
 
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzg2l_irqc)
-- 
2.43.0


