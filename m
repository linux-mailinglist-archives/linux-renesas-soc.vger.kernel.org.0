Return-Path: <linux-renesas-soc+bounces-13584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E7CA42013
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 14:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60AD63A66E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 13:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AF123C8B6;
	Mon, 24 Feb 2025 13:13:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E6324EF61
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 13:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740402810; cv=none; b=OIcTgt6CyNNpsS4jRcExQZBBmWg9Cc/qxRGifcNPfHnuRVXaMDe/z9pGvEKCvaTEwQPZ/TzzYOQckhVyZfhfrB2SgrVR16IqaNOWDXt4UjYcQriE/X4UYOkZGAlzSs+oVLyd5QIUXaC0ikDynOVSgBgD224nWBjlmN3dXPEUm4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740402810; c=relaxed/simple;
	bh=WB9xygK8B7BFCoHh0uwEFLp1xqpcx13ZxqCR8end6W8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQnJpiwXfy4LH7NtIk30nK/kfMmExKtZngZ99+30fC+N4BoB+YbOhcUsjk+y31u1SO4Bz+tLndYD4Qty1alNkPHDRUwjndj+GrWiCBgqQSNQaR6Z3rWY27vE3FV5Oe2684xP61cRtmRmzRn/F+J3/mmM9BOXVrjGGE/rr1p4qbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: KYrLzSFRTxWBqoplcYOtyw==
X-CSE-MsgGUID: xuPuAio9TS6XMX5duJ9QhA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Feb 2025 22:13:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.231])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4C7CD400F319;
	Mon, 24 Feb 2025 22:13:26 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 10/12] irqchip/renesas-rzv2h: Update TSSR_TIEN macro
Date: Mon, 24 Feb 2025 13:11:26 +0000
Message-ID: <20250224131253.134199-11-biju.das.jz@bp.renesas.com>
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

On RZ/G3E, TIEN bit position is at 15 compared to 7 on RZ/V2H. Replace the
macro ICU_TSSR_TIEN(n)->ICU_TSSR_TIEN(n, _field_width) for supporting both
these SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Retained the macro ICU_TSSR_TIEN by adding _field_width parameter.
v4->v5:
 * Shortened tssr calculation in rzv2h_tint_irq_endisable().
 * Added tssr_shift_factor variable for optimizing the calculation
   in rzv2h_tint_set_type() as the next patch uses the same factor.
v4:
 * New patch
---
 drivers/irqchip/irq-renesas-rzv2h.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 98a6a7cd3611..ac71ce9810f8 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -66,7 +66,11 @@
 
 #define ICU_TSSR_TSSEL_PREP(tssel, n)		((tssel) << ((n) * 8))
 #define ICU_TSSR_TSSEL_MASK(n)			ICU_TSSR_TSSEL_PREP(0x7F, n)
-#define ICU_TSSR_TIEN(n)			(BIT(7) << ((n) * 8))
+#define ICU_TSSR_TIEN(n, _field_width)	\
+({\
+		typeof(_field_width) (field_width) = (_field_width); \
+		BIT((field_width) - 1) << ((n) * (field_width)); \
+})
 
 #define ICU_TITSR_K(tint_nr)			((tint_nr) / 16)
 #define ICU_TITSR_TITSEL_N(tint_nr)		((tint_nr) % 16)
@@ -153,9 +157,9 @@ static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
 	guard(raw_spinlock)(&priv->lock);
 	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(k));
 	if (enable)
-		tssr |= ICU_TSSR_TIEN(tssel_n);
+		tssr |= ICU_TSSR_TIEN(tssel_n, priv->info->field_width);
 	else
-		tssr &= ~ICU_TSSR_TIEN(tssel_n);
+		tssr &= ~ICU_TSSR_TIEN(tssel_n, priv->info->field_width);
 	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(k));
 }
 
@@ -314,7 +318,7 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	nr_tint = 32 / priv->info->field_width;
 	tssr_k = tint_nr / nr_tint;
 	tssel_n = tint_nr % nr_tint;
-	tien = ICU_TSSR_TIEN(tssel_n);
+	tien = ICU_TSSR_TIEN(tssel_n, priv->info->field_width);
 
 	titsr_k = ICU_TITSR_K(tint_nr);
 	titsel_n = ICU_TITSR_TITSEL_N(tint_nr);
-- 
2.43.0


