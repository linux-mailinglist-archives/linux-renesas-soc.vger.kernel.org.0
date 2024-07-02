Return-Path: <linux-renesas-soc+bounces-6969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D10499239D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 11:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B25D282DF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 09:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DC9152166;
	Tue,  2 Jul 2024 09:24:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1C415098E
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jul 2024 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719912267; cv=none; b=uofmBS9b1QwchPEcNiHCd0CWdZEOr1hg0mQNvjNDgRMjnuvM/2AsvHaL0DCe8Da22WB3OJqnhdKsL0bHZqf5gkR6hGYn8lstdXHJMUtlUvUhqwt5TI/WS079htEQwVdyiyiAGnT2OROZZtngdUNQjNpzGJ+hQhbS/k0ZbJnKhYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719912267; c=relaxed/simple;
	bh=LxGzyz1DiRsNhaxhpPwdQb9KqJ29vpI6qOPgCOtDD2I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bhtKfUHULyAtFLVHakNKMgd6iAA/THQKiqduX9gnRw5Nxbkr+VI+378jSJ8IMvQfrnZ8x0v7L4UM72XJnKjOUAvaf/4mnXp/yY7I7nzT0IaRFOQr6vaUo3iEt5sqBfsoE2pyYc8o5KaJwDEhXkSH3PEpk+osyFPp9nmr+cWqaEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:6bda:2a86:97aa:1205])
	by baptiste.telenet-ops.be with bizsmtp
	id iZQG2C006232J2U01ZQGaL; Tue, 02 Jul 2024 11:24:18 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sOZk7-000uaT-GG;
	Tue, 02 Jul 2024 11:24:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sOZkG-001QrH-04;
	Tue, 02 Jul 2024 11:24:16 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] irqchip/gic-v3: Pass #redistributor-regions to gic_of_setup_kvm_info()
Date: Tue,  2 Jul 2024 11:24:14 +0200
Message-Id: <808286a3ac08f60585ae7e2c848e0f9b3cb79cf8.1719912215.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The caller of gic_of_setup_kvm_info() already queried DT for the value
of the #redistributor-regions property.  So just pass this value,
instead of doing the DT look-up again in the callee.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Marc Zyngier <maz@kernel.org>
---
This is v2 of "irqchip/gic-v3: Pass GICV index to
gic_of_setup_kvm_info()".

v2:
  - Pass nr_redist_regions instead of gicv_idx,
  - Keep comment about skipping GICD, GICC, GICH,
  - Add Acked-by.
---
 drivers/irqchip/irq-gic-v3.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 1f70262742f3b7c7..79a8a2f189e94c7f 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2185,11 +2185,10 @@ static void __init gic_populate_ppi_partitions(struct device_node *gic_node)
 	of_node_put(parts_node);
 }
 
-static void __init gic_of_setup_kvm_info(struct device_node *node)
+static void __init gic_of_setup_kvm_info(struct device_node *node, u32 nr_redist_regions)
 {
 	int ret;
 	struct resource r;
-	u32 gicv_idx;
 
 	gic_v3_kvm_info.type = GIC_V3;
 
@@ -2197,12 +2196,8 @@ static void __init gic_of_setup_kvm_info(struct device_node *node)
 	if (!gic_v3_kvm_info.maint_irq)
 		return;
 
-	if (of_property_read_u32(node, "#redistributor-regions",
-				 &gicv_idx))
-		gicv_idx = 1;
-
-	gicv_idx += 3;	/* Also skip GICD, GICC, GICH */
-	ret = of_address_to_resource(node, gicv_idx, &r);
+	/* Also skip GICD, GICC, GICH */
+	ret = of_address_to_resource(node, nr_redist_regions + 3, &r);
 	if (!ret)
 		gic_v3_kvm_info.vcpu = r;
 
@@ -2292,7 +2287,7 @@ static int __init gic_of_init(struct device_node *node, struct device_node *pare
 	gic_populate_ppi_partitions(node);
 
 	if (static_branch_likely(&supports_deactivate_key))
-		gic_of_setup_kvm_info(node);
+		gic_of_setup_kvm_info(node, nr_redist_regions);
 	return 0;
 
 out_unmap_rdist:
-- 
2.34.1


