Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31B606DF8EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Apr 2023 16:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbjDLOvH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Apr 2023 10:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbjDLOvG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Apr 2023 10:51:06 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EE8185B99;
        Wed, 12 Apr 2023 07:51:03 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,339,1673881200"; 
   d="scan'208";a="155739575"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 12 Apr 2023 23:51:03 +0900
Received: from localhost.localdomain (unknown [10.226.93.18])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 74D67400F959;
        Wed, 12 Apr 2023 23:51:01 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 2/5] tty: serial: sh-sci: Add RZ/G2L SCIFA DMA rx support
Date:   Wed, 12 Apr 2023 15:50:50 +0100
Message-Id: <20230412145053.114847-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230412145053.114847-1-biju.das.jz@bp.renesas.com>
References: <20230412145053.114847-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SCIFA IP on RZ/G2L SoC has the same signal for both interrupt
and DMA transfer request. Setting DMARS register for DMA transfer
makes the signal to work as a DMA transfer request signal and
subsequent interrupt requests to the interrupt controller
are masked. Similarly clearing DMARS register makes signal to work as
interrupt signal and subsequent interrupt requests to the interrupt
controller are unmasked.

Add SCIFA DMA rx support for RZ/G2L alike SoCs by disabling RXI line
interrupt and setting DMARS registers by DMA api for DMA transfer request.

Apart from this, we must set FIFO trigger to 1 for the expected behavior
of the receive transmission.

While at it replace the parameter irq to s->irqs[SCIx_RXI_IRQ] in
disable_irq_nosync() to match enable_irq() in sci_dma_rx_reenable_irq().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->4:
 * Updated commit description.
v2->v3:
 * Replaced is_rz_scif_port to s->cfg->regtype check
 * Updated the code flow similar to SCIFA/SCIFB DMA rx handling.
v2:
 * New patch
---
 drivers/tty/serial/sh-sci.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index f70d06a03864..15743c2f3d3d 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1277,9 +1277,13 @@ static void sci_dma_rx_reenable_irq(struct sci_port *s)
 
 	/* Direct new serial port interrupts back to CPU */
 	scr = serial_port_in(port, SCSCR);
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
-		scr &= ~SCSCR_RDRQE;
+	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
+	    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 		enable_irq(s->irqs[SCIx_RXI_IRQ]);
+		if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
+			scif_set_rtrg(port, s->rx_trigger);
+		else
+			scr &= ~SCSCR_RDRQE;
 	}
 	serial_port_out(port, SCSCR, scr | SCSCR_RIE);
 }
@@ -1516,7 +1520,8 @@ static enum hrtimer_restart sci_dma_rx_timer_fn(struct hrtimer *t)
 			tty_flip_buffer_push(&port->state->port);
 	}
 
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
+	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
+	    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
 		sci_dma_rx_submit(s, true);
 
 	sci_dma_rx_reenable_irq(s);
@@ -1640,7 +1645,8 @@ static void sci_request_dma(struct uart_port *port)
 
 		s->chan_rx_saved = s->chan_rx = chan;
 
-		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
+		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
+		    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
 			sci_dma_rx_submit(s, false);
 	}
 }
@@ -1693,9 +1699,15 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 		u16 ssr = serial_port_in(port, SCxSR);
 
 		/* Disable future Rx interrupts */
-		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
-			disable_irq_nosync(irq);
-			scr |= SCSCR_RDRQE;
+		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
+		    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
+			disable_irq_nosync(s->irqs[SCIx_RXI_IRQ]);
+			if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
+				scif_set_rtrg(port, 1);
+				scr |= SCSCR_RIE;
+			} else {
+				scr |= SCSCR_RDRQE;
+			}
 		} else {
 			if (sci_dma_rx_submit(s, false) < 0)
 				goto handle_pio;
-- 
2.25.1

