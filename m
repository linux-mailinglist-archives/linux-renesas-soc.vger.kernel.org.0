Return-Path: <linux-renesas-soc+bounces-12260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D231A169E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 10:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48D0A3A169D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 09:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807A31A9B49;
	Mon, 20 Jan 2025 09:47:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C761AB6D8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 09:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737366475; cv=none; b=ZcPDwp0tkkDqViYaJb6O+vvRxXBFnKCOT50hhyKoKfkS78gk+CpONrfSbZVw3b+lO14JpeqyEk/htwHTpia3VywDgoA7vBgWGRALOdPwNzqYoxWJr3EFIY4zIV9d06dkZaGVgF7za1QgLU6so9cjEdwy9xpGMbrVRVyc9zJsDsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737366475; c=relaxed/simple;
	bh=LjmqqFmkALN6vcrIr2GGvUFTdCZnwZWzv13X4yW0GoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IdR976Hhs8UoVmtj5L3XGqDS4FGo+NMe+Hz0edUEzzBnwNaIaXVfDNOLpo38po0Io04UMihANFXQ5C+nQOSjxg28roIxGHYvh+c6mAlw+hTwiefqjGTHbBhfE7DXD7uNLfXA+7kwUOWU2HbRJgLly8R1pdq95PkrUWPlLq3wDqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: eWYAklcDQaytO4poDgdSPw==
X-CSE-MsgGUID: sX6TSmQMSDuAaSQ7dzS59Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Jan 2025 18:47:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 18BF8401A629;
	Mon, 20 Jan 2025 18:47:38 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 07/11] irqchip/renesas-rzv2h: Add tssr_k variable to struct rzv2h_hw_info
Date: Mon, 20 Jan 2025 09:47:03 +0000
Message-ID: <20250120094715.25802-8-biju.das.jz@bp.renesas.com>
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

On RZ/G3E the number of TSSR registers is 15 compared to 8 on RZ/V2H and
each TSSR register can program 2 TINTs compared to 4 on RZ/V2H.

Add tssr_k variable to struct rzv2h_hw_info to handle this difference and
drop the macros ICU_TSSR_K and ICU_TSSR_TSSEL_N.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzv2h.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index b244cd61cba4..a9a9723ff4bb 100644
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
@@ -83,10 +81,12 @@
  * struct rzv2h_hw_info - Interrupt Control Unit controller hardware info structure.
  * @t_offs: TINT offset
  * @max_tssel: TSSEL max value
+ * @tssr_k: TSSR index k
  */
 struct rzv2h_hw_info {
 	u16 t_offs;
 	u8 max_tssel;
+	u8 tssr_k;
 };
 
 /**
@@ -144,8 +144,8 @@ static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
 		return;
 
 	tint_nr = hw_irq - ICU_TINT_START;
-	k = ICU_TSSR_K(tint_nr);
-	tssel_n = ICU_TSSR_TSSEL_N(tint_nr);
+	k = tint_nr / priv->info->tssr_k;
+	tssel_n = tint_nr % priv->info->tssr_k;
 
 	guard(raw_spinlock)(&priv->lock);
 	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(k));
@@ -307,8 +307,8 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	hwirq = irqd_to_hwirq(d);
 	tint_nr = hwirq - ICU_TINT_START;
 
-	tssr_k = ICU_TSSR_K(tint_nr);
-	tssel_n = ICU_TSSR_TSSEL_N(tint_nr);
+	tssr_k = tint_nr / priv->info->tssr_k;
+	tssel_n = tint_nr % priv->info->tssr_k;
 
 	titsr_k = ICU_TITSR_K(tint_nr);
 	titsel_n = ICU_TITSR_TITSEL_N(tint_nr);
@@ -515,6 +515,7 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
 static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.t_offs = 0,
 	.max_tssel = 0x55,
+	.tssr_k = 4,
 };
 
 static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
-- 
2.43.0


