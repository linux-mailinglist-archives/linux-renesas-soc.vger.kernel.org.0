Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED0574FF0DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 09:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbiDMHyV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 03:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbiDMHyM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 03:54:12 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46802AE2C;
        Wed, 13 Apr 2022 00:51:51 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id D2A09FF806;
        Wed, 13 Apr 2022 07:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649836310;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BEXVWsaDwRLXPaV0JvlxSGsK3e+q5MmOU/HFk1qgThw=;
        b=IOW+zcIEBYPJnG6COUdKCwDOebjJqrelDO7jX3KsbhjOm6iJt27f07+XDqvWJj7KVUt/79
        VfjUi0AmUwv1YaQ7r7YaqT6nk/36X+Y0Nu/WFopRRAHNZCoKW4Gj+kepH85vOlNkhIctgK
        bJM26j8CRtQ61DJvlifnNB/deGzP8Ig6WcLFnifC+WeBMEhhskuNybyxw/5umcwBLN/TFy
        dtUSLI1sQ6Z0OP8xw+s8bcJymiSWMYUYwJu4fCWTkVbP9JCdkf3Fw2Nn2kN4Qm922ybz6a
        314qGiu9pZf2NJejGOTYArK7ouRa3xbMt6huv4hdXq5d/lwOctWMmrbtgrTlGw==
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
Subject: [PATCH v5 03/11] serial: 8250: dw: Create a more generic platform data structure
Date:   Wed, 13 Apr 2022 09:51:33 +0200
Message-Id: <20220413075141.72777-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220413075141.72777-1-miquel.raynal@bootlin.com>
References: <20220413075141.72777-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 33 ++++++++++++++++++++++------
 drivers/tty/serial/8250/8250_dwlib.h |  5 +++++
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index e9f8b65563a1..93b112f3bc49 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -372,7 +372,7 @@ static bool dw8250_idma_filter(struct dma_chan *chan, void *param)
 static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 {
 	struct device_node *np = p->dev->of_node;
-	unsigned long quirks = (unsigned long)device_get_match_data(p->dev);
+	unsigned int quirks = data->pdata->quirks;
 
 	if (np) {
 		int id;
@@ -463,6 +463,7 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	data->data.dma.fn = dw8250_fallback_dma_filter;
 	data->usr_reg = DW_UART_USR;
+	data->pdata = device_get_match_data(p->dev);
 	p->private_data = &data->data;
 
 	data->uart_16550_compatible = device_property_read_bool(dev,
@@ -679,13 +680,31 @@ static const struct dev_pm_ops dw8250_pm_ops = {
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

