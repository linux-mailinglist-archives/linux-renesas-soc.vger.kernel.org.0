Return-Path: <linux-renesas-soc+bounces-29249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPSTI2rCsWmdFAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:28:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E895A269521
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FE6032328C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 19:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041FD3E557E;
	Wed, 11 Mar 2026 19:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m978MJcL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149D53C9EF9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 19:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257110; cv=none; b=eqWgMx9tXwLMIprL6dKaQzdAqQ8KZjGUt7d5mJEANZCIBiZ2y0yZHEFukVL2j7ueSSGE2E5lry57ztbfG6WrKqzMiQnkr6M5D/JWdhj9cbRiE+Iq8m1xR3OrS7VVyWTVTgZ+vyNmTchIAiyAq/UAhjujXz91M9RB9Av5fw18lxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257110; c=relaxed/simple;
	bh=3dPZmfuxSa9+StYu9kHGBvda1YP5z0QRhThE+L/eG8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7Pey85mBiP0qdMgCkHrD5KnNWT+8rYRaZcX27X35vgNikxc8pASvTihWzeMIXpvy9B/VmmRDCiP4x8Kpz8NI0h4RayT1MirEQMvqRA4XYusWW3ddbqwKJNEzta35DFv51Sf1xX10N2Y+daD7hGhNS4V1lw61SiZ3+E2S1sXf9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m978MJcL; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439c4a93841so185393f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 12:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773257107; x=1773861907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCEZNOhYzSxA1k0R7KF6Up+P27mNNlK+gHFgw3PPzoA=;
        b=m978MJcLH4QOyc3gh8jUJsOolLDNCi1GwzUvoJq7+eIdqZxWAeW7yfZCYsgb4s1B7L
         HhIoBMTN+ZKNkeiofbzd8+FH1UQmPMaq6upy9BquuAPTgTi8lF3HF3pghZwNaFRv+MSJ
         71rUst472m6kCj5YIqsdDiXhECYfoMF9KddlbOFM+GuCjoe2ZQ6zL5mu8Wvkdv1v29U3
         E0vJW2dC0bwb6tVtZuVjiVggKDrCrUHd8wuiyAmFVBUn3HBos9rRpn3q8bdq6Edo1BYp
         KnqB1BKEPYFvt3i/MZRU+TXsKVdb/3r4bb+N1ZtLoEGaxDYAvxVwRaTDKl7m4BadSswW
         amZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257107; x=1773861907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wCEZNOhYzSxA1k0R7KF6Up+P27mNNlK+gHFgw3PPzoA=;
        b=UdjZuGPuEJZyn2Wcjuz4RI0bxdTbQ8Ejaw8P5DnWZCZLtQ8q5tJwNf/QiTg+kPAvUz
         VJTdAHKJXRXLLOg0vsWU9ZTlR8IJJIkkqi8jS6F536hA4Cd3VVKsVq0rc02e+kpKuxPq
         w9zHGy8KLDV4/4gtYObIrzrzbMv2tUXRFhGsRg1s3A2n7YHzPw7FarYLrZ5HWvW+iUmt
         jTFIwkoBuzRTP2LzsWYwJ6PmbM6BDZBv6zrUCepsbRFRI6OWKgpeQxEsPzM8fpQ556aN
         RkhXeM0IvEhmCDGf+2EwkhxhwT0hy0ot9Uzbr0KeJavUrG5ccnsPKrV5O4r5O9mFGWZo
         Twxg==
X-Forwarded-Encrypted: i=1; AJvYcCXhILh0Bhb9X4UbKlZUrmsTqaWEY2OzsQ9lOM3PbjBOcsn+GmlIN5f6Vi/goI/nMLNwgMkfbhGwpuelOW9x7AL6uA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwrXOjzUYje3QcDfJnatYjbgCVy5dr/mqfIkYdfxMWsPWzn/a5
	TlR8bG0II6KVH3VF9Gh9BVdarjUm6OAVzokvWFLGo02rVETF7SbnyPIT
X-Gm-Gg: ATEYQzzdJgZObJxa/iG9633cBrwZwMfC1mwCeDzT3eIDBhFD04O5oVQxFm/y0w8MjPY
	b48YiTDhPZdPKUn+TPwqWZWUhKyJWd0dwo+/mPDmzwJ3+H4EkCLiDQsijnrjFAoQkuyWwlONo/Y
	Us9iVdINwep/paJNmSC+l/GWUbaevtWbVzMw+VI9dBG3g5JJBkMXdrd+r/108h3f4VwUgyA4Hfb
	Bo129aVRA3gMmfq4vnPL1bjR+dnjh9EUmg+t7+kUIdOnxSj0pQYxwHJMV3f8YmlNaj5NGy8c2Kw
	dT0jFT7W+UquHWGrXVaApBT2EMXVd/p8CcKprMuEQX1FUwX8K+vjJJoZHJBzDIoauVCRbFK8WX7
	Dcaqe/yd5s2TEtIXHjhC+KlTyJXL+1kxXgh/bNGzanEei4PUCyriyYhIqjHs+ppoFOBwYb0EFIb
	09pmM6/TqUbBNa5T5OTz2Mdr0QGnwJ/TafetXEmAMkZuxS/w0P
X-Received: by 2002:a5d:588b:0:b0:439:be4b:6868 with SMTP id ffacd0b85a97d-439f84358fbmr7575669f8f.47.1773257107398;
        Wed, 11 Mar 2026 12:25:07 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:38b7:8ca3:cb55:d344])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm1323210f8f.21.2026.03.11.12.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:25:07 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 07/15] irqchip/renesas-rzg2l: Replace rzg2l_irqc_irq_{enable,disable} with TINT-specific handlers
Date: Wed, 11 Mar 2026 19:24:38 +0000
Message-ID: <20260311192459.609064-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29249-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: E895A269521
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

rzg2l_irqc_irq_disable() and rzg2l_irqc_irq_enable() were used by both
the IRQ and TINT chips, but only performed TINT-specific work via
rzg2l_tint_irq_endisable(), guarded by a hw_irq range check. Since the
IRQ chip does not require this extra enable/disable handling, replace its
callbacks with the generic irq_chip_disable_parent() and
irq_chip_enable_parent() directly.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 41 +++++++++++++----------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index c779bcc4028d..0d6b72e1bc02 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -259,33 +259,30 @@ static void rzfive_irqc_irq_enable(struct irq_data *d)
 
 static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
 {
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hw_irq = irqd_to_hwirq(d);
+	u32 offset = hw_irq - IRQC_TINT_START;
+	u32 tssr_offset = TSSR_OFFSET(offset);
+	u8 tssr_index = TSSR_INDEX(offset);
+	u32 reg;
 
-	if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ) {
-		struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
-		u32 offset = hw_irq - IRQC_TINT_START;
-		u32 tssr_offset = TSSR_OFFSET(offset);
-		u8 tssr_index = TSSR_INDEX(offset);
-		u32 reg;
-
-		raw_spin_lock(&priv->lock);
-		reg = readl_relaxed(priv->base + TSSR(tssr_index));
-		if (enable)
-			reg |= TIEN << TSSEL_SHIFT(tssr_offset);
-		else
-			reg &= ~(TIEN << TSSEL_SHIFT(tssr_offset));
-		writel_relaxed(reg, priv->base + TSSR(tssr_index));
-		raw_spin_unlock(&priv->lock);
-	}
+	raw_spin_lock(&priv->lock);
+	reg = readl_relaxed(priv->base + TSSR(tssr_index));
+	if (enable)
+		reg |= TIEN << TSSEL_SHIFT(tssr_offset);
+	else
+		reg &= ~(TIEN << TSSEL_SHIFT(tssr_offset));
+	writel_relaxed(reg, priv->base + TSSR(tssr_index));
+	raw_spin_unlock(&priv->lock);
 }
 
-static void rzg2l_irqc_irq_disable(struct irq_data *d)
+static void rzg2l_irqc_tint_disable(struct irq_data *d)
 {
 	irq_chip_disable_parent(d);
 	rzg2l_tint_irq_endisable(d, false);
 }
 
-static void rzg2l_irqc_irq_enable(struct irq_data *d)
+static void rzg2l_irqc_tint_enable(struct irq_data *d)
 {
 	rzg2l_tint_irq_endisable(d, true);
 	irq_chip_enable_parent(d);
@@ -456,8 +453,8 @@ static const struct irq_chip rzg2l_irqc_irq_chip = {
 	.irq_eoi		= rzg2l_irqc_irq_eoi,
 	.irq_mask		= irq_chip_mask_parent,
 	.irq_unmask		= irq_chip_unmask_parent,
-	.irq_disable		= rzg2l_irqc_irq_disable,
-	.irq_enable		= rzg2l_irqc_irq_enable,
+	.irq_disable		= irq_chip_disable_parent,
+	.irq_enable		= irq_chip_enable_parent,
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
@@ -473,8 +470,8 @@ static const struct irq_chip rzg2l_irqc_tint_chip = {
 	.irq_eoi		= rzg2l_irqc_tint_eoi,
 	.irq_mask		= irq_chip_mask_parent,
 	.irq_unmask		= irq_chip_unmask_parent,
-	.irq_disable		= rzg2l_irqc_irq_disable,
-	.irq_enable		= rzg2l_irqc_irq_enable,
+	.irq_disable		= rzg2l_irqc_tint_disable,
+	.irq_enable		= rzg2l_irqc_tint_enable,
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
-- 
2.43.0


