Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C8F514796
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 12:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239075AbiD2K4J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 06:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239106AbiD2Kz5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 06:55:57 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27CDC4F9CB;
        Fri, 29 Apr 2022 03:52:38 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 363E9FF803;
        Fri, 29 Apr 2022 10:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1651229557;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ML7MMPbxJNuIHkREMTzbbN7ra3s9xRQtUGdWLtPRKW0=;
        b=C7lV+/AnLUxigu+17nAMHMaBP7dAw4Hmbt+hAAomQoa2AxGHau3sAxQc03EWqeVDjQylel
        0v1eIjEK5+kipYLfly1JMghPwnkWsQIuoXQkCgqo0W1CeUl1sS/WdNB5I11nSkllAFke4u
        pt2lxO/iJUj0UU11/dy1N1q4U0VsizK2YfO3yjoIMLpToQUKexthzzG+YlKbg3dkgVUUbm
        3kFctz5/MIGOsUrpCHIaNfdsgdcSjhaIowRoQT1OgAzbG6r4CQ1RTnAlw3u4ECpXb+rekz
        fm2nLDGYzutpAk82LXawLG6/QzF2uFQUqbgLIg02Gs/Ms/70sSWOSGFUrLfDCw==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        <linux-mtd@lists.infradead.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 3/3] mtd: rawnand: renesas: Use runtime PM instead of the raw clock API
Date:   Fri, 29 Apr 2022 12:52:29 +0200
Message-Id: <20220429105229.368728-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220429105229.368728-1-miquel.raynal@bootlin.com>
References: <20220429105229.368728-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This NAND controller is part of a well defined power domain handled by
the runtime PM core. Let's keep the harmony with the other RZ/N1 drivers
and exclusively use the runtime PM API to enable/disable the clocks.

We still need to retrieve the external clock rate in order to derive the
NAND timings, but that is not a big deal, we can still do that in the
probe and just save this value to reuse it later.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../mtd/nand/raw/renesas-nand-controller.c    | 58 +++++++++----------
 1 file changed, 26 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 6db063b230a9..72dfbc7fd424 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -16,6 +16,7 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #define COMMAND_REG 0x00
@@ -216,8 +217,7 @@ struct rnandc {
 	struct nand_controller controller;
 	struct device *dev;
 	void __iomem *regs;
-	struct clk *hclk;
-	struct clk *eclk;
+	unsigned long ext_clk_rate;
 	unsigned long assigned_cs;
 	struct list_head chips;
 	struct nand_chip *selected_chip;
@@ -891,7 +891,7 @@ static int rnandc_setup_interface(struct nand_chip *chip, int chipnr,
 {
 	struct rnand_chip *rnand = to_rnand(chip);
 	struct rnandc *rnandc = to_rnandc(chip->controller);
-	unsigned int period_ns = 1000000000 / clk_get_rate(rnandc->eclk);
+	unsigned int period_ns = 1000000000 / rnandc->ext_clk_rate;
 	const struct nand_sdr_timings *sdr;
 	unsigned int cyc, cle, ale, bef_dly, ca_to_data;
 
@@ -1319,6 +1319,7 @@ static int rnandc_chips_init(struct rnandc *rnandc)
 static int rnandc_probe(struct platform_device *pdev)
 {
 	struct rnandc *rnandc;
+	struct clk *eclk;
 	int irq, ret;
 
 	rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
@@ -1335,29 +1336,10 @@ static int rnandc_probe(struct platform_device *pdev)
 	if (IS_ERR(rnandc->regs))
 		return PTR_ERR(rnandc->regs);
 
-	/* APB clock */
-	rnandc->hclk = devm_clk_get(&pdev->dev, "hclk");
-	if (IS_ERR(rnandc->hclk))
-		return PTR_ERR(rnandc->hclk);
-
-	/* External NAND bus clock */
-	rnandc->eclk = devm_clk_get(&pdev->dev, "eclk");
-	if (IS_ERR(rnandc->eclk))
-		return PTR_ERR(rnandc->eclk);
-
-	ret = clk_prepare_enable(rnandc->hclk);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(rnandc->eclk);
-	if (ret)
-		goto disable_hclk;
-
 	rnandc_dis_interrupts(rnandc);
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq == -EPROBE_DEFER) {
-		ret = irq;
-		goto disable_eclk;
+		return irq;
 	} else if (irq < 0) {
 		dev_info(&pdev->dev, "No IRQ found, fallback to polling\n");
 		rnandc->use_polling = true;
@@ -1365,12 +1347,25 @@ static int rnandc_probe(struct platform_device *pdev)
 		ret = devm_request_irq(&pdev->dev, irq, rnandc_irq_handler, 0,
 				       "renesas-nand-controller", rnandc);
 		if (ret < 0)
-			goto disable_eclk;
+			return ret;
 	}
 
 	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret)
-		goto disable_eclk;
+		return ret;
+
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
+
+	/* The external NAND bus clock rate is needed for computing timings */
+	eclk = clk_get(&pdev->dev, "eclk");
+	if (IS_ERR(eclk)) {
+		ret = PTR_ERR(eclk);
+		goto dis_runtime_pm;
+	}
+
+	rnandc->ext_clk_rate = clk_get_rate(eclk);
+	clk_put(eclk);
 
 	rnandc_clear_fifo(rnandc);
 
@@ -1378,14 +1373,13 @@ static int rnandc_probe(struct platform_device *pdev)
 
 	ret = rnandc_chips_init(rnandc);
 	if (ret)
-		goto disable_eclk;
+		goto dis_runtime_pm;
 
 	return 0;
 
-disable_eclk:
-	clk_disable_unprepare(rnandc->eclk);
-disable_hclk:
-	clk_disable_unprepare(rnandc->hclk);
+dis_runtime_pm:
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
@@ -1396,8 +1390,8 @@ static int rnandc_remove(struct platform_device *pdev)
 
 	rnandc_chips_cleanup(rnandc);
 
-	clk_disable_unprepare(rnandc->eclk);
-	clk_disable_unprepare(rnandc->hclk);
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
 	return 0;
 }
-- 
2.27.0

