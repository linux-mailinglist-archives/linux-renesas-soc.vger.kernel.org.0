Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A88DA39ADC0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 00:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbhFCWUg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 18:20:36 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:9907 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230265AbhFCWUg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 18:20:36 -0400
X-IronPort-AV: E=Sophos;i="5.83,246,1616425200"; 
   d="scan'208";a="83182177"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Jun 2021 07:18:50 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0DDA3410B534;
        Fri,  4 Jun 2021 07:18:46 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 10/12] serial: sh-sci: Add support for RZ/G2L SoC
Date:   Thu,  3 Jun 2021 23:17:56 +0100
Message-Id: <20210603221758.10305-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das.jz@bp.renesas.com>

Add serial support for RZ/G2L SoC with earlycon and
extended mode register support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 12 +++++++++++-
 drivers/tty/serial/sh-sci.h |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index ef37fdf37612..798ccd88251f 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -289,7 +289,7 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 	},
 
 	/*
-	 * The "SCIFA" that is in RZ/T and RZ/A2.
+	 * The "SCIFA" that is in RZ/A2, RZ/G2L and RZ/T.
 	 * It looks like a normal SCIF with FIFO data, but with a
 	 * compressed address space. Also, the break out of interrupts
 	 * are different: ERI/BRI, RXI, TXI, TEI, DRI.
@@ -306,6 +306,7 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 			[SCFDR]		= { 0x0E, 16 },
 			[SCSPTR]	= { 0x10, 16 },
 			[SCLSR]		= { 0x12, 16 },
+			[SEMR]		= { 0x14, 8 },
 		},
 		.fifosize = 16,
 		.overrun_reg = SCLSR,
@@ -2514,6 +2515,9 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 	if (termios->c_cflag & PARENB)
 		bits++;
 
+	if (sci_getreg(port, SEMR)->size)
+		serial_port_out(port, SEMR, 0);
+
 	if (best_clk >= 0) {
 		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
 			switch (srr + 1) {
@@ -3170,6 +3174,10 @@ static const struct of_device_id of_sci_match[] = {
 		.compatible = "renesas,scif-r7s9210",
 		.data = SCI_OF_DATA(PORT_SCIF, SCIx_RZ_SCIFA_REGTYPE),
 	},
+	{
+		.compatible = "renesas,scif-r9a07g044",
+		.data = SCI_OF_DATA(PORT_SCIF, SCIx_RZ_SCIFA_REGTYPE),
+	},
 	/* Family-specific types */
 	{
 		.compatible = "renesas,rcar-gen1-scif",
@@ -3452,6 +3460,7 @@ static int __init rzscifa_early_console_setup(struct earlycon_device *device,
 	port_cfg.regtype = SCIx_RZ_SCIFA_REGTYPE;
 	return early_console_setup(device, PORT_SCIF);
 }
+
 static int __init scifa_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
@@ -3471,6 +3480,7 @@ static int __init hscif_early_console_setup(struct earlycon_device *device,
 OF_EARLYCON_DECLARE(sci, "renesas,sci", sci_early_console_setup);
 OF_EARLYCON_DECLARE(scif, "renesas,scif", scif_early_console_setup);
 OF_EARLYCON_DECLARE(scif, "renesas,scif-r7s9210", rzscifa_early_console_setup);
+OF_EARLYCON_DECLARE(scif, "renesas,scif-r9a07g044", rzscifa_early_console_setup);
 OF_EARLYCON_DECLARE(scifa, "renesas,scifa", scifa_early_console_setup);
 OF_EARLYCON_DECLARE(scifb, "renesas,scifb", scifb_early_console_setup);
 OF_EARLYCON_DECLARE(hscif, "renesas,hscif", hscif_early_console_setup);
diff --git a/drivers/tty/serial/sh-sci.h b/drivers/tty/serial/sh-sci.h
index c0dfe4382898..c0ae78632dda 100644
--- a/drivers/tty/serial/sh-sci.h
+++ b/drivers/tty/serial/sh-sci.h
@@ -31,6 +31,7 @@ enum {
 	SCCKS,				/* BRG Clock Select Register */
 	HSRTRGR,			/* Rx FIFO Data Count Trigger Register */
 	HSTTRGR,			/* Tx FIFO Data Count Trigger Register */
+	SEMR,				/* Serial extended mode register */
 
 	SCIx_NR_REGS,
 };
-- 
2.17.1

