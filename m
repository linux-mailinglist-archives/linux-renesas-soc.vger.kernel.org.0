Return-Path: <linux-renesas-soc+bounces-12564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F51A1D56F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 527DC18875A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 11:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726DF1FECBF;
	Mon, 27 Jan 2025 11:38:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72AB1FE454
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 11:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737977880; cv=none; b=MIQoKNFO342iqJ5nAnqP2X3baqIMZxxjfXI/+5C2IahoygSpMZ03WkVCRoprYyyeINCkI9DizYyMceiCrXFPew1xR8Iu8KZtimnA9FnM74nQkX0yOjHMxaZbgCKvu6fdqfw7ocymgTct3TtKtG5AXnv16LAb11oC3noDk+6XhUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737977880; c=relaxed/simple;
	bh=/WDBBTcM0f79wtJckESvuJoZSoHrr0/1K7SpCR58i+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETNdKRUma8hy85SDxhIYCx4Y8Gaurv8p8LBOymG/3HiGikeGejms2oSJ3W6fPuSpfCWmqmozi1eSMzLqzwbq6tkL0fUyvo8LE0G6eh/88rVf/ZOfLBcl/mq/NrY84QJnFMC8og9WlHPdlEFoJTYnAVmgc4IJ5sKthX1+0GJecjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: GhBrGZ/MQ5KG8BdutO/Geg==
X-CSE-MsgGUID: 14AyIV8iT/CUtSSNtom+zQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 27 Jan 2025 20:37:57 +0900
Received: from localhost.localdomain (unknown [10.226.94.28])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1A99341F25AC;
	Mon, 27 Jan 2025 20:37:48 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 07/12] irqchip/renesas-rzv2h: Add max_tssel variable to struct rzv2h_hw_info
Date: Mon, 27 Jan 2025 11:37:02 +0000
Message-ID: <20250127113723.24479-8-biju.das.jz@bp.renesas.com>
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

The number of GPIO interrupts on RZ/G3E for TINT selection is 141 compared
to 86 on RZ/V2H. Rename the macro ICU_PB5_TINT->ICU_RZV2H_TSSEL_MAX_VAL to
hold this difference for RZ/V2H.

Add max_tssel variable to struct rzv2h_hw_info to handle this difference.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Renamed the macro ICU_PB5_TINT->ICU_RZV2H_TSSEL_MAX_VAL.
 * Replaced hexa decimal constant with ICU_RZV2H_TSSEL_MAX_VAL in struct
   rzv2h_hw_params.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 663f8a69c916..211da5ab0d7f 100644
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
@@ -514,6 +515,7 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
 
 static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.t_offs		= 0,
+	.max_tssel	= ICU_RZV2H_TSSEL_MAX_VAL,
 };
 
 static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
-- 
2.43.0


