Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A589669AA99
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 12:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjBQLnH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 06:43:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbjBQLnG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 06:43:06 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C6164241F6;
        Fri, 17 Feb 2023 03:43:05 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,304,1669042800"; 
   d="scan'208";a="153224451"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Feb 2023 20:43:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.177])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D79AE40029C4;
        Fri, 17 Feb 2023 20:43:02 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 1/6] serial: 8250_em: Use dev_err_probe()
Date:   Fri, 17 Feb 2023 11:42:50 +0000
Message-Id: <20230217114255.226517-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch simplifies probe() by using dev_err() instead
of dev_err_probe() and added a local variable 'dev' to
replace '&pdev->dev'.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Split from patch#1 
 * Replaced dev_err->dev_err_probe() in probe()
 * Added a local variable 'dev' to replace '&pdev->dev' in probe().
v2->v3:
 * Dropped sclk from priv.
 * Dropped unneeded clk_disable_unprepare from remove().
 * Retained Rb tags from Geert and Andy as the changes are trivial.
v1->v2:
 * replaced devm_clk_get->devm_clk_get_enabled() and updated clk
   handling in probe().
 * Added Rb tag from Geert.
---
 drivers/tty/serial/8250/8250_em.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
index f8e99995eee9..785153d8502d 100644
--- a/drivers/tty/serial/8250/8250_em.c
+++ b/drivers/tty/serial/8250/8250_em.c
@@ -79,6 +79,7 @@ static void serial8250_em_serial_dl_write(struct uart_8250_port *up, int value)
 static int serial8250_em_probe(struct platform_device *pdev)
 {
 	struct serial8250_em_priv *priv;
+	struct device *dev = &pdev->dev;
 	struct uart_8250_port up;
 	struct resource *regs;
 	int irq, ret;
@@ -88,27 +89,23 @@ static int serial8250_em_probe(struct platform_device *pdev)
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
+	priv->sclk = devm_clk_get(dev, "sclk");
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
 
 	clk_prepare_enable(priv->sclk);
@@ -122,9 +119,8 @@ static int serial8250_em_probe(struct platform_device *pdev)
 
 	ret = serial8250_register_8250_port(&up);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "unable to register 8250 port\n");
 		clk_disable_unprepare(priv->sclk);
-		return ret;
+		return dev_err_probe(dev, ret, "unable to register 8250 port\n");
 	}
 
 	priv->line = ret;
-- 
2.25.1

