Return-Path: <linux-renesas-soc+bounces-30281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UK6PCOE2xGkAxQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:26:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DD132B30E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 13B36304B5C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD91135C185;
	Wed, 25 Mar 2026 19:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYlibhN7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2D23E4C8D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 19:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466705; cv=none; b=NlPa1a4YHSVTJNg/1uei+qZb0EWjBc6U88g0faZSWJDCYkFEJ+UYNs0siEyTaWn3b/nfudeurq3VLP/7KbvBnah703mM3jgrw35/gL9wPUqPT3JiFlnDfm92Z16UN262MC++wrgITQqXJdcDaV8v7dRwXeKtLEvOMTlXilr2cy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466705; c=relaxed/simple;
	bh=nqVPM1hmwO5JmLKKyP3/lHGeKXnTlQO6jHwvK1jQDG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TOq07i+w6oGLqnKL0AmOZGHea8+in3HLl93izej1S7CLvIOqYwZ54v28gfF1xZxN/cvVu7kR2BbXGsWMx7HeexR7i/FvTjX+rYwAFFQY75jWpC74Tmg85dp/WazYRY74yKB3GCArI4NdfPnyKZNXrdlMLSS20vETOH82oQgdsBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYlibhN7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b527ac5d0so85655f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466702; x=1775071502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKFHksAcuviXc/otCCQz+QY3AlkGK3IubNjvmIBQfoE=;
        b=ZYlibhN7FiopoKu5okx9jG1DwW4EwRNTpMIRvtpjZoyNhjH3NTDkB+8n6ickWEJ7pz
         fIbJqLmAVp2fkKIk4jo91VstDp4W93EbqT3XEPCHR+/TDI/Kfq4/40zKuojKVvfoMXZ7
         NJc0bveeR/WDaSeAXiLefw1nbNhcetpdqBydDFSAy2CYRQbNHA3ofXzqT5bM1kVu4/BP
         OGvCo3FOf7Qomhy5MLgAyHgJ2KmiXbPxAFhity1SBndDME030FNEdOdI2/8fVg69N0/8
         gle4/hwqinGDdp5f0gETRwXIn2vXmN9Ly8y5m4t0l/+oT7ulW+dx0lrlMprSIvJmExnj
         7zzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466702; x=1775071502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RKFHksAcuviXc/otCCQz+QY3AlkGK3IubNjvmIBQfoE=;
        b=ljha72oBqkxwMmHh2Qod7yeKotWAzLOsY1tC+bAdYh5B8SJyIqs9GFwlsiYBhNlzGI
         2aFxWtQLcwRrsKPmI+SSxkj/y1bpXHzDiFJm3psgW535+20X8lDO4T1Ehd8kkBZrElKg
         BzCCvbDsjhxvV/SMz2v0qZZjFdkwuEhKCDXKA83lxURGpyOu7WEhA0PvKgSvTMFxQrC9
         oeRN+7Zv18kRPDOhW/6SjWrGxAlSVoqvBVyEfVbP96GTk757ThWUq83gmyAMH8wEAaVa
         wu1qrEW0JpMlyILjS4y/l85x/j+u2i+sal8uTa18/VDCbCKjfqFOH6XbLYcSa2E7x26o
         Ai6A==
X-Forwarded-Encrypted: i=1; AJvYcCWg0ZRPvqVL49dnAcIdOwQxclx+aHrqzxeSM+PJJcGnwyJaKOaDAUtwYyWwvVB2rH8/NKK8Ni6V4vux7GkMhxNqHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8MVfY4sCq4Li1bAmguvsmx9TwTpdt3wVAGaPe1gS0Y+xuD5Ou
	GtxFfZ8qZAPSGYTFz3B5i3KXdkNYdhdK/3UzlGCI6MxFWyVvRYyb3wSP
X-Gm-Gg: ATEYQzz3Owvh5MokuR9gGUb63VoFZhVdMIkJs/AasNiCe1LFONYr5R0UdCxOj0tnks1
	QX7CTzNOggoHWy2fkxJkV5BpTuI33JN+BTUI8WF9laraWY/fQWUVgDxobgnSqYzsBNtWyPmwWIj
	HYMfanBpC8f+W/vZv4JrX6CbCgkoGOAy9lnbCT+FpsfneSvgLjkRz9cIWIvwcYuoSrbvAfC6KuI
	Hqp56BqcH+4GYxD5j+L63daydBZyLv1T/8tAQBHoCkY9ah+r/R21ct6vmvqE593oylMzUfV4Kcd
	+MEO5UCUFyyCdeNARr6m1cUi1LRS+bNGcB1B2kGBDgY4n31bA+XSgdkb64zv0gYVtWJKlUXK9zJ
	qI+z6hhLpEYVs8Rh+mts9T6tzjCqee/pFaHjzYo32Qc3y2Q1FizXgPwe9+21N7zde2uBxC65XDB
	3ICc7ANKTaUJashC7IULSEU71RwTDEcW0II3/bsG3ZXxUMlWpU
X-Received: by 2002:a05:6000:2284:b0:43b:3bf9:e008 with SMTP id ffacd0b85a97d-43b889ac064mr7175830f8f.11.1774466702421;
        Wed, 25 Mar 2026 12:25:02 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.25.01
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
Subject: [PATCH v7 09/16] irqchip/renesas-rzg2l: Split rzfive_tint_irq_endisable() into separate IRQ and TINT helpers
Date: Wed, 25 Mar 2026 19:24:24 +0000
Message-ID: <20260325192451.172562-10-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30281-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B9DD132B30E
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
v6->v7:
 * No change.
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
index 6e55b325cca9..79837c754b60 100644
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


