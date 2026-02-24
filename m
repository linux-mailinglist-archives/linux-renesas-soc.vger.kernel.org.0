Return-Path: <linux-renesas-soc+bounces-28440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFxeJXHpnWlDSgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 19:09:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA4418B059
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 19:09:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BE113182451
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 18:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B760E3B9606;
	Tue, 24 Feb 2026 18:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uugp33sG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D049F2C15A2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 18:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956022; cv=none; b=BXrzdlDBT3NbkH48s0MgZW35ba4k9E1NlY4LpIn1s+dqBTmD2QeiVHLHy3dF8pJF1nlvgPzB9wo9/BA4v7DKIqHCf+wR2UQ5zijWrBJyfY4XnlgzO2bJ0B8Xh1qT2NZaJozO5roLduxotBwIKdvNJ5JK1GLd9d4wqecSqIW+y1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956022; c=relaxed/simple;
	bh=Ycj4Bv75R404C5Ebq6OitXTo/ox0p3S65haUncTPY2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TRUtk7AbymAOrwnxFcsgNh0ZXlCJy5bu/kF7yVsDsDipwMWM03QkDeciMUwCM90NvxKMZQrmOCBiPbSj+vCY2Gh8Nd3WKq4G94Hsohp7plK4oHMjG7XUYnUTq94B4HeSPRe87pYRUf6xLCWbiuPKKEY5ENv992qJx1fxsGnHPq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uugp33sG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483bd7354efso3247465e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 10:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771956019; x=1772560819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cSCy8kAAxQYaP9uk2AAb1MuyYSkdFQ+iYuql26f6dE=;
        b=Uugp33sG46f/kOxiBO5Koyiu3vdGlvzfW6WNJzpBvUNFv6mhamOF6MoSnVZnvKMLeI
         BJ0jp8bGu08vPKZdKqeq23xJUTSg1B4+NyiPeCvMo/F1REeIFXxNdYFMMlKX+RoZ1LNi
         ly25evZdsy8fjeYapgMfONaPGFIUjIdAr+HMx80K1SPXD7MJqZET4DOoREv5La8z/GXy
         GYqNM5D6D9HpEvN6w0+Xb1/hTAoIHDW/V4mXKUzNndH0d7iU62vug836Y1iRo+u+VdYd
         U/nX7iNtC0lV5hWm65VGm0QpBf46503Xx6lkvPHkSKtm1GWp0N7oeGIBuwZXiFZx7AKQ
         vXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771956019; x=1772560819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0cSCy8kAAxQYaP9uk2AAb1MuyYSkdFQ+iYuql26f6dE=;
        b=keP+y6uDsl5/Wn8VYHBuHqhJeYRgc+agQ7HhMEICf8EIk9/UjtAJ5tWEtSNvcIkvy7
         SMpX6HtllkdJhSrj4fNjI0xBRZee80zCsNYsfEEBkG/5wo1oX8Fy3PaYMlHRhOi3eTIm
         mL3WaDftP1mBxWl3IufmuBOaAITgWq+zx7zH/Bx4MmCUKzmPX7KP6A20INyt77z7AQ83
         ZxnJuIFrH6MQCdn2qcW865neC520/3OP+Z45mFEyhqvLLS2m41O1JGjh9g4vpRtZxG/U
         iV6dtu0TRV4G0XJFPxnQpAx9w4Ya5eLT0Ydmn9tEHuO0A1DOwo/10Woq+dRGkU/UCFIX
         8y2g==
X-Forwarded-Encrypted: i=1; AJvYcCVLrcn92557TT1lsAkFwQXFeaZYu9Cqdm4Zek9qPh2KhzCYOtEbhPk1hu7ZrEccThDNSTrk1rzkJtm16cdor2xcpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkBrnD/B+SqrzgTmjim6f6/ByATO7YUm6J8a97OdS9z80OMz33
	2j9qBP0qH+YUgco5H/IDZh/CIFnmFymXqTIBFW5iZZoMQ9k1VZFEKXVkGHLWg9W7TTg=
X-Gm-Gg: AZuq6aI/iPrDT+QH33LpocNttTRqC/vuhEpc+IlJmnO1P+uDykrTmJ80h1OAyxDDayI
	0MGWENaOjaylvyXdbkR8ClJ98+3zPVJQ06WchMG+y2mHk1tYoU0BQfzmdbmc5rGDyRU5i6WFUXf
	Z48m/PJm2XJDvaDpA/fBhBhrBBx9f5UZQhHk91QsZc9nefw+9ScBHiRJvQJfPLjVwilWnCr/uDi
	wxxTbBt7+5qlywIoYmJ+fLVDzbt0R1o6bFd4IQCXspsrjncGZ1dCG704TcyjkogJXi2lvPoR2j+
	XjZQ6DdUBsYsNeaWt7X1pIGHz+QT2nuzacVd114SayiPszpB41e9s5xPno+Pvmuqcxrv5VNJ7NI
	/RBC1f/s0BPEXhY+1MW1VtmjvEdOOe02K21IfrZe+LlRMK7SZLtcnDWZbysOpTFsWMjxwLEqu/Q
	uLkWM3hKc3f47GOfardlOVwPvxD+FmIc1LvGCpgCYcj9K9Om4Jp+A9f/TaeQ6u0j5sSey38LLKo
	Nsrl1MDMVW5xXnB9vZW9eVGbN17KgUM4jFa5X0RF5gujdE=
X-Received: by 2002:a05:600c:530f:b0:483:bcff:7948 with SMTP id 5b1f17b1804b1-483bcff7bd8mr26242735e9.10.1771956018945;
        Tue, 24 Feb 2026 10:00:18 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:87da:e3e9:a9bf:6f1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd72bd66sm13064095e9.11.2026.02.24.10.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 10:00:18 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 5/7] irqchip/renesas-rzv2h: Replace single irq_chip with per-region irq_chip instances
Date: Tue, 24 Feb 2026 17:56:16 +0000
Message-ID: <20260224175618.3160270-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224175618.3160270-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260224175618.3160270-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28440-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 2AA4418B059
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
v3->v4:
- New patch.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 133 ++++++++++++++++++----------
 1 file changed, 85 insertions(+), 48 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index ce7d61b14ab6..d72400bb62b1 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -169,32 +169,50 @@ static inline struct rzv2h_icu_priv *irq_data_to_priv(struct irq_data *data)
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
+		scoped_guard(raw_spinlock, &priv->lock)
+			writel_relaxed(bit, priv->base + priv->info->t_offs + ICU_TSCLR);
 	}
 
 	irq_chip_eoi_parent(d);
 }
 
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
+		scoped_guard(raw_spinlock, &priv->lock)
+			writel_relaxed(bit, priv->base + ICU_ISCLR);
+	}
+
+	irq_chip_eoi_parent(d);
+}
+
+static void rzv2h_icu_nmi_eoi(struct irq_data *d)
+{
+	struct rzv2h_icu_priv *priv = irq_data_to_priv(d);
+
+	scoped_guard(raw_spinlock, &priv->lock)
+		writel_relaxed(ICU_NSCLR_NCLR, priv->base + ICU_NSCLR);
+
+	irq_chip_eoi_parent(d);
+}
+
 static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
 {
 	struct rzv2h_icu_priv *priv = irq_data_to_priv(d);
@@ -202,9 +220,6 @@ static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
 	u32 tint_nr, tssel_n, k, tssr;
 	u8 nr_tint;
 
-	if (hw_irq < ICU_TINT_START)
-		return;
-
 	tint_nr = hw_irq - ICU_TINT_START;
 	nr_tint = 32 / priv->info->field_width;
 	k = tint_nr / nr_tint;
@@ -227,13 +242,13 @@ static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
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
@@ -259,7 +274,7 @@ static int rzv2h_nmi_set_type(struct irq_data *d, unsigned int type)
 
 	writel_relaxed(sense, priv->base + ICU_NITSR);
 
-	return 0;
+	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
 }
 
 static void rzv2h_clear_irq_int(struct rzv2h_icu_priv *priv, unsigned int hwirq)
@@ -316,7 +331,7 @@ static int rzv2h_irq_set_type(struct irq_data *d, unsigned int type)
 	rzv2h_clear_irq_int(priv, hwirq);
 	writel_relaxed(iitsr, priv->base + ICU_IITSR);
 
-	return 0;
+	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
 }
 
 static void rzv2h_clear_tint_int(struct rzv2h_icu_priv *priv, unsigned int hwirq)
@@ -399,7 +414,7 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	tssr_cur = field_get(ICU_TSSR_TSSEL_MASK(tssel_n, priv->info->field_width), tssr);
 	titsr_cur = field_get(ICU_TITSR_TITSEL_MASK(titsel_n), titsr);
 	if (tssr_cur == tint && titsr_cur == sense)
-		return 0;
+		goto set_parent_type;
 
 	tssr &= ~(ICU_TSSR_TSSEL_MASK(tssel_n, priv->info->field_width) | tien);
 	tssr |= ICU_TSSR_TSSEL_PREP(tint, tssel_n, priv->info->field_width);
@@ -415,24 +430,7 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 
 	writel_relaxed(tssr | tien, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
 
-	return 0;
-}
-
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
-
-	if (ret)
-		return ret;
-
+set_parent_type:
 	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
 }
 
@@ -474,17 +472,51 @@ static struct syscore rzv2h_irqc_syscore = {
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
@@ -495,6 +527,7 @@ static int rzv2h_icu_alloc(struct irq_domain *domain, unsigned int virq, unsigne
 			   void *arg)
 {
 	struct rzv2h_icu_priv *priv = domain->host_data;
+	const struct irq_chip *chip;
 	unsigned long tint = 0;
 	irq_hw_number_t hwirq;
 	unsigned int type;
@@ -516,13 +549,17 @@ static int rzv2h_icu_alloc(struct irq_domain *domain, unsigned int virq, unsigne
 
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


