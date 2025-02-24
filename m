Return-Path: <linux-renesas-soc+bounces-13583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E449A42022
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 14:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34BD7189969E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 13:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6E5248888;
	Mon, 24 Feb 2025 13:13:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE14623BD1D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 13:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740402808; cv=none; b=rCzDgX1J0kIxafQC8IgPaq0bG4Iy/hQB1ODoQQPRbGlsgINmjPqecITc0CeMzPq0JrjI+vJTusd1D0emPhoOBRRRhY5qis7gAh2jNhp5+pVum9W7T5zZ0yksWvUyxSw/uCU3DgrLrcI/HAYLra8EgFvLbYgubLyNVi94m3cv94s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740402808; c=relaxed/simple;
	bh=kOK9pORKgSsTL9tjkfNyMGPWVVF/5QiOZCxgnXLxBHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aCVaEvHFi27K6QPB2fuMb7ofO5/FBMJOVOkx0uBbZqlCAyrsjG280rY+BTvnSn/vNslr0hFjYrPXAcYGDrtIYX7LaTbGalfzTL6odVhzw1S+P2/SFifD8G1/5IchdrbgQFbT3lsSJ1lfITR7y9NeTgv26nL6ojGvw3PShnUNp6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: KUzW6EWBTg204IQNAbPtcg==
X-CSE-MsgGUID: n/VL1BWHQ6KtGmXPb6JNFw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Feb 2025 22:13:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.231])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E3C0C400F319;
	Mon, 24 Feb 2025 22:13:23 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 09/12] irqchip/renesas-rzv2h: Add field_width variable to struct rzv2h_hw_info
Date: Mon, 24 Feb 2025 13:11:25 +0000
Message-ID: <20250224131253.134199-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224131253.134199-1-biju.das.jz@bp.renesas.com>
References: <20250224131253.134199-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RZ/G3E the field width for TSSR register for a TINT is 16 compared to 8
on the RZ/V2H. Add field_width variable to struct rzv2h_hw_info to handle
this difference and drop the macros ICU_TSSR_K and ICU_TSSR_TSSEL_N as
(32 / field_width) provides the number of tints in TSSR register.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change.
v4->v5:
 * Added Rb tag from Geert.
v4:
 New patch using field_width to handle the differences.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 2fae3274c015..98a6a7cd3611 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -64,8 +64,6 @@
 #define ICU_TINT_LEVEL_HIGH			2
 #define ICU_TINT_LEVEL_LOW			3
 
-#define ICU_TSSR_K(tint_nr)			((tint_nr) / 4)
-#define ICU_TSSR_TSSEL_N(tint_nr)		((tint_nr) % 4)
 #define ICU_TSSR_TSSEL_PREP(tssel, n)		((tssel) << ((n) * 8))
 #define ICU_TSSR_TSSEL_MASK(n)			ICU_TSSR_TSSEL_PREP(0x7F, n)
 #define ICU_TSSR_TIEN(n)			(BIT(7) << ((n) * 8))
@@ -84,10 +82,12 @@
  * struct rzv2h_hw_info - Interrupt Control Unit controller hardware info structure.
  * @t_offs:		TINT offset
  * @max_tssel:		TSSEL max value
+ * @field_width:	TSSR field width
  */
 struct rzv2h_hw_info {
 	u16		t_offs;
 	u8		max_tssel;
+	u8		field_width;
 };
 
 /**
@@ -140,13 +140,15 @@ static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
 	struct rzv2h_icu_priv *priv = irq_data_to_priv(d);
 	unsigned int hw_irq = irqd_to_hwirq(d);
 	u32 tint_nr, tssel_n, k, tssr;
+	u8 nr_tint;
 
 	if (hw_irq < ICU_TINT_START)
 		return;
 
 	tint_nr = hw_irq - ICU_TINT_START;
-	k = ICU_TSSR_K(tint_nr);
-	tssel_n = ICU_TSSR_TSSEL_N(tint_nr);
+	nr_tint = 32 / priv->info->field_width;
+	k = tint_nr / nr_tint;
+	tssel_n = tint_nr % nr_tint;
 
 	guard(raw_spinlock)(&priv->lock);
 	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(k));
@@ -278,6 +280,7 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	unsigned int hwirq;
 	u32 tint, sense;
 	int tint_nr;
+	u8 nr_tint;
 
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_LEVEL_LOW:
@@ -308,8 +311,9 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	hwirq = irqd_to_hwirq(d);
 	tint_nr = hwirq - ICU_TINT_START;
 
-	tssr_k = ICU_TSSR_K(tint_nr);
-	tssel_n = ICU_TSSR_TSSEL_N(tint_nr);
+	nr_tint = 32 / priv->info->field_width;
+	tssr_k = tint_nr / nr_tint;
+	tssel_n = tint_nr % nr_tint;
 	tien = ICU_TSSR_TIEN(tssel_n);
 
 	titsr_k = ICU_TITSR_K(tint_nr);
@@ -519,6 +523,7 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
 static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.t_offs		= 0,
 	.max_tssel	= ICU_RZV2H_TSSEL_MAX_VAL,
+	.field_width	= 8,
 };
 
 static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
-- 
2.43.0


