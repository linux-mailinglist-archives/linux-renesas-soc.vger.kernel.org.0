Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA9244ECC5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 19:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235616AbhKLSrU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 13:47:20 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:59409 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229892AbhKLSrU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 13:47:20 -0500
X-IronPort-AV: E=Sophos;i="5.87,230,1631545200"; 
   d="scan'208";a="100419179"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Nov 2021 03:44:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.48])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CD4A140D6012;
        Sat, 13 Nov 2021 03:44:25 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 3/4] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM support
Date:   Fri, 12 Nov 2021 18:44:12 +0000
Message-Id: <20211112184413.4391-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L SoC has Generic Timer Module(a.k.a OSTM) which needs to
deassert the reset line before accessing any registers.

This patch adds an entry point for RZ/G2L so that we can deassert
the reset line in probe callback.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
 * Added reset_control_put() on error path.
 * enabled suppress_bind_attrs in ostm_device_driver structure
v1->v2:
 * Added reset handling inside ostm_init
 * Used same compatible for builtin driver aswell
---
 drivers/clocksource/renesas-ostm.c | 39 +++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 3d06ba66008c..21d1392637b8 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -9,6 +9,8 @@
 #include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/sched_clock.h>
 #include <linux/slab.h>
 
@@ -159,6 +161,7 @@ static int __init ostm_init_clkevt(struct timer_of *to)
 
 static int __init ostm_init(struct device_node *np)
 {
+	struct reset_control *rstc;
 	struct timer_of *to;
 	int ret;
 
@@ -166,6 +169,14 @@ static int __init ostm_init(struct device_node *np)
 	if (!to)
 		return -ENOMEM;
 
+	rstc = of_reset_control_get_optional_exclusive(np, NULL);
+	if (IS_ERR(rstc)) {
+		ret = PTR_ERR(rstc);
+		goto err_free;
+	}
+
+	reset_control_deassert(rstc);
+
 	to->flags = TIMER_OF_BASE | TIMER_OF_CLOCK;
 	if (system_clock) {
 		/*
@@ -178,7 +189,7 @@ static int __init ostm_init(struct device_node *np)
 
 	ret = timer_of_init(np, to);
 	if (ret)
-		goto err_free;
+		goto err_reset;
 
 	/*
 	 * First probed device will be used as system clocksource. Any
@@ -203,9 +214,35 @@ static int __init ostm_init(struct device_node *np)
 
 err_cleanup:
 	timer_of_cleanup(to);
+err_reset:
+	reset_control_assert(rstc);
+	reset_control_put(rstc);
 err_free:
 	kfree(to);
 	return ret;
 }
 
 TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
+
+#ifdef CONFIG_ARCH_R9A07G044
+static int __init ostm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	return ostm_init(dev->of_node);
+}
+
+static const struct of_device_id ostm_of_table[] = {
+	{ .compatible = "renesas,ostm", },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver ostm_device_driver = {
+	.driver = {
+		.name = "renesas_ostm",
+		.of_match_table = of_match_ptr(ostm_of_table),
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver_probe(ostm_device_driver, ostm_probe);
+#endif
-- 
2.17.1

