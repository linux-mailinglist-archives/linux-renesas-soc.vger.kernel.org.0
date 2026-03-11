Return-Path: <linux-renesas-soc+bounces-29254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH9cAN3BsWmdFAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:26:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B45D26948E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACECA3066CE8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 19:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AA73EC2D4;
	Wed, 11 Mar 2026 19:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gm3QlmdG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C433E869C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 19:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257115; cv=none; b=NQajgcM6sEokt022pijggh2p/DSc6ajL+Df5tJR1IcgDwFwve91kooBdBUfYhkGFcXoQB8cdaivMpgdPF4dTt2Yr8WWXYRYIVp8iCSfF1tNnqEEb513iilzFAGQYgN6uy7dZ5qlL11RIMykMqqsoET3PpNhsfNvtSIhBNQAjmB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257115; c=relaxed/simple;
	bh=PSfwYK1tXTapMT0D8jCCWRXSRC9BazGoInJA7J6QycE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g82weWQYxbmczcRvVoHlO+WWUQI5HCJ+5aAnSQOAfvwxWLTizMAu5Et/T+rLqs4gcyH35jj1ePPSk93NpYkGMPTurWRnNX4oSm5aUg/jUYhyNhs6YZyiWk9Q9288np+IknW5cuky7x1HeUES5zIDPehN9UVpNzibsqVuALI1SX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gm3QlmdG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439c6fc2910so181277f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 12:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773257111; x=1773861911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOdd25/rjFXlgKhvKXBBsn1bWfxNxa2TmQT044x9Rlw=;
        b=gm3QlmdG8+8qFJQaeGNjFJJ0+TlLJkBDez6uj2h1CL8I7ZWW4kc3sLP8mcNusX3a7S
         lLeNmquPhT5FWa/SW/U1ibRSKT09wZkKzv/Hye1+4dJZaxm8FtmqbeinOkDOsU8vXM/E
         B3J/wvHE4SnVueQg/D2C2097vRlhffrgxzGBf5Ao152GZbFwCB2REJ4XQhSRCLwkoAsg
         qiXr4+j/+oI9f8YMSce7pOzyxZz+VGZH4LaUofkNi7Btb5E6ivlVBCJzgKDUmQI6xMsn
         jzjKKmrVscsfqAAZvfgHdpKMxqoergeR+0tBjiCrdeGslY7vnpNGN1J00oR+3Vu7Q0k1
         Zq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257111; x=1773861911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KOdd25/rjFXlgKhvKXBBsn1bWfxNxa2TmQT044x9Rlw=;
        b=dM/ye8MyB+E2yWSe50gWxs6NgdmBRdKu1SPs2uNGjdcHHc9Lcwz5Feb6f+k4uauFxZ
         77ZCgg5JHYa9SvOw06p2E1xBJCCJEe+o4fCS1hOAmvhms/lBVhrJ299sYC1MHuS0pTJV
         WdV5Uj/9u9d9aMyFer11EJXUTUzfSwo4bbOEGUdXn3V+2aab6mVR97AHM9t0O3mJiwVK
         pDo0rWMvFD9U1yfMCrnQVxYcU7YQ6StWc2EJZLGg4+dPMalVP9GAFhnvIsUn+G8d3PQE
         HX+C0WS6Fxfiy6Ux3DQ//GKpXgJZuitj0/sljztmoHOpJsgunDBgVF/lpkpzTT0gNg79
         nfQA==
X-Forwarded-Encrypted: i=1; AJvYcCVT/hJB6pUeGtsxzGFYhz7J50QNhXFCfaB+wMlKPA+t3/5o+Fzhk+RBN4hcA81LLZgWVN5fC51OGHr8SInjLODZfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+yNeLXI659cI/EqHgkDhDmR5WVvfklL3XJsE8T/LE4+7IQf7s
	g9MeaAwzMsLPJwHNk+8qrM5qfV+nciKiCn2Bpw19TYoX6VO/TWxEIWuRDu8qEQ==
X-Gm-Gg: ATEYQzyrla0z1a+z5d7R3J4F3YSen4CjgwRmQoYSn3hD7EluwHcbf8UQGWHVx1JBJd/
	4trxxwa0lXbbUTwrqSjXwyiGyiv+S+DmkFz20RFBZ7GQ2j0qoms9/eGatX01UgD6MzaKtNgKh4d
	LYWnX7DBhT74ntlbSwgL6Vet4vNqTanG+YrJ9kQIhLVAXtB5cJHlvUvL297fqhBgpyejDFrcyTk
	ZJotxF+zFtNcVmGci3rbcg+SsfjR0Ykl8eyJPlq4QECLHzysD31CnBfEaSOFYj4VdKqqGCh3ygP
	pxoeTt/RxKXep9XXvNKEQ4ngGrmZcW7KywC2QJ9h/yoIDbzP+Jb7M3FpxcVUk3cBNhwMf8go70T
	Cx1rok+n6syrezA1I/rLOPZ1EzhL6yRV6Mn06J7wFrAdvNen9zDiz8z9esspSIeMo3vHbv0vopu
	pw0o9mlqPC6K/0oR5zjCA4ES9NnIyfkDG18no7Ya8YZ26BDpN+
X-Received: by 2002:a05:6000:2c03:b0:439:b539:787 with SMTP id ffacd0b85a97d-439f843cc76mr7128309f8f.53.1773257110925;
        Wed, 11 Mar 2026 12:25:10 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:38b7:8ca3:cb55:d344])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm1323210f8f.21.2026.03.11.12.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:25:10 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 11/15] irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macro
Date: Wed, 11 Mar 2026 19:24:42 +0000
Message-ID: <20260311192459.609064-12-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29254-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 6B45D26948E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of interrupts in RZ/G2L and RZ/G3L SoC are different.
Introduce struct rzg2l_hw_info to handle the hardware differences and
replace the macro IRQC_NUM_IRQ with num_irq variable in struct
rzg2l_hw_info.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
index cd850c7dc6f3..11fff8fdf4b3 100644
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
 
@@ -577,7 +586,7 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 		chip = priv->irq_chip;
 	}
 
-	if (hwirq > (IRQC_NUM_IRQ - 1))
+	if (hwirq >= priv->info.num_irq)
 		return -EINVAL;
 
 	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, chip, (void *)(uintptr_t)tint);
@@ -600,7 +609,7 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2l_irqc_priv *priv,
 	unsigned int i;
 	int ret;
 
-	for (i = 0; i < IRQC_NUM_IRQ; i++) {
+	for (i = 0; i < priv->info.num_irq; i++) {
 		ret = of_irq_parse_one(np, i, &map);
 		if (ret)
 			return ret;
@@ -613,7 +622,8 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2l_irqc_priv *priv,
 
 static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_node *parent,
 				   const struct irq_chip *irq_chip,
-				   const struct irq_chip *tint_chip)
+				   const struct irq_chip *tint_chip,
+				   const struct rzg2l_hw_info info)
 {
 	struct irq_domain *irq_domain, *parent_domain;
 	struct device_node *node = pdev->dev.of_node;
@@ -636,7 +646,9 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 	if (IS_ERR(rzg2l_irqc_data->base))
 		return PTR_ERR(rzg2l_irqc_data->base);
 
-	rzg2l_irqc_data->fwspec = devm_kcalloc(&pdev->dev, IRQC_NUM_IRQ,
+	rzg2l_irqc_data->info = info;
+
+	rzg2l_irqc_data->fwspec = devm_kcalloc(&pdev->dev, info.num_irq,
 					       sizeof(*rzg2l_irqc_data->fwspec), GFP_KERNEL);
 	if (!rzg2l_irqc_data->fwspec)
 		return -ENOMEM;
@@ -661,7 +673,7 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 
 	raw_spin_lock_init(&rzg2l_irqc_data->lock);
 
-	irq_domain = irq_domain_create_hierarchy(parent_domain, 0, IRQC_NUM_IRQ, dev_fwnode(dev),
+	irq_domain = irq_domain_create_hierarchy(parent_domain, 0, info.num_irq, dev_fwnode(dev),
 						 &rzg2l_irqc_domain_ops, rzg2l_irqc_data);
 	if (!irq_domain) {
 		pm_runtime_put(dev);
@@ -673,14 +685,20 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
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


