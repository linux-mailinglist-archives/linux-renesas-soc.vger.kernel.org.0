Return-Path: <linux-renesas-soc+bounces-30542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMwaFjH7x2mIfwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 17:00:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5ED34F0F0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 17:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34376300E18D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 16:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D121FBEA6;
	Sat, 28 Mar 2026 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emEfq1u3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C2C1CAA78
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Mar 2026 16:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713644; cv=none; b=erY59mWrIIaDfUe01tyQz4aQVPZFmOhIJfnccnxV1Feti84gJBw3y2br31AcFzVyeKsXVTYVYIbG+/m3l7dtSU/ZhptL7fnOdoA43AgnguGwirnPz8VWTXrgRoYiuHzbjEF2S1icRCJfHhPptWB8Zem7bgzoPNTJ/Udoc9RE7DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713644; c=relaxed/simple;
	bh=w7TmUTgbL9zl6od+opO8xq68MVkno4uLaMcsQ+ulwE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NzShiWMFfgJZYWS4O9//dqwgoiAlBuyq681Te4jqK2PKcVu+tydOCoCInsZ9YGSq2kFezAVifhH47SBQauyjwahIV3SU01x34WJG00Btnxmr1w9/pPV7CR9+J6uKBVatmC9d2JFYBsVi5Bsx6CMkpA7Ta7HpVRKvK0MQff09OZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emEfq1u3; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b982518b73fso500221166b.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Mar 2026 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774713641; x=1775318441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHoBsrk9SqpNgVAjtIrulPLCR2MHos8msYqRriX+K0k=;
        b=emEfq1u3SFrGuP75zyMuOEQ/tbBJDI3ouXs1TbIo4iEAaueDefO9CXGWxyMYGoNANF
         Ot669cHvczrbx0s72of4Q/kBuu+wmlQDyx49XDTLYNXuUsoyqpHH/wACHcLjx3TgW+0g
         wQaJCaL2W+UFZCUWcXDgBlvGwrlq2QDVyFZsqDXao8vkcQuul24pYwTlWHI7bB8ddDcE
         zc7MaipwvXD9xI3ui/04nV6FzwMopf6BoRRSXkyIG4ZdTYkj/c4Er6QwJEfDSqCVdTFI
         EsuIkjWQc+CpR5yIfinS3pud64lYYZmogVz9SEbsNgV5K1qcSD6TNTLJE40lHwkhcHYl
         O/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774713641; x=1775318441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wHoBsrk9SqpNgVAjtIrulPLCR2MHos8msYqRriX+K0k=;
        b=cnzkgLkFFRE0I31dUyx1Jr8WMCHnXrwd/xIo+7JhNOxYIDN7WtXQXALBhd0UVGWFj1
         gwuSH50g5LqmLWzo41Yxi4NNEyEWzpWLlkBAN7OqPVUfTeNAqjdDooJA+k6u5v0hucNy
         /3a04t5j/389VCJNZifcCWs6jKWGc1BhTZRjkdzwD2oC7TsNBDPLPSSPgmo46xxhbkMK
         J4yMQJmtL0QfS79HbIcT0Wq3mOcRlDnC7A10fED6oHwM9rt2hT+4Gw25HvxphXb3bamw
         B7mfzwSMWR84M8o2nRFIyw+/PM8WykhghDmNfSPC4U3Kn3CqEzTu6krtgShGNkik2dEx
         qtYw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ3wiimlvkXYqfZXqOcYRSp97FIP3MbC4hYuKsEwwNCo+H56kP3yilCRD2Afh+BVtl7bEA9iFCyIMWfZGuRWpI+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0XQYhBU8Lr93KSOLD98158gFTtr9H6XPPsVhNB9fNSg7XCVFb
	zHPzeCQZTY563pNOX2LhtBtpl+TYY/PxTLsylWjaxLoSiSK+f3Y9e1u8GADp5Q==
X-Gm-Gg: ATEYQzwQAB8xjT9vSLlUTvtq3iHiwg+EuOP7ZBKD89dK8TTG4cJvG2giAc2sK+Ac6GE
	PCdUpWa4TIT6tUwH5P15LywCKUntFl63yE3b0TAeTNnYdNVBchebjWg6G9qHLbHgYhI3aVZi0qQ
	ikjjyzZ7zklT/ZE1Do0LA1LL7w4EMF1T3NdtmHYKwsSt92fG6iJFAVcOVcT2wZo8Tn+O71i2mi9
	2xfmtuK/55sGI2RbB6q49J85PiFiV6U0VZ4lfNtlGpXiJx11rGjNHu2pffjRYTGOrdrWoLYmjBU
	LJZCC1y1/nxktevRFqKNWLjMqCIEKwTs4kbNhspaOhvrNEFo4+O4Li5knyik0V5qhotCWQEL/fD
	M9+x+nkMFSv7Pq48a+2kue8Ccr0Nc7OaNQNCemtwDLSeKrC/PmmaWFfRhvpfOenotzfgtUgEI3s
	oVnW9sBLicwjgBFuGKJT1gIGSL0LIlDbEzqM4EiLZrMLOWBE4W
X-Received: by 2002:a05:600c:1d1e:b0:486:ffa3:55f with SMTP id 5b1f17b1804b1-48727f069eemr96224775e9.27.1774694009345;
        Sat, 28 Mar 2026 03:33:29 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8a55:5310:98fe:930d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487270fd880sm42270035e9.8.2026.03.28.03.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 03:33:29 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/3] irqchip/renesas-rzg2l: Add NMI support
Date: Sat, 28 Mar 2026 10:33:20 +0000
Message-ID: <20260328103324.134131-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260328103324.134131-1-biju.das.jz@bp.renesas.com>
References: <20260328103324.134131-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30542-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 5D5ED34F0F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC has an NMI interrupt. Add support for the NMI interrupt.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 92 ++++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 0f1157d5ce55..622a9045b606 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -21,11 +21,14 @@
 #include <linux/spinlock.h>
 #include <linux/syscore_ops.h>
 
+#define IRQC_NMI			0
 #define IRQC_IRQ_START			1
 #define IRQC_TINT_COUNT			32
 #define IRQC_SHARED_IRQ_COUNT		8
 #define IRQC_IRQ_SHARED_START		(IRQC_IRQ_START + IRQC_SHARED_IRQ_COUNT)
 
+#define NSCR				0x0
+#define NITSR				0x4
 #define ISCR				0x10
 #define IITSR				0x14
 #define TSCR				0x20
@@ -44,6 +47,9 @@
 #define TSSR_OFFSET(n)			((n) % 4)
 #define TSSR_INDEX(n)			((n) / 4)
 
+#define NITSR_NTSEL_EDGE_FALLING	0
+#define NITSR_NTSEL_EDGE_RISING		1
+
 #define TITSR_TITSEL_EDGE_RISING	0
 #define TITSR_TITSEL_EDGE_FALLING	1
 #define TITSR_TITSEL_LEVEL_HIGH		2
@@ -64,11 +70,13 @@
 
 /**
  * struct rzg2l_irqc_reg_cache - registers cache (necessary for suspend/resume)
+ * @nitsr: NITSR register
  * @iitsr: IITSR register
  * @inttsel: INTTSEL register
  * @titsr: TITSR registers
  */
 struct rzg2l_irqc_reg_cache {
+	u32	nitsr;
 	u32	iitsr;
 	u32	inttsel;
 	u32	titsr[2];
@@ -117,6 +125,22 @@ static struct rzg2l_irqc_priv *irq_data_to_priv(struct irq_data *data)
 	return data->domain->host_data;
 }
 
+static void rzg2l_clear_nmi_int(struct rzg2l_irqc_priv *priv, unsigned int hwirq)
+{
+	u32 bit = BIT(hwirq);
+	u32 reg;
+
+	reg = readl_relaxed(priv->base + NSCR);
+	if (reg & bit) {
+		writel_relaxed(reg & ~bit, priv->base + NSCR);
+		/*
+		 * Enforce that the posted write is flushed to prevent that the
+		 * just handled interrupt is raised again.
+		 */
+		readl_relaxed(priv->base + NSCR);
+	}
+}
+
 static void rzg2l_clear_irq_int(struct rzg2l_irqc_priv *priv, unsigned int hwirq)
 {
 	unsigned int hw_irq = hwirq - IRQC_IRQ_START;
@@ -156,6 +180,17 @@ static void rzg2l_clear_tint_int(struct rzg2l_irqc_priv *priv, unsigned int hwir
 	}
 }
 
+static void rzg2l_irqc_nmi_eoi(struct irq_data *d)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hw_irq = irqd_to_hwirq(d);
+
+	scoped_guard(raw_spinlock, &priv->lock)
+		rzg2l_clear_nmi_int(priv, hw_irq);
+
+	irq_chip_eoi_parent(d);
+}
+
 static void rzg2l_irqc_irq_eoi(struct irq_data *d)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
@@ -342,6 +377,29 @@ static void rzg2l_irqc_tint_enable(struct irq_data *d)
 	irq_chip_enable_parent(d);
 }
 
+static int rzg2l_nmi_set_type(struct irq_data *d, unsigned int type)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	u32 sense;
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_FALLING:
+		sense = NITSR_NTSEL_EDGE_FALLING;
+		break;
+
+	case IRQ_TYPE_EDGE_RISING:
+		sense = NITSR_NTSEL_EDGE_RISING;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	writel_relaxed(sense, priv->base + NITSR);
+
+	return 0;
+}
+
 static int rzg2l_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
@@ -468,11 +526,23 @@ static int rzg2l_irqc_tint_set_type(struct irq_data *d, unsigned int type)
 	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
 }
 
+static int rzg2l_irqc_nmi_set_type(struct irq_data *d, unsigned int type)
+{
+	int ret;
+
+	ret = rzg2l_nmi_set_type(d, type);
+	if (ret)
+		return ret;
+
+	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
+}
+
 static int rzg2l_irqc_irq_suspend(void *data)
 {
 	struct rzg2l_irqc_reg_cache *cache = &rzg2l_irqc_data->cache;
 	void __iomem *base = rzg2l_irqc_data->base;
 
+	cache->nitsr = readl_relaxed(base + NITSR);
 	cache->iitsr = readl_relaxed(base + IITSR);
 	if (rzg2l_irqc_data->info.shared_irq_cnt)
 		cache->inttsel = readl_relaxed(base + INTTSEL);
@@ -497,6 +567,7 @@ static void rzg2l_irqc_irq_resume(void *data)
 	if (rzg2l_irqc_data->info.shared_irq_cnt)
 		writel_relaxed(cache->inttsel, base + INTTSEL);
 	writel_relaxed(cache->iitsr, base + IITSR);
+	writel_relaxed(cache->nitsr, base + NITSR);
 }
 
 static const struct syscore_ops rzg2l_irqc_syscore_ops = {
@@ -508,6 +579,23 @@ static struct syscore rzg2l_irqc_syscore = {
 	.ops = &rzg2l_irqc_syscore_ops,
 };
 
+static const struct irq_chip rzg2l_irqc_nmi_chip = {
+	.name			= "rzg2l-irqc",
+	.irq_eoi		= rzg2l_irqc_nmi_eoi,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_disable		= irq_chip_disable_parent,
+	.irq_enable		= irq_chip_enable_parent,
+	.irq_get_irqchip_state	= irq_chip_get_parent_state,
+	.irq_set_irqchip_state	= irq_chip_set_parent_state,
+	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.irq_set_type		= rzg2l_irqc_nmi_set_type,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.flags			= IRQCHIP_MASK_ON_SUSPEND |
+				  IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE,
+};
+
 static const struct irq_chip rzg2l_irqc_irq_chip = {
 	.name			= "rzg2l-irqc",
 	.irq_eoi		= rzg2l_irqc_irq_eoi,
@@ -663,7 +751,9 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 	 * from 16-31 bits. TINT from the pinctrl driver needs to be programmed
 	 * in IRQC registers to enable a given gpio pin as interrupt.
 	 */
-	if (hwirq > priv->info.irq_count) {
+	if (hwirq == IRQC_NMI) {
+		chip = &rzg2l_irqc_nmi_chip;
+	} else if (hwirq > priv->info.irq_count) {
 		tint = TINT_EXTRACT_GPIOINT(hwirq);
 		hwirq = TINT_EXTRACT_HWIRQ(hwirq);
 		chip = priv->tint_chip;
-- 
2.43.0


