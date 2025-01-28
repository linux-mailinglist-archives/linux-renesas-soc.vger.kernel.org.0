Return-Path: <linux-renesas-soc+bounces-12634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 289CCA208DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63E983A6208
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65C759B71;
	Tue, 28 Jan 2025 10:47:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A77188CA9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 10:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738061257; cv=none; b=AcFB5U+/4l7nmgq4Chw/cR8hEdQDgwsJQVbI0l2P7iPy4y7JWv49MpxvXcwoaCfqJrzJi/w52vtL5J5o0gpDJsCwx+fVe9GDp+90/9xP8nmiyHB266IIGVhR6PUm1D9br+9tjHNjHsDowsOvF16xxpKxY4zuA4kzLMO+X+NX7sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738061257; c=relaxed/simple;
	bh=curJS3azj6TdotLQW0P2UzxH7SRB4uU1fsMnGUXzDiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUAxyjXnzl/8RdOggPdMyXdyhWL5N7i6Tw/M0OAiJITa9UOnaFFz6sGBnKeYVoKhvwLZkZSCOE0JYM/HKrjXYoR1gHeiX0LMSPUvlQjWjTw7xSZNFtHPBwTB4HduHmfZ3rAX7RLYSU1YgNYOy2xgtayfvZkGWQNaOZX5XNuVfdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Co6TTxLPSUSYU2CMMWSjqA==
X-CSE-MsgGUID: JUKea/naSSmqtTzvUL6N1Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Jan 2025 19:47:31 +0900
Received: from localhost.localdomain (unknown [10.226.93.131])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E86F741FAD3F;
	Tue, 28 Jan 2025 19:47:28 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v3 03/13] irqchip/renesas-rzv2h: Drop irqchip from struct rzv2h_icu_priv
Date: Tue, 28 Jan 2025 10:46:53 +0000
Message-ID: <20250128104714.80807-4-biju.das.jz@bp.renesas.com>
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

Use rzv2h_icu_chip directly on irq_domain_set_hwirq_and_chip() and drop
the global variable irqchip from struct rzv2h_icu_priv.

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Collected tags.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index fe2d29e91026..fd432b43506b 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -83,13 +83,11 @@
 /**
  * struct rzv2h_icu_priv - Interrupt Control Unit controller private data structure.
  * @base:	Controller's base address
- * @irqchip:	Pointer to struct irq_chip
  * @fwspec:	IRQ firmware specific data
  * @lock:	Lock to serialize access to hardware registers
  */
 struct rzv2h_icu_priv {
 	void __iomem			*base;
-	const struct irq_chip		*irqchip;
 	struct irq_fwspec		fwspec[ICU_NUM_IRQ];
 	raw_spinlock_t			lock;
 };
@@ -390,7 +388,7 @@ static int rzv2h_icu_alloc(struct irq_domain *domain, unsigned int virq, unsigne
 	if (hwirq > (ICU_NUM_IRQ - 1))
 		return -EINVAL;
 
-	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, priv->irqchip,
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, &rzv2h_icu_chip,
 					    (void *)(uintptr_t)tint);
 	if (ret)
 		return ret;
@@ -446,8 +444,6 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 		goto put_dev;
 	}
 
-	rzv2h_icu_data->irqchip = &rzv2h_icu_chip;
-
 	rzv2h_icu_data->base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
 	if (IS_ERR(rzv2h_icu_data->base)) {
 		ret = PTR_ERR(rzv2h_icu_data->base);
-- 
2.43.0


