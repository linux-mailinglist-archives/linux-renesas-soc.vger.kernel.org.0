Return-Path: <linux-renesas-soc+bounces-30068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMwKIh3hv2ml9wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:31:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3283F2E9374
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78517304C629
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 12:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA973822A8;
	Sun, 22 Mar 2026 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXWaSg7f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7130F3806DE
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 12:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182275; cv=none; b=orQu6MY4utKb2vXVKScYHyqJALPR8HI6eayXQHfwx8NXAbOwa+xLN2vrZ7gGQjdCSzJL+utU+tm/XKUZaDTWP79LpA63rFge8yfT9+4T6HlqIB6bnp3YyNM9R+XM9yzzBtNlLBz/X3C3QMGf7y0zYVuoVreRQZ8wJuVGHGuAQn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182275; c=relaxed/simple;
	bh=WufSUGU/OKKQ/6W4TtvXGJAWO601k8aNbxjJOWYroy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t9YV1gjL/ucIGzHLnkofHnSpffleNgGOGt9keJ1NxO4E8xHEGxwIklvfruy73Cc2J14Whc6/2Z2aEIDErV/LdpPzNy16W4Us3rERL2ptMUGgBsC2j5zrKQfqZarUJmecjchs/spCIYo8953Dcaas/Q/3MK+k3cvURA3qEquI/JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXWaSg7f; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b40003d13so1972679f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 05:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774182273; x=1774787073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSrz7nV+L27WDUhgHlWWOwEYkqqCerWHNMbGLrfjsNY=;
        b=GXWaSg7fGAaGRD34/jg6mBHRZrcejMXZyQVxmE1OrlLlyGo4yQwvFSl5qTb15i34I3
         9Lf7xDUI4p4Hfxfab9HbQmjv6ZYHWa5pK67rKynljXRaQk/2oy/XIZ8QLyfhDMY3rNWL
         MmNihxTuWedyB+9J0YUpRnX32P+iit49C4JRw8cG6vbfvVG0F9tX82Cfc73U3mb4EMmB
         IlcRW8+srun8nJT78pZ61XCZnae5YsX1EdBoIug8TB9cZe4vFj3lWLLglqHbFKmoKRqv
         iDzrrJVrgX6mtkOwUQv40Sf/gl6ugouDSjtTcspbT/P99bg7y9VPRsm3SK0VEVaYm2vx
         Bb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774182273; x=1774787073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zSrz7nV+L27WDUhgHlWWOwEYkqqCerWHNMbGLrfjsNY=;
        b=et72EIWHFDFLhdY/IJ9S4fTqNM9p5R/5sVpe2VlruWfsEmEnXewJqVOr1vtgyqwDQD
         b0ZRJfQd0rTRjmvrsTidDjacpdTVbzh/dDA/y3Wk+mj/V4hjMXvCUPGUyOLD8GUb0ZdO
         /F8PVMBwtbR1KsRf8pftY254KTegY4VLTxJF1CYan8q+u6O79gtTaOUPJcJu9vPqZ2WK
         9rumPBYId0CyNX88f/UFPep/HVBv5jglwj2vxTiLZFG8fRVeyIW0x8DflogvBj+Ege6i
         8nSWHZavApCqOlias1zcqC3lErXhXNpU4kDxLTzZghFuXfy2/rWU3Ghihheh5isrAvpU
         oi0w==
X-Forwarded-Encrypted: i=1; AJvYcCXrJINUaDzDI2wWScNVlvPKidCX8roFWNdy4/k8gLLFJLJXmXoDbtPnfxUi66LJU40WT1AuFzrwShegZBdhGN3dzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySjsWdby/4sIF7s2nnRrDj2Ig8cCT+qMe5XGBGasSQG++2XB4M
	CshLqKlDYFdfpiHmhSfyjwW5EZNEcg9X0wmlyFKnYvDKWQGMxNoZ5hFJ
X-Gm-Gg: ATEYQzxDk5Tq5Ji+Jm5U3qYq0wbv/s52N7bAHLiuzMe3HRdwqPkCnbA73f6EhsQpFAF
	ueCu+Fo6FT9CqHrcmPaLm3arYLIspoEUDfTC5U/WZmY5t1SK/eIIolZCz7/hZx9xxNeNUbxkbsk
	lKRAmRKMBSuk4f4jBFZjNNHQxpqF4DX19Yj4lh+DYl4mEL6WnwkJ2siS7Lst69Qh6uPAV1Jpk5A
	+6e4EhhzmyhsMU1u8KNAps1xfGytNHLebR/F+EzNCG+Xi4cEVIk3wug5aErPo5srCH29vqo12fv
	zeTw0dfKe707s+NMqtihwizjjVvpt7Fb2CRGISXTN3nHrktMtKNYT+seY50O65ZH14d9/0ocsMt
	YwRcn3AKbSPrtogMDNspu6Kq42FjJ6JDocmpYGHLvmRh7Bv0EU5RteChUcTO9dHb9ACfVtgmgtl
	rHVvv2GV2vI7wBE1Oq51bt3MfHCB4xPny34/wFb5/DjCCcE7Kb
X-Received: by 2002:a05:6000:2f84:b0:43b:4312:2ca9 with SMTP id ffacd0b85a97d-43b642402c0mr12873174f8f.6.1774182272726;
        Sun, 22 Mar 2026 05:24:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1bdc:7f84:18bc:1e56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm21072695f8f.19.2026.03.22.05.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:24:32 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 09/15] irqchip/renesas-rzg2l: Split rzfive_irqc_{mask,unmask} into separate IRQ and TINT handlers
Date: Sun, 22 Mar 2026 12:23:52 +0000
Message-ID: <20260322122421.132474-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
References: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30068-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 3283F2E9374
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
index 71bde07675d9..0b1bad002653 100644
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


