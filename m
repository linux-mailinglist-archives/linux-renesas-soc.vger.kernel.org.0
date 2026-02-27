Return-Path: <linux-renesas-soc+bounces-28534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNhNJ6WloWl/vQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:09:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 462721B8697
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F5013091963
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 14:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A413423141;
	Fri, 27 Feb 2026 14:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+DW3ld3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C849436376
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 14:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201008; cv=none; b=ufF3QAR2O7/6dxcDIGKvBP02TGOhcvl+7l7xz3kME+EnObIK3RWrt835VBYm1zH4co6j/9gIVZwJ6usiLE9hTocly7WroMfZbyJSHxQ68loq6cWoVL/KwvYi3IXX71y8HSmo5HIg4Mb92SyJ7CEDJRbjNLc1aPNMdQRVKaVBqlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201008; c=relaxed/simple;
	bh=5Ob4If5bM1vydiRMvU1sj5ib8uHPbHMbNwg2lGsnstQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HIL4FO8zZu4BGFdF5wW/Q3y9Flh0af/Nq5gIcrwPWtU+CTtozrJDcIDG99ymhzlLFIJvTbWWj7ELMDsADL3yDNMZS1l5fe52smPqu7DRrTjMoj8sYXaKk96LMF5HkECKpItH0eAXIVrt2JoLlQMAzjjh6y+7Puh7k6gw5mUrqGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+DW3ld3; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4398f9e3b40so2153297f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772201005; x=1772805805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EHC7NrypUxgz1lYY6iG3E5oOhgzT9flGec5pjdwbFc=;
        b=M+DW3ld3pjndjhmlwpB0x5E1OC4LqNUNqZ05U3e9vGQnNjUDbZvsEdqRh+Zw8umnc0
         u/9uVQqYnMUv0pvphYEVCtuoWYrH645gTK4RTdKhj74xszXN/8XAOfJ+aEEozsF+sSf3
         aUpWYtWM+w6e+rs9b4ONWIhrd/xmMbdWsH330ZlkudtGvB/NmtFrXLow9Y7OsUeh7XXZ
         FhKE3qCBnXcJu+vcco5H7d9CX7T7lmXSXEThmMHDO4gOxBz6nJVPYsrQ5UZCeuGwO2i3
         7caFuW05FQa69DCWPJoZY/YTtTPcWcQmHegXfS9ZpB5NXAwE8RhoKXQKgrUmDFQuoW3H
         eGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772201005; x=1772805805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9EHC7NrypUxgz1lYY6iG3E5oOhgzT9flGec5pjdwbFc=;
        b=HFxzXQ0c1zLCUrF0idGCrYOoUhgzQDltEc0fqdGAv0/akBa/udbB/o3atEKKksE3NO
         O2s9eEJAW4Shgs+zZEbD/CROQz7Y7u3s5PDzT3m9p1pricZ12kYJiI3vDTnPaRrfJRzw
         g9zSmZB5/Z8YHcu+gmWED7TYf5J8FXFwvxK8O4a2qhg2QPyAycrfMMCoMfApz/0lADcB
         qj4i/6CKG4QdRcqGPTQIqSNNki6hGb3V1UFmSKc1RerjpRwyGKCfVf2coLVlVHMQiIDk
         0uu5VqaCHPoZNlkaAv2MmpaWLTpsJC1vYlRHvI56wO46k862jQV23pC9T/Zpcb+eHvfS
         04qA==
X-Forwarded-Encrypted: i=1; AJvYcCXBuEQK9PnYN78H2XLy7YiE3mY1KJsY/yz/5jIH/En5IHswX7Vd9x1jzciUPQt3JaZnZzsHLubN3rd0L5sbnlKAOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmA2LbQ/66VwnWDL9OqnNp/ItoUsyreIGM9XackuFYlI5QvfbG
	YeHbEfK3oZy+Ru8q31kowpPy5WOBGD5XFg0lNZ9H/mq9oL278strw3VS
X-Gm-Gg: ATEYQzzYtxzaR8kuLEr3W0nhcxsxfufSlOn6C40yloB4tlTuS08Gstw+jd9KvSivvA6
	7eXDTnWwIdOs3Z/dEsWVj7r+oMWaIk5WFhbvigZ6GRhUxaqwo/TxXVJH6pkdNOmD0z1ZgXoXSj7
	4+SxpbdNhlIuThtkGTj+/SLjoKH1SB02XCyOMdQo0mdI5UcPwXm3JyQSf2qO8HUQjHF3hgaIsN8
	zrV5I1mBZjUR8JfY1fOyXBKRD64UZ+5UMJvm9XFsyRYkpwuuMVv0twxswqXgDF+/k1j+arhnHP6
	+VztK7DzFDgsq/M7P2dcDBMJ7EPvsNTmOBvYZD6sfwlm7NwvaLxUKcpo/cScGVDz4dnSL/q9YK0
	BsJQdqSqRSMGGxjLLxj/cBU9qG6anyTXBhW5tGMLFktX2QF7L+Cz/oMYuiUzsxVgByM36Aq7v8N
	zONrxVKY0nietOvDM8NsOO4R8KvW6zBLo=
X-Received: by 2002:a05:6000:240d:b0:436:3536:f698 with SMTP id ffacd0b85a97d-4399de3e4d4mr4811989f8f.30.1772201004687;
        Fri, 27 Feb 2026 06:03:24 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:4d8b:fefb:26cf:1906])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60feeesm7658811f8f.1.2026.02.27.06.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:03:24 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 5/9] irqchip/renesas-rzg2l: Drop IRQC_TINT_START macro
Date: Fri, 27 Feb 2026 14:03:05 +0000
Message-ID: <20260227140316.308106-6-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-28534-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 462721B8697
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The IRQC_TINT_START value is different for RZ/G3L and RZ/G2L SoC. Add
tint_start variable in struct rzg2l_hw_info to handle this difference
and drop the macro IRQC_TINT_START.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated commit description 'this differences->this difference'.
 * Updated tint_start variable type from u8-> unsigned int.
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 30 +++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 412273ae860f..6bd20aedbcea 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -22,7 +22,6 @@
 
 #define IRQC_IRQ_START			1
 #define IRQC_IRQ_COUNT			8
-#define IRQC_TINT_START			(IRQC_IRQ_START + IRQC_IRQ_COUNT)
 #define IRQC_TINT_COUNT			32
 
 #define ISCR				0x10
@@ -69,9 +68,11 @@ struct rzg2l_irqc_reg_cache {
 
 /**
  * struct rzg2l_hw_info - Interrupt Control Unit controller hardware info structure.
+ * @tint_start:		Start of TINT interrupts
  * @num_irq:		Total Number of interrupts
  */
 struct rzg2l_hw_info {
+	unsigned int	tint_start;
 	unsigned int	num_irq;
 };
 
@@ -123,7 +124,7 @@ static void rzg2l_clear_irq_int(struct rzg2l_irqc_priv *priv, unsigned int hwirq
 
 static void rzg2l_clear_tint_int(struct rzg2l_irqc_priv *priv, unsigned int hwirq)
 {
-	u32 bit = BIT(hwirq - IRQC_TINT_START);
+	u32 bit = BIT(hwirq - priv->info.tint_start);
 	u32 reg;
 
 	reg = readl_relaxed(priv->base + TSCR);
@@ -145,7 +146,7 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
 	raw_spin_lock(&priv->lock);
 	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
 		rzg2l_clear_irq_int(priv, hw_irq);
-	else if (hw_irq >= IRQC_TINT_START && hw_irq < priv->info.num_irq)
+	else if (hw_irq >= priv->info.tint_start && hw_irq < priv->info.num_irq)
 		rzg2l_clear_tint_int(priv, hw_irq);
 	raw_spin_unlock(&priv->lock);
 	irq_chip_eoi_parent(d);
@@ -170,7 +171,7 @@ static void rzfive_irqc_unmask_irq_interrupt(struct rzg2l_irqc_priv *priv,
 static void rzfive_irqc_mask_tint_interrupt(struct rzg2l_irqc_priv *priv,
 					    unsigned int hwirq)
 {
-	u32 bit = BIT(hwirq - IRQC_TINT_START);
+	u32 bit = BIT(hwirq - priv->info.tint_start);
 
 	writel_relaxed(readl_relaxed(priv->base + TMSK) | bit, priv->base + TMSK);
 }
@@ -178,7 +179,7 @@ static void rzfive_irqc_mask_tint_interrupt(struct rzg2l_irqc_priv *priv,
 static void rzfive_irqc_unmask_tint_interrupt(struct rzg2l_irqc_priv *priv,
 					      unsigned int hwirq)
 {
-	u32 bit = BIT(hwirq - IRQC_TINT_START);
+	u32 bit = BIT(hwirq - priv->info.tint_start);
 
 	writel_relaxed(readl_relaxed(priv->base + TMSK) & ~bit, priv->base + TMSK);
 }
@@ -191,7 +192,7 @@ static void rzfive_irqc_mask(struct irq_data *d)
 	raw_spin_lock(&priv->lock);
 	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
 		rzfive_irqc_mask_irq_interrupt(priv, hwirq);
-	else if (hwirq >= IRQC_TINT_START && hwirq < priv->info.num_irq)
+	else if (hwirq >= priv->info.tint_start && hwirq < priv->info.num_irq)
 		rzfive_irqc_mask_tint_interrupt(priv, hwirq);
 	raw_spin_unlock(&priv->lock);
 	irq_chip_mask_parent(d);
@@ -205,7 +206,7 @@ static void rzfive_irqc_unmask(struct irq_data *d)
 	raw_spin_lock(&priv->lock);
 	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
 		rzfive_irqc_unmask_irq_interrupt(priv, hwirq);
-	else if (hwirq >= IRQC_TINT_START && hwirq < priv->info.num_irq)
+	else if (hwirq >= priv->info.tint_start && hwirq < priv->info.num_irq)
 		rzfive_irqc_unmask_tint_interrupt(priv, hwirq);
 	raw_spin_unlock(&priv->lock);
 	irq_chip_unmask_parent(d);
@@ -216,8 +217,8 @@ static void rzfive_tint_irq_endisable(struct irq_data *d, bool enable)
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
 
-	if (hwirq >= IRQC_TINT_START && hwirq < priv->info.num_irq) {
-		u32 offset = hwirq - IRQC_TINT_START;
+	if (hwirq >= priv->info.tint_start && hwirq < priv->info.num_irq) {
+		u32 offset = hwirq - priv->info.tint_start;
 		u32 tssr_offset = TSSR_OFFSET(offset);
 		u8 tssr_index = TSSR_INDEX(offset);
 		u32 reg;
@@ -261,9 +262,9 @@ static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hw_irq = irqd_to_hwirq(d);
 
-	if (hw_irq >= IRQC_TINT_START && hw_irq < priv->info.num_irq) {
+	if (hw_irq >= priv->info.tint_start && hw_irq < priv->info.num_irq) {
 		struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
-		u32 offset = hw_irq - IRQC_TINT_START;
+		u32 offset = hw_irq - priv->info.tint_start;
 		u32 tssr_offset = TSSR_OFFSET(offset);
 		u8 tssr_index = TSSR_INDEX(offset);
 		u32 reg;
@@ -354,7 +355,7 @@ static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
-	u32 titseln = hwirq - IRQC_TINT_START;
+	u32 titseln = hwirq - priv->info.tint_start;
 	u32 tssr_offset = TSSR_OFFSET(titseln);
 	u8 tssr_index = TSSR_INDEX(titseln);
 	u8 index, sense;
@@ -401,7 +402,7 @@ static int rzg2l_irqc_set_type(struct irq_data *d, unsigned int type)
 
 	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
 		ret = rzg2l_irq_set_type(d, type);
-	else if (hw_irq >= IRQC_TINT_START && hw_irq < priv->info.num_irq)
+	else if (hw_irq >= priv->info.tint_start && hw_irq < priv->info.num_irq)
 		ret = rzg2l_tint_set_edge(d, type);
 	if (ret)
 		return ret;
@@ -503,7 +504,7 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 		tint = TINT_EXTRACT_GPIOINT(hwirq);
 		hwirq = TINT_EXTRACT_HWIRQ(hwirq);
 
-		if (hwirq < IRQC_TINT_START)
+		if (hwirq < priv->info.tint_start)
 			return -EINVAL;
 	}
 
@@ -606,6 +607,7 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 }
 
 static const struct rzg2l_hw_info rzg2l_hw_params = {
+	.tint_start	= IRQC_IRQ_START + IRQC_IRQ_COUNT,
 	.num_irq	= IRQC_IRQ_START + IRQC_IRQ_COUNT + IRQC_TINT_COUNT,
 };
 
-- 
2.43.0


