Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2B769227A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 16:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232244AbjBJPl7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 10:41:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbjBJPl4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 10:41:56 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7E1BD552A6;
        Fri, 10 Feb 2023 07:41:51 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,287,1669042800"; 
   d="scan'208";a="149194747"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 11 Feb 2023 00:41:50 +0900
Received: from localhost.localdomain (unknown [10.226.93.19])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 16AEF400BC10;
        Sat, 11 Feb 2023 00:41:47 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/3] serial: 8250_em: Use dev_err_probe()
Date:   Fri, 10 Feb 2023 15:41:38 +0000
Message-Id: <20230210154140.338352-2-biju.das.jz@bp.renesas.com>
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

This patch simplifies probe() function by using dev_err_probe()
instead of dev_err in probe().

While at it, remove the unused header file slab.h and added a
local variable 'dev' to replace '&pdev->dev' in probe().

Also replace devm_clk_get->devm_clk_get_enabled and updated the
clk handling in probe().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * replaced devm_clk_get->devm_clk_get_enabled() and updated clk
   handling in probe().
 * Added Rb tag from Geert.
---
 drivers/tty/serial/8250/8250_em.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
index f8e99995eee9..b78c74755735 100644
--- a/drivers/tty/serial/8250/8250_em.c
+++ b/drivers/tty/serial/8250/8250_em.c
@@ -13,7 +13,6 @@
 #include <linux/serial_reg.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
-#include <linux/slab.h>
 
 #include "8250.h"
 
@@ -79,6 +78,7 @@ static void serial8250_em_serial_dl_write(struct uart_8250_port *up, int value)
 static int serial8250_em_probe(struct platform_device *pdev)
 {
 	struct serial8250_em_priv *priv;
+	struct device *dev = &pdev->dev;
 	struct uart_8250_port up;
 	struct resource *regs;
 	int irq, ret;
@@ -88,30 +88,25 @@ static int serial8250_em_probe(struct platform_device *pdev)
 		return irq;
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!regs) {
-		dev_err(&pdev->dev, "missing registers\n");
-		return -EINVAL;
-	}
+	if (!regs)
+		return dev_err_probe(dev, -EINVAL, "missing registers\n");
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	priv->sclk = devm_clk_get(&pdev->dev, "sclk");
-	if (IS_ERR(priv->sclk)) {
-		dev_err(&pdev->dev, "unable to get clock\n");
-		return PTR_ERR(priv->sclk);
-	}
+	priv->sclk = devm_clk_get_enabled(dev, "sclk");
+	if (IS_ERR(priv->sclk))
+		return dev_err_probe(dev, PTR_ERR(priv->sclk), "unable to get clock\n");
 
 	memset(&up, 0, sizeof(up));
 	up.port.mapbase = regs->start;
 	up.port.irq = irq;
 	up.port.type = PORT_UNKNOWN;
 	up.port.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP;
-	up.port.dev = &pdev->dev;
+	up.port.dev = dev;
 	up.port.private_data = priv;
 
-	clk_prepare_enable(priv->sclk);
 	up.port.uartclk = clk_get_rate(priv->sclk);
 
 	up.port.iotype = UPIO_MEM32;
@@ -121,11 +116,8 @@ static int serial8250_em_probe(struct platform_device *pdev)
 	up.dl_write = serial8250_em_serial_dl_write;
 
 	ret = serial8250_register_8250_port(&up);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "unable to register 8250 port\n");
-		clk_disable_unprepare(priv->sclk);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "unable to register 8250 port\n");
 
 	priv->line = ret;
 	platform_set_drvdata(pdev, priv);
-- 
2.25.1

