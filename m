Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F0838108C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 May 2021 21:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234030AbhENTZC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 May 2021 15:25:02 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:53998 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233970AbhENTZA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 May 2021 15:25:00 -0400
X-IronPort-AV: E=Sophos;i="5.82,300,1613401200"; 
   d="scan'208";a="81343881"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 May 2021 04:23:48 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8C0CC4010906;
        Sat, 15 May 2021 04:23:44 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH 10/16] serial: sh-sci: Add support for RZ/G2L SoC
Date:   Fri, 14 May 2021 20:22:12 +0100
Message-Id: <20210514192218.13022-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das.jz@bp.renesas.com>

Add serial support for RZ/G2L SoC with earlycon and
extended mode register support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 11 +++++++++++
 drivers/tty/serial/sh-sci.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index ef37fdf37612..872a2c3b11c4 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -306,6 +306,7 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 			[SCFDR]		= { 0x0E, 16 },
 			[SCSPTR]	= { 0x10, 16 },
 			[SCLSR]		= { 0x12, 16 },
+			[SEMR]		= { 0x14, 8 },
 		},
 		.fifosize = 16,
 		.overrun_reg = SCLSR,
@@ -2527,6 +2528,8 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 			case 27: smr_val |= SCSMR_SRC_27; break;
 			}
 		smr_val |= cks;
+		if (sci_getreg(port, SEMR)->size)
+			serial_port_out(port, SEMR, 0);
 		serial_port_out(port, SCSCR, scr_val | s->hscif_tot);
 		serial_port_out(port, SCSMR, smr_val);
 		serial_port_out(port, SCBRR, brr);
@@ -2561,6 +2564,8 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 		scr_val = s->cfg->scscr & (SCSCR_CKE1 | SCSCR_CKE0);
 		smr_val |= serial_port_in(port, SCSMR) &
 			   (SCSMR_CKEDG | SCSMR_SRC_MASK | SCSMR_CKS);
+		if (sci_getreg(port, SEMR)->size)
+			serial_port_out(port, SEMR, 0);
 		serial_port_out(port, SCSCR, scr_val | s->hscif_tot);
 		serial_port_out(port, SCSMR, smr_val);
 	}
@@ -3170,6 +3175,10 @@ static const struct of_device_id of_sci_match[] = {
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
@@ -3452,6 +3461,7 @@ static int __init rzscifa_early_console_setup(struct earlycon_device *device,
 	port_cfg.regtype = SCIx_RZ_SCIFA_REGTYPE;
 	return early_console_setup(device, PORT_SCIF);
 }
+
 static int __init scifa_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
@@ -3471,6 +3481,7 @@ static int __init hscif_early_console_setup(struct earlycon_device *device,
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

