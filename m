Return-Path: <linux-renesas-soc+bounces-30688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INiUIo4OzWnhZgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 14:24:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C1237A64F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 14:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99D6530AD4B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 11:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE6A3F99E4;
	Wed,  1 Apr 2026 11:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POuV7vQ6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38BD3F99EF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Apr 2026 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043910; cv=none; b=EUA9bUTLLlgFCoulEe71vOLmYa2fhUXl+K0RePiDujDbHJ/D1hgFAOpdPSmRWPXQmqYj4EWr3WrTbZqc+foiGoXbagW1aaAGgwY8UlI0SwJPJIoTJIyfsgJKcGH4Ng+ke1bs+cpk+vzb/6D3DEeIHRHL2ve2PiwDqAIqRatf7xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043910; c=relaxed/simple;
	bh=sX5Q9psoDkwYFXjEwonbSRbV7XcMncEJKqJRvvOhEXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HjAVRIjVvVJ37juXGc/+AkDann/Ha44iJLNhM2jQAZLPk++HgeXhBimD0hdm/9uacKfLWWV5xTNt/EaGS3jk7YdLVB9hVEH57oF4bWiHWd+yADkbX8BWauVXrC9O+vb5b17SYpXIUos/apks88Cq++lrHhuqWd7rOl7FB+zg7R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POuV7vQ6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so80048495e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Apr 2026 04:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775043907; x=1775648707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S7tUhnKJfryQMq8UMuwWIK2pWGEPPiKybIC2U2jfHfs=;
        b=POuV7vQ6tfGXaLs10P2zpDyc8tEjP50iFNEa5iKHkmNHc/dcC2Bq4MF17UXFKiKzPw
         Asr6qj1JMJOstas7NBW9p17pD77HcpyPBrw1ROC/u+SdewH/mTYpzvIRaLwScsYIrf7R
         WRfBDy65hiMKGeJ2pEAUNxDI5KxqB5PF1yCsYDCYU7afvYLgad4a3ReSPYDR+7OJEPwY
         C0Qy+C9KBOLqnzI79Nkz3u+N8TUyGCzYAiC95EnfwpiMthhqsazkafGRoJ8LukXcy6R3
         49TDqHTxezpxMc4BJ3RPZJTAVffSfEJZ+LYBtd9P0vBo0bq0jnNg0MoqDXilWW2QqMbn
         yL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043907; x=1775648707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7tUhnKJfryQMq8UMuwWIK2pWGEPPiKybIC2U2jfHfs=;
        b=HnBiubv5Bt56LXE91MNEQzlYMPWOQkR9fz8GvIpYTcElDjOiZc6ZtmMQFEBqypc1dN
         ZYMxKaN8s9HmZadZI2qTTMCV5nmzgEloAUo1luazncTd0z5mcwR6Fsk55tf96udcmkVY
         kGdvSJpG+eWDZU0S+cFEbWfEMV8PiooqEWzjcaS+LYoemoUi3aTuDuOE1Y1FHOEZP8n0
         LLEMHLEUlaOk5mRgLbTz3/ztBRq+YxrSG+ewwKGCbViVqdDEb03Q0cDJbnQAkl+bOpUV
         E0NWTmJsExyuIdY/mu9IWbk9ai6Goro0vJWb9zq+9fIYHMH9iY+QFsZ8SKgWTnTxEv/6
         IGrw==
X-Forwarded-Encrypted: i=1; AJvYcCVpMQA3ZdXr7F9CvUYTut7XoDZWNXA7rj1WJdtLLQK69/R3ZD4i54pg/1yqTTN4eS1j9PMDIoA5zW8AtMP5gicacA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXE7b9JNUIZTm5kdAMV5IIMyM27P+SP9GdtzyYTHpfNwYwBldT
	QVhPh+/f0MgACzY0dgw9ikCfA3Ngvq+srSoTD4A/kMwVtsRnm1TxIJzt
X-Gm-Gg: ATEYQzyDT4Adt4DIzoHOkcwaHFhL6s6PWhPnfu9fYdBx5Rq0jdkM/n70n+7TKbynXvT
	gZ4O4+5BLFXG+rCfVrJcmm96sI1G4YdyRzHnzp9X4XxkHImpiSJpN0zqnTTZPy+xS9UsEpEi3UR
	6A9ZU6BtowZdHa3hIg5RRMTJwP398Qoze9vKqrPb5mKjeKtdjDcgO0LdMm9V5Eu/GtEvbcM7Ytj
	yqXilQ1xuRyfr3scrYtFwErgOpSsN0qO8W4BeiPurg9eHs8Pv8SQoplhNlwQ43SXX/VFAOcH6K1
	SaHLdaNDJqepZr5iwyVhYoWKEI0vayMaSEv++LEx8m/s3o62QKrOOTqEeJnaropXFtJ7mRCJFJA
	l8LhiwfOzphdeS+Lh577ImhmqqYvtjM5orMPvllaCLwpI/MS3RC3sN43XUbIHkkBc2FbPvNAOnq
	Ph1EzPe/gSS5Djuf/SBkZrdKiyWXHAupd+4HrrtHjKjgUHxXSW
X-Received: by 2002:a05:6000:40dd:b0:439:b60a:b400 with SMTP id ffacd0b85a97d-43d150bd4acmr6289232f8f.31.1775043906853;
        Wed, 01 Apr 2026 04:45:06 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:cd6c:7c48:e40b:4bf3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf330872asm32929035f8f.17.2026.04.01.04.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:45:06 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] irqchip/renesas-rzg2l: Add NMI support
Date: Wed,  1 Apr 2026 12:45:00 +0100
Message-ID: <20260401114504.332825-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30688-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 00C1237A64F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G2L SoC has an NMI interrupt. Add support for the NMI interrupt.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Added a comment in rzg2l_clear_nmi_int() and dropped the lock in the
   caller as it is not an RMW operation.
 * Added the macro NSCR_NSTAT to indicate the NMI status bit.
 * Dropped the function parameter hwirq in rzg2l_clear_nmi_int().
 * Updated the commit description from RZ/G3L to RZ/G2L to cover all SoCs.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 91 ++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 199b3c6b02c8..b94949987ae3 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -20,11 +20,14 @@
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
@@ -43,6 +46,10 @@
 #define TSSR_OFFSET(n)			((n) % 4)
 #define TSSR_INDEX(n)			((n) / 4)
 
+#define NSCR_NSTAT			0
+#define NITSR_NTSEL_EDGE_FALLING	0
+#define NITSR_NTSEL_EDGE_RISING		1
+
 #define TITSR_TITSEL_EDGE_RISING	0
 #define TITSR_TITSEL_EDGE_FALLING	1
 #define TITSR_TITSEL_LEVEL_HIGH		2
@@ -63,11 +70,13 @@
 
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
@@ -116,6 +125,23 @@ static struct rzg2l_irqc_priv *irq_data_to_priv(struct irq_data *data)
 	return data->domain->host_data;
 }
 
+static void rzg2l_clear_nmi_int(struct rzg2l_irqc_priv *priv)
+{
+	u32 bit = BIT(NSCR_NSTAT);
+	u32 reg;
+
+	/* Writing is allowed only when NSTAT is 1 */
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
@@ -155,6 +181,14 @@ static void rzg2l_clear_tint_int(struct rzg2l_irqc_priv *priv, unsigned int hwir
 	}
 }
 
+static void rzg2l_irqc_nmi_eoi(struct irq_data *d)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+
+	rzg2l_clear_nmi_int(priv);
+	irq_chip_eoi_parent(d);
+}
+
 static void rzg2l_irqc_irq_eoi(struct irq_data *d)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
@@ -341,6 +375,29 @@ static void rzg2l_irqc_tint_enable(struct irq_data *d)
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
@@ -467,11 +524,23 @@ static int rzg2l_irqc_tint_set_type(struct irq_data *d, unsigned int type)
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
@@ -496,6 +565,7 @@ static void rzg2l_irqc_irq_resume(void *data)
 	if (rzg2l_irqc_data->info.shared_irq_cnt)
 		writel_relaxed(cache->inttsel, base + INTTSEL);
 	writel_relaxed(cache->iitsr, base + IITSR);
+	writel_relaxed(cache->nitsr, base + NITSR);
 }
 
 static const struct syscore_ops rzg2l_irqc_syscore_ops = {
@@ -507,6 +577,23 @@ static struct syscore rzg2l_irqc_syscore = {
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
@@ -662,7 +749,9 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
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


