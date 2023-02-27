Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6A36A4113
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Feb 2023 12:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjB0LmW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Feb 2023 06:42:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjB0LmR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 06:42:17 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 07B761E9FE;
        Mon, 27 Feb 2023 03:42:15 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,331,1669042800"; 
   d="scan'208";a="154220858"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Feb 2023 20:42:15 +0900
Received: from localhost.localdomain (unknown [10.226.93.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C82C44230B5D;
        Mon, 27 Feb 2023 20:42:12 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 5/7] serial: 8250_em: Use devm_clk_get_enabled()
Date:   Mon, 27 Feb 2023 11:41:50 +0000
Message-Id: <20230227114152.22265-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227114152.22265-1-biju.das.jz@bp.renesas.com>
References: <20230227114152.22265-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Simplify clk handling in probe() by replacing devm_clk_get()->devm_
clk_get_enabled(). This replaces the usage of clk_prepare_enable/clk_
disable_unprepare() in probe()/remove(). After that sclk is no
longer required in struct serial8250_em_priv and is replaced by a
local variable sclk in probe().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Updated commit description.
v4:
 * New patch. Split from patch#1.
 * Removed sclk from struct serial8250_em_priv instead used local
   variable in probe().
 * Replaced devm_clk_get->devm_clk_get_enabled() and removed
   clk_prepare_enable/clk_disable_unprepare from probe()/remove().
---
 drivers/tty/serial/8250/8250_em.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
index 621abca93694..dcf1761e8ef5 100644
--- a/drivers/tty/serial/8250/8250_em.c
+++ b/drivers/tty/serial/8250/8250_em.c
@@ -20,7 +20,6 @@
 #define UART_DLM_EM 10
 
 struct serial8250_em_priv {
-	struct clk *sclk;
 	int line;
 };
 
@@ -82,6 +81,7 @@ static int serial8250_em_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct uart_8250_port up;
 	struct resource *regs;
+	struct clk *sclk;
 	int irq, ret;
 
 	irq = platform_get_irq(pdev, 0);
@@ -96,9 +96,9 @@ static int serial8250_em_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->sclk = devm_clk_get(dev, "sclk");
-	if (IS_ERR(priv->sclk))
-		return dev_err_probe(dev, PTR_ERR(priv->sclk), "unable to get clock\n");
+	sclk = devm_clk_get_enabled(dev, "sclk");
+	if (IS_ERR(sclk))
+		return dev_err_probe(dev, PTR_ERR(sclk), "unable to get clock\n");
 
 	memset(&up, 0, sizeof(up));
 	up.port.mapbase = regs->start;
@@ -108,8 +108,7 @@ static int serial8250_em_probe(struct platform_device *pdev)
 	up.port.dev = dev;
 	up.port.private_data = priv;
 
-	clk_prepare_enable(priv->sclk);
-	up.port.uartclk = clk_get_rate(priv->sclk);
+	up.port.uartclk = clk_get_rate(sclk);
 
 	up.port.iotype = UPIO_MEM32;
 	up.port.serial_in = serial8250_em_serial_in;
@@ -118,10 +117,8 @@ static int serial8250_em_probe(struct platform_device *pdev)
 	up.dl_write = serial8250_em_serial_dl_write;
 
 	ret = serial8250_register_8250_port(&up);
-	if (ret < 0) {
-		clk_disable_unprepare(priv->sclk);
+	if (ret < 0)
 		return dev_err_probe(dev, ret, "unable to register 8250 port\n");
-	}
 
 	priv->line = ret;
 	platform_set_drvdata(pdev, priv);
@@ -133,7 +130,6 @@ static int serial8250_em_remove(struct platform_device *pdev)
 	struct serial8250_em_priv *priv = platform_get_drvdata(pdev);
 
 	serial8250_unregister_port(priv->line);
-	clk_disable_unprepare(priv->sclk);
 	return 0;
 }
 
-- 
2.25.1

