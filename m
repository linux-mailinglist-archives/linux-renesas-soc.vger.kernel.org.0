Return-Path: <linux-renesas-soc+bounces-12637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70531A208DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2B083A617E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29E359B71;
	Tue, 28 Jan 2025 10:47:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1DD19ADB0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 10:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738061268; cv=none; b=ccvbyn2OGfStQ+ONEVU3ViefW26M3kbSEbdyNmtR8ub3dkSc550YAFRl+BKLWqdX1zmsCXp0tkq+nPkmcOHl36VelUc5BUl/2PSTc3yfvm9DFMmzI+xU8tyT/ZjXqzki49lb1Nr9WOVZv08DT/kQbAVBgS5vgLTo/GTa0HPfI+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738061268; c=relaxed/simple;
	bh=NagH3HYTZ242m9K0VuxmfNOSbJSEPoGQEANmAtfTqjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0SlB/IE/UmXQVzawfsIdQ3X4qdZnFJ5GOLhfYZpSQt+NlbfYsq9ZLiwUJE4Z6sMv/XCoo3lYvt9SpbJBKJqiaD1Fnks0Xvo/gFrMdYLI2U595kaMXer2khKa7ONQrdYJqZIDVrlDXsAjwsB4kWr2+IIHr968ynZZcYTzBjQGnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 6FiSKV5HTU6A3rdUYXUDRw==
X-CSE-MsgGUID: 0BS+P+ERRrCgN2L599kGig==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Jan 2025 19:47:45 +0900
Received: from localhost.localdomain (unknown [10.226.93.131])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7931541FB5B5;
	Tue, 28 Jan 2025 19:47:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v3 08/13] irqchip/renesas-rzv2h: Add max_tssel variable to struct rzv2h_hw_info
Date: Tue, 28 Jan 2025 10:46:58 +0000
Message-ID: <20250128104714.80807-9-biju.das.jz@bp.renesas.com>
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

The number of GPIO interrupts on RZ/G3E for TINT selection is 141 compared
to 86 on RZ/V2H. Rename the macro ICU_PB5_TINT->ICU_RZV2H_TSSEL_MAX_VAL to
hold this difference for RZ/V2H.

Add max_tssel variable to struct rzv2h_hw_info to handle this difference.

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Renamed the macro ICU_PB5_TINT->ICU_RZV2H_TSSEL_MAX_VAL.
 * Replaced hexa decimal constant with ICU_RZV2H_TSSEL_MAX_VAL in struct
   rzv2h_hw_params.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index e8014cd096f2..b52f5a85ce1c 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -78,14 +78,16 @@
 
 #define ICU_TINT_EXTRACT_HWIRQ(x)		FIELD_GET(GENMASK(15, 0), (x))
 #define ICU_TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
-#define ICU_PB5_TINT				0x55
+#define ICU_RZV2H_TSSEL_MAX_VAL			0x55
 
 /**
  * struct rzv2h_hw_info - Interrupt Control Unit controller hardware info structure.
  * @t_offs:		TINT offset
+ * @max_tssel:		TSSEL max value
  */
 struct rzv2h_hw_info {
 	u16		t_offs;
+	u8		max_tssel;
 };
 
 /**
@@ -298,13 +300,12 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
+	priv = irq_data_to_priv(d);
 	tint = (u32)(uintptr_t)irq_data_get_irq_chip_data(d);
-	if (tint > ICU_PB5_TINT)
+	if (tint > priv->info->max_tssel)
 		return -EINVAL;
 
-	priv = irq_data_to_priv(d);
 	hwirq = irqd_to_hwirq(d);
-
 	tint_nr = hwirq - ICU_TINT_START;
 
 	tssr_k = ICU_TSSR_K(tint_nr);
@@ -517,6 +518,7 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
 
 static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.t_offs		= 0,
+	.max_tssel	= ICU_RZV2H_TSSEL_MAX_VAL,
 };
 
 static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
-- 
2.43.0


