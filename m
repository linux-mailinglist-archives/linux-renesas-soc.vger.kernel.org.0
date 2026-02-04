Return-Path: <linux-renesas-soc+bounces-27917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKHkC7SMg2lWpAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:15:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE6BEB84A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C579313C1EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 18:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B235843D51D;
	Wed,  4 Feb 2026 18:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHE8dpMf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BE943D512
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 18:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770228403; cv=none; b=YD+Zr39mU/QxdVOM8KpiHAVLZMuwdDaP8IwieEgyzZ/mvGKylbXPRoYhaeK1ShcGNR3e+DhZNno32aP+1PrKTh4sK/3HK6q6A1qbzxs8USbG41fbBrepKFhdm804dbaABn7NXnMadXXGCM0wZXj8zEBgOuah31DTh1mFzohMzA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770228403; c=relaxed/simple;
	bh=Nvon5HU4uDsDUFvbVc/EXvOSbVfP78gfst0mFuSrgmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XmZtlJwrdHuE6UzV+b3XE8k5RefkCnGVH9c3OIEjVeDFd+hsUfGC96sP8BvY0r2E84gtMVx7KwVy+ylmbiNpAT+4hHdqWqt2mPKnuyKlPRyynWdW4u5+bBcUJLPrcDgDBDuGgGv/L/XseDbmfjwmAHMnr6LLLgFeyn6rniiB4bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHE8dpMf; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b885e8c6700so7880466b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 10:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770228402; x=1770833202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEFEz+0O6RmmiZuAu1Z/OWcKigjy6pHElLDStvAERio=;
        b=NHE8dpMf11/ghytNrb5a7L+sjWNAST3c74hJaZTU1lBuygQKYchsNnRRqZV3L9d173
         THGAoEjDdVjdKJAnqWW8ZSmjv2banb48vq0sMRsyPit4keVn7rydiryvnmPj1wdWKBRp
         IWAP+sGySr5N4u0Ege6D/eKvzlo3otUxnpCxat9kzEeTehDuR/X02g2tVMoIWoc+drCt
         oqRbYf6fibPokis/c5YpPQTeM2rbH+25ainFbOEhoAY8Z7eLIltAqaAi+KPWp5k3wB/I
         1xf/tf02WjqQ5xYVS3+ecTQ1x85Ub+ef0/79XcDVutVUZJP2i2NrVc2IExU32XIiPJ2v
         +HyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770228402; x=1770833202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DEFEz+0O6RmmiZuAu1Z/OWcKigjy6pHElLDStvAERio=;
        b=P8rQ98jB1Ii3Fjgj5nkxLYJlsDa3/VzjPiUEoC4wFPq6q9oGZFZwf5X5aQUId4l0ue
         9lYyi6lP+kshZodYqADKSK2dASZ4+fiA5E4P6WiXzEWLRkG8KOj3bXsedmoNpO/bqX2w
         ufWWVoJM4UVUqR+3rbliGpX1LbVBZvpsBr/w6/xJZOM4VSMqEZzcAUyQu+nMiiccjhLe
         UhuzNca18sv+N2elnbyZS7yDDXBwpwLPsAXMHxtO23ob3mIIap9O7ZGR7xapeIDLqBA8
         CnXrhnfYozt8e+tl9Is42MxfA9yCpmSHpD5sOtasMvWn1/p1wacwMMyPIAU8YgOCH7QJ
         m70w==
X-Forwarded-Encrypted: i=1; AJvYcCWDZHkF/lsiYE+m3N4bWmLAGkYwIemxKR2jILeOaPZZfWpU82eXzb0aZZ2k9br2MM1Ln9jjy9Tuw72WodzUKGKN3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPPF7LDlzmdQpQRW38hWlxZvefOO1WhYZtVEkZheW3bJyZrRmp
	KOO7giQDY1nOmIQ2k7liYqgiF8b14KB+coYkeUIPPmtiEvLYSt3LS8ma
X-Gm-Gg: AZuq6aJOpcKEheW79GvARLtzHwLmxBFQNM7J3HA+0Cn6ahOaWLVvawibtXnKy6uMAWQ
	mPBqJ+BCdz8+UBunIJqYYwj2WRB7M+aRWNoLaeVMlna0tgK+gxab5xTwCuYwK+7BiW4YDyx7ERT
	7w8zwlzgUFzJ1rq4Frq3Fc0+3pGnLjjLaAVUO0YD8rh1e56LkMQDNh6SDsQsaFN5paCDmAy0mH1
	0+GsA84VVz7DJi8FPgpbPSbrh21PpySqp0C0Ry2u46PaYv6J7BOOUwCHwzmi58tEGFXapPQedgx
	SRw22k/PkDRY5pqkeCDTb37nPCPW58CevOPpX0eT9nJNxAn2QmZ9WGfK+VQ/jlVUWDgvdyVXrF6
	sVYY4vJ6zzKV0QX0fo7ndJ/2wCFZtpAXq9wy1O5TLAUHpUaZOujJWXsX3TtvZlNPTwmqii86Knk
	nzl71c0js39NgEFv/zGMspc8XnGEqoa6apbCAYPnOysQ5G4w==
X-Received: by 2002:a17:906:fe47:b0:b79:fe73:3b18 with SMTP id a640c23a62f3a-b8e9f170022mr274818266b.22.1770228398985;
        Wed, 04 Feb 2026 10:06:38 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3c9f:a100:4d45:ebc7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea0057dd1sm149677666b.65.2026.02.04.10.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:06:38 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 7/9] irqchip/renesas-rzg2l: Add RZ/G3L support
Date: Wed,  4 Feb 2026 18:06:23 +0000
Message-ID: <20260204180632.249139-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204180632.249139-1-biju.das.jz@bp.renesas.com>
References: <20260204180632.249139-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27917-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7FE6BEB84A
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
v1->v2:
 * No change
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


