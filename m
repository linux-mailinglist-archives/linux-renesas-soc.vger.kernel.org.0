Return-Path: <linux-renesas-soc+bounces-30288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEDXJn03xGnkxQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:29:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E009E32B427
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 68F2730612AC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DEFA40B6D9;
	Wed, 25 Mar 2026 19:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UD3cB45P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654964035BC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 19:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466711; cv=none; b=sZ1vjxHPNZ/h9oDfhp7PA1LKUgHD4nGYY01CCMAc2QG9qX5znH/EHrL6hgfRNVJjQJCIrHHay0vccymoikAoqEFhqHDKMmdEWMgWu0+QOoJsfv5B9kE9UCZaSvd8RH7o6Kzm0FF+265xoj+X6VffwGec3+tkaFA5TPRL+bhgz+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466711; c=relaxed/simple;
	bh=IkxdVFlOCAP/hZFHt0uM7rCw0sIXbatY/GEyg6Ym4iI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GTDLJRopyhSgflpXn2stI/r04j6helquJxiHdZl50trFF0KnAPYfYdKx8B+KTiH7kModU/BxMFBAcsK7QGIVF4oe4s+hpU1wklEfzXY/Q445qpZ/dOUnmafvCHpCNEuTpUdLsUuF24XVu0I2+InGB4EVK5Vb6LOz3JSRUmXz3m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UD3cB45P; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so138502f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466708; x=1775071508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlUdYHL4ApiPu1iv8AhDNiJZOVECgksheHgilyW3k8k=;
        b=UD3cB45PMXlRjRhquijsG5qmLsND601sklaE/z00ojc8R2d3dEsvzK0OzfY+YmKXAn
         x1sNV6ZXtv1S+nAXXlV+QwMmi8A2AXy2MltT0GLX810YatqUv/JCy/nEfF83gIgj5Wqu
         9H6WIs1OOf6YT7WOSRq2sgCeTG4lyGVrpxSQ4UOXo0f7ULl0OYBYw5GCfl5kxXPDJ2bL
         TMKzEJkchLijFLqXkHcJbPVmrgeGkKCCabCERM2P0bKpfrTBR+a0zTBtS7JBxzpcJeJ/
         QcpsonZmSge7vvoK9dZPLGqFLCetMtHMMYeR9zXvRWaRwWroMLIVe8w0oExxKQwqSKfO
         Ev8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466708; x=1775071508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IlUdYHL4ApiPu1iv8AhDNiJZOVECgksheHgilyW3k8k=;
        b=SMC5qbRuLDtNjif5Kju7dC/yZGjy5CzRaqPIMFuj8dihm4wmsgn+mTfD3CI78+n8UP
         XAeStreefSXCTD8OAWvBuWpcXlmi9TNGTmnBSfy3JapE8DWqO030ydsxChYph4uS9i61
         q1mFY5ocwPtbstv1p+vvrDDiuvPW8/y4x/Lr09wMQIcMuG9Sx2LeQiu3jvSN73IAmXee
         HXOZ4mbvsa6VmdiZ0R7QKvsFeVPGBcIvyJLeBf4QGeYMwkZDsdlbUoBtVdOhV51LfIy9
         kgpsNSFOGa2lPyDT9GELzK0L0mBPPm33ObVUPR4nwpwDeWYJrnJpRGoJqrB9rYApXx/c
         q6hA==
X-Forwarded-Encrypted: i=1; AJvYcCWAYEksVEVt+/R+QABfbLna+VaQzdey2n9mXJKMEXBjXnm0PijHUDUXiAfdB7O3M6wCacbFAy+VYSav6QGKGkdhrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9jTkE+HVgm6FS5sl/wcR6K7EvLTxevoMsn5Y4iDJEAK9PPUsJ
	TFolENEnPun7bcAh+zqUc8KT0bWBANqcNgi97uX8hcrLIhUm3cjAVKdighbxhg==
X-Gm-Gg: ATEYQzxrUyFZ5oLYTiXLfb+I/BX/A2uvIym7niGrBgfRWc5Lrm0D+1nf++rUjcgedRk
	mijrQCYcHcvdV9H8PXm75aSCHO1uFWWoINLtwamcMgZ6kIklJe29JgfD6Km6ktJbmDR/OBXHbRk
	jFFVp7u0DEcLicuLHXrgOZRAnelW23TaoS4hYbsZA4YjDWw3GrrVUlrSM55QI/ZBxiqPfgN2dqo
	Tc0qq+kHdF1BmRQ8Q5r6Js7lxMpajzw45/Vo1QjA5e8Su57QrQbh9OR9J6OPhS3W9ngtvwho2ev
	jtBcGJsJncoqpwQqLnW6OuTEeB6kteojzi8tNsc5lsdulSOS+3K6eivcmToo8JW6CEKwGKie9Qu
	ZMZviq9BJ5tU5IbzpQA7EMRUj7n7bVkRSHEU33ClFBjn3jshflS010N3a3kVKLaZlK4zGkm4wwR
	BVTz8mvPKyMwAttt571yPobOHqMpX5p0HaBfPTQdsIE2hVJ6md
X-Received: by 2002:a05:6000:2dc7:b0:43b:4e01:4abe with SMTP id ffacd0b85a97d-43b88a21586mr7174531f8f.11.1774466707731;
        Wed, 25 Mar 2026 12:25:07 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:25:07 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 16/16] irqchip/renesas-rzg2l: Add shared interrupt support
Date: Wed, 25 Mar 2026 19:24:31 +0000
Message-ID: <20260325192451.172562-17-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
References: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30288-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E009E32B427
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC has 16 external interrupts, of which 8 are shared with
TINT (GPIO interrupts), whereas RZ/G2L has only 8 external interrupts
with no sharing. The shared interrupt line selection between external
interrupt and GPIO interrupt is based on the INTTSEL register. Add
shared_irq_cnt variable to struct rzg2l_hw_info handle these differences.

Add used_irqs bitmap to struct rzg2l_irqc_priv to track allocation state.
In the alloc callback, use test_and_set_bit() to enforce mutual exclusion
and configure the INTTSEL register to route to either the external
interrupt or TINT. In the free callback, use test_and_clear_bit() to
release the shared interrupt line and reset the INTTSEL. Also add INTTSEL
register save/restore support to the suspend/resume path.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * Replaced rzg2l_irq_*and_get_irq_num()->rzg2l_irqc_*and_get_irq_num().
 * Replaced raw_spinlock->raw_spinlock_irqsave in rzg2l_irqc_set_inttsel()
   to avoid possible dead lock with the consumer driver probe and eoi
   handler executing on the same cpu.
 * Updated error handling paths in rzg2l_irqc_alloc()
 * Added missing colon reported by the bot for 'struct member 'used_irqs'
   not described in 'rzg2l_irqc_priv'.
v5->v6:
 * Updated commit description.
 * Switched to using irq_domain_ops::{alloc,free} callbacks for mutual
   exclusion between external interrupts and GPIO interrupts as using
   irq_{request,release}_resources() leading to irq storm()
 * Dropped irq_{request,release}_resources().
 * Replaced the macro TINTSEL->INTTSEL_TINTSEL
 * Added macros INTTSEL_TINTSEL_START, IRQC_SHARED_IRQ_COUNT and
   IRQC_IRQ_SHARED_START.
 * Added used_irqs bitmap to struct rzg2l_irqc_priv to track allocation
   state of shared_interrupt
 * Added rzg2l_irqc_set_inttsel() for configuring INTTSEL register.
 * Replaced irq_domain_free_irqs_common()->rzg2l_irqc_free() as 
   rzg2l_irqc_domain_ops::free() callback.
 * Replaced the 8->IRQC_SHARED_IRQ_COUNT in shared_irq_cnt varaible as
   the same macro used in bitmap.
v4->v5:
 * Added callback irq_{request,release}_resources() to both irq and tint
   interrupt chips.
v3->v4:
 * Updated commit header irq->interrupt.
 * Updated commit description IRQs->interrupts.
 * Updated shared_irq_cnt variable type from u8->unsigned int.
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 118 +++++++++++++++++++++++++++-
 1 file changed, 115 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index c885beaa666c..fef4b3036926 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -22,6 +22,8 @@
 
 #define IRQC_IRQ_START			1
 #define IRQC_TINT_COUNT			32
+#define IRQC_SHARED_IRQ_COUNT		8
+#define IRQC_IRQ_SHARED_START		(IRQC_IRQ_START + IRQC_SHARED_IRQ_COUNT)
 
 #define ISCR				0x10
 #define IITSR				0x14
@@ -29,6 +31,7 @@
 #define TITSR(n)			(0x24 + (n) * 4)
 #define TITSR0_MAX_INT			16
 #define TITSEL_WIDTH			0x2
+#define INTTSEL				0x2c
 #define TSSR(n)				(0x30 + ((n) * 4))
 #define TIEN				BIT(7)
 #define TSSEL_SHIFT(n)			(8 * (n))
@@ -52,16 +55,21 @@
 #define IITSR_IITSEL_EDGE_BOTH		3
 #define IITSR_IITSEL_MASK(n)		IITSR_IITSEL((n), 3)
 
+#define INTTSEL_TINTSEL(n)		BIT(n)
+#define INTTSEL_TINTSEL_START		24
+
 #define TINT_EXTRACT_HWIRQ(x)		FIELD_GET(GENMASK(15, 0), (x))
 #define TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
 
 /**
  * struct rzg2l_irqc_reg_cache - registers cache (necessary for suspend/resume)
  * @iitsr: IITSR register
+ * @inttsel: INTTSEL register
  * @titsr: TITSR registers
  */
 struct rzg2l_irqc_reg_cache {
 	u32	iitsr;
+	u32	inttsel;
 	u32	titsr[2];
 };
 
@@ -71,12 +79,14 @@ struct rzg2l_irqc_reg_cache {
  * @irq_count:		Number of IRQC interrupts
  * @tint_start:		Start of TINT interrupts
  * @num_irq:		Total Number of interrupts
+ * @shared_irq_cnt:	Number of shared interrupts
  */
 struct rzg2l_hw_info {
 	const u8	*tssel_lut;
 	unsigned int	irq_count;
 	unsigned int	tint_start;
 	unsigned int	num_irq;
+	unsigned int	shared_irq_cnt;
 };
 
 /**
@@ -88,6 +98,7 @@ struct rzg2l_hw_info {
  * @lock:	Lock to serialize access to hardware registers
  * @info:	Hardware specific data
  * @cache:	Registers cache for suspend/resume
+ * @used_irqs:	Bitmap to manage the shared interrupts
  */
 static struct rzg2l_irqc_priv {
 	void __iomem			*base;
@@ -97,6 +108,7 @@ static struct rzg2l_irqc_priv {
 	raw_spinlock_t			lock;
 	struct rzg2l_hw_info		info;
 	struct rzg2l_irqc_reg_cache	cache;
+	DECLARE_BITMAP(used_irqs, IRQC_SHARED_IRQ_COUNT);
 } *rzg2l_irqc_data;
 
 static struct rzg2l_irqc_priv *irq_data_to_priv(struct irq_data *data)
@@ -464,6 +476,8 @@ static int rzg2l_irqc_irq_suspend(void *data)
 	void __iomem *base = rzg2l_irqc_data->base;
 
 	cache->iitsr = readl_relaxed(base + IITSR);
+	if (rzg2l_irqc_data->info.shared_irq_cnt)
+		cache->inttsel = readl_relaxed(base + INTTSEL);
 	for (u8 i = 0; i < 2; i++)
 		cache->titsr[i] = readl_relaxed(base + TITSR(i));
 
@@ -482,6 +496,8 @@ static void rzg2l_irqc_irq_resume(void *data)
 	 */
 	for (u8 i = 0; i < 2; i++)
 		writel_relaxed(cache->titsr[i], base + TITSR(i));
+	if (rzg2l_irqc_data->info.shared_irq_cnt)
+		writel_relaxed(cache->inttsel, base + INTTSEL);
 	writel_relaxed(cache->iitsr, base + IITSR);
 }
 
@@ -562,6 +578,72 @@ static const struct irq_chip rzfive_irqc_tint_chip = {
 				  IRQCHIP_SKIP_SET_WAKE,
 };
 
+static bool rzg2l_irqc_is_shared_irqc(const struct rzg2l_hw_info info, unsigned int hw_irq)
+{
+	return ((hw_irq >= (info.tint_start - info.shared_irq_cnt)) && hw_irq < info.tint_start);
+}
+
+static bool rzg2l_irqc_is_shared_tint(const struct rzg2l_hw_info info, unsigned int hw_irq)
+{
+	return ((hw_irq >= (info.num_irq - info.shared_irq_cnt)) && hw_irq < info.num_irq);
+}
+
+static bool rzg2l_irqc_is_shared_and_get_irq_num(struct rzg2l_irqc_priv *priv,
+						 irq_hw_number_t hwirq, unsigned int *irq_num)
+{
+	bool is_shared = false;
+
+	if (rzg2l_irqc_is_shared_irqc(priv->info, hwirq)) {
+		*irq_num = hwirq - IRQC_IRQ_SHARED_START;
+		is_shared = true;
+	} else if (rzg2l_irqc_is_shared_tint(priv->info, hwirq)) {
+		*irq_num = hwirq - IRQC_TINT_COUNT - IRQC_IRQ_SHARED_START;
+		is_shared = true;
+	}
+
+	return is_shared;
+}
+
+static void rzg2l_irqc_set_inttsel(struct rzg2l_irqc_priv *priv, unsigned int offset,
+				   unsigned int select_irq)
+{
+	u32 reg;
+
+	guard(raw_spinlock_irqsave)(&priv->lock);
+	reg = readl_relaxed(priv->base + INTTSEL);
+	if (select_irq)
+		reg |= INTTSEL_TINTSEL(offset);
+	else
+		reg &= ~INTTSEL_TINTSEL(offset);
+	writel_relaxed(reg, priv->base + INTTSEL);
+}
+
+static int rzg2l_irqc_shared_irq_alloc(struct rzg2l_irqc_priv *priv, irq_hw_number_t hwirq)
+{
+	unsigned int irq_num;
+
+	if (rzg2l_irqc_is_shared_and_get_irq_num(priv, hwirq, &irq_num)) {
+		if (test_and_set_bit(irq_num, priv->used_irqs))
+			return -EBUSY;
+
+		if (hwirq < priv->info.tint_start)
+			rzg2l_irqc_set_inttsel(priv, INTTSEL_TINTSEL_START + irq_num, 1);
+		else
+			rzg2l_irqc_set_inttsel(priv, INTTSEL_TINTSEL_START + irq_num, 0);
+	}
+
+	return 0;
+}
+
+static void rzg2l_irqc_shared_irq_free(struct rzg2l_irqc_priv *priv, irq_hw_number_t hwirq)
+{
+	unsigned int irq_num;
+
+	if (rzg2l_irqc_is_shared_and_get_irq_num(priv, hwirq, &irq_num) &&
+	    test_and_clear_bit(irq_num, priv->used_irqs))
+		rzg2l_irqc_set_inttsel(priv, INTTSEL_TINTSEL_START + irq_num, 0);
+}
+
 static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 			    unsigned int nr_irqs, void *arg)
 {
@@ -594,16 +676,45 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 	if (hwirq >= priv->info.num_irq)
 		return -EINVAL;
 
+	if (priv->info.shared_irq_cnt) {
+		ret = rzg2l_irqc_shared_irq_alloc(priv, hwirq);
+		if (ret)
+			return ret;
+	}
+
 	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, chip, (void *)(uintptr_t)tint);
 	if (ret)
-		return ret;
+		goto shared_irq_free;
+
+	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &priv->fwspec[hwirq]);
+	if (ret)
+		goto shared_irq_free;
+
+	return 0;
+
+shared_irq_free:
+	if (priv->info.shared_irq_cnt)
+		rzg2l_irqc_shared_irq_free(priv, hwirq);
+
+	return ret;
+}
 
-	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &priv->fwspec[hwirq]);
+static void rzg2l_irqc_free(struct irq_domain *domain, unsigned int virq, unsigned int nr_irqs)
+{
+	struct rzg2l_irqc_priv *priv = domain->host_data;
+
+	irq_domain_free_irqs_common(domain, virq, nr_irqs);
+
+	if (priv->info.shared_irq_cnt) {
+		struct irq_data *d = irq_domain_get_irq_data(domain, virq);
+
+		rzg2l_irqc_shared_irq_free(priv, irqd_to_hwirq(d));
+	}
 }
 
 static const struct irq_domain_ops rzg2l_irqc_domain_ops = {
 	.alloc = rzg2l_irqc_alloc,
-	.free = irq_domain_free_irqs_common,
+	.free = rzg2l_irqc_free,
 	.translate = irq_domain_translate_twocell,
 };
 
@@ -718,6 +829,7 @@ static const struct rzg2l_hw_info rzg3l_hw_params = {
 	.irq_count	= 16,
 	.tint_start	= IRQC_IRQ_START + 16,
 	.num_irq	= IRQC_IRQ_START + 16 + IRQC_TINT_COUNT,
+	.shared_irq_cnt	= IRQC_SHARED_IRQ_COUNT,
 };
 
 static const struct rzg2l_hw_info rzg2l_hw_params = {
-- 
2.43.0


