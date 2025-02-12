Return-Path: <linux-renesas-soc+bounces-13073-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9CDA324A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 12:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11D1D161926
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 11:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCAC20A5EF;
	Wed, 12 Feb 2025 11:17:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039541B21AD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Feb 2025 11:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739359071; cv=none; b=hAsI9Ez21QMiG5cLZfc2bes2XQY2+gHVc06/bWF8oKuzn/xS+oIvD6wgcn1vhBDMHuvr82LUqiAfpnfZeLLOR3rqoinOZvdh2Q6brjKyuADFmstN1YEBV2/R98jULSFhU8vpgfU0qiQujmruyAwzM0OVOdPsBCE1yDQUW71aYG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739359071; c=relaxed/simple;
	bh=ZMqN4PyAm0rTadsVCrRsIvy/r2y+DZVes66x8/DgAqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzeKehDIc5rVwRnl78XNQTUl8uYKZjCU1n+VxxkXsnaK224FsH8SmbJK8qlzn5KBJMX+c2e+Jkx+hR7xdsiao9qLyZLwe4sAJmwBBc8+lHK8g/IH8zO5urEclwMmmVZfCW9H0AzM+lq47QzPkskWxU7Qkrs0yDPis+LFHafaFSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: fWEhHVwNRc2CaQ8je1UhXg==
X-CSE-MsgGUID: OevECTJUQjS9lUWSjn4SgA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 12 Feb 2025 20:12:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.135])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 666B3425C777;
	Wed, 12 Feb 2025 20:12:44 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v5 03/12] irqchip/renesas-rzv2h: Drop irqchip from struct rzv2h_icu_priv
Date: Wed, 12 Feb 2025 11:12:12 +0000
Message-ID: <20250212111231.143277-4-biju.das.jz@bp.renesas.com>
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

Use rzv2h_icu_chip directly on irq_domain_set_hwirq_and_chip() and drop
the global variable irqchip from struct rzv2h_icu_priv.

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Collected tag from Geert.
v2->v3:
 * No change.
v1->v2:
 * Collected tags.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index f6363246a71a..0573062c89c4 100644
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


