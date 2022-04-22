Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15FC150BF93
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 20:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbiDVSNn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 14:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238408AbiDVSJT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 14:09:19 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DCE4120D13;
        Fri, 22 Apr 2022 11:06:25 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 6DC0B10000A;
        Fri, 22 Apr 2022 18:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650650783;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6PKwEIeql6uYeuItC4CotOv1F8iaZ9GjXTTYBwTsneM=;
        b=h5bsfckoKQ1d1AqQc+yKwZhv0kAuWNVq9qfIxUnbWkVxUS4nYfCuYHhMDy0I7nLoZv5oe2
        tcznYgMk8hrL0pMuQx4AYjK7Nz0iMtPiZ6d8Hvi2gDWnCQYxGxvYMv8WGDgTNvriXWHSSu
        lHtUdbm7t7eG5wTKPxTO3Idwbyc2j41IbyO+5u8oKXoa9jUJHNy721tXoJEcXqQHhcjgWQ
        XwycDdEel8qjtPA21fiRHO02//gBtdJLsjcBLzTAfy8gOS5FlnG8RypoTknOnu/S8lLimL
        xIm+/0Guy1WoDOq/DY+7H1Feab4XWG2H4Mzwwti2aZu76pXAsgS2JX5Zxu36Kg==
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
Subject: [PATCH v7 3/9] serial: 8250: dw: Move the USR register to pdata
Date:   Fri, 22 Apr 2022 20:06:09 +0200
Message-Id: <20220422180615.9098-4-miquel.raynal@bootlin.com>
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

This offset is a good candidate to pdata's because it changes depending
on the vendor implementation. Let's move the usr_reg entry from regular
to pdata. This way we can drop initializing it at run time.

Let's also use a define for it instead of defining only the default
value.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 11 ++++++++---
 drivers/tty/serial/8250/8250_dwlib.h |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 7fdb2683f534..b34edc88af3d 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -35,6 +35,8 @@
 /* Offsets for the DesignWare specific registers */
 #define DW_UART_USR	0x1f /* UART Status Register */
 
+#define OCTEON_UART_USR	0x27 /* UART Status Register */
+
 /* DesignWare specific register fields */
 #define DW_UART_MCR_SIRE		BIT(6)
 
@@ -251,7 +253,7 @@ static int dw8250_handle_irq(struct uart_port *p)
 
 	if ((iir & UART_IIR_BUSY) == UART_IIR_BUSY) {
 		/* Clear the USR */
-		(void)p->serial_in(p, d->usr_reg);
+		(void)p->serial_in(p, d->pdata->usr_reg);
 
 		return 1;
 	}
@@ -387,7 +389,6 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 			p->serial_out = dw8250_serial_outq;
 			p->flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
 			p->type = PORT_OCTEON;
-			data->usr_reg = 0x27;
 			data->skip_autocfg = true;
 		}
 #endif
@@ -462,7 +463,6 @@ static int dw8250_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	data->data.dma.fn = dw8250_fallback_dma_filter;
-	data->usr_reg = DW_UART_USR;
 	data->pdata = device_get_match_data(p->dev);
 	p->private_data = &data->data;
 
@@ -681,20 +681,25 @@ static const struct dev_pm_ops dw8250_pm_ops = {
 };
 
 static const struct dw8250_platform_data dw8250_dw_apb = {
+	.usr_reg = DW_UART_USR,
 };
 
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
+	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {
+	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_ARMADA_38X,
 };
 
 static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
+	.usr_reg = DW_UART_USR,
 };
 
 static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
+	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
 };
 
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 68bb81bee660..0df6baa6eaee 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -22,6 +22,7 @@ struct dw8250_port_data {
 };
 
 struct dw8250_platform_data {
+	u8 usr_reg;
 	unsigned int quirks;
 };
 
@@ -29,7 +30,6 @@ struct dw8250_data {
 	struct dw8250_port_data	data;
 	const struct dw8250_platform_data *pdata;
 
-	u8			usr_reg;
 	int			msr_mask_on;
 	int			msr_mask_off;
 	struct clk		*clk;
-- 
2.27.0

