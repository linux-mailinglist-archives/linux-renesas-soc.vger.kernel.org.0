Return-Path: <linux-renesas-soc+bounces-12261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C048DA169E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 10:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C693B7A051A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 09:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266F419AD8D;
	Mon, 20 Jan 2025 09:47:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8978818801A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737366478; cv=none; b=lqKrfR/t9hDpTxYzAXZHYfT0lUjQXtbRN97QIsBgUafIjPcwPHXeBY/8H+RHWS310yksmVx/q+QFoiOAEiNcyuchQU4zlzppbTw8CaJt5g9m2zuGCGi2Jxf+dK3Y6+ubIokRuOPnCbMT7cohl472bJASqE+0eesRJHcAkhRHxgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737366478; c=relaxed/simple;
	bh=MFtqXWPV5pxlTSmL1kzkfK/sKN8cbFLAwmXu2n2J/Rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HbcH+Cs4MgmOzUdtHFjy0uUtIGaYl8yI0fomvWqMFuTmwdNjcWQecEpTZW9pcKTLNuwFwoiqByNbRfSViVduSYaRt8ldaz+qmKNYdWptIimKlBQtRO2/nJFxdOVr5Wrt+RyKVvBR533YV0uIekiqCM3yehDWsZaw79QXAJqn5no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 8zAZ2dkXRf+Dswbbn42LbA==
X-CSE-MsgGUID: bJE+MDHvTuCmJV+EvIEpuw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Jan 2025 18:47:55 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8407D401BEE9;
	Mon, 20 Jan 2025 18:47:41 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 08/11] irqchip/renesas-rzv2h: Add tssel_mask and tssel_shift variables to struct rzv2h_hw_info
Date: Mon, 20 Jan 2025 09:47:04 +0000
Message-ID: <20250120094715.25802-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzv2h.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index a9a9723ff4bb..5990dcf72ef0 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -64,8 +64,6 @@
 #define ICU_TINT_LEVEL_HIGH			2
 #define ICU_TINT_LEVEL_LOW			3
 
-#define ICU_TSSR_TSSEL_PREP(tssel, n)		((tssel) << ((n) * 8))
-#define ICU_TSSR_TSSEL_MASK(n)			ICU_TSSR_TSSEL_PREP(0x7F, n)
 #define ICU_TSSR_TIEN(n)			(BIT(7) << ((n) * 8))
 
 #define ICU_TITSR_K(tint_nr)			((tint_nr) / 16)
@@ -80,11 +78,15 @@
 /**
  * struct rzv2h_hw_info - Interrupt Control Unit controller hardware info structure.
  * @t_offs: TINT offset
+ * @tssel_mask: TSSEL mask
+ * @tssel_shift: TSSEL shift
  * @max_tssel: TSSEL max value
  * @tssr_k: TSSR index k
  */
 struct rzv2h_hw_info {
 	u16 t_offs;
+	u16 tssel_mask;
+	u8 tssel_shift;
 	u8 max_tssel;
 	u8 tssr_k;
 };
@@ -317,8 +319,8 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	guard(raw_spinlock)(&priv->lock);
 
 	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
-	tssr &= ~(ICU_TSSR_TSSEL_MASK(tssel_n) | tien);
-	tssr |= ICU_TSSR_TSSEL_PREP(tint, tssel_n);
+	tssr &= ~((priv->info->tssel_mask << (tssel_n * priv->info->tssel_shift)) | tien);
+	tssr |= (tint << (tssel_n * priv->info->tssel_shift));
 
 	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
 
@@ -515,6 +517,8 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
 static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.t_offs = 0,
 	.max_tssel = 0x55,
+	.tssel_mask = GENMASK(6, 0),
+	.tssel_shift = 8,
 	.tssr_k = 4,
 };
 
-- 
2.43.0


