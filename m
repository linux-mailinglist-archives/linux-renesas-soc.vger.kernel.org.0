Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBC369227C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 16:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232651AbjBJPmH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 10:42:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232835AbjBJPl7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 10:41:59 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2184C5FF9;
        Fri, 10 Feb 2023 07:41:54 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,287,1669042800"; 
   d="scan'208";a="149194755"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 11 Feb 2023 00:41:53 +0900
Received: from localhost.localdomain (unknown [10.226.93.19])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2A512400BC10;
        Sat, 11 Feb 2023 00:41:50 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-serial@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/3] serial: 8250_em: Update RZ/V2M port type as PORT_16750
Date:   Fri, 10 Feb 2023 15:41:39 +0000
Message-Id: <20230210154140.338352-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230210154140.338352-1-biju.das.jz@bp.renesas.com>
References: <20230210154140.338352-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The UART IP found on RZ/V2M SoC is Register-compatible with the
general-purpose 16750 UART chip. This patch updates RZ/V2M
port type from 16550A->16750 and also enables 64-bytes fifo support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch
---
 drivers/tty/serial/8250/8250_em.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
index b78c74755735..628a6846bfdc 100644
--- a/drivers/tty/serial/8250/8250_em.c
+++ b/drivers/tty/serial/8250/8250_em.c
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of_device.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_reg.h>
 #include <linux/platform_device.h>
@@ -19,9 +20,15 @@
 #define UART_DLL_EM 9
 #define UART_DLM_EM 10
 
+struct serial8250_em_hw_info {
+	unsigned int type;
+	upf_t flags;
+};
+
 struct serial8250_em_priv {
 	struct clk *sclk;
 	int line;
+	const struct serial8250_em_hw_info *info;
 };
 
 static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
@@ -95,6 +102,7 @@ static int serial8250_em_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->info = of_device_get_match_data(dev);
 	priv->sclk = devm_clk_get_enabled(dev, "sclk");
 	if (IS_ERR(priv->sclk))
 		return dev_err_probe(dev, PTR_ERR(priv->sclk), "unable to get clock\n");
@@ -102,8 +110,8 @@ static int serial8250_em_probe(struct platform_device *pdev)
 	memset(&up, 0, sizeof(up));
 	up.port.mapbase = regs->start;
 	up.port.irq = irq;
-	up.port.type = PORT_UNKNOWN;
-	up.port.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP;
+	up.port.type = priv->info->type;
+	up.port.flags = priv->info->flags;
 	up.port.dev = dev;
 	up.port.private_data = priv;
 
@@ -133,9 +141,20 @@ static int serial8250_em_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct serial8250_em_hw_info emma_mobile_uart_hw_info = {
+	.type = PORT_UNKNOWN,
+	.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP,
+};
+
+static const struct serial8250_em_hw_info rzv2m_uart_hw_info = {
+	.type = PORT_16750,
+	.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP | UPF_FIXED_TYPE,
+};
+
 static const struct of_device_id serial8250_em_dt_ids[] = {
-	{ .compatible = "renesas,em-uart", },
-	{},
+	{ .compatible = "renesas,r9a09g011-uart", .data = &rzv2m_uart_hw_info },
+	{ .compatible = "renesas,em-uart", .data = &emma_mobile_uart_hw_info },
+	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, serial8250_em_dt_ids);
 
-- 
2.25.1

