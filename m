Return-Path: <linux-renesas-soc+bounces-27864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMeKDnOCgmneVgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 00:19:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3D0DFA9F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 00:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7273C304808E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 23:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49055374194;
	Tue,  3 Feb 2026 23:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0xf5gJN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9F6329E43
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 23:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160717; cv=none; b=ZtVxR2dSoLOOJ3jR3Y8W9LU92Pdl0mE+efSjaeXU8cZ9p95WEv14/K1wCBx97QMGMDqv0G4FLLpQqfgW6UikqtebPAS4O2wtvgKv07s9AHmt+TKOmkGHxs7c1Qv8zObW1ghpiABJjfoeOqCnDwvfQ4wXElLf5u2uHZBrYtSt1SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160717; c=relaxed/simple;
	bh=1uF0wBkSjxeFSATeAkszaNl/BxV9vt5+gPDNPaKaTo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XprS3/FO7oEOFdQScbo93Cq8Wi+plOIlHhmtlPM7hzV1hUuA+80GKagKlJdy2lmNkH6WnERcxXaYZELQT/fEFcV9OwWRvyqhS9HY6fL7wnPB7+QkKcO3V52w02CWuB10qsmeJZTd8xx32HcpBY4mH+YLfcS5B8GOiEldvys4VBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0xf5gJN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fb2314f52so3663310f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 15:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770160713; x=1770765513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5hoJf68rQR7rnJWTnRUztO/z8AoqWtSofT0jabEpYg=;
        b=e0xf5gJNMBstCMedophYAmeF0kK3f8X2jc7Vk0360QTfAZd6VU5jgSa3FMbcRTy+IZ
         RK4ugBnEaYK0h5BdElAF/tt9bo2ltVZclFyKs1c4uayc0YgagVsnmnokbf30M9BiyKrB
         45aR/sBye9IYxkPjCuxAx8drht3SGfQK+dpv1O98t4WhAJzHSrpqla8EfLALokRMa1k/
         JPFvCyFd8487+qw7UadK1AuR7sjPElwntlniNCKXSpC2LY6LDPepnOi+Ph/CY8ENV/7s
         KiD/ozDNkl82oIQXRQao/Wu2l99kPHwBrnR0JF6v/BpuIHMLb6JUeGQPwBK3CrKQyNaG
         U9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160713; x=1770765513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/5hoJf68rQR7rnJWTnRUztO/z8AoqWtSofT0jabEpYg=;
        b=hm4kdw5c52dMxkpr/gKOtvIvlMBKCKDbCoUbGeyZq86/omL8qXsVRKsi9ZlJVT9c2e
         uAmfMUP1eNxvqFc+1rHHQjbBQyLFB9LELAB/it5dD2sdJX9uZ2ATKvebPRJH8OdWqf1P
         Pe0Op+noCL0lkSq1YoP/9CEMFe/F1qnkJvIQmrGi8ZG9ASjzbYjTmjrd3aXyQ/mpNvge
         l9dfObTlkZoO+sGP1093AHGtWIhVe9g3ggQUvN0yVOdxjHXFIYibTr9KGMoqLe9okklV
         pxEM8yhT2ScK+NeBgHploQtCb0VtIErupFhHMV2734mNFaPssK355g8uX3Z9DWxiupkc
         I0rw==
X-Forwarded-Encrypted: i=1; AJvYcCUnyXkSZsUDn8L3eWlU06/VlE/8ZCoGEwhr0usqYV00Y3z8WKCHdOpQrWpI788F9Z1stndtMpdX3x90819FX8qv7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVbCkq90V7CLxnhVRmZn9joe9msg04TGnRgneETxYqGxVllmfZ
	/LhQR6FXUaknBB7JUhYMEFK4WLzWOX8miHI5WVuTdxIMd+In3kVTUjVV
X-Gm-Gg: AZuq6aJNuy4DFpKxCrdkxJOAPfMEj9Pd0kkXuVjxd5mz9EnJ9BuJb6IwUEtxiV+zfCP
	zmaxI//2GbrstPpcGikS9vrl+bvR6Im+pYYp5xRhI83ZbQ/MgSiiAwGQhI84wgdPnZkNlYcDDXJ
	tuA1IplgX8cejfnFPq5uV05M93Zv6y7O/NrRbDPIFwit8Bk8r2mcaai/BYhGqrV+ewNocD2McHw
	ctIDZQsFb4I9SV8+7rZ4XAIc9AE8N9nJgooSXfKR9OO7wvkyhhWsKSfonh51V6qHdBMSf4HBv8a
	an6qNJALa/kDeoZfCUzdltKnBoZNVIZFydaw7RcX+I7EN6AlxcLKj3dkYXx8D3TGj7aajHS2UXF
	ncLOn6WP0Ici7oUlCwnWuLyTj8+1hgCaUI4oZSd5SrQzdl8v9Hpq46HQu/EoMYnXYrJsRkQzG0a
	Ew59zJ25jlGvX1XEQTXAADT0UoXqq7Iw7A1DVq4wxFmlzWNJRrDp9Vx/3jsZ8QM7W3+Qs11NH7/
	3y/Js+D43aa3B6EoNrzevuN
X-Received: by 2002:a05:6000:2387:b0:435:9522:2bc9 with SMTP id ffacd0b85a97d-43617e398c0mr1519895f8f.5.1770160712641;
        Tue, 03 Feb 2026 15:18:32 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:2e50:5c7f:afca:5f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180647aasm1739832f8f.41.2026.02.03.15.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 15:18:31 -0800 (PST)
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
Subject: [PATCH v2 5/6] irqchip/renesas-rzv2h: Add CA55 software interrupt support
Date: Tue,  3 Feb 2026 23:18:22 +0000
Message-ID: <20260203231823.208661-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27864-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: DB3D0DFA9F
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The Renesas RZ/V2H ICU provides a software interrupt register (ICU_SWINT)
that allows software to explicitly assert interrupts toward individual
CA55 cores. Writing BIT(n) to ICU_SWINT triggers the corresponding
interrupt.

Extend the RZ/V2H ICU IRQ domain to include CA55 software interrupts as
part of the hierarchical IRQ numbering, backed by the ICU_SWINT
register.

SW interrupts can now be triggered when GENERIC_IRQ_INJECTION is enabled.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Made CA55 SW interrupt as part of ICU IRQ domain.
- Implemented rzv2h_icu_irq_set_irqchip_state() to trigger SWINT.
- Updated commit message accordingly.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 89 ++++++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 6c7bbb04c6e4..a2ff7524889c 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -12,6 +12,7 @@
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/err.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/irq-renesas-rzv2h.h>
@@ -29,7 +30,10 @@
 #define ICU_TINT_START				(ICU_IRQ_LAST + 1)
 #define ICU_TINT_COUNT				32
 #define ICU_TINT_LAST				(ICU_TINT_START + ICU_TINT_COUNT - 1)
-#define ICU_NUM_IRQ				(ICU_TINT_LAST + 1)
+#define ICU_CA55_INT_START                      (ICU_TINT_LAST + 1)
+#define ICU_CA55_INT_COUNT                      4
+#define ICU_CA55_INT_LAST                       (ICU_CA55_INT_START + ICU_CA55_INT_COUNT - 1)
+#define ICU_NUM_IRQ                             (ICU_CA55_INT_LAST + 1)
 
 /* Registers */
 #define ICU_NSCNT				0x00
@@ -42,6 +46,7 @@
 #define ICU_TSCLR				0x24
 #define ICU_TITSR(k)				(0x28 + (k) * 4)
 #define ICU_TSSR(k)				(0x30 + (k) * 4)
+#define ICU_SWINT				0x130
 #define ICU_DMkSELy(k, y)			(0x420 + (k) * 0x20 + (y) * 4)
 #define ICU_DMACKSELk(k)			(0x500 + (k) * 4)
 
@@ -248,6 +253,30 @@ static void rzv2h_icu_irq_enable(struct irq_data *d)
 	irq_chip_enable_parent(d);
 }
 
+static int rzv2h_icu_irq_set_irqchip_state(struct irq_data *d,
+					   enum irqchip_irq_state which,
+					   bool state)
+{
+	unsigned int hwirq = irqd_to_hwirq(d);
+	struct rzv2h_icu_priv *priv;
+	unsigned int bit;
+
+	if (hwirq < ICU_CA55_INT_START || hwirq > ICU_CA55_INT_LAST ||
+	    which != IRQCHIP_STATE_PENDING)
+		return irq_chip_set_parent_state(d, which, state);
+
+	if (!state)
+		return 0;
+
+	priv = irq_data_to_priv(d);
+	bit = BIT(hwirq - ICU_CA55_INT_START);
+
+	guard(raw_spinlock)(&priv->lock);
+	/* Trigger the software interrupt */
+	writel_relaxed(bit, priv->base + ICU_SWINT);
+	return 0;
+}
+
 static int rzv2h_nmi_set_type(struct irq_data *d, unsigned int type)
 {
 	struct rzv2h_icu_priv *priv = irq_data_to_priv(d);
@@ -429,6 +458,7 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 
 static int rzv2h_icu_set_type(struct irq_data *d, unsigned int type)
 {
+	unsigned int gic_type = IRQ_TYPE_LEVEL_HIGH;
 	unsigned int hw_irq = irqd_to_hwirq(d);
 	int ret;
 
@@ -445,6 +475,11 @@ static int rzv2h_icu_set_type(struct irq_data *d, unsigned int type)
 		/* TINT */
 		ret = rzv2h_tint_set_type(d, type);
 		break;
+	case ICU_CA55_INT_START ... ICU_CA55_INT_LAST:
+		/* CA55 Software Interrupts have EDGE_RISING type */
+		gic_type = IRQ_TYPE_EDGE_RISING;
+		ret = 0;
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -452,7 +487,7 @@ static int rzv2h_icu_set_type(struct irq_data *d, unsigned int type)
 	if (ret)
 		return ret;
 
-	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
+	return irq_chip_set_type_parent(d, gic_type);
 }
 
 static int rzv2h_irqc_irq_suspend(void *data)
@@ -501,7 +536,7 @@ static const struct irq_chip rzv2h_icu_chip = {
 	.irq_disable		= rzv2h_icu_irq_disable,
 	.irq_enable		= rzv2h_icu_irq_enable,
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
-	.irq_set_irqchip_state	= irq_chip_set_parent_state,
+	.irq_set_irqchip_state	= rzv2h_icu_irq_set_irqchip_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
 	.irq_set_type		= rzv2h_icu_set_type,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
@@ -571,6 +606,50 @@ static int rzv2h_icu_parse_interrupts(struct rzv2h_icu_priv *priv, struct device
 	return 0;
 }
 
+static irqreturn_t rzv2h_icu_swint_irq(int irq, void *data)
+{
+	u8 cpu = *(u8 *)data;
+
+	pr_debug("SWINT interrupt for CA55 core %u\n", cpu);
+	return IRQ_HANDLED;
+}
+
+static int rzv2h_icu_setup_irqs(struct platform_device *pdev,
+				struct irq_domain *irq_domain)
+{
+	bool irq_inject = IS_ENABLED(CONFIG_GENERIC_IRQ_INJECTION);
+	static const char * const rzv2h_swint_names[] = {
+		"int-ca55-0", "int-ca55-1",
+		"int-ca55-2", "int-ca55-3",
+	};
+	static const u8 swint_idx[] = { 0, 1, 2, 3 };
+	struct device *dev = &pdev->dev;
+	struct irq_fwspec fwspec;
+	unsigned int virq;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < ICU_CA55_INT_COUNT && irq_inject; i++) {
+		fwspec.fwnode = irq_domain->fwnode;
+		fwspec.param_count = 2;
+		fwspec.param[0] = ICU_CA55_INT_START + i;
+		fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
+
+		virq = irq_create_fwspec_mapping(&fwspec);
+		if (!virq)
+			return dev_err_probe(dev, -EINVAL, "failed to create IRQ mapping for %s\n",
+					     rzv2h_swint_names[i]);
+
+		ret = devm_request_irq(dev, virq, rzv2h_icu_swint_irq, 0, dev_name(dev),
+				       (void *)&swint_idx[i]);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to request %s IRQ\n",
+					     rzv2h_swint_names[i]);
+	}
+
+	return 0;
+}
+
 static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_node *parent,
 				  const struct rzv2h_hw_info *hw_info)
 {
@@ -626,6 +705,10 @@ static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
 
 	register_syscore(&rzv2h_irqc_syscore);
 
+	ret = rzv2h_icu_setup_irqs(pdev, irq_domain);
+	if (ret)
+		goto pm_put;
+
 	/*
 	 * coccicheck complains about a missing put_device call before returning, but it's a false
 	 * positive. We still need dev after successfully returning from this function.
-- 
2.52.0


