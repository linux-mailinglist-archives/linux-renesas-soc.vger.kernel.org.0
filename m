Return-Path: <linux-renesas-soc+bounces-12638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD20A208E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6A961884815
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DD019D087;
	Tue, 28 Jan 2025 10:47:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6B719ADB0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 10:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738061270; cv=none; b=bc/EH7Fv8rUMVi9L7jDiMYY/cOkyu+jG8YCgb16UATR0wRG0poRKJoKZ3moBPOLRz5srhi6Yve+ZekNpHirDdobILaldCYaTZoHWnmWJ8lHgkfz3Nq88lqzFNXf5DNA4hw/uKr2zRGb9/KIHUOifvjNuy0KfhlG747i/nOeSWno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738061270; c=relaxed/simple;
	bh=OPHIBdHQqVa3F51f6z+fApV7XM6ARw+uH+/1zx9NqNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bmd6MgSxfr7UsxGsMsin3V1C9spiCIwUKU+QHykIt0jnKJegD0c/gbRuu61E3Gg/tJI0sMmoGBbKCbeFD+J9uA0PdaEQsVVw9nPlHPG0GVfO5fyV8IV2XafSzwxGHzyCcJMQI5hLJ6yUw8CX7xawyj5+jyMa/pevIb9oDFDyhZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: CgyUQU4yTxCaYT+Gr2rRWw==
X-CSE-MsgGUID: OAPEZI6bSVWU4BEqSKFRkg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 Jan 2025 19:47:48 +0900
Received: from localhost.localdomain (unknown [10.226.93.131])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7A48141FB5A8;
	Tue, 28 Jan 2025 19:47:46 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v3 09/13] irqchip/renesas-rzv2h: Add tssr_k variable to struct rzv2h_hw_info
Date: Tue, 28 Jan 2025 10:46:59 +0000
Message-ID: <20250128104714.80807-10-biju.das.jz@bp.renesas.com>
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

On RZ/G3E the number of TSSR registers is 15 compared to 8 on RZ/V2H and
each TSSR register can program 2 TINTs compared to 4 on RZ/V2H.

Add tssr_k variable to struct rzv2h_hw_info to handle this difference and
drop the macros ICU_TSSR_K and ICU_TSSR_TSSEL_N.

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Collected tags.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index b52f5a85ce1c..745614f6991c 100644
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
+ * @tssr_k:		TSSR index k
  */
 struct rzv2h_hw_info {
 	u16		t_offs;
 	u8		max_tssel;
+	u8		tssr_k;
 };
 
 /**
@@ -145,8 +145,8 @@ static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
 		return;
 
 	tint_nr = hw_irq - ICU_TINT_START;
-	k = ICU_TSSR_K(tint_nr);
-	tssel_n = ICU_TSSR_TSSEL_N(tint_nr);
+	k = tint_nr / priv->info->tssr_k;
+	tssel_n = tint_nr % priv->info->tssr_k;
 
 	guard(raw_spinlock)(&priv->lock);
 	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(k));
@@ -308,8 +308,8 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	hwirq = irqd_to_hwirq(d);
 	tint_nr = hwirq - ICU_TINT_START;
 
-	tssr_k = ICU_TSSR_K(tint_nr);
-	tssel_n = ICU_TSSR_TSSEL_N(tint_nr);
+	tssr_k = tint_nr / priv->info->tssr_k;
+	tssel_n = tint_nr % priv->info->tssr_k;
 
 	titsr_k = ICU_TITSR_K(tint_nr);
 	titsel_n = ICU_TITSR_TITSEL_N(tint_nr);
@@ -519,6 +519,7 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
 static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.t_offs		= 0,
 	.max_tssel	= ICU_RZV2H_TSSEL_MAX_VAL,
+	.tssr_k		= 4,
 };
 
 static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
-- 
2.43.0


