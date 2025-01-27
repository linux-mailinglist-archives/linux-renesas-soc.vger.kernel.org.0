Return-Path: <linux-renesas-soc+bounces-12558-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0DBA1D567
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43DC71886135
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 11:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D871FE454;
	Mon, 27 Jan 2025 11:37:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D451FCFEF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 11:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737977871; cv=none; b=KMe70mZ7fGuFahvae2T067lxyEBh81V3MT5u49diZUPUbw6XYZ4QgQ8du/o/pODqT1uCma031TbiPX+C6WgnjS2I+EDJwxGEGlGKEAAJVksNLZ6gxOrAxaLO2A/TNaJsCJ4BG3PeLhWjGu9QGM1Jjle5Q3IzF/Muaj8oa9d3I3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737977871; c=relaxed/simple;
	bh=rnwdeobL2zFoVrzsZDPM1BQr0dEzL9t4W25HyqB1zXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kg6z1jJdXGmxxBvJBpBVjkoMBsJzOq18avQ0TMkdF4J8FgAPjoXRLkC02fI6Cuauc5SsK3awQb57GIxfGJ4rmZGoRQ8zUDzPehHcRygfe+eEfJSq2E+xdd+JhKdde+MCXUuohuKufrEL/7GhEo9mVn9T4qHbc475LGn90GNQIt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: kKF17PTETwK1Dswo8NObjw==
X-CSE-MsgGUID: SI/pq8IdT9ixUF6jxwz9Pw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Jan 2025 20:37:48 +0900
Received: from localhost.localdomain (unknown [10.226.94.28])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9AE6841F278E;
	Mon, 27 Jan 2025 20:37:37 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v2 03/12] irqchip/renesas-rzv2h: Drop irqchip from struct rzv2h_icu_priv
Date: Mon, 27 Jan 2025 11:36:58 +0000
Message-ID: <20250127113723.24479-4-biju.das.jz@bp.renesas.com>
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

Use rzv2h_icu_chip directly on irq_domain_set_hwirq_and_chip() and drop
the global variable irqchip from struct rzv2h_icu_priv.

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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


