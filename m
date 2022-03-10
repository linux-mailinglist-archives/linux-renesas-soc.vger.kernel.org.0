Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 549324D4E9D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Mar 2022 17:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241800AbiCJQSm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 11:18:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242340AbiCJQSL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 11:18:11 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4CD190B65
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 08:17:09 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 7A1D1C0014;
        Thu, 10 Mar 2022 16:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1646929027;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kye6zb5CJ+/1y3pryFv/kf2H9/v+1KWRa8BYpUA7+00=;
        b=f6A1TrlG5evlD8zA//r+6bUSGxaTMa8w9IYPXOs7DYrQmihIgAhej4j7DPkUj1dK4LPIQs
        6tNpcrtUViVMocP1OyIPXIw5GaT9hw7Da+gk/JkySxn0oNXqYEEbIbHgOj+ncuKTVLvrjM
        cZvwDBdjoZ/b74gGF96VQy4Yk0pjBO9NkY2JxsBi7Wyb/KuP5Zgl3XW4YITS6IHq64MYUp
        2jnEl/SFQZbXw5L8wDomoXRYNDZCneH2VVf9e1UnHhjoOdcUZuRintVgE4ueeiLOgqYxSP
        h2UaKaxeGE1nPvkVvcnr+GAlS8vssMo0QNaQ5ZEcqnIZ5oP5kHtlVRf60W5CJg==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 6/7] serial: 8250_dw: Add support for RZ/N1 DMA
Date:   Thu, 10 Mar 2022 17:16:49 +0100
Message-Id: <20220310161650.289387-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220310161650.289387-1-miquel.raynal@bootlin.com>
References: <20220310161650.289387-1-miquel.raynal@bootlin.com>
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

From: Phil Edworthy <phil.edworthy@renesas.com>

The Renesas RZ/N1 devices have a modified Synopsys DW UART. The
modifications are mostly related to the DMA handlnig, and so this patch
adds support for DMA.

The RZ/N1 UART must be used with the peripheral as the flow
controller. This means the DMA length should also be programmed into
UART registers.

Aside from this, there are some points to note about DMA burst sizes.
First, DMA must not remove all of the data from the rx FIFO. Otherwise,
we do not get a 'character timeout' interrupt, and so do not know that
we should push data up the serial stack. Therefore, we have the rx
threshold for generating an interrupt set to half the FIFO depth (this
is the default for 16550A), and set the DMA burst size when reading the
FIFO to a quarter of the FIFO depth.

Second, when transmitting data using DMA, the burst size must be limited
to 1 byte to handle then case when transmitting just 1 byte. Otherwise
the DMA doesn't complete the burst, and nothing happens.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/tty/serial/8250/8250_dma.c   |  2 +
 drivers/tty/serial/8250/8250_dw.c    | 97 ++++++++++++++++++++++++++++
 drivers/tty/serial/8250/8250_dwlib.h |  1 +
 3 files changed, 100 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index a0563f2341ac..0858c0b988a2 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -105,6 +105,7 @@ int serial8250_tx_dma(struct uart_8250_port *p)
 	dma->tx_err = 1;
 	return ret;
 }
+EXPORT_SYMBOL_GPL(serial8250_tx_dma);
 
 int serial8250_rx_dma(struct uart_8250_port *p)
 {
@@ -130,6 +131,7 @@ int serial8250_rx_dma(struct uart_8250_port *p)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(serial8250_rx_dma);
 
 void serial8250_rx_dma_flush(struct uart_8250_port *p)
 {
diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index c0f54284bc70..04e05fc939df 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -37,6 +37,20 @@
 /* DesignWare specific register fields */
 #define DW_UART_MCR_SIRE		BIT(6)
 
+/* Offsets for the Renesas RZ/N1 DesignWare specific registers */
+/* DMA Software Ack */
+#define RZN1_UART_DMASA			0xa8
+/* DMA Control Register Transmit Mode */
+#define RZN1_UART_TDMACR		0x10c
+/* DMA Control Register Receive Mode */
+#define RZN1_UART_RDMACR		0x110
+
+#define RZN1_UART_xDMACR_DMA_EN		BIT(0)
+#define RZN1_UART_xDMACR_1_WORD_BURST	0
+#define RZN1_UART_xDMACR_4_WORD_BURST	BIT(1)
+#define RZN1_UART_xDMACR_8_WORD_BURST	(BIT(1) | BIT(2))
+#define RZN1_UART_xDMACR_BLK_SZ_OFFSET	3
+
 static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
 {
 	return container_of(data, struct dw8250_data, data);
@@ -217,6 +231,22 @@ static unsigned int dw8250_serial_in32be(struct uart_port *p, int offset)
 }
 
 
+static void rzn1_8250_handle_irq(struct uart_port *port, unsigned int iir)
+{
+	struct uart_8250_port *up = up_to_u8250p(port);
+	struct uart_8250_dma *dma = up->dma;
+	unsigned char status;
+
+	if (up->dma && dma->rx_running) {
+		status = port->serial_in(port, UART_LSR);
+		if (status & (UART_LSR_DR | UART_LSR_BI)) {
+			/* Stop the DMA transfer */
+			writel(0, port->membase + RZN1_UART_RDMACR);
+			writel(1, port->membase + RZN1_UART_DMASA);
+		}
+	}
+}
+
 static int dw8250_handle_irq(struct uart_port *p)
 {
 	struct uart_8250_port *up = up_to_u8250p(p);
@@ -245,6 +275,9 @@ static int dw8250_handle_irq(struct uart_port *p)
 		spin_unlock_irqrestore(&p->lock, flags);
 	}
 
+	if (d->is_rzn1 && ((iir & 0x3f) == UART_IIR_RX_TIMEOUT))
+		rzn1_8250_handle_irq(p, iir);
+
 	if (serial8250_handle_irq(p, iir))
 		return 1;
 
@@ -368,6 +401,61 @@ static bool dw8250_idma_filter(struct dma_chan *chan, void *param)
 	return param == chan->device->dev;
 }
 
+static u32 rzn1_get_dmacr_burst(int max_burst)
+{
+	u32 val = 0;
+
+	if (max_burst >= 8)
+		val = RZN1_UART_xDMACR_8_WORD_BURST;
+	else if (max_burst >= 4)
+		val = RZN1_UART_xDMACR_4_WORD_BURST;
+	else
+		val = RZN1_UART_xDMACR_1_WORD_BURST;
+
+	return val;
+}
+
+static int rzn1_dw8250_tx_dma(struct uart_8250_port *p)
+{
+	struct uart_port		*up = &p->port;
+	struct uart_8250_dma		*dma = p->dma;
+	struct circ_buf			*xmit = &p->port.state->xmit;
+	int tx_size;
+	u32 val;
+
+	if (uart_tx_stopped(&p->port) || dma->tx_running ||
+	    uart_circ_empty(xmit))
+		return 0;
+
+	tx_size = CIRC_CNT_TO_END(xmit->head, xmit->tail, UART_XMIT_SIZE);
+
+	writel(0, up->membase + RZN1_UART_TDMACR);
+	val = rzn1_get_dmacr_burst(dma->txconf.dst_maxburst);
+	val |= tx_size << RZN1_UART_xDMACR_BLK_SZ_OFFSET;
+	val |= RZN1_UART_xDMACR_DMA_EN;
+	writel(val, up->membase + RZN1_UART_TDMACR);
+
+	return serial8250_tx_dma(p);
+}
+
+static int rzn1_dw8250_rx_dma(struct uart_8250_port *p)
+{
+	struct uart_port		*up = &p->port;
+	struct uart_8250_dma		*dma = p->dma;
+	u32 val;
+
+	if (dma->rx_running)
+		return 0;
+
+	writel(0, up->membase + RZN1_UART_RDMACR);
+	val = rzn1_get_dmacr_burst(dma->rxconf.src_maxburst);
+	val |= dma->rx_size << RZN1_UART_xDMACR_BLK_SZ_OFFSET;
+	val |= RZN1_UART_xDMACR_DMA_EN;
+	writel(val, up->membase + RZN1_UART_RDMACR);
+
+	return serial8250_rx_dma(p);
+}
+
 static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 {
 	struct device_node *np = p->dev->of_node;
@@ -501,6 +589,8 @@ static int dw8250_probe(struct platform_device *pdev)
 		data->msr_mask_off |= UART_MSR_TERI;
 	}
 
+	data->is_rzn1 = of_device_is_compatible(dev->of_node, "renesas,rzn1-uart");
+
 	/* Always ask for fixed clock rate from a property. */
 	device_property_read_u32(dev, "clock-frequency", &p->uartclk);
 
@@ -561,6 +651,13 @@ static int dw8250_probe(struct platform_device *pdev)
 		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
 		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
 		up->dma = &data->data.dma;
+
+		if (data->is_rzn1) {
+			data->data.dma.txconf.device_fc = 1;
+			data->data.dma.rxconf.device_fc = 1;
+			uart.dma->tx_dma = rzn1_dw8250_tx_dma;
+			uart.dma->rx_dma = rzn1_dw8250_rx_dma;
+		}
 	}
 
 	data->data.line = serial8250_register_8250_port(up);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 900b2321aff0..014005c170e4 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -35,6 +35,7 @@ struct dw8250_data {
 	unsigned int		skip_autocfg:1;
 	unsigned int		uart_16550_compatible:1;
 	unsigned int		dma_capable:1;
+	unsigned int		is_rzn1:1;
 };
 
 void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, struct ktermios *old);
-- 
2.27.0

