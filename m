Return-Path: <linux-renesas-soc+bounces-27915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HQZH7CNg2lCpQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:19:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A43EB8DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CA571307529B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 18:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194E143CECC;
	Wed,  4 Feb 2026 18:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/RENfQl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC13443C07E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 18:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770228400; cv=none; b=sO9MmZzv4H+X+nre2B9xGlqrpW6tkP5+ay3ptG3bywZXhRBcCdGumNU3QBaPlYjNFKxmjcBDm/GAVZ1GICjjDluS+46CRxYaHU8tHCfRy2xptCSc2NoiUqYmO/YhHqXOvV/cMtOlxwpKRHFqS2udZD48GAJv1WKoxiqCgiH6z6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770228400; c=relaxed/simple;
	bh=PpPVFRAN0iN1fyvnm4TdGF22E+IbgfrWf5Po/PcS9cI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eXVsh2WxQBhu6LZHIupAG6yVGrhO2m/VLXC7OW5PHNwh5GgxkSbGkdP4VKAPIXzV4aC271xvntvZE/eJdaMwXjoKEyn9/9H+tqaCgcCgNOBpZAu0i59zFuDVRBvfP2Im5umYKWL/YPrPCmFnUJVHQ9K+CT0XZks9dkoXpGcd1A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/RENfQl; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so1899790a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 10:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770228398; x=1770833198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dt6q7jAWRp4ui1sx/u2q6wwNla3li99MhJ8mo4d6x+A=;
        b=D/RENfQlsrDhK0flkbtrCXvT0fXB2ToCmG3wBOIjQLgIEp2CkgQhAwxPwNd5LJL8i5
         dmO9G22O4Kmvg8yEKWu65wb8iDXuXWYXfXQ8Sc70KXlarh5/lIX6W3LplG0cyBuZXDHz
         1wZ+VIrLmJ/zbrgrdL9gqlAntygVB0+epFSz+US73PDukVKi1Qt79CNH9yzBgf4w1Hwt
         K4LyCOK6QkezsP/TProA8wLKaPzRkVWSWYGA1ctXMQL2z/N+4ZhgaiB+nPwAMv0BGtce
         30fEBukvxZBTEUL4AjpaJFOyYHvaZMVWXJPuCp17jI4dOvW+ecAvkZ7jjo/EFNVRVOs/
         d+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770228398; x=1770833198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dt6q7jAWRp4ui1sx/u2q6wwNla3li99MhJ8mo4d6x+A=;
        b=FnDzQVgmDqK0Wz6Jw6wbkHalOAz6cPp2Eu/5Nwvu1bqUDmPf5Gp/ORGdroB7nLnShf
         Ir5/vMW3tveh5XWoXmX9fQs1CmmVKaIYOtFvPbOrd49tH7dzRmJkvmHKmvFX5n+OEAEX
         YnV7x81G6qA+Uy2chDu/GaaMWQrFUICkS2pW/SbtWoK4SheBLr0mp4lFxio+A3gXwKNq
         riU6me9FqEJI+VEbGejUIFGfHAayF6rQtjaJnqRVJkLbZlrC/vxEA4KKKtuJQFLDK78r
         KrRw+USJC5lM3UykxNkzEBNfsrzCj+6Bn+gg8CvV/hxrPf3JjOHLsh2CIDTo3/3AZcLs
         4z9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUS4TkQm4zL8IRRO8bpryOn/6L3gnL5AnP7bFdDV7OFbrCQPvf4KcANQxG1UDj7ZucfnMG+6fgX9ypNMmR0gPtvzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yydd4n1BdrvGCTrde2iJ/dlctCUwXvi/B2ZDq1fo782HeauXhWG
	J09G0jjV9rkyzSkKCX4uVEERAveikptsW+X98NCTztQHokQbJS2IooRF
X-Gm-Gg: AZuq6aKIFtZ7+h9Q3b2bvcKKATJLI6Edvy1ZgHiJ5O1rQGdMCIDq7iiHGkL67IaJKSB
	SKJPJOvu37WAe2kivmoOF8i8+EVkVV1qyVMLh7aei+m4ivgQ/BMLePyI/1ojwYi6c7/91922EaL
	1egjri62DWvvVha2gU7rrfPeVd17pUDoo1mfyAGteWmP6SHEx/xgByOo3zONqCLpCa7pvKMqbXP
	ANlueQHDpYhEvH2mTG2fO0AiloyaaOCSrRhrG5MFr5ufgnpxnlzZoWUKxmOiTYxHhdOSgxDB02K
	kaqgCHp05HXM6xTOG4lCib2/PxnSKYt3m3TzrYgDRRyDYU2hWboqbr54OS1kba1IgcFldoai9gJ
	h9YL4vKnTY4cWiJeMAIGMFq4Y4yO51w2PcuV1Eo7mouHAp3MP/XBUA1TR9l54c2jOe3V7FHCfGx
	E1jb3hLuLphMjBQU/7LPRvvD03fcwE3Xe8r2Y=
X-Received: by 2002:a17:907:803:b0:b70:4f7d:24f8 with SMTP id a640c23a62f3a-b8ebb04538amr6719266b.22.1770228397890;
        Wed, 04 Feb 2026 10:06:37 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3c9f:a100:4d45:ebc7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea0057dd1sm149677666b.65.2026.02.04.10.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:06:37 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 5/9] irqchip/renesas-rzg2l: Drop IRQC_TINT_START macro
Date: Wed,  4 Feb 2026 18:06:21 +0000
Message-ID: <20260204180632.249139-6-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27915-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 91A43EB8DA
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The IRQC_TINT_START value is different for RZ/G3L and RZ/G2L SoC. Add
tint_start variable in struct rzg2l_hw_info to handle this differences
and drop the macro IRQC_TINT_START.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 30 +++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index cd9909a85280..e5393306f610 100644
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
+	u8	tint_start;
 	u8	num_irq;
 };
 
@@ -123,7 +124,7 @@ static void rzg2l_clear_irq_int(struct rzg2l_irqc_priv *priv, unsigned int hwirq
 
 static void rzg2l_clear_tint_int(struct rzg2l_irqc_priv *priv, unsigned int hwirq)
 {
-	u32 bit = BIT(hwirq - IRQC_TINT_START);
+	u32 bit = BIT(hwirq - priv->info->tint_start);
 	u32 reg;
 
 	reg = readl_relaxed(priv->base + TSCR);
@@ -145,7 +146,7 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
 	raw_spin_lock(&priv->lock);
 	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
 		rzg2l_clear_irq_int(priv, hw_irq);
-	else if (hw_irq >= IRQC_TINT_START && hw_irq < priv->info->num_irq)
+	else if (hw_irq >= priv->info->tint_start && hw_irq < priv->info->num_irq)
 		rzg2l_clear_tint_int(priv, hw_irq);
 	raw_spin_unlock(&priv->lock);
 	irq_chip_eoi_parent(d);
@@ -170,7 +171,7 @@ static void rzfive_irqc_unmask_irq_interrupt(struct rzg2l_irqc_priv *priv,
 static void rzfive_irqc_mask_tint_interrupt(struct rzg2l_irqc_priv *priv,
 					    unsigned int hwirq)
 {
-	u32 bit = BIT(hwirq - IRQC_TINT_START);
+	u32 bit = BIT(hwirq - priv->info->tint_start);
 
 	writel_relaxed(readl_relaxed(priv->base + TMSK) | bit, priv->base + TMSK);
 }
@@ -178,7 +179,7 @@ static void rzfive_irqc_mask_tint_interrupt(struct rzg2l_irqc_priv *priv,
 static void rzfive_irqc_unmask_tint_interrupt(struct rzg2l_irqc_priv *priv,
 					      unsigned int hwirq)
 {
-	u32 bit = BIT(hwirq - IRQC_TINT_START);
+	u32 bit = BIT(hwirq - priv->info->tint_start);
 
 	writel_relaxed(readl_relaxed(priv->base + TMSK) & ~bit, priv->base + TMSK);
 }
@@ -191,7 +192,7 @@ static void rzfive_irqc_mask(struct irq_data *d)
 	raw_spin_lock(&priv->lock);
 	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
 		rzfive_irqc_mask_irq_interrupt(priv, hwirq);
-	else if (hwirq >= IRQC_TINT_START && hwirq < priv->info->num_irq)
+	else if (hwirq >= priv->info->tint_start && hwirq < priv->info->num_irq)
 		rzfive_irqc_mask_tint_interrupt(priv, hwirq);
 	raw_spin_unlock(&priv->lock);
 	irq_chip_mask_parent(d);
@@ -205,7 +206,7 @@ static void rzfive_irqc_unmask(struct irq_data *d)
 	raw_spin_lock(&priv->lock);
 	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
 		rzfive_irqc_unmask_irq_interrupt(priv, hwirq);
-	else if (hwirq >= IRQC_TINT_START && hwirq < priv->info->num_irq)
+	else if (hwirq >= priv->info->tint_start && hwirq < priv->info->num_irq)
 		rzfive_irqc_unmask_tint_interrupt(priv, hwirq);
 	raw_spin_unlock(&priv->lock);
 	irq_chip_unmask_parent(d);
@@ -216,8 +217,8 @@ static void rzfive_tint_irq_endisable(struct irq_data *d, bool enable)
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
 
-	if (hwirq >= IRQC_TINT_START && hwirq < priv->info->num_irq) {
-		u32 offset = hwirq - IRQC_TINT_START;
+	if (hwirq >= priv->info->tint_start && hwirq < priv->info->num_irq) {
+		u32 offset = hwirq - priv->info->tint_start;
 		u32 tssr_offset = TSSR_OFFSET(offset);
 		u8 tssr_index = TSSR_INDEX(offset);
 		u32 reg;
@@ -261,9 +262,9 @@ static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hw_irq = irqd_to_hwirq(d);
 
-	if (hw_irq >= IRQC_TINT_START && hw_irq < priv->info->num_irq) {
+	if (hw_irq >= priv->info->tint_start && hw_irq < priv->info->num_irq) {
 		struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
-		u32 offset = hw_irq - IRQC_TINT_START;
+		u32 offset = hw_irq - priv->info->tint_start;
 		u32 tssr_offset = TSSR_OFFSET(offset);
 		u8 tssr_index = TSSR_INDEX(offset);
 		u32 reg;
@@ -354,7 +355,7 @@ static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
-	u32 titseln = hwirq - IRQC_TINT_START;
+	u32 titseln = hwirq - priv->info->tint_start;
 	u32 tssr_offset = TSSR_OFFSET(titseln);
 	u8 tssr_index = TSSR_INDEX(titseln);
 	u8 index, sense;
@@ -401,7 +402,7 @@ static int rzg2l_irqc_set_type(struct irq_data *d, unsigned int type)
 
 	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
 		ret = rzg2l_irq_set_type(d, type);
-	else if (hw_irq >= IRQC_TINT_START && hw_irq < priv->info->num_irq)
+	else if (hw_irq >= priv->info->tint_start && hw_irq < priv->info->num_irq)
 		ret = rzg2l_tint_set_edge(d, type);
 	if (ret)
 		return ret;
@@ -503,7 +504,7 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 		tint = TINT_EXTRACT_GPIOINT(hwirq);
 		hwirq = TINT_EXTRACT_HWIRQ(hwirq);
 
-		if (hwirq < IRQC_TINT_START)
+		if (hwirq < priv->info->tint_start)
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


