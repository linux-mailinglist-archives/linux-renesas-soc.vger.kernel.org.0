Return-Path: <linux-renesas-soc+bounces-12254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D883FA169D9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 10:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6B337A11ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 09:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6A518801A;
	Mon, 20 Jan 2025 09:47:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A951AF0C2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 09:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737366462; cv=none; b=uDeiiou/kWJzhBAeXPmXa80gHcqeXS0eslQFqdfhJ/UFt9P5WCHb3yI2xViwt7rS9BkZEl/z1uPeO08CRYFUNmFOmoJ9olfsovYVWYvLCg3uEHQfFMwZRokBGNGjMrX9SgCoB7Z0RGWpfczzdccI1u+dNaqgDs9zh/zNRViJShQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737366462; c=relaxed/simple;
	bh=TKDJ2/AbGZCnMJlQsJYEjgAQySxBCi4I9kE44xdqErM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBQQd7VYA59d0jruTiE9MjNAqOARVBw0GBNle3sJ8VEL9dUMllmqOEhiGu1yt6TGwFeC3F2f+Ev7GI/264obZCPsDDX1hVZ7BrJx8TsT8WrE0ab/z8jyLXsy+2ox3RdingYGlOZFNLudA17Om+uLtP/O3P8TbZmf9avBNrIZm0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: iP/hD6s3So6qzB9qi/XI+w==
X-CSE-MsgGUID: nWN3OJFpQ9Ki8cCzT9AR7w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Jan 2025 18:47:38 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A1D63401A639;
	Mon, 20 Jan 2025 18:47:36 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 06/11] irqchip/renesas-rzv2h: Add max_tssel variable to struct rzv2h_hw_info
Date: Mon, 20 Jan 2025 09:47:02 +0000
Message-ID: <20250120094715.25802-7-biju.das.jz@bp.renesas.com>
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

The number of GPIO interrupts on RZ/G3E for TINT selection is 141 compared
to 86 on RZ/V2H.

Add max_tssel variable to struct rzv2h_hw_info to handle this difference.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzv2h.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 195ce9c5e5b5..b244cd61cba4 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -78,14 +78,15 @@
 
 #define ICU_TINT_EXTRACT_HWIRQ(x)		FIELD_GET(GENMASK(15, 0), (x))
 #define ICU_TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
-#define ICU_PB5_TINT				0x55
 
 /**
  * struct rzv2h_hw_info - Interrupt Control Unit controller hardware info structure.
  * @t_offs: TINT offset
+ * @max_tssel: TSSEL max value
  */
 struct rzv2h_hw_info {
 	u16 t_offs;
+	u8 max_tssel;
 };
 
 /**
@@ -298,13 +299,12 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
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
@@ -514,6 +514,7 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
 
 static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.t_offs = 0,
+	.max_tssel = 0x55,
 };
 
 static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
-- 
2.43.0


