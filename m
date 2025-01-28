Return-Path: <linux-renesas-soc+bounces-12641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C612A208E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75C6B1885112
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3592F19340D;
	Tue, 28 Jan 2025 10:48:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E04419C554
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738061283; cv=none; b=tY4N88whlvMapK5RgEvTSaDqAv9znPp03B+a644TuWmjkAx4JfzaB+lPkKASU4bj8SCqFcXb/JsTWqL0P2vivLEjVWFxE7hEdt8eJJVcLVwhm6l3w+SdhZNNVG5+J01IA8M3qB2YmN3iWjy68wnfjbq72KvF85s84y9STYj+Blc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738061283; c=relaxed/simple;
	bh=2y4ihA70wzu8NLTkjkxUrrumG5a+SfyRqiWgthQoXso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g49SOzkmcKMreRk2MKcFLeF85yQwBC8I8/ut3S/1QRVLguSKwwmwRLvF984NXs7CLpYGxzjPt4LUWPPZsTGBqAuDMWQLER6UaDhsB8o3HlxK6MHvCDhl8BczHMn7s4lmnDSOVVukVS5TYvXyHSzpNCzOeyDIsdWSTxL4EbS5XAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: H9zN8B0OQuO+zXpj6TSJIQ==
X-CSE-MsgGUID: qP/y9g/wR/aGvm+VNkUfYg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 Jan 2025 19:48:00 +0900
Received: from localhost.localdomain (unknown [10.226.93.131])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7E41841FB5A8;
	Tue, 28 Jan 2025 19:47:49 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v3 10/13] irqchip/renesas-rzv2h: Add tssel_mask and tssel_shift variables to struct rzv2h_hw_info
Date: Tue, 28 Jan 2025 10:47:00 +0000
Message-ID: <20250128104714.80807-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RZ/G3E each TSSR register can program 2 TINTs compared to 4 TINTs on
RZ/V2H. Add tssel_mask and tssel_shift variables to struct rzv2h_hw_info
to simplify the calculations when we add support for RZ/G3E and drop the
macros ICU_TSSR_TSSEL_PREP and ICU_TSSR_TSSEL_MASK.

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Collected tags.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 745614f6991c..fbc6d79e09d9 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -64,8 +64,6 @@
 #define ICU_TINT_LEVEL_HIGH			2
 #define ICU_TINT_LEVEL_LOW			3
 
-#define ICU_TSSR_TSSEL_PREP(tssel, n)		((tssel) << ((n) * 8))
-#define ICU_TSSR_TSSEL_MASK(n)			ICU_TSSR_TSSEL_PREP(0x7F, n)
 #define ICU_TSSR_TIEN(n)			(BIT(7) << ((n) * 8))
 
 #define ICU_TITSR_K(tint_nr)			((tint_nr) / 16)
@@ -81,11 +79,15 @@
 /**
  * struct rzv2h_hw_info - Interrupt Control Unit controller hardware info structure.
  * @t_offs:		TINT offset
+ * @tssel_mask:		TSSEL mask
+ * @tssel_shift:	TSSEL shift
  * @max_tssel:		TSSEL max value
  * @tssr_k:		TSSR index k
  */
 struct rzv2h_hw_info {
 	u16		t_offs;
+	u16		tssel_mask;
+	u8		tssel_shift;
 	u8		max_tssel;
 	u8		tssr_k;
 };
@@ -318,8 +320,8 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	guard(raw_spinlock)(&priv->lock);
 
 	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
-	tssr &= ~(ICU_TSSR_TSSEL_MASK(tssel_n) | tien);
-	tssr |= ICU_TSSR_TSSEL_PREP(tint, tssel_n);
+	tssr &= ~((priv->info->tssel_mask << (tssel_n * priv->info->tssel_shift)) | tien);
+	tssr |= (tint << (tssel_n * priv->info->tssel_shift));
 
 	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
 
@@ -518,6 +520,8 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
 
 static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.t_offs		= 0,
+	.tssel_mask	= GENMASK(6, 0),
+	.tssel_shift	= 8,
 	.max_tssel	= ICU_RZV2H_TSSEL_MAX_VAL,
 	.tssr_k		= 4,
 };
-- 
2.43.0


