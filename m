Return-Path: <linux-renesas-soc+bounces-13585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 681D7A42014
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 14:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97CE83A6C69
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 13:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC2023BD05;
	Mon, 24 Feb 2025 13:13:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871A1248868
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 13:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740402813; cv=none; b=TXNSSO9cfIud+rLbNFIpnSv+pUlsWnVu5CplIrAP1GI5tXnFVFAyWd/cfOOHLW0+K9fR6S2ufIq0Iua/iCOjrmLsyS6xABgE1jOfxSrLLDtlHwfn6f+EO0rKMFGXity6L1yI/0TbUQWUxwAjgfFtzDzRSWjy/41hpF6XNGOaKoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740402813; c=relaxed/simple;
	bh=/Nj8jQyPLm8uBOtChcosG5Dq1xOIAYBJaszcvK4vngA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bYFRuD6WiuMAo8y7gs3V6Ny1cB4KpxG8inAbDoK2xgRFlg26UR9/faz1/IiFeK3cWimXv9VGqoSEZKbP4Ega8I8OaWBvX7MrOHL8vWbprK1aQCde1xV/to3Sx7mUW3DA9pJPmIfPg9TJqoU/Joy5D7M8qghZ+Ejmg4+f1QeaQzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ExDbJLzMTHuZVRFuvPFH0Q==
X-CSE-MsgGUID: h0mYiMoRSAKTTPI1RmPghw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Feb 2025 22:13:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.231])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A7DA9402EC50;
	Mon, 24 Feb 2025 22:13:28 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 11/12] irqchip/renesas-rzv2h: Update macros ICU_TSSR_TSSEL_{MASK,PREP}
Date: Mon, 24 Feb 2025 13:11:27 +0000
Message-ID: <20250224131253.134199-12-biju.das.jz@bp.renesas.com>
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

On RZ/G3E, TSSEL register field is 8 bits wide compared to 7 on RZ/V2H.
Also bits 8..14 is reserved on RZ/G3E and any writes on these reserved
bits is ignored. Use the bitmask GENMASK(field_width - 2, 0) on both SoCs
for extracting TSSEL and then update the macros ICU_TSSR_TSSEL_PREP and
ICU_TSSR_TSSEL_MASK for supporting both SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Dropped Rb tag from Geert as it retain macros instead of dropping it.
 * Retained the macros  ICU_TSSR_TSSEL_PREP and ICU_TSSR_TSSEL_MASK by 
   adding field_width parameter.
v4->v5:
 * Used tssr_shift_factor in rzv2h_tint_set_type to optimize the
   calculation.
 * Dropped unnecessary parenthesis for calculating tssr.
 * Added Rb tag from Geert.
v4:
 * New patch
---
 drivers/irqchip/irq-renesas-rzv2h.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index ac71ce9810f8..351303839636 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -64,8 +64,13 @@
 #define ICU_TINT_LEVEL_HIGH			2
 #define ICU_TINT_LEVEL_LOW			3
 
-#define ICU_TSSR_TSSEL_PREP(tssel, n)		((tssel) << ((n) * 8))
-#define ICU_TSSR_TSSEL_MASK(n)			ICU_TSSR_TSSEL_PREP(0x7F, n)
+#define ICU_TSSR_TSSEL_PREP(tssel, n, f_width)	((tssel) << ((n) * (f_width)))
+#define ICU_TSSR_TSSEL_MASK(n, _field_width)	\
+({\
+		typeof(_field_width) (field_width) = (_field_width); \
+		ICU_TSSR_TSSEL_PREP((GENMASK(((field_width) - 2), 0)), (n), field_width); \
+})
+
 #define ICU_TSSR_TIEN(n, _field_width)	\
 ({\
 		typeof(_field_width) (field_width) = (_field_width); \
@@ -326,8 +331,8 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	guard(raw_spinlock)(&priv->lock);
 
 	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
-	tssr &= ~(ICU_TSSR_TSSEL_MASK(tssel_n) | tien);
-	tssr |= ICU_TSSR_TSSEL_PREP(tint, tssel_n);
+	tssr &= ~(ICU_TSSR_TSSEL_MASK(tssel_n, priv->info->field_width) | tien);
+	tssr |= ICU_TSSR_TSSEL_PREP(tint, tssel_n, priv->info->field_width);
 
 	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
 
-- 
2.43.0


