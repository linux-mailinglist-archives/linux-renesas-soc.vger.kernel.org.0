Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8D706C7C24
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Mar 2023 11:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbjCXKCk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Mar 2023 06:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbjCXKCi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Mar 2023 06:02:38 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0392E2365A;
        Fri, 24 Mar 2023 03:02:36 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,287,1673881200"; 
   d="scan'208";a="153660287"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Mar 2023 19:02:36 +0900
Received: from localhost.localdomain (unknown [10.226.93.228])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4052E401BBF8;
        Fri, 24 Mar 2023 19:02:33 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/3] tty: serial: sh-sci: Add RZ/G2L SCIF DMA rx support
Date:   Fri, 24 Mar 2023 10:02:22 +0000
Message-Id: <20230324100222.116666-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230324100222.116666-1-biju.das.jz@bp.renesas.com>
References: <20230324100222.116666-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SCIF DMA rx support for RZ/G2L alike SoCs.

RZ/G2L alike SoCs use the same signal for both interrupt and DMA transfer
requests, so we must disable line interrupt while transferring DMA.

We must set FIFO trigger to 1 so that SCIF will request DMA when there is
a character as SCIF DMA request is based on FIFO data full RDF.

Based on a patch in the BSP by Long Luu
<long.luu.ur@renesas.com>

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 drivers/tty/serial/sh-sci.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 81797eb722cb..ce3d6af47759 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1312,9 +1312,13 @@ static void sci_dma_rx_reenable_irq(struct sci_port *s)
 
 	/* Direct new serial port interrupts back to CPU */
 	scr = serial_port_in(port, SCSCR);
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
-		scr &= ~SCSCR_RDRQE;
+	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
+	    is_rz_scif_port(port, s)) {
 		enable_irq(s->irqs[SCIx_RXI_IRQ]);
+		if (port->type == PORT_SCIF)
+			scif_set_rtrg(port, s->rx_trigger);
+		else
+			scr &= ~SCSCR_RDRQE;
 	}
 	serial_port_out(port, SCSCR, scr | SCSCR_RIE);
 }
@@ -1735,7 +1739,15 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 			if (sci_dma_rx_submit(s, false) < 0)
 				goto handle_pio;
 
-			scr &= ~SCSCR_RIE;
+			if (is_rz_scif_port(port, s)) {
+				/* Switch irq from SCIF to DMA */
+				disable_irq_nosync(s->irqs[SCIx_RXI_IRQ]);
+				scif_set_rtrg(port, 1);
+				/* DMA need RIE enable */
+				scr |= SCSCR_RIE;
+			} else {
+				scr &= ~SCSCR_RIE;
+			}
 		}
 		serial_port_out(port, SCSCR, scr);
 		/* Clear current interrupt */
-- 
2.25.1

