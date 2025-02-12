Return-Path: <linux-renesas-soc+bounces-13068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3347DA3248F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 12:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABA7A3A9E06
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 11:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526BD20B1FF;
	Wed, 12 Feb 2025 11:13:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A026E20A5C9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Feb 2025 11:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739358789; cv=none; b=aEaGLSQE6zhNBa30bfyD2nLsL4xuvtmZw5avhpRzqYuo3c8wPMe+A+HFGWW2KpQkHNAW3bd5yzmVdDMQVWhjhyBFXBjSIxP8q9ANEaHDXveZr84Ekag/vF6gKRug6ESBBwv3IIQWRdNJZbPAMR+T6d/3PFp39xatDMuHCjZMDVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739358789; c=relaxed/simple;
	bh=kJkDDsUd12fBfDWwCi69kAFrZgFMKkGtLlcF2mgzOME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vb6NrVFuivh//Tw+BDieowF5H0iMNvQK+n8/pSX3fz8J+KMutxhwsjXqwRVEnQ9K9LAF8TqpgjFtBwQxaNtrEnhnl2AjIAc1ZYtsmBYwOLwpwFeNVHEZ/pNUJImE6uvheCaevpnlgWRIkBA1iA5fXe9JrLfYsQH+ImouWaPBdRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: /lkEHWzhSbKj4kFCueFRIA==
X-CSE-MsgGUID: Zgw71jb9R9eoHtasv750pg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 12 Feb 2025 20:13:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.135])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B71D9425CA29;
	Wed, 12 Feb 2025 20:13:04 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 10/12] irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
Date: Wed, 12 Feb 2025 11:12:19 +0000
Message-ID: <20250212111231.143277-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212111231.143277-1-biju.das.jz@bp.renesas.com>
References: <20250212111231.143277-1-biju.das.jz@bp.renesas.com>
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
v4->v5:
 * Shortened tssr calculation in rzv2h_tint_irq_endisable().
 * Added tssr_shift_factor variable for optimizing the calculation
   in rzv2h_tint_set_type() as the next patch uses the same factor.
v4:
 * New patch
---
 drivers/irqchip/irq-renesas-rzv2h.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 98a6a7cd3611..3635597ae4c1 100644
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
+		tssr |= BIT((tssel_n + 1) * priv->info->field_width - 1);
 	else
-		tssr &= ~ICU_TSSR_TIEN(tssel_n);
+		tssr &= ~(BIT((tssel_n + 1) * priv->info->field_width - 1));
 	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(k));
 }
 
@@ -277,6 +276,7 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	u32 titsr, titsr_k, titsel_n, tien;
 	struct rzv2h_icu_priv *priv;
 	u32 tssr, tssr_k, tssel_n;
+	u32 tssr_shift_factor;
 	unsigned int hwirq;
 	u32 tint, sense;
 	int tint_nr;
@@ -314,7 +314,8 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	nr_tint = 32 / priv->info->field_width;
 	tssr_k = tint_nr / nr_tint;
 	tssel_n = tint_nr % nr_tint;
-	tien = ICU_TSSR_TIEN(tssel_n);
+	tssr_shift_factor = tssel_n * priv->info->field_width;
+	tien = BIT(priv->info->field_width - 1) << tssr_shift_factor;
 
 	titsr_k = ICU_TITSR_K(tint_nr);
 	titsel_n = ICU_TITSR_TITSEL_N(tint_nr);
-- 
2.43.0


