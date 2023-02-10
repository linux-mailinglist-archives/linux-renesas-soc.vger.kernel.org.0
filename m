Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0732F692861
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 21:34:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233821AbjBJUe5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 15:34:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233901AbjBJUez (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 15:34:55 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3323B3A0AA;
        Fri, 10 Feb 2023 12:34:53 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,287,1669042800"; 
   d="scan'208";a="149208014"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Feb 2023 05:34:53 +0900
Received: from localhost.localdomain (unknown [10.226.93.19])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2A77740029AE;
        Sat, 11 Feb 2023 05:34:49 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-serial@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v3 2/3] serial: 8250_em: Update RZ/V2M port type as PORT_16750
Date:   Fri, 10 Feb 2023 20:34:38 +0000
Message-Id: <20230210203439.174913-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v2->v3:
 * Replaced of_device_get_match_data()->device_get_match_data().
 * Replaced of_device.h->property.h
 * Dropped struct serial8250_em_hw_info *info from priv and started
   using a local variable info in probe().
 * Retained Rb tag from Ilpo as changes are trivial.
v2:
 * New patch
---
 drivers/tty/serial/8250/8250_em.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
index 9781bf73ed0c..69cd3b611501 100644
--- a/drivers/tty/serial/8250/8250_em.c
+++ b/drivers/tty/serial/8250/8250_em.c
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/property.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_reg.h>
 #include <linux/platform_device.h>
@@ -19,6 +20,11 @@
 #define UART_DLL_EM 9
 #define UART_DLM_EM 10
 
+struct serial8250_em_hw_info {
+	unsigned int type;
+	upf_t flags;
+};
+
 struct serial8250_em_priv {
 	int line;
 };
@@ -76,6 +82,7 @@ static void serial8250_em_serial_dl_write(struct uart_8250_port *up, int value)
 
 static int serial8250_em_probe(struct platform_device *pdev)
 {
+	const struct serial8250_em_hw_info *info;
 	struct serial8250_em_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct uart_8250_port up;
@@ -83,6 +90,8 @@ static int serial8250_em_probe(struct platform_device *pdev)
 	struct clk *sclk;
 	int irq, ret;
 
+	info = device_get_match_data(dev);
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
@@ -102,8 +111,8 @@ static int serial8250_em_probe(struct platform_device *pdev)
 	memset(&up, 0, sizeof(up));
 	up.port.mapbase = regs->start;
 	up.port.irq = irq;
-	up.port.type = PORT_UNKNOWN;
-	up.port.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP;
+	up.port.type = info->type;
+	up.port.flags = info->flags;
 	up.port.dev = dev;
 	up.port.private_data = priv;
 
@@ -132,9 +141,20 @@ static int serial8250_em_remove(struct platform_device *pdev)
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

