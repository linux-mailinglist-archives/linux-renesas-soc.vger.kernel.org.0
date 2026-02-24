Return-Path: <linux-renesas-soc+bounces-28441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMvqAl/pnWlDSgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 19:09:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E0118B034
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 19:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E35130AA532
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 18:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0BC3B9619;
	Tue, 24 Feb 2026 18:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6hXQwPn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DCE3ACF17
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 18:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956023; cv=none; b=ouXDkrlsbPVlLf/WPA+74IA0K7+m2WOanb9NssMFu7K+SphqoTfDm1B0hgh7cJpL2aO6R9kV3eJIHvnhPjKX21dyd+lAXh73Hx6poSJRNIXg+TFwJ8B/1LDziuzCmZfmFUk+/fDfoDohdyUxRlIphxjjGoj2BpfGxdkSY9/04Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956023; c=relaxed/simple;
	bh=GnluRpgFCcayajp9z60GgQmarw9dgWAtGZG9rbKVeNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nFGzG7oSXkY8/xkYR7fzfG22OKjx6snsMdiqwCrerJZiBPBdwhGdBYbtk+pn6E2Me+ZV14XgyXy5yYvDBCYfevLrpaAdIhVmTm3kyiUouc5TFzoLYWoneI3YWNq1FBXEWjkv2IMR2N+Yieztu3eyDm/AILBIkmUU4D7RxV/WFDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6hXQwPn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483a2338616so37990925e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 10:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771956020; x=1772560820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3thGyjue57rl8vh/ZrwvpRe4jkqPWJRDLcTE+hgIQo=;
        b=H6hXQwPnKnqfWgEQNzLW9ovrgFplBviqqPYI7P7/8GLRNMIDaRQNPEgcSgHRVzV8no
         mt/5oQfsquoCcd3+j9/eCkCSjGoMXnl+Doh6ZGHDcmTuukYRMEyxupCL/EJjgRZFljgp
         FTfMdxqA+8tMIBW8iOsFPSROM9TwJJAiRXL2gTBv24XmGZbBPl2b4I2SomUkhK4VzRQ0
         NmgGJXtX6UHtjAaWPlknXMVah5pMhRKoBm43dty474z9oGntDWcEM+/Y0px3jQWX+6Tm
         6fsEHrvoPIDyzaL+tmY99EM/WgR6R1SDktitSca/E2punaJeY1hLtvKya+4ziu9fh0dW
         IIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771956020; x=1772560820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G3thGyjue57rl8vh/ZrwvpRe4jkqPWJRDLcTE+hgIQo=;
        b=HMMuN+ztG+4vMayQkPO6vo64UedYrWIVIWYNfCF2hNJS0pf8hcL4OQEDE+lA+kobcr
         TE6dEzAa7KZe1xxiyK6UOdualQIaGrHNUANhlX0KJ8AuHtZAzu0GaeyzEHF+fCFX5bE2
         V9mlxg42fmYs3DD5+WgPglPGZRnByP2UTWmC7usZ9EUPohtL3153TnU9kEGOxIvmaFXl
         t7MlLA8+k9i3FXxMFs/Wn2oyITpwXXTgAaFLCmWnyHAmbG/vOuyqYfJt2ZT38ZjTuU39
         WCK0n4VzhTbFy4CWnqZpUKdp1bkidsXreu1RVH7cwSIahLq3xH36ef740ycQ7L8ZX5MS
         lxFg==
X-Forwarded-Encrypted: i=1; AJvYcCX5xevJfNXhMQnSP/M4QUkXRORf8l3LTivLXKcu2FUYKnTAP+pnZwieYP1HbwzvJAF9+ebRYq0lY+23umScnUMc5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAjPt83rPKyovQSV5DQbmf1JCG+4pRwMLZwRcCdT1NDt3Xhrs1
	WngkUCTti/L0OoZT8sMCOIk0L8s4BveeaeDP+shkrtze+bSiXox/xLYi
X-Gm-Gg: AZuq6aKb7dwP2Kra/DIrqvElyFqGC2KM+QU5V+6/mPVqlq8bsYp97CW1jsr6y9+xtf9
	1JYtf2XkvBNqaqPhfNGduJ3xX3hgyhqnbUwBIbg0H6fU1i7NkP5pGzrSEmB9OTAyadZd8Ufml0r
	rNTy90WYhTOIqMIrW1Kg0V0qfrq2I55t1acSz708NZkVVIdw5hL/QyzyRuTkxGX8DrlAKCpQUvH
	oUYiDHsGterwT6TtE5e0ZazPO7JuEEuPn5cYoPF/NDjV0pmdtpA9hbm/1h8aI/StLVhQvK4U10O
	YHa46gvYJncoFVpB/h6ZWLkxJv5wqRrqYEpEPpJS88F7wP/uVVp9lmS0Jz9t5cFfDeFZkF618sC
	G669/aFDH6tKb8m8BBy03FUZgUBl5opotA1urJAD3NVneVkN/0MrMAMig3+pCMJ/dChtg1zpswB
	omvoeMk4RWaOi1ZiEPMBRQFbCvMglxso4fCAzLW+8KumP7Ohn7W0nFnCzpziO/0gEncG1DGkHhk
	N/y4nWM/F1xA6kBXxo6Tn0tKsEiZwSELwCn9bvJsVG3Hao=
X-Received: by 2002:a05:600c:c8a:b0:480:4a90:1b06 with SMTP id 5b1f17b1804b1-483a9603d42mr202137535e9.34.1771956019749;
        Tue, 24 Feb 2026 10:00:19 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:87da:e3e9:a9bf:6f1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd72bd66sm13064095e9.11.2026.02.24.10.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 10:00:19 -0800 (PST)
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
Subject: [PATCH v4 6/7] irqchip/renesas-rzv2h: Add CA55 software interrupt support
Date: Tue, 24 Feb 2026 17:56:17 +0000
Message-ID: <20260224175618.3160270-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-28441-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B1E0118B034
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
 drivers/irqchip/irq-renesas-rzv2h.c | 96 ++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index d72400bb62b1..235eb9dc6126 100644
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
 
@@ -434,6 +439,28 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
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
+	guard(raw_spinlock)(&priv->lock);
+	/* Trigger the software interrupt */
+	writel_relaxed(bit, priv->base + ICU_SWINT);
+	return 0;
+}
+
 static int rzv2h_irqc_irq_suspend(void *data)
 {
 	struct rzv2h_irqc_reg_cache *cache = &rzv2h_icu_data->cache;
@@ -523,6 +550,23 @@ static const struct irq_chip rzv2h_icu_nmi_chip = {
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
@@ -552,6 +596,8 @@ static int rzv2h_icu_alloc(struct irq_domain *domain, unsigned int virq, unsigne
 		chip = &rzv2h_icu_tint_chip;
 	} else if (hwirq >= ICU_IRQ_START && hwirq <= ICU_IRQ_LAST) {
 		chip = &rzv2h_icu_irq_chip;
+	} else if (hwirq >= ICU_CA55_INT_START && hwirq <= ICU_CA55_INT_LAST) {
+		chip = &rzv2h_icu_swint_chip;
 	} else {
 		chip = &rzv2h_icu_nmi_chip;
 	}
@@ -589,6 +635,50 @@ static int rzv2h_icu_parse_interrupts(struct rzv2h_icu_priv *priv, struct device
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
@@ -643,6 +733,10 @@ static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
 
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


