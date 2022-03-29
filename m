Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62D994EB03C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 17:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238534AbiC2P0f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 11:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238539AbiC2P0e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 11:26:34 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCEB69CCC;
        Tue, 29 Mar 2022 08:24:43 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id B9C4010000B;
        Tue, 29 Mar 2022 15:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648567481;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c6/od88flbvZaoUUFlPYbi+ZiKoNYEQ9FPBU0RJNZkw=;
        b=cyCNJuCPvMhblSJkPPgifVKTezGsO45O9fbXgCLyeatQY7oPYmd61TE35hnuJNHnF78vRU
        9QwHL0TGEAvYyZQ7sL2AZTPtnac8q/8zKQr1LHQESifTlBMzTOUUs9NP57O7UGY0l8JBAK
        oc3BKG5UAA3R3pGrcVS5wWEN7LTPi1XMGaYU3FLempMEjQbZ1eAeo6JpeZT912yNq7jZ4q
        0SWg1J0/evDAw8/Cyfk7nJvNEl+49FFEs7Zh2sG8+vbJNiqDQgkEhFQyglX8BAKUHdOgN/
        yeS3+PgFa7n1vqpY9mA2VSys6bumxFnbNdfxpKXSlcNlXETRALazibLdRId3IQ==
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
Subject: [PATCH v3 04/10] serial: 8250: dw: Create a more generic platform data structure
Date:   Tue, 29 Mar 2022 17:24:24 +0200
Message-Id: <20220329152430.756947-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220329152430.756947-1-miquel.raynal@bootlin.com>
References: <20220329152430.756947-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_BL_SPAMCOP_NET,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Before adding more platform data information, let's turn the quirks
information as being a member of a wider structure. More fields will be
added later.

Cc: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/8250/8250_dw.c    | 24 +++++++++++++++++++-----
 drivers/tty/serial/8250/8250_dwlib.h |  4 ++++
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 20c9ca03225b..95c4321022d5 100644
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
@@ -376,7 +377,8 @@ static bool dw8250_idma_filter(struct dma_chan *chan, void *param)
 static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 {
 	struct device_node *np = p->dev->of_node;
-	unsigned int quirks = (unsigned int)device_get_match_data(p->dev);
+	const struct dw8250_platform_data *pdata = device_get_match_data(p->dev);
+	unsigned int quirks = pdata ? pdata->quirks : 0;
 
 	if (np) {
 		int id;
@@ -683,13 +685,25 @@ static const struct dev_pm_ops dw8250_pm_ops = {
 	SET_RUNTIME_PM_OPS(dw8250_runtime_suspend, dw8250_runtime_resume, NULL)
 };
 
+static const struct dw8250_platform_data dw8250_octeon_3860_data = {
+	.quirks = DW_UART_QUIRK_OCTEON,
+};
+
+static const struct dw8250_platform_data dw8250_armada_38x_data = {
+	.quirks = DW_UART_QUIRK_ARMADA_38X,
+};
+
+static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+};
+
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart" },
-	{ .compatible = "cavium,octeon-3860-uart", .data = (void *)DW_UART_QUIRK_OCTEON },
-	{ .compatible = "marvell,armada-38x-uart", .data = (void *)DW_UART_QUIRK_ARMADA_38X },
+	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
+	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart" },
-	{ .compatible = "starfive,jh7100-hsuart",  .data = (void *)DW_UART_QUIRK_SKIP_SET_RATE },
-	{ .compatible = "starfive,jh7100-uart",    .data = (void *)DW_UART_QUIRK_SKIP_SET_RATE },
+	{ .compatible = "starfive,jh7100-hsuart", .data = &dw8250_starfive_jh7100_data },
+	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_starfive_jh7100_data },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dw8250_of_match);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index e973f804c2f4..7dfc2d6361e5 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -21,6 +21,10 @@ struct dw8250_port_data {
 	u8			dlf_size;
 };
 
+struct dw8250_platform_data {
+	unsigned int quirks;
+};
+
 struct dw8250_data {
 	struct dw8250_port_data	data;
 
-- 
2.27.0

