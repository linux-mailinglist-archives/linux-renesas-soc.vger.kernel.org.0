Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6E644BCEE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 09:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbhKJIew (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 03:34:52 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:41853 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230245AbhKJIew (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 03:34:52 -0500
X-IronPort-AV: E=Sophos;i="5.87,223,1631545200"; 
   d="scan'208";a="99778047"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 10 Nov 2021 17:32:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 52DB6400C4E7;
        Wed, 10 Nov 2021 17:32:02 +0900 (JST)
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
Subject: [PATCH 2/2] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM support
Date:   Wed, 10 Nov 2021 08:31:52 +0000
Message-Id: <20211110083152.31144-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
References: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
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
 drivers/clocksource/renesas-ostm.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 3d06ba66008c..6b28c45c86f7 100644
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
 
@@ -209,3 +211,39 @@ static int __init ostm_init(struct device_node *np)
 }
 
 TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
+
+#ifdef CONFIG_ARCH_R9A07G044
+static int __init ostm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct reset_control *rstc;
+	int ret;
+
+	rstc = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get reset");
+
+	reset_control_deassert(rstc);
+
+	ret = ostm_init(dev->of_node);
+	if (ret) {
+		reset_control_assert(rstc);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id ostm_of_table[] = {
+	{ .compatible = "renesas,rzg2l-ostm", },
+	{ }
+};
+
+static struct platform_driver ostm_device_driver = {
+	.driver		= {
+		.name	= "rzg2l_ostm",
+		.of_match_table = of_match_ptr(ostm_of_table),
+	},
+};
+builtin_platform_driver_probe(ostm_device_driver, ostm_probe);
+#endif
-- 
2.17.1

