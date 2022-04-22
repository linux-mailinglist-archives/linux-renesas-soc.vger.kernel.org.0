Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E182A50BF7C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 20:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbiDVSNe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 14:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238397AbiDVSJS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 14:09:18 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3EB120D13;
        Fri, 22 Apr 2022 11:06:23 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 7ADC6100008;
        Fri, 22 Apr 2022 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650650782;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fH8vPkT4dWPPGb/8XoLObFxHw6R65IrJ2LRqxUIBB1A=;
        b=P8pOAIJPCn/P5/2cwdN3czs8QkcEMf4U24eU+4V9+rhDqP35ErLXjo+h/p1D4LKjYy2zx6
        sqBzNT5UC9bDPd4R/BjpGxMlNkilnq+Lg/U/tqGRyk0UY8tONdybkU2JvcsbJlUIxZLpoZ
        Z2Crh5Oyl3g63h0kpmtFnPQT9wOKLMp53jIhVlFutO/QhrwGyhen8Mf2DYE1pjnOl+JVNB
        Sq0Av8XKF37WGpc8ezxBBokon1CkSvLAj6DCtUTNUxC0qCpf4/rPrhbaT0+7uGAeOOElpi
        3FpbM4Ws85nDIjYIt5JkxWRmCbjxCi7fk3kkuW/N7NOLuaqNWBfCtC/Q9w6ctw==
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
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
        Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v7 2/9] serial: 8250: dw: Create a generic platform data structure
Date:   Fri, 22 Apr 2022 20:06:08 +0200
Message-Id: <20220422180615.9098-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220422180615.9098-1-miquel.raynal@bootlin.com>
References: <20220422180615.9098-1-miquel.raynal@bootlin.com>
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

From: Emil Renner Berthing <kernel@esmil.dk>

Use device tree match data rather than multiple calls to
of_device_is_compatible() by introducing a platform data structure and
adding a quirks mask.

Provide a stub to the compatibles without quirks to simplify the
handling of the upcoming changes.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
[<miquel.raynal@bootlin.com: Minor changes + creation of a real pdata structure]
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 42 ++++++++++++++++++++++------
 drivers/tty/serial/8250/8250_dwlib.h |  5 ++++
 2 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index dcbe54ccd16b..7fdb2683f534 100644
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
@@ -37,6 +38,11 @@
 /* DesignWare specific register fields */
 #define DW_UART_MCR_SIRE		BIT(6)
 
+/* Quirks */
+#define DW_UART_QUIRK_OCTEON		BIT(0)
+#define DW_UART_QUIRK_ARMADA_38X	BIT(1)
+#define DW_UART_QUIRK_SKIP_SET_RATE	BIT(2)
+
 static inline struct dw8250_data *clk_to_dw8250_data(struct notifier_block *nb)
 {
 	return container_of(nb, struct dw8250_data, clk_notifier);
@@ -366,6 +372,7 @@ static bool dw8250_idma_filter(struct dma_chan *chan, void *param)
 static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 {
 	struct device_node *np = p->dev->of_node;
+	unsigned int quirks = data->pdata->quirks;
 
 	if (np) {
 		int id;
@@ -375,7 +382,7 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		if (id >= 0)
 			p->line = id;
 #ifdef CONFIG_64BIT
-		if (of_device_is_compatible(np, "cavium,octeon-3860-uart")) {
+		if (quirks & DW_UART_QUIRK_OCTEON) {
 			p->serial_in = dw8250_serial_inq;
 			p->serial_out = dw8250_serial_outq;
 			p->flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
@@ -391,9 +398,9 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 			p->serial_out = dw8250_serial_out32be;
 		}
 
-		if (of_device_is_compatible(np, "marvell,armada-38x-uart"))
+		if (quirks & DW_UART_QUIRK_ARMADA_38X)
 			p->serial_out = dw8250_serial_out38x;
-		if (of_device_is_compatible(np, "starfive,jh7100-uart"))
+		if (quirks & DW_UART_QUIRK_SKIP_SET_RATE)
 			p->set_termios = dw8250_do_set_termios;
 
 	} else if (acpi_dev_present("APMC0D08", NULL, -1)) {
@@ -456,6 +463,7 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	data->data.dma.fn = dw8250_fallback_dma_filter;
 	data->usr_reg = DW_UART_USR;
+	data->pdata = device_get_match_data(p->dev);
 	p->private_data = &data->data;
 
 	data->uart_16550_compatible = device_property_read_bool(dev,
@@ -672,12 +680,30 @@ static const struct dev_pm_ops dw8250_pm_ops = {
 	SET_RUNTIME_PM_OPS(dw8250_runtime_suspend, dw8250_runtime_resume, NULL)
 };
 
+static const struct dw8250_platform_data dw8250_dw_apb = {
+};
+
+static const struct dw8250_platform_data dw8250_octeon_3860_data = {
+	.quirks = DW_UART_QUIRK_OCTEON,
+};
+
+static const struct dw8250_platform_data dw8250_armada_38x_data = {
+	.quirks = DW_UART_QUIRK_ARMADA_38X,
+};
+
+static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
+};
+
+static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+};
+
 static const struct of_device_id dw8250_of_match[] = {
-	{ .compatible = "snps,dw-apb-uart" },
-	{ .compatible = "cavium,octeon-3860-uart" },
-	{ .compatible = "marvell,armada-38x-uart" },
-	{ .compatible = "renesas,rzn1-uart" },
-	{ .compatible = "starfive,jh7100-uart" },
+	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
+	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
+	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
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

