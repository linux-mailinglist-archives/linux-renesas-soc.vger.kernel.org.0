Return-Path: <linux-renesas-soc+bounces-28760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAhUCKsYqGmgnwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:34:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C531FF062
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0A9C302BF55
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 11:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE613A5E77;
	Wed,  4 Mar 2026 11:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKvTHjxH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFC73537CE
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624005; cv=none; b=pzqCpbIlYRqbBx8+WZoiwPT6OtBw1Cpw5pbZy694h7RLIMAwjHNnNO8/8FnPXbnDSQoNFKrA7n/4CT0zRIh9nx5BeOwiBKLA+5bVLrkJhJBtcNR8E8bTo5Aun2dtp7gYmYby7G8WrL/LTdmMWfCKRKY51znaPbLnazgivvbM+x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624005; c=relaxed/simple;
	bh=0UmdDjYJOXuBjHZiKTNpuUeS5LXmC1ZYFC2xUE8Qk6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OikhRU3hiso3k95nT7MXo/ygRPHjDhyfRZZ0yvRHSUTdalCvLYTAHbS7Yym0ldjX2EFMf2jkYq4Nc+GlKB+wiSB68GAy83bjeYBJFumMK/8yp/eO40CydbL/0EkdJxeH8DwUBrU1a6ICNIZ0zAHUYPhyoCpQniAqXy1aY6I9kXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKvTHjxH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48371bb515eso101045885e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 03:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772624002; x=1773228802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWLYOWM1yMGZZtY7mK0Pr946Fx9HUQuypUYMiRJk1Og=;
        b=gKvTHjxHpGQFbBzBK0p2s3JiqgaTNnoqF9O9LCHEYFZ/9ry0iL5M8CJyfpRWfZNlGI
         0tn9i6WtqtL0wdPdeO1hCNEI5GIQ1yju6QDpuGOrkteYXqpJQ3k/WXwvI+CD6KDJW9Ny
         +g/WWek/T3zx//iDyD/PdunihJIE++tZM2EvHkvSaRSl0HIr6ZE5iCRxOibG5L6GNcNq
         Z4TBKxJ8/xU4w7LJKGChTaErQL3YvZGKO9Q+cDkHaHUVWju9O6hXHA4arFZxzHW9fs/W
         9mauxaz+9EadHHBNiYxIfXBOd+6Sj/mxKAt9THlx3fe4NXYiEoaMDR4E81hrjlOBnlWp
         j3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772624002; x=1773228802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LWLYOWM1yMGZZtY7mK0Pr946Fx9HUQuypUYMiRJk1Og=;
        b=Sdkk9WwHHNEKjAk17oSJXpzT41AUFMKiIXrbndM8mUk5maTBU4GNgksqwk4ORZHUKp
         ln5UePFYSUK8Ue3RCiEr0Ss0EqZd+5O7JDhz2oWUrjLXKFEAHKu9v6Huv0kT7objVzxi
         TPyy4htAlubCw/NtlsbN9eYOvGhj3pONA7C7FvBldk7wsrhcQasl36xELli0PNkZFKnA
         poGR1TQIhRd/Y0EvV988NoA19LQyMkVCGlNSpMlKM6K6aKNi/SPOFYrTpzc7/r6XMUuV
         vr8qmNnLCX3TRyZnrc3Cg37DJGorVJKOGCJaN0LDOFyuco+npTw6rTx+FC8POIdUUGBj
         S0Mg==
X-Forwarded-Encrypted: i=1; AJvYcCW+F1qZeKmkFUsIeSbXrFlCshUUOetu3HJDL/PVQcGVX1cCyts2r+gbvyyyCemnm7rUljy9mvXNEC/CvNEdqqd+7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YypnK+Uaj8nSsy2K9Q1WAXxFvr8HUS8MdiAKohhwqLzA4pE2GdG
	Y5172o7cbrnLYM9q5YBtxy47oDqq+N+hbJA/j6i0Df1jgXxJS3W2MOzb
X-Gm-Gg: ATEYQzxnutTSfqrcHa7O84W85syvdK1XCzuPFkq0rLBAWtpZpVFxvNU7dMlxnsjksUL
	ldyaTdcJK/tuFG+2ZHPnT1X93GLZc9pZffDQyB8DCu/II7C92QjFq4QxyErQfqxYRqgsBzQvzSl
	dfAjwxIEIEgLDHiwdpP9UJAdI8mkl0WiEcyYbxd9U/WC/d0SylgfySMUofWXkMxluR8W5OdPQS2
	65g76yzWKvntr4IMJdzhBjyTNEz8kWdu7DHamH0E4kqP2UHu02qnd30F+Z+ZIJvJ/OuHtOYPY3e
	Y/FwBIKMbalJIkjxspG4i2ipp7tPjrx/mjy6HdQN3ZkT9iW3afBTOevi8IVEf3Kv4iDJTx679Ty
	cqrMcGBjxD89hD4LL0cKUQUu+JY1kT8KhY10SvjfFKyaePv/njmkYNapwbhnbdffETq44X3swrt
	QPec3VafJf2Wa/I1AfOsWocjhqeQPgs/ULFhO+/x6xkduiVdk3tGoa2Rx2d/6olv5+yNg4jVbGR
	yrDk2LLatC71mVRxryTtHHfelaK4cSKJbXGmRd5P4+abgg=
X-Received: by 2002:a05:600c:8b65:b0:483:8e67:e696 with SMTP id 5b1f17b1804b1-4851985712fmr28772915e9.15.1772624002230;
        Wed, 04 Mar 2026 03:33:22 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:bddd:d1ed:d1ee:a876])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm27345379f8f.18.2026.03.04.03.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 03:33:21 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 5/7] irqchip/renesas-rzv2h: Replace single irq_chip with per-region irq_chip instances
Date: Wed,  4 Mar 2026 11:33:15 +0000
Message-ID: <20260304113317.129339-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304113317.129339-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260304113317.129339-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B4C531FF062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28760-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,pengutronix.de,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace the single rzv2h_icu_chip and its dispatcher callbacks with
dedicated irq_chip instances for each interrupt region: NMI, IRQ, and
TINT.

Move the irqd_is_level_type() check ahead of the scoped_guard in
rzv2h_icu_tint_eoi() and rzv2h_icu_irq_eoi() to avoid acquiring the
spinlock unnecessarily for level-type interrupts.

Drop the ICU_TINT_START guard from rzv2h_tint_irq_endisable() since it
is now only reachable via the TINT chip path.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- Dropped scoped_guard arround single writel
- Used scoped_guard in rzv2h_irq_set_type/rzv2h_tint_set_type to ensure
  irq_chip_set_type_parent() is called without locking

v3->v4:
- New patch.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 174 +++++++++++++++++-----------
 1 file changed, 104 insertions(+), 70 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index ce7d61b14ab6..38d48632a5c2 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -169,32 +169,47 @@ static inline struct rzv2h_icu_priv *irq_data_to_priv(struct irq_data *data)
 	return data->domain->host_data;
 }
 
-static void rzv2h_icu_eoi(struct irq_data *d)
+static void rzv2h_icu_tint_eoi(struct irq_data *d)
 {
 	struct rzv2h_icu_priv *priv = irq_data_to_priv(d);
 	unsigned int hw_irq = irqd_to_hwirq(d);
 	unsigned int tintirq_nr;
 	u32 bit;
 
-	scoped_guard(raw_spinlock, &priv->lock) {
-		if (hw_irq >= ICU_TINT_START) {
-			tintirq_nr = hw_irq - ICU_TINT_START;
-			bit = BIT(tintirq_nr);
-			if (!irqd_is_level_type(d))
-				writel_relaxed(bit, priv->base + priv->info->t_offs + ICU_TSCLR);
-		} else if (hw_irq >= ICU_IRQ_START) {
-			tintirq_nr = hw_irq - ICU_IRQ_START;
-			bit = BIT(tintirq_nr);
-			if (!irqd_is_level_type(d))
-				writel_relaxed(bit, priv->base + ICU_ISCLR);
-		} else {
-			writel_relaxed(ICU_NSCLR_NCLR, priv->base + ICU_NSCLR);
-		}
+	if (!irqd_is_level_type(d)) {
+		tintirq_nr = hw_irq - ICU_TINT_START;
+		bit = BIT(tintirq_nr);
+		writel_relaxed(bit, priv->base + priv->info->t_offs + ICU_TSCLR);
+	}
+
+	irq_chip_eoi_parent(d);
+}
+
+static void rzv2h_icu_irq_eoi(struct irq_data *d)
+{
+	struct rzv2h_icu_priv *priv = irq_data_to_priv(d);
+	unsigned int hw_irq = irqd_to_hwirq(d);
+	unsigned int tintirq_nr;
+	u32 bit;
+
+	if (!irqd_is_level_type(d)) {
+		tintirq_nr = hw_irq - ICU_IRQ_START;
+		bit = BIT(tintirq_nr);
+		writel_relaxed(bit, priv->base + ICU_ISCLR);
 	}
 
 	irq_chip_eoi_parent(d);
 }
 
+static void rzv2h_icu_nmi_eoi(struct irq_data *d)
+{
+	struct rzv2h_icu_priv *priv = irq_data_to_priv(d);
+
+	writel_relaxed(ICU_NSCLR_NCLR, priv->base + ICU_NSCLR);
+
+	irq_chip_eoi_parent(d);
+}
+
 static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
 {
 	struct rzv2h_icu_priv *priv = irq_data_to_priv(d);
@@ -202,9 +217,6 @@ static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
 	u32 tint_nr, tssel_n, k, tssr;
 	u8 nr_tint;
 
-	if (hw_irq < ICU_TINT_START)
-		return;
-
 	tint_nr = hw_irq - ICU_TINT_START;
 	nr_tint = 32 / priv->info->field_width;
 	k = tint_nr / nr_tint;
@@ -227,13 +239,13 @@ static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
 	writel_relaxed(BIT(tint_nr), priv->base + priv->info->t_offs + ICU_TSCLR);
 }
 
-static void rzv2h_icu_irq_disable(struct irq_data *d)
+static void rzv2h_icu_tint_disable(struct irq_data *d)
 {
 	irq_chip_disable_parent(d);
 	rzv2h_tint_irq_endisable(d, false);
 }
 
-static void rzv2h_icu_irq_enable(struct irq_data *d)
+static void rzv2h_icu_tint_enable(struct irq_data *d)
 {
 	rzv2h_tint_irq_endisable(d, true);
 	irq_chip_enable_parent(d);
@@ -259,7 +271,7 @@ static int rzv2h_nmi_set_type(struct irq_data *d, unsigned int type)
 
 	writel_relaxed(sense, priv->base + ICU_NITSR);
 
-	return 0;
+	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
 }
 
 static void rzv2h_clear_irq_int(struct rzv2h_icu_priv *priv, unsigned int hwirq)
@@ -309,14 +321,15 @@ static int rzv2h_irq_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	guard(raw_spinlock)(&priv->lock);
-	iitsr = readl_relaxed(priv->base + ICU_IITSR);
-	iitsr &= ~ICU_IITSR_IITSEL_MASK(irq_nr);
-	iitsr |= ICU_IITSR_IITSEL_PREP(sense, irq_nr);
-	rzv2h_clear_irq_int(priv, hwirq);
-	writel_relaxed(iitsr, priv->base + ICU_IITSR);
+	scoped_guard(raw_spinlock, &priv->lock) {
+		iitsr = readl_relaxed(priv->base + ICU_IITSR);
+		iitsr &= ~ICU_IITSR_IITSEL_MASK(irq_nr);
+		iitsr |= ICU_IITSR_IITSEL_PREP(sense, irq_nr);
+		rzv2h_clear_irq_int(priv, hwirq);
+		writel_relaxed(iitsr, priv->base + ICU_IITSR);
+	}
 
-	return 0;
+	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
 }
 
 static void rzv2h_clear_tint_int(struct rzv2h_icu_priv *priv, unsigned int hwirq)
@@ -391,48 +404,30 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	titsr_k = ICU_TITSR_K(tint_nr);
 	titsel_n = ICU_TITSR_TITSEL_N(tint_nr);
 
-	guard(raw_spinlock)(&priv->lock);
-
-	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
-	titsr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TITSR(titsr_k));
-
-	tssr_cur = field_get(ICU_TSSR_TSSEL_MASK(tssel_n, priv->info->field_width), tssr);
-	titsr_cur = field_get(ICU_TITSR_TITSEL_MASK(titsel_n), titsr);
-	if (tssr_cur == tint && titsr_cur == sense)
-		return 0;
-
-	tssr &= ~(ICU_TSSR_TSSEL_MASK(tssel_n, priv->info->field_width) | tien);
-	tssr |= ICU_TSSR_TSSEL_PREP(tint, tssel_n, priv->info->field_width);
-
-	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
-
-	titsr &= ~ICU_TITSR_TITSEL_MASK(titsel_n);
-	titsr |= ICU_TITSR_TITSEL_PREP(sense, titsel_n);
+	scoped_guard(raw_spinlock, &priv->lock) {
+		tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
+		titsr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TITSR(titsr_k));
 
-	writel_relaxed(titsr, priv->base + priv->info->t_offs + ICU_TITSR(titsr_k));
+		tssr_cur = field_get(ICU_TSSR_TSSEL_MASK(tssel_n, priv->info->field_width), tssr);
+		titsr_cur = field_get(ICU_TITSR_TITSEL_MASK(titsel_n), titsr);
+		if (tssr_cur == tint && titsr_cur == sense)
+			goto set_parent_type;
 
-	rzv2h_clear_tint_int(priv, hwirq);
+		tssr &= ~(ICU_TSSR_TSSEL_MASK(tssel_n, priv->info->field_width) | tien);
+		tssr |= ICU_TSSR_TSSEL_PREP(tint, tssel_n, priv->info->field_width);
 
-	writel_relaxed(tssr | tien, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
+		writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
 
-	return 0;
-}
+		titsr &= ~ICU_TITSR_TITSEL_MASK(titsel_n);
+		titsr |= ICU_TITSR_TITSEL_PREP(sense, titsel_n);
 
-static int rzv2h_icu_set_type(struct irq_data *d, unsigned int type)
-{
-	unsigned int hw_irq = irqd_to_hwirq(d);
-	int ret;
-
-	if (hw_irq >= ICU_TINT_START)
-		ret = rzv2h_tint_set_type(d, type);
-	else if (hw_irq >= ICU_IRQ_START)
-		ret = rzv2h_irq_set_type(d, type);
-	else
-		ret = rzv2h_nmi_set_type(d, type);
+		writel_relaxed(titsr, priv->base + priv->info->t_offs + ICU_TITSR(titsr_k));
 
-	if (ret)
-		return ret;
+		rzv2h_clear_tint_int(priv, hwirq);
 
+		writel_relaxed(tssr | tien, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
+	}
+set_parent_type:
 	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
 }
 
@@ -474,17 +469,51 @@ static struct syscore rzv2h_irqc_syscore = {
 	.ops = &rzv2h_irqc_syscore_ops,
 };
 
-static const struct irq_chip rzv2h_icu_chip = {
+static const struct irq_chip rzv2h_icu_tint_chip = {
+	.name			= "rzv2h-icu",
+	.irq_eoi		= rzv2h_icu_tint_eoi,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_disable		= rzv2h_icu_tint_disable,
+	.irq_enable		= rzv2h_icu_tint_enable,
+	.irq_get_irqchip_state	= irq_chip_get_parent_state,
+	.irq_set_irqchip_state	= irq_chip_set_parent_state,
+	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.irq_set_type		= rzv2h_tint_set_type,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.flags			= IRQCHIP_MASK_ON_SUSPEND |
+				  IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE,
+};
+
+static const struct irq_chip rzv2h_icu_irq_chip = {
+	.name			= "rzv2h-icu",
+	.irq_eoi		= rzv2h_icu_irq_eoi,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_disable		= irq_chip_disable_parent,
+	.irq_enable		= irq_chip_enable_parent,
+	.irq_get_irqchip_state	= irq_chip_get_parent_state,
+	.irq_set_irqchip_state	= irq_chip_set_parent_state,
+	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.irq_set_type		= rzv2h_irq_set_type,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.flags			= IRQCHIP_MASK_ON_SUSPEND |
+				  IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE,
+};
+
+static const struct irq_chip rzv2h_icu_nmi_chip = {
 	.name			= "rzv2h-icu",
-	.irq_eoi		= rzv2h_icu_eoi,
+	.irq_eoi		= rzv2h_icu_nmi_eoi,
 	.irq_mask		= irq_chip_mask_parent,
 	.irq_unmask		= irq_chip_unmask_parent,
-	.irq_disable		= rzv2h_icu_irq_disable,
-	.irq_enable		= rzv2h_icu_irq_enable,
+	.irq_disable		= irq_chip_disable_parent,
+	.irq_enable		= irq_chip_enable_parent,
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
-	.irq_set_type		= rzv2h_icu_set_type,
+	.irq_set_type		= rzv2h_nmi_set_type,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND |
 				  IRQCHIP_SET_TYPE_MASKED |
@@ -495,6 +524,7 @@ static int rzv2h_icu_alloc(struct irq_domain *domain, unsigned int virq, unsigne
 			   void *arg)
 {
 	struct rzv2h_icu_priv *priv = domain->host_data;
+	const struct irq_chip *chip;
 	unsigned long tint = 0;
 	irq_hw_number_t hwirq;
 	unsigned int type;
@@ -516,13 +546,17 @@ static int rzv2h_icu_alloc(struct irq_domain *domain, unsigned int virq, unsigne
 
 		if (hwirq < ICU_TINT_START || hwirq > ICU_TINT_LAST)
 			return -EINVAL;
+		chip = &rzv2h_icu_tint_chip;
+	} else if (hwirq >= ICU_IRQ_START && hwirq <= ICU_IRQ_LAST) {
+		chip = &rzv2h_icu_irq_chip;
+	} else {
+		chip = &rzv2h_icu_nmi_chip;
 	}
 
 	if (hwirq > (ICU_NUM_IRQ - 1))
 		return -EINVAL;
 
-	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, &rzv2h_icu_chip,
-					    (void *)(uintptr_t)tint);
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, chip, (void *)(uintptr_t)tint);
 	if (ret)
 		return ret;
 
-- 
2.53.0


