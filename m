Return-Path: <linux-renesas-soc+bounces-12643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE30EA208E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12252188521F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37D519DF66;
	Tue, 28 Jan 2025 10:48:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC8619D07E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738061289; cv=none; b=UTY0WGqXEtOnZN1Cp6NzEP83FudIcxFiI9I6ipI07g3pj+9dN4tpyy1RQRSOY1xlB2axtTuiO7fu7zYTtwgVO8J6bIRvrdZVM2lMrEEorVePhaXhbhFuMRaTlnI9mENSbWQ3OZWnd4dwVlZOCAxwetuBRgv9jB0dnUrLYhZ72Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738061289; c=relaxed/simple;
	bh=zGrCifU2XbsVoSvwMOEQ2xndIQBqnm32ZoIJXF99O3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2SFcLfLps0yRDLljk5qKOZAaArC4Z8dlYeKz3Ku61Hq8G3IjKwb2cSxiZ9Lr4pwrKb3o9S+j8IpaZXl41Mr3m64gnMuwT5oy+D17b950fKwcfm9mKsVXgGUnozgxDzrf3VveLp9ShpPT7xKuwx1F+viMpRHMd8Z3N74dlAZMVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: j+kneovlQvaBEKA3UqdDfw==
X-CSE-MsgGUID: VPd6rxuYQb6Wq0azCJrkBA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Jan 2025 19:48:07 +0900
Received: from localhost.localdomain (unknown [10.226.93.131])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 801C141FB5AF;
	Tue, 28 Jan 2025 19:47:55 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v3 12/13] irqchip/renesas-rzv2h: Add RZ/G3E support
Date: Tue, 28 Jan 2025 10:47:02 +0000
Message-ID: <20250128104714.80807-13-biju.das.jz@bp.renesas.com>
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

The ICU block on the RZ/G3E SoC is almost identical to the one found on
the RZ/V2H SoC, with the following differences:
 - The TINT register offset starts at 0x830 instead of 0x30.
 - The number of GPIO interrupts for TINT selection is 141 instead of 86.
 - The pin index and TINT selection index are not in the 1:1 map
 - The number of TSSR registers is 15 instead of 8
 - Each TSSR register can program 2 TINTs instead of 4 TINTs

Add support for the RZ/G3E driver by filling the rzv2h_hw_info table and
adding LUT for mapping between pin index and TINT selection index.

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Introduced ICU_RZG3E_{TSSEL_MAX_VAL,TINT_OFFSET} macros and used these
   macros in struct rzv2h_hw_params rather than using the hex constants.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 49 +++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index ec6e49d248d7..6f59eeeb5b3d 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -72,10 +72,13 @@
 
 #define ICU_TINT_EXTRACT_HWIRQ(x)		FIELD_GET(GENMASK(15, 0), (x))
 #define ICU_TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
+#define ICU_RZG3E_TINT_OFFSET			0x800
+#define ICU_RZG3E_TSSEL_MAX_VAL			0x8c
 #define ICU_RZV2H_TSSEL_MAX_VAL			0x55
 
 /**
  * struct rzv2h_hw_info - Interrupt Control Unit controller hardware info structure.
+ * @tssel_lut:		TINT lookup table
  * @t_offs:		TINT offset
  * @tien:		TIEN mask
  * @tssel_mask:		TSSEL mask
@@ -84,6 +87,7 @@
  * @tssr_k:		TSSR index k
  */
 struct rzv2h_hw_info {
+	const u8	*tssel_lut;
 	u16		t_offs;
 	u16		tien;
 	u16		tssel_mask;
@@ -307,6 +311,9 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	if (tint > priv->info->max_tssel)
 		return -EINVAL;
 
+	if (priv->info->tssel_lut)
+		tint = priv->info->tssel_lut[tint & 0xff];
+
 	hwirq = irqd_to_hwirq(d);
 	tint_nr = hwirq - ICU_TINT_START;
 
@@ -518,6 +525,42 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
 	return ret;
 }
 
+/* Mapping based on port index on Table 4.2-6 and TSSEL bits on Table 4.6-4 */
+static const u8 rzg3e_tssel_lut[] = {
+	81, 82, 83, 84, 85, 86, 87, 88,		/* P00-P07 */
+	89, 90, 91, 92, 93, 94, 95, 96,		/* P10-P17 */
+	111, 112,				/* P20-P21 */
+	97, 98, 99, 100, 101, 102, 103, 104,	/* P30-P37 */
+	105, 106, 107, 108, 109, 110,		/* P40-P45 */
+	113, 114, 115, 116, 117, 118, 119,	/* P50-P56 */
+	120, 121, 122, 123, 124, 125, 126,	/* P60-P66 */
+	127, 128, 129, 130, 131, 132, 133, 134,	/* P70-P77 */
+	135, 136, 137, 138, 139, 140,		/* P80-P85 */
+	43, 44, 45, 46, 47, 48, 49, 50,		/* PA0-PA7 */
+	51, 52, 53, 54, 55, 56, 57, 58,		/* PB0-PB7 */
+	59, 60,	61,				/* PC0-PC2 */
+	62, 63, 64, 65, 66, 67, 68, 69,		/* PD0-PD7 */
+	70, 71, 72, 73, 74, 75, 76, 77,		/* PE0-PE7 */
+	78, 79, 80,				/* PF0-PF2 */
+	25, 26, 27, 28, 29, 30, 31, 32,		/* PG0-PG7 */
+	33, 34, 35, 36, 37, 38,			/* PH0-PH5 */
+	4, 5, 6, 7, 8,				/* PJ0-PJ4 */
+	39, 40, 41, 42,				/* PK0-PK3 */
+	9, 10, 11, 12, 21, 22, 23, 24,		/* PL0-PL7 */
+	13, 14, 15, 16, 17, 18, 19, 20,		/* PM0-PM7 */
+	0, 1, 2, 3				/* PS0-PS3 */
+};
+
+static const struct rzv2h_hw_info rzg3e_hw_params = {
+	.tssel_lut	= rzg3e_tssel_lut,
+	.t_offs		= ICU_RZG3E_TINT_OFFSET,
+	.tien		= BIT(15),
+	.tssel_mask	= GENMASK(7, 0),
+	.tssel_shift	= 16,
+	.max_tssel	= ICU_RZG3E_TSSEL_MAX_VAL,
+	.tssr_k		= 2,
+};
+
 static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.t_offs		= 0,
 	.tien		= BIT(7),
@@ -527,12 +570,18 @@ static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.tssr_k		= 4,
 };
 
+static int rzg3e_icu_init(struct device_node *node, struct device_node *parent)
+{
+	return rzv2h_icu_init_common(node, parent, &rzg3e_hw_params);
+}
+
 static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 {
 	return rzv2h_icu_init_common(node, parent, &rzv2h_hw_params);
 }
 
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzv2h_icu)
+IRQCHIP_MATCH("renesas,r9a09g047-icu", rzg3e_icu_init)
 IRQCHIP_MATCH("renesas,r9a09g057-icu", rzv2h_icu_init)
 IRQCHIP_PLATFORM_DRIVER_END(rzv2h_icu)
 MODULE_AUTHOR("Fabrizio Castro <fabrizio.castro.jz@renesas.com>");
-- 
2.43.0


