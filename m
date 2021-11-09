Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D48E44AD5D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Nov 2021 13:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242219AbhKIMTu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Nov 2021 07:19:50 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:34826 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S242214AbhKIMTo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Nov 2021 07:19:44 -0500
X-IronPort-AV: E=Sophos;i="5.87,220,1631545200"; 
   d="scan'208";a="99983750"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Nov 2021 21:16:57 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 070D54392862;
        Tue,  9 Nov 2021 21:16:54 +0900 (JST)
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
Subject: [PATCH v2 3/3] serial: sh-sci: Add support to deassert/assert reset line
Date:   Tue,  9 Nov 2021 12:16:31 +0000
Message-Id: <20211109121631.26687-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211109121631.26687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211109121631.26687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On RZ/G2L SoC we need to explicitly deassert the reset line
for the device to work, use this opportunity to deassert/assert
reset line in sh-sci driver.

This patch adds support to read the "resets" property (if available)
from DT and perform deassert/assert when required.

Also, propagate the error to the caller of sci_parse_dt() instead of
returning NULL in case of failure.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2
* deassert/assert reset line if available on all SoC's
* Updated commit message
---
 drivers/tty/serial/sh-sci.c | 47 ++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 89ee43061d3a..7aced84d2f04 100644
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
@@ -3203,23 +3204,53 @@ static const struct of_device_id of_sci_match[] = {
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
+	struct reset_control *rstc;
 	struct plat_sci_port *p;
 	struct sci_port *sp;
 	const void *data;
-	int id;
+	int id, ret;
 
 	if (!IS_ENABLED(CONFIG_OF) || !np)
-		return NULL;
+		return ERR_PTR(-EINVAL);
+
+	of_id = of_match_device(of_sci_match, &pdev->dev);
+	if (!of_id)
+		return ERR_PTR(-EINVAL);
 
-	data = of_device_get_match_data(&pdev->dev);
+	rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(rstc)) {
+		dev_err(&pdev->dev, "failed to get reset ctrl %ld\n", PTR_ERR(rstc));
+		return ERR_PTR(PTR_ERR(rstc));
+	}
+
+	ret = reset_control_deassert(rstc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to deassert reset %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	ret = devm_add_action_or_reset(&pdev->dev, sci_reset_control_assert, rstc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register assert devm action, %d\n",
+			ret);
+		return ERR_PTR(ret);
+	}
+
+	data = of_id->data;
 
 	p = devm_kzalloc(&pdev->dev, sizeof(struct plat_sci_port), GFP_KERNEL);
 	if (!p)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	/* Get the line number from the aliases node. */
 	id = of_alias_get_id(np, "serial");
@@ -3227,11 +3258,11 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
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
@@ -3318,8 +3349,8 @@ static int sci_probe(struct platform_device *dev)
 
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

