Return-Path: <linux-renesas-soc+bounces-27916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEe8BMiNg2lCpQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:19:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3C2EB8F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 272113131407
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 18:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E10743CED8;
	Wed,  4 Feb 2026 18:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRPx4Wo7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2477043CECF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 18:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770228400; cv=none; b=FzarSm73ioVboewiPIZK7kp+ydATPj1kDiNNyo6qlc84GCHAh2SthpNlgDR9Udhy2n867UBXuV5m6/JysFCys8aVHhdrRxAsQx+1QDYt+fXI7swwiu3pDVLoAiUCHhsY2NIO+yKi2KtyqjB0XXwxl9tA8T0Dbd9Hj88hrmqj0jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770228400; c=relaxed/simple;
	bh=MwHv/Pah0HofbqmQTXjBWWt3XhKWksaouU08VSdJq8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awWJnvFxiiV6Aasn07sDDdEYY6/D5sQdu6EgXPpR5pt19q7d+GrXRxP9OP/LxtJo23HxnXSyCXTtjrJPvH9UrTS/Vl00UeAo5M6BPEPwlUbrsfOPI6q7fOuRfgmG7XSBS6q2kpFGBbaum+nJvUqjxx29sZn4kH48vdVu9RFud8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRPx4Wo7; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b86ed375d37so2676366b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 10:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770228398; x=1770833198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaPTfgvgMogdOb9ykgkaWfRyhOtpBPYKcL3dS1XRg48=;
        b=JRPx4Wo76aAZ0G+rjbOzhlwK7bqVfTsxMOCAhlDwnt1ItjVMAmTBP0OOu3leG3z/wB
         fpIHIbXe1iaq5i8pCDRo2at9fQtUZ9LxkhAondhf4wY9z5CfOxNuzT5YTF83prkksUtT
         IcjT3b3RrPXm+UWNprAUYT3uJ8seDyimiSDs+Ti1MhjRuGOTu+MOzfqJ0MkKcdScN9V9
         R3u6AvHz5hGhWZdu4/JdrOSl0qwBXS8vUONJG3gx3FHn2LsnkVCYlJ8nkEDWSU5xnUjF
         4JaIMJeRdi8BqPf+brnH5TpdYdn0X/eiGU/enW4jvETiVV0lOg9EFiVc3R8Pe9cntT+H
         7HOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770228399; x=1770833199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xaPTfgvgMogdOb9ykgkaWfRyhOtpBPYKcL3dS1XRg48=;
        b=exMBULXRWdHzmVRgq2w7j+AU7E1k4DULKWPY7DXbtXQdq0zDY4XmufqlAkvRxAm4/H
         ggFDb8a5wdSdVH6/4GfdkFgMquRrwGO2kuk9L2XlUfGTza2vv4caN1uiHi7zcTF3Nnwx
         BH3Ee5zsWUVk9M07M0Q8eTQqAejCCDaWHe+u4qJe/vfap0WDmA4tjfMMdDHHufgSvn60
         wG7TFVxb9BssIRfjnM4akj2dv+yuHhyQHKR8VcSII0SBY7Vh6tcs7/bOR8wF1S8psqJK
         RgTMN3XGm4PAH4pRFfvOQrIkd+dFHr5goyJXNkcIvrQVbao7discxJ7Vu4Lqv+bg5Js9
         z1VA==
X-Forwarded-Encrypted: i=1; AJvYcCX/ZtM9JlElESaQPpAqSTIbpfKcupS9S8J5s0J6mcZBUW964ZdyBHcKJ8lmM7B1lbo/hGfirtUj10AqNkofkfaHzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGr2enK9pMhxSBx6brydlc8cMBPbQs7sSnTSRYAr9OxD+J2yyA
	lsrjdRQWy6At/oLeZwBh9D1EOwFY1/KiU4/loj5/UW6dnbbHuNw3l338
X-Gm-Gg: AZuq6aJgJLkeJ/vfy1iqCgvL025U9MhLjMNgDTEglR52+QYpB/Bx5o/D8iaOWvdWeCO
	Q9CRFYICh46hceFojvUYfzyMq3thVL3hAhi9QID+eOaPPy4gK58RCrgpSj5zzaNJ3Hz6fWBVAhq
	kgEuDD9cK8S4NGlKYMdeoo42OR9qxw35vEBfudq6Fp6Byl8Cwohl6+3eYu4qSPCF041ve7hgzsu
	uulrynoAlw6hr7xXgTsLHOQPgjjdMsIzitRD2OQsVKCDQizb7iKx5jTVxD0Z4isAMAAW+FWvLeF
	T0ZQWgZHFATkHOvekx/Rqmb/YohceaAt6smA6bqU504fWXiMiHIhnBxp7N6XazYZSCkiZUO+P+Z
	WTCbNxoj0dqu2fMpiWjJW6zxOZHk6GeXlLVbouh4PM0aQ4rNpuiEKgJSXV/MtI1cIgfC1LGuNJz
	BI6cM/rg6/dZFQAu+9zj3WBvSOFf8x9iTzGvA=
X-Received: by 2002:a17:907:3ea6:b0:b87:9d1d:ec6b with SMTP id a640c23a62f3a-b8e9ec21bb9mr239483866b.0.1770228398450;
        Wed, 04 Feb 2026 10:06:38 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3c9f:a100:4d45:ebc7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea0057dd1sm149677666b.65.2026.02.04.10.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:06:38 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 6/9] irqchip/renesas-rzg2l: Drop IRQC_IRQ_COUNT macro
Date: Wed,  4 Feb 2026 18:06:22 +0000
Message-ID: <20260204180632.249139-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204180632.249139-1-biju.das.jz@bp.renesas.com>
References: <20260204180632.249139-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27916-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7F3C2EB8F0
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of External IRQs in RZ/G2L and RZ/G3L SoC are different.
The RZ/G3L has 16 external IRQs where as RZ/G2L has only 8 external IRQ.
Add irq_count variable in struct rzg2l_hw_info to handle this differences
and drop the macro IRQC_IRQ_COUNT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
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


