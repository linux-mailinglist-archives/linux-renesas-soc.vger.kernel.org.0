Return-Path: <linux-renesas-soc+bounces-28536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GNuENWloWmivQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:10:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AFE1B8708
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F7C330B40B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 14:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1ECE43C076;
	Fri, 27 Feb 2026 14:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdtXhE3D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CBF43901F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 14:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201010; cv=none; b=T4G//rfMNSk/dom1WqG4WyFUf/5dNlGauvaAsgnkkah0qeeW6W2oPCbvD2U2l7gDJ8H97UrOcQ++6ILgSJOcHmeyUxT0g/sZh80PpT+VbP/0uOL8/lCBUpkIAhzLFSDUUYbFcdqJ5YgVaw/YlF2Wn1wlI4mhBkpqENxY2n6x3BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201010; c=relaxed/simple;
	bh=MKUQLvFr1iT5myl4XHCt9t+le8qYMnyu662x3Ql5bY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VpA1XIah7UmIDsfuMNYNLow8DSplJ0k5w4LgSzAx3laeJYE3DzftmuSC+KmJ6HhjJrAHYwlJoORilr+2czqQU2vdlzR41eW+7r+WkuTrXGQNL9t6aucbzCXdgWlC4dTG323BdyFOUOz1EYWU9j9j8NRsMjg8hojmeFMxsmYEdE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdtXhE3D; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4377174e1ebso1475467f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772201007; x=1772805807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=warcM3LovriiR1qe/xbK+forV1iKLkvB/qLDY0EdHzA=;
        b=VdtXhE3DwcNQCXF5SD8HttPjy3EWtABZVzPv53/aRJcZ/oOFltGXjgpE7Rvcr9c8O8
         4DLYdBlU7zlRyDQw3MrwpX3fxFSKJLilWKNLZ3nbqSYRUBsCuwS0oGV4SxjXbgak3Vp7
         FhAT7t6psxgyt9hMaDi7IUv3hPVIj9atENRjQHJUeB5LliqXhsOCpbFX8cJ/SQ4bZVpl
         33/7ab9M7CoGrR9xXAX6ZS1aw+J56g2c+14ULJ7K30ALfDGQ8d6ElhOCyNAK1uAS83UT
         lfTdZOwZoSmiL5Wrgmwi+nE7N69UwMedm3RTY0ODeIDrMGsTwplinc6C9VGjGKP/ReuG
         461g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772201007; x=1772805807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=warcM3LovriiR1qe/xbK+forV1iKLkvB/qLDY0EdHzA=;
        b=jBpofpC+2eXksNQ/KCZWoscOGMrZjl4vjokaXXxFgEZmqvOf2hwXbF41UK9Ew+TaaI
         SL1KBsrVrVV5E1UgsvQZTLrmBcbYXrLmXclwMZNGj93bcHmdZmKEEA69A4dLFfKysx4v
         /xY6wowRThwgwZ+yC/96aOzIJrF0C9c9X70MB/3WVWNQhH5s5b8DFDfRwlnx/Mdsve0t
         0V2NCav/NtojhaU/VqGCeKRDiy8wWBPzgM/7BmlCyA0e6gNc9A2VfXTq2v6iU1itBxBE
         Zp+TI0pPsTrtjbv9h6MTvULd9lBXjTcfrIi/8yqFF6UKvLQaP93Cw+BlLBVZ4Mteh3he
         Uf0A==
X-Forwarded-Encrypted: i=1; AJvYcCU8lx4e/VTWQ/rU+3Txj+T3bZSnYBpQaduy1l8iavkegGi49bK10wdbl19d6gXITIeSEvOa2RgFixWhA3fehLL6tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHvP7eSosTOrnoxedjny+Tg3Z4b5IP+S6qQekdAYPv3/08ZuE7
	Ub9ToPd/zDOLRvjcOF9/qlZySBIxH9J0K/SjTxPqcWCvm2WT+f0oXIOI
X-Gm-Gg: ATEYQzwtFs5/Oqhc8GhEQ2lqL7a7XYaMhwWfgkaz4p13BukwMnJKAKp8Bt9mH+QpBwi
	Oq6895cjZUDQFMmahQuUoMqHm08TT16YGvQWsqfe20W/G3ae0fspF+vIgLfL03RiTSvqrg2m/GF
	It0uHdsgfNAvr60fpWTuAlYnduZkRS3gvBImdTLlJtuTcle7WBfWmJ9rMtBDKJfVGszQpB2+2EB
	HM74WfVEYkhZ0/urmvIdLvLxZ82Ii6+yv268OMZqaMJgSObIPsc+VZYm7GYmUvMt9xivk7z+ZTX
	hL69HWPCNZU8WaQjfBrgWx04VFKox24aQluUA1f1Y5AHbC0/w7MPxbkLPrIUe/M1djG1BynUqY6
	VCqftbO1r0HCkJjHH07OkBlcAXGGNb24I5snv44flC+Y/fc9rSbpCU3yVe+4+6+X6Qzjwy/74rh
	zrKZMQA6lXT4rwZGqA7k6oYG5j7JQDDg4=
X-Received: by 2002:a05:6000:22c3:b0:437:70d3:44e7 with SMTP id ffacd0b85a97d-4399de2b5e7mr4991338f8f.30.1772201006634;
        Fri, 27 Feb 2026 06:03:26 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:4d8b:fefb:26cf:1906])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60feeesm7658811f8f.1.2026.02.27.06.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:03:25 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 7/9] irqchip/renesas-rzg2l: Add RZ/G3L support
Date: Fri, 27 Feb 2026 14:03:07 +0000
Message-ID: <20260227140316.308106-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227140316.308106-1-biju.das.jz@bp.renesas.com>
References: <20260227140316.308106-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28536-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: B9AFE1B8708
X-Rspamd-Action: no action

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
 drivers/irqchip/irq-renesas-rzg2l.c | 43 +++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 5e30dc2328e0..3010247fe3ef 100644
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
@@ -343,6 +345,11 @@ static u32 rzg2l_disable_tint_and_set_tint_source(struct irq_data *d, struct rzg
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
@@ -607,6 +614,36 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
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
@@ -618,6 +655,11 @@ static int rzg2l_irqc_probe(struct platform_device *pdev, struct device_node *pa
 	return rzg2l_irqc_common_probe(pdev, parent, &rzg2l_irqc_chip, rzg2l_hw_params);
 }
 
+static int rzg3l_irqc_probe(struct platform_device *pdev, struct device_node *parent)
+{
+	return rzg2l_irqc_common_probe(pdev, parent, &rzg2l_irqc_chip, rzg3l_hw_params);
+}
+
 static int rzfive_irqc_probe(struct platform_device *pdev, struct device_node *parent)
 {
 	return rzg2l_irqc_common_probe(pdev, parent, &rzfive_irqc_chip, rzg2l_hw_params);
@@ -625,6 +667,7 @@ static int rzfive_irqc_probe(struct platform_device *pdev, struct device_node *p
 
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzg2l_irqc)
 IRQCHIP_MATCH("renesas,rzg2l-irqc", rzg2l_irqc_probe)
+IRQCHIP_MATCH("renesas,r9a08g046-irqc", rzg3l_irqc_probe)
 IRQCHIP_MATCH("renesas,r9a07g043f-irqc", rzfive_irqc_probe)
 IRQCHIP_PLATFORM_DRIVER_END(rzg2l_irqc)
 MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
-- 
2.43.0


