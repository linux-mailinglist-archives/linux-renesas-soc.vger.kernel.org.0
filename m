Return-Path: <linux-renesas-soc+bounces-28537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKISH1OooWm1vQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:21:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 236EC1B8C3A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A3C6308BAD3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 14:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A9643C07D;
	Fri, 27 Feb 2026 14:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfSRYqGJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380D443C050
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201011; cv=none; b=t8eo8Y1RTWk3q+mkHRnworo9h9K7BTzNNDuqRg3kBji+tC4YyMYjXHh1uztJxd2B+rgIbD5DhTaZfeFtv1gYHVLbObwwJWjckuq4lkYUYSjEcJH4hwNw9ZKhZP4YeE230mzWlu/3XBDPe9Oo+SPElusHcooCC32No1JhI9K6QAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201011; c=relaxed/simple;
	bh=kL2l/vaaZH0Mjb/6DP2cEVtv8HOl6c9ULYdSdt/q2RY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m2V4LGPPpoOQcyeWNOYEgAOlP2IW7CUq51MQdDOIjif/yWcyek0ZoLkvk0uI5Pg8C7PqXwLJxDRgBku6KJ2uNI20zcuwMJpshTAAjmaaRWTyEFHwLszAVWsU5U4DBu0TixrTUlGk93SiCAp3QfjJfpxf8U+212jA9ePEGOTKtFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfSRYqGJ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43945763558so1482571f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772201007; x=1772805807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTx1Ig68m3990TuaMC1o3YCGcen11kpdJBTmI/bujgA=;
        b=MfSRYqGJT9Urwy1Q9fLTqNUTqLtpBO5jYKrSZhWJFP7Lqv5tIEVsOMkhbfY2IONR5x
         czgxwY+M8626YvL9NUJnYLK8dNwzswO801NCKQcLVc2x8qvW0MbflkwkK6p4OV6hN47o
         7hkkuPbo53TzmjBpyFkIo1y8q+B5vY/ZKUm1tBTbLNJvxQPDusEQaUnP08Nm6kjD3ZSg
         FsaXIjBYZluskAE2Aq3qudFEXld0TMSwBWroR2xVUqn7e8rxYRI7uOayNGhsK30Cpg37
         ffT7B1mtr/DLTBkXSf7i5PuMxgzanDPZbi+oFpC3MO7HN1eblXWpEvfi/jbCGm7TMxo+
         Emug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772201007; x=1772805807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WTx1Ig68m3990TuaMC1o3YCGcen11kpdJBTmI/bujgA=;
        b=d6N3csfTjbNV3CyLJhXeI0gim+oR116CPCik2k5A91i0/cGvTzs8fyAuoJDwu7ywt+
         sw3Fe/vJIO1vJjyvT489TF6u+5iLwWreQgG1zrkYqnuOTW5aXocOfCiq0pQQXf245Q0L
         mcpwzq2PaiyX/9AdcdgbySBv/sR483PGyI5iUrwXmTmGQmsW8Uy8GWM1C+qky1ltimmT
         Ocx7RSZNTcVkj4L2THEaLFhn2TgyG7PHo137ppljZb1es5kzSVl2xjiN75iGJVRn/CyX
         ZOTg/dqwA0V6N0+sM2FpwC/soa/hnMbkmZmKWh8EjyA1SkRIf+7yBcNnEM4HNYL6Eauv
         Thtg==
X-Forwarded-Encrypted: i=1; AJvYcCXKS9wZ920t+wbUL96mi/Bh8Ln1s4baFiempx8mNeZ8VarTQPZByoh/+Hau98PJKHx8ecS9ZoHh3LrPjsy+niU5sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YykUwDsDMlErW/rmSphm9yGr5+YYGqLpvrfypl/TUL1rLj4FjzT
	CpyGdD+tjySdDBFPitAaPiWaxMAf7hL6/8zOPHMjBH83ZMIFoC60FqGB
X-Gm-Gg: ATEYQzxXHwNxFMNvYBgRNTfV2BfT4hAssL5NFQwffg70aKkADJ5IA/V4icxmGI5zwn5
	Gx6+EuGCVf7czF/K01beNFfS6AMLEaKUfA9sIFXsuJNEkX7IF1/IeFFOcKvryNaX/feXYOQAj06
	KJBinVHritypPvFPCsJhfTSXU+sI860tMQ0gx6605BpH83Okve0DtzI7sIcm1VShsD6vXjfkBX2
	L5Q15HoSimtw51GRTcaNMcrcXDP+K0wQiX9MAXBqRBgNxavxM+jG/6GdW7j/SjKKeIUD6QyKYuL
	TC9z3agVV98iLl0Y9U7nNuULXuZ2FPZbNNiMd6rEsA+wGHEsGQEqa6DNC21ZAL3VsJyMsKiOreZ
	von68jwOcdAzxcKmcqXGBqiLaYs2pv82XtBJPFlpjr5Urz8urvmYkfH/X8YzSizpWTZ9F6LcR7F
	FpwylNxuaWYwMoUVvEkzg8MYFJ79fbttZer5RNtlP7bw==
X-Received: by 2002:a05:6000:2dc3:b0:439:8d96:55d1 with SMTP id ffacd0b85a97d-4399dde5f73mr5406205f8f.8.1772201007451;
        Fri, 27 Feb 2026 06:03:27 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:4d8b:fefb:26cf:1906])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60feeesm7658811f8f.1.2026.02.27.06.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:03:26 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 8/9] irqchip/renesas-rzg2l: Add shared interrupt support
Date: Fri, 27 Feb 2026 14:03:08 +0000
Message-ID: <20260227140316.308106-9-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28537-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 236EC1B8C3A
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of external interrupts in RZ/G2L and RZ/G3L SoC are
different. The RZ/G3L has 16 external interrupts out of which it shares 8
interrupts with TINT, whereas RZ/G2L has only 8 external interrupts. Add
shared_irq variable in struct rzg2l_hw_info to handle these differences by
adding the callback irq_{request,release}_resources().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated commit header irq->interrupt.
 * Updated commit description IRQs->interrupts.
 * Updated shared_irq_cnt variable type from u8->unsigned int.
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 90 +++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 3010247fe3ef..491421cd9681 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -29,6 +29,8 @@
 #define TITSR(n)			(0x24 + (n) * 4)
 #define TITSR0_MAX_INT			16
 #define TITSEL_WIDTH			0x2
+#define INTTSEL				0x2c
+#define TINTSEL(n)			BIT(n)
 #define TSSR(n)				(0x30 + ((n) * 4))
 #define TIEN				BIT(7)
 #define TSSEL_SHIFT(n)			(8 * (n))
@@ -58,10 +60,12 @@
 /**
  * struct rzg2l_irqc_reg_cache - registers cache (necessary for suspend/resume)
  * @iitsr: IITSR register
+ * @inttsel: INTTSEL register
  * @titsr: TITSR registers
  */
 struct rzg2l_irqc_reg_cache {
 	u32	iitsr;
+	u32	inttsel;
 	u32	titsr[2];
 };
 
@@ -71,12 +75,14 @@ struct rzg2l_irqc_reg_cache {
  * @irq_count:		Number of IRQC interrupts
  * @tint_start:		Start of TINT interrupts
  * @num_irq:		Total Number of interrupts
+ * @shared_irq_cnt:	Number of shared interrupts
  */
 struct rzg2l_hw_info {
 	const u8	*tssel_lut;
 	unsigned int	irq_count;
 	unsigned int	tint_start;
 	unsigned int	num_irq;
+	unsigned int	shared_irq_cnt;
 };
 
 /**
@@ -295,6 +301,83 @@ static void rzg2l_irqc_irq_enable(struct irq_data *d)
 	irq_chip_enable_parent(d);
 }
 
+static bool rzg2l_irqc_is_shared_irqc(const struct rzg2l_hw_info info, unsigned int hw_irq)
+{
+	return ((hw_irq >= (info.tint_start - info.shared_irq_cnt)) && hw_irq < info.tint_start);
+}
+
+static bool rzg2l_irqc_is_shared_tint(const struct rzg2l_hw_info info, unsigned int hw_irq)
+{
+	return ((hw_irq >= (info.num_irq - info.shared_irq_cnt)) && hw_irq < info.num_irq);
+}
+
+static int rzg2l_irqc_irq_request_resources(struct irq_data *d)
+{
+	unsigned int hw_irq = irqd_to_hwirq(d);
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	u32 offset, tssr_offset;
+	u8 tssr_index, tssel_shift;
+	u32 reg, inttsel_reg;
+	u8 value;
+
+	if (!priv->info.shared_irq_cnt)
+		return 0;
+
+	if (rzg2l_irqc_is_shared_irqc(priv->info, hw_irq)) {
+		offset = hw_irq + IRQC_TINT_COUNT - priv->info.tint_start;
+		tssr_offset = TSSR_OFFSET(offset);
+		tssr_index = TSSR_INDEX(offset);
+		tssel_shift = TSSEL_SHIFT(tssr_offset);
+
+		reg = readl_relaxed(priv->base + TSSR(tssr_index));
+		value = (reg & (TIEN << tssel_shift)) >> tssel_shift;
+		if (value)
+			goto err_conflict;
+
+		raw_spin_lock(&priv->lock);
+		inttsel_reg = readl_relaxed(priv->base + INTTSEL);
+		inttsel_reg |= TINTSEL(offset);
+		writel_relaxed(inttsel_reg, priv->base + INTTSEL);
+		raw_spin_unlock(&priv->lock);
+	} else if (rzg2l_irqc_is_shared_tint(priv->info, hw_irq)) {
+		offset = hw_irq - priv->info.tint_start;
+		tssr_offset = TSSR_OFFSET(offset);
+		tssr_index = TSSR_INDEX(offset);
+
+		inttsel_reg = readl_relaxed(priv->base + INTTSEL);
+		value = (inttsel_reg & TINTSEL(offset)) >> offset;
+		if (value)
+			goto err_conflict;
+	}
+
+	return 0;
+
+err_conflict:
+	pr_err("%s: Shared SPI conflict!\n", __func__);
+	return -EBUSY;
+}
+
+static void rzg2l_irqc_irq_release_resources(struct irq_data *d)
+{
+	unsigned int hw_irq = irqd_to_hwirq(d);
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	u32 offset;
+	u8 inttsel_reg;
+
+	if (!priv->info.shared_irq_cnt)
+		return;
+
+	if (rzg2l_irqc_is_shared_irqc(priv->info, hw_irq)) {
+		offset = hw_irq + IRQC_TINT_COUNT - priv->info.tint_start;
+
+		raw_spin_lock(&priv->lock);
+		inttsel_reg = readl_relaxed(priv->base + INTTSEL);
+		inttsel_reg &= ~TINTSEL(offset);
+		writel_relaxed(inttsel_reg, priv->base + INTTSEL);
+		raw_spin_unlock(&priv->lock);
+	}
+}
+
 static int rzg2l_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
@@ -424,6 +507,8 @@ static int rzg2l_irqc_irq_suspend(void *data)
 	void __iomem *base = rzg2l_irqc_data->base;
 
 	cache->iitsr = readl_relaxed(base + IITSR);
+	if (rzg2l_irqc_data->info.shared_irq_cnt)
+		cache->inttsel = readl_relaxed(base + INTTSEL);
 	for (u8 i = 0; i < 2; i++)
 		cache->titsr[i] = readl_relaxed(base + TITSR(i));
 
@@ -442,6 +527,8 @@ static void rzg2l_irqc_irq_resume(void *data)
 	 */
 	for (u8 i = 0; i < 2; i++)
 		writel_relaxed(cache->titsr[i], base + TITSR(i));
+	if (rzg2l_irqc_data->info.shared_irq_cnt)
+		writel_relaxed(cache->inttsel, base + INTTSEL);
 	writel_relaxed(cache->iitsr, base + IITSR);
 }
 
@@ -461,6 +548,8 @@ static const struct irq_chip rzg2l_irqc_chip = {
 	.irq_unmask		= irq_chip_unmask_parent,
 	.irq_disable		= rzg2l_irqc_irq_disable,
 	.irq_enable		= rzg2l_irqc_irq_enable,
+	.irq_request_resources	= rzg2l_irqc_irq_request_resources,
+	.irq_release_resources	= rzg2l_irqc_irq_release_resources,
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
@@ -642,6 +731,7 @@ static const struct rzg2l_hw_info rzg3l_hw_params = {
 	.irq_count	= 16,
 	.tint_start	= IRQC_IRQ_START + 16,
 	.num_irq	= IRQC_IRQ_START + 16 + IRQC_TINT_COUNT,
+	.shared_irq_cnt	= 8,
 };
 
 static const struct rzg2l_hw_info rzg2l_hw_params = {
-- 
2.43.0


