Return-Path: <linux-renesas-soc+bounces-12566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64882A1D571
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C13FD16377E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 11:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3875E1FECC9;
	Mon, 27 Jan 2025 11:38:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954E01FECBF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 11:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737977884; cv=none; b=LkjljjUv47ghG8ODaA/Wphdy1es8oe6GjqhsxbhOJeU1fg62ft6F+ai/XmUuI1kyWs2hhN9A6ocRGHEwso9+HZ8gjgLq26ZKkUIxiEOiX9sYr0OpQaoxqLQzmak88MB9h2/BQJGzjAquiQlBK4tODtAOnIlizYxkzW3Hvqax+EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737977884; c=relaxed/simple;
	bh=DI5VZjEpYnsGLIbTCtzKqxfCMEZFjr20wm4kcJBF0ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0K2EITEgE4OW9uhHo9PNMncwKIASsFfVo4Ux6A7micCwI38gkuNNDOApInh3Ciz0hpINbPayCKlwHH30KNmJJSd67aE5fZQEe/brTyBGURkby9oO2L4JtbZb15zjn8MwEHMfTU6Sj6+U9LxRkYfN0353mLstzn8dlCzmcWRCBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: dEWKIgURT2KYUSrQjXPFBQ==
X-CSE-MsgGUID: 2jj3lG1uSFq4OnH7U4R/cQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Jan 2025 20:38:01 +0900
Received: from localhost.localdomain (unknown [10.226.94.28])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 930F641F25B5;
	Mon, 27 Jan 2025 20:37:54 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v2 09/12] irqchip/renesas-rzv2h: Add tssel_mask and tssel_shift variables to struct rzv2h_hw_info
Date: Mon, 27 Jan 2025 11:37:04 +0000
Message-ID: <20250127113723.24479-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127113723.24479-1-biju.das.jz@bp.renesas.com>
References: <20250127113723.24479-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * Collected tags.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index cfc1ff6307cb..cff1f49bb130 100644
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
 
@@ -515,6 +517,8 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
 
 static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.t_offs		= 0,
+	.tssel_mask	= GENMASK(6, 0),
+	.tssel_shift	= 8,
 	.max_tssel	= ICU_RZV2H_TSSEL_MAX_VAL,
 	.tssr_k		= 4,
 };
-- 
2.43.0


