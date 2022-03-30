Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFAB24EC568
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 15:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345830AbiC3NWg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 09:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245017AbiC3NWb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 09:22:31 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4F448E6C;
        Wed, 30 Mar 2022 06:20:45 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id EC70C240002;
        Wed, 30 Mar 2022 13:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648646443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BLHdExM09A+T20vX3rDvNlQ+wzydq9g3Zy0CHyU/0CA=;
        b=LNVP9eXYKIRvf997Gu4a4ohunaTQ7/y5Kslg766VCJ3VvEKKEVZXj0m+q3oPRIr1pzx73B
        DeVb6MouD/4nQljG5qde61e1N9sh1ECG2EqIl4QwoKaujW+KzA6oGd3BLub+AMxrTH4Wda
        hfvE1TQuF7emMCFt+gSpy36/sNjV/8LsPFz1Ek4d+px5maQl77pP431HfPrPxdbPmiZALw
        FId+m/6jaDDlX5EBJS6Az1vJ+uaYUXnFmeC+9EhwQ0wIRQf8asNOT8qZb5rEeG9O+Ckwy6
        9lpiEkG2gbSlskbeVaXdjYa/dm2oQTQFtyPrf++HUBSzOzqhelF/6BDefYV6cQ==
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
Subject: [PATCH v4 1/9] serial: 8250: dw: Move definitions to the shared header
Date:   Wed, 30 Mar 2022 15:20:30 +0200
Message-Id: <20220330132038.808679-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220330132038.808679-1-miquel.raynal@bootlin.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Phil Edworthy <phil.edworthy@renesas.com>

Move the per-device structure and a helper out of the main .c file, into
a shared header as they will both be reused from another .c file.

There is no functional change.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
[miquel.raynal@bootlin.com: Extracted from a bigger change]
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 21 ---------------------
 drivers/tty/serial/8250/8250_dwlib.h | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 96a62e95726b..1666041513a5 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -42,27 +42,6 @@
 #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
 #define DW_UART_QUIRK_SKIP_SET_RATE	BIT(2)
 
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
-static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
-{
-	return container_of(data, struct dw8250_data, data);
-}
-
 static inline struct dw8250_data *clk_to_dw8250_data(struct notifier_block *nb)
 {
 	return container_of(nb, struct dw8250_data, clk_notifier);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 83d528e5cc21..72e7dbcccad0 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -1,10 +1,15 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /* Synopsys DesignWare 8250 library header file. */
 
+#include <linux/notifier.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 #include "8250.h"
 
+struct clk;
+struct reset_control;
+
 struct dw8250_port_data {
 	/* Port properties */
 	int			line;
@@ -16,5 +21,26 @@ struct dw8250_port_data {
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
+
+static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
+{
+	return container_of(data, struct dw8250_data, data);
+}
-- 
2.27.0

