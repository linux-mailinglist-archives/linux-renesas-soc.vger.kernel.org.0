Return-Path: <linux-renesas-soc+bounces-13704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 186ABA46060
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 14:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CC621792B7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 13:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662D622171E;
	Wed, 26 Feb 2025 13:10:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4642D221558;
	Wed, 26 Feb 2025 13:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740575436; cv=none; b=LKDh8C90DsxCf5NUQ7NpR6e8cam9GSx3ThiFQ9+jAoiWvyA+B5bWhB8LRTy26a5djOR5auyKeVLSOJpjb3r3QTTuk7bNv3dv2CmnnxcmSVZZko+OkMgrDxVtFYfuwFPUsRmWVTYRw3vHPXZV4BBc/kwQNuM9+wvEvYVhxK3yCu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740575436; c=relaxed/simple;
	bh=XsYogQLYPbViH8E7nDBn/FmbGl16mYwtOmwt4+N9dR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blHHWyLJTl6F7X6H7Y7w179pQUao3do18h54xx5rNBREtYsEouxahd17ZOK/tyTN6uC4gllodetUfzpOUPrS0ol6EvwV7aalywWNzq7jesPN8oiIbFiYxpSyLFeZCK36FE+FTnylu8JL9+HrkaVh5krmrn0SPZW0P2Hd1xuNFxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: /fFT3P5vSRmGuChltzFKIg==
X-CSE-MsgGUID: 6CfWaXGSRgSmKaNo92eMVg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Feb 2025 22:10:32 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.221])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 755444069606;
	Wed, 26 Feb 2025 22:10:30 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v3 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Date: Wed, 26 Feb 2025 14:09:29 +0100
Message-ID: <20250226130935.3029927-11-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a new RZSCI port type, and the RSCI 32 bits registers set.
The RZ/T2H SCI has a a fifo, and a quite different set of registers
from the orginal SH SCI ones.
DMA is not supported yet.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/tty/serial/Kconfig       |   7 +
 drivers/tty/serial/Makefile      |   1 +
 drivers/tty/serial/rzsci.c       | 465 +++++++++++++++++++++++++++++++
 drivers/tty/serial/rzsci.h       |  12 +
 drivers/tty/serial/sh-sci.c      |  20 +-
 include/linux/serial_sci.h       |   3 +-
 include/uapi/linux/serial_core.h |   3 +
 7 files changed, 505 insertions(+), 6 deletions(-)
 create mode 100644 drivers/tty/serial/rzsci.c
 create mode 100644 drivers/tty/serial/rzsci.h

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 79a8186d3361..40114ae48677 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -675,6 +675,13 @@ config SERIAL_SH_SCI_DMA
 	depends on SERIAL_SH_SCI && DMA_ENGINE
 	default ARCH_RENESAS
 
+config SERIAL_RZ_SCI
+	tristate "Support for Renesas RZ/T2H SCI variant"
+	depends on SERIAL_SH_SCI
+	help
+	  Support for the RZ/T2H SCI variant with fifo.
+	  Say Y if you want to be able to use the RZ/T2H SCI serial port.
+
 config SERIAL_HS_LPC32XX
 	tristate "LPC32XX high speed serial port support"
 	depends on ARCH_LPC32XX || COMPILE_TEST
diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
index d58d9f719889..28f00ac64bcb 100644
--- a/drivers/tty/serial/Makefile
+++ b/drivers/tty/serial/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_SERIAL_QCOM_GENI)		+= qcom_geni_serial.o
 obj-$(CONFIG_SERIAL_QE)			+= ucc_uart.o
 obj-$(CONFIG_SERIAL_RDA)		+= rda-uart.o
 obj-$(CONFIG_SERIAL_RP2)		+= rp2.o
+obj-$(CONFIG_SERIAL_RZ_SCI)		+= rzsci.o
 obj-$(CONFIG_SERIAL_SA1100)		+= sa1100.o
 obj-$(CONFIG_SERIAL_SAMSUNG)		+= samsung_tty.o
 obj-$(CONFIG_SERIAL_SB1250_DUART)	+= sb1250-duart.o
diff --git a/drivers/tty/serial/rzsci.c b/drivers/tty/serial/rzsci.c
new file mode 100644
index 000000000000..baf61e8a4a2a
--- /dev/null
+++ b/drivers/tty/serial/rzsci.c
@@ -0,0 +1,465 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <linux/bitops.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/serial_core.h>
+#include <linux/serial_sci.h>
+#include <linux/tty_flip.h>
+#include "rzsci.h"
+
+/* RSCI registers */
+#define RDR	0x00
+#define TDR	0x04
+#define CCR0	0x08
+#define CCR1	0x0C
+#define CCR2	0x10
+#define CCR3	0x14
+#define CCR4	0x18
+#define FCR	0x24
+#define DCR	0x30
+#define CSR	0x48
+#define FRSR	0x50
+#define FTSR	0x54
+#define CFCLR	0x68
+#define FFCLR	0x70
+
+/* RDR (Receive Data Register) */
+#define RDR_FFER		BIT(12) /* FIFO Framing Error */
+#define RDR_FPER		BIT(11) /* FIFO Parity Error */
+#define RDR_RDAT_MSK		GENMASK(8, 0)
+
+/* TDR (Transmit Data Register) */
+#define TDR_MPBT		BIT(9)	/* Multiprocessor Transfer */
+#define TDR_TDAT_9BIT_LSHIFT	0
+#define TDR_TDAT_9BIT_VAL	0x1FF
+#define TDR_TDAT_9BIT_MSK	(TDR_TDAT_9BIT_VAL << TDR_TDAT_9BIT_LSHIFT)
+
+/* CCR0 (Common Control Register 0) */
+#define CCR0_SSE		BIT(24)	/* SSn# Pin Function Enable */
+#define CCR0_TEIE		BIT(21)	/* Transmit End Interrupt Enable */
+#define CCR0_TIE		BIT(20)	/* Transmit Interrupt Enable */
+#define CCR0_RIE		BIT(16)	/* Receive Interrupt Enable */
+#define CCR0_IDSEL		BIT(10)	/* ID Frame Select */
+#define CCR0_DCME		BIT(9)	/* Data Compare Match Enable */
+#define CCR0_MPIE		BIT(8)	/* Multiprocessor Interrupt Enable */
+#define CCR0_TE			BIT(4)	/* Transmit Enable */
+#define CCR0_RE			BIT(0)	/* Receive Enable */
+
+/* CCR1 (Common Control Register 1) */
+#define CCR1_NFEN		BIT(28)	/* Digital Noise Filter Function */
+#define CCR1_SHARPS		BIT(20)	/* Half -duplex Communication Select */
+#define CCR1_SPLP		BIT(16)	/* Loopback Control */
+#define CCR1_RINV		BIT(13)	/* RxD invert */
+#define CCR1_TINV		BIT(12)	/* TxD invert */
+#define CCR1_PM			BIT(9)	/* Parity Mode */
+#define CCR1_PE			BIT(8)	/* Parity Enable */
+#define CCR1_SPB2IO		BIT(5)	/* Serial Port Break I/O */
+#define CCR1_SPB2DT		BIT(4)	/* Serial Port Break Data Select */
+#define CCR1_CTSPEN		BIT(1)	/* CTS External Pin Enable */
+#define CCR1_CTSE		BIT(0)	/* CTS Enable */
+
+/* FCR (FIFO Control Register) */
+#define FCR_RFRST		BIT(23)	/* Receive FIFO Data Register Reset */
+#define FCR_TFRST		BIT(15)	/* Transmit FIFO Data Register Reset */
+#define FCR_DRES		BIT(0)	/* Incoming Data Ready Error Select */
+#define FCR_RTRG4_0		GENMASK(20, 16)
+#define FCR_TTRG		GENMASK(12, 8)
+
+/* CSR (Common Status Register) */
+#define CSR_RDRF		BIT(31)	/* Receive Data Full */
+#define CSR_TEND		BIT(30)	/* Transmit End Flag */
+#define CSR_TDRE		BIT(29)	/* Transmit Data Empty */
+#define CSR_FER			BIT(28)	/* Framing Error */
+#define CSR_PER			BIT(27)	/* Parity Error */
+#define CSR_MFF			BIT(26)	/* Mode Fault Error */
+#define CSR_ORER		BIT(24)	/* Overrun Error */
+#define CSR_DFER		BIT(18)	/* Data Compare Match Framing Error */
+#define CSR_DPER		BIT(17)	/* Data Compare Match Parity Error */
+#define CSR_DCMF		BIT(16)	/* Data Compare Match */
+#define CSR_RXDMON		BIT(15)	/* Serial Input Data Monitor */
+#define CSR_ERS			BIT(4)	/* Error Signal Status */
+
+#define SCxSR_ERRORS(port)	(to_sci_port(port)->params->error_mask)
+#define SCxSR_ERROR_CLEAR(port)	(to_sci_port(port)->params->error_clear)
+
+#define RSCI_DEFAULT_ERROR_MASK	(CSR_PER | CSR_FER)
+
+#define RSCI_RDxF_CLEAR		(CFCLR_RDRFC)
+#define RSCI_ERROR_CLEAR	(CFCLR_PERC | CFCLR_FERC)
+#define RSCI_TDxE_CLEAR		(CFCLR_TDREC)
+#define RSCI_BREAK_CLEAR	(CFCLR_PERC | CFCLR_FERC | CFCLR_ORERC)
+
+/* FRSR (FIFO Receive Status Register) */
+#define FRSR_R5_0		GENMASK(13, 8)	/* Receive FIFO Data Count */
+#define FRSR_DR			BIT(0)	/* Receive Data Ready */
+
+/* CFCLR (Common Flag CLear Register) */
+#define CFCLR_RDRFC		BIT(31)	/* RDRF Clear */
+#define CFCLR_TDREC		BIT(29)	/* TDRE Clear */
+#define CFCLR_FERC		BIT(28)	/* FER Clear */
+#define CFCLR_PERC		BIT(27)	/* PER Clear */
+#define CFCLR_MFFC		BIT(26)	/* MFF Clear */
+#define CFCLR_ORERC		BIT(24)	/* ORER Clear */
+#define CFCLR_DFERC		BIT(18)	/* DFER Clear */
+#define CFCLR_DPERC		BIT(17)	/* DPER Clear */
+#define CFCLR_DCMFC		BIT(16)	/* DCMF Clear */
+#define CFCLR_ERSC		BIT(4)	/* ERS Clear */
+#define CFCLR_CLRFLAG		(CFCLR_RDRFC | CFCLR_FERC | CFCLR_PERC | \
+				 CFCLR_MFFC | CFCLR_ORERC | CFCLR_DFERC | \
+				 CFCLR_DPERC | CFCLR_DCMFC | CFCLR_ERSC)
+
+/* FFCLR (FIFO Flag CLear Register) */
+#define FFCLR_DRC		BIT(0)	/* DR Clear */
+
+#define DCR_DEPOL		BIT(0)
+
+static u32 rzsci_serial_in(struct uart_port *p, int offset)
+{
+	return readl(p->membase + offset);
+}
+
+static void rzsci_serial_out(struct uart_port *p, int offset, int value)
+{
+	writel(value, p->membase + offset);
+}
+
+static void rzsci_clear_DRxC(struct uart_port *port)
+{
+	rzsci_serial_out(port, CFCLR, CFCLR_RDRFC);
+	rzsci_serial_out(port, FFCLR, FFCLR_DRC);
+}
+
+static void rzsci_clear_SCxSR(struct uart_port *port, unsigned int mask)
+{
+	rzsci_serial_out(port, CFCLR, mask);
+}
+
+static void rzsci_start_rx(struct uart_port *port)
+{
+	unsigned int ctrl;
+
+	ctrl = rzsci_serial_in(port, CCR0);
+	ctrl |= CCR0_RIE;
+	rzsci_serial_out(port, CCR0, ctrl);
+}
+
+static void rzsci_set_termios(struct uart_port *port, struct ktermios *termios,
+			      const struct ktermios *old)
+{
+	struct sci_port *s = to_sci_port(port);
+	unsigned long flags;
+
+	sci_port_enable(s);
+	uart_port_lock_irqsave(port, &flags);
+
+	/* For now, only RX enabling is supported */
+	if (termios->c_cflag & CREAD)
+		rzsci_start_rx(port);
+
+	uart_port_unlock_irqrestore(port, flags);
+	sci_port_disable(s);
+}
+
+static int rzsci_txfill(struct uart_port *port)
+{
+	return rzsci_serial_in(port, FTSR);
+}
+
+static int rzsci_rxfill(struct uart_port *port)
+{
+	u32 val = rzsci_serial_in(port, FRSR);
+
+	return FIELD_GET(FRSR_R5_0, val);
+}
+
+static unsigned int rzsci_tx_empty(struct uart_port *port)
+{
+	unsigned int status = rzsci_serial_in(port, CSR);
+	unsigned int in_tx_fifo = rzsci_txfill(port);
+
+	return (status & CSR_TEND) && !in_tx_fifo ? TIOCSER_TEMT : 0;
+}
+
+static void rzsci_set_mctrl(struct uart_port *port, unsigned int mctrl)
+{
+	/* Not supported yet */
+}
+
+static unsigned int rzsci_get_mctrl(struct uart_port *port)
+{
+	/* Not supported yet */
+	return 0;
+}
+
+static void rzsci_clear_CFC(struct uart_port *port, unsigned int mask)
+{
+	rzsci_serial_out(port, CFCLR, mask);
+}
+
+static void rzsci_start_tx(struct uart_port *port)
+{
+	struct sci_port *sp = to_sci_port(port);
+	u32 ctrl;
+
+	if (sp->chan_tx)
+		return;
+
+	/*
+	 * TE (Transmit Enable) must be set after setting TIE
+	 * (Transmit Interrupt Enable) or in the same instruction
+	 * to start the transmit process.
+	 */
+	ctrl = rzsci_serial_in(port, CCR0);
+	ctrl |= CCR0_TIE | CCR0_TE;
+	rzsci_serial_out(port, CCR0, ctrl);
+}
+
+static void rzsci_stop_tx(struct uart_port *port)
+{
+	u32 ctrl;
+
+	ctrl = rzsci_serial_in(port, CCR0);
+	ctrl &= ~CCR0_TIE;
+	rzsci_serial_out(port, CCR0, ctrl);
+}
+
+static void rzsci_stop_rx(struct uart_port *port)
+{
+	u32 ctrl;
+
+	ctrl = rzsci_serial_in(port, CCR0);
+	ctrl &= ~CCR0_RIE;
+	rzsci_serial_out(port, CCR0, ctrl);
+}
+
+static int rzsci_txroom(struct uart_port *port)
+{
+	return port->fifosize - rzsci_txfill(port);
+}
+
+static void rzsci_transmit_chars(struct uart_port *port)
+{
+	struct tty_port *tport = &port->state->port;
+	unsigned int stopped = uart_tx_stopped(port);
+	u32 status, ctrl;
+	int count;
+
+	status = rzsci_serial_in(port, CSR);
+	if (!(status & CSR_TDRE)) {
+		ctrl = rzsci_serial_in(port, CCR0);
+		if (kfifo_is_empty(&tport->xmit_fifo))
+			ctrl &= ~CCR0_TIE;
+		else
+			ctrl |= CCR0_TIE;
+		rzsci_serial_out(port, CCR0, ctrl);
+		return;
+	}
+
+	count = rzsci_txroom(port);
+
+	do {
+		unsigned char c;
+
+		if (port->x_char) {
+			c = port->x_char;
+			port->x_char = 0;
+		} else if (stopped || !kfifo_get(&tport->xmit_fifo, &c)) {
+			break;
+		}
+
+		rzsci_clear_CFC(port, CFCLR_TDREC);
+		rzsci_serial_out(port, TDR, c);
+
+		port->icount.tx++;
+	} while (--count > 0);
+
+	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
+		uart_write_wakeup(port);
+
+	if (kfifo_is_empty(&tport->xmit_fifo)) {
+		ctrl = rzsci_serial_in(port, CCR0);
+		ctrl &= ~CCR0_TIE;
+		ctrl |= CCR0_TEIE;
+		rzsci_serial_out(port, CCR0, ctrl);
+	}
+}
+
+static void rzsci_receive_chars(struct uart_port *port)
+{
+	struct tty_port *tport = &port->state->port;
+	u32 rdat, status, frsr_status = 0;
+	int i, count, copied = 0;
+	unsigned char flag;
+
+	status = rzsci_serial_in(port, CSR);
+	frsr_status = rzsci_serial_in(port, FRSR);
+
+	if (!(status & CSR_RDRF) && !(frsr_status & FRSR_DR))
+		return;
+
+	while (1) {
+		/* Don't copy more bytes than there is room for in the buffer */
+		count = tty_buffer_request_room(tport, rzsci_rxfill(port));
+
+		/* If for any reason we can't copy more data, we're done! */
+		if (count == 0)
+			break;
+
+		for (i = 0; i < count; i++) {
+			char c;
+
+			rdat = rzsci_serial_in(port, RDR);
+			/* 9-bits data is not supported yet */
+			c = rdat & RDR_RDAT_MSK;
+
+			if (uart_handle_sysrq_char(port, c)) {
+				count--;
+				i--;
+				continue;
+			}
+
+			/* Store data and status.
+			 * Non FIFO mode is not supported
+			 */
+			if (rdat & RDR_FFER) {
+				flag = TTY_FRAME;
+				port->icount.frame++;
+			} else if (rdat & RDR_FPER) {
+				flag = TTY_PARITY;
+				port->icount.parity++;
+			} else {
+				flag = TTY_NORMAL;
+			}
+
+			tty_insert_flip_char(tport, c, flag);
+		}
+
+		rzsci_serial_in(port, CSR); /* dummy read */
+		rzsci_clear_DRxC(port);
+
+		copied += count;
+		port->icount.rx += count;
+	}
+
+	if (copied) {
+		/* Tell the rest of the system the news. New characters! */
+		tty_flip_buffer_push(tport);
+	} else {
+		/* TTY buffers full; read from RX reg to prevent lockup */
+		rzsci_serial_in(port, RDR);
+		rzsci_serial_in(port, CSR); /* dummy read */
+		rzsci_clear_DRxC(port);
+	}
+}
+
+static void rzsci_poll_put_char(struct uart_port *port, unsigned char c)
+{
+	u32 status;
+	int ret;
+
+	ret = readl_relaxed_poll_timeout_atomic(port->membase + CSR, status,
+						(status & CSR_TDRE), 100,
+						USEC_PER_SEC);
+	if (ret != 0) {
+		dev_err(port->dev,
+			"Error while sending data in UART TX : %d\n", ret);
+		goto done;
+	}
+	rzsci_serial_out(port, TDR, c);
+done:
+	rzsci_clear_SCxSR(port, CFCLR_TDREC);
+}
+
+static void rzsci_prepare_console_write(struct uart_port *port, u32 ctrl)
+{
+	struct sci_port *s = to_sci_port(port);
+	u32 ctrl_temp =
+		s->params->param_bits->rxtx_enable |
+		CCR0_TIE |
+		s->hscif_tot;
+	rzsci_serial_out(port, CCR0, ctrl_temp);
+}
+
+static const char *rzsci_type(struct uart_port *port)
+{
+	return "rzsci";
+}
+
+static size_t rzsci_suspend_regs_size(void)
+{
+	return 0;
+}
+
+static const struct sci_common_regs rzsci_common_regs = {
+	.status = CSR,
+	.control = CCR0,
+};
+
+static const struct sci_port_params_bits rzsci_port_param_bits = {
+	.rxtx_enable = CCR0_RE | CCR0_TE,
+	.te_clear = CCR0_TE | CCR0_TEIE,
+	.poll_sent_bits = CSR_TDRE | CSR_TEND,
+};
+
+static const struct sci_port_params rzsci_port_params = {
+	.fifosize = 16,
+	.overrun_reg = CSR,
+	.overrun_mask = CSR_ORER,
+	.sampling_rate_mask = SCI_SR(32),
+	.error_mask = RSCI_DEFAULT_ERROR_MASK,
+	.error_clear = RSCI_ERROR_CLEAR,
+	.param_bits = &rzsci_port_param_bits,
+	.common_regs = &rzsci_common_regs,
+};
+
+static const struct uart_ops rzt2_sci_uart_ops = {
+	.tx_empty	= rzsci_tx_empty,
+	.set_mctrl	= rzsci_set_mctrl,
+	.get_mctrl	= rzsci_get_mctrl,
+	.start_tx	= rzsci_start_tx,
+	.stop_tx	= rzsci_stop_tx,
+	.stop_rx	= rzsci_stop_rx,
+	.startup	= sci_startup,
+	.set_termios	= rzsci_set_termios,
+	.pm		= sci_pm,
+	.type		= rzsci_type,
+	.release_port	= sci_release_port,
+	.request_port	= sci_request_port,
+	.config_port	= sci_config_port,
+	.verify_port	= sci_verify_port,
+};
+
+static const struct sci_port_ops rzsci_port_ops = {
+	.read_reg		= rzsci_serial_in,
+	.write_reg		= rzsci_serial_out,
+	.clear_SCxSR		= rzsci_clear_SCxSR,
+	.transmit_chars		= rzsci_transmit_chars,
+	.receive_chars		= rzsci_receive_chars,
+	.poll_put_char		= rzsci_poll_put_char,
+	.prepare_console_write	= rzsci_prepare_console_write,
+	.suspend_regs_size	= rzsci_suspend_regs_size,
+};
+
+struct sci_of_data sci_r9a09g077_data = {
+	.type = PORT_RZSCI,
+	.regtype = SCIx_RZT2H_SCI_REGTYPE,
+	.ops = &rzsci_port_ops,
+	.uart_ops = &rzt2_sci_uart_ops,
+	.params = &rzsci_port_params,
+};
+
+#ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
+
+static int __init rzt2hsci_early_console_setup(struct earlycon_device *device,
+					       const char *opt)
+{
+	return scix_early_console_setup(device, &sci_r9a09g077_data);
+}
+
+OF_EARLYCON_DECLARE(rzsci, "renesas,r9a09g077-sci", rzt2hsci_early_console_setup);
+
+#endif /* CONFIG_SERIAL_SH_SCI_EARLYCON */
diff --git a/drivers/tty/serial/rzsci.h b/drivers/tty/serial/rzsci.h
new file mode 100644
index 000000000000..e0edc8fb6fd2
--- /dev/null
+++ b/drivers/tty/serial/rzsci.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __RZT2_SCI_H__
+#define __RZT2_SCI_H__
+
+#include "sh-sci-common.h"
+
+#ifdef CONFIG_SERIAL_RZ_SCI
+extern struct sci_of_data sci_r9a09g077_data;
+#endif
+
+#endif /* __RZT2_SCI_H__ */
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 827b10793b97..fe9deeed799f 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -54,6 +54,7 @@
 #include <asm/platform_early.h>
 #endif
 
+#include "rzsci.h"
 #include "serial_mctrl_gpio.h"
 #include "sh-sci.h"
 #include "sh-sci-common.h"
@@ -1816,7 +1817,7 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 	unsigned long flags;
 	u32 ctrl;
 
-	if (port->type != PORT_SCI)
+	if (port->type != PORT_SCI && port->type != PORT_RZSCI)
 		return sci_tx_interrupt(irq, ptr);
 
 	uart_port_lock_irqsave(port, &flags);
@@ -3042,10 +3043,10 @@ static int sci_init_single(struct platform_device *dev,
 	}
 
 	/*
-	 * The fourth interrupt on SCI port is transmit end interrupt, so
+	 * The fourth interrupt on SCI and RZSCI port is transmit end interrupt, so
 	 * shuffle the interrupts.
 	 */
-	if (p->type == PORT_SCI)
+	if (p->type == PORT_SCI || p->type == PORT_RZSCI)
 		swap(sci_port->irqs[SCIx_BRI_IRQ], sci_port->irqs[SCIx_TEI_IRQ]);
 
 	/* The SCI generates several interrupts. They can be muxed together or
@@ -3079,6 +3080,9 @@ static int sci_init_single(struct platform_device *dev,
 		else
 			sci_port->rx_trigger = 8;
 		break;
+	case PORT_RZSCI:
+		sci_port->rx_trigger = 15;
+		break;
 	default:
 		sci_port->rx_trigger = 1;
 		break;
@@ -3303,7 +3307,7 @@ static void sci_remove(struct platform_device *dev)
 
 	if (port->port.fifosize > 1)
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_trigger);
-	if (type == PORT_SCIFA || type == PORT_SCIFB || type == PORT_HSCIF)
+	if (type == PORT_SCIFA || type == PORT_SCIFB || type == PORT_HSCIF || type == PORT_RZSCI)
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_timeout);
 }
 
@@ -3397,6 +3401,12 @@ static const struct of_device_id of_sci_match[] __maybe_unused = {
 		.compatible = "renesas,scif-r9a09g057",
 		.data = &of_sci_scif_rzv2h,
 	},
+#ifdef CONFIG_SERIAL_RZ_SCI
+	{
+		.compatible = "renesas,r9a09g077-sci",
+		.data = &sci_r9a09g077_data,
+	},
+#endif	/* CONFIG_SERIAL_RZ_SCI */
 	/* Family-specific types */
 	{
 		.compatible = "renesas,rcar-gen1-scif",
@@ -3656,7 +3666,7 @@ static int sci_probe(struct platform_device *dev)
 			return ret;
 	}
 	if (sp->port.type == PORT_SCIFA || sp->port.type == PORT_SCIFB ||
-	    sp->port.type == PORT_HSCIF) {
+	    sp->port.type == PORT_HSCIF || sp->port.type == PORT_RZSCI) {
 		ret = device_create_file(&dev->dev, &dev_attr_rx_fifo_timeout);
 		if (ret) {
 			if (sp->port.fifosize > 1) {
diff --git a/include/linux/serial_sci.h b/include/linux/serial_sci.h
index 0f2f50b8d28e..787fd9a96711 100644
--- a/include/linux/serial_sci.h
+++ b/include/linux/serial_sci.h
@@ -38,6 +38,7 @@ enum {
 	SCIx_HSCIF_REGTYPE,
 	SCIx_RZ_SCIFA_REGTYPE,
 	SCIx_RZV2H_SCIF_REGTYPE,
+	SCIx_RZT2H_SCI_REGTYPE,
 
 	SCIx_NR_REGTYPES,
 };
@@ -50,7 +51,7 @@ struct plat_sci_port_ops {
  * Platform device specific platform_data struct
  */
 struct plat_sci_port {
-	unsigned int	type;			/* SCI / SCIF / IRDA / HSCIF */
+	unsigned int	type;			/* SCI / SCIF / IRDA / HSCIF / RZSCI */
 	upf_t		flags;			/* UPF_* flags */
 
 	unsigned int	sampling_rate;
diff --git a/include/uapi/linux/serial_core.h b/include/uapi/linux/serial_core.h
index 9c007a106330..30fbbef599f4 100644
--- a/include/uapi/linux/serial_core.h
+++ b/include/uapi/linux/serial_core.h
@@ -231,6 +231,9 @@
 /* Sunplus UART */
 #define PORT_SUNPLUS	123
 
+/* SH-SCI */
+#define PORT_RZSCI	124
+
 /* Generic type identifier for ports which type is not important to userspace. */
 #define PORT_GENERIC	(-1)
 
-- 
2.43.0


