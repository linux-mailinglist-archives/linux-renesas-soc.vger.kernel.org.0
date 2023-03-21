Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E923D6C30C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Mar 2023 12:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbjCULsY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Mar 2023 07:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbjCULsQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2023 07:48:16 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4B305158BF;
        Tue, 21 Mar 2023 04:48:13 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,278,1673881200"; 
   d="scan'208";a="156652146"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Mar 2023 20:48:13 +0900
Received: from localhost.localdomain (unknown [10.226.93.140])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 89C4041E3338;
        Tue, 21 Mar 2023 20:48:10 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-serial@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 4/5] tty: serial: sh-sci: Add support for tx end interrupt handling
Date:   Tue, 21 Mar 2023 11:47:52 +0000
Message-Id: <20230321114753.75038-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230321114753.75038-1-biju.das.jz@bp.renesas.com>
References: <20230321114753.75038-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As per the RZ/G2L users hardware manual (Rev.1.20 Sep, 2022), section
23.3.7 Serial Data Transmission (Asynchronous Mode), it is mentioned
that, set the SCR.TIE bit to 0 and SCR.TEIE bit to 1, after the last
data to be transmitted are written to the TDR.

This will generate tx end interrupt and in the handler set SCR.TE and
SCR.TEIE to 0.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Removed fixes tag, as it is a feature enhancement to make tx fully
   functional on RZ/G2L alike SOCs. With previous patch#3, eventhough
   we get tx interrupts, still it is broken as characters entered on
   uart terminal is not visible except for the first character.
v3:
 * New patch
---
 drivers/tty/serial/sh-sci.c | 31 ++++++++++++++++++++++++++++---
 drivers/tty/serial/sh-sci.h |  3 +++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index bcc4152ce043..da7eb7a3ca6f 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -861,9 +861,16 @@ static void sci_transmit_chars(struct uart_port *port)
 
 	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
-	if (uart_circ_empty(xmit))
-		sci_stop_tx(port);
+	if (uart_circ_empty(xmit)) {
+		if (port->type == PORT_SCI) {
+			ctrl = serial_port_in(port, SCSCR);
+			ctrl &= ~SCSCR_TIE;
+			ctrl |= SCSCR_TEIE;
+			serial_port_out(port, SCSCR, ctrl);
+		}
 
+		sci_stop_tx(port);
+	}
 }
 
 static void sci_receive_chars(struct uart_port *port)
@@ -1752,6 +1759,24 @@ static irqreturn_t sci_tx_interrupt(int irq, void *ptr)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
+{
+	struct uart_port *port = ptr;
+	unsigned long flags;
+	unsigned short ctrl;
+
+	if (port->type != PORT_SCI)
+		return sci_tx_interrupt(irq, ptr);
+
+	spin_lock_irqsave(&port->lock, flags);
+	ctrl = serial_port_in(port, SCSCR);
+	ctrl &= ~(SCSCR_TE | SCSCR_TEIE);
+	serial_port_out(port, SCSCR, ctrl);
+	spin_unlock_irqrestore(&port->lock, flags);
+
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t sci_br_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
@@ -1888,7 +1913,7 @@ static const struct sci_irq_desc {
 
 	[SCIx_TEI_IRQ] = {
 		.desc = "tx end",
-		.handler = sci_tx_interrupt,
+		.handler = sci_tx_end_interrupt,
 	},
 
 	/*
diff --git a/drivers/tty/serial/sh-sci.h b/drivers/tty/serial/sh-sci.h
index c0ae78632dda..0b65563c4e9e 100644
--- a/drivers/tty/serial/sh-sci.h
+++ b/drivers/tty/serial/sh-sci.h
@@ -59,6 +59,9 @@ enum {
 #define SCSMR_SRC_19	0x0600	/* Sampling rate 1/19 */
 #define SCSMR_SRC_27	0x0700	/* Sampling rate 1/27 */
 
+/* Serial Control Register, SCI only bits */
+#define SCSCR_TEIE	BIT(2)  /* Transmit End Interrupt Enable */
+
 /* Serial Control Register, SCIFA/SCIFB only bits */
 #define SCSCR_TDRQE	BIT(15)	/* Tx Data Transfer Request Enable */
 #define SCSCR_RDRQE	BIT(14)	/* Rx Data Transfer Request Enable */
-- 
2.25.1

