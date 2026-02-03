Return-Path: <linux-renesas-soc+bounces-27865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLmABKmCgmneVgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 00:20:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7180DFACE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 00:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA20830B0001
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 23:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCD5376BCC;
	Tue,  3 Feb 2026 23:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3/Kco8Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AB936165E
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 23:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160717; cv=none; b=VEjhklUIiKZzDrAQ2qlIkeUAhOBcwSeI7NznfNvv8NsaEEBayxpnGQitRXVoWfRM9hiXgKJfkcNwB5CnvrdklAAOzfP20g+bHulHIWAnDMZH9o2SDKow3nxhdWqpqNMGZWtfdHqdjIE5CdJ2HB4KiEQNlrQlWBT/qQ14w3xrXaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160717; c=relaxed/simple;
	bh=+8PL5Ixzxv6q40l8iUL9vZ9LOzsZmNxHJKAkQAAjwYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kxq2lOB6KMYisJsQPyR1l2WQOxaqB0P3av9JzuRJ4wZqQsRLhYrzgOYpcxzmdrr18O6vWSgrK9mU+aTORek6qQbuJyaHOPlflAqWz3CfprYQdNjpY7O6CLy/X+GsZ3+TVYGLf6YFezsEVykkeyHD5v3ah3r1nXjaciWCrYaGKzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3/Kco8Q; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso52231535e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 15:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770160714; x=1770765514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BShUaX58BJSoQ+jnQUrTyp17jL8XdIs4C5TLsuymRCo=;
        b=O3/Kco8QilzA5fua2h1tbqVnNgW03m/PjJ+ompr+xAAqPBDRkdp6GIKJfEE+JRqIl4
         lCbbR7B1Oup2CSXHRs9NDJM2S9A1l9Y0azuy/ncTKHXoKSfrT5uuLSw99J3r53rZhyvs
         xJPmw+0ci9vjk9z5T0lzFcU1gwd3H3RnmmnB7MDCpnfMY93kVGDR0EVQF4fDegitw8Iy
         ngfLDzKdkVY/GhMWmHhB9wiYw/qrzBDnxyAQtX0/MalQnmllU6Y53IU/GCuTXN4QPxFg
         LpSsIBnuN844C4Mqt5PWuqbq2l2nJ8Xw5bAZkQOR09OuAa7GccZ5e0Q3kgRJHHmr9MpX
         m1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160714; x=1770765514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BShUaX58BJSoQ+jnQUrTyp17jL8XdIs4C5TLsuymRCo=;
        b=joSMgcplTMAhBmmYkdwuCuzQRCOEswYd3KK57UWYtzYTEJgYPamfE/VKpMOEb4TXdp
         eTR/tECPuj2cHO8VdJLaTMptWL9bYGfGWKH9IAoLw6/yAGdP+W904vuktFhBhMwqaVYb
         18pUQuICaGWVWea+Hu8FIia+SKSVN2tP2Ye0CcqLRoYd5IgUo0++oYjfoX6Y1HZ8qVvm
         3F/mj0m5rrDCqjnTwpqiT/THgL9DLPVdDFzi1LjG2QMCFtSGhnoJi6QjG2ThhV1Bkn4x
         fPjSuGTiZcFBfl4SmYUr0jQxU/dsZUQomxO7+g+Oys95UetNfICLo2VZCo+VItEDHTVm
         cMSg==
X-Forwarded-Encrypted: i=1; AJvYcCWkxdmko3bOq0SOvbH/yYQTahDBK5IM6Lupt3VIY+P/nPYTm/nR0J9i5Ho5bsW+1sKSX/D0wxajpAWBx07nmqv86g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIm+OvGFNleEbKCAMtlqwlgq1wrbOtJvFvZ7P/giBV78SUqVA8
	kPb+bB12t7xGHs8OfQwh28Zl4+vjKmqfbpRXYekf+z7Mklr0R/X8SJl3
X-Gm-Gg: AZuq6aIe5jYk5IBO1skVatl2exvTSDPzwDUtlAQ/K1xjPJhEUX71aKg6BrJnAyAT7ge
	iKgdW++AVodMBeEmymICcggY/4G+lfBHQzluaBB8I+uiay/pclz7QHkGh3fJCTE7uMpalpEAXUJ
	FgCo+BGMt/AiCcydM9QUeXIJoXkRog17/nesEWVMyNIBq/xhgjnHJAV0e5qwyYXxncB/RUQsDdp
	SBw6Dmv0H+nvv2Rms/rJUDwbgkmEVN+AeAG6qA2Gi7fah0xztq4A+qj+a3kPWKrHHnx1uNaoDCj
	KDLD3RP9kJMpO9lJPHhPj9dArtMC8ljcB8qcR2AwatDT0zF91uwMuLrBOVHd1teiaXuW+lxW9iZ
	il/ldLvDbj1SfcZdBd6uC8KmSFa46NQd8vo8dseOMjX93UF1SgkVsiThmPzwojeXGRYbjpYZNcE
	+Hb/LkKmK+pUGAqCbscAVZV15Z3rYgO8sY1eRrQWsdZyjH7pW6W634IGIJ2ye2J+s9vJ0VZkPvE
	bW03seYSpDqWGQjwNB/pUvb
X-Received: by 2002:a05:600c:1c1e:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-4830e92a706mr17809735e9.3.1770160713792;
        Tue, 03 Feb 2026 15:18:33 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:2e50:5c7f:afca:5f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180647aasm1739832f8f.41.2026.02.03.15.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 15:18:32 -0800 (PST)
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
Subject: [PATCH v2 6/6] irqchip/renesas-rzv2h: Handle ICU error IRQ and add SWPE trigger
Date: Tue,  3 Feb 2026 23:18:23 +0000
Message-ID: <20260203231823.208661-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27865-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: B7180DFACE
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
v1->v2:
- Made Error interrupt as part of ICU IRQ domain.
- Updated rzv2h_icu_irq_set_irqchip_state() to trigger pseudo interrupt.
- Updated commit message accordingly.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 149 ++++++++++++++++++++++++++--
 1 file changed, 143 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index a2ff7524889c..3937a857af8b 100644
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
@@ -606,6 +653,48 @@ static int rzv2h_icu_parse_interrupts(struct rzv2h_icu_priv *priv, struct device
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
+		pr_debug("rzv2h-icu: BUS error k=%u status=0x%08x\n", k, st);
+	}
+
+	/* 2) ECC RAM errors (EREISR0..X) */
+	for (k = hw_info->ecc_start; k <= hw_info->ecc_end; k++) {
+		st = readl(base + ICU_EREISR(k));
+		if (!st)
+			continue;
+
+		writel_relaxed(st, base + ICU_ERCLR(k));
+		pr_debug("rzv2h-icu: ECC error k=%u status=0x%08x\n", k, st);
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
+		pr_debug("rzv2h-icu: IP/CA55 error k=%u status=0x%08x\n", k, st);
+	}
+
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t rzv2h_icu_swint_irq(int irq, void *data)
 {
 	u8 cpu = *(u8 *)data;
@@ -617,12 +706,15 @@ static irqreturn_t rzv2h_icu_swint_irq(int irq, void *data)
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
@@ -647,6 +739,34 @@ static int rzv2h_icu_setup_irqs(struct platform_device *pdev,
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
 
@@ -752,12 +872,24 @@ static const struct rzv2h_hw_info rzg3e_hw_params = {
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
@@ -765,6 +897,11 @@ static int rzg3e_icu_probe(struct platform_device *pdev, struct device_node *par
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
@@ -772,7 +909,7 @@ static int rzv2h_icu_probe(struct platform_device *pdev, struct device_node *par
 
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzv2h_icu)
 IRQCHIP_MATCH("renesas,r9a09g047-icu", rzg3e_icu_probe)
-IRQCHIP_MATCH("renesas,r9a09g056-icu", rzv2h_icu_probe)
+IRQCHIP_MATCH("renesas,r9a09g056-icu", rzv2n_icu_probe)
 IRQCHIP_MATCH("renesas,r9a09g057-icu", rzv2h_icu_probe)
 IRQCHIP_PLATFORM_DRIVER_END(rzv2h_icu)
 MODULE_AUTHOR("Fabrizio Castro <fabrizio.castro.jz@renesas.com>");
-- 
2.52.0


