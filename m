Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86BD3509CDD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 11:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387932AbiDUJ42 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 05:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387930AbiDUJ4Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 05:56:25 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD30125581;
        Thu, 21 Apr 2022 02:53:35 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id DAB1C1BF219;
        Thu, 21 Apr 2022 09:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650534814;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GW04PeL3gt042YVBAD6j+Utxak9HjtBATEu5WEj2ZLE=;
        b=VQguWJjSv/xFavkJKy5G87rKbxdVXG7RuMEGSR911rHwAFniAL8MSFcHYubvA3Ns0lCFzT
        A0a1WEDjOMd2Jo6d0CPPf/i15wAb7yjHZlvgrKzajbN93t4s0c1NRsQ+DApdzqLQoONGRq
        N+EBcCb0PLyXiwG/Qkt3zjnsDzIckYXPPjZ584SjITi/0N912kZkuU3k/nzBGshvlKdYO5
        dsERmMWkYK12uGcupXkWKNX5+9dlb/nUiFzWNaAzB42QFLpYr3jLL0r1feNZgnT22qMt8G
        LnkLogs2WF5JdfWC7r3sT0Cy9Yggj/JZxhwcrp3/pRKxeF2xACcMZrv4Nk634g==
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
Subject: [PATCH v6 04/12] serial: 8250: dw: Allow to use a fallback CPR value if not synthesized
Date:   Thu, 21 Apr 2022 11:53:15 +0200
Message-Id: <20220421095323.101811-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220421095323.101811-1-miquel.raynal@bootlin.com>
References: <20220421095323.101811-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
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

