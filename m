Return-Path: <linux-renesas-soc+bounces-27918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAhmChSOg2lCpQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:21:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8CEEB91E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D179A302D6B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 18:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6873443DA27;
	Wed,  4 Feb 2026 18:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EitOsoRX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE4F429802
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 18:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770228404; cv=none; b=g3NsVzLafkWHZSuQrQfGnAplL7HhHWY7+4RyDdNttDlyRg+5ZO1PdZcN1Edx2Bu1xKF4NL6raPttquIt7xkQVfZ1LMfKAZd+1zOY8f6799oTHtVo6MnMx35ZjZEVMNbg6+G/i1uQbxL1VlyzPv/qkiwTSCPWaXs/VXRUlF+67ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770228404; c=relaxed/simple;
	bh=PR0Y7DzNjFTDIG2WHhhAKoseARU/L0/0LkH++8bVIWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZAp5u0raxrlw8ahzcIVUgJ9Y2O9lo/KLkGngjy7zrRU44Y+2zpYU7aGb21A5SlZSLlsuakjGARQiSCLFxEJQHreHhLRLEufzMIKvbd7JxA+8cVH2x9deuCRx6WiNCiq2rGZCrLwMIW3jXK4uD3VPFQdhOUkbm+CBa6iwCd/hFMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EitOsoRX; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b885e8c6700so7881866b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 10:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770228402; x=1770833202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpKgjKffeQAx/PJqmca64WNeqcl4ZFqFriUE40PWf7Q=;
        b=EitOsoRXYaDL6r0+M6v9N7grQ8+vB2bSY9YSFZFTdBvgO30xAY40r2ws0BdTz1gYBh
         cU6QWg6T5MxXFsUwXAAdwEQjxKZlnfPJt3Tcscs4tq4hp1/VA9HvjGla8XiwprUPdrgY
         flJBBxY3JjfWgtmwNl7dA92470sHWIGU3h2OizpRMMsKo1f0TMyPbN9RUc8vI8It3l2D
         IrmeSCjOPvntz14DnyiypQcKWdbLdSlnicXGf6BwNNt+B7TWbfKshVMVZIeWWmz5V03Q
         Ljir9xdsWwDEjP8BVgt0ssBq/+66WFgHTkHoAblkM0/JnMS/FPl+OlmLkzk+Aln4WPCh
         5wZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770228402; x=1770833202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UpKgjKffeQAx/PJqmca64WNeqcl4ZFqFriUE40PWf7Q=;
        b=D7/D/KONSvUUnztYSOv0gv3rASP+PPtAVQDiGqzpHP/5xw3aZT7Zuo2MT2hOExDOki
         RYr9/iy+HKmUVqQ/ukLz/5DQ8d0FwFobBkD63Ev5xDTWetJHW24ZV13L5DnoxSi8JhBQ
         8WdlWBRR3QwhJKi3lbILYfkkzg469k7smaRDiU6m2A2F44KMhHaoUPI4JGNKoIDOvgQt
         6nL7bkRpqfdIYQFVeQtxV2XIdPRHDMnuS1AEmSWj9mkZ40htcDQpFV304MXnMkpVDN4d
         /IXOsvKqwzKLtT93j1BUk0Rw9NNG7s77YSkwxmZ56o3vT0kseTjpPyUEwWbLaWB0E3xb
         evFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWww/OxdYERU8yuDuzRJ/VOLnhLAvbRK91+JORmECRls25Lge2HyBpBladMKwWvPARouK0XEDFFdtO72qJpDauZhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGBv0ZPLd34adE/NjGIeN2o+xXm2iUSz/b6+GAd39O5frtj+MS
	DTyflhz2NiQ7rvNoGiX+w3tEHNkPIvdQ9ApLIcheSeyuO2koPSuTDZDF
X-Gm-Gg: AZuq6aKpPiiqeV33ymCJUEUg4J2cS2mUaGeWjOuc/CRYOHTYtPi7RQtFt3soTVh3Xtu
	TOS88uAJWa+eBKk+3fVOfrm1WZAsOWeNH/2S/noLsOL/XS+79qTEWbkjwgap3j7FydehNtOZGPp
	ZJ5I2V6pecK3G7XTIMhpB0jSQdWxWpIuvDaBRpakpoLg6bGuAyjnfJMUt0aoJ3ToFArAAhzqLJv
	Vceo3wNCyGhGMVsDlDQj8OY4V9FsR2muFB12LTctCWjjL+IYzbj0iDMjo/5efPCLswwYBFfNsVS
	9mNPlaTC9neBsy3JubaAlRygIQKBL+ThpUA8xNHDtTRO2BDJ50UIsl+5wAbsvClOpxEsGNuE4ZZ
	XgK/PUdkKLergyZQw1sCfqDakzSpS18LdCxl/gVi66I9VnDjRcaC74igDoItIaY3bHxwsyX9up6
	snzIaVOIcdLzD2FFbr9Us2jsKucWdMar0XxGw=
X-Received: by 2002:a17:907:94d4:b0:b87:2fcd:1955 with SMTP id a640c23a62f3a-b8e9f40de76mr259478666b.50.1770228402153;
        Wed, 04 Feb 2026 10:06:42 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3c9f:a100:4d45:ebc7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea0057dd1sm149677666b.65.2026.02.04.10.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:06:41 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 8/9] irqchip/renesas-rzg2l: Add shared irq support
Date: Wed,  4 Feb 2026 18:06:24 +0000
Message-ID: <20260204180632.249139-9-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27918-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 3A8CEEB91E
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of External IRQs in RZ/G2L and RZ/G3L SoC are different.
The RZ/G3L has 16 external IRQs out of which it shares 8 IRQs with TINT,
where as RZ/G2L has only 8 external IRQ. Add shared_irq variable in
struct rzg2l_hw_info to handle this differences by adding the callback
irq_{request,release}_resources().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 94 +++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 06c439c98ff5..59108e1d53ec 100644
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
 	u8		irq_count;
 	u8		tint_start;
 	u8		num_irq;
+	u8		shared_irq_cnt;
 };
 
 /**
@@ -295,6 +301,87 @@ static void rzg2l_irqc_irq_enable(struct irq_data *d)
 	irq_chip_enable_parent(d);
 }
 
+static bool rzg2l_irqc_is_shared_irqc(const struct rzg2l_hw_info *info, unsigned int hw_irq)
+{
+	return ((hw_irq >= (info->tint_start - info->shared_irq_cnt)) &&
+		hw_irq < info->tint_start);
+}
+
+static bool rzg2l_irqc_is_shared_tint(const struct rzg2l_hw_info *info, unsigned int hw_irq)
+{
+	return ((hw_irq >= (info->num_irq - info->shared_irq_cnt)) &&
+		hw_irq < info->num_irq);
+}
+
+static int rzg2l_irqc_irq_request_resources(struct irq_data *d)
+{
+	unsigned int hw_irq = irqd_to_hwirq(d);
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	const struct rzg2l_hw_info *info = priv->info;
+	u32 offset, tssr_offset;
+	u8 tssr_index, tssel_shift;
+	u32 reg, inttsel_reg;
+	u8 value;
+
+	if (!info->shared_irq_cnt)
+		return 0;
+
+	if (rzg2l_irqc_is_shared_irqc(info, hw_irq)) {
+		offset = hw_irq + IRQC_TINT_COUNT - info->tint_start;
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
+	} else if (rzg2l_irqc_is_shared_tint(info, hw_irq)) {
+		offset = hw_irq - info->tint_start;
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
+	const struct rzg2l_hw_info *info = priv->info;
+	u32 offset;
+	u8 inttsel_reg;
+
+	if (!priv->info->shared_irq_cnt)
+		return;
+
+	if (rzg2l_irqc_is_shared_irqc(info, hw_irq)) {
+		offset = hw_irq + IRQC_TINT_COUNT - info->tint_start;
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
@@ -422,6 +509,8 @@ static int rzg2l_irqc_irq_suspend(void *data)
 	void __iomem *base = rzg2l_irqc_data->base;
 
 	cache->iitsr = readl_relaxed(base + IITSR);
+	if (rzg2l_irqc_data->info->shared_irq_cnt)
+		cache->inttsel = readl_relaxed(base + INTTSEL);
 	for (u8 i = 0; i < 2; i++)
 		cache->titsr[i] = readl_relaxed(base + TITSR(i));
 
@@ -440,6 +529,8 @@ static void rzg2l_irqc_irq_resume(void *data)
 	 */
 	for (u8 i = 0; i < 2; i++)
 		writel_relaxed(cache->titsr[i], base + TITSR(i));
+	if (rzg2l_irqc_data->info->shared_irq_cnt)
+		writel_relaxed(cache->inttsel, base + INTTSEL);
 	writel_relaxed(cache->iitsr, base + IITSR);
 }
 
@@ -459,6 +550,8 @@ static const struct irq_chip rzg2l_irqc_chip = {
 	.irq_unmask		= irq_chip_unmask_parent,
 	.irq_disable		= rzg2l_irqc_irq_disable,
 	.irq_enable		= rzg2l_irqc_irq_enable,
+	.irq_request_resources	= rzg2l_irqc_irq_request_resources,
+	.irq_release_resources	= rzg2l_irqc_irq_release_resources,
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
@@ -640,6 +733,7 @@ static const struct rzg2l_hw_info rzg3l_hw_params = {
 	.irq_count	= 16,
 	.tint_start	= IRQC_IRQ_START + 16,
 	.num_irq	= IRQC_IRQ_START + 16 + IRQC_TINT_COUNT,
+	.shared_irq_cnt	= 8,
 };
 
 static const struct rzg2l_hw_info rzg2l_hw_params = {
-- 
2.43.0


