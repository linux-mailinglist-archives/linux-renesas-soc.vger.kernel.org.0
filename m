Return-Path: <linux-renesas-soc+bounces-28055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBBYNiW6iWlwBQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:42:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E06510E3B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2493B3014762
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 10:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7CF369974;
	Mon,  9 Feb 2026 10:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvsM9yHq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE14E36922C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Feb 2026 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770633733; cv=none; b=cf+hQd4Hss8jRF/l0G0RUStmVUlG/Rx8hm9zKp+fdVACVsDvus7COjwHRl4rLdeH2FA9qeJyd7uV97g8ShNQYpzhaIJwjbX/VEesmwel8zomSX+D4MdfwZIlabkfSubhKqZZovsglaHWzWYOLxzfMmrOnXGlLtQaRRm0r9f3jJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770633733; c=relaxed/simple;
	bh=T/xGIUcNLulLdJL79PlV2KcyCy8itN3/jJLU1J2lZtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mx2tIg96I68m3B6t5jmO2VzJh+ArXpr1n0ECTuY1DjT23wWLO4Y1r5rzP78tWgi+j9pChxoxU1K5UMwKYhsbWCYILStcbHAtL9AuCewt/Qn6uqQP7cHtFekcmI9KWs7igqkMZZQopddi7fyRqYESYpVWNUvkiNBxbyGG2lU8Kis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NvsM9yHq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43621bf67ceso1688892f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 02:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770633731; x=1771238531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIuS6VE4RcagWoTJa6lurwoAPv6InRM+7MTVEIanWYY=;
        b=NvsM9yHqymyES+y36owmHS49umqtmsGirhG/zm66vCXdwNlJUdJEsZJI74LFiexJSK
         OL4EK6dMuoVSHOiwiKTs2zjLEK3V/dzCM+/qsnHgQYjX1U9rcEh3sJYaG1DYWOhp1m1Z
         qFudtAv52aOTS2BYWkrz5Gf1mxrDn0I0NJLC6vSsct6t1dmZ75iF78zBTwxNq318hE3F
         ozVO5Bh3wJlOsA6El/L7UjR3UCAitgD1A3nNBSt22eDdzksMLu5/M5jUbHYoDPi3ZtZn
         J+zks06BS8kI/ipqOXAtgC5XKPkOg33a5YdbewBlmFYZNJfD9PXhrqnGw06CsydgBQd5
         46OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770633731; x=1771238531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YIuS6VE4RcagWoTJa6lurwoAPv6InRM+7MTVEIanWYY=;
        b=dFtLszij6ScIiCTrVOqAIYLTKUQWVcVu7iRGsyCJfmbw+aG+s/K0JfXlRrPZgQkm0s
         B+GsOd3nNeMNPVH/rJisiMquIEqPAyWA6mFyx9Y8JhTLagbvpHy+j2PdNR1WHlE+nRMw
         Ga/1BiK5zTTcdRTC1qAsa5WfKC0SFrb3o9UJvlzkab/QRqugG3EagtvgECbQ3FSypUz7
         9WlHo1WrB3GlNG7lz2F6cuUVu5lnS9wB56QTIN4aQva9nhHMihxtWRypDgVbOUe3lZ8q
         JEmFNNBwlJdBkiw+MQuCweQFn4decjohCeoIpp8WhSdR2WF9R5/VQb3dXtHjfAA8uQlg
         bzMg==
X-Forwarded-Encrypted: i=1; AJvYcCWdXR0KjXnD+e0Kt0VoFbRxqMO4ZkjlAB3XlSXyoymQ6J0I7jcClVpd2Tf7oDKwK3BIY0s6E/WTEKuvxtEsVvxBQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6GtSi8YEqYaMHGi27M+WN5MHRooPwhDY+DbFlQckydtriKYwL
	fiMysVNinXk0z6+mQphWN9XozHruSbboobTRQtXfNWHiDwDFXRnxvHlN
X-Gm-Gg: AZuq6aI5/q8wICjssz+EHgsHCFMPLdxfSzlm2iqVwudGfrlT8EPg00mMQD8LIVmbsSf
	uztjsD70oW/+v6AEKPx7n12V7i6N38UTlaj7pKYHoEs6jkyuMJWKg+qJ2BpEJ5+/JwApI33Jfji
	ykNEe69vrjhWmLMhxk8dhNjz4JccDgsEBBnADI1dBhmMV9ZL6fyPcKaFjJMV+NB6p4axiVsXyMd
	zRhrkWZ3CQj2IxNg4Fpwo2NHvL/YgNzv8eFklte/3h3agyePZilaIEpm2U8ZLhnfZr4aCtZDT0O
	pcfjG8332C2OlPHyv1kGIxoDxXEP/uzDrmaBzEx8xIRWVZ6GzgH/zB8xEdWt7yCENFUdV1Viif+
	5w2xBXFmzBK41l2Hz7Oq2JstNplx2eTndpaPJYdd5KU8blMMRD6qAHxHknqEs/6cKorNu0wlOxf
	b9EyCHbbt8aYPSuLOq5R2E9Bw+yl31ZzChbLskeMOqmxPDETUY+Maj/xH6DcCMQgrzfRONiy03h
	FrN2NVh/tXYniI9Jbb9kCYz
X-Received: by 2002:a05:6000:26cd:b0:425:769e:515a with SMTP id ffacd0b85a97d-436293ba69fmr17797762f8f.42.1770633730588;
        Mon, 09 Feb 2026 02:42:10 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:436e:8b6:a7da:63b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b20fasm25962211f8f.6.2026.02.09.02.42.09
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
Subject: [PATCH v3 5/6] irqchip/renesas-rzv2h: Add CA55 software interrupt support
Date: Mon,  9 Feb 2026 10:41:19 +0000
Message-ID: <20260209104121.26172-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28055-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 5E06510E3B4
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
v2->v3:
- Replaced pr_debug with pr_info in the SWINT handler to ensure
  visibility of the message.

v1->v2:
- Made CA55 SW interrupt as part of ICU IRQ domain.
- Implemented rzv2h_icu_irq_set_irqchip_state() to trigger SWINT.
- Updated commit message accordingly.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 89 ++++++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index d4a47df0e26e..bfb975f7e370 100644
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
@@ -570,6 +605,50 @@ static int rzv2h_icu_parse_interrupts(struct rzv2h_icu_priv *priv, struct device
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
@@ -625,6 +704,10 @@ static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
 
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


