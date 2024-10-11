Return-Path: <linux-renesas-soc+bounces-9692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7419F99A9C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 19:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7684F1C22CD5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 17:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B85196DB1;
	Fri, 11 Oct 2024 17:20:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B4A1A0BE7;
	Fri, 11 Oct 2024 17:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667219; cv=none; b=gXppmv7b9WkJ1yIHT+iwbHowQHcvlyRb5KcClyKOTthEJPMKmkMHzHQPeG2TjQnCp0R1T4IKg19UVBtGa0FbD11gac6IGLoDbtO9g69fx/gVF9lcMDoSRaLxpzjMyo25gO7vORFySwjX39uMUXtzONfi07KZvgZAvyXNpX0xPLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667219; c=relaxed/simple;
	bh=bStfpuSth4/gCfc9GiRoQJFKK7MVYfHfmIclOklOQf8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p7+DAolIKkZ71PONo5qLPrDvqnAWJQFLN+Oa+NENWAoQKN5+skqLP5RHfc3Y/MDzSCP9Uw0RJCw+CTZlNBrIo6j/SsL7xdeAUg3hP2lttGLDbLGOpYIbkOY3Dy/RjS+3kCoiN33MY2v7W+X/1jglxOxBEjJmFFzz6m0y0aX/t5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.11,196,1725289200"; 
   d="scan'208";a="225675629"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 12 Oct 2024 02:20:15 +0900
Received: from mulinux.home (unknown [10.226.92.34])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id BE0BF402B910;
	Sat, 12 Oct 2024 02:20:09 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Markus Elfring <elfring@users.sourceforge.net>,
	Markus Elfring <Markus.Elfring@web.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4] irqchip/renesas-rzg2l: Fix missing put_device
Date: Fri, 11 Oct 2024 18:20:03 +0100
Message-Id: <20241011172003.1242841-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rzg2l_irqc_common_init calls of_find_device_by_node, but the
corresponding put_device call is missing.
This also gets reported by make coccicheck.

Make use of the cleanup interfaces from cleanup.h to call into
__free_put_device (which in turn calls into put_device) when
leaving function rzg2l_irqc_common_init and variable "dev" goes
out of scope.

Mind that we don't want to "put" "dev" when rzg2l_irqc_common_init
completes successfully, therefore assign NULL to "dev" to prevent
__free_put_device from calling into put_device within the successful
path.

"make coccicheck" will still complain about missing put_device calls,
but those are false positives now.

Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller driver")
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---

v3->v4:
 * switched to using the cleanup interfaces as an alternative to using
   goto chains

 drivers/irqchip/irq-renesas-rzg2l.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 693ff285ca2c..99e27e01b0b1 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/io.h>
@@ -530,12 +531,12 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2l_irqc_priv *priv,
 static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *parent,
 				  const struct irq_chip *irq_chip)
 {
+	struct platform_device *pdev = of_find_device_by_node(node);
+	struct device *dev __free(put_device) = pdev ? &pdev->dev : NULL;
 	struct irq_domain *irq_domain, *parent_domain;
-	struct platform_device *pdev;
 	struct reset_control *resetn;
 	int ret;
 
-	pdev = of_find_device_by_node(node);
 	if (!pdev)
 		return -ENODEV;
 
@@ -591,6 +592,17 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
 
 	register_syscore_ops(&rzg2l_irqc_syscore_ops);
 
+	/*
+	 * Prevent the cleanup function from invoking put_device by assigning
+	 * NULL to dev.
+	 *
+	 * make coccicheck will complain about missing put_device calls, but
+	 * those are false positives, as dev will be automatically "put" via
+	 * __free_put_device on the failing path.
+	 * On the successful path we don't actually want to "put" dev.
+	 */
+	dev = NULL;
+
 	return 0;
 
 pm_put:
-- 
2.34.1


