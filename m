Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88C8F4FF0DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 09:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbiDMHyJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 03:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233495AbiDMHyI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 03:54:08 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B082AE2B;
        Wed, 13 Apr 2022 00:51:47 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 9E964FF814;
        Wed, 13 Apr 2022 07:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649836306;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qm0XugBHn63VlkNrRIwu6dicxO8nELKVELpAB8yZ6NU=;
        b=oA30U6y1bHlm96toMlF/4jC2bi9sjq5+kw2cet+4g/KeEaAzG97Fv66djEAH3wJk0sb7FO
        AS3xhBegxrEflUzMkuczhfyaKDRr847+b5XwgvGYwLEQ0gciq2qutd/OoekV7UvbRoqk2u
        gAq+uuEGVNswILV2ExdVTA6TWQJsiO+yVpogE64ArPO922CYQw9ELPNkDvbYXMMTINYNTL
        0ZbRQ91qDeXsEZXiQx3HobG4MSZwFLBNgCv3siCnXsWRQV/knUG/u5ej+RzwPOJb5vcfZA
        N7jCE6K4elcfxNknmvsvFooj83GVJI/ZSj5JrCGLIsM8JHEPHO+gdZczjn1Jeg==
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
Subject: [PATCH v5 01/11] serial: 8250: dw: Move definitions to the shared header
Date:   Wed, 13 Apr 2022 09:51:31 +0200
Message-Id: <20220413075141.72777-2-miquel.raynal@bootlin.com>
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

From: Phil Edworthy <phil.edworthy@renesas.com>

Move the per-device structure and a helper out of the main .c file, into
a shared header as they will both be reused from another .c file.

There is no functional change.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
[miquel.raynal@bootlin.com: Extracted from a bigger change]
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

