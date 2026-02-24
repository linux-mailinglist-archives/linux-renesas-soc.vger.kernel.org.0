Return-Path: <linux-renesas-soc+bounces-28442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KcpHJ3qnWlDSgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 19:14:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E29FC18B1D0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 19:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B33D3164EEC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 18:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BD53BFE2F;
	Tue, 24 Feb 2026 18:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEhGFpS1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7583F3AE6F2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 18:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956024; cv=none; b=g7ritgH6m8nTOrM7nOgbomwvp//z3JieXttgMLL0XoMaMITlAaUXCX6Jk9Cq1aSC3NGg2Fg8XtIC80tOeObM0r78Mh2e4r1/yKi+dN3Gl3q2yKdM7P0yIR4/Dyx6G1hChaPeWRAM4TngKzKlvQwnilR41BveOUUTUCAtsQr/kog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956024; c=relaxed/simple;
	bh=nVaHVEZYyKcskZpgE7CVGuB1f3aog8ZC/SoE0H7ZI4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DkYNXLXbWryHmUvTs9L+Lyes7A65RycWmRSL+8satVirh1/udTMt5ScCH4eNrlLoKGW7Dd9nxy7QeM1fB3Lt7cdgAg+y0xvtAV4VGNVIP486PYrjAmMYu7iKJiNTYvW6cxg4LWZCp73m7pWWt1h7Ggu1KQvJUuJmErBt5Ra6Ui8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEhGFpS1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4833115090dso56541485e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 10:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771956021; x=1772560821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvSseRSGBJdm9csJK8PAxwMGfjNVGX90ac0haKfWANg=;
        b=aEhGFpS1k+ENEGvfXfoYeIy5WF8yGCFvfPnh2SdNtxBPUKntNZETuPDF6I3SoapXSE
         UHSkl+ovlpcmRIu3/MNs4/f8sz3JARxxWX3P573u0EZ2OMUCqzNTHFSY6pdy/HeppAdG
         /FXOEIspJWjQCicZTwe87Y0MisdUcXerAu7wRs3TM1ffMQidDDBgcR/dOmhhNE/GHSla
         OaKgqLr/VbEX92qdbNSoq4llLJ43q+k9yeiQ/4WVro6BqYWRLLSdBpFNDb56bPIcIwxt
         9FbBzsjVck/wP33RG01bSL/uanl0EyRz74FcIh75QJN+PbXxcHMk3oLsFZlZmW3CdTru
         uUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771956021; x=1772560821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zvSseRSGBJdm9csJK8PAxwMGfjNVGX90ac0haKfWANg=;
        b=w38PvxJDiD6BSEJeeilNJM+fOcX+vlCi9niWrph1TcnAwnUTx/55/gorqgtNP4VwZT
         uwC3I2utoSPnCzgqfy1v0t0MQszD9kKG2nCU9QaDYhMO2e5iGtkA12tP2ekr7McX8Nw8
         AMAay1VFyXMSB7ah/EBE9FVWbRj/CXtGPWZ/n/LJ/rnT/GjIAUyTlTk7ndR55av3JF0T
         wZlK76sbHf/wgjVv0LmrpjWrmbr0fSwB2QXY5B+ihLqF2UOGjBw+1B+ZOC5t4YTTe4NS
         KRgh10OEGC1uKu+EK1VdAyYyAVs5F1g+HZXyLvxSbDdb/U0Ubo6FWqlBZ/ShTreE6272
         wBuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGjTCZVwt522bKOq5iSbEHntlkRncGwq0QPlcajbFjcJIeTJM6kq2ixo5DoxGoJGeSBiH7/UrQTxm21QbHeCXtTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YysAYWtPCFf/s1DBhHUqQI/KOU2esa0hFIc6xwXbOBnKrkZu5dG
	AvrGZmT/qa+niDzg/biykl8QLnDZKBYhKNjN4Rx9KyUQfu66uxeT6mCy
X-Gm-Gg: AZuq6aIjN1WlWsSp4t7XjS1SbUSxPeloo1YZAL27zUF4mU/wMcTYvKiYkYbpYJPowGG
	wrf+QhsEhkyyAD+Gz/w4rCbTF4/PnR6bsjvaqZFVYE7QlfDqMs5hlZqJdA2KxgPNVmOK23r3/XT
	araJyRPpNMOp821+TEmFqkj/x/14Fzz60erwyVw+8CQUUvJV3qHfYOhNkaxO0C10OLHg0iRslGh
	yTtGfPiUFromO4EqPDKFk8RJZpEfiGrYs6fo3/YP4YMUI8vuX0GQlpx7kEnQVfHwVW6VEx+LAXu
	Jiv5PdCGlXsqzV5ZqF19aA2wiBa4ZM7+5lPJWPv3/tmsHzXJscv+h5Nma/FscUpoKYl9zqBfFR3
	7HpfpmBt5gsOosS+jH8vsW8QM4XGJHNilBMX32VJFFz7Ozr5IAk1NdVMFefKd47wLRWf0xcAdBB
	DvWxXNFMFDn837BL/71MKE9/GhksooQumzOnaF5updkCTB4zBr1g6HCmTKa+FSzkvcOsi/+U/Oc
	d38Y6pOd2ahHPUF4fBGAdp/eTPbIGsiWWVUMsgmgGP0Gfg=
X-Received: by 2002:a05:600c:6206:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-483a95b6debmr207076615e9.6.1771956020578;
        Tue, 24 Feb 2026 10:00:20 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:87da:e3e9:a9bf:6f1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd72bd66sm13064095e9.11.2026.02.24.10.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 10:00:20 -0800 (PST)
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
Subject: [PATCH v4 7/7] irqchip/renesas-rzv2h: Handle ICU error IRQ and add SWPE trigger
Date: Tue, 24 Feb 2026 17:56:18 +0000
Message-ID: <20260224175618.3160270-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224175618.3160270-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260224175618.3160270-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-28442-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: E29FC18B1D0
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Handle the RZ/V2H ICU error interrupt to help diagnose latched bus,
ECC RAM, and CA55/IP error conditions.

Support error injection via ICU_SWPE to allow testing the pseudo error
error interrupts.

Account for SoC differences in ECC RAM error register coverage so the
handler only iterates over valid ECC status/clear banks, and route the
RZ/V2N compatible to a probe path with the correct ECC range while
keeping the existing RZ/V2H and RZ/G3E handling.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Made a seprate irq chip for SWPE

v2->v3:
- Updated pr_debug to pr_info in the error IRQ handler to ensure
  visibility of the messages.

v1->v2:
- Made Error interrupt as part of ICU IRQ domain.
- Updated rzv2h_icu_irq_set_irqchip_state() to trigger pseudo interrupt.
- Updated commit message accordingly.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 164 +++++++++++++++++++++++++++-
 1 file changed, 162 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 235eb9dc6126..b7074982e572 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -33,7 +33,10 @@
 #define ICU_CA55_INT_START			(ICU_TINT_LAST + 1)
 #define ICU_CA55_INT_COUNT			4
 #define ICU_CA55_INT_LAST			(ICU_CA55_INT_START + ICU_CA55_INT_COUNT - 1)
-#define ICU_NUM_IRQ				(ICU_CA55_INT_LAST + 1)
+#define ICU_ERR_INT_START			(ICU_CA55_INT_LAST + 1)
+#define ICU_ERR_INT_COUNT			1
+#define ICU_ERR_INT_LAST			(ICU_ERR_INT_START + ICU_ERR_INT_COUNT - 1)
+#define ICU_NUM_IRQ				(ICU_ERR_INT_LAST + 1)
 
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
@@ -458,6 +477,37 @@ static int rzv2h_icu_swint_set_irqchip_state(struct irq_data *d, enum irqchip_ir
 	guard(raw_spinlock)(&priv->lock);
 	/* Trigger the software interrupt */
 	writel_relaxed(bit, priv->base + ICU_SWINT);
+
+	return 0;
+}
+
+static int rzv2h_icu_swpe_set_irqchip_state(struct irq_data *d, enum irqchip_irq_state which,
+					    bool state)
+{
+	struct rzv2h_icu_priv *priv;
+	unsigned int bit;
+	static u8 swpe;
+
+	if (which != IRQCHIP_STATE_PENDING)
+		return irq_chip_set_parent_state(d, which, state);
+
+	if (!state)
+		return 0;
+
+	priv = irq_data_to_priv(d);
+
+	bit = BIT(swpe);
+	/*
+	 * SWPE has 16 bits; the bit position is rotated on each trigger
+	 * and wraps around once all bits have been used.
+	 */
+	if (++swpe >= ICU_SWPE_NUM)
+		swpe = 0;
+
+	guard(raw_spinlock)(&priv->lock);
+	/* Trigger the pseudo error interrupt */
+	writel_relaxed(bit, priv->base + ICU_SWPE);
+
 	return 0;
 }
 
@@ -567,6 +617,23 @@ static const struct irq_chip rzv2h_icu_swint_chip = {
 				  IRQCHIP_SKIP_SET_WAKE,
 };
 
+static const struct irq_chip rzv2h_icu_swpe_err_chip = {
+	.name			= "rzv2h-icu",
+	.irq_eoi		= irq_chip_eoi_parent,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_disable		= irq_chip_disable_parent,
+	.irq_enable		= irq_chip_enable_parent,
+	.irq_get_irqchip_state	= irq_chip_get_parent_state,
+	.irq_set_irqchip_state	= rzv2h_icu_swpe_set_irqchip_state,
+	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.irq_set_type		= irq_chip_set_type_parent,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.flags			= IRQCHIP_MASK_ON_SUSPEND |
+				  IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE,
+};
+
 static int rzv2h_icu_alloc(struct irq_domain *domain, unsigned int virq, unsigned int nr_irqs,
 			   void *arg)
 {
@@ -598,6 +665,8 @@ static int rzv2h_icu_alloc(struct irq_domain *domain, unsigned int virq, unsigne
 		chip = &rzv2h_icu_irq_chip;
 	} else if (hwirq >= ICU_CA55_INT_START && hwirq <= ICU_CA55_INT_LAST) {
 		chip = &rzv2h_icu_swint_chip;
+	} else if (hwirq >= ICU_ERR_INT_START && hwirq <= ICU_ERR_INT_LAST) {
+		chip = &rzv2h_icu_swpe_err_chip;
 	} else {
 		chip = &rzv2h_icu_nmi_chip;
 	}
@@ -635,6 +704,48 @@ static int rzv2h_icu_parse_interrupts(struct rzv2h_icu_priv *priv, struct device
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
@@ -645,12 +756,15 @@ static irqreturn_t rzv2h_icu_swint_irq(int irq, void *data)
 
 static int rzv2h_icu_setup_irqs(struct platform_device *pdev, struct irq_domain *irq_domain)
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
 	unsigned int i, virq;
@@ -676,6 +790,35 @@ static int rzv2h_icu_setup_irqs(struct platform_device *pdev, struct irq_domain
 		}
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
+	if (!virq) {
+		return dev_err_probe(dev, -EINVAL, "failed to create IRQ mapping for %s\n",
+				     icu_err);
+	}
+
+	ret = devm_request_irq(dev, virq, rzv2h_icu_error_irq, 0, dev_name(dev), rzv2h_icu_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request %s IRQ\n", icu_err);
+
 	return 0;
 }
 
@@ -780,12 +923,24 @@ static const struct rzv2h_hw_info rzg3e_hw_params = {
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
@@ -793,6 +948,11 @@ static int rzg3e_icu_probe(struct platform_device *pdev, struct device_node *par
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
@@ -800,7 +960,7 @@ static int rzv2h_icu_probe(struct platform_device *pdev, struct device_node *par
 
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzv2h_icu)
 IRQCHIP_MATCH("renesas,r9a09g047-icu", rzg3e_icu_probe)
-IRQCHIP_MATCH("renesas,r9a09g056-icu", rzv2h_icu_probe)
+IRQCHIP_MATCH("renesas,r9a09g056-icu", rzv2n_icu_probe)
 IRQCHIP_MATCH("renesas,r9a09g057-icu", rzv2h_icu_probe)
 IRQCHIP_PLATFORM_DRIVER_END(rzv2h_icu)
 MODULE_AUTHOR("Fabrizio Castro <fabrizio.castro.jz@renesas.com>");
-- 
2.53.0


