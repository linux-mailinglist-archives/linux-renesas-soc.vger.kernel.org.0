Return-Path: <linux-renesas-soc+bounces-30070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2L3nMWDhv2ml9wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:32:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D32A2E9393
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04285305561D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 12:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5BAD381AE1;
	Sun, 22 Mar 2026 12:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3RaAfoF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044013822A7
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 12:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182277; cv=none; b=r5rSTlsTmYkus3sENJRinmuWCYrphPrAkTyWSHZVRBrHgzfvu1BztSyhR0BzP5s+lwS2dtTKa4wb2yX9VvW9bP7hWP1DlJzLMek22HK0DziOP7N6S1Ny1rIAOPwLUyecmVT4T81zjIwIVtpoKWDPDRsjrG5E8ALMrz912HTBqs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182277; c=relaxed/simple;
	bh=jASfw8kdvkhMmRdlkZJdcEhZhf/cDrLIXPMn03ZcID4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MFWFAgHh/8XAFnGqGuu0c+MQTaKw2Fff+OewIF2GlbRuHD/YC4IkEkOUfEeTYgeDpbh2bHlxBxc5Vo3SpxpulnNoHQ7akLOgT3isUMyXZ2IMh7ZbDrbaBj3x4/SpZBGCJd0devQEE2d0efFp6934BVOjOodf7hXcUmrspGVuw7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3RaAfoF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b4d734678so3373602f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 05:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774182274; x=1774787074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTOjP4wKgm+X9lCwgxDRiFdjvNAMY5QZsLvZtT22qWI=;
        b=d3RaAfoF6GJXhcObUNafeCIFzycM061/BVKzL2g5gZaWIzFzcKX8GedjECsgkvFzZI
         jCFzIWf7CxcbLlJFasTCo2ldTOMLBMR9fboSzc9aIS+0aVzM23pv1DNDECoPXs658AV5
         maLZqXGyy5Vsm1PwpXU+ReB/th13L2ksLFjfpdxh7HXwYPcvGJx32tYkxIRSZB9XPEpR
         dwkEQ0J9tE0ISJl/c+Zw8u7aEKXk1UcbBWe9+1ExPQavBoj8fEwJL1YC/GLDIzwpioVO
         C3dU8y2qZJktxrP8fLIbto49mGGRkrXQwottGTa1/HYr4jEkdaOp4od3Gk2Ke3QBe3H5
         iJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774182274; x=1774787074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WTOjP4wKgm+X9lCwgxDRiFdjvNAMY5QZsLvZtT22qWI=;
        b=l3XfRpC4VWMA0+HZbM1WEgpIcC9pNhlsSkJhTtDpn0NqlfwuIrnq5W4oCPLghEcZNF
         GceI2PBAch3VXgD1eojC5z1XUZ8yABWPkmBtxiuqLyt3tVOXg5ttbikw95khGMoU8cuf
         6CHukzqT7lOw8v4BqsHGOcneOjvO/EgE52GSEpBs6to8di7CxkCpuqsH5RunX5vc/KdE
         U5K4TM7vPQeVT/xYbIHpTBylAbSU6qHz5ceLWwLrFEBNCqchtHq4DT5J8+nu0+fcOLaK
         BXD5cJzTVhkWhFSEsVwpdLoAW9o/3J35/82a10XIxzqB3lGcHFh1qLvDmobxi2IG4fsv
         Idfg==
X-Forwarded-Encrypted: i=1; AJvYcCWmcur+Xa6Kg0kT0wlUf/tmoKTyp6QA3MqXVVqAZURDhIYV3BXTyFNcjwshitHYqZXN/t9dSGVcL4NPen57kLmN6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9vhJI0D1gfAEKl7E5OfWfJLB5mifBPfEZWRz6iOqDnJ7eVJO2
	+3XEVa/MTih0ZGqSviUajTQ0bXpPlx1hAAN5zzPYrufU4qq5GcvB0HGC
X-Gm-Gg: ATEYQzwML/xXhmaFRLi2jLLue3roEMtI33OnIletqo5JuujdxwgT2nzAZKxRIY3kgCu
	bepO6aG16mYpil8MLC/Va9lrj8PcoK651o7jlbmqyfXuuZvZyDdWL9b/bqZVc/4X1ux2tm3En8C
	WHA1Ed/aP12bewHlXV+HTtsj1a/gn5Judt46K5KSXKKeDcs2XQleKf8lPhU8AebJWtSPWiw+aq+
	cLDz+JUb7T5lahFOtSvpSmoBN4KYsUnntvQZU7VrvqDrSiB3sw33Z5dqIfIHbYbFk1YMDoQCO5i
	1KT/nkYTkhTYXmORzFytHZRtOiAZukYdj9Fl8DmyV3WRuKPIaWPA51j4N7IHUCzS2ZORhEXzwfe
	Y5mRua1WMCTwIvwats4lce7ehSaBNHCC5lOToRQoAinWV6nGVz7TiKdbsrFbjRlZw0UOgJBBHon
	sTXU2Tb3MRgoXOat6EBFRvf+mwlLYa9SuAVdI/YQwmZ5RZ+149agWPVOYkkdw=
X-Received: by 2002:a05:6000:4287:b0:439:b1d8:6091 with SMTP id ffacd0b85a97d-43b64234854mr14039364f8f.1.1774182274324;
        Sun, 22 Mar 2026 05:24:34 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1bdc:7f84:18bc:1e56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm21072695f8f.19.2026.03.22.05.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:24:33 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 11/15] irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macro
Date: Sun, 22 Mar 2026 12:23:54 +0000
Message-ID: <20260322122421.132474-12-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-30070-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 4D32A2E9393
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of interrupts in RZ/G2L and RZ/G3L SoC are different.
Introduce struct rzg2l_hw_info to handle the hardware differences and
replace the macro IRQC_NUM_IRQ with num_irq variable in struct
rzg2l_hw_info.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
index cf0d45c40083..5a21bca91e4e 100644
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
 		pm_runtime_put(dev);
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


