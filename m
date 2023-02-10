Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F28C69227F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 16:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232835AbjBJPmI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 10:42:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbjBJPmC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 10:42:02 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CB6D777B99;
        Fri, 10 Feb 2023 07:41:56 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,287,1669042800"; 
   d="scan'208";a="152417855"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Feb 2023 00:41:56 +0900
Received: from localhost.localdomain (unknown [10.226.93.19])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1FC0A400BC10;
        Sat, 11 Feb 2023 00:41:53 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/3] serial: 8250_em: Add serial_out() to struct serial8250_em_hw_info
Date:   Fri, 10 Feb 2023 15:41:40 +0000
Message-Id: <20230210154140.338352-4-biju.das.jz@bp.renesas.com>
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

As per HW manual section 40.6.1, we need to perform FIFO reset + SW
reset before updating the below registers.

FCR[7:5], FCR[3:0], LCR[7][5:0], MCR[6:4], DLL[7:0], DLM[7:0] and
HCR0[6:5][3:2].

This patch adds serial_out() to struct serial8250_em_hw_info to
handle this difference between emma mobile and rz/v2m.

DLL/DLM register can be updated only by setting LCR[7]. So the
updation of LCR[7] will perform reset for DLL/DLM register changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Added serial_out to struct serial8250_em_hw_info
---
 drivers/tty/serial/8250/8250_em.c | 59 ++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
index 628a6846bfdc..1816362a3a3a 100644
--- a/drivers/tty/serial/8250/8250_em.c
+++ b/drivers/tty/serial/8250/8250_em.c
@@ -19,10 +19,14 @@
 
 #define UART_DLL_EM 9
 #define UART_DLM_EM 10
+#define UART_HCR0 11
+
+#define UART_HCR0_SW_RESET	BIT(7) /* SW Reset */
 
 struct serial8250_em_hw_info {
 	unsigned int type;
 	upf_t flags;
+	void (*serial_out)(struct uart_port *p, int off, int value);
 };
 
 struct serial8250_em_priv {
@@ -31,6 +35,40 @@ struct serial8250_em_priv {
 	const struct serial8250_em_hw_info *info;
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
+	writel(fcr | UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT,
+	       p->membase + ((UART_FCR + 1) << 2));
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
 	switch (offset) {
@@ -52,6 +90,23 @@ static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
 	}
 }
 
+static void serial8250_em_rzv2m_serial_out(struct uart_port *p, int offset, int value)
+{
+	switch (offset) {
+	case UART_TX:
+	case UART_SCR:
+	case UART_IER:
+	case UART_DLL_EM:
+	case UART_DLM_EM:
+		serial8250_em_serial_out(p, offset, value);
+		break;
+	case UART_FCR:
+	case UART_LCR:
+	case UART_MCR:
+		serial8250_rzv2m_reg_update(p, offset, value);
+	}
+}
+
 static unsigned int serial8250_em_serial_in(struct uart_port *p, int offset)
 {
 	switch (offset) {
@@ -119,7 +174,7 @@ static int serial8250_em_probe(struct platform_device *pdev)
 
 	up.port.iotype = UPIO_MEM32;
 	up.port.serial_in = serial8250_em_serial_in;
-	up.port.serial_out = serial8250_em_serial_out;
+	up.port.serial_out = priv->info->serial_out;
 	up.dl_read = serial8250_em_serial_dl_read;
 	up.dl_write = serial8250_em_serial_dl_write;
 
@@ -144,11 +199,13 @@ static int serial8250_em_remove(struct platform_device *pdev)
 static const struct serial8250_em_hw_info emma_mobile_uart_hw_info = {
 	.type = PORT_UNKNOWN,
 	.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP,
+	.serial_out = serial8250_em_serial_out,
 };
 
 static const struct serial8250_em_hw_info rzv2m_uart_hw_info = {
 	.type = PORT_16750,
 	.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP | UPF_FIXED_TYPE,
+	.serial_out = serial8250_em_rzv2m_serial_out,
 };
 
 static const struct of_device_id serial8250_em_dt_ids[] = {
-- 
2.25.1

