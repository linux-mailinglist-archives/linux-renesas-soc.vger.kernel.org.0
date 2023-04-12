Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 867B06DF8EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Apr 2023 16:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbjDLOvG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Apr 2023 10:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbjDLOvF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Apr 2023 10:51:05 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A4A936581;
        Wed, 12 Apr 2023 07:51:01 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,339,1673881200"; 
   d="scan'208";a="159190231"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 12 Apr 2023 23:51:00 +0900
Received: from localhost.localdomain (unknown [10.226.93.18])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id AA280400A646;
        Wed, 12 Apr 2023 23:50:58 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 1/5] tty: serial: sh-sci: Add RZ/G2L SCIFA DMA tx support
Date:   Wed, 12 Apr 2023 15:50:49 +0100
Message-Id: <20230412145053.114847-2-biju.das.jz@bp.renesas.com>
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

Add SCIFA DMA tx support for RZ/G2L alike SoCs by disabling TXI line
interrupt and setting DMARS registers by DMA api for DMA transfer request.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated commit description by removing tx end interrupt.
v2->v3:
 * Dropped inline function is_rz_scif_port() and instead using
   s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE for finding RZ SCIF port.
 * Dropped SCIx_TEI_IRQ as DMAC activation not possible with TEI interrupt.
 * Updated the code flow similar to SCIFA/SCIFB DMAC tx handling.
v1->v2:
 * No change
---
 drivers/tty/serial/sh-sci.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index ca31e34afd83..f70d06a03864 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -588,12 +588,17 @@ static void sci_start_tx(struct uart_port *port)
 
 	if (s->chan_tx && !uart_circ_empty(&s->port.state->xmit) &&
 	    dma_submit_error(s->cookie_tx)) {
+		if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
+			/* Switch irq from SCIF to DMA */
+			disable_irq(s->irqs[SCIx_TXI_IRQ]);
+
 		s->cookie_tx = 0;
 		schedule_work(&s->work_tx);
 	}
 #endif
 
-	if (!s->chan_tx || port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+	if (!s->chan_tx || s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE ||
+	    port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
 		/* Set TIE (Transmit Interrupt Enable) bit in SCSCR */
 		ctrl = serial_port_in(port, SCSCR);
 		serial_port_out(port, SCSCR, ctrl | SCSCR_TIE);
@@ -1192,9 +1197,15 @@ static void sci_dma_tx_complete(void *arg)
 		schedule_work(&s->work_tx);
 	} else {
 		s->cookie_tx = -EINVAL;
-		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
+		    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 			u16 ctrl = serial_port_in(port, SCSCR);
 			serial_port_out(port, SCSCR, ctrl & ~SCSCR_TIE);
+			if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
+				/* Switch irq from DMA to SCIF */
+				dmaengine_pause(s->chan_tx_saved);
+				enable_irq(s->irqs[SCIx_TXI_IRQ]);
+			}
 		}
 	}
 
-- 
2.25.1

