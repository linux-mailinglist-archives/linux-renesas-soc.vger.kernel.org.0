Return-Path: <linux-renesas-soc+bounces-27988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF7RMtTOhWlBGwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:21:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB97FD28A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0AD630BE018
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 11:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9E93A1D0F;
	Fri,  6 Feb 2026 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3ggPMsJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D013439A7E5
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770376626; cv=none; b=m2slL/wBSfgyGd5XkgNOoX3RFl23BowkQNC454xzBCKLrMH6k/Q+yLA/K+9XAjxAgkpcea1YbpCu1hpZl/faKam5KW2dn1Optren+AdlHS3JVXR5JdyvIx1GZRhgEY9SXDnDuo99F6VMhKFj+CL0m68+E+QLdzn56SdFN0rxdF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770376626; c=relaxed/simple;
	bh=3C74JNFXi3uKwy8kFvk6HfAp8K0Gq6R+KU/xJsdc5fA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JDjfR2Lxr+YUVKtmvBvDjGIfIk7JIr68yzHLNrUXXo5eX5omAQ2Faa8g9uzZarDvy2PLRYMdP06+kKoTl2prrQ3LYdNHNcDgwtpuGSARhfeGR3nvP79lUjTWIBJijVr0WStqq+KtZmFbZuelWbcKy2nksY/flA90Wii6jZTVx7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3ggPMsJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4358fb60802so1341781f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 03:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770376624; x=1770981424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TFRvg3GiC3fTa3U71n08qAP9/3weHGAPlVvCNhEDkk=;
        b=L3ggPMsJhpa1PddOs2AJ7IS/tIuLPR/BzxJ8Z3MJV6goyQ0KScIXqmVcIx/z5Cg1jX
         rlSNUM6Xw5jPJ7Pw/390sn3QvY3BSKjiFHeIGRHzyZUp4WNwwfH1WCfQMUKYGEpCwydj
         LqrNS6EJezg0PY6+ybFgg7me1JT0SqvZ6cXsibGFhelZJLl8gAhUp7EmsAPS0Pr8zLQi
         tfjLjARhhca5rwqlcbsmdDknHDYMs4OEC/Q6PF25W/w4Xr0gC7FwLNNjdKZSmocfY2Oy
         nmnvrtgbut7i3Oz3ajw0I3A4fUL1JwO6BadGW1GO+WHlJssIZcTcj+lKMSKI5ym9FQ1p
         V1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770376624; x=1770981424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1TFRvg3GiC3fTa3U71n08qAP9/3weHGAPlVvCNhEDkk=;
        b=R2PnYmUrqH7FWuSRyXjarhTT2F8cP1RFcUr/nKLzNSzDIhtFQzf6LffJDd6MRF0NkC
         vqYPxCWBTklSXrzmu0i5q+ick0uEPfoFkz1ktoOOlaPTOf8/4jxcPsWSVMBeCt7OLynU
         kRaRZca4ZpIkB5Gxsa48Y759TtLlX9vtz9VviRF/AbV2hQ0QyS++1eSv5VX0hnSK99XX
         R8nkFyInAB2DsNLl2e8aKFKC3poTy7E02Fz+qQbgp+dGcBHuv0/E3XTzYEN2p/nPpKDC
         NPd2bQV4OOE3oGk9nL7npzBkboQrhqWos342iQWRWbrEb7GGol9R/ns/Ntl7cFlAxHAi
         FYnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUasrizqsoBQZUyJBBbqlJ+crCpRdA1B/Patz72AP9lp5/L5WEcIqxbrhMzHG5+RiYcXMRNvu6MtWh+INlw1nTcvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjA427zxXKk6OKETVd+GibSkI8Dqdy5IlmZJUqKFWcvDyx+uVD
	v/tyoJsSc243d5pPRaKYivTf8TcaZuzPrpJvWn6oHnzoZ4WKaMiTvth2
X-Gm-Gg: AZuq6aJ4HnciuT7XdarCFS7+cqmFp7XcxzEN3gmadpJnH5p073MJEwGGzsSplFTb6ju
	o53lGNsz/9mtDnZ7OjtpR6cdY+l5GAqwQPHUIne/Tkdovp6SPW6apNJsa76n//FRLKLv4k5WkWI
	hznMPLFQQrUDebF1yPVeSFRfae9R9AQ52BRcMn3DNYlblTXZ04Z4jPUsdahfjYuHq09P8hIX61F
	4LMsJMd7Cv8Iap2r1ZUm/ji4+2iAia9JIGQLV5MmmcHAAwrsllDufw3/48i/EZvkMNfIJukZllx
	QZo6T8Oa+RP4QHcm4pKMGblrpdgBa5WoEzZ+kZXcF8TA8MejTSIzTBF99je//1I/63MZSZgw0xt
	dSH7JBaSSKJY2t8VuX9rlnrkav3eNBK1wnE0bkrsTgXHyGH8yMNKjdMdtm2sNVkisH0w84kO8C4
	vOT/6uNjDwkynICbeU0A==
X-Received: by 2002:a05:6000:2306:b0:435:b674:c9b1 with SMTP id ffacd0b85a97d-4362903c4c0mr4529994f8f.11.1770376624214;
        Fri, 06 Feb 2026 03:17:04 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fa4csm4746380f8f.26.2026.02.06.03.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:17:03 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 6/9] irqchip/renesas-rzg2l: Drop IRQC_IRQ_COUNT macro
Date: Fri,  6 Feb 2026 11:16:49 +0000
Message-ID: <20260206111658.231934-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
References: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-27988-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2DB97FD28A
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of External IRQs in RZ/G2L and RZ/G3L SoC are different.
The RZ/G3L has 16 external IRQs where as RZ/G2L has only 8 external IRQ.
Add irq_count variable in struct rzg2l_hw_info to handle this differences
and drop the macro IRQC_IRQ_COUNT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index e5393306f610..0de7db45d4c8 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -21,7 +21,6 @@
 #include <linux/syscore_ops.h>
 
 #define IRQC_IRQ_START			1
-#define IRQC_IRQ_COUNT			8
 #define IRQC_TINT_COUNT			32
 
 #define ISCR				0x10
@@ -68,10 +67,12 @@ struct rzg2l_irqc_reg_cache {
 
 /**
  * struct rzg2l_hw_info - Interrupt Control Unit controller hardware info structure.
+ * @irq_count:		Number of IRQC interrupts
  * @tint_start:		Start of TINT interrupts
  * @num_irq:		Total Number of interrupts
  */
 struct rzg2l_hw_info {
+	u8	irq_count;
 	u8	tint_start;
 	u8	num_irq;
 };
@@ -144,7 +145,7 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
 	unsigned int hw_irq = irqd_to_hwirq(d);
 
 	raw_spin_lock(&priv->lock);
-	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
+	if (hw_irq >= IRQC_IRQ_START && hw_irq <= priv->info->irq_count)
 		rzg2l_clear_irq_int(priv, hw_irq);
 	else if (hw_irq >= priv->info->tint_start && hw_irq < priv->info->num_irq)
 		rzg2l_clear_tint_int(priv, hw_irq);
@@ -190,7 +191,7 @@ static void rzfive_irqc_mask(struct irq_data *d)
 	unsigned int hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock(&priv->lock);
-	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
+	if (hwirq >= IRQC_IRQ_START && hwirq <= priv->info->irq_count)
 		rzfive_irqc_mask_irq_interrupt(priv, hwirq);
 	else if (hwirq >= priv->info->tint_start && hwirq < priv->info->num_irq)
 		rzfive_irqc_mask_tint_interrupt(priv, hwirq);
@@ -204,7 +205,7 @@ static void rzfive_irqc_unmask(struct irq_data *d)
 	unsigned int hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock(&priv->lock);
-	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
+	if (hwirq >= IRQC_IRQ_START && hwirq <= priv->info->irq_count)
 		rzfive_irqc_unmask_irq_interrupt(priv, hwirq);
 	else if (hwirq >= priv->info->tint_start && hwirq < priv->info->num_irq)
 		rzfive_irqc_unmask_tint_interrupt(priv, hwirq);
@@ -400,7 +401,7 @@ static int rzg2l_irqc_set_type(struct irq_data *d, unsigned int type)
 	unsigned int hw_irq = irqd_to_hwirq(d);
 	int ret = -EINVAL;
 
-	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
+	if (hw_irq >= IRQC_IRQ_START && hw_irq <= priv->info->irq_count)
 		ret = rzg2l_irq_set_type(d, type);
 	else if (hw_irq >= priv->info->tint_start && hw_irq < priv->info->num_irq)
 		ret = rzg2l_tint_set_edge(d, type);
@@ -500,7 +501,7 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 	 * from 16-31 bits. TINT from the pinctrl driver needs to be programmed
 	 * in IRQC registers to enable a given gpio pin as interrupt.
 	 */
-	if (hwirq > IRQC_IRQ_COUNT) {
+	if (hwirq > priv->info->irq_count) {
 		tint = TINT_EXTRACT_GPIOINT(hwirq);
 		hwirq = TINT_EXTRACT_HWIRQ(hwirq);
 
@@ -607,8 +608,9 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 }
 
 static const struct rzg2l_hw_info rzg2l_hw_params = {
-	.tint_start	= IRQC_IRQ_START + IRQC_IRQ_COUNT,
-	.num_irq	= IRQC_IRQ_START + IRQC_IRQ_COUNT + IRQC_TINT_COUNT,
+	.irq_count	= 8,
+	.tint_start	= IRQC_IRQ_START + 8,
+	.num_irq	= IRQC_IRQ_START + 8 + IRQC_TINT_COUNT,
 };
 
 static int rzg2l_irqc_probe(struct platform_device *pdev, struct device_node *parent)
-- 
2.43.0


