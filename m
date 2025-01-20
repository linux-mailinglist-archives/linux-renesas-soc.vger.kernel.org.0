Return-Path: <linux-renesas-soc+bounces-12258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE5EA169DD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 10:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6336016915E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 09:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B4219995A;
	Mon, 20 Jan 2025 09:47:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F44D19AD8D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737366471; cv=none; b=hJUGfX9yk8QC51TSuSw3eF820oDxOY91Q23LlaSwgOmUzAnTaJ3omnvFks29Z0fkcrNdcxGvAwu66T52szE/AvEDF6KpwiS4/5r9rXWahoYMHbAvTi5vCxCERbcgCbMyZrCNu0Zze50Vw/fslGTItOnCfNGrA5jrroCU9AL/Gek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737366471; c=relaxed/simple;
	bh=anfJhPi63UaKVVshQcMUJju/uf5P6nBTgOo1sxCFSFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MHmUYV0W35rv4VuypnQGzJVHDbDJiSxRVq9SEQBV9lQ0SYbJvzvVKQEqTssEZchB2fSiu7Eoxi1mPI2LVVwYifi1YVjIL6FQjTRXO6HA/jDZ55Tyej7yVo57/WGH4Fy8z/IoDNm4B7QeQvXdxEbWWPlBzN8Blo7HYs9TJQ9VhAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ZmZtv86XRay4ZGaG3p/e4Q==
X-CSE-MsgGUID: 2coP6KzIRViVuwHTyQ7vng==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Jan 2025 18:47:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id ACA3E400F73B;
	Mon, 20 Jan 2025 18:47:46 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 10/11] irqchip/renesas-rzv2h: Add RZ/G3E support
Date: Mon, 20 Jan 2025 09:47:06 +0000
Message-ID: <20250120094715.25802-11-biju.das.jz@bp.renesas.com>
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

The ICU block on the RZ/G3E SoC is almost identical to the one found on
the RZ/V2H SoC, with the following differences:
 - The TINT register offset starts at 0x830 instead of 0x30.
 - The number of GPIO interrupts for TINT selection is 141 instead of 86.
 - The pin index and TINT selection index are not in the 1:1 map
 - The number of TSSR registers is 15 instead of 8
 - Each TSSR register can program 2 TINTs instead of 4 TINTs

Add support for the RZ/G3E driver by filling the rzv2h_hw_info table and
adding LUT for mapping between pin index and TINT selection index.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzv2h.c | 47 +++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index a1ca34d33c93..a0d79b357379 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -75,6 +75,7 @@
 
 /**
  * struct rzv2h_hw_info - Interrupt Control Unit controller hardware info structure.
+ * @tssel_lut: TINT lookup table
  * @t_offs: TINT offset
  * @tien: TIEN mask
  * @tssel_mask: TSSEL mask
@@ -83,6 +84,7 @@
  * @tssr_k: TSSR index k
  */
 struct rzv2h_hw_info {
+	const u8 *tssel_lut;
 	u16 t_offs;
 	u16 tien;
 	u16 tssel_mask;
@@ -306,6 +308,9 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	if (tint > priv->info->max_tssel)
 		return -EINVAL;
 
+	if (priv->info->tssel_lut)
+		tint = priv->info->tssel_lut[tint & 0xff];
+
 	hwirq = irqd_to_hwirq(d);
 	tint_nr = hwirq - ICU_TINT_START;
 
@@ -514,6 +519,42 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
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
+	.tssel_lut = rzg3e_tssel_lut,
+	.t_offs = 0x800,
+	.max_tssel = 0x8c,
+	.tien = BIT(15),
+	.tssel_mask = GENMASK(7, 0),
+	.tssel_shift = 16,
+	.tssr_k = 2,
+};
+
 static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.t_offs = 0,
 	.max_tssel = 0x55,
@@ -523,12 +564,18 @@ static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.tssr_k = 4,
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


