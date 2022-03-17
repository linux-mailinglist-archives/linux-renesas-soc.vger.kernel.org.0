Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD184DCCC2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Mar 2022 18:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237051AbiCQRsG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Mar 2022 13:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237054AbiCQRrw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Mar 2022 13:47:52 -0400
X-Greylist: delayed 97539 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 17 Mar 2022 10:46:34 PDT
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC221EA5F3;
        Thu, 17 Mar 2022 10:46:34 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 6671AFF805;
        Thu, 17 Mar 2022 17:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1647539192;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AnAWj0GNVR7vedRh1qVgjfr2ph03zkT1xTwsURAcXYg=;
        b=Gcm+Z7sGaxiCOe1Q4UNr0RkH6Sss+io1gM04nh4O/Tj5Zy4bOJV/vre2SCZKge/kclsG4L
        eykZfHkI+CmY8TiMgzj11XWI1riCp8MFRf+fCb/vpxvpXFSg+Jmn+/GSpp6PkLLdpWFr+Y
        jfxJJrw8eQ8E0ynVkz+bOjWE0D1JZaLPb+FIzOcL+Ll9ZUyUvLOIFDpzK3wANVyC9tglYH
        zbpuveZQkmpyARAm6BkCZmofJHWA/XtlDFN1/sibPMVnQaBvnRmrHIZ04WGwtu789OEURh
        DJ3+l3zvjr8Uf09BTtheSY7/nKGUp1Ri/LciORNKrCMf1t6K8570p6BsRd3RzQ==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-serial@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 01/10] serial: 8250: dw: Move the per-device structure
Date:   Thu, 17 Mar 2022 18:46:18 +0100
Message-Id: <20220317174627.360815-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220317174627.360815-1-miquel.raynal@bootlin.com>
References: <20220317174627.360815-1-miquel.raynal@bootlin.com>
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
 drivers/tty/serial/8250/8250_dwlib.h | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 96a62e95726b..d89731d6c94c 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -42,22 +42,6 @@
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
 static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
 {
 	return container_of(data, struct dw8250_data, data);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 83d528e5cc21..6ffbf502829e 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -2,6 +2,10 @@
 /* Synopsys DesignWare 8250 library header file. */
 
 #include <linux/types.h>
+#include <linux/clk.h>
+#include <linux/notifier.h>
+#include <linux/workqueue.h>
+#include <linux/reset.h>
 
 #include "8250.h"
 
@@ -16,5 +20,21 @@ struct dw8250_port_data {
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

