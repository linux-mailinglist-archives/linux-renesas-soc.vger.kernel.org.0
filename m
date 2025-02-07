Return-Path: <linux-renesas-soc+bounces-12948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C33DA2C1B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 12:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E16911692B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 11:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB4619E99A;
	Fri,  7 Feb 2025 11:37:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F0B2417ED
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Feb 2025 11:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928251; cv=none; b=cPeotNKE4G7/OBA6Q5z5CN9mgQlAk2/D3ndmGxzjaGsM2+EAduxTOrlKixjBkVT6lrETKCdRqn+ln8l1EIafzuc4x/sUc01o4jswh+9NArohgT1lDChkBoGdJD64bMo2Aal9yeEyaoG51/XBgtrLe1QpfNe7s82gZ7clVnns8Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928251; c=relaxed/simple;
	bh=OHMkWSRLgxYy86+l0psAk8dW9QdPoTKP3zaI73JyHP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vC6BWNoSdRgPuc3JMUuSxY5eO2lhGqAZCLlL7tcwxKkR4gP3SsT8qKB2LrDSX8v8itg0PDkznEe8KQpQi2c401gNxUSsZ9trSh0rP6SITLE17FqgSi3kXhhE4VucnkhDF4GM+Dvos8/JNvGUFYVO8Z93hFdtOhlXcSMTZcHFADE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: GAANTO/+SPSoaCSci2maLA==
X-CSE-MsgGUID: Jwg6OtM7TG2zz7rmRjyzKA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Feb 2025 20:37:29 +0900
Received: from localhost.localdomain (unknown [10.226.93.6])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3C1B14004D10;
	Fri,  7 Feb 2025 20:37:26 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 10/12] irqchip/renesas-rzv2h: Drop macros ICU_TSSR_TSSEL_{MASK,PREP}
Date: Fri,  7 Feb 2025 11:36:42 +0000
Message-ID: <20250207113653.21641-11-biju.das.jz@bp.renesas.com>
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

On RZ/G3E, TSSEL register field is 8 bits wide compared to 7 on RZ/V2H.
Also bits 8..14 is reserved on RZ/G3E and any writes on these reserved
bits is ignored. Use the bitmask GENMASK(field_width - 2, 0) on both SoCs
for extracting TSSEL and we can drop the macros ICU_TSSR_TSSEL_PREP and
ICU_TSSR_TSSEL_MASK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * New patch
---
 drivers/irqchip/irq-renesas-rzv2h.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 6d1de9277c7d..71d06820e598 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -64,9 +64,6 @@
 #define ICU_TINT_LEVEL_HIGH			2
 #define ICU_TINT_LEVEL_LOW			3
 
-#define ICU_TSSR_TSSEL_PREP(tssel, n)		((tssel) << ((n) * 8))
-#define ICU_TSSR_TSSEL_MASK(n)			ICU_TSSR_TSSEL_PREP(0x7F, n)
-
 #define ICU_TITSR_K(tint_nr)			((tint_nr) / 16)
 #define ICU_TITSR_TITSEL_N(tint_nr)		((tint_nr) % 16)
 #define ICU_TITSR_TITSEL_PREP(titsel, n)	ICU_IITSR_IITSEL_PREP(titsel, n)
@@ -321,8 +318,9 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	guard(raw_spinlock)(&priv->lock);
 
 	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
-	tssr &= ~(ICU_TSSR_TSSEL_MASK(tssel_n) | tien);
-	tssr |= ICU_TSSR_TSSEL_PREP(tint, tssel_n);
+	tssr &= ~((GENMASK(priv->info->field_width - 2, 0) <<
+		   (tssel_n * priv->info->field_width)) | tien);
+	tssr |= (tint << (tssel_n * priv->info->field_width));
 
 	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
 
-- 
2.43.0


