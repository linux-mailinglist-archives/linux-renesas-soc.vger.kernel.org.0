Return-Path: <linux-renesas-soc+bounces-12947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9FFA2C1B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 12:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 149B13A45D6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 11:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6636E1A83F5;
	Fri,  7 Feb 2025 11:37:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151AF2417ED
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Feb 2025 11:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928249; cv=none; b=HBKWptAKHkoc3Ex4Wjv4bdNMBV31mwKAuBGS63my2O/NgnLiobsVmVsd2xbHKqoSlY2fXJJbilwte+ccDD7/5HtmYxAsDqo3Um0pcN6ivdrpc2bWWcu2WFl3rUtk724o4KrejRCKcSfTakYP/52nBdo9jJOR4s7i3CZDoZsao6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928249; c=relaxed/simple;
	bh=E8XmvLTUrJWkJ0Pz10t9hzJzSZV8dUfKHuV1pX5yUR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKIaVm4i/33O8VJRyEgABYlahAcyZIRnBHUd9KV9xH6qBdSaZxdQlREcORi/3ya6YE50u8x0Y9Vn2jsW0JgstR0xhBrsEzoPwFlGr2V2KIndAR58eHDfcGhy+RWg9vtrggh8zHa/lNu8FSCVYEk+zACVhgBYgBKKX2IiX9LGGls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: A+01QWNUQVyJcDNPPCws7w==
X-CSE-MsgGUID: W3JJfU+tRV6DahmIjqAFnw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Feb 2025 20:37:26 +0900
Received: from localhost.localdomain (unknown [10.226.93.6])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C069F4004D10;
	Fri,  7 Feb 2025 20:37:24 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 09/12] irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
Date: Fri,  7 Feb 2025 11:36:41 +0000
Message-ID: <20250207113653.21641-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250207113653.21641-1-biju.das.jz@bp.renesas.com>
References: <20250207113653.21641-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RZ/G3E, TIEN bit position is at 15 compared to 7 on RZ/V2H. The macro
ICU_TSSR_TIEN(n) can be replaced with the inline logic
BIT(field_width - 1) << (n * fieldwidth) for supporting both SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * New patch
---
 drivers/irqchip/irq-renesas-rzv2h.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index d96e4b2032b4..6d1de9277c7d 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -66,7 +66,6 @@
 
 #define ICU_TSSR_TSSEL_PREP(tssel, n)		((tssel) << ((n) * 8))
 #define ICU_TSSR_TSSEL_MASK(n)			ICU_TSSR_TSSEL_PREP(0x7F, n)
-#define ICU_TSSR_TIEN(n)			(BIT(7) << ((n) * 8))
 
 #define ICU_TITSR_K(tint_nr)			((tint_nr) / 16)
 #define ICU_TITSR_TITSEL_N(tint_nr)		((tint_nr) % 16)
@@ -153,9 +152,9 @@ static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
 	guard(raw_spinlock)(&priv->lock);
 	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(k));
 	if (enable)
-		tssr |= ICU_TSSR_TIEN(tssel_n);
+		tssr |= BIT(priv->info->field_width - 1) << (tssel_n * priv->info->field_width);
 	else
-		tssr &= ~ICU_TSSR_TIEN(tssel_n);
+		tssr &= ~(BIT(priv->info->field_width - 1) << (tssel_n * priv->info->field_width));
 	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(k));
 }
 
@@ -317,7 +316,7 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 
 	titsr_k = ICU_TITSR_K(tint_nr);
 	titsel_n = ICU_TITSR_TITSEL_N(tint_nr);
-	tien = ICU_TSSR_TIEN(titsel_n);
+	tien = BIT(priv->info->field_width - 1) << (titsel_n * priv->info->field_width);
 
 	guard(raw_spinlock)(&priv->lock);
 
-- 
2.43.0


