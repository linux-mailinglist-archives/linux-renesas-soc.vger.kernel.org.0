Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 420974DCCC8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Mar 2022 18:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237068AbiCQRsJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Mar 2022 13:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237100AbiCQRr6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Mar 2022 13:47:58 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5421F0815;
        Thu, 17 Mar 2022 10:46:41 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 8E895FF80F;
        Thu, 17 Mar 2022 17:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1647539200;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y9YWoHK4ejuaax5XaySWfXqZvEQkGQZZG6fyYDYhjcw=;
        b=YDfWP0t4hkGnuRgIgINJISzaJqv8ylyjylXXaWdy+IqYU9RgFsbc0p84kVz6vZnM3cBCYc
        tbQ3oWHgJV+45O8G5ReePXhoLb56UVfeolenNQ5AkZBJ6+kn1Oj9ps7gAAgEQPB2jI4KOU
        U+C/RPA1NhtUMPWWu4HzN8doQFLQRFlsV5yR4zO1gVBIv8BjCqEwToCN3EDygCABbXUgVA
        XHrF2FOyVPf51AZQWSs5mpZrRgEYHRGnUpSzq3KGa8M8MwfWGkcvuNnuGR8Drd4ueZ0GSa
        EuSGfKnkzDlH0x9/RUorDIOQpHFx2fhEeKHUpPgCY+GOJHzTi+tofqUl/KZOGA==
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
Subject: [PATCH v2 05/10] serial: 8250: dw: Check when possible if DMA is effectively supported
Date:   Thu, 17 Mar 2022 18:46:22 +0100
Message-Id: <20220317174627.360815-6-miquel.raynal@bootlin.com>
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

The CPR register can give the information whether the IP is DMA capable
or not. Let's extract this information when the CPR register is valid
and use it to discriminate when the DMA cannot be hooked up.

We assume existing designs either provide a valid CPR register or do not
provide any.

Co-developed-by: Phil Edworthy <phil.edworthy@renesas.com>
Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 4 ++--
 drivers/tty/serial/8250/8250_dwlib.c | 7 +++++--
 drivers/tty/serial/8250/8250_dwlib.h | 1 +
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 88fa17882df5..2f4a818f787c 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -564,8 +564,8 @@ static int dw8250_probe(struct platform_device *pdev)
 	if (!data->skip_autocfg)
 		dw8250_setup_port(p);
 
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
+	/* If we have a valid fifosize and DMA support, try hooking up DMA */
+	if (p->fifosize && !data->no_dma) {
 		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
 		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
 		up->dma = &data->data.dma;
diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index cef20ca3ad61..b3ff67401670 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -92,6 +92,8 @@ void dw8250_setup_port(struct uart_port *p)
 {
 	struct uart_8250_port *up = up_to_u8250p(p);
 	const struct dw8250_platform_data *pdata = device_get_match_data(up->port.dev);
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
@@ -136,5 +136,8 @@ void dw8250_setup_port(struct uart_port *p)
 
 	if (reg & DW_UART_CPR_SIR_MODE)
 		up->capabilities |= UART_CAP_IRDA;
+
+	if (!(reg & DW_UART_CPR_DMA_EXTRA))
+		data->no_dma = 1;
 }
 EXPORT_SYMBOL_GPL(dw8250_setup_port);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 704ba91ab09f..ff965345fc14 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -39,6 +39,7 @@ struct dw8250_data {
 
 	unsigned int		skip_autocfg:1;
 	unsigned int		uart_16550_compatible:1;
+	unsigned int		no_dma:1;
 };
 
 void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, struct ktermios *old);
-- 
2.27.0

