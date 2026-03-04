Return-Path: <linux-renesas-soc+bounces-28761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGEKO/kYqGmgnwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:35:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A2C1FF11B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90C8F30C738B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 11:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B117436AB5E;
	Wed,  4 Mar 2026 11:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zn6nfJ2y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FC0397697
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 11:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624006; cv=none; b=BOOL36+DAtj2Rxq/+51yb0R4Iw+dSX5HG6rHvM7hN6f4h31CeZBtrKu1FVxYkl4vuCSY3DXmT66QHDMffmgtxsGboZimQtTrqBv0nSMNwVbhejm8J7KA/hE8tar42aZckx+VTfWJ3Rep3PAu00S3j20PzRSZ1HfmjJvxzXn0U8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624006; c=relaxed/simple;
	bh=3xkbQW3sge6955jlDP4fk4wn/tpg3cJ4Trq8w1fz4m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EebkQbpcl5aJ5cdi5nYaaZYFhlr0iWkB2F2JFTyE0i7WLYcv/PO6IWAaFA93Nny2G0OWN3iyuxMYD2/lheNT94x2OpMb3pnBAOSIxfFR6HNccQQ1f65+W8TUlOmGV7BiHOTuTUG27r73Vbnr2odfkJvtjLtbQpkxMfo/KPf4xwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zn6nfJ2y; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso2504080f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 03:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772624003; x=1773228803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uv6sFxzOjwXNb1hjdzGJqfDIXYZQFW56Kr84CYUtS84=;
        b=Zn6nfJ2yFqWjjlpc0C6CJvBrmhVniTXgH8ETHgeRYdgPAj2dP4QBi8M5JMzCKZpkYb
         U5IFslRFvuRYA6wk/D0yAB+wRLKRodzL05mr6jE9wjd8z2qolTme0vZyRYBmAEyg+sAu
         pdZclfLj9qKgkZvrP7GK7t52VCphT7ryW6q913Wi46rx9hCt0EUixCMqO+bXFQS3Snpy
         zlaOz5wC7KoNDEgIEfTzMFGuEZBRdNw6wvEWbARDCsH5KNH36f1OsWFsYD3hF4XJhkkI
         x11LW91a9GWW6/RcjH1uQF7sm26ke65hZWNPnwGOLBE73DcxcfCKG+yaPPLqdgZ63lnW
         JEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772624003; x=1773228803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uv6sFxzOjwXNb1hjdzGJqfDIXYZQFW56Kr84CYUtS84=;
        b=Pll0xRSY24LcBRRLLPehJUL8043ojzGgGBX6fKhJaFdm9ka/fdohjZJw3cQhodqMjK
         C1NWLIDql/EOcfb+oVFxK2IUGNYUEBVmsPBlSlAoYPdXY1hzA8bwaaOXoq4WyUzUJcY+
         fjS/V3HqvnaY95ceIWEq9tD1rhNmgee9Fqkvco+XmxCfpIiZuWINyX7c/MCXplSDBTy4
         CHv5q1z8hcne1bewbeEWmsNQv6ds0Ki6Z131CbNuG8BPNrJqwkajxgwnI/vP6YHz3FC/
         KAcsUDEXMwmRV+aiccUElj3Dlf6XZPIUQbe7hAcj2OOZXuVc5W9UBwo1W7QE5LnHH7GO
         WV/A==
X-Forwarded-Encrypted: i=1; AJvYcCUSCceazQPfV81a6ATimNYVSoRneqQ0yPid83gND7gj9Rw6SgzxI6XH40D9DetZJjogplOMw9h6b3l/lYM/jsH2Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjbkEQ0Ez78my92Kt6Q/UC/xXhd4yctuvSHZ6ozOTm+oLoP3cn
	/iO0GlvPzrFhRoah0XIAp29n7BUTqNZtDFTCfEVaRXmX4We0mLISkact
X-Gm-Gg: ATEYQzwGBnNdD3pxuUvkZchNbL5DM9Q6APbYuhxQ0uNywlwZqGs/v6YHRf2RmHSj3mH
	D2qZkdMjMVdXZpVcDQ9t52FvPlGBsalI/NE5sOmjSoCkoCzX6TAXFG7oKSF5LCJZZ8UByHCkv6P
	4d9TnnnxuEOLDHLFCNK3IXzZjuMpr2JfMcavwRDV1DUrwrhxxcl5M/JI9Y2bkolDxFZSdrQ2kHS
	p72Wskqfwd8suAjOj12OwpKjdPl8/pV96QDn/XKlIoH75w5FiQHnKdtMDC0LYwZvT5TyzgTJH8r
	SW4ToLxOkjAmBLKDLspphFlj519kgyXGBkcT4Z115Amc2JIfzuNBOYhbZ5a6BFmgLChUMo9QSXu
	/598T1DYBMln+F+PxEXFsDdw2eJTJ8FZdgLrkUZYT9b8BpRyToawt3KUH29SwYPH9TTuH0QNJLe
	qfl3h3i+c2GIAj6f4F4W5RQQ6CxgfZ5NqKBnW84jxuTtmVo+aAMxTM4gaEqRMF+pqOxSfDW2bBR
	VDQ709izNau4iEEqu/R5e/so9MQyiixOL+xyAoMh943Zm4=
X-Received: by 2002:a5d:64c8:0:b0:439:c65c:2b76 with SMTP id ffacd0b85a97d-439c800fed8mr3020930f8f.49.1772624002787;
        Wed, 04 Mar 2026 03:33:22 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:bddd:d1ed:d1ee:a876])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm27345379f8f.18.2026.03.04.03.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 03:33:22 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 6/7] irqchip/renesas-rzv2h: Add CA55 software interrupt support
Date: Wed,  4 Mar 2026 11:33:16 +0000
Message-ID: <20260304113317.129339-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304113317.129339-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260304113317.129339-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 65A2C1FF11B
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
	TAGGED_FROM(0.00)[bounces-28761-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,pengutronix.de,gmail.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/V2H ICU exposes four software-triggerable interrupts targeting
the CA55 cores (int-ca55-0 to int-ca55-3). Add support for these
interrupts to enable IRQ injection via the generic IRQ injection
framework.

Add a dedicated rzv2h_icu_swint_chip irq_chip for the CA55 region and
implement rzv2h_icu_irq_set_irqchip_state() to handle software interrupt
injection.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- Dropped gaurd from rzv2h_icu_swint_set_irqchip_state() as we just did
  a single writel

v3->v4:
- Made a seprate irq chip for SWINT

v2->v3:
- Replaced pr_debug with pr_info in the SWINT handler to ensure
  visibility of the message.

v1->v2:
- Made CA55 SW interrupt as part of ICU IRQ domain.
- Implemented rzv2h_icu_irq_set_irqchip_state() to trigger SWINT.
- Updated commit message accordingly.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 95 ++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 38d48632a5c2..a75ff3bb3846 100644
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
+#define ICU_CA55_INT_START			(ICU_TINT_LAST + 1)
+#define ICU_CA55_INT_COUNT			4
+#define ICU_CA55_INT_LAST			(ICU_CA55_INT_START + ICU_CA55_INT_COUNT - 1)
+#define ICU_NUM_IRQ				(ICU_CA55_INT_LAST + 1)
 
 /* Registers */
 #define ICU_NSCNT				0x00
@@ -42,6 +46,7 @@
 #define ICU_TSCLR				0x24
 #define ICU_TITSR(k)				(0x28 + (k) * 4)
 #define ICU_TSSR(k)				(0x30 + (k) * 4)
+#define ICU_SWINT				0x130
 #define ICU_DMkSELy(k, y)			(0x420 + (k) * 0x20 + (y) * 4)
 #define ICU_DMACKSELk(k)			(0x500 + (k) * 4)
 
@@ -431,6 +436,27 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
 }
 
+static int rzv2h_icu_swint_set_irqchip_state(struct irq_data *d, enum irqchip_irq_state which,
+					     bool state)
+{
+	unsigned int hwirq = irqd_to_hwirq(d);
+	struct rzv2h_icu_priv *priv;
+	unsigned int bit;
+
+	if (which != IRQCHIP_STATE_PENDING)
+		return irq_chip_set_parent_state(d, which, state);
+
+	if (!state)
+		return 0;
+
+	priv = irq_data_to_priv(d);
+	bit = BIT(hwirq - ICU_CA55_INT_START);
+
+	/* Trigger the software interrupt */
+	writel_relaxed(bit, priv->base + ICU_SWINT);
+	return 0;
+}
+
 static int rzv2h_irqc_irq_suspend(void *data)
 {
 	struct rzv2h_irqc_reg_cache *cache = &rzv2h_icu_data->cache;
@@ -520,6 +546,23 @@ static const struct irq_chip rzv2h_icu_nmi_chip = {
 				  IRQCHIP_SKIP_SET_WAKE,
 };
 
+static const struct irq_chip rzv2h_icu_swint_chip = {
+	.name			= "rzv2h-icu",
+	.irq_eoi		= irq_chip_eoi_parent,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_disable		= irq_chip_disable_parent,
+	.irq_enable		= irq_chip_enable_parent,
+	.irq_get_irqchip_state	= irq_chip_get_parent_state,
+	.irq_set_irqchip_state	= rzv2h_icu_swint_set_irqchip_state,
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
@@ -549,6 +592,8 @@ static int rzv2h_icu_alloc(struct irq_domain *domain, unsigned int virq, unsigne
 		chip = &rzv2h_icu_tint_chip;
 	} else if (hwirq >= ICU_IRQ_START && hwirq <= ICU_IRQ_LAST) {
 		chip = &rzv2h_icu_irq_chip;
+	} else if (hwirq >= ICU_CA55_INT_START && hwirq <= ICU_CA55_INT_LAST) {
+		chip = &rzv2h_icu_swint_chip;
 	} else {
 		chip = &rzv2h_icu_nmi_chip;
 	}
@@ -586,6 +631,50 @@ static int rzv2h_icu_parse_interrupts(struct rzv2h_icu_priv *priv, struct device
 	return 0;
 }
 
+static irqreturn_t rzv2h_icu_swint_irq(int irq, void *data)
+{
+	u8 cpu = *(u8 *)data;
+
+	pr_info("SWINT interrupt for CA55 core %u\n", cpu);
+	return IRQ_HANDLED;
+}
+
+static int rzv2h_icu_setup_irqs(struct platform_device *pdev, struct irq_domain *irq_domain)
+{
+	bool irq_inject = IS_ENABLED(CONFIG_GENERIC_IRQ_INJECTION);
+	static const char * const rzv2h_swint_names[] = {
+		"int-ca55-0", "int-ca55-1",
+		"int-ca55-2", "int-ca55-3",
+	};
+	static const u8 swint_idx[] = { 0, 1, 2, 3 };
+	struct device *dev = &pdev->dev;
+	struct irq_fwspec fwspec;
+	unsigned int i, virq;
+	int ret;
+
+	for (i = 0; i < ICU_CA55_INT_COUNT && irq_inject; i++) {
+		fwspec.fwnode = irq_domain->fwnode;
+		fwspec.param_count = 2;
+		fwspec.param[0] = ICU_CA55_INT_START + i;
+		fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
+
+		virq = irq_create_fwspec_mapping(&fwspec);
+		if (!virq) {
+			return dev_err_probe(dev, -EINVAL, "failed to create IRQ mapping for %s\n",
+					     rzv2h_swint_names[i]);
+		}
+
+		ret = devm_request_irq(dev, virq, rzv2h_icu_swint_irq, 0, dev_name(dev),
+				       (void *)&swint_idx[i]);
+		if (ret) {
+			return dev_err_probe(dev, ret, "Failed to request %s IRQ\n",
+					     rzv2h_swint_names[i]);
+		}
+	}
+
+	return 0;
+}
+
 static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_node *parent,
 				  const struct rzv2h_hw_info *hw_info)
 {
@@ -640,6 +729,10 @@ static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
 
 	register_syscore(&rzv2h_irqc_syscore);
 
+	ret = rzv2h_icu_setup_irqs(pdev, irq_domain);
+	if (ret)
+		goto pm_put;
+
 	/*
 	 * coccicheck complains about a missing put_device call before returning, but it's a false
 	 * positive. We still need dev after successfully returning from this function.
-- 
2.53.0


