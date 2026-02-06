Return-Path: <linux-renesas-soc+bounces-27989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM/xNuzOhWlBGwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:22:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50469FD2A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B294330C8BF1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 11:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB803A1E75;
	Fri,  6 Feb 2026 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqTmfG0x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F483A1D16
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770376626; cv=none; b=OVR5ehaTbGx12+bM1rFjL4h8EWrEjy0gxaLhAKbCsmX1kr1BTBNbQj3dsTNjy5gKgugwgCOYzCBnGjKDplVmsNSmGlO1W+JByAOE8O006o1onFJ0cww7tPKcUcGoMBZE+WS5ocQ21NA/bItaNChnqvqs44Yf37jIQ5oqIz8e98c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770376626; c=relaxed/simple;
	bh=vuj8A8gInyVOoPQEbw+wDwkjQav4BmP98QD0xl0JRR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ImlCz/jrVjmfoPCZohby2rTekdlPZ7bDvPbODM6XOKMjb9PvHVH2inthvtQ+PFzDPyzJxjOYp/z7r3AM6RzYOyQt1HU8tdnlRIC0xmIevXdb4cHykqRuph16VYck4qe0pBxRVENF7ehq/0/y26KbQEE6EYSVa5kwXHV5LbEzbXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqTmfG0x; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43591b55727so519583f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 03:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770376625; x=1770981425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IczN5ipnnJMcQcEavsKqC9A8Jd1PQep+78i4Emgw8gU=;
        b=hqTmfG0xeIH9aOwRTJScZXeXJIhxnO0wRXJJ2MpYI+8YG5XmF8zgt/Gvck6hTuR+uc
         rVkBFeAjRJXer6lQMR6B7+USG3Om4dwkNdVc1VPXWf4dTtgBgtYo+5tHpXouo7td/elo
         xMN0xBr+PhZpXb+QM60PtAdR7LGdMYAt2lNrPh0pDg5u/Pswg2LWD9LbTQeqobL/XcAt
         D84E6OoNkaYEB3uOa8eQvEsUhCjAZLfaloXBysGfnEC9qmpkDdYaSkgkS5sifGPIIFMd
         aldscpXjzb6ufCfHGRLW39lnFPZIlh5yAY/ktN7Xy6DQ8tcPx7zeL12Ty06rTN/c/oTf
         HNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770376625; x=1770981425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IczN5ipnnJMcQcEavsKqC9A8Jd1PQep+78i4Emgw8gU=;
        b=rjIBm/NYTlRbOweLDeiZQ1KJ4OytLrArpLPp5EbflN2DKm9lm0H2oHEkN5UmHmyS2h
         qzVwkbuH/Tl+JV9d3dtYrth8BVJyFJoT0brPpPLmiryvfMi7qSMEF5GkcppLznfgKTMy
         WS1X7/mOF6OcCQqP/OJJD71bA6DORWMooO75Zs9FQ0e7gmSf7rzsWGTQiimZepACjVS5
         j2F2WduAM1su0EoIXip3GvDbhRtZq7YpOvkKArOZIy/Z1aYixHJN79PTdI7dCndhHmuY
         mc/LiKQJperPQuZgU8/At9gnR4p6PQESBpf4jMcRnZwfNkBK8Z+crImmtj3qWFqqxeix
         I1aA==
X-Forwarded-Encrypted: i=1; AJvYcCXnnwWSj7Asw8IXv+2qGikiLG+3RCkzpyrn4rP3mEuYl7yH2waV/XvUBXk6XYWs5Ri5Vxs9E8jrjcYSAQG8ZN0WPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSaybjWneuEIYfxCei6k9eSGLQbNYPFZQv9fHrs7t6fPPVjaXT
	9dsEfct5ybBgqbKHjYagkFQo3g16gBj74wUrA93ZWwf/tvWpUF84iCrF5Hx7I4WS
X-Gm-Gg: AZuq6aJUtMPSsugm/kOKTdHuOMEoQO4XIya9x2mZ9yUd2/pOZWYQ0M0fCQ0zuVh454E
	e+oOdPmFr0Pk6UnZQ+pRvrTdYPvGcZ46xCQ9jC3ar4xaHV+Y60uJ1N8Nh2pEPKZ6oCfQND1b3Cz
	G7XXbU/Q9Ugiv7Nbw6iSmL+TxwbisoBO4Ega6P7uYKAHmhRF73NcO6ZCz30VNAOVAABy5XBo33/
	BYJU/ik4rduydER6tStGKLjwN3P4pipJNDv715ceMVoJ9ljRerMY3aN4fTsP2kLyDJu8GgVPxq2
	1HfqfqXlMOoHuvnXPGwwV4OAf6Muf16CIyacHdLIomkNd/vaZWjLqDtpJzZ25+lnYfWvTO/CvG4
	fFSfLAD5W2Hw2D7npnH8u+9ND0txwJ5VcqTA3KPAjeyWu8Z1iYup7QfratHPcgrz/IN4xMsGghv
	JAfy8T/iSG066g5iisRw==
X-Received: by 2002:a05:6000:250a:b0:435:b089:4f46 with SMTP id ffacd0b85a97d-4362938c2f5mr3766118f8f.50.1770376624798;
        Fri, 06 Feb 2026 03:17:04 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fa4csm4746380f8f.26.2026.02.06.03.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:17:04 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 7/9] irqchip/renesas-rzg2l: Add RZ/G3L support
Date: Fri,  6 Feb 2026 11:16:50 +0000
Message-ID: <20260206111658.231934-8-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27989-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 50469FD2A2
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
v2->v3:
 * No change
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


