Return-Path: <linux-renesas-soc+bounces-27887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFo4IBBXg2mJlQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 15:26:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0259E711B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 15:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1357C303FDED
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 14:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9061341323A;
	Wed,  4 Feb 2026 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLRyBmYL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF7041322A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 14:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215007; cv=none; b=ZdtVS+cOqNWEMMbM4TZ8lKs5c1SIAKlApeXtLREPOWYDASTihuuG3iD1ae95Up5vBKryCisOYp6a4Q48Es2LU83S/L42zhFghut0GPryZxmzwe+xOWe2J9Ur+26SLOSV1PiwpDj9a/3pbQClQM73Ax+bJIg6NYCoi/ucE2NZ5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215007; c=relaxed/simple;
	bh=MSRFo2crIcOJkaH4o2xo/M8idc65w/dU332G575LEgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eIcf2YRiCGAgzr7pJ1+7e+UInMFrnvOme8GVEQ2GfYOAaoLUU3rqtqHLKAEnJ1h3Y5x1agKbR6827FNkIdOWeHqSgB5oI5hYSmFudhI6cZfK8zudo+VwxBZ9jwXNV26JKylAOdVZEvfrPg4vxpaFhDG4EvwgNawOmK4iN4tDCb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLRyBmYL; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-658034ce0e3so10884713a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 06:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770215005; x=1770819805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvf/j5r3fxogIJNtwMp54ndm6avrMEeWBQ2S4kb33Lg=;
        b=bLRyBmYLowedJIDWx9XdvHO3tbgwtH00Z+VmZpTPfPPbWDsDKvWIIWPdsUdzFDCd3C
         ME1YEeH4O5oLuzqBjGXfhanS9hcK+ZQh/uIr9Pd97Gpe1PpZ6I99PhagRThp3Cw6rP1k
         Zsj49tA3P4x6TSiu1gxGB+qjQ3uvknW0sj/dfVpBFwOkZtqTLKOnKVi+Kr8ROySGoZgr
         W9ue2BxzMWTmOyCC2BipE2DJUhqi0T0Q4RB2AqX5VcoHLhZfWDgrKhQBhCldyxVfXVR2
         UQa/EMNHHeADfXIpJBzDZsrpXsctlyoeqmjMlworiCHk6ECkBWY7OJ1k7MrWco3hCY2T
         vEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770215005; x=1770819805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pvf/j5r3fxogIJNtwMp54ndm6avrMEeWBQ2S4kb33Lg=;
        b=eInPeLDyUaxTIrsy3QDrvTUxzltptRVmmxh158gRZn2PjHuUjmgDUd0Lwzdq5VoJPS
         OUGNOMPSgbCDzcBokkxz8f8LzJlPdgvw2UdbzU6yQloHpiUrtnZM1ht3zScw3NzNyhop
         eWfwc+Qs7M5/HklGY+auchsD/RlFQ+O5z01Ml7L7EVBQc6vRxheH2Wgl4LmUrRcb1yHw
         0m8daW9A5cazNheM5vpLaW8VlKA70PFjMn0/zUJMxtSbMIy8rtzaglnrMr2nQAwF5M3O
         35/cy/Tmb6hGuX8cBlDsqryNeNQtjts6oauLKxm5BPUpEcCoYab1aSLPpL2eLbBY1Gv1
         gA0w==
X-Forwarded-Encrypted: i=1; AJvYcCW4AdfH2vrrCtVceYlIT3+AkP4tb6tC5DBoSgd/epJwxhi379M83WKmljdUf6Qu7z6LRbTlH+lmJ4RMqlaQhPJl+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXVDWSzvX9zYdbSJd2b8MstTQc4fbRBEh118QFuqieiiNNzO3I
	cYXsgLJuqrWVXqjBBqGbbSK1UErNBBSTVTQtxXy78jyVAgMUVWxZCVy1
X-Gm-Gg: AZuq6aLsXi29UqkFKr7D8hDmYWREglk7Bui7GfNT/N4jNye1lxftce4ITiUqMw1wVz6
	K01lCynUAN7NeQtRqiVgaC4O7QEnp3BliVRbwZQLKBqYAo4ro2p2rZQiFqxjw3aTiHwwxgVSCB9
	2jzpVzstOAWnKxiiUjImn9rWN/XG6XEo92CK5APHPQztFeGhEPRA8B6QS1KMSAJAlBKeSweQWyS
	ujPvhbYJ4pwkY2ZLHsdD6lnSQA+4CpDJuIn1MwhEfrik9BHs7bZYyAn4gPmd85PMI9R2TQRTTGK
	D89RqBuEzSmZX29djJBmg31offpjh5blf2Fxbz+lRis0UP3YiwEIzHsVOUXOkzH/UQ13IfM7yiY
	S7WCXBmVhPctKKky6iW+/CpyCPOcAfw741TbFqsM/urvQ+1eeiYBv0cwwpCOUE37xOBwC8SpqUq
	EyiC5/JSBm+Obfx7imMwNO/kWn6EmpXCi8qF4=
X-Received: by 2002:a17:907:d78b:b0:b87:1669:de1a with SMTP id a640c23a62f3a-b8e9f35d918mr216902266b.64.1770215005288;
        Wed, 04 Feb 2026 06:23:25 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3c9f:a100:4d45:ebc7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea001ea7dsm129038366b.47.2026.02.04.06.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 06:23:25 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/8] irqchip/renesas-rzg2l: Drop IRQC_TINT_START macro
Date: Wed,  4 Feb 2026 14:23:12 +0000
Message-ID: <20260204142320.103184-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204142320.103184-1-biju.das.jz@bp.renesas.com>
References: <20260204142320.103184-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27887-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D0259E711B
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The IRQC_TINT_START value is different for RZ/G3L and RZ/G2L SoC. Add
tint_start variable in struct rzg2l_hw_info to handle this differences
and drop the macro IRQC_TINT_START.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


