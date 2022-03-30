Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 452014EC56E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 15:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345867AbiC3NWi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 09:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345857AbiC3NWg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 09:22:36 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEDBE4924E;
        Wed, 30 Mar 2022 06:20:50 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 55A6A24000C;
        Wed, 30 Mar 2022 13:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648646449;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yAoLZnwEfOO8Ip/F0oyn26ieJetYG95+rua5BfVAriA=;
        b=MXJmfKUYzG4HfGGapWTmamhzjO50dBsp97sR4PPA0d7E1n0dTbUtWDdVHGgDJGSn4DVYEx
        D9GAFR4ouUJ6Wsq5wMa6tN7xkguKZzTzoHXC+Zyd1XeDa5ivC+AmpjJgE6mUUxfjSernmu
        zp8rhYLOGz1ct5hXljuOjZbTTr9WEq/s52j5Zxwn2yd5a5qoHdlTDJkncbdHdFzuvTcWZW
        QVmMqALnU115DuRPiBLQpASFckacYvqy1XPN7XGmWGm2JRdo89kdTO1Kn6z3o3ecAMwvGd
        BGt3vYAB5zJlNWDFGSudmNLxQcar5C9t/SBIlygp6hpIvQgNrjSRAWduxEe9CA==
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
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH v4 4/9] serial: 8250: dw: Allow to use a fallback CPR value if not synthesized
Date:   Wed, 30 Mar 2022 15:20:33 +0200
Message-Id: <20220330132038.808679-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220330132038.808679-1-miquel.raynal@bootlin.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DW UART controllers can be synthesized without the CPR register.
In this case, allow to the platform information to provide a CPR value.

Co-developed-by: Phil Edworthy <phil.edworthy@renesas.com>
Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/tty/serial/8250/8250_dwlib.c | 12 +++++++++---
 drivers/tty/serial/8250/8250_dwlib.h |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 622d3b0d89e7..6ec59b64f8bc 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -5,6 +5,7 @@
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/property.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
 
@@ -89,6 +90,8 @@ EXPORT_SYMBOL_GPL(dw8250_do_set_termios);
 
 void dw8250_setup_port(struct uart_port *p)
 {
+	struct dw8250_port_data *pd = p->private_data;
+	struct dw8250_data *data = to_dw8250_data(pd);
 	struct uart_8250_port *up = up_to_u8250p(p);
 	u32 reg;
 
@@ -108,14 +111,17 @@ void dw8250_setup_port(struct uart_port *p)
 	dw8250_writel_ext(p, DW_UART_DLF, 0);
 
 	if (reg) {
-		struct dw8250_port_data *d = p->private_data;
-
-		d->dlf_size = fls(reg);
+		pd->dlf_size = fls(reg);
 		p->get_divisor = dw8250_get_divisor;
 		p->set_divisor = dw8250_set_divisor;
 	}
 
 	reg = dw8250_readl_ext(p, DW_UART_CPR);
+	if (!reg) {
+		reg = data->pdata->cpr;
+		dev_dbg(p->dev, "CPR is not available, using 0x%08x instead\n", reg);
+	}
+
 	if (!reg)
 		return;
 
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 68bb81bee660..5bd534825414 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -23,6 +23,7 @@ struct dw8250_port_data {
 
 struct dw8250_platform_data {
 	unsigned int quirks;
+	u32 cpr;
 };
 
 struct dw8250_data {
-- 
2.27.0

