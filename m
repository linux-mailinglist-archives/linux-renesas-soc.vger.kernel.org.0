Return-Path: <linux-renesas-soc+bounces-30074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIEfCu7fv2ml9wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:26:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EA22E92DA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5474F301A9F5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 12:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA8F3016F1;
	Sun, 22 Mar 2026 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GaTkhsbu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F36382F1F
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 12:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182289; cv=none; b=OsI1kJrwhnrbIYJabrgBOxHo6MKQ0iwlvd4Wrbqkh/jC71L1VZGAWukKD2zkO062kzrr0wj6f3bEapWOxNK/+5jEeoeBTXTKtOsXoAN2r1PHU9KcDWeyXGACYGnQKSlGtqiqrobnxJV8C139pTmQNujBy1/s4diXiW8Wgbz1vdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182289; c=relaxed/simple;
	bh=c9l2i7HPT8iNPuwqrZJz+dMN2SoQtpIGWFRWvS6zBI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VUTnEeM4zgWPw+hBxF4S/EZewW5qTPqJ+AJfvvOyJlns/obF5xpZISDXw3KUNhN8bKrLot7Mxccddzb8Lkb17EcFeVH1eTl6EoPqwS3WHlwQuSSLa+gKw4tEpwQViHexyGaa1FlzE7tQuWrVHRVmgZSQYc0qboN/NXFYAsJgk2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GaTkhsbu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b6d9c981so2256459f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 05:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774182277; x=1774787077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZOo4IkXrKT3vNwdWHp9bFAGOnopScx0rwaRBrsQYIM=;
        b=GaTkhsbuiOfPXLtfwVLF1/SVHrAnjezP+1Vs9eEJrJep2hf3tzR2WLKCMnlaLW/lUw
         ybQzrp3ehA/p52egkcU7XJPknAY4ju/d4mnTMjewviBgRLfky/yiQTvLR/D4m5F5FJ1R
         YzIHm/u90n2yG8uIEDuAtQPlYZCfhefjbDFJW/0y/SgDdiM9I2/pZWqTUWwoehfzKJ5V
         4pOCNkTH3NwB14IwL6d9MnMo2TopEg4UuhsilsZF+Of/BlI/izRPN6Ts/RkctMgWvEZg
         FPM3IVrQVSFJlHHK87IUD8gIFu0OFczw1oRUcnYnIbb4Bvz86wf+Tc8wSR7tID+rdNqX
         BIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774182277; x=1774787077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vZOo4IkXrKT3vNwdWHp9bFAGOnopScx0rwaRBrsQYIM=;
        b=jlxNOktG/KiHzkfWHIM5sSf3isFvSJhxbhfnfHdKbWRk/hA2rMsuvD1xFsK0sAML7b
         zKTdexg5PM7dMsI9WOrQHe5JV5UJmpa6+fNljpMIN/OtiDRNXRrCUobQ5gxMcal+/BSU
         L9J6GZaJESgE8wEscfWa5Spn+b9WUyrjDWd7+GgwvDjW8x2BhQ6gEM3WbOHnEzszkZIs
         6+PKNHWR6plKasgEKxOEfBwIg6aWsMcB4xhflNbN6ZFmt+f9hMFLHVgk5j1Wod0wn4GE
         Z9Wh/sygVd9FOHgE6Xxi5czKd53JAxx4YcsKBsbC5BjD8UH3ObAW4zV9EgzlMURtMYoz
         I2BA==
X-Forwarded-Encrypted: i=1; AJvYcCVyhhGy9Pw+w6rJ7u7uJofsBCiPkGGzWkEmzcEsYYYetpnah+9HkfW2q47LpT7BfVsYbndHmMKhdBN4Ld4CKtmq/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnvsoBDIe0DRaAz1bXWAcQVXBQTXy9MeUWVWI+4NNqNWm/7GKI
	xfhboON0YzZze4OuVTqZksNTo7VybU2ub4VMEwP4sNLQZ+A6zAS+wGU4
X-Gm-Gg: ATEYQzwaoliRcFH4kTTG9DYmEjNBoTon5y05J1TBzMvkH5xEvidYjSqcV/3rpZDkCx5
	8M9OKTEKBp7dYmILASX0Y54zTDBaSt30+dsT7VWBOobLlQWLVCC+YpA/RRKY5d5WeLldR/NKm6W
	4gjobaOWb5jTsvAL1AGiZ3kLJUf+ASXxgOf1GcKvaYarCZYYoHmScwte+DyZoE5v6VROcmWfNAx
	zvBwf++xhABglRZOhh41cesqPh9dPPpXXr2cvu47hNHwGOFuqKAcYt4Xld5caBc5O/iO0BwnimV
	3jnojuhwVw+lZVSdx0PRnszYE8+70LlENaLhdYYwgij0yuUdb553Rmc6wA0i7iVsoSY2js1L4P1
	hTAgJSqxxRo+77PyhD5/AQhTkO0DdHUnFzkerR6jeqLtMQPjBIVd8eKW4PSP0yTxpV1kKxHJcxi
	2LiiepsaGWEgVe92KEan+MEMhJQtCRKIdu8RSeDMV7lSyY4iTU
X-Received: by 2002:a05:6000:2501:b0:43b:4d2e:9ff8 with SMTP id ffacd0b85a97d-43b6423c4d6mr14984981f8f.6.1774182276669;
        Sun, 22 Mar 2026 05:24:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1bdc:7f84:18bc:1e56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm21072695f8f.19.2026.03.22.05.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:24:35 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 14/15] irqchip/renesas-rzg2l: Add RZ/G3L support
Date: Sun, 22 Mar 2026 12:23:57 +0000
Message-ID: <20260322122421.132474-15-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30074-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B7EA22E92DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The IRQC block on the RZ/G3L SoC is almost identical to the one found on
the RZ/G2L SoC, with the following differences:

 - The number of GPIO interrupts for TINT selection is 113 instead of 123.
 - The pin index and TINT selection index are not in the 1:1 map.
 - The number of external interrupts are 16 instead of 8, out of these
   8 external interrupts are shared with TINT.

Add support for the RZ/G3L driver by filling the rzg2l_hw_info table and
adding LUT for mapping between pin index and TINT selection index.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change.
v4->v5:
 * Updated rzg3l_irqc_probe() for supporting separate interrupt chips.
v3->v4:
 * Updated commit description IRQs->interrupts.
 * Updated rzg2l_disable_tint_and_set_tint_source() for making
   tint assignment very clear in the code.
 * Formatted rzg3l_tssel_lut as table format.
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 44 +++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 8aff8b9d49c9..1ff1c0efed66 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -67,11 +67,13 @@ struct rzg2l_irqc_reg_cache {
 
 /**
  * struct rzg2l_hw_info - Interrupt Control Unit controller hardware info structure.
+ * @tssel_lut:		TINT lookup table
  * @irq_count:		Number of IRQC interrupts
  * @tint_start:		Start of TINT interrupts
  * @num_irq:		Total Number of interrupts
  */
 struct rzg2l_hw_info {
+	const u8	*tssel_lut;
 	unsigned int	irq_count;
 	unsigned int	tint_start;
 	unsigned int	num_irq;
@@ -377,6 +379,11 @@ static u32 rzg2l_disable_tint_and_set_tint_source(struct irq_data *d, struct rzg
 	u32 tint = (u32)(uintptr_t)irq_data_get_irq_chip_data(d);
 	u32 tien = reg & (TIEN << TSSEL_SHIFT(tssr_offset));
 
+	if (priv->info.tssel_lut)
+		tint = priv->info.tssel_lut[tint];
+	else
+		tint = (u32)(uintptr_t)irq_data_get_irq_chip_data(d);
+
 	/* Clear the relevant byte in reg */
 	reg &= ~(TSSEL_MASK << TSSEL_SHIFT(tssr_offset));
 	/* Set TINT and leave TIEN clear */
@@ -683,6 +690,36 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 	return 0;
 }
 
+/* Mapping based on port index on Table 4.2-1 and GPIOINT on Table 4.6-7 */
+static const u8 rzg3l_tssel_lut[] = {
+	 83,  84,					/* P20-P21 */
+	  7,   8,   9,  10,  11,  12,  13,		/* P30-P36 */
+	 85,  86,  87,  88,  89,  90,  91,		/* P50-P56 */
+	 92,  93,  94,  95,  96,  97,  98,		/* P60-P66 */
+	 99, 100, 101, 102, 103, 104, 105, 106,		/* P70-P77 */
+	107, 108, 109, 110, 111, 112,			/* P80-P85 */
+	 45,  46,  47,  48,  49,  50,  51,  52,		/* PA0-PA7 */
+	 53,  54,  55,  56,  57,  58,  59,  60,		/* PB0-PB7 */
+	 61,  62,  63,					/* PC0-PC2 */
+	 64,  65,  66,  67,  68,  69,  70,  71,		/* PD0-PD7 */
+	 72,  73,  74,  75,  76,  77,  78,  79,		/* PE0-PE7 */
+	 80,  81,  82,					/* PF0-PF2 */
+	 27,  28,  29,  30,  31,  32,  33,  34,		/* PG0-PG7 */
+	 35,  36,  37,  38,  39,  40,			/* PH0-PH5 */
+	  2,   3,   4,   5,   6,			/* PJ0-PJ4 */
+	 41,  42,  43,  44,				/* PK0-PK3 */
+	 14,  15,  16,  17,  26,			/* PL0-PL4 */
+	 18,  19,  20,  21,  22,  23,  24,  25,		/* PM0-PM7 */
+	  0,   1					/* PS0-PS1 */
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
@@ -695,6 +732,12 @@ static int rzg2l_irqc_probe(struct platform_device *pdev, struct device_node *pa
 				       rzg2l_hw_params);
 }
 
+static int rzg3l_irqc_probe(struct platform_device *pdev, struct device_node *parent)
+{
+	return rzg2l_irqc_common_probe(pdev, parent, &rzg2l_irqc_irq_chip, &rzg2l_irqc_tint_chip,
+				       rzg3l_hw_params);
+}
+
 static int rzfive_irqc_probe(struct platform_device *pdev, struct device_node *parent)
 {
 	return rzg2l_irqc_common_probe(pdev, parent, &rzfive_irqc_irq_chip, &rzfive_irqc_tint_chip,
@@ -703,6 +746,7 @@ static int rzfive_irqc_probe(struct platform_device *pdev, struct device_node *p
 
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzg2l_irqc)
 IRQCHIP_MATCH("renesas,rzg2l-irqc", rzg2l_irqc_probe)
+IRQCHIP_MATCH("renesas,r9a08g046-irqc", rzg3l_irqc_probe)
 IRQCHIP_MATCH("renesas,r9a07g043f-irqc", rzfive_irqc_probe)
 IRQCHIP_PLATFORM_DRIVER_END(rzg2l_irqc)
 MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
-- 
2.43.0


