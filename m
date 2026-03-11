Return-Path: <linux-renesas-soc+bounces-29251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DrYL87BsWmdFAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:26:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 198C426945F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5627630451FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 19:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207A03E9F75;
	Wed, 11 Mar 2026 19:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCpY++ph"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DD23E557F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 19:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257113; cv=none; b=Sh2iqVxQ1Aj2gbACUjnuIiG5R9HZUfYtIrO5fyXs0mVKgM38fOd6hBKZ6743ufop1OXZWF0UG3NE0He6f2sXNWtMCNahkKNc8BDmXnMLZ5lYDEJfhr/dkIrm2VxybBv0DG0Reasmt/WaUC84+XoJ/hT8ZBSlvkz1q/D/eUuRwTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257113; c=relaxed/simple;
	bh=9oiAbcWjEfgaBgpmhpb898gNxNOJat+jQs9qnUiLUgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DkkZkoaCPvpPCSRfqTKnP8nw8yrIF29sTeHwrGi2PEAvtWckFS0JLJwPfI6McrhHouXeQm7imydqvMNdAynptqIv8bM9Jw9B1f1h0FkIZu4X/+/vt1D5YJE+p+MOtVboyNBqTDxEEv8scisfqS3J4WUAeOejkStlYuQTIhFbBfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCpY++ph; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439af7d77f0so221971f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 12:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773257109; x=1773861909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2v2QrzPKN7jBP6V4KIFwuXhzoPzNwKJfv37TL6swzDA=;
        b=UCpY++phy8/1W61EnHKybYqqCQum/XQdx4sitxLpujHr5aJ8PFOH4mh/0Knj4zAUHt
         ty4HDBvE910KP/CuawLxkfubhcYnpvCK+vDd4cvFL2iV8pKMb2LfzVrKDZIrAi91Zq/j
         BC4cUHTYdRTxaKSbAdMHQ/f8mydUo5ENvzvDy3gmbq2BWL1/xu+yl7nyLfdFQO2Mv9kV
         aTpRulGa4YcxRLL/vazTB3ODsgtCEh4ei1iJIDbLJUC1E2ODPBegukrov3RntGCD4+Cb
         Vl5ccqmnauvSKkqItnSD6lGj+7Wlt/lUR0p0j1p7GBcTuvB1B4C94XOYyjLfO2/ATOZP
         n1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257109; x=1773861909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2v2QrzPKN7jBP6V4KIFwuXhzoPzNwKJfv37TL6swzDA=;
        b=WamMO3DrNqTRQoDXw98pX8FU4VbCT26qUYfgkdZHvvUgE8C0WEl80yrArcLMxPmpif
         kDSsrJIFciKIAXtDaUeM4Iue214wAXT2koyN6DyLY3rSaSuCIPVecNcwTMTxc1Zzkc3t
         1TTPNqlMMozGx7hJOQe0MXqxC/2T6jB5CDtgjKnGOp6ndYACtlp2D25vrvAwTDoHDysD
         oDz9bhewf8PBpFAvOKPqf5PlrSfyQvv1evAZ/1EhDEIAV/Do3Dx3c5b8Hxg7NkBnv5p7
         8BOTAOU1ei3l1spHevCj4u9oX6bk5PvDT6gPS7yCuFLIkkUj8jcTFdxYOOrQKag+bgqa
         nh2g==
X-Forwarded-Encrypted: i=1; AJvYcCWl8YdB2PnO302iVu3YbLsq6QPQ4zFN/oMyEJxkFRArYt9dAFnMYmBupQbdHG/Jm1Sism+Elc5rKjFg52o0ansp4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyscWylkStKQ+Uf9mZcg99Veo9zFUrCEG3k5QbWEV139u4+wnY2
	65Outle566eA2aMOJfWGk4rHRgb8hYJatsG9ySVB5t94zzIMTgxUBXTh
X-Gm-Gg: ATEYQzy+mcUX4IeHxtgLQ9NzK6HEQHA65JSWNr59jVLeB4l8zOPzXaYPD1e84o0ulzI
	mLbT32JofqHgxYvSqG4gEbuS4q/FbOqfG5GkwLj9xb3iptAtN4TZwBo/crrluOFjONMGXZfCgol
	3HzTDGh4qe+ldlGyNbq5aVi4s74Q8euX9Hd66KywElkCNoMrlaepoJ13g6Ouw4qf3wHHOdmqFJh
	zrzYDoufzkjM/fY6syk32z4aPmMbHH+rX4DgglbaDRDR8huiyPeBeoym3bakwukgIkrdpiPTXpv
	dly9i1eV3sIJH8KNVTMs7Twaxm/vNqm+NrYdb8Ufl8P8auPLyp5S4oHulq9QeHsq3ivi61QXJaW
	WByV2Xg5zz+pdKi5h6AWmydEyyXKpYr5OwcQkbB1bk/pXljSc4BN6Ib/qPgwZr5sPVckBCfWyH7
	xK8rvrNdNkITkeQBWRXLIBhWfWnChLRUBHVjHt2sDctmD+pvsvO/LMDvfkeE8=
X-Received: by 2002:a05:6000:240e:b0:439:df02:1d70 with SMTP id ffacd0b85a97d-439f842a97emr7261683f8f.29.1773257109303;
        Wed, 11 Mar 2026 12:25:09 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:38b7:8ca3:cb55:d344])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm1323210f8f.21.2026.03.11.12.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:25:08 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 09/15] irqchip/renesas-rzg2l: Split rzfive_irqc_{mask,unmask} into separate IRQ and TINT handlers
Date: Wed, 11 Mar 2026 19:24:40 +0000
Message-ID: <20260311192459.609064-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29251-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 198C426945F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

rzfive_irqc_mask() and rzfive_irqc_unmask() used hw_irq range checks to
dispatch between IRQ and TINT masking operations. Split each into two
dedicated handlers — rzfive_irqc_irq_mask(), rzfive_irqc_tint_mask(),
rzfive_irqc_irq_unmask(), and rzfive_irqc_tint_unmask() — each
operating unconditionally on their respective interrupt type, removing
the runtime conditionals.

Assign the IRQ-specific handlers to rzfive_irqc_irq_chip and the
TINT-specific handlers to rzfive_irqc_tint_chip, consistent with the
separation applied to the EOI, set_type, and enable/disable callbacks in
previous patches.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 44 ++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 9e0080c5ec95..fd017c73dfc5 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -184,30 +184,46 @@ static void rzfive_irqc_unmask_tint_interrupt(struct rzg2l_irqc_priv *priv,
 	writel_relaxed(readl_relaxed(priv->base + TMSK) & ~bit, priv->base + TMSK);
 }
 
-static void rzfive_irqc_mask(struct irq_data *d)
+static void rzfive_irqc_irq_mask(struct irq_data *d)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock(&priv->lock);
-	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
-		rzfive_irqc_mask_irq_interrupt(priv, hwirq);
-	else if (hwirq >= IRQC_TINT_START && hwirq < IRQC_NUM_IRQ)
-		rzfive_irqc_mask_tint_interrupt(priv, hwirq);
+	rzfive_irqc_mask_irq_interrupt(priv, hwirq);
 	raw_spin_unlock(&priv->lock);
 	irq_chip_mask_parent(d);
 }
 
-static void rzfive_irqc_unmask(struct irq_data *d)
+static void rzfive_irqc_tint_mask(struct irq_data *d)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock(&priv->lock);
-	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
-		rzfive_irqc_unmask_irq_interrupt(priv, hwirq);
-	else if (hwirq >= IRQC_TINT_START && hwirq < IRQC_NUM_IRQ)
-		rzfive_irqc_unmask_tint_interrupt(priv, hwirq);
+	rzfive_irqc_mask_tint_interrupt(priv, hwirq);
+	raw_spin_unlock(&priv->lock);
+	irq_chip_mask_parent(d);
+}
+
+static void rzfive_irqc_irq_unmask(struct irq_data *d)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hwirq = irqd_to_hwirq(d);
+
+	raw_spin_lock(&priv->lock);
+	rzfive_irqc_unmask_irq_interrupt(priv, hwirq);
+	raw_spin_unlock(&priv->lock);
+	irq_chip_unmask_parent(d);
+}
+
+static void rzfive_irqc_tint_unmask(struct irq_data *d)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hwirq = irqd_to_hwirq(d);
+
+	raw_spin_lock(&priv->lock);
+	rzfive_irqc_unmask_tint_interrupt(priv, hwirq);
 	raw_spin_unlock(&priv->lock);
 	irq_chip_unmask_parent(d);
 }
@@ -501,8 +517,8 @@ static const struct irq_chip rzg2l_irqc_tint_chip = {
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
@@ -518,8 +534,8 @@ static const struct irq_chip rzfive_irqc_irq_chip = {
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


