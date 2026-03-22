Return-Path: <linux-renesas-soc+bounces-30071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALZLJuPfv2ml9wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:26:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CE82B2E92D3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12811301082C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 12:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977C1382F08;
	Sun, 22 Mar 2026 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtsPWxXi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9153822AA
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182279; cv=none; b=YYN6Snx1/eqZCaxciP41gt6BoSOr7nhi5FIAmbG5BRHv9LSqyqfWzyekGlEod62ibuZhPb+/DI1viX1KL8mew/PZmThkrmSM2Cs/fG6xOAN61msNyo7PPyLOdvz5zwALV68dUx8Bd0vhPPcTEXBrXpXtf5ts32PxtxNOCpwMZSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182279; c=relaxed/simple;
	bh=A6dcZYR8tOrf2hf1QYqYL8J0rqVv72XxMlr7n+txYo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P51WqIJqua2n7whKW85NDtZugmpDBbiXU5dywmi8KS3uDZ+Nfcx8L8SFr8Gyl8X9llfZL1UgE8bCyIHzS2IjwgAGtVM/6ZVqO86fUbSxHzrQlbl6gsPXZVYV1ghH14MtYngTPcOqxtvcaYDhoiVtifAs0ESeM2r32xUHkc03nGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtsPWxXi; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b6d9c981so2256451f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 05:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774182275; x=1774787075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZxWtjoYjjjElcS1OQSWjkckUK+HZvQbITD74pYofro=;
        b=BtsPWxXi98uzMiKzJ9zt7FY9LDUvOgv0l26Y1CYTuZNCIJPsMLYHTi0fU2JcmiP0eu
         eLFObjtEsvXvMUl1AzafsASFS5V3IHjFGTuabvPfOHbRcMpofpo6tWjOFspGVwKm8IEb
         ybERBXSEtRQ37V7cYEZ7B5jrJiVJsqBlSJ6mhtz4/taFnmUqxhNX96Eclf5/qztBRQw/
         d8Krc8mAAhyMGOLeO/0X/gQqtrQOvR0AlCzK6lemIlS+yq8K68sPUMEpFAIPJ8xY40bP
         yRphSruaX4A0w6KXEey/Czf2AMw/sOdfyLYHIdYSlvsm6yyCzyBgXRHiUfLRjLxaz+LF
         ESvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774182275; x=1774787075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zZxWtjoYjjjElcS1OQSWjkckUK+HZvQbITD74pYofro=;
        b=fheGfN8T0zmuUsK50kb6XnLEAd3uTag4vZPqDpyTyP+wZO7REbEWWw+M8AIB871i2x
         Gj2xcHYnYPGU7MTp+yBljkkCJvkEsxkJtr8URitxSvJ7FG3KjTnORJo5+Y+wy4oUSlxO
         RMcKtdDRkN/EmhWfqYRUqNnLyfv6V+CmN6oh6eBmyQIGHLZRGnLydrh1XMpk0iyxj82h
         uo53mxvo89Qfgipw5sVHU+LxOfZxNrq5Dfe785ydqlLluTiCPQA807W/0Tor/RADnI9X
         Mmi2weB6AfhlJhmM8nYtIByxJ+37Ce2YK8mNMqZ83SwZj2HEgo6QPXqO/1wZHiTWDpyC
         qs/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1mELkam4K7/xiHR0eIehAkMvfRlvo9FSCe7oWUnXoc3EvhCFPL+Nrw09S/NNRYK2k+cc2CrliU2t+TtsuVINuQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxHiRChNiqEg/TFoRSXld5tpwWsgOjmcHogNdg4KCOSSh8yiHv
	n93Oc+3BIUkIePBK/+gQTCK9na6YpJnKh3Lgod/kJ79QOf8q9Woqm0Si
X-Gm-Gg: ATEYQzzALQcr1ihcA8ZH9GWNjCPAdssbxC3ejmGS9zKjO0cdT8lp9muAfyabh/ZaEjw
	KTHcPqwNN2H+Lx+yVv2Mecx++/XAO9PyQ+Hqg6yUXHniwQtC6oNzu5NNn80SUs59y7hxXetzQ73
	E7Ych9lm9d4pEVrc4Fj37WHIyuYDyRjHGLDnXMq5ESAOmhQbAuKuDGUwGWV9JsBORkhUiMSchQn
	ToBZGk5jNuxY2OoHjbVITrsEQS0KJYGBA5T/X/wTnTPgxnu/aHTw4Ycg3kD62retEDFltNv8CW3
	Bx9yh1tRAdQC303UoG6GLxkC1JB1XKmnhbKRt7ISCghk5HHfxjXxT6OhTZMMFC109Cs1uyMl9Y5
	s0cnPJPWvwjzXMFiddgxB/5oqA5M36c/FwrP5jvQ+RtdYGJ4t1FuIqd6kRUhWqmYEFiNxnklVWN
	V3YBNnjW1PpCmYHYWyYqMOrNQvNalOId2Y0oEXnNaT5JEuBntC
X-Received: by 2002:a05:6000:1861:b0:43b:4703:9dd5 with SMTP id ffacd0b85a97d-43b64272ae1mr14892339f8f.18.1774182274924;
        Sun, 22 Mar 2026 05:24:34 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1bdc:7f84:18bc:1e56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm21072695f8f.19.2026.03.22.05.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:24:34 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 12/15] irqchip/renesas-rzg2l: Drop IRQC_TINT_START macro
Date: Sun, 22 Mar 2026 12:23:55 +0000
Message-ID: <20260322122421.132474-13-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
References: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30071-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: CE82B2E92D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The IRQC_TINT_START value is different for RZ/G3L and RZ/G2L SoC. Add
tint_start variable in struct rzg2l_hw_info to handle this difference
and drop the macro IRQC_TINT_START.

While at it, update the variable type of titseln, tssr_offset, tssr_index,
index, and sense to unsigned int, in rzg2l_tint_set_edge() as these
variables are used only for calculation.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6
 * Updated the variable type of titseln, tssr_offset, tssr_index, index,
   and sense to unsigned int, in rzg2l_tint_set_edge() as these variables
   are used only for calculation.
 * Updated commit description.
v4->v5:
 * Dropped the hw_irq range check involving info.tint_start
v3->v4:
 * Updated commit description 'this differences->this difference'.
 * Updated tint_start variable type from u8-> unsigned int.
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 5a21bca91e4e..922d9dfeddcd 100644
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
 
@@ -125,7 +126,7 @@ static void rzg2l_clear_irq_int(struct rzg2l_irqc_priv *priv, unsigned int hwirq
 
 static void rzg2l_clear_tint_int(struct rzg2l_irqc_priv *priv, unsigned int hwirq)
 {
-	u32 bit = BIT(hwirq - IRQC_TINT_START);
+	u32 bit = BIT(hwirq - priv->info.tint_start);
 	u32 reg;
 
 	reg = readl_relaxed(priv->base + TSCR);
@@ -180,7 +181,7 @@ static void rzfive_irqc_unmask_irq_interrupt(struct rzg2l_irqc_priv *priv,
 static void rzfive_irqc_mask_tint_interrupt(struct rzg2l_irqc_priv *priv,
 					    unsigned int hwirq)
 {
-	u32 bit = BIT(hwirq - IRQC_TINT_START);
+	u32 bit = BIT(hwirq - priv->info.tint_start);
 
 	writel_relaxed(readl_relaxed(priv->base + TMSK) | bit, priv->base + TMSK);
 }
@@ -188,7 +189,7 @@ static void rzfive_irqc_mask_tint_interrupt(struct rzg2l_irqc_priv *priv,
 static void rzfive_irqc_unmask_tint_interrupt(struct rzg2l_irqc_priv *priv,
 					      unsigned int hwirq)
 {
-	u32 bit = BIT(hwirq - IRQC_TINT_START);
+	u32 bit = BIT(hwirq - priv->info.tint_start);
 
 	writel_relaxed(readl_relaxed(priv->base + TMSK) & ~bit, priv->base + TMSK);
 }
@@ -253,7 +254,7 @@ static void rzfive_tint_endisable(struct irq_data *d, bool enable)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
-	unsigned int offset = hwirq - IRQC_TINT_START;
+	unsigned int offset = hwirq - priv->info.tint_start;
 	unsigned int tssr_offset = TSSR_OFFSET(offset);
 	unsigned int tssr_index = TSSR_INDEX(offset);
 	u32 reg;
@@ -299,7 +300,7 @@ static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hw_irq = irqd_to_hwirq(d);
-	unsigned int offset = hw_irq - IRQC_TINT_START;
+	unsigned int offset = hw_irq - priv->info.tint_start;
 	unsigned int tssr_offset = TSSR_OFFSET(offset);
 	unsigned int tssr_index = TSSR_INDEX(offset);
 	u32 reg;
@@ -388,10 +389,10 @@ static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
-	u32 titseln = hwirq - IRQC_TINT_START;
-	u32 tssr_offset = TSSR_OFFSET(titseln);
-	u8 tssr_index = TSSR_INDEX(titseln);
-	u8 index, sense;
+	unsigned int titseln = hwirq - priv->info.tint_start;
+	unsigned int tssr_offset = TSSR_OFFSET(titseln);
+	unsigned int tssr_index = TSSR_INDEX(titseln);
+	unsigned int index, sense;
 	u32 reg, tssr;
 
 	switch (type & IRQ_TYPE_SENSE_MASK) {
@@ -682,6 +683,7 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 }
 
 static const struct rzg2l_hw_info rzg2l_hw_params = {
+	.tint_start	= IRQC_IRQ_START + IRQC_IRQ_COUNT,
 	.num_irq	= IRQC_IRQ_START + IRQC_IRQ_COUNT + IRQC_TINT_COUNT,
 };
 
-- 
2.43.0


