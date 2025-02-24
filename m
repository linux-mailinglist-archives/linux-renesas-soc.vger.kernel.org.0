Return-Path: <linux-renesas-soc+bounces-13586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D19A42016
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 14:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F6EE16625B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 13:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475B324888A;
	Mon, 24 Feb 2025 13:13:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8EE248863
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 13:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740402816; cv=none; b=ewlII8JmytUQ4u7QvRf7jKYXySuar7gbR+Me63AzN8b1Hm0NaBWXDBP3vclwmbozj+5zn4wE/ykW4gbvb9QtNHmT/wu4UoY8CDcAnw0ATPv2fGteHlvT6YrJYPqtCqw4PKNRhPXMlcc6n2cBeNq6eQ1cI3UfrrI+RkyhbKC3wg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740402816; c=relaxed/simple;
	bh=MXEVrojEEbFPNDOMID3ecIwq/an7Q71eHIXKv3f28go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHQkmCt13AY7QiF3YtlY6r1I6+MBbOGn5dN/6pEHnjCGYu0vwmqjF3Pba91ESilSkEsOLMlr6iO5yjeRIGUu3tZz1b+kJhZiTV+aUSpRTT3xmvvcbdcNhyIZVYQU/oDCYG7nS4FH4IYbX/PABcU0lZ7SO5vn51/+IHPrSSFG5WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: w4qj20IdRVqQ7wg4dLXnHQ==
X-CSE-MsgGUID: GGPVunLGQeCfo05ZE3qQOw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Feb 2025 22:13:33 +0900
Received: from localhost.localdomain (unknown [10.226.92.231])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0EC03400F319;
	Mon, 24 Feb 2025 22:13:30 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v6 12/12] irqchip/renesas-rzv2h: Add RZ/G3E support
Date: Mon, 24 Feb 2025 13:11:28 +0000
Message-ID: <20250224131253.134199-13-biju.das.jz@bp.renesas.com>
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

The ICU block on the RZ/G3E SoC is almost identical to the one found on
the RZ/V2H SoC, with the following differences:
 - The TINT register base offset is 0x800 instead of zero.
 - The number of GPIO interrupts for TINT selection is 141 instead of 86.
 - The pin index and TINT selection index are not in the 1:1 map.
 - The number of TSSR registers is 16 instead of 8.
 - Each TSSR register can program 2 TINTs instead of 4 TINTs.

Add support for the RZ/G3E driver by filling the rzv2h_hw_info table and
adding LUT for mapping between pin index and TINT selection index.

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change
v4->v5:
 * Added Rb tag from Geert.
v3->v4:
 * Updated commit description fixing typos
 * Updated rzg3e_hw_params with .field_width and dropped .tien,
  .tssel_mask,.tssel_shift, .tssr_k as it can be derived from former.
v2->v3:
 * No change.
v1->v2:
 * Introduced ICU_RZG3E_{TSSEL_MAX_VAL,TINT_OFFSET} macros and used these
   macros in struct rzv2h_hw_params rather than using the hex constants.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 351303839636..edc45ed0e02d 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -85,15 +85,19 @@
 
 #define ICU_TINT_EXTRACT_HWIRQ(x)		FIELD_GET(GENMASK(15, 0), (x))
 #define ICU_TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
+#define ICU_RZG3E_TINT_OFFSET			0x800
+#define ICU_RZG3E_TSSEL_MAX_VAL			0x8c
 #define ICU_RZV2H_TSSEL_MAX_VAL			0x55
 
 /**
  * struct rzv2h_hw_info - Interrupt Control Unit controller hardware info structure.
+ * @tssel_lut:		TINT lookup table
  * @t_offs:		TINT offset
  * @max_tssel:		TSSEL max value
  * @field_width:	TSSR field width
  */
 struct rzv2h_hw_info {
+	const u8	*tssel_lut;
 	u16		t_offs;
 	u8		max_tssel;
 	u8		field_width;
@@ -317,6 +321,9 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	if (tint > priv->info->max_tssel)
 		return -EINVAL;
 
+	if (priv->info->tssel_lut)
+		tint = priv->info->tssel_lut[tint];
+
 	hwirq = irqd_to_hwirq(d);
 	tint_nr = hwirq - ICU_TINT_START;
 
@@ -529,18 +536,57 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
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
+	.max_tssel	= ICU_RZG3E_TSSEL_MAX_VAL,
+	.field_width	= 16,
+};
+
 static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.t_offs		= 0,
 	.max_tssel	= ICU_RZV2H_TSSEL_MAX_VAL,
 	.field_width	= 8,
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


