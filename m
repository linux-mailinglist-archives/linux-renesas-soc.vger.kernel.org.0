Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10F5D6DF8F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Apr 2023 16:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbjDLOvJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Apr 2023 10:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbjDLOvI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Apr 2023 10:51:08 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0492F3C39;
        Wed, 12 Apr 2023 07:51:06 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,339,1673881200"; 
   d="scan'208";a="155739584"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 12 Apr 2023 23:51:06 +0900
Received: from localhost.localdomain (unknown [10.226.93.18])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 41B01400F959;
        Wed, 12 Apr 2023 23:51:03 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-serial@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 3/5] tty: serial: sh-sci: Fix TE setting on SCI IP
Date:   Wed, 12 Apr 2023 15:50:51 +0100
Message-Id: <20230412145053.114847-4-biju.das.jz@bp.renesas.com>
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

As per the RZ/G2L users hardware manual (Rev.1.20 Sep, 2022), section
23.3.7 Serial Data Transmission (Asynchronous Mode) it is mentioned
that the TE (transmit enable) must be set after setting TIE (transmit
interrupt enable) or these 2 bits are set to 1 simultaneously by a
single instruction. So set these 2 bits in single instruction.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * Removed fixes tag.
v3:
 * New patch moved here from Renesas SCI fixes patch series
 * Updated commit description
 * Moved handling of clearing TE bit as separate patch#5.
---
 drivers/tty/serial/sh-sci.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 15743c2f3d3d..32f5c1f7d697 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -601,6 +601,15 @@ static void sci_start_tx(struct uart_port *port)
 	    port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
 		/* Set TIE (Transmit Interrupt Enable) bit in SCSCR */
 		ctrl = serial_port_in(port, SCSCR);
+
+		/*
+		 * For SCI, TE (transmit enable) must be set after setting TIE
+		 * (transmit interrupt enable) or in the same instruction to start
+		 * the transmit process.
+		 */
+		if (port->type == PORT_SCI)
+			ctrl |= SCSCR_TE;
+
 		serial_port_out(port, SCSCR, ctrl | SCSCR_TIE);
 	}
 }
@@ -2600,8 +2609,14 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 		sci_set_mctrl(port, port->mctrl);
 	}
 
-	scr_val |= SCSCR_RE | SCSCR_TE |
-		   (s->cfg->scscr & ~(SCSCR_CKE1 | SCSCR_CKE0));
+	/*
+	 * For SCI, TE (transmit enable) must be set after setting TIE
+	 * (transmit interrupt enable) or in the same instruction to
+	 * start the transmitting process. So skip setting TE here for SCI.
+	 */
+	if (port->type != PORT_SCI)
+		scr_val |= SCSCR_TE;
+	scr_val |= SCSCR_RE | (s->cfg->scscr & ~(SCSCR_CKE1 | SCSCR_CKE0));
 	serial_port_out(port, SCSCR, scr_val | s->hscif_tot);
 	if ((srr + 1 == 5) &&
 	    (port->type == PORT_SCIFA || port->type == PORT_SCIFB)) {
-- 
2.25.1

