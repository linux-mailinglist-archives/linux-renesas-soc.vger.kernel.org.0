Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6854C6D1F1D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Mar 2023 13:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjCaLe0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 Mar 2023 07:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbjCaLeW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Mar 2023 07:34:22 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 853A31D91B;
        Fri, 31 Mar 2023 04:33:57 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,307,1673881200"; 
   d="scan'208";a="157862784"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Mar 2023 20:33:54 +0900
Received: from localhost.localdomain (unknown [10.226.93.148])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CF910436D614;
        Fri, 31 Mar 2023 20:33:51 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/5] tty: serial: sh-sci: Add RZ/G2L SCIF DMA tx support
Date:   Fri, 31 Mar 2023 12:33:42 +0100
Message-Id: <20230331113346.170602-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230331113346.170602-1-biju.das.jz@bp.renesas.com>
References: <20230331113346.170602-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SCIF DMA tx support for RZ/G2L alike SoCs.

RZ/G2L alike SoC use the same signal for both interrupt and DMA
transfer requests, so we must disable line interrupts(tx and tx end)
while transferring DMA and enable the TIE source interrupt.

Based on a patch in the BSP by Long Luu
<long.luu.ur@renesas.com>

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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

