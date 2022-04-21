Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 033B1509CCA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 11:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387954AbiDUJ4n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 05:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387937AbiDUJ4e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 05:56:34 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BFF5275E5;
        Thu, 21 Apr 2022 02:53:42 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 05EAD1BF215;
        Thu, 21 Apr 2022 09:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650534821;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=22QNVg6uSLAoA0tE56JQu0CNN8Oej1eCBOWwcucJ1cc=;
        b=EfLu5ZafJ9OVDHF4iTz5UkKREGE1ET6dwW18HT1+oh9b0kYQYrVa+KzXbbXFaJ7MIgwwaa
        rPa0Y71lUCNV965nqYMEYy3cIkZm5w6BDIY6DewTmXa3iL6bvje8vIt9a6l7xDLd6bXzeu
        kItUCixbJl28hHarAzktAShW/s77KsGgwAVEPVkKFQ9B8B0XvjwbhCbU4enl9n1NE3j77p
        jBvfEk2bzjvGjD4529DTvqVrGTA2oEGJ2vbdpM6Bifp93Dp9MMRcFdJxan8BhX2Cf5eILe
        Ow6bYRlWLpeSMgs/Btab7W+wUSkSwEh9eDDzJj7bSmSLcE+ncMjhHa2KtImq7A==
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
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH v6 08/12] serial: 8250: dw: Add support for DMA flow controlling devices
Date:   Thu, 21 Apr 2022 11:53:19 +0200
Message-Id: <20220421095323.101811-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220421095323.101811-1-miquel.raynal@bootlin.com>
References: <20220421095323.101811-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Phil Edworthy <phil.edworthy@renesas.com>

DW based controllers like the one on Renesas RZ/N1 must be programmed as
flow controllers when using DMA.

* Table 11.45 of the system manual, "Flow Control Combinations", states
  that using UART with DMA requires setting the DMA in the peripheral
  flow controller mode regardless of the direction.

* Chapter 11.6.1.3 of the system manual, "Basic Interface Definitions",
  explains that the burst size in the above case must be configured in
  the peripheral's register DEST/SRC_BURST_SIZE.

Experiments shown that upon Rx timeout, the DMA transaction needed to be
manually cleared as well.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c | 64 +++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index ef3f05c82ad6..90e64c8bd4bf 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -34,16 +34,28 @@
 
 /* Offsets for the DesignWare specific registers */
 #define DW_UART_USR	0x1f /* UART Status Register */
+#define DW_UART_DMASA	0xa8 /* DMA Software Ack */
 
 #define OCTEON_UART_USR	0x27 /* UART Status Register */
 
+#define RZN1_UART_TDMACR 0x10c /* DMA Control Register Transmit Mode */
+#define RZN1_UART_RDMACR 0x110 /* DMA Control Register Receive Mode */
+
 /* DesignWare specific register fields */
 #define DW_UART_MCR_SIRE		BIT(6)
 
+/* Renesas specific register fields */
+#define RZN1_UART_xDMACR_DMA_EN		BIT(0)
+#define RZN1_UART_xDMACR_1_WORD_BURST	(0 << 1)
+#define RZN1_UART_xDMACR_4_WORD_BURST	(1 << 1)
+#define RZN1_UART_xDMACR_8_WORD_BURST	(3 << 1)
+#define RZN1_UART_xDMACR_BLK_SZ(x)	((x) << 3)
+
 /* Quirks */
 #define DW_UART_QUIRK_OCTEON		BIT(0)
 #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
 #define DW_UART_QUIRK_SKIP_SET_RATE	BIT(2)
+#define DW_UART_QUIRK_IS_DMA_FC		BIT(3)
 
 static inline struct dw8250_data *clk_to_dw8250_data(struct notifier_block *nb)
 {
@@ -226,6 +238,7 @@ static int dw8250_handle_irq(struct uart_port *p)
 	struct dw8250_data *d = to_dw8250_data(p->private_data);
 	unsigned int iir = p->serial_in(p, UART_IIR);
 	bool rx_timeout = (iir & 0x3f) == UART_IIR_RX_TIMEOUT;
+	unsigned int quirks = d->pdata->quirks;
 	unsigned int status;
 	unsigned long flags;
 
@@ -249,6 +262,15 @@ static int dw8250_handle_irq(struct uart_port *p)
 		spin_unlock_irqrestore(&p->lock, flags);
 	}
 
+	/* Manually stop the Rx DMA transfer when acting as flow controller */
+	if (quirks & DW_UART_QUIRK_IS_DMA_FC && up->dma && up->dma->rx_running && rx_timeout) {
+		status = p->serial_in(p, UART_LSR);
+		if (status & (UART_LSR_DR | UART_LSR_BI)) {
+			dw8250_writel_ext(p, RZN1_UART_RDMACR, 0);
+			dw8250_writel_ext(p, DW_UART_DMASA, 1);
+		}
+	}
+
 	if (serial8250_handle_irq(p, iir))
 		return 1;
 
@@ -372,6 +394,42 @@ static bool dw8250_idma_filter(struct dma_chan *chan, void *param)
 	return param == chan->device->dev;
 }
 
+static u32 dw8250_rzn1_get_dmacr_burst(int max_burst)
+{
+	if (max_burst >= 8)
+		return RZN1_UART_xDMACR_8_WORD_BURST;
+	else if (max_burst >= 4)
+		return RZN1_UART_xDMACR_4_WORD_BURST;
+	else
+		return RZN1_UART_xDMACR_1_WORD_BURST;
+}
+
+static void dw8250_prepare_tx_dma(struct uart_8250_port *p)
+{
+	struct uart_port *up = &p->port;
+	struct uart_8250_dma *dma = p->dma;
+	u32 val;
+
+	dw8250_writel_ext(up, RZN1_UART_TDMACR, 0);
+	val = dw8250_rzn1_get_dmacr_burst(dma->txconf.dst_maxburst) |
+	      RZN1_UART_xDMACR_BLK_SZ(dma->tx_size) |
+	      RZN1_UART_xDMACR_DMA_EN;
+	dw8250_writel_ext(up, RZN1_UART_TDMACR, val);
+}
+
+static void dw8250_prepare_rx_dma(struct uart_8250_port *p)
+{
+	struct uart_port *up = &p->port;
+	struct uart_8250_dma *dma = p->dma;
+	u32 val;
+
+	dw8250_writel_ext(up, RZN1_UART_RDMACR, 0);
+	val = dw8250_rzn1_get_dmacr_burst(dma->rxconf.src_maxburst) |
+	      RZN1_UART_xDMACR_BLK_SZ(dma->rx_size) |
+	      RZN1_UART_xDMACR_DMA_EN;
+	dw8250_writel_ext(up, RZN1_UART_RDMACR, val);
+}
+
 static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 {
 	struct device_node *np = p->dev->of_node;
@@ -404,6 +462,12 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 			p->serial_out = dw8250_serial_out38x;
 		if (quirks & DW_UART_QUIRK_SKIP_SET_RATE)
 			p->set_termios = dw8250_do_set_termios;
+		if (quirks & DW_UART_QUIRK_IS_DMA_FC) {
+			data->data.dma.txconf.device_fc = 1;
+			data->data.dma.rxconf.device_fc = 1;
+			data->data.dma.prepare_tx_dma = dw8250_prepare_tx_dma;
+			data->data.dma.prepare_rx_dma = dw8250_prepare_rx_dma;
+		}
 
 	} else if (acpi_dev_present("APMC0D08", NULL, -1)) {
 		p->iotype = UPIO_MEM32;
-- 
2.27.0

