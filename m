Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B63484EB03F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 17:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238551AbiC2P0o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 11:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238527AbiC2P0f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 11:26:35 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3FC69736;
        Tue, 29 Mar 2022 08:24:45 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 207E5100004;
        Tue, 29 Mar 2022 15:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648567483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bqlxbaPb3hKljw05W+FxwFvbnmrcIPn1a8uATNz0GAM=;
        b=SOgHMXqk/XcDhc7Kk0YAGYcqZaM2HluoVMTUawslxL8NlalVwVJVr1lwzV0hNpTldXkejb
        EIA2uA5ndG18glEr7Wz4wBflKdRp83UC7Y7DZk6WRkcqb5A1cbmzB9nQeHVc57Yc38P1CC
        b8aLTQPcs8IxuBcSTBV+QdMCdc9HVLojEUWScay1ZueTXgOxOZcEow6VdzhbmHdj/uLqIs
        CrMMfJlzU/niKtx9pHsXxxqt9OMlfzS+nswjDG8HVrkkK+USdJY4LhJ2Z3YRn0+tVwyEBL
        eBiOoCWdg2LjuYjZI+uLnR0wX3criYm4OGjTXomZwfSLFTKMB21oMJ31mL8LOQ==
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
Subject: [PATCH v3 05/10] serial: 8250: dw: Allow to use a fallback CPR value if not synthesized
Date:   Tue, 29 Mar 2022 17:24:25 +0200
Message-Id: <20220329152430.756947-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220329152430.756947-1-miquel.raynal@bootlin.com>
References: <20220329152430.756947-1-miquel.raynal@bootlin.com>
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

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/tty/serial/8250/8250_dwlib.c | 9 +++++++++
 drivers/tty/serial/8250/8250_dwlib.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 622d3b0d89e7..6c4fe1792eb5 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -5,6 +5,7 @@
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/property.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
 
@@ -90,6 +91,7 @@ EXPORT_SYMBOL_GPL(dw8250_do_set_termios);
 void dw8250_setup_port(struct uart_port *p)
 {
 	struct uart_8250_port *up = up_to_u8250p(p);
+	const struct dw8250_platform_data *pdata = device_get_match_data(p->dev);
 	u32 reg;
 
 	/*
@@ -116,6 +118,13 @@ void dw8250_setup_port(struct uart_port *p)
 	}
 
 	reg = dw8250_readl_ext(p, DW_UART_CPR);
+	if (!reg) {
+		if (pdata)
+			reg = pdata->cpr;
+
+		dev_dbg(p->dev, "CPR is not available, using %x instead\n", reg);
+	}
+
 	if (!reg)
 		return;
 
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 7dfc2d6361e5..19c530b7fd1d 100644
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

