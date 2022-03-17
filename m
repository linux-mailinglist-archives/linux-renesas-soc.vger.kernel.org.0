Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF5354DCCCC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Mar 2022 18:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237052AbiCQRsK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Mar 2022 13:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237114AbiCQRsA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Mar 2022 13:48:00 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6711F0815;
        Thu, 17 Mar 2022 10:46:43 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 4211EFF813;
        Thu, 17 Mar 2022 17:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1647539202;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y2lJyEILsp8NDkKtykYkfjKRpqQEf+GhkYUQftZF+0c=;
        b=DZMrNVil6pfIDjQOGubuc++NjYI5c4vF4y1ohjcxlaqDDYrUUEJKDjXFj08UpaRppHJV7t
        6sC6VgXObWvegGo9HE70SWzggkntlXIvdkMptqVNnDcZUqKH3HcmjMJ3ZXlBFos025sBuE
        /D/qzwR9EpBMqaS3V9bPq94jJRXfgHK4V+SOcJoy7LhDYoXZltXNt1zgKoWNuoD+CrYt4u
        KpPw5W17Tk7jgJtYXNaePR+1gvjaw164Tj5+n/nngg+WRVnbx2v4kkM1bhQq6sMie5x2b8
        mFx7rgeV01T3CljpZZIx6oVDSjlAoqNu9bszSdm3XjaAPfYwykpHRBovqA792w==
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
Subject: [PATCH v2 06/10] serial: 8250: dma: Allow driver operations before starting DMA transfers
Date:   Thu, 17 Mar 2022 18:46:23 +0100
Message-Id: <20220317174627.360815-7-miquel.raynal@bootlin.com>
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

One situation where this could be used is when configuring the UART
controller to be the DMA flow controller. This is a typical case where
the driver might need to program a few more registers before starting a
DMA transfer. Provide the necessary infrastructure to support this
case.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
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
index 890fa7ddaa7f..558d3a2ac65b 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -77,6 +77,8 @@ int serial8250_tx_dma(struct uart_8250_port *p)
 
 	dma->tx_size = CIRC_CNT_TO_END(xmit->head, xmit->tail, UART_XMIT_SIZE);
 
+	serial8250_do_prepare_tx_dma(p);
+
 	desc = dmaengine_prep_slave_single(dma->txchan,
 					   dma->tx_addr + xmit->tail,
 					   dma->tx_size, DMA_MEM_TO_DEV,
@@ -114,6 +116,8 @@ int serial8250_rx_dma(struct uart_8250_port *p)
 	if (dma->rx_running)
 		return 0;
 
+	serial8250_do_prepare_rx_dma(p);
+
 	desc = dmaengine_prep_slave_single(dma->rxchan, dma->rx_addr,
 					   dma->rx_size, DMA_DEV_TO_MEM,
 					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
-- 
2.27.0

