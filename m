Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 838C16909D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 14:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbjBIN0z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 08:26:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbjBIN0y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 08:26:54 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8A06093E8;
        Thu,  9 Feb 2023 05:26:50 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,283,1669042800"; 
   d="scan'208";a="149040873"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Feb 2023 22:26:50 +0900
Received: from localhost.localdomain (unknown [10.226.92.132])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1B70A4334957;
        Thu,  9 Feb 2023 22:26:47 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/3] serial: 8250_em: Add serial8250_rzv2m_reg_update()
Date:   Thu,  9 Feb 2023 13:26:30 +0000
Message-Id: <20230209132630.194947-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209132630.194947-1-biju.das.jz@bp.renesas.com>
References: <20230209132630.194947-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As per HW manual section 40.6.1, we need to perform FIFO reset + SW
reset before updating the below registers

FCR[7:5], FCR[3:0], LCR[7][5:0], MCR[6:4], DLL[7:0], DLM[7:0] and
HCR0[6:5][3:2].

This patch adds serial8250_rzv2m_reg_update() to handle it.

DLL/DLM register can be updated only by setting LCR[7]. So the
updation of LCR[7] will perform reset for DLL/DLM register changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/tty/serial/8250/8250_em.c | 49 +++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
index 3a45aa066d3d..a1e42b8ef99d 100644
--- a/drivers/tty/serial/8250/8250_em.c
+++ b/drivers/tty/serial/8250/8250_em.c
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_reg.h>
 #include <linux/platform_device.h>
@@ -18,14 +19,53 @@
 
 #define UART_DLL_EM 9
 #define UART_DLM_EM 10
+#define UART_HCR0 11
+
+#define UART_HCR0_SW_RESET	BIT(7) /* SW Reset */
 
 struct serial8250_em_priv {
 	struct clk *sclk;
 	int line;
+	bool is_rzv2m;
 };
 
+static void serial8250_rzv2m_reg_update(struct uart_port *p, int off, int value)
+{
+	unsigned int ier, fcr, lcr, mcr, hcr0;
+
+	ier = readl(p->membase + (UART_IER << 2));
+	hcr0 = readl(p->membase + (UART_HCR0 << 2));
+	fcr = readl(p->membase + ((UART_FCR + 1) << 2));
+	lcr = readl(p->membase + ((UART_LCR + 1) << 2));
+	mcr = readl(p->membase + ((UART_MCR + 1) << 2));
+
+	writel(fcr | UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT, p->membase + ((UART_FCR + 1) << 2));
+	writel(hcr0 | UART_HCR0_SW_RESET, p->membase + (UART_HCR0 << 2));
+	writel(hcr0 & ~UART_HCR0_SW_RESET, p->membase + (UART_HCR0 << 2));
+
+	switch (off) {
+	case UART_FCR:
+		fcr = value;
+		break;
+	case UART_LCR:
+		lcr = value;
+		break;
+	case UART_MCR:
+		mcr = value;
+		break;
+	}
+
+	writel(ier, p->membase + (UART_IER << 2));
+	writel(fcr, p->membase + ((UART_FCR + 1) << 2));
+	writel(mcr, p->membase + ((UART_MCR + 1) << 2));
+	writel(lcr, p->membase + ((UART_LCR + 1) << 2));
+	writel(hcr0, p->membase + (UART_HCR0 << 2));
+}
+
 static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
 {
+	struct serial8250_em_priv *priv = p->private_data;
+
 	switch (offset) {
 	case UART_TX: /* TX @ 0x00 */
 		writeb(value, p->membase);
@@ -33,6 +73,11 @@ static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
 	case UART_FCR: /* FCR @ 0x0c (+1) */
 	case UART_LCR: /* LCR @ 0x10 (+1) */
 	case UART_MCR: /* MCR @ 0x14 (+1) */
+		if (priv->is_rzv2m)
+			serial8250_rzv2m_reg_update(p, offset, value);
+		else
+			writel(value, p->membase + ((offset + 1) << 2));
+		break;
 	case UART_SCR: /* SCR @ 0x20 (+1) */
 		writel(value, p->membase + ((offset + 1) << 2));
 		break;
@@ -111,6 +156,10 @@ static int serial8250_em_probe(struct platform_device *pdev)
 	up.port.uartclk = clk_get_rate(priv->sclk);
 
 	up.port.iotype = UPIO_MEM32;
+
+	if (of_device_is_compatible(dev->of_node, "renesas,r9a09g011-uart"))
+		priv->is_rzv2m = true;
+
 	up.port.serial_in = serial8250_em_serial_in;
 	up.port.serial_out = serial8250_em_serial_out;
 	up.dl_read = serial8250_em_serial_dl_read;
-- 
2.25.1

