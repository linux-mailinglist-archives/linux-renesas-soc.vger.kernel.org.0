Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2833A4FF0E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 09:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233509AbiDMHyZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 03:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233511AbiDMHyU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 03:54:20 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C7E35244;
        Wed, 13 Apr 2022 00:51:57 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 7F8EBFF80A;
        Wed, 13 Apr 2022 07:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649836316;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hu+HXpU5fvItezBgUktELOmw8lOKDRbwtb1XKK2BkRs=;
        b=WFCAXwBGotYQeL1HnzCUVrXc94k+ZTe+LtC++ap37l8oEi3EFllgD2S7wm9GGkEkWysiiR
        dX8jyzFA8u9+6tkhh207x9ny6oplyO0r6E6WiCZOeyVG5719OtGhJ8ooCRv3lHPxOBKJHk
        d2vUQB57wMCm12bNC0TDun9mPSknXX/JUYn+IfruEBv0l9Rubf5dt2AAdDIyYNQGRnrHt1
        YarYn5w5jPrfHJd1qogIXD7jWyi0UBfzAx8jXhWEY9Yb5PRkrwdGQMLqFXhPSmmpzTbmme
        vsIAAZ1qWJ7b7MfXg1RcnyF717gKXm/+Ff7pGS6JR16UybfjxKrig4YDTmA8tw==
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
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v5 06/11] serial: 8250: dma: Allow driver operations before starting DMA transfers
Date:   Wed, 13 Apr 2022 09:51:36 +0200
Message-Id: <20220413075141.72777-7-miquel.raynal@bootlin.com>
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

One situation where this could be used is when configuring the UART
controller to be the DMA flow controller. This is a typical case where
the driver might need to program a few more registers before starting a
DMA transfer. Provide the necessary infrastructure to support this
case.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250.h     | 18 ++++++++++++++++++
 drivers/tty/serial/8250/8250_dma.c |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index db784ace25d8..d19f24e4d13e 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -17,6 +17,8 @@
 struct uart_8250_dma {
 	int (*tx_dma)(struct uart_8250_port *p);
 	int (*rx_dma)(struct uart_8250_port *p);
+	void (*prepare_tx_dma)(struct uart_8250_port *p);
+	void (*prepare_rx_dma)(struct uart_8250_port *p);
 
 	/* Filter function */
 	dma_filter_fn		fn;
@@ -301,6 +303,22 @@ extern int serial8250_rx_dma(struct uart_8250_port *);
 extern void serial8250_rx_dma_flush(struct uart_8250_port *);
 extern int serial8250_request_dma(struct uart_8250_port *);
 extern void serial8250_release_dma(struct uart_8250_port *);
+
+static inline void serial8250_do_prepare_tx_dma(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+
+	if (dma->prepare_tx_dma)
+		dma->prepare_tx_dma(p);
+}
+
+static inline void serial8250_do_prepare_rx_dma(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+
+	if (dma->prepare_rx_dma)
+		dma->prepare_rx_dma(p);
+}
 #else
 static inline int serial8250_tx_dma(struct uart_8250_port *p)
 {
diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index b3c3f7e5851a..1bdc8d6432fe 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -86,6 +86,8 @@ int serial8250_tx_dma(struct uart_8250_port *p)
 
 	dma->tx_size = CIRC_CNT_TO_END(xmit->head, xmit->tail, UART_XMIT_SIZE);
 
+	serial8250_do_prepare_tx_dma(p);
+
 	desc = dmaengine_prep_slave_single(dma->txchan,
 					   dma->tx_addr + xmit->tail,
 					   dma->tx_size, DMA_MEM_TO_DEV,
@@ -123,6 +125,8 @@ int serial8250_rx_dma(struct uart_8250_port *p)
 	if (dma->rx_running)
 		return 0;
 
+	serial8250_do_prepare_rx_dma(p);
+
 	desc = dmaengine_prep_slave_single(dma->rxchan, dma->rx_addr,
 					   dma->rx_size, DMA_DEV_TO_MEM,
 					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
-- 
2.27.0

