Return-Path: <linux-renesas-soc+bounces-28056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKGqGq66iWlwBQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:45:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A83FB10E42C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F13E230465CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 10:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C0E369219;
	Mon,  9 Feb 2026 10:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggzqgPgd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3D636922C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Feb 2026 10:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770633733; cv=none; b=EVESlrsfG9LOAuVkCkofSg1m4ZHvPY/awlbkQ8/K48UWsAYunT1iCZcsS9V6rmA7VDLqqKjwYxfzT8QHnBop9CLIjxUsSUtxv4cGO+/Iy8Ib0bX5KhNpX8E9Aoh5OdWU1YqMsr6rPE+8Jw1ToCRh9mJKTSnk7DmuDHp9m3QFk2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770633733; c=relaxed/simple;
	bh=gYzkVWgdBems/TFDSNMRlj8gcRtjG5dnWHKOVV8uAWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P64iozfONLjJst2C3nvyC8I2pvdJ51GVORtMzmAh6JCMcDROKAt6mG+GjmjOeD5XtnI8n5I3GbY5E8GG0+OO6CweqrDktZYCrNLwG71pPfUoLmzepgZa9Z2JcGP+cMH6pwJOpqaYrGSgVrcGo2uyN9T8aa9aJE1GjiCG+p79wU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggzqgPgd; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4362d4050c1so2734685f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 02:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770633732; x=1771238532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o11486/1RRk9UzWQIeXwojFYzCpvodTNfzzuPu0RgGQ=;
        b=ggzqgPgdsPuY3POTo2jaS/0fZsbi4kIXaBPnog5GiuGZ68z9PWYXzraBj1jICogacK
         Q4eYCNqJqdCU2NgYW0MXzmcm1wUTNF8lbIgPlRsPuWuZ6ojUODDFsaIsXLFNuvNMhXNq
         RLKaYNwugakV0nhaoBL2z1BTq4Csq0o6FWVF1i+2ffHzWWqvLWDLN7pazQuudmucPGXf
         QwLQo8uIHrYLF5EULfElcOIdhRXA9Q+UhPlIGAJ0xYuLdwzRpdM4SHQSMo07Oit7S53h
         L6NyHc2xw3n6l8WloZMqRJuI+FLzA9JSfEAm6Ia9afdvxrmaiACqOeOqQlDrNUAG8YVL
         TL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770633732; x=1771238532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o11486/1RRk9UzWQIeXwojFYzCpvodTNfzzuPu0RgGQ=;
        b=ZQVjBD5bbNr8XSP2cNXvzwNPUEYYlMuqH3R88lPCv4l5k/OYMwaHOzSUAMDK6uNLuN
         4bCozBq9hF3Bty65/XlhMPyfm/kUxZ7i9PzvqmiJtdMbEaezVyv15P40JV4Rkk9pRc8Z
         Wi2o9Pjn0SAuc3cqqNaxqPv0GHtvq1aJDwNMpqW8UrZjKOAjjGbYwQBqGHc6kvaM9kOd
         COfdsnr79UnDARXmUEOE2CY+wR07Geuoc9qTzBMqhWclP1jQ0zuJg3rrjvIf18B3bBld
         7RfbJ6yVHFy5LlfttwedfiDp2k6D51UKdJZDN2P5A5j2L8QjhkCT5i9CPp7ffXDEvFvm
         40zg==
X-Forwarded-Encrypted: i=1; AJvYcCXGUG5XOCs+/QIsxB946eXRGk3JSPiEGVKaI++OFiNPovkOxLxWOCAFHM9A92KbRlWnGOf7eYxKmcEazYWRuaZm5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwzxr3dEgBCWcSmzvxq6BIBHQbeBzy9xsEMXNIeq03Or3G0QVM
	7k+ozOt3PQ+CVgZIJYjswycDOB3t8wqlQyWj59EWOL2537146yrKgnBP
X-Gm-Gg: AZuq6aIG+U8WCMyjGdH75sNK/s+4aHrkEVYepEJt9brOTejuMhYG4dKmJL7hY8niywL
	6+ZhvR/izJtFPajr6SrnjevYiCr/chC123BxHoaSTMHNET3kV3bVuTvRBEBIMzXfBToZQN5Z+Gp
	u8VOnPP3WZJIYWX+B9tra7rFolaVjHilrudtJQfZmnLuWS9MNff5eCir7rFlYRuIMgBePM3TkHT
	inNa7utaI/1O+JlSyvzexSDHjhN1rIzwcg9Q563QzkP0a5HOd6L3BbkRxkyVKgScgwjBzv8I6kk
	HqWTRRvJbTq/hn19/Ndx45VrjiKM+4kk6oqv+XQ4zoEFNjBwAwXEd6LdtN1YzJsNF0ezNcs3oqs
	3KEGa4Gi7B0VB6Rm8z/7bjxl/G5oPnVuMgk2gZtZcila+el+BXJ4iCl67GM12fOsmvI2nOPCGye
	ymFjmUSPvO93miod2chPXs8JhbI/VYeltK8OE3UYzQzzJkEzp8/PdG6piKQ64s/Ou+4YrMhjDys
	2TYSTNfcXo1yahT6IlQ+Hcs
X-Received: by 2002:a05:6000:2c08:b0:437:6dac:4578 with SMTP id ffacd0b85a97d-4376dac47c2mr4858253f8f.42.1770633731363;
        Mon, 09 Feb 2026 02:42:11 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:436e:8b6:a7da:63b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b20fasm25962211f8f.6.2026.02.09.02.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:42:10 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 6/6] irqchip/renesas-rzv2h: Handle ICU error IRQ and add SWPE trigger
Date: Mon,  9 Feb 2026 10:41:20 +0000
Message-ID: <20260209104121.26172-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260209104121.26172-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260209104121.26172-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28056-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: A83FB10E42C
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Handle the RZ/V2H ICU error interrupt to help diagnose latched bus,
ECC RAM, and CA55/IP error conditions.

Extend the hardware IRQ numbering to include a single error interrupt
line and route IRQCHIP_STATE_PENDING requests to hardware-triggered
error injection via ICU_SWPE.

Account for SoC differences in ECC RAM error register coverage so the
handler only iterates over valid ECC status/clear banks, and route the
RZ/V2N compatible to a probe path with the correct ECC range while
keeping the existing RZ/V2H and RZ/G3E handling.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Updated pr_debug to pr_info in the error IRQ handler to ensure
  visibility of the messages.

v1->v2:
- Made Error interrupt as part of ICU IRQ domain.
- Updated rzv2h_icu_irq_set_irqchip_state() to trigger pseudo interrupt.
- Updated commit message accordingly.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 149 ++++++++++++++++++++++++++--
 1 file changed, 143 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index bfb975f7e370..d4e8aab46412 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -33,7 +33,10 @@
 #define ICU_CA55_INT_START                      (ICU_TINT_LAST + 1)
 #define ICU_CA55_INT_COUNT                      4
 #define ICU_CA55_INT_LAST                       (ICU_CA55_INT_START + ICU_CA55_INT_COUNT - 1)
-#define ICU_NUM_IRQ                             (ICU_CA55_INT_LAST + 1)
+#define ICU_ERR_INT_START                      (ICU_CA55_INT_LAST + 1)
+#define ICU_ERR_INT_COUNT                      1
+#define ICU_ERR_INT_LAST                       (ICU_ERR_INT_START + ICU_ERR_INT_COUNT - 1)
+#define ICU_NUM_IRQ                             (ICU_ERR_INT_LAST + 1)
 
 /* Registers */
 #define ICU_NSCNT				0x00
@@ -46,7 +49,15 @@
 #define ICU_TSCLR				0x24
 #define ICU_TITSR(k)				(0x28 + (k) * 4)
 #define ICU_TSSR(k)				(0x30 + (k) * 4)
+#define ICU_BEISR(k)				(0x70 + (k) * 4)
+#define ICU_BECLR(k)				(0x80 + (k) * 4)
+#define ICU_EREISR(k)				(0x90 + (k) * 4)
+#define ICU_ERCLR(k)				(0xE0 + (k) * 4)
 #define ICU_SWINT				0x130
+#define ICU_ERINTA55CTL(k)			(0x338 + (k) * 4)
+#define ICU_ERINTA55CRL(k)			(0x348 + (k) * 4)
+#define ICU_ERINTA55MSK(k)			(0x358 + (k) * 4)
+#define ICU_SWPE				0x370
 #define ICU_DMkSELy(k, y)			(0x420 + (k) * 0x20 + (y) * 4)
 #define ICU_DMACKSELk(k)			(0x500 + (k) * 4)
 
@@ -97,6 +108,10 @@
 #define ICU_RZG3E_TSSEL_MAX_VAL			0x8c
 #define ICU_RZV2H_TSSEL_MAX_VAL			0x55
 
+#define ICU_SWPE_NUM				16
+#define ICU_NUM_BE				4
+#define ICU_NUM_A55ERR				4
+
 /**
  * struct rzv2h_irqc_reg_cache - registers cache (necessary for suspend/resume)
  * @nitsr: ICU_NITSR register
@@ -115,12 +130,16 @@ struct rzv2h_irqc_reg_cache {
  * @t_offs:		TINT offset
  * @max_tssel:		TSSEL max value
  * @field_width:	TSSR field width
+ * @ecc_start:		Start index of ECC RAM interrupts
+ * @ecc_end:		End index of ECC RAM interrupts
  */
 struct rzv2h_hw_info {
 	const u8	*tssel_lut;
 	u16		t_offs;
 	u8		max_tssel;
 	u8		field_width;
+	u8		ecc_start;
+	u8		ecc_end;
 };
 
 /* DMAC */
@@ -259,10 +278,10 @@ static int rzv2h_icu_irq_set_irqchip_state(struct irq_data *d,
 {
 	unsigned int hwirq = irqd_to_hwirq(d);
 	struct rzv2h_icu_priv *priv;
+	void __iomem *offset;
 	unsigned int bit;
 
-	if (hwirq < ICU_CA55_INT_START || hwirq > ICU_CA55_INT_LAST ||
-	    which != IRQCHIP_STATE_PENDING)
+	if (which != IRQCHIP_STATE_PENDING)
 		return irq_chip_set_parent_state(d, which, state);
 
 	if (!state)
@@ -271,9 +290,33 @@ static int rzv2h_icu_irq_set_irqchip_state(struct irq_data *d,
 	priv = irq_data_to_priv(d);
 	bit = BIT(hwirq - ICU_CA55_INT_START);
 
+	switch (hwirq) {
+	case ICU_CA55_INT_START ... ICU_CA55_INT_LAST:
+		bit = BIT(hwirq - ICU_CA55_INT_START);
+		offset = priv->base + ICU_SWINT;
+		break;
+	case ICU_ERR_INT_START ... ICU_ERR_INT_LAST: {
+		static u8 swpe;
+
+		bit = BIT(swpe);
+		/*
+		 * SWPE has 16 bits; the bit position is rotated on each trigger
+		 * and wraps around once all bits have been used.
+		 */
+		if (++swpe >= ICU_SWPE_NUM)
+			swpe = 0;
+
+		offset = priv->base + ICU_SWPE;
+		break;
+	}
+	default:
+		return irq_chip_set_parent_state(d, which, state);
+	}
+
 	guard(raw_spinlock)(&priv->lock);
-	/* Trigger the software interrupt */
-	writel_relaxed(bit, priv->base + ICU_SWINT);
+	/* Trigger the error/software interrupt */
+	writel_relaxed(bit, offset);
+
 	return 0;
 }
 
@@ -480,6 +523,10 @@ static int rzv2h_icu_set_type(struct irq_data *d, unsigned int type)
 		gic_type = IRQ_TYPE_EDGE_RISING;
 		ret = 0;
 		break;
+	case ICU_ERR_INT_START ... ICU_ERR_INT_LAST:
+		/* Error Interrupts */
+		ret = 0;
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -605,6 +652,48 @@ static int rzv2h_icu_parse_interrupts(struct rzv2h_icu_priv *priv, struct device
 	return 0;
 }
 
+static irqreturn_t rzv2h_icu_error_irq(int irq, void *data)
+{
+	struct rzv2h_icu_priv *priv = data;
+	const struct rzv2h_hw_info *hw_info = priv->info;
+	void __iomem *base = priv->base;
+	unsigned int k;
+	u32 st;
+
+	/* 1) Bus errors (BEISR0..3) */
+	for (k = 0; k < ICU_NUM_BE; k++) {
+		st = readl(base + ICU_BEISR(k));
+		if (!st)
+			continue;
+
+		writel_relaxed(st, base + ICU_BECLR(k));
+		pr_info("rzv2h-icu: BUS error k=%u status=0x%08x\n", k, st);
+	}
+
+	/* 2) ECC RAM errors (EREISR0..X) */
+	for (k = hw_info->ecc_start; k <= hw_info->ecc_end; k++) {
+		st = readl(base + ICU_EREISR(k));
+		if (!st)
+			continue;
+
+		writel_relaxed(st, base + ICU_ERCLR(k));
+		pr_info("rzv2h-icu: ECC error k=%u status=0x%08x\n", k, st);
+	}
+
+	/* 3) IP/CA55 error interrupt status (ERINTA55CTL0..3) */
+	for (k = 0; k < ICU_NUM_A55ERR; k++) {
+		st = readl(base + ICU_ERINTA55CTL(k));
+		if (!st)
+			continue;
+
+		/* there is no relation with status bits so clear all the interrupts */
+		writel_relaxed(0xffffffff, base + ICU_ERINTA55CRL(k));
+		pr_info("rzv2h-icu: IP/CA55 error k=%u status=0x%08x\n", k, st);
+	}
+
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t rzv2h_icu_swint_irq(int irq, void *data)
 {
 	u8 cpu = *(u8 *)data;
@@ -616,12 +705,15 @@ static irqreturn_t rzv2h_icu_swint_irq(int irq, void *data)
 static int rzv2h_icu_setup_irqs(struct platform_device *pdev,
 				struct irq_domain *irq_domain)
 {
+	const struct rzv2h_hw_info *hw_info = rzv2h_icu_data->info;
 	bool irq_inject = IS_ENABLED(CONFIG_GENERIC_IRQ_INJECTION);
 	static const char * const rzv2h_swint_names[] = {
 		"int-ca55-0", "int-ca55-1",
 		"int-ca55-2", "int-ca55-3",
 	};
+	static const char *icu_err = "icu-error-ca55";
 	static const u8 swint_idx[] = { 0, 1, 2, 3 };
+	void __iomem *base = rzv2h_icu_data->base;
 	struct device *dev = &pdev->dev;
 	struct irq_fwspec fwspec;
 	unsigned int virq;
@@ -646,6 +738,34 @@ static int rzv2h_icu_setup_irqs(struct platform_device *pdev,
 					     rzv2h_swint_names[i]);
 	}
 
+	/* Unmask and clear all IP/CA55 error interrupts */
+	for (i = 0; i < ICU_NUM_A55ERR; i++) {
+		writel_relaxed(0xffffff, base + ICU_ERINTA55CRL(i));
+		writel_relaxed(0x0, base + ICU_ERINTA55MSK(i));
+	}
+
+	/* Clear all Bus errors */
+	for (i = 0; i < ICU_NUM_BE; i++)
+		writel_relaxed(0xffffffff, base + ICU_BECLR(i));
+
+	/* Clear all ECCRAM errors */
+	for (i = hw_info->ecc_start; i <= hw_info->ecc_end; i++)
+		writel_relaxed(0xffffffff, base + ICU_ERCLR(i));
+
+	fwspec.fwnode = irq_domain->fwnode;
+	fwspec.param_count = 2;
+	fwspec.param[0] = ICU_ERR_INT_START;
+	fwspec.param[1] = IRQ_TYPE_LEVEL_HIGH;
+
+	virq = irq_create_fwspec_mapping(&fwspec);
+	if (!virq)
+		return dev_err_probe(dev, -EINVAL, "failed to create IRQ mapping for %s\n",
+				     icu_err);
+
+	ret = devm_request_irq(dev, virq, rzv2h_icu_error_irq, 0, dev_name(dev), rzv2h_icu_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request %s IRQ\n", icu_err);
+
 	return 0;
 }
 
@@ -751,12 +871,24 @@ static const struct rzv2h_hw_info rzg3e_hw_params = {
 	.t_offs		= ICU_RZG3E_TINT_OFFSET,
 	.max_tssel	= ICU_RZG3E_TSSEL_MAX_VAL,
 	.field_width	= 16,
+	.ecc_start	= 1,
+	.ecc_end	= 4,
+};
+
+static const struct rzv2h_hw_info rzv2n_hw_params = {
+	.t_offs		= 0,
+	.max_tssel	= ICU_RZV2H_TSSEL_MAX_VAL,
+	.field_width	= 8,
+	.ecc_start	= 0,
+	.ecc_end	= 2,
 };
 
 static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.t_offs		= 0,
 	.max_tssel	= ICU_RZV2H_TSSEL_MAX_VAL,
 	.field_width	= 8,
+	.ecc_start	= 0,
+	.ecc_end	= 11,
 };
 
 static int rzg3e_icu_probe(struct platform_device *pdev, struct device_node *parent)
@@ -764,6 +896,11 @@ static int rzg3e_icu_probe(struct platform_device *pdev, struct device_node *par
 	return rzv2h_icu_probe_common(pdev, parent, &rzg3e_hw_params);
 }
 
+static int rzv2n_icu_probe(struct platform_device *pdev, struct device_node *parent)
+{
+	return rzv2h_icu_probe_common(pdev, parent, &rzv2n_hw_params);
+}
+
 static int rzv2h_icu_probe(struct platform_device *pdev, struct device_node *parent)
 {
 	return rzv2h_icu_probe_common(pdev, parent, &rzv2h_hw_params);
@@ -771,7 +908,7 @@ static int rzv2h_icu_probe(struct platform_device *pdev, struct device_node *par
 
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzv2h_icu)
 IRQCHIP_MATCH("renesas,r9a09g047-icu", rzg3e_icu_probe)
-IRQCHIP_MATCH("renesas,r9a09g056-icu", rzv2h_icu_probe)
+IRQCHIP_MATCH("renesas,r9a09g056-icu", rzv2n_icu_probe)
 IRQCHIP_MATCH("renesas,r9a09g057-icu", rzv2h_icu_probe)
 IRQCHIP_PLATFORM_DRIVER_END(rzv2h_icu)
 MODULE_AUTHOR("Fabrizio Castro <fabrizio.castro.jz@renesas.com>");
-- 
2.52.0


