Return-Path: <linux-renesas-soc+bounces-28054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CQDCYy6iWlwBQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:44:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D9510E3F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6015303D2FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 10:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F8E367F57;
	Mon,  9 Feb 2026 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMnA1nJy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C835E369224
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Feb 2026 10:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770633732; cv=none; b=ktnnECpxZd76ayOThkO+PzfWhUyYWjpIPJFLNcXWGU7iXRRLlydCUMnZ90HiWk8YmFgoq19NO/Y2OA9yzQR+xw9KsHgG4Cf/Syvpp1PYE7N1+136W5TKEMhBPZo7x9P3T0UhSKCStdtQW5DurE6CChdRoSO51t7FRriEagq3Gzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770633732; c=relaxed/simple;
	bh=TqaRlfcksReFLFPjLOJqka0OjTG44POzeHc64dTRc60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrZC46DehlnP1RBDtaiX2nSispYhWYeI5OoOVD4RHm2MI+9hZRIASjSEaUd+GQBvuKie3nwkWK3sL5XaeuyxWKQhIBOigvJza/T2WeS4zfBp4veuIM8WOkGlW35zo3d2Yj+d18HXTBUrvNKgEtG4TRtvWEpTggi0M9VC8GebSJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMnA1nJy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso36748655e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 02:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770633730; x=1771238530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LinQMk8vpLuA2yrBKVt1Nrvfv80xEiK4QCTzQwij+FQ=;
        b=YMnA1nJybXmepnBxZsfRtCRu6sevIA+B30zk34LPUAoX8+YmIdeDg2ZHVxJnwnM92A
         Sl6tr3gcvh3bjbt3q0sJXnnlV5i7R9bmh6o2SzdvmvjFm3Lof6fVsfl64UVYpXOTaGLf
         IZu+9kU0HeD7jGQMAsYVmTW2hOop0rSmePhl2frQG7XI32qqvLhpjaBpV2Ta8Q4bdCGc
         WIrCyXIQfcQN/FRgpPzvtKxz7l1WE6xlSyLjj0+XJ9shZpTZeUzygK5DFhmnzSZG3/4U
         zd32SBYLWSP1OeXV36kxtYNQip/KD5B5VNyVWAxtmlzxUvpnKBxEAeNHETohxW1NcC0w
         y/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770633730; x=1771238530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LinQMk8vpLuA2yrBKVt1Nrvfv80xEiK4QCTzQwij+FQ=;
        b=VvnCQlWQjpav6FA8PRjGTU2zhHluHUUgWaN/73S4SwIfUyty2Wv136eXJZINP5JDit
         wvJyvQC0ivPf0jRdKfLoV9Cj5e6U0mn7faDMGudSnGeEE90rHTd/C79m6FR53NUXiTHi
         yQRlrQ4UFNr+4O5LlACN5npTRJAec2goYp3OmJZFUrePva7K0VQFJz7Z2hTRDz1IioeU
         zPH6TaZAvD5Y3PaG7gDCyAQCEFBEDRvrSr1wfmrq+wBlvGgA8WrHNLBNOUqyJwIz4nzP
         p1Q27/WBjWMdWv84GrqzXUKIyWrNsoxboG/PB0CBUIG5Y2gM1vhb4Xm1qw+NTnJnA99a
         U0iw==
X-Forwarded-Encrypted: i=1; AJvYcCXiVKBUK6N45pnDlWyNXTaFMTlvSkZruIYLhJjJg1pDBwVOd0SaOZiCoLaB1YyMeywd40w7fsMgD5eS57YYcvpHkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+PvqUdMpByZFZ3G2AYUBO9498yHydAVZErDLfL2PkAJG23wDi
	BODdBztM3dI+C0KFbDJCsqcMw+dqqlT2F4q5z7JndFLDuvCuUCC/8Ssh
X-Gm-Gg: AZuq6aLHGEmvvh2qVmCsS80vUsVum/mIYqdoNijBMz8VWx6rRccywMECb4xUb233yvP
	ohHoHSUjMn4noNOzII5tUN0n7mPrQSyoWHF4jvCYSoeiQOWeaqWptTkmtuLVVxS6eCn7wp3e4r4
	D/4ZYwEaiPxyS4EWEMVf6RN8sU5Ka0q44xkH822K7Xrxb9OkYS65sXEhaZY2w9yl8R+G5ekMPZ7
	7gpMhxJLelWlgqJdDLpkkkaMA3XsPhA6zsPJH0WT6PRWcjRiX+8ezkhHKSGjKP5/bpW1KRS8plt
	2hPO4STMqNJ8mvhW0cY0JZU3lBQqFxe0K0RGlaiONsQWqHrvNyYYldM/Yp9/GZl4RxcgEHxbS1y
	IczGKi2AYM3B0zT61V84b7UcMEVr+wB53X24i8aR2T8Mzv1BD54PI697a/7Y+9aGpt8Sq+Hsoxj
	NlmyB2O1Pktrk+GdMSeVqYnbS9hPKCdeoRS0GzhTBnpuA+XFobBvFX+JhDicGGVhaLZEAQPS2f3
	xSkCoFruZtfq007gLGRKZ4se8WgHDEfACw=
X-Received: by 2002:a05:600c:3e0b:b0:47a:810f:1d06 with SMTP id 5b1f17b1804b1-483209291eamr154277925e9.4.1770633729738;
        Mon, 09 Feb 2026 02:42:09 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:436e:8b6:a7da:63b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b20fasm25962211f8f.6.2026.02.09.02.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:42:09 -0800 (PST)
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
Subject: [PATCH v3 4/6] irqchip/renesas-rzv2h: Make IRQ type handling range-aware
Date: Mon,  9 Feb 2026 10:41:18 +0000
Message-ID: <20260209104121.26172-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28054-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 81D9510E3F8
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
v2->v3:
- Updated the check in rzv2h_icu_alloc() to ensure hwirq is within the
  TINT range when extracting TINT information.

v1->v2:
- New patch.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 60 +++++++++++++++++++----------
 1 file changed, 40 insertions(+), 20 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 4aa772ba1a1f..d4a47df0e26e 100644
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
@@ -508,11 +529,10 @@ static int rzv2h_icu_alloc(struct irq_domain *domain, unsigned int virq, unsigne
 	 * hwirq is embedded in bits 0-15.
 	 * TINT is embedded in bits 16-31.
 	 */
-	if (hwirq >= ICU_TINT_START) {
-		tint = ICU_TINT_EXTRACT_GPIOINT(hwirq);
+	tint = ICU_TINT_EXTRACT_GPIOINT(hwirq);
+	if (tint || (hwirq >= ICU_TINT_START && hwirq <= ICU_TINT_LAST)) {
 		hwirq = ICU_TINT_EXTRACT_HWIRQ(hwirq);
-
-		if (hwirq < ICU_TINT_START)
+		if (hwirq < ICU_TINT_START || hwirq > ICU_TINT_LAST)
 			return -EINVAL;
 	}
 
-- 
2.52.0


