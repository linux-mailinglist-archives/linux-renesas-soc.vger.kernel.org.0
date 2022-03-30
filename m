Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 977E04EC56C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 15:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345826AbiC3NWh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 09:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345832AbiC3NWf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 09:22:35 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE3C4924A;
        Wed, 30 Mar 2022 06:20:48 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 8D0C0240004;
        Wed, 30 Mar 2022 13:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648646447;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pMj+oO2q20LyAWcRvEIJN80ZhA+kbhS1vge1cPjT3Bo=;
        b=R9e5vhCDRQDOpNC8OFSlubJrqtsyEiyOp8rZIHR+ZyqGT2jmTSr5kbLxlPdjI6XD1JvP88
        cpcFO805sgBU1a0ou4UG1FWQB1D8GR72IYh2nfo7aTCkJOCmGCNlkbhSFveZfQIhHUL+VG
        XSevyM4ovC0S2QWjbxpcaMMeKoau4/+sEZS6slfRSEwO/LTDeIIGEcuVZo8dlczT9zH50j
        z1pkNn0zpggu3LbBWQFmPv6hdQCb5+qQDq0ep+UfovTkm/9jSiWc4vo27AqPt6bEltMyAp
        9xLMvFb2RE8eyYTnJS0seBCtEgkhmtcChaJLksq81miksrlWIqnKtzJd8ripPQ==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v4 3/9] serial: 8250: dw: Create a more generic platform data structure
Date:   Wed, 30 Mar 2022 15:20:32 +0200
Message-Id: <20220330132038.808679-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220330132038.808679-1-miquel.raynal@bootlin.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Before adding more platform data information, let's turn the quirks
information as being a member of a wider structure. More fields will be
added later.

At the same time, change the quirks type to unsigned int, as its size
won't change between setups and we don't really need this variable to be
more than a few bits wide anyway.

Provide a stub to the compatibles without quirks to simplify handling.
Keep two different empty structure for the base DW compatible and the
Renesas one because the latter will soon be fulfilled anyway.

Cc: Emil Renner Berthing <kernel@esmil.dk>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/8250/8250_dw.c    | 32 ++++++++++++++++++++++------
 drivers/tty/serial/8250/8250_dwlib.h |  5 +++++
 2 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index b6238b9bf0b2..70a843e31ffd 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -19,6 +19,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/workqueue.h>
 #include <linux/notifier.h>
 #include <linux/slab.h>
@@ -371,7 +372,7 @@ static bool dw8250_idma_filter(struct dma_chan *chan, void *param)
 static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 {
 	struct device_node *np = p->dev->of_node;
-	unsigned long quirks = (unsigned long)device_get_match_data(p->dev);
+	unsigned int quirks = data->pdata->quirks;
 
 	if (np) {
 		int id;
@@ -462,6 +463,7 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	data->data.dma.fn = dw8250_fallback_dma_filter;
 	data->usr_reg = DW_UART_USR;
+	data->pdata = device_get_match_data(p->dev);
 	p->private_data = &data->data;
 
 	data->uart_16550_compatible = device_property_read_bool(dev,
@@ -678,13 +680,29 @@ static const struct dev_pm_ops dw8250_pm_ops = {
 	SET_RUNTIME_PM_OPS(dw8250_runtime_suspend, dw8250_runtime_resume, NULL)
 };
 
+static const struct dw8250_platform_data dw8250_dw_apb = {};
+
+static const struct dw8250_platform_data dw8250_octeon_3860_data = {
+	.quirks = DW_UART_QUIRK_OCTEON,
+};
+
+static const struct dw8250_platform_data dw8250_armada_38x_data = {
+	.quirks = DW_UART_QUIRK_ARMADA_38X,
+};
+
+static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {};
+
+static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+};
+
 static const struct of_device_id dw8250_of_match[] = {
-	{ .compatible = "snps,dw-apb-uart" },
-	{ .compatible = "cavium,octeon-3860-uart", .data = (void *)DW_UART_QUIRK_OCTEON },
-	{ .compatible = "marvell,armada-38x-uart", .data = (void *)DW_UART_QUIRK_ARMADA_38X },
-	{ .compatible = "renesas,rzn1-uart" },
-	{ .compatible = "starfive,jh7100-hsuart",  .data = (void *)DW_UART_QUIRK_SKIP_SET_RATE },
-	{ .compatible = "starfive,jh7100-uart",    .data = (void *)DW_UART_QUIRK_SKIP_SET_RATE },
+	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
+	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
+	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
+	{ .compatible = "starfive,jh7100-hsuart", .data = &dw8250_starfive_jh7100_data },
+	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_starfive_jh7100_data },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dw8250_of_match);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 72e7dbcccad0..68bb81bee660 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -21,8 +21,13 @@ struct dw8250_port_data {
 	u8			dlf_size;
 };
 
+struct dw8250_platform_data {
+	unsigned int quirks;
+};
+
 struct dw8250_data {
 	struct dw8250_port_data	data;
+	const struct dw8250_platform_data *pdata;
 
 	u8			usr_reg;
 	int			msr_mask_on;
-- 
2.27.0

