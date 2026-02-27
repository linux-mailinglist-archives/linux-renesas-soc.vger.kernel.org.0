Return-Path: <linux-renesas-soc+bounces-28533-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JXlBJSloWl/vQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28533-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:09:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CFC1B8671
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D9F43033386
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 14:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FAF438FF2;
	Fri, 27 Feb 2026 14:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NECgLFBH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EECD40B6F3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 14:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201007; cv=none; b=iqXvx326AF2C54qP4PqYSGWo/Lw7CuItp4r+hqQlJVJ8dmCXIeoxznGzC/NHQKxYUN3Yc7pl2QP0QMe27TZNmShkVYGWWecmphOLOQ9Zur7F4/Tq/7b0NzMGhhuFtFHtv3Q52bpnPWvLmmKyUquHhd/o38OWMZCycnVml286fHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201007; c=relaxed/simple;
	bh=JLbO7nrtSBUift2nVEJXrrhfQrzPc7khnz+/JaIykdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FEfN/wNGFezzDewejTcPUcYNYfULeyJaNk5h1aMUvpgVB4FNucZ06BmOiiydLrGizKr5kjcQk6kPR5UOlrtUQrfoon92wxGoDlkCmggkbXdxvWqH/jNFcgzCQRvgRrhbjX1VFQ0YKSr9ythuVUTTb7KN+ldgZPonQv26f5aZjII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NECgLFBH; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4398f9e3b40so2153267f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772201004; x=1772805804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYkO8MxlQEPV3kcnl5T84e14+1veD0w7RuMWCMjQrjk=;
        b=NECgLFBHnJDOXtSuPuu632ISLIEhk2qnAOHBe3KI3UWbGHh2yOm3lAXQprKekwQJ8H
         Yb6nq0s6AVVy9+8dIVpmOXieAQhlvrPDxvDLyKkvecFdSJV0wK0HmsVomGPaK6z63/LZ
         8TrpcQEpT8XxXNw5BMLknCi+pkwiKIDXXHOjyFPgRPrWMHe9P2gYcKARPAxm/KVjq7Bt
         n7PTxaiQmGS008GCQTMgFlPf9kZpHHWIiqy6hXcdOnHKE6ldT/hjjpZFExxq/w4QeAUe
         fDYCBS5SwUD9ePHGUyWcIE+0MOjZboZHl97roJLkZO+p9ZSA8vMZdjdSys7GqDvCmWM5
         sQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772201004; x=1772805804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zYkO8MxlQEPV3kcnl5T84e14+1veD0w7RuMWCMjQrjk=;
        b=TECZJByJ8ges9N2pETAIv2YDkrCc6RiTEL6c9WkFM84IOvd34/3w02LrRUg+5wKcmo
         hrUgPyOzaRSLsayxUUPnTe5waKOfWfqjVWc9NgtHAaaTUAefczP6+rInhLzyAMRGdLqv
         bGgze119Q2e/FHtnJIOfT76HalIEGSJH6puZe7v623XtmFmIRsjCh9J2cxoHjaR3kqx0
         sA7Md6vhz9Gms9TgTZ3KY0mOc1Fs5Qchx05pUHfujVYTf9CYG/qx29tZEox7e6ELu8fz
         HF5MWHBC9DrUDqfFlZdRiCoqv7BzLtsMxphsDN4HyK9nSt0A7y/80/CUx6prJRidxUCz
         IvVw==
X-Forwarded-Encrypted: i=1; AJvYcCU+GKJ+zHhhsZugYJfuHKbQDafpQrILylrwXe3DI4Eed/MoiIVNeC6MYPR6td9YqNugXF8BJEoWzfEWFeinfLIXGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfsdQEu/CbjGQ0k/JuFs0eUZztoG28RiQeO9Hmb3Hit51MfNV0
	Ipu6ahr0TbSeCCmDmx5kTWxUE0AwYj8NyYBi3IT7TJdEhN3XJxU20yvz
X-Gm-Gg: ATEYQzx7Uk7OMOst7eeo3OiK0bfmcco9ZFbqPVwN83K5x90YzNWdT7Sutr2WiN50Q30
	9yp1lgszDLnJLyR+9pRElify39UNo2VBdl3zDSbAMU4Vya0c2wa0GRyPuAb1pf2eTobZpgPkyyb
	bOjg/s3mo8QIefkvBU+H5PzU4+labO71FzYSYop2DexEJYFGROzR8pxJXQt2y9uyEbhZ4DDxxYp
	lmeMoRK38ZzH4phvorGDTdmXAERvmivIlHz3Hv0ycL6arvUOC9rsOgzSuqK7t4Q2PxarV5AdaRf
	JV3W2ut0TXeRoSEhze1Xck5ZW6VoZiThTBbEE4wU5jDiCkZfwzxybeNWbL2ocez8jnVBN5zi60l
	7QXTFfRmKi5FN1HUki6JteRMK1pewJee2uEsxJC3+Qx0izXEorg46NztDFbmK4xsmSU23SG22NC
	XiPVNETh+tasPMQSvaDMjw/4htvg2WWps=
X-Received: by 2002:a5d:5f54:0:b0:435:dbc4:3af0 with SMTP id ffacd0b85a97d-4399de14d57mr4960056f8f.14.1772201003661;
        Fri, 27 Feb 2026 06:03:23 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:4d8b:fefb:26cf:1906])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60feeesm7658811f8f.1.2026.02.27.06.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:03:22 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 4/9] irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macro
Date: Fri, 27 Feb 2026 14:03:04 +0000
Message-ID: <20260227140316.308106-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227140316.308106-1-biju.das.jz@bp.renesas.com>
References: <20260227140316.308106-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28533-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 70CFC1B8671
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of interrupts in RZ/G2L and RZ/G3L SoC are different.
Introduce struct rzg2l_hw_info to handle the hardware differences and
replace the macro IRQC_NUM_IRQ with num_irq variable in struct
rzg2l_hw_info.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
 drivers/irqchip/irq-renesas-rzg2l.c | 46 ++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 20e2b1c4587b..412273ae860f 100644
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
+	unsigned int	num_irq;
+};
+
 /**
  * struct rzg2l_irqc_priv - IRQ controller private data structure
  * @base:	Controller's base address
  * @irqchip:	Pointer to struct irq_chip
  * @fwspec:	IRQ firmware specific data
  * @lock:	Lock to serialize access to hardware registers
+ * @info:	Hardware specific data
  * @cache:	Registers cache for suspend/resume
  */
 static struct rzg2l_irqc_priv {
@@ -81,6 +89,7 @@ static struct rzg2l_irqc_priv {
 	const struct irq_chip		*irqchip;
 	struct irq_fwspec		*fwspec;
 	raw_spinlock_t			lock;
+	struct rzg2l_hw_info		info;
 	struct rzg2l_irqc_reg_cache	cache;
 } *rzg2l_irqc_data;
 
@@ -136,7 +145,7 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
 	raw_spin_lock(&priv->lock);
 	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
 		rzg2l_clear_irq_int(priv, hw_irq);
-	else if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
+	else if (hw_irq >= IRQC_TINT_START && hw_irq < priv->info.num_irq)
 		rzg2l_clear_tint_int(priv, hw_irq);
 	raw_spin_unlock(&priv->lock);
 	irq_chip_eoi_parent(d);
@@ -182,7 +191,7 @@ static void rzfive_irqc_mask(struct irq_data *d)
 	raw_spin_lock(&priv->lock);
 	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
 		rzfive_irqc_mask_irq_interrupt(priv, hwirq);
-	else if (hwirq >= IRQC_TINT_START && hwirq < IRQC_NUM_IRQ)
+	else if (hwirq >= IRQC_TINT_START && hwirq < priv->info.num_irq)
 		rzfive_irqc_mask_tint_interrupt(priv, hwirq);
 	raw_spin_unlock(&priv->lock);
 	irq_chip_mask_parent(d);
@@ -196,7 +205,7 @@ static void rzfive_irqc_unmask(struct irq_data *d)
 	raw_spin_lock(&priv->lock);
 	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
 		rzfive_irqc_unmask_irq_interrupt(priv, hwirq);
-	else if (hwirq >= IRQC_TINT_START && hwirq < IRQC_NUM_IRQ)
+	else if (hwirq >= IRQC_TINT_START && hwirq < priv->info.num_irq)
 		rzfive_irqc_unmask_tint_interrupt(priv, hwirq);
 	raw_spin_unlock(&priv->lock);
 	irq_chip_unmask_parent(d);
@@ -207,7 +216,7 @@ static void rzfive_tint_irq_endisable(struct irq_data *d, bool enable)
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
 
-	if (hwirq >= IRQC_TINT_START && hwirq < IRQC_NUM_IRQ) {
+	if (hwirq >= IRQC_TINT_START && hwirq < priv->info.num_irq) {
 		u32 offset = hwirq - IRQC_TINT_START;
 		u32 tssr_offset = TSSR_OFFSET(offset);
 		u8 tssr_index = TSSR_INDEX(offset);
@@ -249,9 +258,10 @@ static void rzfive_irqc_irq_enable(struct irq_data *d)
 
 static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
 {
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hw_irq = irqd_to_hwirq(d);
 
-	if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ) {
+	if (hw_irq >= IRQC_TINT_START && hw_irq < priv->info.num_irq) {
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
+	else if (hw_irq >= IRQC_TINT_START && hw_irq < priv->info.num_irq)
 		ret = rzg2l_tint_set_edge(d, type);
 	if (ret)
 		return ret;
@@ -496,7 +507,7 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 			return -EINVAL;
 	}
 
-	if (hwirq > (IRQC_NUM_IRQ - 1))
+	if (hwirq >= priv->info.num_irq)
 		return -EINVAL;
 
 	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, priv->irqchip,
@@ -520,7 +531,7 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2l_irqc_priv *priv,
 	unsigned int i;
 	int ret;
 
-	for (i = 0; i < IRQC_NUM_IRQ; i++) {
+	for (i = 0; i < priv->info.num_irq; i++) {
 		ret = of_irq_parse_one(np, i, &map);
 		if (ret)
 			return ret;
@@ -532,7 +543,8 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2l_irqc_priv *priv,
 }
 
 static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_node *parent,
-				   const struct irq_chip *irq_chip)
+				   const struct irq_chip *irq_chip,
+				   const struct rzg2l_hw_info info)
 {
 	struct irq_domain *irq_domain, *parent_domain;
 	struct device_node *node = pdev->dev.of_node;
@@ -554,7 +566,9 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 	if (IS_ERR(rzg2l_irqc_data->base))
 		return PTR_ERR(rzg2l_irqc_data->base);
 
-	rzg2l_irqc_data->fwspec = devm_kcalloc(&pdev->dev, IRQC_NUM_IRQ,
+	rzg2l_irqc_data->info = info;
+
+	rzg2l_irqc_data->fwspec = devm_kcalloc(&pdev->dev, info.num_irq,
 					       sizeof(*rzg2l_irqc_data->fwspec), GFP_KERNEL);
 	if (!rzg2l_irqc_data->fwspec)
 		return -ENOMEM;
@@ -579,7 +593,7 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 
 	raw_spin_lock_init(&rzg2l_irqc_data->lock);
 
-	irq_domain = irq_domain_create_hierarchy(parent_domain, 0, IRQC_NUM_IRQ, dev_fwnode(dev),
+	irq_domain = irq_domain_create_hierarchy(parent_domain, 0, info.num_irq, dev_fwnode(dev),
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
+	return rzg2l_irqc_common_probe(pdev, parent, &rzg2l_irqc_chip, rzg2l_hw_params);
 }
 
 static int rzfive_irqc_probe(struct platform_device *pdev, struct device_node *parent)
 {
-	return rzg2l_irqc_common_probe(pdev, parent, &rzfive_irqc_chip);
+	return rzg2l_irqc_common_probe(pdev, parent, &rzfive_irqc_chip, rzg2l_hw_params);
 }
 
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzg2l_irqc)
-- 
2.43.0


