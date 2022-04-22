Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 130DB50BF8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 20:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233203AbiDVSNj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 14:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234683AbiDVSJX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 14:09:23 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31CCC120D27;
        Fri, 22 Apr 2022 11:06:27 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 40745100002;
        Fri, 22 Apr 2022 18:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650650786;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GW04PeL3gt042YVBAD6j+Utxak9HjtBATEu5WEj2ZLE=;
        b=j5DF08Nt8FD++0RdXayZC9UP8O+Z+sLE9pAUQ7eYg4aJh7Gcb390h38PrgMjOpkFUThhFC
        UitcwnFVGsPgyJ7CVMOFdRTl+S8caw5D2K9rkbPSAGAr6dmcqrhLFHbqw46QkLfEpL6OWe
        +nJA8rGaoFHZjAlZYsZXph3L4pE2uWtZnnisD/MDdpj44p/b+XWtM5Yd8SMOxi7PPKiUBW
        3EK2yYXEfPXWV1vZDMvGw9SP4Egj6jRDVDLZMKrSnRFMEKs/DcvLWLuavdWOoU7vha01qx
        bPV6imS0jXN5vvLGBthac6Z67IqT0dYi5qnnSDCIkbRh1ESsk4f+fk2VEBRqJw==
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
Subject: [PATCH v7 4/9] serial: 8250: dw: Allow to use a fallback CPR value if not synthesized
Date:   Fri, 22 Apr 2022 20:06:10 +0200
Message-Id: <20220422180615.9098-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220422180615.9098-1-miquel.raynal@bootlin.com>
References: <20220422180615.9098-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dwlib.c | 10 +++++++---
 drivers/tty/serial/8250/8250_dwlib.h |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 622d3b0d89e7..f1fb20353612 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -89,6 +89,8 @@ EXPORT_SYMBOL_GPL(dw8250_do_set_termios);
 
 void dw8250_setup_port(struct uart_port *p)
 {
+	struct dw8250_port_data *pd = p->private_data;
+	struct dw8250_data *data = to_dw8250_data(pd);
 	struct uart_8250_port *up = up_to_u8250p(p);
 	u32 reg;
 
@@ -108,14 +110,16 @@ void dw8250_setup_port(struct uart_port *p)
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
+		reg = data->pdata->cpr_val;
+		dev_dbg(p->dev, "CPR is not available, using 0x%08x instead\n", reg);
+	}
 	if (!reg)
 		return;
 
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 0df6baa6eaee..36a839ef5d9a 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -23,6 +23,7 @@ struct dw8250_port_data {
 
 struct dw8250_platform_data {
 	u8 usr_reg;
+	u32 cpr_val;
 	unsigned int quirks;
 };
 
-- 
2.27.0

