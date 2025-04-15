Return-Path: <linux-renesas-soc+bounces-15990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDB3A89A59
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 12:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A5EE19001A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 10:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193EA27511B;
	Tue, 15 Apr 2025 10:33:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A266A2309B6;
	Tue, 15 Apr 2025 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713234; cv=none; b=PNEqrhdKEXtFvW2MNPL85sg5LVhW+tXS3A+va2qN2/x7FEdA1fp7ffxb6fFrPlh356bs12yXv3kaUnIwt0/r9hCIBWOPAxadq1ZSWeDYba3KuIP1rjLpRBHg/nEGZRfgRo76wKLb7IUnCkxjsXq+RRDeSb1D3gBrCQ5pj9KpXeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713234; c=relaxed/simple;
	bh=OSlFHza/pChsnrG/y7ZAD/Pl/0whShCaxIxCayem/0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ciIr8PknvwREVNu/JSAgnKanLraz1EnpBwl8usBLJceL7T4VOBp6+fDbTu+NEwQB/Cb19UMB/jqQDBCU2F/JxQfU8JjIKTNJceGQHg7dsQDR8wLCEZf5+uC+fChWRj8EFQpd0YV6P8Bwkf5RZNc9jN95fQitFT2gY9IM48HyaUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Ryg8SbeJTpWFuU7CehviUw==
X-CSE-MsgGUID: qHg0+Rq/RuCPk0mxdSauMw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 Apr 2025 19:33:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.74])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 669AE4008C53;
	Tue, 15 Apr 2025 19:33:46 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] irqchip/renesas-rzv2h: Fix TINT spurious IRQ
Date: Tue, 15 Apr 2025 11:33:41 +0100
Message-ID: <20250415103343.144818-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A spurious TINT interrupt is seen during boot on RZ/G3E SMARC EVK.

A glitch in the edge detection circuit can cause a spurious interrupt.
Clear the status flag after setting the ICU_TSSRk registers based on the
hardware manual as a countermeasure.

Fixes: 0d7605e75ac2 ("irqchip: Add RZ/V2H(P) Interrupt Control Unit (ICU) driver")
Cc: stable@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzv2h.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 3d5b5fdf9bde..2d2cca3bce17 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -170,6 +170,13 @@ static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
 	else
 		tssr &= ~ICU_TSSR_TIEN(tssel_n, priv->info->field_width);
 	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(k));
+
+	/*
+	 * A glitch in the edge detection circuit can cause a spurious
+	 * interrupt. Clear the status flag after setting the ICU_TSSRk
+	 * registers based on the hardware manual as a countermeasure.
+	 */
+	writel_relaxed(BIT(tint_nr), priv->base + priv->info->t_offs + ICU_TSCLR);
 }
 
 static void rzv2h_icu_irq_disable(struct irq_data *d)
-- 
2.43.0


