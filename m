Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61295444727
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Nov 2021 18:31:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbhKCRe0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Nov 2021 13:34:26 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:44272 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231381AbhKCReV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Nov 2021 13:34:21 -0400
X-IronPort-AV: E=Sophos;i="5.87,206,1631545200"; 
   d="scan'208";a="99097641"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Nov 2021 02:31:43 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8A45B40B5157;
        Thu,  4 Nov 2021 02:31:41 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] serial: sh-sci: Add reset support for RZ/G2L SoC
Date:   Wed,  3 Nov 2021 17:31:27 +0000
Message-Id: <20211103173127.13701-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211103173127.13701-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211103173127.13701-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On RZ/G2L devices should be explicitly pulled out of reset for it
to work. This patch adds support to read the "resets" property and
performs deassert/assert when required.

Also, propagate the error to the caller of sci_parse_dt() instead of
returning NULL in case of failure.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Hi Geert,
For handling the resets I was in dual mind whether to perform
reset based on compatible strings or soc-id, let me know your
thoughts. Currently no SoC's use "renesas,sci" so using the same
for performing the reset operation for SCI.
---
 drivers/tty/serial/sh-sci.c | 50 +++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 89ee43061d3a..a0f68b887e29 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -37,6 +37,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/scatterlist.h>
 #include <linux/serial.h>
 #include <linux/serial_sci.h>
@@ -3203,23 +3204,58 @@ static const struct of_device_id of_sci_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_sci_match);
 
+static void sci_reset_control_assert(void *data)
+{
+	reset_control_assert(data);
+}
+
 static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 					  unsigned int *dev_id)
 {
 	struct device_node *np = pdev->dev.of_node;
+	const struct of_device_id *of_id;
 	struct plat_sci_port *p;
 	struct sci_port *sp;
 	const void *data;
 	int id;
 
 	if (!IS_ENABLED(CONFIG_OF) || !np)
-		return NULL;
+		return ERR_PTR(-EINVAL);
+
+	of_id = of_match_device(of_sci_match, &pdev->dev);
+	if (!of_id)
+		return ERR_PTR(-EINVAL);
 
-	data = of_device_get_match_data(&pdev->dev);
+	if (!strcmp(of_id->compatible, "renesas,scif-r9a07g044") ||
+	    !strcmp(of_id->compatible, "renesas,sci")) {
+		struct reset_control *rstc;
+		int ret;
+
+		rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+		if (IS_ERR(rstc)) {
+			dev_err(&pdev->dev, "Error: missing reset ctrl\n");
+			return ERR_PTR(PTR_ERR(rstc));
+		}
+
+		ret = reset_control_deassert(rstc);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to deassert %d\n", ret);
+			return ERR_PTR(ret);
+		}
+
+		ret = devm_add_action_or_reset(&pdev->dev, sci_reset_control_assert, rstc);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to register assert devm action, %d\n",
+				ret);
+			return ERR_PTR(ret);
+		}
+	}
+
+	data = of_id->data;
 
 	p = devm_kzalloc(&pdev->dev, sizeof(struct plat_sci_port), GFP_KERNEL);
 	if (!p)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	/* Get the line number from the aliases node. */
 	id = of_alias_get_id(np, "serial");
@@ -3227,11 +3263,11 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 		id = ffz(sci_ports_in_use);
 	if (id < 0) {
 		dev_err(&pdev->dev, "failed to get alias id (%d)\n", id);
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	}
 	if (id >= ARRAY_SIZE(sci_ports)) {
 		dev_err(&pdev->dev, "serial%d out of range\n", id);
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	sp = &sci_ports[id];
@@ -3318,8 +3354,8 @@ static int sci_probe(struct platform_device *dev)
 
 	if (dev->dev.of_node) {
 		p = sci_parse_dt(dev, &dev_id);
-		if (p == NULL)
-			return -EINVAL;
+		if (IS_ERR(p))
+			return PTR_ERR(p);
 	} else {
 		p = dev->dev.platform_data;
 		if (p == NULL) {
-- 
2.17.1

