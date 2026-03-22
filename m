Return-Path: <linux-renesas-soc+bounces-30067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLXxNRrhv2ml9wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:31:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4732E936D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57A61304C0AB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 12:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038473815E2;
	Sun, 22 Mar 2026 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qpnz0nWa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87903806CD
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182275; cv=none; b=Vtqef1Xiv15MAHO2edHWIS7Oyh84x53jDsfKAca4JL6VaGWWbr+SDPpxyQtuK0uc2swFHG3F9v11XhMBMG9aZChZAKep22IB4GYfLQSXk4HIidNSLHMEUhjGVGZBvHwnXtakOlTQ7HLi2fuXZ+LSHav+sjqdq9lo1F80odCs2bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182275; c=relaxed/simple;
	bh=vImPVu8izjNjWfSz3Eb23R6Sm8FThD2KV1KdyOIKvFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X27s8CRhGnklK8Cji5LAjaGcUW50VjRXfwX6cG+hHTz6D1KtuHC5ReoDya/BjKZ3GPBwdyKupHvdyXZkaMaD+a6aXLODsdACcNG8qqA0bEC3dOAJtfB+IUWzUXrwL5wSeHVCf/MouPQy8bu29rHdBcWRH8mcjZPAbDAv4uKsFGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qpnz0nWa; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fb439299so25721165e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 05:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774182272; x=1774787072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g78JyQIQc2fWjXTf3WwNwwJAwJHHc4x9tnvt/78e98A=;
        b=Qpnz0nWaJuI9E0XSLazzTyHZHJkGTDgnHkFpBNVeSNIxjuRdFfH8bMj5L7F64TFQLl
         QA6hiOaDXbggOuQP/dAqHk6VShT636yPSXwqmgycPsW7GQqvcrYdiBtP97AedpfJ8qA9
         P/rcu8SxHqmXysxx6PVW6ww91n1/AdzinqtbXj1XvkAHJ7yQUv8vgByvXMoLPE1mliV/
         W8ELx8P4d7RDCqwt7i3iLJ5NFqoVE9VcU68KqPVU8jCHx829o58IwmSCDOArUzDAWnKE
         fuhQMNE05vTTaQiIv2xUsyMnN07dBsPY9WzvJlXpOy9aeNwDgIHbExLezz2mQYZMlhqx
         4LVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774182272; x=1774787072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g78JyQIQc2fWjXTf3WwNwwJAwJHHc4x9tnvt/78e98A=;
        b=mn+tvy3DriyzzvS5+j+8+0Jb05kpfWG7mybzFb5CZoJmrPFuW2YUTQEB7c3A/ihJkF
         E1RrmyX+Zfr0bBWOIc4DzsrmjPlThsoHYwQQKa2NXmyU4T14tipWNY5Byy4ASygDedRF
         MJuNSc47xAzKlcGEAFiwUPTChoF1xjjXG7xVUhZu4bpgTaJ+dxCuKpGlopSGsF7QWMlI
         lF8ViNTBYmEa6pynPFXkMpV7uXewRQeD6Nms4x9dNX+PIvWDe0IjykTVC4cuOKw5qzg5
         T8oW3WHsqavdbmhS9OYPflhT3NC6NDMI75ZhT01mWCySE5+9bIw5fUl3aLYdNWKY365X
         7Mww==
X-Forwarded-Encrypted: i=1; AJvYcCV+FT8RcppbE2SAj1CaqS/szpOFYGVLs2mF8zbYMlPW038J5641hIamKHAyVdrs/pzAacpXajnlWhbd29goNmeDmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWGixbnpMvU8H/gzSXUlT+8q008T5nW2nEKx5uGY3Kg+YSinCQ
	q7zacbIy1tjFKu2WRm9oUEIIv1+YEdIptYBj0mtU/SplQNtuGY/4A+17
X-Gm-Gg: ATEYQzx5G51hIPMDHIB84aGzziem7cRdYfWUXh5VbMk6Az/t7DHBoemPU9EEB6FgYXF
	+kjH/6BNLnbGhKHzHe1seLcGR9ho7RxvIbuufLuvKAq8dM560fHmd/gHBOeMGP0Ng0LliLXQg2Z
	RVYaZJANJd1h1qU7Z61fK2GJWEQRSn72EwKh3L7Z6PfSVNXSLv6hP+nXDV4FoppPtF9glc2UrJd
	tq9BiiC/Ga7xsgEdD79wRqaueYHS7aR+SZ/eOdzRKlG4meMULwnyH63y1ZfMHZo+2uEV93sIetC
	BCME0F/aSo1G96SGZUmho0OwFY0zoE+kQyUZVK6KOTISUsk8co9aJnFGlC3HLlbI0SVvn7UWJ+W
	+bdxyO/NEGfBZJHGc8quKE5znEjqdrg/xLs9E1eOhl/wbff9PzaMhsDMRNUkmGxhuwTVF2pTKKl
	cvMAVRne1+NXUR4CSWQrbTtlq1sq1PWK/PXUaBwou9m0zIku0h
X-Received: by 2002:a05:600c:820d:b0:487:467:42a2 with SMTP id 5b1f17b1804b1-487046744a1mr50811405e9.18.1774182272017;
        Sun, 22 Mar 2026 05:24:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1bdc:7f84:18bc:1e56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm21072695f8f.19.2026.03.22.05.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:24:31 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 08/15] irqchip/renesas-rzg2l: Split rzfive_tint_irq_endisable() into separate IRQ and TINT helpers
Date: Sun, 22 Mar 2026 12:23:51 +0000
Message-ID: <20260322122421.132474-9-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30067-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 3F4732E936D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

rzfive_tint_irq_endisable() handled both IRQ and TINT enable/disable
paths via a hw_irq range check. Split this into two dedicated helpers,
rzfive_irq_endisable() for IRQ interrupts and rzfive_tint_endisable()
for TINT interrupts, each operating unconditionally on their respective
interrupt type.

While at it, simplify rzfive_{irq,tint}_endisable by replacing
raw_spin_lock locking/unlocking with guard() and update the variable type
of offset, tssr_offset, and tssr_index to unsigned int, as these variables
are used only for calculation.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Simplified rzfive_{irq,tint}_endisable by replacing raw_spin_lock
   locking/unlocking with guard().
 * Updated the variable type of offset, tssr_offset, and tssr_index to
   unsigned int, in rzfive_tint_endisable() as these variables are used
   only for calculation.
 * Dropped stray newline in rzfive_tint_endisable().
 * Updated commit description.
v5:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 75 +++++++++++++++++------------
 1 file changed, 44 insertions(+), 31 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 78cf451c8798..71bde07675d9 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -212,48 +212,61 @@ static void rzfive_irqc_unmask(struct irq_data *d)
 	irq_chip_unmask_parent(d);
 }
 
-static void rzfive_tint_irq_endisable(struct irq_data *d, bool enable)
+static void rzfive_irq_endisable(struct irq_data *d, bool enable)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
 
-	if (hwirq >= IRQC_TINT_START && hwirq < IRQC_NUM_IRQ) {
-		u32 offset = hwirq - IRQC_TINT_START;
-		u32 tssr_offset = TSSR_OFFSET(offset);
-		u8 tssr_index = TSSR_INDEX(offset);
-		u32 reg;
-
-		raw_spin_lock(&priv->lock);
-		if (enable)
-			rzfive_irqc_unmask_tint_interrupt(priv, hwirq);
-		else
-			rzfive_irqc_mask_tint_interrupt(priv, hwirq);
-		reg = readl_relaxed(priv->base + TSSR(tssr_index));
-		if (enable)
-			reg |= TIEN << TSSEL_SHIFT(tssr_offset);
-		else
-			reg &= ~(TIEN << TSSEL_SHIFT(tssr_offset));
-		writel_relaxed(reg, priv->base + TSSR(tssr_index));
-		raw_spin_unlock(&priv->lock);
-	} else {
-		raw_spin_lock(&priv->lock);
-		if (enable)
-			rzfive_irqc_unmask_irq_interrupt(priv, hwirq);
-		else
-			rzfive_irqc_mask_irq_interrupt(priv, hwirq);
-		raw_spin_unlock(&priv->lock);
-	}
+	guard(raw_spinlock)(&priv->lock);
+	if (enable)
+		rzfive_irqc_unmask_irq_interrupt(priv, hwirq);
+	else
+		rzfive_irqc_mask_irq_interrupt(priv, hwirq);
+}
+
+static void rzfive_tint_endisable(struct irq_data *d, bool enable)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hwirq = irqd_to_hwirq(d);
+	unsigned int offset = hwirq - IRQC_TINT_START;
+	unsigned int tssr_offset = TSSR_OFFSET(offset);
+	unsigned int tssr_index = TSSR_INDEX(offset);
+	u32 reg;
+
+	guard(raw_spinlock)(&priv->lock);
+	if (enable)
+		rzfive_irqc_unmask_tint_interrupt(priv, hwirq);
+	else
+		rzfive_irqc_mask_tint_interrupt(priv, hwirq);
+	reg = readl_relaxed(priv->base + TSSR(tssr_index));
+	if (enable)
+		reg |= TIEN << TSSEL_SHIFT(tssr_offset);
+	else
+		reg &= ~(TIEN << TSSEL_SHIFT(tssr_offset));
+	writel_relaxed(reg, priv->base + TSSR(tssr_index));
 }
 
 static void rzfive_irqc_irq_disable(struct irq_data *d)
 {
 	irq_chip_disable_parent(d);
-	rzfive_tint_irq_endisable(d, false);
+	rzfive_irq_endisable(d, false);
 }
 
 static void rzfive_irqc_irq_enable(struct irq_data *d)
 {
-	rzfive_tint_irq_endisable(d, true);
+	rzfive_irq_endisable(d, true);
+	irq_chip_enable_parent(d);
+}
+
+static void rzfive_irqc_tint_disable(struct irq_data *d)
+{
+	irq_chip_disable_parent(d);
+	rzfive_tint_endisable(d, false);
+}
+
+static void rzfive_irqc_tint_enable(struct irq_data *d)
+{
+	rzfive_tint_endisable(d, true);
 	irq_chip_enable_parent(d);
 }
 
@@ -503,8 +516,8 @@ static const struct irq_chip rzfive_irqc_tint_chip = {
 	.irq_eoi		= rzg2l_irqc_tint_eoi,
 	.irq_mask		= rzfive_irqc_mask,
 	.irq_unmask		= rzfive_irqc_unmask,
-	.irq_disable		= rzfive_irqc_irq_disable,
-	.irq_enable		= rzfive_irqc_irq_enable,
+	.irq_disable		= rzfive_irqc_tint_disable,
+	.irq_enable		= rzfive_irqc_tint_enable,
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
-- 
2.43.0


