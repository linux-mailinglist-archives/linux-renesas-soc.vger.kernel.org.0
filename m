Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76BF14D4EC8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Mar 2022 17:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241803AbiCJQSl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 11:18:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242207AbiCJQSG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 11:18:06 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22056190C38
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 08:17:01 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id B7057C0005;
        Thu, 10 Mar 2022 16:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1646929020;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CJZBZm79jOepeJwYz+AdnFA8gp47gjCL5Z1SD7IGsiA=;
        b=DZgGosu/Kfy2qhe+UyyPoAgETCzi225XY0Zht+wbAoOivCQEg98kJj3vq/ODk2wWsdqoGh
        iCgNPaEm9dLYFUy4RIjLZYASU+3YM/FcII9xGCu98FMbDqeIjNd1YbFQuwJnUe2bcA9jYo
        fKBzCNCZ1+4CFZscKQ2b2qA1VoMrytdhIEvAZm3lK9WXpOOrcYA4MH2BD9Rgj6bAjTZYOI
        tkYyokxEGNUAqLI2LOjDNLhvcL4GN3r+RP8wRURCzd+oIeKVhZAUyR1NEIrn2Mj9B1IGWR
        4RGzbVeCfTsALayDzuk/jGbLdFkHEjZAPHmlhg6FFg2PqpfT8I9MFsGClK84KQ==
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
Subject: [PATCH 3/7] serial: 8250_dw: Use a fallback CPR value if not synthesized
Date:   Thu, 10 Mar 2022 17:16:46 +0100
Message-Id: <20220310161650.289387-4-miquel.raynal@bootlin.com>
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

This UART controller can be synthesized without the CPR register.
In that case, let's use the platform information to provide a CPR value.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/tty/serial/8250/8250_dwlib.c | 10 ++++++++--
 drivers/tty/serial/8250/8250_dwlib.h |  4 ++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 622d3b0d89e7..5cf298c5a0f9 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -3,6 +3,7 @@
 
 #include <linux/bitops.h>
 #include <linux/device.h>
+#include <linux/of_device.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/serial_8250.h>
@@ -90,6 +91,7 @@ EXPORT_SYMBOL_GPL(dw8250_do_set_termios);
 void dw8250_setup_port(struct uart_port *p)
 {
 	struct uart_8250_port *up = up_to_u8250p(p);
+	const struct dw8250_platform_data *plat = of_device_get_match_data(up->port.dev);
 	u32 reg;
 
 	/*
@@ -116,8 +118,12 @@ void dw8250_setup_port(struct uart_port *p)
 	}
 
 	reg = dw8250_readl_ext(p, DW_UART_CPR);
-	if (!reg)
-		return;
+	if (!reg) {
+		if (!plat)
+			return;
+
+		reg = plat->cpr;
+	}
 
 	/* Select the type based on FIFO */
 	if (reg & DW_UART_CPR_FIFO_MODE) {
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index ef63eaf7e598..ffce2744a28e 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -16,6 +16,10 @@ struct dw8250_port_data {
 	u8			dlf_size;
 };
 
+struct dw8250_platform_data {
+	u32 cpr;
+};
+
 struct dw8250_data {
 	struct dw8250_port_data	data;
 
-- 
2.27.0

