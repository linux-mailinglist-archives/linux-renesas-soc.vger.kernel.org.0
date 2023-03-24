Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C32076C7C20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Mar 2023 11:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjCXKCg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Mar 2023 06:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbjCXKCe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Mar 2023 06:02:34 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F36DC199DB;
        Fri, 24 Mar 2023 03:02:33 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,287,1673881200"; 
   d="scan'208";a="153660279"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Mar 2023 19:02:33 +0900
Received: from localhost.localdomain (unknown [10.226.93.228])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 738BA401BBFB;
        Fri, 24 Mar 2023 19:02:31 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/3] tty: serial: sh-sci: Add RZ/G2L SCIF DMA tx support
Date:   Fri, 24 Mar 2023 10:02:21 +0000
Message-Id: <20230324100222.116666-3-biju.das.jz@bp.renesas.com>
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

Add SCIF DMA tx support for RZ/G2L alike SoCs.

RZ/G2L alike SoC use the same signal for both interrupt and DMA
transfer requests, so we must disable line interrupts(tx and tx end)
while transferring DMA and enable the TIE source interrupt.

Based on a patch in the BSP by Long Luu
<long.luu.ur@renesas.com>

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 drivers/tty/serial/sh-sci.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 4278aef59f6d..81797eb722cb 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -172,6 +172,13 @@ to_sci_port(struct uart_port *uart)
 	return container_of(uart, struct sci_port, port);
 }
 
+static inline bool is_rz_scif_port(struct uart_port *port, struct sci_port *s)
+{
+	const struct plat_sci_port *p = s->cfg;
+
+	return port->type == PORT_SCIF && p->regtype == SCIx_RZ_SCIFA_REGTYPE;
+}
+
 static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 	/*
 	 * Common SCI definitions, dependent on the port's regshift
@@ -588,6 +595,16 @@ static void sci_start_tx(struct uart_port *port)
 
 	if (s->chan_tx && !uart_circ_empty(&s->port.state->xmit) &&
 	    dma_submit_error(s->cookie_tx)) {
+		if (is_rz_scif_port(port, s)) {
+			/* Switch irq from SCIF to DMA */
+			disable_irq(s->irqs[SCIx_TXI_IRQ]);
+			disable_irq(s->irqs[SCIx_TEI_IRQ]);
+
+			/* DMA need TIE enable */
+			ctrl = serial_port_in(port, SCSCR);
+			serial_port_out(port, SCSCR, ctrl | SCSCR_TIE);
+		}
+
 		s->cookie_tx = 0;
 		schedule_work(&s->work_tx);
 	}
@@ -1214,9 +1231,16 @@ static void sci_dma_tx_complete(void *arg)
 		schedule_work(&s->work_tx);
 	} else {
 		s->cookie_tx = -EINVAL;
-		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
+		    is_rz_scif_port(port, s)) {
 			u16 ctrl = serial_port_in(port, SCSCR);
 			serial_port_out(port, SCSCR, ctrl & ~SCSCR_TIE);
+			if (port->type == PORT_SCIF) {
+				/* Switch irq from DMA to SCIF */
+				dmaengine_pause(s->chan_tx_saved);
+				enable_irq(s->irqs[SCIx_TXI_IRQ]);
+				enable_irq(s->irqs[SCIx_TEI_IRQ]);
+			}
 		}
 	}
 
-- 
2.25.1

