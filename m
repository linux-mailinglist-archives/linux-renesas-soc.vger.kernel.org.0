Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 320996BD494
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Mar 2023 17:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjCPQB1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Mar 2023 12:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjCPQB0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2023 12:01:26 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C03B6BBB3;
        Thu, 16 Mar 2023 09:01:23 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,265,1673881200"; 
   d="scan'208";a="156196531"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Mar 2023 01:01:23 +0900
Received: from localhost.localdomain (unknown [10.226.93.88])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 67E45401207E;
        Fri, 17 Mar 2023 01:01:20 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-serial@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Date:   Thu, 16 Mar 2023 16:01:18 +0000
Message-Id: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ SCI/ RZ/A1 SCIF has only 4 interrupts. The fourth interrupt
is transmit end interrupt, so shuffle the interrupts to fix the
transmit end interrupt handler for these IPs.

Fixes: 392fb8df528b ("serial: sh-sci: Use platform_get_irq_optional() for optional interrupts")
Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Tested the SCI0 interface on RZ/G2UL by connecting to PMOD USBUART.
 39:          0     GICv3 437 Level     1004d000.serial:rx err
 40:         12     GICv3 438 Edge      1004d000.serial:rx full
 41:         70     GICv3 439 Edge      1004d000.serial:tx empty
 42:         18     GICv3 440 Level     1004d000.serial:tx end
---
 drivers/tty/serial/sh-sci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 7bd080720929..9b07b45a6948 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -31,6 +31,7 @@
 #include <linux/ioport.h>
 #include <linux/ktime.h>
 #include <linux/major.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/of.h>
@@ -2841,6 +2842,7 @@ static int sci_init_single(struct platform_device *dev,
 	struct uart_port *port = &sci_port->port;
 	const struct resource *res;
 	unsigned int i;
+	int irq_cnt;
 	int ret;
 
 	sci_port->cfg	= p;
@@ -2864,6 +2866,14 @@ static int sci_init_single(struct platform_device *dev,
 			sci_port->irqs[i] = platform_get_irq(dev, i);
 	}
 
+	/*
+	 * RZ SCI/ RZ/A1 SCIF has only 4 interrupts. The fourth interrupt
+	 * is transmit end interrupt, so shuffle the interrupts.
+	 */
+	irq_cnt = platform_irq_count(dev);
+	if (irq_cnt == 4)
+		swap(sci_port->irqs[SCIx_BRI_IRQ], sci_port->irqs[SCIx_TEI_IRQ]);
+
 	/* The SCI generates several interrupts. They can be muxed together or
 	 * connected to different interrupt lines. In the muxed case only one
 	 * interrupt resource is specified as there is only one interrupt ID.
-- 
2.25.1

