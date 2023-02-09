Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E33B6909DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 14:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbjBIN04 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 08:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbjBIN0x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 08:26:53 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 79035212A;
        Thu,  9 Feb 2023 05:26:45 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,283,1669042800"; 
   d="scan'208";a="152255803"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Feb 2023 22:26:44 +0900
Received: from localhost.localdomain (unknown [10.226.92.132])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D93D5433495E;
        Thu,  9 Feb 2023 22:26:40 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Wander Lairson Costa <wander@redhat.com>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/3] serial: 8250: Identify Renesas RZ/V2M 16750 UART
Date:   Thu,  9 Feb 2023 13:26:28 +0000
Message-Id: <20230209132630.194947-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209132630.194947-1-biju.das.jz@bp.renesas.com>
References: <20230209132630.194947-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add identification support for RZ/V2M 16750 UART.

Currently, RZ/V2M UART is detected as 16550A instead of 16750.
"a4040000.serial: ttyS0 at MMIO 0xa4040000 (irq = 14, base_baud = 3000000)
is a 16550A"

After adding identification support, it is detected as
"a4040000.serial: ttyS0 at MMIO 0xa4040000 (irq = 24, base_baud = 3000000)
is a Renesas RZ/V2M 16750".

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/tty/serial/8250/8250_port.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index e61753c295d5..e4b205e3756b 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -111,6 +111,15 @@ static const struct serial8250_config uart_config[] = {
 		.rxtrig_bytes	= {1, 16, 32, 56},
 		.flags		= UART_CAP_FIFO | UART_CAP_SLEEP | UART_CAP_AFE,
 	},
+	[PORT_16750] = {
+		.name		= "Renesas RZ/V2M 16750",
+		.fifo_size	= 64,
+		.tx_loadsz	= 64,
+		.fcr		= UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_10 |
+				  UART_FCR7_64BYTE,
+		.rxtrig_bytes	= {1, 16, 32, 56},
+		.flags		= UART_CAP_FIFO | UART_CAP_AFE,
+	},
 	[PORT_STARTECH] = {
 		.name		= "Startech",
 		.fifo_size	= 1,
@@ -1142,6 +1151,24 @@ static void autoconfig_16550a(struct uart_8250_port *up)
 		return;
 	}
 
+	/*
+	 * No EFR.  Try to detect a Renesas RZ/V2M 16750, which only sets bit 5
+	 * of the IIR when 64 byte FIFO mode is enabled.
+	 * Try setting/clear bit5 of FCR.
+	 */
+	serial_out(up, UART_FCR, UART_FCR_ENABLE_FIFO);
+	status1 = serial_in(up, UART_IIR) & (UART_IIR_64BYTE_FIFO | UART_IIR_FIFO_ENABLED);
+
+	serial_out(up, UART_FCR, UART_FCR_ENABLE_FIFO | UART_FCR7_64BYTE);
+	status2 = serial_in(up, UART_IIR) & (UART_IIR_64BYTE_FIFO | UART_IIR_FIFO_ENABLED);
+
+	if (status1 == UART_IIR_FIFO_ENABLED_16550A &&
+	    status2 == (UART_IIR_64BYTE_FIFO | UART_IIR_FIFO_ENABLED_16550A)) {
+		up->port.type = PORT_16750;
+		up->capabilities |= UART_CAP_AFE;
+		return;
+	}
+
 	/*
 	 * Try writing and reading the UART_IER_UUE bit (b6).
 	 * If it works, this is probably one of the Xscale platform's
-- 
2.25.1

