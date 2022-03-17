Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4B0F4DCCD4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Mar 2022 18:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237080AbiCQRsM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Mar 2022 13:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237142AbiCQRsE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Mar 2022 13:48:04 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC2E71F1D3C;
        Thu, 17 Mar 2022 10:46:46 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id E1E4AFF805;
        Thu, 17 Mar 2022 17:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1647539205;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lSHph0VTBom+559Fi7bRZ9k06sbXDhuXFhEKUBs8oOM=;
        b=im7Ha6agx2Gi49dEXWsVbRyvy0tfgsv/e4dpdt2Hz88+x9Wtn4I5thKMYeq+nw/9HBGP8B
        l1M9idEfJa7EQat40sCAZFp88sp5CHBdWqNSu1lPwGMR97Vt20SEh1PD2kXavvsdS+o3Wm
        wMDvQME+1FK9NfdDNp+uoB6mlE7rhhDic4sqaL+NeOhnsn8W+jp2ugO1097oIj7UsnEeHM
        V11Hmpsn4573gI4e7OlnnAzhyfJApcC9IdssZko3sPk0Xb3yR7A0Tj0zP9Ftfe0DY4Dwhu
        36pLyajzYKFOOfVzjs6tInnX5+qLNM158fZyp2PunMW4JfVipMVESKQ6rlp+LQ==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-serial@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 08/10] serial: 8250: dw: Add support for DMA flow controlling devices
Date:   Thu, 17 Mar 2022 18:46:25 +0100
Message-Id: <20220317174627.360815-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220317174627.360815-1-miquel.raynal@bootlin.com>
References: <20220317174627.360815-1-miquel.raynal@bootlin.com>
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
---
 drivers/tty/serial/8250/8250_dw.c | 62 +++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index c27f32f67680..edb3f347be8e 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -34,14 +34,23 @@
 
 /* Offsets for the DesignWare specific registers */
 #define DW_UART_USR	0x1f /* UART Status Register */
+#define DW_UART_DMASA	0xa8 /* DMA Software Ack */
+#define DW_UART_TDMACR	0x10c /* DMA Control Register Transmit Mode */
+#define DW_UART_RDMACR	0x110 /* DMA Control Register Receive Mode */
 
 /* DesignWare specific register fields */
 #define DW_UART_MCR_SIRE		BIT(6)
+#define DW_UART_xDMACR_DMA_EN		BIT(0)
+#define DW_UART_xDMACR_1_WORD_BURST	(0 << 1)
+#define DW_UART_xDMACR_4_WORD_BURST	(1 << 1)
+#define DW_UART_xDMACR_8_WORD_BURST	(3 << 1)
+#define DW_UART_xDMACR_BLK_SZ(x)	((x) << 3)
 
 /* Quirks */
 #define DW_UART_QUIRK_OCTEON		BIT(0)
 #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
 #define DW_UART_QUIRK_SKIP_SET_RATE	BIT(2)
+#define DW_UART_QUIRK_IS_DMA_FLOW_CONTROLLER BIT(3)
 
 static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
 {
@@ -225,6 +234,7 @@ static unsigned int dw8250_serial_in32be(struct uart_port *p, int offset)
 
 static int dw8250_handle_irq(struct uart_port *p)
 {
+	const struct dw8250_platform_data *pdata = device_get_match_data(p->dev);
 	struct uart_8250_port *up = up_to_u8250p(p);
 	struct dw8250_data *d = to_dw8250_data(p->private_data);
 	unsigned int iir = p->serial_in(p, UART_IIR);
@@ -252,6 +262,16 @@ static int dw8250_handle_irq(struct uart_port *p)
 		spin_unlock_irqrestore(&p->lock, flags);
 	}
 
+	/* Manually stop the Rx DMA transfer when acting as flow controller */
+	if (up->dma && up->dma->rx_running && rx_timeout && pdata &&
+	    pdata->quirks & DW_UART_QUIRK_IS_DMA_FLOW_CONTROLLER) {
+		status = p->serial_in(p, UART_LSR);
+		if (status & (UART_LSR_DR | UART_LSR_BI)) {
+			writel(0, p->membase + DW_UART_RDMACR);
+			writel(1, p->membase + DW_UART_DMASA);
+		}
+	}
+
 	if (serial8250_handle_irq(p, iir))
 		return 1;
 
@@ -375,6 +395,42 @@ static bool dw8250_idma_filter(struct dma_chan *chan, void *param)
 	return param == chan->device->dev;
 }
 
+static u32 dw8250_rzn1_get_dmacr_burst(int max_burst)
+{
+	if (max_burst >= 8)
+		return DW_UART_xDMACR_8_WORD_BURST;
+	else if (max_burst >= 4)
+		return DW_UART_xDMACR_4_WORD_BURST;
+	else
+		return DW_UART_xDMACR_1_WORD_BURST;
+}
+
+static void dw8250_prepare_tx_dma(struct uart_8250_port *p)
+{
+	struct uart_port *up = &p->port;
+	struct uart_8250_dma *dma = p->dma;
+	u32 val;
+
+	writel(0, up->membase + DW_UART_TDMACR);
+	val = dw8250_rzn1_get_dmacr_burst(dma->txconf.dst_maxburst) |
+	      DW_UART_xDMACR_BLK_SZ(dma->tx_size) |
+	      DW_UART_xDMACR_DMA_EN;
+	writel(val, up->membase + DW_UART_TDMACR);
+}
+
+static void dw8250_prepare_rx_dma(struct uart_8250_port *p)
+{
+	struct uart_port *up = &p->port;
+	struct uart_8250_dma *dma = p->dma;
+	u32 val;
+
+	writel(0, up->membase + DW_UART_RDMACR);
+	val = dw8250_rzn1_get_dmacr_burst(dma->rxconf.src_maxburst) |
+	      DW_UART_xDMACR_BLK_SZ(dma->rx_size) |
+	      DW_UART_xDMACR_DMA_EN;
+	writel(val, up->membase + DW_UART_RDMACR);
+}
+
 static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 {
 	struct device_node *np = p->dev->of_node;
@@ -409,6 +465,12 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 			p->serial_out = dw8250_serial_out38x;
 		if (quirks & DW_UART_QUIRK_SKIP_SET_RATE)
 			p->set_termios = dw8250_do_set_termios;
+		if (quirks & DW_UART_QUIRK_IS_DMA_FLOW_CONTROLLER) {
+			data->data.dma.txconf.device_fc = 1;
+			data->data.dma.rxconf.device_fc = 1;
+			data->data.dma.prepare_tx_dma = dw8250_prepare_tx_dma;
+			data->data.dma.prepare_rx_dma = dw8250_prepare_rx_dma;
+		}
 
 	} else if (acpi_dev_present("APMC0D08", NULL, -1)) {
 		p->iotype = UPIO_MEM32;
-- 
2.27.0

