Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79BBE4D4EA8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Mar 2022 17:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242146AbiCJQSp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 11:18:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242215AbiCJQSG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 11:18:06 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6758A190B6A
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 08:17:01 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id D726AC000A;
        Thu, 10 Mar 2022 16:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1646929018;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TNEWGrWM8MEFCyuhFvcwN9AqeFVgL6hJKTp6D8Wa6aw=;
        b=LzKToIzjJfKeaST+C0vREtqd+dePn1INiJJoqRM/wvRSCcCXvzTXzVMKOu8ddU4h59jXGb
        AaO32n3ds703Fr8aJv2dQWC/CBHac0IIhsL4itjJdHu5ozNmJwRLHbq0lP9qeZdiKhNmu1
        enjuJPl7aUtomGJtUGujUQ4CoxBwOTZyC+0mMMuWahxDiLc6XlNwn7of98Nb3CI4+P1E/q
        Q0fbrHwxcplLsuLsOYjkde7J/uaxg5W6xBNvk5gx/SZqTRBMWq96GG6SNqnmO4OOX7JRjo
        XEyRUKWqKp2rFvYtvkOfbYmQ5KOBiqTSltKbqRzRD2xBdywVNdn/jFIP5LqWMA==
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
Subject: [PATCH 2/7] serial: 8250_dw: Move the per-device structure
Date:   Thu, 10 Mar 2022 17:16:45 +0100
Message-Id: <20220310161650.289387-3-miquel.raynal@bootlin.com>
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

This structure needs to be reused from dwlib, so let's move it into a
shared header. There is no functional change.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
[miquel.raynal@bootlin.com: Extracted from a bigger change]
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 16 ----------------
 drivers/tty/serial/8250/8250_dwlib.h | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 1769808031c5..ee7562a9ec76 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -37,22 +37,6 @@
 /* DesignWare specific register fields */
 #define DW_UART_MCR_SIRE		BIT(6)
 
-struct dw8250_data {
-	struct dw8250_port_data	data;
-
-	u8			usr_reg;
-	int			msr_mask_on;
-	int			msr_mask_off;
-	struct clk		*clk;
-	struct clk		*pclk;
-	struct notifier_block	clk_notifier;
-	struct work_struct	clk_work;
-	struct reset_control	*rst;
-
-	unsigned int		skip_autocfg:1;
-	unsigned int		uart_16550_compatible:1;
-};
-
 static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
 {
 	return container_of(data, struct dw8250_data, data);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 83d528e5cc21..ef63eaf7e598 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -16,5 +16,21 @@ struct dw8250_port_data {
 	u8			dlf_size;
 };
 
+struct dw8250_data {
+	struct dw8250_port_data	data;
+
+	u8			usr_reg;
+	int			msr_mask_on;
+	int			msr_mask_off;
+	struct clk		*clk;
+	struct clk		*pclk;
+	struct notifier_block	clk_notifier;
+	struct work_struct	clk_work;
+	struct reset_control	*rst;
+
+	unsigned int		skip_autocfg:1;
+	unsigned int		uart_16550_compatible:1;
+};
+
 void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, struct ktermios *old);
 void dw8250_setup_port(struct uart_port *p);
-- 
2.27.0

