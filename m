Return-Path: <linux-renesas-soc+bounces-12567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FDBA1D572
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39FBA16131E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 11:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B97B1FECBF;
	Mon, 27 Jan 2025 11:38:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C011FE454
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 11:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737977884; cv=none; b=Qwj/RVRnDgjS2IQLt7+y7oCZDpBtH0ZPUOyw3iV1kzyYLM9ktW/p2fEADzS0co9KXGmJXAZm/skFNZ/8JkW+6MavAcxWdTkbJd3P94BWzoKysYjQZzqoCmAKRxUjm7rLwkmG+wi1pg0pNYNaz1/wujUkgUG7Rxhe7Di6FrnOHrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737977884; c=relaxed/simple;
	bh=9m/TaQ3llUz8V6pygoH/iP/Tj3bei8o7OltSxLjA3ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZUOFk14aDdgMHr6y43Jv/9D27GraBaIrlUcNRE38Fdq0LrDrKbSUdGFQKgHjrJrgs+blZnpYUaf4dpMdPD7Nu+/0tuQvTywOAWcZb8Lh21Nnjm4eu/4VhtHPwlmou1ElJ8iekGWGoyvVShKTk62LHrJ7X+36wpyAOrS4abXnvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: eNHimjqzSuu29p4NkYagyw==
X-CSE-MsgGUID: Beo4FSywRdKZYYGEEg5fFg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 27 Jan 2025 20:38:01 +0900
Received: from localhost.localdomain (unknown [10.226.94.28])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9347A41F278B;
	Mon, 27 Jan 2025 20:37:57 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v2 10/12] irqchip/renesas-rzv2h: Add tien variable to struct rzv2h_hw_info
Date: Mon, 27 Jan 2025 11:37:05 +0000
Message-ID: <20250127113723.24479-11-biju.das.jz@bp.renesas.com>
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

The TINT enable position on RZ/G3E is BIT 15 compared to BIT 8 on RZ/V2H.
Add tien variable to struct rzv2h_hw_info to simplify the calculations
when we add support for RZ/G3E and drop the macro ICU_TSSR_TIEN.

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tags.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index cff1f49bb130..70293a7822e7 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -64,8 +64,6 @@
 #define ICU_TINT_LEVEL_HIGH			2
 #define ICU_TINT_LEVEL_LOW			3
 
-#define ICU_TSSR_TIEN(n)			(BIT(7) << ((n) * 8))
-
 #define ICU_TITSR_K(tint_nr)			((tint_nr) / 16)
 #define ICU_TITSR_TITSEL_N(tint_nr)		((tint_nr) % 16)
 #define ICU_TITSR_TITSEL_PREP(titsel, n)	ICU_IITSR_IITSEL_PREP(titsel, n)
@@ -79,6 +77,7 @@
 /**
  * struct rzv2h_hw_info - Interrupt Control Unit controller hardware info structure.
  * @t_offs:		TINT offset
+ * @tien:		TIEN mask
  * @tssel_mask:		TSSEL mask
  * @tssel_shift:	TSSEL shift
  * @max_tssel:		TSSEL max value
@@ -86,6 +85,7 @@
  */
 struct rzv2h_hw_info {
 	u16		t_offs;
+	u16		tien;
 	u16		tssel_mask;
 	u8		tssel_shift;
 	u8		max_tssel;
@@ -153,9 +153,9 @@ static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
 	guard(raw_spinlock)(&priv->lock);
 	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(k));
 	if (enable)
-		tssr |= ICU_TSSR_TIEN(tssel_n);
+		tssr |= priv->info->tien << (tssel_n * priv->info->tssel_shift);
 	else
-		tssr &= ~ICU_TSSR_TIEN(tssel_n);
+		tssr &= ~(priv->info->tien << (tssel_n * priv->info->tssel_shift));
 	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(k));
 }
 
@@ -315,7 +315,7 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 
 	titsr_k = ICU_TITSR_K(tint_nr);
 	titsel_n = ICU_TITSR_TITSEL_N(tint_nr);
-	tien = ICU_TSSR_TIEN(titsel_n);
+	tien = priv->info->tien << (titsel_n * priv->info->tssel_shift);
 
 	guard(raw_spinlock)(&priv->lock);
 
@@ -517,6 +517,7 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
 
 static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.t_offs		= 0,
+	.tien		= BIT(7),
 	.tssel_mask	= GENMASK(6, 0),
 	.tssel_shift	= 8,
 	.max_tssel	= ICU_RZV2H_TSSEL_MAX_VAL,
-- 
2.43.0


