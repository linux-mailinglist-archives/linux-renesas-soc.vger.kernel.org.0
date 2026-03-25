Return-Path: <linux-renesas-soc+bounces-30278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHr+JwA3xGnkxQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:26:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C3F32B371
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0AC9530346C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6D93DB621;
	Wed, 25 Mar 2026 19:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6jrYalU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5778534D389
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 19:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466702; cv=none; b=HwvGt7AmExk/Fd6dDfwoxVHfe886VKka3uQGSi/ss6yv8k8nTnQwzNkD0lZr4K+F4vGobqxXAd9Cl1aY4j048z2avEbmubxeyDnLmL9ya431DISuhHXhtuNvaMCd7PMFbcvuAD2jO+LFyA1Wp5BAplRHAfzIPMl6u6CAv8Yu25Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466702; c=relaxed/simple;
	bh=WWEBL6mZ3m7JN4kOVfj0tHlpknfHOMwOJ8YUnx8162E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tLPtrR7nPmcjmhdLTnNhcO72Rfhz1cvpuva1iDBPuVmHgqeJlJe+d7uJTMk2udKJoTCGbWabi5X2OsinBBi7oiyuMavU0ctDuLBz8jkXQHLPGl9joBR5Ov6y6dJFcCSGIrDSu+us7IsYYicti1eHzh6bNOW60H9D8MeRJlA0Ta8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6jrYalU; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b7ff8fe92so100462f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466700; x=1775071500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avqikRLvu+zwyivm8IXXAOmnWKo7ozwTSIDm4wJ9YOs=;
        b=S6jrYalUK1+DOX/JrOiWkxBWouW6k582B57PBkAhPMaPCoIP/XBAN277VgsErEorvc
         V7kOuiDzs9yz/i+tck3tIJjwPC3YB3Knphl2MLgXDSB8PIWKnlcihymMEADHObPp0V8K
         qmpOrDIWQyjFctZ7csX+gLqFe6rI7XTktoocYqPAcWLGlOF0Mgb5mu+YhwMsJPqEoYhS
         XTTXVITfawIKvGDIA8xWGCRc5FOAyK2nAan7mHd7SJM4xbvO+ebCE64I7uz6PXP6Qsw5
         vZhodC1QBMmLf1/JikuokeJJ1XmINwZEn0dmpbm/b1ckQ8dH6wyEyjF4t+bQGLCJWcp/
         l67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466700; x=1775071500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=avqikRLvu+zwyivm8IXXAOmnWKo7ozwTSIDm4wJ9YOs=;
        b=c69At9V0Gukti9nF3O65Z1lP8Soide8AXgk3GpYbCjlKtkEPiY16JxCE9HqWNA1cT6
         ZqoVsimYwF96NZgv41x4G6nIEL6XLCj78jNFrLGrhK3smdwiPt2QW20Maxk6/i95STpX
         qbxioK4XkjAe/OXcaFB7o5Wd5WhYTZ0vB6rmx/QvWgTzENnKpuy6Wa9V+zKKP7pTA/op
         zvzmoLedorwO7Opy7aIIZyifezGZ9uqM5HdJgIEKrA47zLlKGiaWUJz+QawdspoPEN1W
         oi20X8UN+yaeIYJiyeFXFgwZtGyn9L8gRcnoRSW3IvrelXubmJQJI+JOqfOQalmJi7AX
         McKA==
X-Forwarded-Encrypted: i=1; AJvYcCWF6CS58OJOrtX6AXJZDVCG1SRRZvwh+ee4kl2xIHoGcKzrKhp7bUjiSdZNcp7wf4oXccSUAMkMEBwrYWP5xZmnag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcqQL8TS0Q0vRfEKjGtW+6pTwKHej7Re1HYwsFP9BCSVNL6eCi
	2nXhUXFFQFqzp0/B0Mk9cPaSeZJPiis6Vy/MkPhQRpYiigxotJow/AaF
X-Gm-Gg: ATEYQzz5eLl/7IZ4MrAusHT9RuxM37/YMO04xj5y6STosBK086jbKCp32vgXesgYH6D
	gwuOoyfF2P+dHuEw3vf7nF1mSqXDj7ZhskssWzpNlUsKjvjGzEPeBQSkD7bZ52Ea1GuUV/MWok9
	9EyjE66DfX4YD1r69/r7/a9b1G6TwNGGQgUPJvkWZg3tADcxEuZwUV5tA6j1afO6HUum3SBn+sz
	MMLUk+EuXvLp9Cs+XhFReHLhK6rcKsOmCDfauPAQrQtiyZpj/GFS51lTC2xYVKzNDjX7qnDrQyI
	AWshEFbFFRQ3RMj081tsxHR+KHw2nrK1iM58grkTb/TvehRlC/PbQ3fU2/u1IZWUHhk95tlAUZZ
	OusLQ2lXCk5dof47qRR9hGq0uPYwVFIoYFTtgnBdVBGr9AG48l4guCsVjbMSuchBKXSETrEz4uo
	NMdtMwklXyqphR8aua7J8QhLA/40/mODDgshGktAy2B0PsNn8XZsDmby3SAbY=
X-Received: by 2002:a05:6000:4025:b0:43b:8806:bfbc with SMTP id ffacd0b85a97d-43b88a41a2emr7727784f8f.51.1774466699619;
        Wed, 25 Mar 2026 12:24:59 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:24:59 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 06/16] irqchip/renesas-rzg2l: Split EOI handler into separate IRQ and TINT functions
Date: Wed, 25 Mar 2026 19:24:21 +0000
Message-ID: <20260325192451.172562-7-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30278-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E5C3F32B371
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The single rzg2l_irqc_eoi() handler used a conditional to determine
whether to clear an IRQ or TINT interrupt. Split this into two dedicated
handlers, rzg2l_irqc_irq_eoi() and rzg2l_irqc_tint_eoi(), each handling
only their respective interrupt type without the need for range checks.

While at it, simplify rzg2l_irqc_{irq,tint}_eoi() by replacing
raw_spin_lock locking/unlocking with scoped_guard().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change.
v5->v6:
 * Simplified rzg2l_irqc_{irq,tint}_eoi() by replacing raw_spin_lock
   locking/unlocking with scoped_guard().
 * Updated commit description.
v5:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 1d1df4953368..664599acbeb6 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -130,17 +130,25 @@ static void rzg2l_clear_tint_int(struct rzg2l_irqc_priv *priv, unsigned int hwir
 	}
 }
 
-static void rzg2l_irqc_eoi(struct irq_data *d)
+static void rzg2l_irqc_irq_eoi(struct irq_data *d)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hw_irq = irqd_to_hwirq(d);
 
-	raw_spin_lock(&priv->lock);
-	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
+	scoped_guard(raw_spinlock, &priv->lock)
 		rzg2l_clear_irq_int(priv, hw_irq);
-	else if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
+
+	irq_chip_eoi_parent(d);
+}
+
+static void rzg2l_irqc_tint_eoi(struct irq_data *d)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hw_irq = irqd_to_hwirq(d);
+
+	scoped_guard(raw_spinlock, &priv->lock)
 		rzg2l_clear_tint_int(priv, hw_irq);
-	raw_spin_unlock(&priv->lock);
+
 	irq_chip_eoi_parent(d);
 }
 
@@ -438,7 +446,7 @@ static struct syscore rzg2l_irqc_syscore = {
 
 static const struct irq_chip rzg2l_irqc_irq_chip = {
 	.name			= "rzg2l-irqc",
-	.irq_eoi		= rzg2l_irqc_eoi,
+	.irq_eoi		= rzg2l_irqc_irq_eoi,
 	.irq_mask		= irq_chip_mask_parent,
 	.irq_unmask		= irq_chip_unmask_parent,
 	.irq_disable		= rzg2l_irqc_irq_disable,
@@ -455,7 +463,7 @@ static const struct irq_chip rzg2l_irqc_irq_chip = {
 
 static const struct irq_chip rzg2l_irqc_tint_chip = {
 	.name			= "rzg2l-irqc",
-	.irq_eoi		= rzg2l_irqc_eoi,
+	.irq_eoi		= rzg2l_irqc_tint_eoi,
 	.irq_mask		= irq_chip_mask_parent,
 	.irq_unmask		= irq_chip_unmask_parent,
 	.irq_disable		= rzg2l_irqc_irq_disable,
@@ -472,7 +480,7 @@ static const struct irq_chip rzg2l_irqc_tint_chip = {
 
 static const struct irq_chip rzfive_irqc_irq_chip = {
 	.name			= "rzfive-irqc",
-	.irq_eoi		= rzg2l_irqc_eoi,
+	.irq_eoi		= rzg2l_irqc_irq_eoi,
 	.irq_mask		= rzfive_irqc_mask,
 	.irq_unmask		= rzfive_irqc_unmask,
 	.irq_disable		= rzfive_irqc_irq_disable,
@@ -489,7 +497,7 @@ static const struct irq_chip rzfive_irqc_irq_chip = {
 
 static const struct irq_chip rzfive_irqc_tint_chip = {
 	.name			= "rzfive-irqc",
-	.irq_eoi		= rzg2l_irqc_eoi,
+	.irq_eoi		= rzg2l_irqc_tint_eoi,
 	.irq_mask		= rzfive_irqc_mask,
 	.irq_unmask		= rzfive_irqc_unmask,
 	.irq_disable		= rzfive_irqc_irq_disable,
-- 
2.43.0


