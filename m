Return-Path: <linux-renesas-soc+bounces-30282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKqcG/I2xGnkxQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:26:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2FA32B335
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD302303E81F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9358E3FB7D4;
	Wed, 25 Mar 2026 19:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzxGAGum"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E887C3EF0CF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 19:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466706; cv=none; b=Qy0829PxX+9Vah6Zcso56WYZ4aYE9PnJ2upWHr+D0vbNprc+7VPOyyVfgWUkOr0EumMkKnYNPtd4RQ2bbYkhLodU1tXSlxRpxrm/LX3+KgCi4HMukOETvwJcynbzguf9R23eujN490Faib7AwnlbiY4Nkq9pXdHem/SLhw9GNp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466706; c=relaxed/simple;
	bh=g+tL8eVaWIqZhx+4B6Wiuwsvn9N45Dh20r42BE6IJ64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SIFOwqxVAqJcRUMpGjw8gcCUE+BHffQQsqtbyS//Au/d90m+lOdLmg8Rv4C87iIgP406gy6qEuvKaWtyNO8N3N+RLsjQTps+Yq+NC+g4LyXjtyuFVE3Ptz9JzamJu7r4twFnR7ANbtgQzOVwTui3huHOnEMOYM0P5llgTsa6pUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzxGAGum; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43b9144790dso90364f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466703; x=1775071503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVn7JZATj34qETC8kWqIZJ67U0LmJ17AJHn3nGvDANo=;
        b=bzxGAGumBgx1hSaxxd2cXEvhfePeyVUer/9VMzpdjZYegdZ7k8STAq1D7Gv3iSDQsZ
         kG5P4S6qzihRDG3whWfmkQdJ/+OhkWX25XeE0AmcHgj1+PeA6JwJYn7ncwsyvKkUd/X+
         sxqjozPVS0q5OeJpUm2+E3zk5/dRzPaid0n3xgCa9cwkswNNVaMikQgZGngUey7bAkFx
         WRHcS94qS6ahbICBT8WIZA8pie1s4D4T3PKJ29e/wyBS8t+D8QedmcaK0yKXku6/fUUp
         6VCN1WQHooQeKrepiVUK1epVjlXzHPIcg3s247PtgUXYX9UmaW2dsSTm8z0yvGACvpHN
         i0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466703; x=1775071503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YVn7JZATj34qETC8kWqIZJ67U0LmJ17AJHn3nGvDANo=;
        b=jfcmhWnORuiRTdlzD3ZJe5OSw534oOrDsOny74XpRhU8FtOlhiDA3x6+VAZd+oF98+
         FowIBUUv/Zq8roqIEvUmBBuM8V3EfDLC3CQHeghoOCTOr7jfSFj2OfxZTgYPKAuaCgB2
         zfz5kkag8rzp0gz11KHUhUtVHawGQQohXb6wacO1GpZ6272CzyaZtWiDt1YSbn29O52a
         dbtiGskds6tR/wQMJtLZJpjrphA9dGhn1tvhuxqlGS0B+DKRtla0wGLDfRuggQUrP94p
         Y0LSv+J8579dviJ15do5QDLmB4iGATiCOAnYI6YGCML4q93vYd0i+SEkcoO7nT1VDo7B
         +kqw==
X-Forwarded-Encrypted: i=1; AJvYcCXHg93O7GlTDYNja5EbqXhmF5tVV1ajvKovj546+UzEYy6Y95R/uB07jbXWOzTW2r0uw5/I374eGyBDar15klAzXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTYl+cf1U6uPv3sfxMm5lPDpEHxPd69BQmrtM/gVDX4+QIYHL6
	YhvogZOQZf1SV0JmA4ERZNUmOCGApvIWl7QLI4qGfYx7PC9Me7miALng
X-Gm-Gg: ATEYQzyGkAyETFV2AxlivZCvYcf6VAlLejj6+f0jV/wugjcSQT/lVpGPIj214PAJJu9
	TJpxxw5sskGSuD0U15ocpUNDfu7kDxwXGhu52F+GRAmGysk8JNfnHlPfoATK7BkEz0hXjExaQy7
	fYfD/kdvdekPsIBOyMnh9Tv1Qkds/bKJIqQHjNP8vOmLDAv4PG1C1+f03wkPrO4zzARkHS+g0iF
	cqMriCdgcPKpWORG3Qzih0UjNIg4UZ1AirbDqBFtYhsrBG3a+Poz7bCuEIpor6bHdZfsX0ipnOZ
	WryI9sdEEpfOXj1J856H1jlL9myEWZTYqXuf5eKOr+7hiFHLdK+vO5R8xZipOSjgv/g2uTs4MYU
	TujFf59N25niUcOHAPm5IVmwOz6a7LePVSPimBY/+/T//+2VTu5wSoFLyowQ9crm5kc8h6LRsmC
	fe1znUhS64RU0Mefe9kJqQR0+IgaAy5UqEgibbQd7A9G890r/z
X-Received: by 2002:a05:6000:401f:b0:43b:63e5:2526 with SMTP id ffacd0b85a97d-43b88a10047mr7405755f8f.27.1774466703338;
        Wed, 25 Mar 2026 12:25:03 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:25:02 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 10/16] irqchip/renesas-rzg2l: Split rzfive_irqc_{mask,unmask} into separate IRQ and TINT handlers
Date: Wed, 25 Mar 2026 19:24:25 +0000
Message-ID: <20260325192451.172562-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
References: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30282-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 2D2FA32B335
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

rzfive_irqc_mask() and rzfive_irqc_unmask() used hw_irq range checks to
dispatch between IRQ and TINT masking operations. Split each into two
dedicated handlers — rzfive_irqc_irq_mask(), rzfive_irqc_tint_mask(),
rzfive_irqc_irq_unmask(), and rzfive_irqc_tint_unmask() — each
operating unconditionally on its respective interrupt type, removing
the runtime conditionals.

Assign the IRQ-specific handlers to rzfive_irqc_irq_chip and the
TINT-specific handlers to rzfive_irqc_tint_chip, consistent with the
separation applied to the EOI, set_type, and enable/disable callbacks in
previous patches.

While at it, simplify rzfive_irqc_{irq,tint}_{mask,unmask}() by replacing
raw_spin_lock locking/unlocking with scoped_guard().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change.
v5->v6:
 * Updated commit description.
 * Simplified rzfive_irqc_{irq,tint}_{mask,unmask}() by replacing
   raw_spin_lock locking/unlocking with scoped_guard().
v5:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 44 ++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 79837c754b60..64cfd9955d8f 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -184,31 +184,47 @@ static void rzfive_irqc_unmask_tint_interrupt(struct rzg2l_irqc_priv *priv,
 	writel_relaxed(readl_relaxed(priv->base + TMSK) & ~bit, priv->base + TMSK);
 }
 
-static void rzfive_irqc_mask(struct irq_data *d)
+static void rzfive_irqc_irq_mask(struct irq_data *d)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
 
-	raw_spin_lock(&priv->lock);
-	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
+	scoped_guard(raw_spinlock, &priv->lock)
 		rzfive_irqc_mask_irq_interrupt(priv, hwirq);
-	else if (hwirq >= IRQC_TINT_START && hwirq < IRQC_NUM_IRQ)
+
+	irq_chip_mask_parent(d);
+}
+
+static void rzfive_irqc_tint_mask(struct irq_data *d)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hwirq = irqd_to_hwirq(d);
+
+	scoped_guard(raw_spinlock, &priv->lock)
 		rzfive_irqc_mask_tint_interrupt(priv, hwirq);
-	raw_spin_unlock(&priv->lock);
+
 	irq_chip_mask_parent(d);
 }
 
-static void rzfive_irqc_unmask(struct irq_data *d)
+static void rzfive_irqc_irq_unmask(struct irq_data *d)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
 
-	raw_spin_lock(&priv->lock);
-	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
+	scoped_guard(raw_spinlock, &priv->lock)
 		rzfive_irqc_unmask_irq_interrupt(priv, hwirq);
-	else if (hwirq >= IRQC_TINT_START && hwirq < IRQC_NUM_IRQ)
+
+	irq_chip_unmask_parent(d);
+}
+
+static void rzfive_irqc_tint_unmask(struct irq_data *d)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hwirq = irqd_to_hwirq(d);
+
+	scoped_guard(raw_spinlock, &priv->lock)
 		rzfive_irqc_unmask_tint_interrupt(priv, hwirq);
-	raw_spin_unlock(&priv->lock);
+
 	irq_chip_unmask_parent(d);
 }
 
@@ -497,8 +513,8 @@ static const struct irq_chip rzg2l_irqc_tint_chip = {
 static const struct irq_chip rzfive_irqc_irq_chip = {
 	.name			= "rzfive-irqc",
 	.irq_eoi		= rzg2l_irqc_irq_eoi,
-	.irq_mask		= rzfive_irqc_mask,
-	.irq_unmask		= rzfive_irqc_unmask,
+	.irq_mask		= rzfive_irqc_irq_mask,
+	.irq_unmask		= rzfive_irqc_irq_unmask,
 	.irq_disable		= rzfive_irqc_irq_disable,
 	.irq_enable		= rzfive_irqc_irq_enable,
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
@@ -514,8 +530,8 @@ static const struct irq_chip rzfive_irqc_irq_chip = {
 static const struct irq_chip rzfive_irqc_tint_chip = {
 	.name			= "rzfive-irqc",
 	.irq_eoi		= rzg2l_irqc_tint_eoi,
-	.irq_mask		= rzfive_irqc_mask,
-	.irq_unmask		= rzfive_irqc_unmask,
+	.irq_mask		= rzfive_irqc_tint_mask,
+	.irq_unmask		= rzfive_irqc_tint_unmask,
 	.irq_disable		= rzfive_irqc_tint_disable,
 	.irq_enable		= rzfive_irqc_tint_enable,
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
-- 
2.43.0


