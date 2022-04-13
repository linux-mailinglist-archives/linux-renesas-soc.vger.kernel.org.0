Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3314C4FF0E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 09:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbiDMHyX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 03:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233505AbiDMHyQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 03:54:16 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955742B257;
        Wed, 13 Apr 2022 00:51:55 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 93E47FF810;
        Wed, 13 Apr 2022 07:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649836314;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+aCv2ZPzFHPPznnHSnwmRGRdiwQSrZgW5UwtQhMpVvg=;
        b=f77vhEHveu+bUVu/LHqcF6t14AvqmcievwfdZGn6xOboHADotb3+4xtPkp0UY26hRDJS/a
        yffxQGN4hS4Cjh7iT+swqg91znwu2v5zuvpa+fOSLVatBCgRO8Zz/2BSx6lrsgIamJMRmE
        rvlypb6iB1y9n5Eg8D12bir3xrLroQnKxW1zADY/q2XyFLtgO4KTfAElejcJM0n5CYoJ8r
        skbTZEIdnBuicSk9u8i1nrXy1DYLf9qRznyoS/ZHmCbGZXqfd6L5cen01VyRl6JKqVtae2
        Nz5dL+IdwUW1JUtwPfo7Ct0x4PVQ09VgZ8X4ApCEWPMMtrFXl2x2RW+oWk1LUQ==
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
Subject: [PATCH v5 05/11] serial: 8250: dw: Allow to use a fallback CPR value if not synthesized
Date:   Wed, 13 Apr 2022 09:51:35 +0200
Message-Id: <20220413075141.72777-6-miquel.raynal@bootlin.com>
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

DW UART controllers can be synthesized without the CPR register.
In this case, allow to the platform information to provide a CPR value.

Co-developed-by: Phil Edworthy <phil.edworthy@renesas.com>
Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/tty/serial/8250/8250_dwlib.c | 10 +++++++---
 drivers/tty/serial/8250/8250_dwlib.h |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 622d3b0d89e7..22154b5848d5 100644
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
+		reg = data->pdata->cpr;
+		dev_dbg(p->dev, "CPR is not available, using 0x%08x instead\n", reg);
+	}
 	if (!reg)
 		return;
 
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 0df6baa6eaee..412f4e83e0b3 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -24,6 +24,7 @@ struct dw8250_port_data {
 struct dw8250_platform_data {
 	u8 usr_reg;
 	unsigned int quirks;
+	u32 cpr;
 };
 
 struct dw8250_data {
-- 
2.27.0

