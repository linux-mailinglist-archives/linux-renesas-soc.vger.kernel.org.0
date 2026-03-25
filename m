Return-Path: <linux-renesas-soc+bounces-30280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oH6uFPQ2xGnkxQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:26:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B27A32B33C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7D5530BED64
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7C83EC2E3;
	Wed, 25 Mar 2026 19:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n61Hb5XX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0587834D389
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 19:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466704; cv=none; b=DT+5jz4ZxMnXVql0mCu1aGD8SlhHgpPdYx25jIL4TYIO4lbcUQp0687m6HSwacdRcqtsDTQIwCh3nEW5vJLML6PJtt4oPuK+xfzIXm7IFJtpbLuTZBM89aaxhzm4aFmDJ8gDCH7Ivb/o8kEqPCJY8qblIYyAk99uWVRqafQ1ofI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466704; c=relaxed/simple;
	bh=mGrpbtd7O99HFdEBvrSlm4J2aaoUidqbZw3lec3A4Ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TI0yiN29mtNVY9OqgRpf9I/WV7+mjpU9NSNaC7q05QTaTU0tbbUiw5suD9MKFI1IeVNGqhE36zHGpP4hOqBbuwyqAOQdObV5M1LTuG/fTQ6FIZhoobcQytTpC9vntds6aRAHUU6B1k44WJPp+Q7MLCwuOgrjoFePxOCAGCOXoTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n61Hb5XX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4870206f73bso1369025e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466701; x=1775071501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZvNEX0eQZxtcjPdToyJZElNzJL/cd7oKRQgio/5M8o=;
        b=n61Hb5XXoTnEr/jobP2KO58hkuFUb0CnZ62i+ZAsGtU7aGzUF5dvq0q71atKS4FrM+
         NUYVZlKUvJQoAqy0Yekae4RXvdNjzooCx+8A/1pj8e6YBpBNBwAeHs0KKTpEPsZsXOeR
         FWdlC8zcvEavkgjRIYxwRSyeVe4pneuqh/UfN/sn6vBrfyWJGrFrnD7DrqNvwJ8laxOx
         llj52KYUXHUzFRqmTeggAYvMlb7mvYrgALGNJDZ8zAv3IwgAqo66xVO38IM/DVpYKxQS
         EoUIarqrpzNWRA6dxf8uDuB/wAd93/2kK2GBdU7EI/nbIFUs+UFafxHdfOwItGepjwIu
         rcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466701; x=1775071501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BZvNEX0eQZxtcjPdToyJZElNzJL/cd7oKRQgio/5M8o=;
        b=NNSKo8LNB1aBuG1ncfcxGTpbdAG6Bkr68gXkPb1Np4BMw7/Pqi99Fn7Xt8Xhc2Ec0n
         hNgXR28qVkjUkrBOHuMqJDPJYui0S3Iv931rXc6XKlaWeOkOcgE+Js+AyePx7IiM7i4D
         ciYqP9FZWGxiJOJIhLSYyGuM7pgWlaNu3YQ/If9orcQpWz9/w9bgdG/qevgnj5nrVZ0V
         x2wZg3Pj1tawOLcn5ZilJezzXRzpMjZ67H1M8Oa1FCzUFjubmN/ubRQn6k3hUpfyxdxW
         fOsvVSzGRsKpTdHTO6mj0DAnERzZaZADOBzvv3b5Sp7kC0+LVt8ERXx0YkM3y9EOHhDe
         QgLg==
X-Forwarded-Encrypted: i=1; AJvYcCVpg9tLfegwTSuUONRe7zkwbGVbUHn+YzcmBG8X7Q8OE6gyYHx5HNe7NOk7epLaFYCZdks+kZY4HM3b8DJVby3GDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIexbqzyeLmX/JTAdVXMgOnMvuOTmtifuZD1bE+g53gaSzFD9U
	I2U4E1vmh215Rh3D9AmS8OuABhgZUMwdV/nQwVga5GSuF9ZEYuMxEvdp
X-Gm-Gg: ATEYQzze3aAwqNSDveDUXvWavPJVEkgTGjC8jC/HVhMBhC3a9d7W4xup72mRVUl67bP
	wknlS8yv87jb4m28cBFh6rP79HmQF0j3VDBKHmtpaEcurjP9el+WtGvSHYetrwJH7EfQGllJJSu
	0VmenaM8tgPAmCNuWKJuMDV4fQEHwDA6fcD+Kiw7ZLYXXmJcEoeuttn+DFLBr4+Q5xQhFbQxTOD
	k4L0Gi2Icc3Y1zFZxnZqeorQccMM5sEL3YgHC4g7da1Wdf/GoO+56Cj0GrkEVN0NfEHSn3K58QS
	th2yesEcHfjZbg38yvMk/XU90evABGDzDM/paexovAkMDC7vQ2iP6tk3/3iA7aFoStNJHgtoN80
	wNtTBZC8Nal8EIcDpKiip2D5ZF49xojVU4sZzdhFsv4URix52hUFLaG6zqb/BE3Vpu66XUpz3ZB
	jMQlDOiEB8wHRPwPfnI1wXdsnj8PsUFUDJJUnwEQ3qHmyOgBkS
X-Received: by 2002:a05:6000:1a8e:b0:43b:54c9:7d21 with SMTP id ffacd0b85a97d-43b88a25a60mr6941545f8f.37.1774466701301;
        Wed, 25 Mar 2026 12:25:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:25:01 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 08/16] irqchip/renesas-rzg2l: Replace rzg2l_irqc_irq_{enable,disable} with TINT-specific handlers
Date: Wed, 25 Mar 2026 19:24:23 +0000
Message-ID: <20260325192451.172562-9-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30280-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0B27A32B33C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

rzg2l_irqc_irq_disable() and rzg2l_irqc_irq_enable() were used by both
the IRQ and TINT chips, but only performed TINT-specific work via
rzg2l_tint_irq_endisable(), guarded by a hw_irq range check. Since the
IRQ chip does not require this extra enable/disable handling, replace its
callbacks with the generic irq_chip_disable_parent() and
irq_chip_enable_parent() directly.

While at it, simplify rzfive_irqc_irq_enable() by replacing raw_spin_lock
locking/unlocking with guard() and update the variable type of offset,
tssr_offset, and tssr_index to unsigned int, as these variables are used
only for calculation.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change.
v5->v6:
 * Updated the variable type of offset, tssr_offset, and tssr_index to
   unsigned int, in rzfive_irqc_irq_enable() as these variables are used
   only for calculation.
 * Simplified rzfive_irqc_irq_enable() by replacing raw_spin_lock
   locking/unlocking with guard().
 * Updated commit description.
v5:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 40 +++++++++++++----------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index b3457a419bab..6e55b325cca9 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -259,33 +259,29 @@ static void rzfive_irqc_irq_enable(struct irq_data *d)
 
 static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
 {
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hw_irq = irqd_to_hwirq(d);
+	unsigned int offset = hw_irq - IRQC_TINT_START;
+	unsigned int tssr_offset = TSSR_OFFSET(offset);
+	unsigned int tssr_index = TSSR_INDEX(offset);
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
+	guard(raw_spinlock)(&priv->lock);
+	reg = readl_relaxed(priv->base + TSSR(tssr_index));
+	if (enable)
+		reg |= TIEN << TSSEL_SHIFT(tssr_offset);
+	else
+		reg &= ~(TIEN << TSSEL_SHIFT(tssr_offset));
+	writel_relaxed(reg, priv->base + TSSR(tssr_index));
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
@@ -456,8 +452,8 @@ static const struct irq_chip rzg2l_irqc_irq_chip = {
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
@@ -473,8 +469,8 @@ static const struct irq_chip rzg2l_irqc_tint_chip = {
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


