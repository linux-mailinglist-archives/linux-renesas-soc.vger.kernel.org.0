Return-Path: <linux-renesas-soc+bounces-30285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOAWNjk3xGnkxQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:27:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 770EC32B3DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2102B30F20A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0EDA401A29;
	Wed, 25 Mar 2026 19:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJqo0NEO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414433FCB39
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 19:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466708; cv=none; b=LU8JUnMeabUiZNxhF8rtUOJtlnIDr0ZEyM591qImfyjJMUO41qAHoKokZKOL4tdpffsZdgAnrVnt4xzDvFxT00RW4y+3gHWswPUPF4/GC9+n4y9qaVk7gyYFUSry6j+4KwN3+GU9IpBqc93MkFHagaeNkn7iUH2q8HE80hHqSq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466708; c=relaxed/simple;
	bh=4WD4jWUlDSc2Bv4nI06kXIsbUPD/JPWZA3Hmn00aMpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q5o3u7mT/d5P6oXuVz5RsDih3TGvmeYNWfwkV4/ajqenQN9pe7rUzgybiX7i/Ykz4b1pZ7UFkO4ASb8XeumGZ29OorUItdvOXbV0NpuFGYefcYBAzJgCC876UZ9QFXjUN5ZJRqkudG4dsO0cPl/v2MVInLwxocVquRXvLlXbIjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJqo0NEO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so2658335e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466706; x=1775071506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bcgtt2YIuOvR2oIpobQHk4eePmqJtsHUOQt8wp9DlwU=;
        b=GJqo0NEOs1ywEovWjE2Qi37zqnT1x5PRlokOQFX9QaiwWWy4ey/OZZRClZgMQ2DhrG
         KohBJVY4tUhIUivRIoo6YbKZ7d6qNhQNdafk6GR2kJFNQt98MG5c4Wa2Wu5/IldsNtVQ
         qIcLLFFpRwcphnxvQ4nUQKQxdXyRrjYF8D9B3KfbTvG8WmgjCWyvAMMa43Y3M6Hch66b
         zt1MlfGdvGRvCpctrEUMoaexckgzecaqow6mf90Z3SdODjXSdzKGypUSGZ6ddgvuclIk
         bgKX3sFFqFd9Zfv9aqbttuMpu+p5l9qy2M87xYt1mvIPARbbnwGwv3mRULjw57AEuUZ8
         m2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466706; x=1775071506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bcgtt2YIuOvR2oIpobQHk4eePmqJtsHUOQt8wp9DlwU=;
        b=WHS73GC+KG4qnE9UhbI0qNRYLDsoLlILSOzveFky/u8eZwDrzUCNv1eHlzLUxp/BeI
         VyAQ2DeUIYk7Oewr6tEx3i+mv3lVWRrEs5nmi35sjVQHf27FU/9AePH1jsvbYUNrbi8d
         l8Xzxkt0yd++VOi5iWqaNPrnq+QxT4BD3oZsw5ktJMrnJx472WYt2/naMYNN80/Gk20k
         PStZqKsEF+JwgFnQvKh8hqf7hhnhmQMtO9p4J3a7STFNK8z77cCcsYe5tTbYe4QrgHEM
         qb87zi8CoqX65gngYzutLNzEiLrShO7NYAvHi0LvFgvLuQKAKPRf1NJGpjlaNqXqLauw
         52ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSP4cttP2Q4s/p9zRPQj7+fA8En3MsEdpc7nL+snnE95PoLTCURJtKWSZeOEsuOZwug3VYq9zTYAWxiXzkuP6RGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzArSUapTLCQt2JaPU2JeVzS2YeN05jYouu2QGkD0Akm+0NPKRr
	VaYvjiAs8WCLGITomnA7MYFq++vPfGFH/hD0r/5NWF4aXBucgKcBVjJI
X-Gm-Gg: ATEYQzwk5divLlN07b8JuFwvlzodMWy7NG7NYu/zzBdQzZvExWc+3f47JNd22OspmDq
	MZ2wPrwa/upuopHYZrVHJ42aY530KGH0MOHezQGuJZrVi9PBdtkFbYbnhdjaHpbvtca9VC9eiK4
	t8ToyV6Dxrl//weptBO+rchq4yWidk5FafhUUCTUoKbN9c8hdbyD9hz7XeMFdNr354cZzBN8o8M
	PFljBAq8DFWSbmd42uvj+pYX+guKSqg8XEuAsVr3Jk4tjSr57rfARiQ7sdM7imFZ53217ftm77E
	jTrEU/68MxaAsXql9EPVkmWO5g64mWsGC3J7XNEmS0zhIyArh4XAyKH0krEF+dcOnY1p+QpLguC
	2dtQc4pU/vJWUj44qI19uohYZE5Zezflu6BR3PHlZwRuAesmxQcShJG2Hm5GJq7DpguB0QoLL4+
	STFcfBajCbKW+IL4b3SY+lvKQjDVusphqOmTrhVVh5Bp8sxhEb
X-Received: by 2002:a05:600c:154a:b0:487:4ff:3808 with SMTP id 5b1f17b1804b1-48715fd5492mr75373175e9.8.1774466705603;
        Wed, 25 Mar 2026 12:25:05 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:25:05 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 13/16] irqchip/renesas-rzg2l: Drop IRQC_TINT_START macro
Date: Wed, 25 Mar 2026 19:24:28 +0000
Message-ID: <20260325192451.172562-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
References: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30285-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 770EC32B3DE
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
v6->v7:
 * No change.
v5->v6:
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
index 2b7a70bdcba1..e5543aea86b4 100644
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


