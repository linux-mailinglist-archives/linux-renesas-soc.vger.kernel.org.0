Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 396E3509CD7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 11:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387953AbiDUJ4m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 05:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387936AbiDUJ4b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 05:56:31 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FEA275C3;
        Thu, 21 Apr 2022 02:53:41 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 2D2FE1BF208;
        Thu, 21 Apr 2022 09:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650534819;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:  content-type:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CQTwgZcq4HqCPFwdxSXAHd+ul51T09kMifPhktLxBDE=;
        b=E8SSOPyfT+ea96xgtzA2h/vYM4Q/s9c4oXnjOH/D24jyiekK8rEhEJ/6iRIgaoqHvtOMi+
        z8884WZAWvuk/6Mk45BG0jXYak+i7IsFvAMy50uCnC9JTITIpXL5uziHfl1/yBZhYpbyWO
        GzXGqbE0+zP5luFimMEZ7E+PtJftFzidfOoiY5xNEEl06xadhJWOLdx8Eu3Fn982loidDJ
        785aFLh8j+23shvumS84NmQ16ZKqYXMhyCsNIRz1zVF55OCar167CURvPIuF/6GuthaWRp
        Si3jIMXISwNz6klHUWgVAoeCEeasfVlhYnEzQMHR1P2pO/ftBA/oYZs2J5nJ4g==
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
Subject: [PATCH v6 07/12] serial: 8250: dw: Move the IO accessors to 8250_dwlib.h
Date:   Thu, 21 Apr 2022 11:53:18 +0200
Message-Id: <20220421095323.101811-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220421095323.101811-1-miquel.raynal@bootlin.com>
References: <20220421095323.101811-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

These accessors should be used instead of the regular readl/writel()
helpers. In order to use them also from 8250_dw.c in this directory,
move the helpers to 8250_dwlib.h

There is no functional change.

There is no need for declaring `struct uart_port` or even UPIO_MEM32BE
which both are already included in the 8250_dwlib.h header by 8250.h.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dwlib.c | 16 ----------------
 drivers/tty/serial/8250/8250_dwlib.h | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index f1fb20353612..b3df6dee9ceb 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -3,7 +3,6 @@
 
 #include <linux/bitops.h>
 #include <linux/device.h>
-#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
@@ -32,21 +31,6 @@
 /* Helper for FIFO size calculation */
 #define DW_UART_CPR_FIFO_SIZE(a)	(((a >> 16) & 0xff) * 16)
 
-static inline u32 dw8250_readl_ext(struct uart_port *p, int offset)
-{
-	if (p->iotype == UPIO_MEM32BE)
-		return ioread32be(p->membase + offset);
-	return readl(p->membase + offset);
-}
-
-static inline void dw8250_writel_ext(struct uart_port *p, int offset, u32 reg)
-{
-	if (p->iotype == UPIO_MEM32BE)
-		iowrite32be(reg, p->membase + offset);
-	else
-		writel(reg, p->membase + offset);
-}
-
 /*
  * divisor = div(I) + div(F)
  * "I" means integer, "F" means fractional
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 36a839ef5d9a..b10e60a5d16a 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /* Synopsys DesignWare 8250 library header file. */
 
+#include <linux/io.h>
 #include <linux/notifier.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
@@ -50,3 +51,18 @@ static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
 {
 	return container_of(data, struct dw8250_data, data);
 }
+
+static inline u32 dw8250_readl_ext(struct uart_port *p, int offset)
+{
+	if (p->iotype == UPIO_MEM32BE)
+		return ioread32be(p->membase + offset);
+	return readl(p->membase + offset);
+}
+
+static inline void dw8250_writel_ext(struct uart_port *p, int offset, u32 reg)
+{
+	if (p->iotype == UPIO_MEM32BE)
+		iowrite32be(reg, p->membase + offset);
+	else
+		writel(reg, p->membase + offset);
+}
-- 
2.27.0

