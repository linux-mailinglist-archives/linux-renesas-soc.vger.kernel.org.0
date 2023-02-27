Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 253B96A4118
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Feb 2023 12:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbjB0Lmg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Feb 2023 06:42:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjB0LmX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 06:42:23 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5BF9017162;
        Mon, 27 Feb 2023 03:42:22 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,331,1669042800"; 
   d="scan'208";a="150917530"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 27 Feb 2023 20:42:21 +0900
Received: from localhost.localdomain (unknown [10.226.93.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2E8F74230B5D;
        Mon, 27 Feb 2023 20:42:18 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 7/7] serial: 8250_em: Add serial8250_em_{reg_update(),out_helper()}
Date:   Mon, 27 Feb 2023 11:41:52 +0000
Message-Id: <20230227114152.22265-8-biju.das.jz@bp.renesas.com>
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

As per RZ/V2M hardware manual(Rev.1.30 Jun, 2022), UART IP has a
restriction as mentioned below.

40.6.1 Point for Caution when Changing the Register Settings:

When changing the settings of the following registers, a PRESETn master
reset or FIFO reset + SW reset (FCR[2],FCR[1], HCR0[7]) must be input to
re-initialize them.

Target Registers: FCR, LCR, MCR, DLL, DLM, HCR0.

Add serial8250_em_reg_update() and serial8250_em_serial_out_helper() to
handle this restriction. serial8250_em_serial_out_helper() is identical to
previous serial8250_em_serial_out() except that UART_FCR macro is removed
from serial8250_em_serial_out_helper() as it is now handled by serial8250_
em_serial_out().

DLL/DLM register can be updated only by setting LCR[7]. So the
updation of LCR[7] will perform reset for DLL/DLM register changes.

EMMA mobile has the same register set as RZ/V2M and this patch is tested on
EMEV2 board. So, there is no harm in applying the same restriction here as
well as the HW manual for EMMA mobile is not updated for a long time.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Updated commit description.
 * Dropped UART_FCR from serial8250_em_serial_out_helper() as it is handled in
   serial8250_em_serial_out().
 * Fixed code alignment in serial8250_em_reg_update()
 * Added missing break statements.
v3->v4:
 * Updated restriction to EMMA mobile SoC as well.
 * Replaced readl->serial8250_em_serial_in() for reading fcr register
   in serial8250_em_reg_update().
 * Added serial8250_em_serial_out_helper() to simplify the
   code and used for register writes in serial8250_em_reg_update().
v2->v3:
 * Replaced readl/writel()->serial8250_em_serial_in/out() in serial8250_rzv2m_
   reg_update() to avoid duplication of offset trickery.
 * Added support for HCR0 read/write in serial8250_em_{serial_in, serial_out}
 * Added UART_LCR macro support in serial8250_em_serial_in() to read LCR
 * Reordered serial8250_em_{serial_in, serial_out} above serial8250_rzv2m_
   reg_update().
 * Replaced priv->info->serial_out to info->serial_out.
v1->v2:
 * Added serial_out to struct serial8250_em_hw_info
---
 drivers/tty/serial/8250/8250_em.c | 67 ++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
index 7614ced9377e..25a9ecf26be6 100644
--- a/drivers/tty/serial/8250/8250_em.c
+++ b/drivers/tty/serial/8250/8250_em.c
@@ -18,6 +18,7 @@
 
 #define UART_DLL_EM 9
 #define UART_DLM_EM 10
+#define UART_HCR0_EM 11
 
 /*
  * A high value for UART_FCR_EM avoids overlapping with existing UART_*
@@ -26,11 +27,14 @@
 #define UART_FCR_EM 0x10003
 #define UART_FCR_EM_HW 3
 
+#define UART_HCR0_EM_SW_RESET	BIT(7) /* SW Reset */
+
 struct serial8250_em_priv {
 	int line;
 };
 
-static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
+static void serial8250_em_serial_out_helper(struct uart_port *p, int offset,
+					    int value)
 {
 	switch (offset) {
 	case UART_TX: /* TX @ 0x00 */
@@ -41,7 +45,6 @@ static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
 	case UART_SCR: /* SCR @ 0x20 (+1) */
 		writel(value, p->membase + ((offset + 1) << 2));
 		break;
-	case UART_FCR:
 	case UART_FCR_EM:
 		writel(value, p->membase + (UART_FCR_EM_HW << 2));
 		break;
@@ -50,6 +53,7 @@ static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
 		fallthrough;
 	case UART_DLL_EM: /* DLL @ 0x24 (+9) */
 	case UART_DLM_EM: /* DLM @ 0x28 (+9) */
+	case UART_HCR0_EM: /* HCR0 @ 0x2c */
 		writel(value, p->membase + (offset << 2));
 		break;
 	}
@@ -60,6 +64,7 @@ static unsigned int serial8250_em_serial_in(struct uart_port *p, int offset)
 	switch (offset) {
 	case UART_RX: /* RX @ 0x00 */
 		return readb(p->membase);
+	case UART_LCR: /* LCR @ 0x10 (+1) */
 	case UART_MCR: /* MCR @ 0x14 (+1) */
 	case UART_LSR: /* LSR @ 0x18 (+1) */
 	case UART_MSR: /* MSR @ 0x1c (+1) */
@@ -71,11 +76,69 @@ static unsigned int serial8250_em_serial_in(struct uart_port *p, int offset)
 	case UART_IIR: /* IIR @ 0x08 */
 	case UART_DLL_EM: /* DLL @ 0x24 (+9) */
 	case UART_DLM_EM: /* DLM @ 0x28 (+9) */
+	case UART_HCR0_EM: /* HCR0 @ 0x2c */
 		return readl(p->membase + (offset << 2));
 	}
 	return 0;
 }
 
+static void serial8250_em_reg_update(struct uart_port *p, int off, int value)
+{
+	unsigned int ier, fcr, lcr, mcr, hcr0;
+
+	ier = serial8250_em_serial_in(p, UART_IER);
+	fcr = serial8250_em_serial_in(p, UART_FCR_EM);
+	lcr = serial8250_em_serial_in(p, UART_LCR);
+	mcr = serial8250_em_serial_in(p, UART_MCR);
+	hcr0 = serial8250_em_serial_in(p, UART_HCR0_EM);
+
+	serial8250_em_serial_out_helper(p, UART_FCR_EM, fcr |
+							UART_FCR_CLEAR_RCVR |
+							UART_FCR_CLEAR_XMIT);
+	serial8250_em_serial_out_helper(p, UART_HCR0_EM, hcr0 |
+							 UART_HCR0_EM_SW_RESET);
+	serial8250_em_serial_out_helper(p, UART_HCR0_EM, hcr0 &
+							 ~UART_HCR0_EM_SW_RESET);
+
+	switch (off) {
+	case UART_FCR_EM:
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
+	serial8250_em_serial_out_helper(p, UART_IER, ier);
+	serial8250_em_serial_out_helper(p, UART_FCR_EM, fcr);
+	serial8250_em_serial_out_helper(p, UART_MCR, mcr);
+	serial8250_em_serial_out_helper(p, UART_LCR, lcr);
+	serial8250_em_serial_out_helper(p, UART_HCR0_EM, hcr0);
+}
+
+static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
+{
+	switch (offset) {
+	case UART_TX:
+	case UART_SCR:
+	case UART_IER:
+	case UART_DLL_EM:
+	case UART_DLM_EM:
+		serial8250_em_serial_out_helper(p, offset, value);
+		break;
+	case UART_FCR:
+		serial8250_em_reg_update(p, UART_FCR_EM, value);
+		break;
+	case UART_LCR:
+	case UART_MCR:
+		serial8250_em_reg_update(p, offset, value);
+		break;
+	}
+}
+
 static int serial8250_em_serial_dl_read(struct uart_8250_port *up)
 {
 	return serial_in(up, UART_DLL_EM) | serial_in(up, UART_DLM_EM) << 8;
-- 
2.25.1

