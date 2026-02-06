Return-Path: <linux-renesas-soc+bounces-27987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NrMKMHOhWlBGwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:21:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8D9FD274
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E066930B677D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 11:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49003A1A5E;
	Fri,  6 Feb 2026 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bbkw+QRU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F3C3A1A56
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770376625; cv=none; b=W5EpYhtnT9gvYfLOhrWP1hVjleUmSuW8GJayaXHts/QsSJBPb1jirJGMCYqG/WSVw98Jv30wdRPHZmWKvvbFPnmGHA/554exZU4oaYHnsAG74tPprUgl+5UthqdV3K5RQxEmfIuW4OPlSvugjKiMt3Wv8qV4PDvqn5ybs73sHuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770376625; c=relaxed/simple;
	bh=CZL93i9lwGn5bvjaHgHDOUILkMxch2ACe0LhGZi3AZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+z3Eo3MusxcJw9r/VjRNw4lw0qYURqZmfB7aGFQQxSJxxYKUS1NxWb64vXxL49o7SfgaebGloH8qVWLVsTPtursywkEZyRJIuQIkBjO2UXlCWsX47pclw2R6dL2FI+7EBuFFmSgj49JWA/7yj5TMLDqxvqbM+5Fq2UD4J8luiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bbkw+QRU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4362d18bb65so262204f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 03:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770376624; x=1770981424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwF99Mr55yenScot/Bs5ZL0xH8vE7aXRKx78QjXo8xg=;
        b=Bbkw+QRUAh9YF5bWLvYZBpj6qIHNzMY/XtPsz6TgAfsijRdKZ/YtA+JpoB7SBApgec
         PcqiU9JgZNGAQ+nZQPyDMFI4Z9XQwl3bZimh9u7rxurBFvGajFUA3Lmptr0u0Ok6KXdm
         6qg1MhI3kHKUhAw1x4MttgWqKogQ03zL4P79EQ9wwBSd8n5LmQSMnNS6YQC/ptyVdTwj
         GX0P3OztPa3ghuS564Luy6PCfdWR4epF/YHYO6cTL2YahzXwrRKO3KioPIbwkhyFU1wZ
         Zt7wCQVeFEk4/PS+l7WNQW34vIjpB+TJp1hDBp/f6ync+MOYOLJ9c8DxF/t9xBdMOUyU
         D7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770376624; x=1770981424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FwF99Mr55yenScot/Bs5ZL0xH8vE7aXRKx78QjXo8xg=;
        b=Unb9J2MAeqhIhLB5hkfiuoAA1T/iOJgFF21gruVYiUbZBSAS5heS1qlk2T0LUXOoE0
         QwFC9b/8ujqJe2OPxoGW1etMY2B2ScU2Qwn6TuTjG4TmMBCWUvGWHjU0Ov+8AyJdTyQx
         1K8h04m9eEtsyxjFnIRDRNDa18Iqldc+mv4KhWnUJbaviKD3awmkECDi3/VWwepcuvoc
         0gFZB1GY/2Vv3V6/RkalpV/yKhU+wPHBrhxbw55Q9gbxMclZq17UY0+C5/Ig/8WvkNO+
         uNnF9C+brWSlm3UY6I4sHXI5U+nMRr7FrRbElMHA+WV/QuOtL5Nz8ZZMZOJ876uYp0kr
         zKMw==
X-Forwarded-Encrypted: i=1; AJvYcCV3qO/vXy519Hs5VwTQrp8FJl6p02yW8fhDgZelrFqiJagMwHcwgJKZ9svVjvwVkFMDp8sXKRjnmDokR2DAQw1lAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVboQ9UGhUl5XLoKT9ZRjxtQbyTQTU9GazN7BY+tgwsZhJ7WDZ
	fvqixSJKXVBvv8IzeuYHGyr60OSL64BMurtPXnXQ4S5OIOIqTCJaRTWc
X-Gm-Gg: AZuq6aI99jW8xORM7pDhuQU/nPdg8KbBE+MmlL5eL1IXpBR5JxnufAlh1wqwWwfbBxz
	TSVNLYI6H6brlcMCCSTTUAIONa+MNlacz1yCN52LJikBh9GYPSZjDoFkxWpMQktH9E3tnEkKku2
	FQ/amsCR/C4WDaN9R+/iJ1H/hE1RrWlmYIjjE7LXj3ffEFY5VYB5F0sIcytkEVDiXtUQlwtAIUR
	ryFN551Z5VWloqiTr5d75XzjMWVq9Q7Ta83vnoIOGSw2Qpyy7GjMQtVQ7gBe6iC0eJbrwjhoyY9
	OZy1+k2h/TmNTbpbhdRUAdTdvOBYYp8RwDzG7OHZndRDa/QzJQp86M2zjsEO61EQJzw6JTFI/kA
	UD4nXPuf93XKcs4vJQHZg2JlV2NN9znelUNasRUMcxyajXixw6BWLlGzkdUC7z4BtoAPnjIRO+8
	u99ScA8OziGKjeiKLN+w==
X-Received: by 2002:a05:6000:1a86:b0:433:1d30:45f with SMTP id ffacd0b85a97d-4362904b88dmr3350439f8f.1.1770376623678;
        Fri, 06 Feb 2026 03:17:03 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fa4csm4746380f8f.26.2026.02.06.03.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:17:03 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 5/9] irqchip/renesas-rzg2l: Drop IRQC_TINT_START macro
Date: Fri,  6 Feb 2026 11:16:48 +0000
Message-ID: <20260206111658.231934-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
References: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27987-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0D8D9FD274
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The IRQC_TINT_START value is different for RZ/G3L and RZ/G2L SoC. Add
tint_start variable in struct rzg2l_hw_info to handle this differences
and drop the macro IRQC_TINT_START.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
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


