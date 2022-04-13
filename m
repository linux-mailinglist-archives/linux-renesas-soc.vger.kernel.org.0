Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 749784FF0E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 09:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233532AbiDMHy1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 03:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbiDMHyX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 03:54:23 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0B82AE2B;
        Wed, 13 Apr 2022 00:52:01 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 800B3FF813;
        Wed, 13 Apr 2022 07:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649836320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:  content-type:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L4YvpZub+L9j75yVnES+X6I5SvJwm9LUsC40+4XcDpc=;
        b=Oir5H6dQwWyujvKWnBHnjiq0L3v9ZztgnhBb4HC4EapxCQQFkvcR2VqHJ9aK4Gs7l+I/wM
        Oz+h3IVCxiz9H3bMpKAemzZ9zp++YKp3cBYAK0I3dJ52c9xPX7blWxCBGr7s6If5XyiFfu
        9l1df2FoSBen7JXhaO6BVnnsx6orTUoFrq69ZMDqgtEx8pT5+0Xy5vUTRzTNWDhGywalPy
        obopvFA+uY/cS/CeP2ziHDVSKSM7StGb0WUbjl7lTPXPuiekiVKavb9rWq9X33AxP1H/Et
        qODu8r3tnEc0p2CaOZoNUNZf2zd+qYD9qtnyMLJaEsSHlJztclA3YKcdzGktZg==
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
Subject: [PATCH v5 08/11] serial: 8250: dw: Move the IO accessors to 8250_dwlib.h
Date:   Wed, 13 Apr 2022 09:51:38 +0200
Message-Id: <20220413075141.72777-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220413075141.72777-1-miquel.raynal@bootlin.com>
References: <20220413075141.72777-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

These accessors should be used instead of the regular readl/writel()
helpers. In order to use them also from 8250_dw.c in this directory,
move the helpers to 8250_dwlib.h

There is no functional change.

There is no need for declaring `struct uart_port` or even UPIO_MEM32BE
which both are already included in the 8250_dwlib.h header by 8250.h.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/tty/serial/8250/8250_dwlib.c | 16 ----------------
 drivers/tty/serial/8250/8250_dwlib.h | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 22154b5848d5..02b6422c26c7 100644
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
index 412f4e83e0b3..b2a7cff671bf 100644
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

