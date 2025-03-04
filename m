Return-Path: <linux-renesas-soc+bounces-13976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1876CA4ECED
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 20:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B4247A778D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 19:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3511F419A;
	Tue,  4 Mar 2025 19:14:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F35C1EEA36
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Mar 2025 19:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741115642; cv=none; b=IBVpD27W8B1Opml/P1IyWC1lZn6PoG7UScdiO6yhLcs9UMbhPpcHm2YsTy3+0ostnIASDjf1V3kzmR9KoI08YxavAEdNRjv6T1DXhf7XGv1EdaSAscTwpIzFsZpzOR6vDzmgYKYkf+FgtWJtL8+KG/FIpscIrCS2clMLQDBHrJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741115642; c=relaxed/simple;
	bh=4tbOFPia/wKzXKQO2yU4Pnp1OaSxgVoeOL4F0Nofol0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ub/nLt44NccrxfWVqeLl4c69B84E8WC5JY/ZgfawAi67NE9UUSulRoW5EcjlBKGR7qikVTUhD8q2XGNIOorPvN4oMynckmE5u6ibdDIAkFLZvvmKbZDuG9VJZEM8mVAHCL/xO2zp7wEaTKP6UWbnXy/gam9lJFjgWnwx1lcM05o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4Z6lXJ2pf5z4x0rV
	for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Mar 2025 20:06:24 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:4b47:cefc:1a47:3e05])
	by baptiste.telenet-ops.be with cmsmtp
	id Lj6G2E00A2Gsk2z01j6Gq2; Tue, 04 Mar 2025 20:06:17 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tpXaV-0000000CpmF-1dSc;
	Tue, 04 Mar 2025 20:06:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tpXaq-00000008ckx-1yKz;
	Tue, 04 Mar 2025 20:06:16 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] serial: sh-sci: Save and restore more registers
Date: Tue,  4 Mar 2025 20:06:11 +0100
Message-ID: <11c2eab45d48211e75d8b8202cce60400880fe55.1741114989.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On (H)SCIF with a Baud Rate Generator for External Clock (BRG), there
are multiple ways to configure the requested serial speed.  If firmware
uses a different method than Linux, and if any debug info is printed
after the Bit Rate Register (SCBRR) is restored, but before termios is
reconfigured (which configures the alternative method), the system may
lock-up during resume.

Fix this by saving and restoring the contents of the BRG Frequency
Division (SCDL) and Clock Select (SCCKS) registers as well.

Also save and restore the HSCIF's Sampling Rate Register (HSSRR), which
configures the sampling point, and the SCIFA/SCIFB's Serial Port Control
and Data Registers (SCPCR/SCPDR), which configure the optional control
flow signals.

After this, all registers that are not saved/restored are either:
  - read-only,
  - write-only,
  - status registers containing flags with clear-after-set semantics,
  - FIFO Data Count Trigger registers, which do not matter much for
    the serial console.

Fixes: 22a6984c5b5df8ea ("serial: sh-sci: Update the suspend/resume support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
This can be reproduced on e.g. Salvator-X(S) by enabling the debug
prints in sci_brg_calc(), and using s2ram with no_console_suspend.

Tested on systems using SCIF (Salvator-XS), HSCIF (Gray Hawk Single) and
SCIFA (KZM-A9-GT) as the serial console.

v2:
  - Add Tested-by, Reviewed-by.
  - Move restoring the External Baud Rate Generator (BRG) registers up,
    to better match the initialization order in sci_set_termios(),
  - Also save/restore HSSRR, SCPCR, and SCPDR.
---
 drivers/tty/serial/sh-sci.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 2db2d85003f70138..1c8480d0338ef850 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -105,10 +105,15 @@ struct plat_sci_reg {
 };
 
 struct sci_suspend_regs {
+	u16 scdl;
+	u16 sccks;
 	u16 scsmr;
 	u16 scscr;
 	u16 scfcr;
 	u16 scsptr;
+	u16 hssrr;
+	u16 scpcr;
+	u16 scpdr;
 	u8 scbrr;
 	u8 semr;
 };
@@ -3563,6 +3568,10 @@ static void sci_console_save(struct sci_port *s)
 	struct sci_suspend_regs *regs = &s->suspend_regs;
 	struct uart_port *port = &s->port;
 
+	if (sci_getreg(port, SCDL)->size)
+		regs->scdl = sci_serial_in(port, SCDL);
+	if (sci_getreg(port, SCCKS)->size)
+		regs->sccks = sci_serial_in(port, SCCKS);
 	if (sci_getreg(port, SCSMR)->size)
 		regs->scsmr = sci_serial_in(port, SCSMR);
 	if (sci_getreg(port, SCSCR)->size)
@@ -3573,6 +3582,12 @@ static void sci_console_save(struct sci_port *s)
 		regs->scsptr = sci_serial_in(port, SCSPTR);
 	if (sci_getreg(port, SCBRR)->size)
 		regs->scbrr = sci_serial_in(port, SCBRR);
+	if (sci_getreg(port, HSSRR)->size)
+		regs->hssrr = sci_serial_in(port, HSSRR);
+	if (sci_getreg(port, SCPCR)->size)
+		regs->scpcr = sci_serial_in(port, SCPCR);
+	if (sci_getreg(port, SCPDR)->size)
+		regs->scpdr = sci_serial_in(port, SCPDR);
 	if (sci_getreg(port, SEMR)->size)
 		regs->semr = sci_serial_in(port, SEMR);
 }
@@ -3582,6 +3597,10 @@ static void sci_console_restore(struct sci_port *s)
 	struct sci_suspend_regs *regs = &s->suspend_regs;
 	struct uart_port *port = &s->port;
 
+	if (sci_getreg(port, SCDL)->size)
+		sci_serial_out(port, SCDL, regs->scdl);
+	if (sci_getreg(port, SCCKS)->size)
+		sci_serial_out(port, SCCKS, regs->sccks);
 	if (sci_getreg(port, SCSMR)->size)
 		sci_serial_out(port, SCSMR, regs->scsmr);
 	if (sci_getreg(port, SCSCR)->size)
@@ -3592,6 +3611,12 @@ static void sci_console_restore(struct sci_port *s)
 		sci_serial_out(port, SCSPTR, regs->scsptr);
 	if (sci_getreg(port, SCBRR)->size)
 		sci_serial_out(port, SCBRR, regs->scbrr);
+	if (sci_getreg(port, HSSRR)->size)
+		sci_serial_out(port, HSSRR, regs->hssrr);
+	if (sci_getreg(port, SCPCR)->size)
+		sci_serial_out(port, SCPCR, regs->scpcr);
+	if (sci_getreg(port, SCPDR)->size)
+		sci_serial_out(port, SCPDR, regs->scpdr);
 	if (sci_getreg(port, SEMR)->size)
 		sci_serial_out(port, SEMR, regs->semr);
 }
-- 
2.43.0


