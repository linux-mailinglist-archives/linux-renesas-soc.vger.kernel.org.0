Return-Path: <linux-renesas-soc+bounces-30287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF9yAnU3xGnkxQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:28:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E47332B417
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 39A38305D23A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE4B408223;
	Wed, 25 Mar 2026 19:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkOpeWiG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3A2401A21
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 19:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466710; cv=none; b=a7amFPXBOeJudHO6gXoZ2nvWFRSeScwOUT4OJrTOOO9fGWTwGeo4YLsM6ROA0WRRvVtCS7nTdlR1SeI3DtNe9yJz5qlX0j3+3Zpu1cbmPOOIfz6ozrFZMTLWDRL7eW7xCTd9vnou7Wtr4ZVvQKn2T8IwYn1i+lnMkLbwhWtnYYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466710; c=relaxed/simple;
	bh=dsW5m/DnC+sovXDLhObHDgqNfbTWBZrXn483vlT4bWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WBJTkrX8MCSnqW5XNXlJtBE5ArBQEdKEr1IA3fZlFTD4ApOGLryPJlXCvUo1AUMyhVrxzNyIzmEzpBsXIf8MmvFoL+UOiJgH5EJ3/+w35eZyPYgb/dm4UqvJpu7R2pNatN8j9HFw2ijP7BHLdxypf7ip8tybQaP1hsinT71FnXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkOpeWiG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b7481f9d3so89208f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466707; x=1775071507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qb++ewnJyJ45pXXOaXG+zeHzFHUXt13TUkOk/iIgvLY=;
        b=MkOpeWiGpDL1KWwHEN2Kf2S9XeAgW783g3NdNF5S4eju0pCzhCPY7Z4k4+VEG45upA
         X/8Hqm7TXcGX09MdSJ4f3FtmtUTOhxbKuHsS7YNQ9YhZWhg7yQzP3S/XBytUiovi/ref
         mXaYG5WTz35/WMVzWSoicxnmHxAiMu6Dv/o2hlcupvHkih32RWa6WVguInuCB3ElfSJM
         oUiLwlkiXYhUO1vZEQOIrkY5rl8xY2Bl0SNbthcoF4TJ4jHSErBrfsOYKMrocyCJAiJU
         C2sZjrzEPlLpp5AYzk3fuMrB+P5CvC7fXs/wOylcEw3lJpp5Uveex8BHBQyEqcd27JgH
         AzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466707; x=1775071507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qb++ewnJyJ45pXXOaXG+zeHzFHUXt13TUkOk/iIgvLY=;
        b=Lnvcd4nje3wCpuB2byrqu313kT8bEMRiv1kjkxrZRLrQRlZHCHk/9Ved7uOvVJWDMb
         eI7eMbd1dKE5IQL9RgvOGHwrIgaK6YjOrWEVtnNSkMg6v7FlbOKMeM8PWnINCiMZyaGS
         U3mU6gGt3dYHT9QGuBdT5niw/H6oYnfyj+uj/Cqu+g7SyaRdBManhwvySXMhMehNBYck
         r8rM8+JZjPeauQ/bmIV0OneN9lhasl05HjrrmvuX+zTg+ag4eUtXSQpLFT2QeIKm4/hv
         2lYLSCvkK1Kuqy+r0vq166jXUD2U8J0zGJRly7KlVYMRzvB/3Y/KbAqGQqYOrg6MQDLZ
         0TNg==
X-Forwarded-Encrypted: i=1; AJvYcCVy4sSLxa7JfIlRDb0li2uAhPa/wl45UnyCSMfeWO2CfeUGS3Gqt9eRMqmpk3LpkaF3ogk/nHAaov3/F3FUcHHUAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMM2eOcQpd3q5gF4BFL4kGyEyDKSXEhf2A2zHag/LZYh3npDbf
	Ah64qb0FlHZUVXfZPf9YlHPx46crvBAtAxoknIx+VoKn2JD26A/SBVob
X-Gm-Gg: ATEYQzzCGeo4hqpBrxPasWQmhgNe8nJqGr04Yq0eo7lZ7VbtT1ohkuuvZSdlW/aCps6
	wA9qFddWzsmnO1KXRxmLAMSHtXNqfw4CAsWZKgpxAO0XS8+L47c0ieurDUSm3FIzA5AG8hFaXBO
	U+t2m6tG+0em9vVQpxIETuSttQvE86ltjnHE+oVj44zdI5ZExGoZ+ayne3VaSYQKKZLJrhEbRTu
	/KgX1GXIZQQ7Dp6fiVWlv0AqvwXbsS1h44EQOC+S7Jhh5eeQkf4gVDS1Yk/Y8Fs0IrvByAjT7Tp
	+dGkztbvwBEN4YdXg9suxHIV1VnrB2zymNh2kXqJeSnf3fU66OBvhJmuJN/x1MMHw/alWYFXuyP
	khn5FRQNg4uJDGmMja859gll8aJq6kl+BFpvuTFsb9OEsU+U4v1z4od1NxEag810oosYXTRm3V4
	jNcmdT5Ff58jVCop8/EjUIXHvODBI2m868844syEt0jwdEMTMSVNCAmu9+Q3w=
X-Received: by 2002:a05:6000:4025:b0:43b:86ce:279e with SMTP id ffacd0b85a97d-43b88a411bcmr7588810f8f.44.1774466707106;
        Wed, 25 Mar 2026 12:25:07 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:25:06 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 15/16] irqchip/renesas-rzg2l: Add RZ/G3L support
Date: Wed, 25 Mar 2026 19:24:30 +0000
Message-ID: <20260325192451.172562-16-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30287-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 4E47332B417
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
v6->v7:
 * Replaced variable type of iitseln, sense, tmp in rzg2l_irq_set_type()
   to unsigned int.
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
 drivers/irqchip/irq-renesas-rzg2l.c | 48 +++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 171717a4805f..c885beaa666c 100644
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
@@ -331,9 +333,9 @@ static int rzg2l_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
-	u32 iitseln = hwirq - IRQC_IRQ_START;
+	unsigned int iitseln = hwirq - IRQC_IRQ_START;
 	bool clear_irq_int = false;
-	u16 sense, tmp;
+	unsigned int sense, tmp;
 
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_LEVEL_LOW:
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


