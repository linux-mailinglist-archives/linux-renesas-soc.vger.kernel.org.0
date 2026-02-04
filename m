Return-Path: <linux-renesas-soc+bounces-27889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OMZD0pXg2mJlQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 15:27:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9371E7146
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 15:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62406306221A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 14:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A095413258;
	Wed,  4 Feb 2026 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXkYXGNt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEE0413255
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215008; cv=none; b=rcs4iojuTJGUp2jvRDs/9Oa+kF6q1iRXc0zhwRr4fgcu9WWUh8BxfZrlQTARgMvAKj+/CKBiUdVPnsqBBwkXn0L5PEU9IFrHtWC3L7FXxdj07WzwEVuwzunmaB8s8q3CSPRoN9LhwvVeJXafwfnLHU4rIQ/GNGT3UAYLnTQroy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215008; c=relaxed/simple;
	bh=KPVJTRz0ucSseFkmTa0BS3za7U+/6HbVZcxV1WMT/20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=azMpKHuRKywXsqHC1W1lsahXUPE18vZbwwPsvBcEXB/x3MUCl0LMnLRZZWm81wvKhBWYHHqwGYWuj0jBX0jCbncNgYK2k6HCcjHsYIHBjnRfbPDo1FyjNLCUU0K/WeaBg+HQ9aeLX/P2QXWGzHCNU9v24i0ojnL+0y8VkySdGwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXkYXGNt; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-658034ce0e3so10884781a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 06:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770215007; x=1770819807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PClPLuzQLIiCREY9O1ZTBwMqo8hf+l9T87+sxH7Xy8=;
        b=lXkYXGNt+uFLb/XNY+Ywz0dckOTZKQeK45bG1sa0GGwmz8tl8cGfxsSBUziFvciasY
         73EDr0orVCXrt3xRy2hig9yJabAE4d4tqKHHXq4JkttGMRSe5XRJu0M79e02lRgz4+tn
         jQLgnUugZme0gKj8vaKNCu2hmoboCMMgXtDtVpZj6EEsPv6qxdKH8Nr7Xp6l0jnh3GOX
         aHSIC/cNp9I/iIWgHNVA1M1Oy/7PS53TTPaKgks5VZ4HMZ7Rg34nurrVb7YEHj6piUMy
         rIk0H/krdSi6k8Kn2geMRcgFLOipXTzkyoO6HAqxzN/CCyP/vbM+rPxtUec5319t4mod
         tOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770215007; x=1770819807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7PClPLuzQLIiCREY9O1ZTBwMqo8hf+l9T87+sxH7Xy8=;
        b=cY7PW2nIhe3Lpje04FS6nUiPwzxVwFo54ffA8Os3e/+BkcWTZ/fhuuYbQol3MkJHdx
         8oWs77e5yM9bcDWzHLIL3cV1qJAUPHiwm2D+bakQ2YIezzJA83hyGGgJF6paREixaTtP
         VU897FY2j/MjD7AIaDciXfCOwbvUwJ898gaveJ80ZL2IiLwiQR/mslUBt3PMT7vS+Cv2
         SG9Scar67o9yyQdSTBph2DqS6zfXxACQRRIenmL2MiDyArSraTtu+n3R3nzgIUUM4tkL
         IKWyuIOH5t3LvbkXRnhCpZP7erl7L4Q7PtyAJpNpl5U5zes381iFLCl+TBa6sShkBvn8
         sV/g==
X-Forwarded-Encrypted: i=1; AJvYcCXc/kF/yaugy5a2Gt4P8DOkeqbXiZ9fvU8aF96VmSNq0XYfmPran59Yr5/OHUqqBfknvzwkovNQhz1hX5J/mKi3yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3FL1byIG3qsKhgkoTDcCpx/WDK5w3lCeuPdG6aFralYESYeKN
	d3KatLAE3ahNiN66rlHLlZm1zF/jQQQ3zO2FIclyuXE5L4fSPrjEI1F0
X-Gm-Gg: AZuq6aIRzHPeuC1lstEFUlUDnpxEz3HSEjK99uZclg2lH/iSoeQOSr0p9024B0GHI3y
	x8/sLP5eI3vUHHjgSjr3AS9Al9Ynw2Nge0sv2xsYuvYQSjiyBpox5PSA/6+fuUH7pvy/nsov+rK
	N1zeKGi2GbL/tN3Q0WVVTrrnPHkajL7/BAU/HAzUJGE0dDEK1F+y3sRoUa1dVnUT2ut/EHsuIY9
	jvm4tB7DGaKz0q8qZKgJD5wGPQ2xhSO3WSJLkJdT5P0sj8nRyPuc52DSGMQ+6XSeX3TG6Pf8PN9
	rQIN3BLQKQjPG23EbwfFoemDOZrriMBjNF5kYOnG1OezikcT43Hxg+ajFYj6AOLGLpIF9qP/7Fx
	Iru6mRgJzwXn8bxsiQhfjM+jDGFMRyfOyB7p/Pj81wLLTgkLs8YAUEzO8laLC8TQCpLJr4AZ8Gt
	L2xHKHIWg/09NNl7fKxJBraHf/mT9lA/9MSFY=
X-Received: by 2002:a17:907:d0c:b0:b8e:2a8a:4320 with SMTP id a640c23a62f3a-b8e9f2d8f05mr185302766b.49.1770215006647;
        Wed, 04 Feb 2026 06:23:26 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3c9f:a100:4d45:ebc7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea001ea7dsm129038366b.47.2026.02.04.06.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 06:23:26 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 6/8] irqchip/renesas-rzg2l: Add RZ/G3L support
Date: Wed,  4 Feb 2026 14:23:14 +0000
Message-ID: <20260204142320.103184-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204142320.103184-1-biju.das.jz@bp.renesas.com>
References: <20260204142320.103184-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27889-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D9371E7146
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The IRQC block on the RZ/G3L SoC is almost identical to the one found on
the RZ/G2L SoC, with the following differences:

 - The number of GPIO interrupts for TINT selection is 113 instead of 123.
 - The pin index and TINT selection index are not in the 1:1 map.
 - The number of External IRQ is 16 instead of 8, out of this 8 IRQs are
   shared with TINT.

Add support for the RZ/G3L driver by filling the rzg2l_hw_info table and
adding LUT for mapping between pin index and TINT selection index.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 47 +++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 0de7db45d4c8..06c439c98ff5 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -67,14 +67,16 @@ struct rzg2l_irqc_reg_cache {
 
 /**
  * struct rzg2l_hw_info - Interrupt Control Unit controller hardware info structure.
+ * @tssel_lut:		TINT lookup table
  * @irq_count:		Number of IRQC interrupts
  * @tint_start:		Start of TINT interrupts
  * @num_irq:		Total Number of interrupts
  */
 struct rzg2l_hw_info {
-	u8	irq_count;
-	u8	tint_start;
-	u8	num_irq;
+	const u8	*tssel_lut;
+	u8		irq_count;
+	u8		tint_start;
+	u8		num_irq;
 };
 
 /**
@@ -343,6 +345,9 @@ static u32 rzg2l_disable_tint_and_set_tint_source(struct irq_data *d, struct rzg
 	u32 tint = (u32)(uintptr_t)irq_data_get_irq_chip_data(d);
 	u32 tien = reg & (TIEN << TSSEL_SHIFT(tssr_offset));
 
+	if (priv->info->tssel_lut)
+		tint = priv->info->tssel_lut[tint];
+
 	/* Clear the relevant byte in reg */
 	reg &= ~(TSSEL_MASK << TSSEL_SHIFT(tssr_offset));
 	/* Set TINT and leave TIEN clear */
@@ -607,6 +612,36 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 	return 0;
 }
 
+/* Mapping based on port index on Table 4.2-1 and GPIOINT on Table 4.6-7 */
+static const u8 rzg3l_tssel_lut[] = {
+	83, 84,					/* P20-P21 */
+	7, 8, 9, 10, 11, 12, 13,		/* P30-P36 */
+	85, 86, 87, 88, 89, 90, 91,		/* P50-P56 */
+	92, 93, 94, 95, 96, 97, 98,		/* P60-P66 */
+	99, 100, 101, 102, 103, 104, 105, 106,	/* P70-P77 */
+	107, 108, 109, 110, 111, 112,		/* P80-P85 */
+	45, 46, 47, 48, 49, 50, 51, 52,		/* PA0-PA7 */
+	53, 54, 55, 56, 57, 58, 59, 60,		/* PB0-PB7 */
+	61, 62,	63,				/* PC0-PC2 */
+	64, 65, 66, 67, 68, 69, 70, 71,		/* PD0-PD7 */
+	72, 73, 74, 75, 76, 77, 78, 79,		/* PE0-PE7 */
+	80, 81, 82,				/* PF0-PF2 */
+	27, 28, 29, 30, 31, 32, 33, 34,		/* PG0-PG7 */
+	35, 36, 37, 38, 39, 40,			/* PH0-PH5 */
+	2, 3, 4, 5, 6,				/* PJ0-PJ4 */
+	41, 42, 43, 44,				/* PK0-PK3 */
+	14, 15, 16, 17, 26,			/* PL0-PL4 */
+	18, 19, 20, 21, 22, 23, 24, 25,		/* PM0-PM7 */
+	0, 1					/* PS0-PS1 */
+};
+
+static const struct rzg2l_hw_info rzg3l_hw_params = {
+	.tssel_lut	= rzg3l_tssel_lut,
+	.irq_count	= 16,
+	.tint_start	= IRQC_IRQ_START + 16,
+	.num_irq	= IRQC_IRQ_START + 16 + IRQC_TINT_COUNT,
+};
+
 static const struct rzg2l_hw_info rzg2l_hw_params = {
 	.irq_count	= 8,
 	.tint_start	= IRQC_IRQ_START + 8,
@@ -618,6 +653,11 @@ static int rzg2l_irqc_probe(struct platform_device *pdev, struct device_node *pa
 	return rzg2l_irqc_common_probe(pdev, parent, &rzg2l_irqc_chip, &rzg2l_hw_params);
 }
 
+static int rzg3l_irqc_probe(struct platform_device *pdev, struct device_node *parent)
+{
+	return rzg2l_irqc_common_probe(pdev, parent, &rzg2l_irqc_chip, &rzg3l_hw_params);
+}
+
 static int rzfive_irqc_probe(struct platform_device *pdev, struct device_node *parent)
 {
 	return rzg2l_irqc_common_probe(pdev, parent, &rzfive_irqc_chip, &rzg2l_hw_params);
@@ -625,6 +665,7 @@ static int rzfive_irqc_probe(struct platform_device *pdev, struct device_node *p
 
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzg2l_irqc)
 IRQCHIP_MATCH("renesas,rzg2l-irqc", rzg2l_irqc_probe)
+IRQCHIP_MATCH("renesas,r9a08g046-irqc", rzg3l_irqc_probe)
 IRQCHIP_MATCH("renesas,r9a07g043f-irqc", rzfive_irqc_probe)
 IRQCHIP_PLATFORM_DRIVER_END(rzg2l_irqc)
 MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
-- 
2.43.0


