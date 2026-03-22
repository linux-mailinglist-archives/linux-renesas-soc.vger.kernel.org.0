Return-Path: <linux-renesas-soc+bounces-30066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHB2Bb/gv2ml9wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:29:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 632B12E9361
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD8DA3041BE5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 12:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8B5381B0E;
	Sun, 22 Mar 2026 12:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBFPFZnX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803FC381AE4
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 12:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182274; cv=none; b=TaDeczNDvT1kxi8NQLSQmD17KPzN+VYXIBvKft/eMFk4CfN/hYsZztBYDs2hjH9h00VuTUo349/qjjCNL7Iop90atBdlOXDz0KQ/3KXjkYhCscZabhmeNNsz3cd3FhOXRzhJYhQqvqYfjvV21szEmkP6EiXdxlPV0J99o7hkg9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182274; c=relaxed/simple;
	bh=4Bp9lpvpFJLHE6GKmGDfWerhcPBCMqideHGuARLZtts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qMiM5o6gMxDnIljPAUyQJDhEDA2Tc6aOWlK63x/pP3ZbIVbW089I/tKDh0D+AqbBQJqxxXyiYYFSIXpORYxexNnYZh0QqPFoYCumzWKDqfKjyybYF1jM5InYv/r4Oa8AO+rLain/W52JXt4FgczF3x9RzX4vZz4M7cAN2OLID0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBFPFZnX; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b6d9c981so2256416f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 05:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774182271; x=1774787071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNAwTwMGjBXpze3/2lHvMgp/fmlNJqZmlodbykzkXLg=;
        b=BBFPFZnXNvWbm/NyrI6Dc4QGAZK6l3ZN2shCtDLVwwb6aeICrcTeQIgCUExqGAfwn4
         HarLsujfebjDr61n/oMoDFgdlLjBDOTrKeRQSkcIukphP/tKf2YeXoScT4dVaoK2B+NA
         MiH2pj87cMm/D5a4b48YvGvWy2ihEDGc3axmHGX5Cl1iJyhWG8Zz4c58DfTTHTN0Tt9d
         HwYKDdyMWgzsqxOX7w1vLic0qslIFLHBdV9YDnlha8kfGSGp/xgX94NJLjnoCPjjsqzn
         XRR1VO27xu8IvKjzFNMwL68GzApXVQHxAHxEY2hfBcmPRCKBacXjiot4CHhVO88ZuBfc
         wkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774182271; x=1774787071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GNAwTwMGjBXpze3/2lHvMgp/fmlNJqZmlodbykzkXLg=;
        b=gmyECDZ3NdWE0GxeEc977MJPUwdWwYet3H7kfC93czkOTyLplgrjQyuL2lPprbn82C
         CdH1oWW9inEPMfYrr8jtxDXYhlhAQGSTWo3BcO90+RKZvIbuMHTGNm+q1CqBNJK/7Wx2
         JOoBoDrfKWi41UyYia5Ha6W9NzAK31doYDjPRUlaQVP64GUDnX5UxITFYdypfjNL5EES
         pQRGv687tmQdtOG2+3aUBsHPgyA2us/fooC6kHROnSbAUHenIInAc1tgxVru1rm4cmWs
         AgzN8qzvstr1u+R/VLefjtga5N32+FpB1wxdyTVCY8wUywB+UJ07b6L0lbB7N67fRxOD
         kBiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/RpXPerf0R854GXzh5Jp1mF/rL5DfN/6dqtcmACVvCgPBx3c1o8QHAc+G8NcYE5wdcGIpywwVunPzHtEKYG2sQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzA9yPc9n0VaVuBeYL3gEdBApLficTn/s/I2zZhLNxjtNhO6GV
	lqWtKvHvjCWT2Z80pP6jm7Osiskc0BMTz6yLMww1sG6TIYhp8znqTQB3
X-Gm-Gg: ATEYQzwydA2HQfvO8CEtvyPgWXzZwFxvEToqTWOJJV3yaQ7+zleJHXToCpqlR0IjlMX
	lRceV8356V8gCkbSKSCi41yxlE2xLuloAb3eOkejkLFlunzwm3ZCy/X+C5P1zfRA8SI7voLIMfC
	iFoCaj8A9f632d6Sr6woWY2qthtBjmYP2KdF3qQBE/6Fz0BguVKKXGqveO06fJ9epxwLVkaVPQm
	rKZ/DZjhuYdi3oyeOK6os3fmivoW6/4MKiUVik/1g8iIvyjzIX7wOO33GHbp/wGoj9DMj28A4F0
	XwWFpU0PMVe1VgQCKetjA4YP9mKEKg9+Q46XSuJtq3rUXVj8AZVNQWIp82fKLQuZwpMpk87JzSd
	cbwpgcWVH9+J5VSNk5W6XpioWsckPcf0Y/zCgDluNfBuEpAvUrXWvA20LFZlP4zx0KIjnEXfF/C
	lxX4IPyGU/nuO5LLeFP3Rb2rszPDJF5wG2rg8K3KSovwcXKCYR
X-Received: by 2002:a05:6000:270e:b0:43b:3c32:d901 with SMTP id ffacd0b85a97d-43b576fc6bfmr14749267f8f.11.1774182270851;
        Sun, 22 Mar 2026 05:24:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1bdc:7f84:18bc:1e56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm21072695f8f.19.2026.03.22.05.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:24:30 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 07/15] irqchip/renesas-rzg2l: Replace rzg2l_irqc_irq_{enable,disable} with TINT-specific handlers
Date: Sun, 22 Mar 2026 12:23:50 +0000
Message-ID: <20260322122421.132474-8-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30066-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 632B12E9361
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
index 84dded4beae6..78cf451c8798 100644
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


