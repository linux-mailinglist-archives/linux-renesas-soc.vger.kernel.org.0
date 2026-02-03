Return-Path: <linux-renesas-soc+bounces-27863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF3HLHiCgmneVgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 00:19:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4A6DFAA6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 00:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D69A530ACD0B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 23:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC2E32ABC0;
	Tue,  3 Feb 2026 23:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOTgVOak"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E55E324B19
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 23:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160714; cv=none; b=SM61QB75Px9xa8QtC0+oGMgfQ6dnFU7sYsXE8ZsQHHHhWJMJMF6Dcw0NQIKd6cN7deuOj5B01exm2j4PLm/yGfaXPGQVgM1PcGMW064PHy1t/Aq481ZpnTmJe7mMf035jpvN4LpezVMs6UKdfr0VUn5LAVEdw5IaKVCUsn1pYow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160714; c=relaxed/simple;
	bh=M74STgH1ns3cnMiq1Iga99YIhx0rQEIYF7y5xQ9Bxsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DqSJLMCWpFKfChVY1uVJRGwxxwIrRhERsn0vZGmskORDHbq0+n6qbAQb1EpBLFJS1R4ojJiiGRCj0LDQlG10N5y33vG8WzZ0cOB4KzVnzQIu4toPfQ+FkBSOupIfROb9e1VAa1pWr3EVg7FantLBsTPbrSTd5SYZKCSkogkrxOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOTgVOak; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4359a302794so4236159f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 15:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770160712; x=1770765512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qamj1ZCcGSJBUDcRzNR59i6EIMleinLWFPtTQZPwfs=;
        b=jOTgVOakGHhYWNs+4rZRq/uTJXWm6tbH0roPC9o8LXZdmsohKQ3S3qN8ZEvRh+x8o8
         kHNGeruCGUTKn0eJ6/MfS/kHcS3kPSOu8UmaGU+DPthB68+IyXCDHnBCzmZHv6CICIot
         deJPyGWQBsTZ9l8SWBjDrXbUzJxdpp2EMovCMqr5eKvnwbwZkb6mHzZIlj4PRXAg5iNc
         JXrv67b0yhaE2srCppwi6PMpbBIcl8XTW/CaGNMdG++z4OZtwc3nh9SNKOPqZ5CMEhOj
         DKmzbhwX0QqFpd38OW6GFGYxbVuc0Dk8iKhnLu/Llx7CzViviP95u75aPn5DKO2X9wjj
         UTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160712; x=1770765512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+qamj1ZCcGSJBUDcRzNR59i6EIMleinLWFPtTQZPwfs=;
        b=IK91Pnitbjm/VJHiABadzA16lVRKsQo6s9f3FUj3D3Zqb7HXSVxXHTFVDQ2BuNG9pi
         C3dAyTC+25BIefo9U8qqauD20xxX5Ua2ceaEuu8jP6Hy9FH5edV1QDTc57+WCaoipVS4
         Q1hYMdjLABAsdk4djGAMe7Tnem+WO5QMuXKwYP1RylG/hYa5f2fIurD0Z3Kv5+y9tCQo
         JJiqh2dluk8jGHgzsRC8pjhqC3INuhqf8N8zoBDugkcxurFr1ZkD8zquDKrWOUBZ5rs5
         eYpdLRCYVh3DS/ndGhN5mfReaFM4Ijkf/P9mcrkvdpyJiuUCRIgbFMfw1adzlbWwqY/Z
         NiGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrAVvooVwjBNW0d6NBVsj5SSoz4fwPJU5MhP6O4mUgntTLgvSiBuaGlBx10PHZ1GU3R3Z31YR7NDl6/VwoCaj85g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr0wtLB6aPG3UFTGQ6LK2DpwkyS94kzD2u5dAVT8WxVDLOh+1L
	lVtdE0cnLOWiF4NU8rymYBI9j4qhBi9bR/1kglO4doqVU+ZumZK3x8KT
X-Gm-Gg: AZuq6aK3/4waFsof5SAkQ9+a+tbTnUlMVawC4nuz7FKzVH44h9XVadcqEfD+ML4Odgu
	CZHGX7MQX/SHGXv4zeWGQY5WmIxHrTxrqjLpvh1nU6ia7Ud1ublGNxk8glqBFoIUpnuYiAc2p4/
	cWrhZtnjLONyUq8KzSL9ZroWtmM4jvC0AoMcyGqxnHfv5H6uCwQW7plu/m90vdDGJRuSmWAMC3X
	v8ibu8a5S6gRT/wW4WXHaWMwclKek7QoRDq+bYc+3wU8lFb+8Zq0tBm0S38ZKfgemZ0vLB+LNpK
	FdpR2k/t6JF9LsdGvto8Sj3A1WME7gljGPVTYdNODXDR/SoF4g4xb4OKKvwUP8nxiVHzhF7sqgO
	MUi4uuA/BZ+AMU9MBYnWheI4upHIIMYip/h+izvo23IaqrQrbSZyue+/rahLZw6UV/UTqIW0zBD
	UIdT4XLPOWE81WglVq3Vyc3KdPNEYCnO19M/wYoJ+8akOPuda2m5imo9BZD3idUmmeV2e/pLk7c
	6E/5OKGiwxrda7MOdmEL989
X-Received: by 2002:a05:6000:40c9:b0:435:a8e7:62de with SMTP id ffacd0b85a97d-436180628f8mr1401844f8f.58.1770160711522;
        Tue, 03 Feb 2026 15:18:31 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:2e50:5c7f:afca:5f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180647aasm1739832f8f.41.2026.02.03.15.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 15:18:30 -0800 (PST)
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
Subject: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type handling range-aware
Date: Tue,  3 Feb 2026 23:18:21 +0000
Message-ID: <20260203231823.208661-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27863-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2C4A6DFAA6
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refine IRQ type handling to explicitly bound IRQ and TINT ranges and
dispatch based on the hardware IRQ number.

This restructures the logic to clearly separate NMI, IRQ, and TINT
handling and ensures out-of-range interrupts are ignored safely. The
change prepares the driver for adding CA55 interrupts into the IRQ
hierarchy domain by making the interrupt classification explicit and
extensible.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- New patch.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 59 +++++++++++++++++++----------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 4aa772ba1a1f..6c7bbb04c6e4 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -25,9 +25,11 @@
 /* DT "interrupts" indexes */
 #define ICU_IRQ_START				1
 #define ICU_IRQ_COUNT				16
-#define ICU_TINT_START				(ICU_IRQ_START + ICU_IRQ_COUNT)
+#define ICU_IRQ_LAST				(ICU_IRQ_START + ICU_IRQ_COUNT - 1)
+#define ICU_TINT_START				(ICU_IRQ_LAST + 1)
 #define ICU_TINT_COUNT				32
-#define ICU_NUM_IRQ				(ICU_TINT_START + ICU_TINT_COUNT)
+#define ICU_TINT_LAST				(ICU_TINT_START + ICU_TINT_COUNT - 1)
+#define ICU_NUM_IRQ				(ICU_TINT_LAST + 1)
 
 /* Registers */
 #define ICU_NSCNT				0x00
@@ -175,18 +177,27 @@ static void rzv2h_icu_eoi(struct irq_data *d)
 	u32 bit;
 
 	scoped_guard(raw_spinlock, &priv->lock) {
-		if (hw_irq >= ICU_TINT_START) {
-			tintirq_nr = hw_irq - ICU_TINT_START;
-			bit = BIT(tintirq_nr);
-			if (!irqd_is_level_type(d))
-				writel_relaxed(bit, priv->base + priv->info->t_offs + ICU_TSCLR);
-		} else if (hw_irq >= ICU_IRQ_START) {
+		switch (hw_irq) {
+		case 0:
+			/* Clear NMI */
+			writel_relaxed(ICU_NSCLR_NCLR, priv->base + ICU_NSCLR);
+			break;
+		case ICU_IRQ_START ... ICU_IRQ_LAST:
+			/* Clear IRQ */
 			tintirq_nr = hw_irq - ICU_IRQ_START;
 			bit = BIT(tintirq_nr);
 			if (!irqd_is_level_type(d))
 				writel_relaxed(bit, priv->base + ICU_ISCLR);
-		} else {
-			writel_relaxed(ICU_NSCLR_NCLR, priv->base + ICU_NSCLR);
+			break;
+		case ICU_TINT_START ... ICU_TINT_LAST:
+			/* Clear TINT */
+			tintirq_nr = hw_irq - ICU_TINT_START;
+			bit = BIT(tintirq_nr);
+			if (!irqd_is_level_type(d))
+				writel_relaxed(bit, priv->base + priv->info->t_offs + ICU_TSCLR);
+			break;
+		default:
+			break;
 		}
 	}
 
@@ -200,7 +211,7 @@ static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
 	u32 tint_nr, tssel_n, k, tssr;
 	u8 nr_tint;
 
-	if (hw_irq < ICU_TINT_START)
+	if (hw_irq < ICU_TINT_START || hw_irq > ICU_TINT_LAST)
 		return;
 
 	tint_nr = hw_irq - ICU_TINT_START;
@@ -421,12 +432,22 @@ static int rzv2h_icu_set_type(struct irq_data *d, unsigned int type)
 	unsigned int hw_irq = irqd_to_hwirq(d);
 	int ret;
 
-	if (hw_irq >= ICU_TINT_START)
-		ret = rzv2h_tint_set_type(d, type);
-	else if (hw_irq >= ICU_IRQ_START)
-		ret = rzv2h_irq_set_type(d, type);
-	else
+	switch (hw_irq) {
+	case 0:
+		/* NMI */
 		ret = rzv2h_nmi_set_type(d, type);
+		break;
+	case ICU_IRQ_START ... ICU_IRQ_LAST:
+		/* IRQ */
+		ret = rzv2h_irq_set_type(d, type);
+		break;
+	case ICU_TINT_START ... ICU_TINT_LAST:
+		/* TINT */
+		ret = rzv2h_tint_set_type(d, type);
+		break;
+	default:
+		ret = -EINVAL;
+	}
 
 	if (ret)
 		return ret;
@@ -507,11 +528,11 @@ static int rzv2h_icu_alloc(struct irq_domain *domain, unsigned int virq, unsigne
 	 * fwspec->param[0].
 	 * hwirq is embedded in bits 0-15.
 	 * TINT is embedded in bits 16-31.
+	 * Check if bits 16-31 are set to identify TINT interrupts.
 	 */
-	if (hwirq >= ICU_TINT_START) {
-		tint = ICU_TINT_EXTRACT_GPIOINT(hwirq);
+	tint = ICU_TINT_EXTRACT_GPIOINT(hwirq);
+	if (tint) {
 		hwirq = ICU_TINT_EXTRACT_HWIRQ(hwirq);
-
 		if (hwirq < ICU_TINT_START)
 			return -EINVAL;
 	}
-- 
2.52.0


