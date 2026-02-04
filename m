Return-Path: <linux-renesas-soc+bounces-27888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EH7UOGpWg2mJlQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 15:23:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E310E7078
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 15:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5EBBE300C0E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 14:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5346141324E;
	Wed,  4 Feb 2026 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F28la7Ey"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF13E413247
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215008; cv=none; b=cqCTXLWefHUW05Oaoi5DL9a3l2fLXhQtWr5sKaHOibW2L9YF/jiNw2Y+jeR8P50Qy3uS+zuCL9DyPqPdBLr7UXyEJKJ7zHVVe2o5FVphLnP9gB+xM+DG+qbdc8XRRMbWqO3sAgwAAeZZpTaQ2ZkCpH8VJJdJkJEQp+/BabS0+aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215008; c=relaxed/simple;
	bh=5AmNmV/7OYEj3hbgv7UTssLtDFytyjII7T5RP/pQtzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQhi5+QW/lEr9LbiWuidp2ghySQKw8SA3+2WpExJbh47CdrjE8nK9jab0cYy3MIBU3g6HRmJUW1DNJs4H2wLHKcfzxeJJQ0E37cLUMLTxAdFo6Nf6KKhIDPkUykozskC6cfp6w+6TPnhwS1x5qPHdvCyl31FPq67NcNoCCjZYGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F28la7Ey; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8845cb580bso1131793366b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 06:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770215006; x=1770819806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFfVv3K0yLen35ya4HYpO7XKBGusBRurN2Ils5L40xg=;
        b=F28la7Ey4YPDuW2eePC138K6lmvGQf2fXxk0wm/zJZWRL//TE4PwtLECBELOCUdw5W
         ykGLRQc5fLSwgFoUMJGKaaKNf5Qlh6ZftILiL7n0LGuSdKoeTIN8pXeVkF5kEPjw8WeG
         sYEQLlWAlcSwIJf2Jxo1ENEd33Vr/bHOARLArFpHIztUycQWYC5BrqBkIoeEgmHpKod9
         3nszzv101XFgZSJOLmix5EdM7nwE9GRN7jA1oFUheJunie8SoqOyg0xi2XNP2b3vkd74
         UiBBeHRJMonjc9LXlMvyhduAt8luteqbzVXQxqEwnGu3Lqufb+be39D4YY3Wj7AbU89D
         qBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770215006; x=1770819806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zFfVv3K0yLen35ya4HYpO7XKBGusBRurN2Ils5L40xg=;
        b=WjE8JVyg2pEuXHtDwh/yWhsd8BWr0UQ+quG0Bnv3BTgtzS1c+kz+GJAg4RuMAQvFwD
         VXw2ZMEQ3s5ZmuYwJooCLyRb4RObQSlNE+vqhGdDh2Fu5DJY2VsvHqopmQqGpboE1+j0
         cnd/P7M+A4u4MayHZagS7wvonhp8Sf/QnpB12YTgBDtwNcNHbZZpZqmSQbEFJOYGgyKh
         bCKVQ4IjPQPRHllR3oi4PED//orqtbDzwGtc6MdyA8vJ6yV1yusud7JFFbkRGJ4tbKmG
         H/WYSXMbP41ms4VKNq6/embPZ9wOobLqfryBR2xjExgWnyUHMon/uzmm5kPfdp0GD8zr
         dhMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO0iwvMNhP/VEss3BqI4+D1+DR4F+sbutBNPXB34KFog2tNRWgCOjE+nKDTg4jDbKek3CWCady1ohKho2IY6P9gA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUqY4rmPgyeobx58FGFcF9+SqnI7dCcFWt5qONZSwW+PI5bWPN
	O/w1mxXAw0yGfidsaHtznzxwcjzacu27aJc70abt0LLHnnkyXahvET7E
X-Gm-Gg: AZuq6aL+fJ8JhkCeoRyKv8NJHojyDlnM2nJNgKAQAbV18V+G0ZMu690NJ6JZVP1FM2W
	uR+aEedwYgdKC7EWc+XvEwQDBIDqLoTpxsWRFOTCuw2nyeFCgGmGUl8bbgOJMT5S9ZN6DF/5w35
	aEwIUhcjD1SPzwhZCk80US9/xthYvKPFv4TvkDm8q7SlB8MHOtb1aXbqBxTajpRfvfDQjU9X2GU
	ID1GTxCb71ShOZ60/JaGktDJpkssN/N5QWSDi4vLbEtKN3vlixufwZBQLBGo4PR0nk+zSzYxqqe
	LyIDwsR2XyrB15/EJTSozGGtSXlSkfbTfgvLf/IBBK+5xp/91BbMa9ME2gqV9HsheoBrAaSY2Uc
	VE7ffEcvP67izErHiADILfM17LsGlpPxDXPFk7MpxRIpa/lETrS/MeMJ/viANacXVDluck2xmof
	jZca1xFhNBvvikZ2et8r3pPhpQGJc4eztEthg=
X-Received: by 2002:a17:907:9308:b0:b76:7f64:77a5 with SMTP id a640c23a62f3a-b8e9f0b5c95mr224255166b.20.1770215005812;
        Wed, 04 Feb 2026 06:23:25 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3c9f:a100:4d45:ebc7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea001ea7dsm129038366b.47.2026.02.04.06.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 06:23:25 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/8] irqchip/renesas-rzg2l: Drop IRQC_IRQ_COUNT macro
Date: Wed,  4 Feb 2026 14:23:13 +0000
Message-ID: <20260204142320.103184-6-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27888-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E310E7078
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of External IRQs in RZ/G2L and RZ/G3L SoC are different.
The RZ/G3L has 16 external IRQs where as RZ/G2L has only 8 external IRQ.
Add irq_count variable in struct rzg2l_hw_info to handle this differences
and drop the macro IRQC_IRQ_COUNT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index e5393306f610..0de7db45d4c8 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -21,7 +21,6 @@
 #include <linux/syscore_ops.h>
 
 #define IRQC_IRQ_START			1
-#define IRQC_IRQ_COUNT			8
 #define IRQC_TINT_COUNT			32
 
 #define ISCR				0x10
@@ -68,10 +67,12 @@ struct rzg2l_irqc_reg_cache {
 
 /**
  * struct rzg2l_hw_info - Interrupt Control Unit controller hardware info structure.
+ * @irq_count:		Number of IRQC interrupts
  * @tint_start:		Start of TINT interrupts
  * @num_irq:		Total Number of interrupts
  */
 struct rzg2l_hw_info {
+	u8	irq_count;
 	u8	tint_start;
 	u8	num_irq;
 };
@@ -144,7 +145,7 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
 	unsigned int hw_irq = irqd_to_hwirq(d);
 
 	raw_spin_lock(&priv->lock);
-	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
+	if (hw_irq >= IRQC_IRQ_START && hw_irq <= priv->info->irq_count)
 		rzg2l_clear_irq_int(priv, hw_irq);
 	else if (hw_irq >= priv->info->tint_start && hw_irq < priv->info->num_irq)
 		rzg2l_clear_tint_int(priv, hw_irq);
@@ -190,7 +191,7 @@ static void rzfive_irqc_mask(struct irq_data *d)
 	unsigned int hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock(&priv->lock);
-	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
+	if (hwirq >= IRQC_IRQ_START && hwirq <= priv->info->irq_count)
 		rzfive_irqc_mask_irq_interrupt(priv, hwirq);
 	else if (hwirq >= priv->info->tint_start && hwirq < priv->info->num_irq)
 		rzfive_irqc_mask_tint_interrupt(priv, hwirq);
@@ -204,7 +205,7 @@ static void rzfive_irqc_unmask(struct irq_data *d)
 	unsigned int hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock(&priv->lock);
-	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
+	if (hwirq >= IRQC_IRQ_START && hwirq <= priv->info->irq_count)
 		rzfive_irqc_unmask_irq_interrupt(priv, hwirq);
 	else if (hwirq >= priv->info->tint_start && hwirq < priv->info->num_irq)
 		rzfive_irqc_unmask_tint_interrupt(priv, hwirq);
@@ -400,7 +401,7 @@ static int rzg2l_irqc_set_type(struct irq_data *d, unsigned int type)
 	unsigned int hw_irq = irqd_to_hwirq(d);
 	int ret = -EINVAL;
 
-	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
+	if (hw_irq >= IRQC_IRQ_START && hw_irq <= priv->info->irq_count)
 		ret = rzg2l_irq_set_type(d, type);
 	else if (hw_irq >= priv->info->tint_start && hw_irq < priv->info->num_irq)
 		ret = rzg2l_tint_set_edge(d, type);
@@ -500,7 +501,7 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 	 * from 16-31 bits. TINT from the pinctrl driver needs to be programmed
 	 * in IRQC registers to enable a given gpio pin as interrupt.
 	 */
-	if (hwirq > IRQC_IRQ_COUNT) {
+	if (hwirq > priv->info->irq_count) {
 		tint = TINT_EXTRACT_GPIOINT(hwirq);
 		hwirq = TINT_EXTRACT_HWIRQ(hwirq);
 
@@ -607,8 +608,9 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 }
 
 static const struct rzg2l_hw_info rzg2l_hw_params = {
-	.tint_start	= IRQC_IRQ_START + IRQC_IRQ_COUNT,
-	.num_irq	= IRQC_IRQ_START + IRQC_IRQ_COUNT + IRQC_TINT_COUNT,
+	.irq_count	= 8,
+	.tint_start	= IRQC_IRQ_START + 8,
+	.num_irq	= IRQC_IRQ_START + 8 + IRQC_TINT_COUNT,
 };
 
 static int rzg2l_irqc_probe(struct platform_device *pdev, struct device_node *parent)
-- 
2.43.0


