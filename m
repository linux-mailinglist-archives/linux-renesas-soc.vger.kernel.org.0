Return-Path: <linux-renesas-soc+bounces-29256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKM2Af7CsWmdFAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:31:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 319C5269590
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CCAB327824A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 19:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332B73ECBC4;
	Wed, 11 Mar 2026 19:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GD3X4U6A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065C73EC2CC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 19:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257117; cv=none; b=VOwis7qzDCBptfqrKttyuPwXASb7CkYVtmoTwXAAcKvEUF7vh14Jkr43c38ZqbG0znODq8o9uiGrUJhxe7n4mFnd579fJQIhcRXaHwCp0w6yWwTNzmYHEL1YhQEHYiXFhsqGtIsEVjUdp6g/ZKakeQ561X1LzFXOz0+b2m3o7EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257117; c=relaxed/simple;
	bh=JQUh6uSG3eX8jCnZ0fbcgAQHIQ30lddQjETGcQnDTHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9VyeDWvqjTtjx6CqsUzNSvl8O+Ao2mbGTf8dcvuHmILfb6AJsPdmQOpmLB+fnw4iShdCrZpbWbq950XqvmshiGQpm6Z1FRBnuZ3SbmpgLoTgbWaIqX4cgGROOiMpF8Pa6Zi/Jw7BTqQ5CxNXUOPlROFLkDTtiHt3giOhv3gK/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GD3X4U6A; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439aa2f8ebaso140360f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 12:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773257113; x=1773861913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Obnj1H0dVTFAOSgV3uGFHYeuFkm2iL0FpdY147b0Sro=;
        b=GD3X4U6A1UdCW4jNhRbXv4ZgO7q9t93DLcZ9hL7kLqMcFSJCDjxV+6tLA6eFtKelCo
         iQ5rS8Hk068JZT1ksLdfLIuIOSAUAi8lX/p3tT5vBXpwWYr7OI6ucu7NUWHYqBDmTbqF
         weavXglo5nVhBtB86iXPpalCeBOL8nvGGZHoEmMZ4xS6NvWHGlrnEWUOhMJYgcl6MJDI
         2mHT2RpLAg3WmLTYRscgcHJBVeJfeWOtGqL8kGfrITo98ydwHl9aPXWnZidSaBI2pMvr
         9ckmM887YjpMHTRNmua0D3qnMKkPnlYKn/uuFuSUXVmyWdOnzzJ5IOBR2GVMErJgOGUU
         EcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257113; x=1773861913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Obnj1H0dVTFAOSgV3uGFHYeuFkm2iL0FpdY147b0Sro=;
        b=DxeEa7SNq8AHDh7ea8F9cIUqU/21V/erbI9j7i67U5M9lG7NIOqZEiD28Nzn5Crh5e
         hv8U8JV4VkaSTZoH7R/W82B95mjLLvqm5WViUgYH9D9Kb6UZE1IyY/SXh7gr9zDjRoD0
         yeWvQhkmxH+4zaTeHyS92PR/Sb50KCSWaUWTsndUVXn8TFJxacdz8sY3saj43N3SGihe
         Wq/vb1b5LSWDWW7+9KSOt0ALrZ9phNOrUvq09qlcrsNL1Uxs2jHE5k83IkGlsW1s83lp
         XXyNovBJDZGfAYF9m3wV9HHtSdGhQpEoN2LrBv17Z2cp2lNXWE/m8kXKEu7sg6GNL9Lu
         7bAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXobKjfQAaDEFv78ZpyrVFkfpEn8AcC3rqKXiolU6Vl8rfvZrx2Yt09qqBTGupLvEwJYp5i77m1kHxq7MtNffacvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrzz6RKDpxDO16UWZe6aarruievxU+4FAM14fCc6l5VTewxY9I
	JGkIO1//f3gIO5RqeLocfh2oRgSxyg+PdWmuK0wkN15KCn9gBTJ9ErVk
X-Gm-Gg: ATEYQzwWIJxegHsqSSpOoxd5Lz6Rap9FJ9PRX33Oryn5Ysw82nxqX4m0LKfqYWRqZrK
	nZx+GrDQeOdcbGZh2OOysMJLXE/nkztvhGWDlHHCcM/PnQyEF8fycAgQGC0qVcvLUDwyp/ENOTV
	QnHc1gTfHOYc7IhJh3KYO194dlb4bbtiH8zDWsTKLZaCkAJ5xH1VLH/Hexn05gz39RUJpFj+Igf
	d9DVBUtrAMMNzQQPbrlCzkUL7KSjMOHR6fgO4M9jFVzmdrgc1Wn7H1bkSmvUNOYjXjurojKeFG1
	LmosggMBfn8aDNrhE4FxGawLVmQGUU6Hi1yXnmqEUHfVRmbtPn3ZNdHCGuRXJ5yLPeREIfBbrJh
	ILRpst7JOh8yoyrnv3LckKyqTEC6hZ1KBUi7P3s7uLc3LvQisFF3GUPS9KOHWvSwrxuQofTq7x+
	GlOw2/3th+y/Xp2SuVDyv096yII0PRlNMYtihAI2HxtmdW8VPY
X-Received: by 2002:a05:6000:2503:b0:439:ad72:9900 with SMTP id ffacd0b85a97d-439f821ba00mr7673023f8f.29.1773257113146;
        Wed, 11 Mar 2026 12:25:13 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:38b7:8ca3:cb55:d344])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm1323210f8f.21.2026.03.11.12.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:25:12 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 14/15] irqchip/renesas-rzg2l: Add RZ/G3L support
Date: Wed, 11 Mar 2026 19:24:45 +0000
Message-ID: <20260311192459.609064-15-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29256-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 319C5269590
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
index 78744c21b45a..e4c06e382120 100644
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
@@ -381,6 +383,11 @@ static u32 rzg2l_disable_tint_and_set_tint_source(struct irq_data *d, struct rzg
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
@@ -687,6 +694,36 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
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
@@ -699,6 +736,12 @@ static int rzg2l_irqc_probe(struct platform_device *pdev, struct device_node *pa
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
@@ -707,6 +750,7 @@ static int rzfive_irqc_probe(struct platform_device *pdev, struct device_node *p
 
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzg2l_irqc)
 IRQCHIP_MATCH("renesas,rzg2l-irqc", rzg2l_irqc_probe)
+IRQCHIP_MATCH("renesas,r9a08g046-irqc", rzg3l_irqc_probe)
 IRQCHIP_MATCH("renesas,r9a07g043f-irqc", rzfive_irqc_probe)
 IRQCHIP_PLATFORM_DRIVER_END(rzg2l_irqc)
 MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
-- 
2.43.0


