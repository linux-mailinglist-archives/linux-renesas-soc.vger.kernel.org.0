Return-Path: <linux-renesas-soc+bounces-29257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB5fKynDsWmdFAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:31:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC172695AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D93A2327ADF1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 19:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AB43ED5DA;
	Wed, 11 Mar 2026 19:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AN4ZZXLv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2434E3EC2E5
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 19:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257118; cv=none; b=uLs+rxDGKKOq1JIx7kibLvxLPMn18+NpSqDs7ghpBGelvRe54l9VcNrnH9ib3t4zpiS67kQA4jvTSB8AP1sHKTauIH9QZXnP4dIWU/dhLyk9NlO6aijWyeY0T5W/LLpifBh8fl+hZa/JX8g+pzHwBb1xXPE56wC3VCSFjDmJ4Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257118; c=relaxed/simple;
	bh=lhs+RbLUsEIRFoIF+KAIWGS71b+Kq8owHfDJh9JBJSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gfMdjOnQ5mCmJil5eUZi675pGp8p88Oc3Om2Y1W9lXho+rCiEuR+tmBS3yF8/69c+b37hW4zfyUWOP5gvIH5lIsXWeRWPda0OobpVQcbb7a9VhsP0Jipb2x4dXP3UGZ6aD3VKmnFdQJgKFkgO1Muv5NVWTxv0umSs2DLPtbDsME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AN4ZZXLv; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439c5b40f60so207408f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 12:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773257114; x=1773861914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EmrKyiaaHXbjBq2fqv6RMnr2WuenrBa9oygLOBn/DA=;
        b=AN4ZZXLv2qFrikwgW6lG8a1EO1LEr2O2j6woEDfzhTQPE6nN1U8n4OUQaHpOyQdWja
         kWXY1UhQiOaa8I30xuB/zJZfRf9I+AwDKpZrG+xAsFcUhPm0VPaWpyVwJfGEhb4iQm5K
         W3V8XmDAIVTXnk59CYOcr7owZzS3yUcVK7HxtlJLYnnOhxnZCfD2atyMZ0BahbysyJNa
         jo+0QfhEZsUnTVo8vffaUMC4lsgkDpv4w7qPPQclv/YtWatG3la0mqyLvLv79EHz+VtD
         DeEu5oO7bwr6qnlYkv6vgPxqf0Y3FvPdR4B86i1lOj89rrAv1+PmoTJjuBTySRpv6K2H
         0YtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257114; x=1773861914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EmrKyiaaHXbjBq2fqv6RMnr2WuenrBa9oygLOBn/DA=;
        b=ExGVPyVw3oa1r/T31cFecgw/hoEVmIyz8fNOtMzK/9ljLjcGKRPrIBsNcJxDHwBRZb
         mg4AM1iRhQWQS3bdQxoFMqmgAR+dSrnbAkQnyeEzpuwd62tqI01pW06uyNXsUkFvixWV
         WfadI1O6XQqHKGyTkfsSHrLGSwfGHfJefru2BwN/MPV4WUHui1gTp9UFOeWoicUjuG/1
         ved69tPaL+836/JKJcGO28lc1wBUBRQpMEbIxjG0CIiTrqW0klWzglkeF3KSczATWLAH
         k8Sw4Ra/96SY2H9XAG/TR24JAV1Bptra3J0EIYYMvQZkgwrpsYSc9xF/HcJprVt6XsPw
         uZlw==
X-Forwarded-Encrypted: i=1; AJvYcCUo9h9H8DF5CmTgvx1rybBcmShQ4R4KJTmmae3nxx2dj+2agefe12+TIe4M7q+rIdApXgJjWtpeWC9x5Nm/CslY/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ZwI6bLGYOKcgo3NDz9afDGpy/WbaGbQ8wTGznZsEUdEQShhr
	LhkC7Jn6AYbjMT1h+tS3tatNqAU2yyS+Ya4S6rIyXUyVbJGyPSXOyARH9rT3LQ==
X-Gm-Gg: ATEYQzw9xpuN9sh8mAGXWoML5ljVyoLgcOWW/KXh9jnRL7VV51rCQYi+cI+z883TWoF
	01NM5JVolfMPOQ4m/lGg48/YLbI6QJNnWqrF7RBeTkPeeH8OsXoafZnZ751gpN500YMYlKCgm2H
	ZC2LT5E4EBBH/oWBY/3WwHW6ZAIfB93rhj0IBXQit2/bfgdvhhuJBzyixGZfH7SXl9CRi3upNmb
	C6M/httIPC3OGMFQkJQa6OqiRddgy50fdDEEjCeYID4mahuxQ6m5Gh/CHDy9tzbOXOjZkYEo4OZ
	sHlj7U0dB6jtmZW+7MH9P9CfS3ZsSOMn4oxaL8M2+RL8xPI02YMb05wZkntUHGXSvu6wlya6qPA
	WhPnh/l//9SgEEZUbJ1b3iO4I4/sINqBmciuPQp9Q+G+1Iwxx0VtrD2r9dI915AwCXWLO3981CO
	PM5gnMxwRM9YCZNppizpTvoGcmKnedRATgHz2FQJ37jRbEn1m8FCilWKzBALs=
X-Received: by 2002:a5d:5d85:0:b0:439:b715:6f49 with SMTP id ffacd0b85a97d-439f8415ffdmr7026337f8f.59.1773257114322;
        Wed, 11 Mar 2026 12:25:14 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:38b7:8ca3:cb55:d344])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm1323210f8f.21.2026.03.11.12.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:25:13 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 15/15] irqchip/renesas-rzg2l: Add shared interrupt support
Date: Wed, 11 Mar 2026 19:24:46 +0000
Message-ID: <20260311192459.609064-16-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29257-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 2EC172695AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of external interrupts in RZ/G2L and RZ/G3L SoC are
different. The RZ/G3L has 16 external interrupts out of which it shares 8
interrupts with TINT, whereas RZ/G2L has only 8 external interrupts. Add
shared_irq variable in struct rzg2l_hw_info to handle these differences by
adding the callback irq_{request,release}_resources().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Added callback irq_{request,release}_resources() to both irq and tint
   interrupt chips.
v3->v4:
 * Updated commit header irq->interrupt.
 * Updated commit description IRQs->interrupts.
 * Updated shared_irq_cnt variable type from u8->unsigned int.
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 92 +++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index e4c06e382120..aa65ab379179 100644
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
@@ -333,6 +339,83 @@ static void rzg2l_irqc_tint_enable(struct irq_data *d)
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
@@ -468,6 +551,8 @@ static int rzg2l_irqc_irq_suspend(void *data)
 	void __iomem *base = rzg2l_irqc_data->base;
 
 	cache->iitsr = readl_relaxed(base + IITSR);
+	if (rzg2l_irqc_data->info.shared_irq_cnt)
+		cache->inttsel = readl_relaxed(base + INTTSEL);
 	for (u8 i = 0; i < 2; i++)
 		cache->titsr[i] = readl_relaxed(base + TITSR(i));
 
@@ -486,6 +571,8 @@ static void rzg2l_irqc_irq_resume(void *data)
 	 */
 	for (u8 i = 0; i < 2; i++)
 		writel_relaxed(cache->titsr[i], base + TITSR(i));
+	if (rzg2l_irqc_data->info.shared_irq_cnt)
+		writel_relaxed(cache->inttsel, base + INTTSEL);
 	writel_relaxed(cache->iitsr, base + IITSR);
 }
 
@@ -505,6 +592,8 @@ static const struct irq_chip rzg2l_irqc_irq_chip = {
 	.irq_unmask		= irq_chip_unmask_parent,
 	.irq_disable		= irq_chip_disable_parent,
 	.irq_enable		= irq_chip_enable_parent,
+	.irq_request_resources	= rzg2l_irqc_irq_request_resources,
+	.irq_release_resources	= rzg2l_irqc_irq_release_resources,
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
@@ -522,6 +611,8 @@ static const struct irq_chip rzg2l_irqc_tint_chip = {
 	.irq_unmask		= irq_chip_unmask_parent,
 	.irq_disable		= rzg2l_irqc_tint_disable,
 	.irq_enable		= rzg2l_irqc_tint_enable,
+	.irq_request_resources	= rzg2l_irqc_irq_request_resources,
+	.irq_release_resources	= rzg2l_irqc_irq_release_resources,
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
@@ -722,6 +813,7 @@ static const struct rzg2l_hw_info rzg3l_hw_params = {
 	.irq_count	= 16,
 	.tint_start	= IRQC_IRQ_START + 16,
 	.num_irq	= IRQC_IRQ_START + 16 + IRQC_TINT_COUNT,
+	.shared_irq_cnt	= 8,
 };
 
 static const struct rzg2l_hw_info rzg2l_hw_params = {
-- 
2.43.0


