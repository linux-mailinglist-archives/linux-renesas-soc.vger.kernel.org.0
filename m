Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60ACA4D4EB6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Mar 2022 17:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242070AbiCJQSl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 11:18:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242244AbiCJQSI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 11:18:08 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703C5190C28
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 08:17:06 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id DE54DC000E;
        Thu, 10 Mar 2022 16:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1646929025;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QfuY4BPsPm4y8C369DK0IcrB8LFleBUBPeKx7mPUKMc=;
        b=ZgkAxhHsTWsS4dqDk7Gf4CSbFZtSWOs6XVNw3sLh6Pf+BMuNgJ69/yO8bB5ZjUudMKABiF
        w9FeqUIcxWhxuiSmLezyoJsHvdPesB3JjrTlOnqHTzGfv0nX9b/Rq7Hdlqpzw8BV05kD8k
        iaIs2Zimhs/JrnTZin5bJ9/PT7mHwUTGf+4KDlKsLUofb8BfHF+36dzI1I/Vy+//iMYzem
        WTm+vGXGhjNXHaUWWtiWWZ3ja6hUBFgEMQ0sAs5Bhgqq7vUFv7k1tvC8O0Jtwg+NOhMtye
        8JSD6Njo4XtsQDEOaTobnELZ0HYZMNa+sr6dNA/xK2aszX5B5tTH+HKMj+3FGA==
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
Subject: [PATCH 5/7] serial: 8250_dw: Add a dma_capable bit to the platform data
Date:   Thu, 10 Mar 2022 17:16:48 +0100
Message-Id: <20220310161650.289387-6-miquel.raynal@bootlin.com>
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

The CPR register can give the information whether the IP is DMA capable
or not. Let's extract this information and use it to discriminate when
the DMA can be hooked up or not.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 4 ++--
 drivers/tty/serial/8250/8250_dwlib.c | 7 +++++--
 drivers/tty/serial/8250/8250_dwlib.h | 1 +
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 1f7a423d6ef2..c0f54284bc70 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -556,8 +556,8 @@ static int dw8250_probe(struct platform_device *pdev)
 	if (!data->skip_autocfg)
 		dw8250_setup_port(p);
 
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
+	/* If we have a valid fifosize and DMA support, try hooking up DMA */
+	if (p->fifosize && data->dma_capable) {
 		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
 		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
 		up->dma = &data->data.dma;
diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 5cf298c5a0f9..5ec7c12ed117 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -92,6 +92,8 @@ void dw8250_setup_port(struct uart_port *p)
 {
 	struct uart_8250_port *up = up_to_u8250p(p);
 	const struct dw8250_platform_data *plat = of_device_get_match_data(up->port.dev);
+	struct dw8250_port_data *d = p->private_data;
+	struct dw8250_data *data = container_of(d, struct dw8250_data, data);
 	u32 reg;
 
 	/*
@@ -110,8 +112,6 @@ void dw8250_setup_port(struct uart_port *p)
 	dw8250_writel_ext(p, DW_UART_DLF, 0);
 
 	if (reg) {
-		struct dw8250_port_data *d = p->private_data;
-
 		d->dlf_size = fls(reg);
 		p->get_divisor = dw8250_get_divisor;
 		p->set_divisor = dw8250_set_divisor;
@@ -138,5 +138,8 @@ void dw8250_setup_port(struct uart_port *p)
 
 	if (reg & DW_UART_CPR_SIR_MODE)
 		up->capabilities |= UART_CAP_IRDA;
+
+	if (reg & DW_UART_CPR_DMA_EXTRA)
+		data->dma_capable = 1;
 }
 EXPORT_SYMBOL_GPL(dw8250_setup_port);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index ffce2744a28e..900b2321aff0 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -34,6 +34,7 @@ struct dw8250_data {
 
 	unsigned int		skip_autocfg:1;
 	unsigned int		uart_16550_compatible:1;
+	unsigned int		dma_capable:1;
 };
 
 void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, struct ktermios *old);
-- 
2.27.0

