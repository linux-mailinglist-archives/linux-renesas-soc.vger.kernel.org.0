Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A139D6D1F2A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Mar 2023 13:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbjCaLen (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 Mar 2023 07:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231966AbjCaLek (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Mar 2023 07:34:40 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9E3B63A9E;
        Fri, 31 Mar 2023 04:34:22 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,307,1673881200"; 
   d="scan'208";a="157862829"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Mar 2023 20:34:06 +0900
Received: from localhost.localdomain (unknown [10.226.93.148])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 07022436D61E;
        Fri, 31 Mar 2023 20:34:03 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-serial@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 5/5] tty: serial: sh-sci: Fix end of transmission on SCI
Date:   Fri, 31 Mar 2023 12:33:46 +0100
Message-Id: <20230331113346.170602-6-biju.das.jz@bp.renesas.com>
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

We need to set TE to "0" (i.e., disable serial transmission) to
get the behavior of the end of serial transmission as expected.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 New patch. split from patch#3.
---
 drivers/tty/serial/sh-sci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 5c9ae69c0555..7c9457962a3d 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -847,6 +847,11 @@ static void sci_transmit_chars(struct uart_port *port)
 		} else if (!uart_circ_empty(xmit) && !stopped) {
 			c = xmit->buf[xmit->tail];
 			xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
+		} else if (port->type == PORT_SCI && uart_circ_empty(xmit)) {
+			ctrl = serial_port_in(port, SCSCR);
+			ctrl &= ~SCSCR_TE;
+			serial_port_out(port, SCSCR, ctrl);
+			return;
 		} else {
 			break;
 		}
-- 
2.25.1

