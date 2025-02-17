Return-Path: <linux-renesas-soc+bounces-13201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EF7A380DD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 11:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BBA0188E457
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 10:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB63C21773D;
	Mon, 17 Feb 2025 10:55:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1C2217F48;
	Mon, 17 Feb 2025 10:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739789707; cv=none; b=Va08sj3lXtcQjyAEpEnSoelYokXrgnASPO5SCIEq3bOEBX6pKySHAbttIPHkAOMAIinbv7/TzS5RP/60husTjJAfbyWPnrX6ttaHe8kV8rQW5y+cIHSNE2BFHTx7G6zffRaOAySJp1xt1unzAC+mg2zUjlObtqojxjFcEOZXP00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739789707; c=relaxed/simple;
	bh=Auig/2XbCbLDkqePxuKuj/2MF+b7aca6vVBTZoyIn/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EmKiJ9skq7lSMM1iDFB5t3g7G//8b82Ycr6HrQljRlzWil8/tjBn0A4NTwUTmOM8IcEot0ctts+b7Vc8m9mSpBXKmxbtMmCLAR1uEBETN7IDooNM0PeUMlHm+AaIlc/fBcX5857Q+eaCPt2XGDrHq+cDNnOTOyG0QIVSTOGHJRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: PwpMz9TXQVyy5OhZseNKhQ==
X-CSE-MsgGUID: S0nlK0+ZRPqKj3LY9P+taw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Feb 2025 19:55:03 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.254])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E5857404B0EC;
	Mon, 17 Feb 2025 19:55:00 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 08/13] serial: sh-sci: Introduced function pointers
Date: Mon, 17 Feb 2025 11:52:09 +0100
Message-ID: <20250217105354.551788-9-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The aim here is to prepare support for new sci controllers like
the T2H/RSCI whose registers are too much different for being
handled in common code.

This named serial controller also has 32 bits register,
so some return types had to be changed.

The needed generic functions are no longer static, with prototypes
defined in sh-sci-common.h so that they can be used from specific
implementation in a separate file, to keep this driver as little
changed as possible.

For doing so, a set of 'ops' is added to struct sci_port.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c        | 337 +++++++++++++++--------------
 drivers/tty/serial/sh-sci_common.h | 171 +++++++++++++++
 2 files changed, 340 insertions(+), 168 deletions(-)
 create mode 100644 drivers/tty/serial/sh-sci_common.h

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index b8f9034f891a..ace56375c044 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -56,19 +56,7 @@
 
 #include "serial_mctrl_gpio.h"
 #include "sh-sci.h"
-
-/* Offsets into the sci_port->irqs array */
-enum {
-	SCIx_ERI_IRQ,
-	SCIx_RXI_IRQ,
-	SCIx_TXI_IRQ,
-	SCIx_BRI_IRQ,
-	SCIx_DRI_IRQ,
-	SCIx_TEI_IRQ,
-	SCIx_NR_IRQS,
-
-	SCIx_MUX_IRQ = SCIx_NR_IRQS,	/* special case */
-};
+#include "sh-sci_common.h"
 
 #define SCIx_IRQ_IS_MUXED(port)			\
 	((port)->irqs[SCIx_ERI_IRQ] ==	\
@@ -76,101 +64,39 @@ enum {
 	((port)->irqs[SCIx_ERI_IRQ] &&	\
 	 ((port)->irqs[SCIx_RXI_IRQ] < 0))
 
-enum SCI_CLKS {
-	SCI_FCK,		/* Functional Clock */
-	SCI_SCK,		/* Optional External Clock */
-	SCI_BRG_INT,		/* Optional BRG Internal Clock Source */
-	SCI_SCIF_CLK,		/* Optional BRG External Clock Source */
-	SCI_NUM_CLKS
-};
-
-/* Bit x set means sampling rate x + 1 is supported */
-#define SCI_SR(x)		BIT((x) - 1)
 #define SCI_SR_RANGE(x, y)	GENMASK((y) - 1, (x) - 1)
 
 #define SCI_SR_SCIFAB		SCI_SR(5) | SCI_SR(7) | SCI_SR(11) | \
 				SCI_SR(13) | SCI_SR(16) | SCI_SR(17) | \
 				SCI_SR(19) | SCI_SR(27)
 
-#define min_sr(_port)		ffs((_port)->sampling_rate_mask)
-#define max_sr(_port)		fls((_port)->sampling_rate_mask)
-
 /* Iterate over all supported sampling rates, from high to low */
 #define for_each_sr(_sr, _port)						\
 	for ((_sr) = max_sr(_port); (_sr) >= min_sr(_port); (_sr)--)	\
 		if ((_port)->sampling_rate_mask & SCI_SR((_sr)))
 
-struct plat_sci_reg {
-	u8 offset, size;
-};
-
-struct sci_port_params {
-	const struct plat_sci_reg regs[SCIx_NR_REGS];
-	unsigned int fifosize;
-	unsigned int overrun_reg;
-	unsigned int overrun_mask;
-	unsigned int sampling_rate_mask;
-	unsigned int error_mask;
-	unsigned int error_clear;
-};
-
-struct sci_port {
-	struct uart_port	port;
-
-	/* Platform configuration */
-	const struct sci_port_params *params;
-	const struct plat_sci_port *cfg;
-	unsigned int		sampling_rate_mask;
-	resource_size_t		reg_size;
-	struct mctrl_gpios	*gpios;
-
-	/* Clocks */
-	struct clk		*clks[SCI_NUM_CLKS];
-	unsigned long		clk_rates[SCI_NUM_CLKS];
-
-	int			irqs[SCIx_NR_IRQS];
-	char			*irqstr[SCIx_NR_IRQS];
-
-	struct dma_chan			*chan_tx;
-	struct dma_chan			*chan_rx;
-
-#ifdef CONFIG_SERIAL_SH_SCI_DMA
-	struct dma_chan			*chan_tx_saved;
-	struct dma_chan			*chan_rx_saved;
-	dma_cookie_t			cookie_tx;
-	dma_cookie_t			cookie_rx[2];
-	dma_cookie_t			active_rx;
-	dma_addr_t			tx_dma_addr;
-	unsigned int			tx_dma_len;
-	struct scatterlist		sg_rx[2];
-	void				*rx_buf[2];
-	size_t				buf_len_rx;
-	struct work_struct		work_tx;
-	struct hrtimer			rx_timer;
-	unsigned int			rx_timeout;	/* microseconds */
-#endif
-	unsigned int			rx_frame;
-	int				rx_trigger;
-	struct timer_list		rx_fifo_timer;
-	int				rx_fifo_timeout;
-	u16				hscif_tot;
-
-	bool has_rtscts;
-	bool autorts;
-	bool tx_occurred;
-};
-
 #define SCI_NPORTS CONFIG_SERIAL_SH_SCI_NR_UARTS
 
 static struct sci_port sci_ports[SCI_NPORTS];
 static unsigned long sci_ports_in_use;
 static struct uart_driver sci_uart_driver;
 
-static inline struct sci_port *
-to_sci_port(struct uart_port *uart)
-{
-	return container_of(uart, struct sci_port, port);
-}
+static const struct sci_port_params_bits sci_sci_port_params_bits = {
+	.rxtx_enable = SCSCR_RE | SCSCR_TE,
+	.te_clear = SCSCR_TE | SCSCR_TEIE,
+	.poll_sent_bits = SCI_FER | SCI_TEND
+};
+
+static const struct sci_port_params_bits sci_scix_port_params_bits = {
+	.rxtx_enable = SCSCR_RE | SCSCR_TE,
+	.te_clear = SCSCR_TE | SCSCR_TEIE,
+	.poll_sent_bits = SCIF_TDFE | SCIF_TEND
+};
+
+static const struct sci_common_regs sci_common_regs = {
+	.status = SCxSR,
+	.control = SCSCR,
+};
 
 static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 	/*
@@ -192,6 +118,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCI_DEFAULT_ERROR_MASK | SCI_ORER,
 		.error_clear = SCI_ERROR_CLEAR & ~SCI_ORER,
+		.param_bits = &sci_sci_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -214,6 +142,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCI_DEFAULT_ERROR_MASK | SCI_ORER,
 		.error_clear = SCI_ERROR_CLEAR & ~SCI_ORER,
+		.param_bits = &sci_scix_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -238,6 +168,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR_SCIFAB,
 		.error_mask = SCIF_DEFAULT_ERROR_MASK | SCIFA_ORER,
 		.error_clear = SCIF_ERROR_CLEAR & ~SCIFA_ORER,
+		.param_bits = &sci_scix_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -263,6 +195,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR_SCIFAB,
 		.error_mask = SCIF_DEFAULT_ERROR_MASK | SCIFA_ORER,
 		.error_clear = SCIF_ERROR_CLEAR & ~SCIFA_ORER,
+		.param_bits = &sci_scix_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -288,6 +222,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scix_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -316,6 +252,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scix_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -347,6 +285,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scix_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -369,6 +309,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scix_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -393,6 +335,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scix_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -420,6 +364,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scix_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -449,6 +395,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR_RANGE(8, 32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scix_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -473,6 +421,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scix_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -500,6 +450,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scix_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -523,6 +475,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(16),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK | SCIFA_ORER,
 		.error_clear = SCIF_ERROR_CLEAR & ~SCIFA_ORER,
+		.param_bits = &sci_scix_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 };
 
@@ -560,7 +514,7 @@ static void sci_serial_out(struct uart_port *p, int offset, int value)
 		WARN(1, "Invalid register access\n");
 }
 
-static void sci_port_enable(struct sci_port *sci_port)
+void sci_port_enable(struct sci_port *sci_port)
 {
 	unsigned int i;
 
@@ -576,7 +530,7 @@ static void sci_port_enable(struct sci_port *sci_port)
 	sci_port->port.uartclk = sci_port->clk_rates[SCI_FCK];
 }
 
-static void sci_port_disable(struct sci_port *sci_port)
+void sci_port_disable(struct sci_port *sci_port)
 {
 	unsigned int i;
 
@@ -713,15 +667,16 @@ static void sci_clear_SCxSR(struct uart_port *port, unsigned int mask)
     defined(CONFIG_SERIAL_SH_SCI_EARLYCON)
 
 #ifdef CONFIG_CONSOLE_POLL
-static int sci_poll_get_char(struct uart_port *port)
+int sci_poll_get_char(struct uart_port *port)
 {
 	unsigned short status;
+	struct sci_port *s = to_sci_port(port);
 	int c;
 
 	do {
 		status = sci_serial_in(port, SCxSR);
 		if (status & SCxSR_ERRORS(port)) {
-			sci_clear_SCxSR(port, SCxSR_ERROR_CLEAR(port));
+			s->ops->clear_SCxSR(port, SCxSR_ERROR_CLEAR(port));
 			continue;
 		}
 		break;
@@ -734,7 +689,7 @@ static int sci_poll_get_char(struct uart_port *port)
 
 	/* Dummy read */
 	sci_serial_in(port, SCxSR);
-	sci_clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
+	s->ops->clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
 
 	return c;
 }
@@ -742,14 +697,16 @@ static int sci_poll_get_char(struct uart_port *port)
 
 static void sci_poll_put_char(struct uart_port *port, unsigned char c)
 {
-	unsigned short status;
+	struct sci_port *s = to_sci_port(port);
+	const struct sci_common_regs *regs = s->params->common_regs;
+	unsigned int status;
 
 	do {
-		status = sci_serial_in(port, SCxSR);
+		status = s->ops->read_reg(port, regs->status);
 	} while (!(status & SCxSR_TDxE(port)));
 
 	sci_serial_out(port, SCxTDR, c);
-	sci_clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));
+	s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));
 }
 #endif /* CONFIG_CONSOLE_POLL || CONFIG_SERIAL_SH_SCI_CONSOLE ||
 	  CONFIG_SERIAL_SH_SCI_EARLYCON */
@@ -892,7 +849,7 @@ static void sci_transmit_chars(struct uart_port *port)
 		port->icount.tx++;
 	} while (--count > 0);
 
-	sci_clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
+	s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
 
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
@@ -911,6 +868,7 @@ static void sci_transmit_chars(struct uart_port *port)
 static void sci_receive_chars(struct uart_port *port)
 {
 	struct tty_port *tport = &port->state->port;
+	struct sci_port *s = to_sci_port(port);
 	int i, count, copied = 0;
 	unsigned short status;
 	unsigned char flag;
@@ -965,7 +923,7 @@ static void sci_receive_chars(struct uart_port *port)
 		}
 
 		sci_serial_in(port, SCxSR); /* dummy read */
-		sci_clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
+		s->ops->clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
 
 		copied += count;
 		port->icount.rx += count;
@@ -978,16 +936,17 @@ static void sci_receive_chars(struct uart_port *port)
 		/* TTY buffers full; read from RX reg to prevent lockup */
 		sci_serial_in(port, SCxRDR);
 		sci_serial_in(port, SCxSR); /* dummy read */
-		sci_clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
+		s->ops->clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
 	}
 }
 
 static int sci_handle_errors(struct uart_port *port)
 {
 	int copied = 0;
-	unsigned short status = sci_serial_in(port, SCxSR);
-	struct tty_port *tport = &port->state->port;
 	struct sci_port *s = to_sci_port(port);
+	const struct sci_common_regs *regs = s->params->common_regs;
+	unsigned int status = s->ops->read_reg(port, regs->status);
+	struct tty_port *tport = &port->state->port;
 
 	/* Handle overruns */
 	if (status & s->params->overrun_mask) {
@@ -1146,7 +1105,7 @@ static void rx_fifo_timer_fn(struct timer_list *t)
 	struct uart_port *port = &s->port;
 
 	dev_dbg(port->dev, "Rx timed out\n");
-	scif_set_rtrg(port, 1);
+	s->ops->set_rtrg(port, 1);
 }
 
 static ssize_t rx_fifo_trigger_show(struct device *dev,
@@ -1171,9 +1130,9 @@ static ssize_t rx_fifo_trigger_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	sci->rx_trigger = scif_set_rtrg(port, r);
+	sci->rx_trigger = sci->ops->set_rtrg(port, r);
 	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
-		scif_set_rtrg(port, 1);
+		sci->ops->set_rtrg(port, 1);
 
 	return count;
 }
@@ -1216,7 +1175,7 @@ static ssize_t rx_fifo_timeout_store(struct device *dev,
 		sci->hscif_tot = r << HSSCR_TOT_SHIFT;
 	} else {
 		sci->rx_fifo_timeout = r;
-		scif_set_rtrg(port, 1);
+		sci->ops->set_rtrg(port, 1);
 		if (r > 0)
 			timer_setup(&sci->rx_fifo_timer, rx_fifo_timer_fn, 0);
 	}
@@ -1341,7 +1300,7 @@ static void sci_dma_rx_reenable_irq(struct sci_port *s)
 	    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 		enable_irq(s->irqs[SCIx_RXI_IRQ]);
 		if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
-			scif_set_rtrg(port, s->rx_trigger);
+			s->ops->set_rtrg(port, s->rx_trigger);
 		else
 			scr &= ~SCSCR_RDRQE;
 	}
@@ -1623,7 +1582,7 @@ static struct dma_chan *sci_request_dma_chan(struct uart_port *port,
 	return chan;
 }
 
-static void sci_request_dma(struct uart_port *port)
+void sci_request_dma(struct uart_port *port)
 {
 	struct sci_port *s = to_sci_port(port);
 	struct tty_port *tport = &port->state->port;
@@ -1711,7 +1670,7 @@ static void sci_request_dma(struct uart_port *port)
 	}
 }
 
-static void sci_free_dma(struct uart_port *port)
+void sci_free_dma(struct uart_port *port)
 {
 	struct sci_port *s = to_sci_port(port);
 
@@ -1721,7 +1680,7 @@ static void sci_free_dma(struct uart_port *port)
 		sci_dma_rx_release(s);
 }
 
-static void sci_flush_buffer(struct uart_port *port)
+void sci_flush_buffer(struct uart_port *port)
 {
 	struct sci_port *s = to_sci_port(port);
 
@@ -1750,11 +1709,11 @@ static void sci_dma_check_tx_occurred(struct sci_port *s)
 		s->tx_occurred = true;
 }
 #else /* !CONFIG_SERIAL_SH_SCI_DMA */
-static inline void sci_request_dma(struct uart_port *port)
+inline void sci_request_dma(struct uart_port *port)
 {
 }
 
-static inline void sci_free_dma(struct uart_port *port)
+inline void sci_free_dma(struct uart_port *port)
 {
 }
 
@@ -1762,7 +1721,9 @@ static void sci_dma_check_tx_occurred(struct sci_port *s)
 {
 }
 
-#define sci_flush_buffer	NULL
+inline void sci_flush_buffer(struct uart_port *port)
+{
+}
 #endif /* !CONFIG_SERIAL_SH_SCI_DMA */
 
 static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
@@ -1780,7 +1741,7 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 		    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 			disable_irq_nosync(s->irqs[SCIx_RXI_IRQ]);
 			if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
-				scif_set_rtrg(port, 1);
+				s->ops->set_rtrg(port, 1);
 				scr |= SCSCR_RIE;
 			} else {
 				scr |= SCSCR_RDRQE;
@@ -1806,8 +1767,8 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 #endif
 
 	if (s->rx_trigger > 1 && s->rx_fifo_timeout > 0) {
-		if (!scif_rtrg_enabled(port))
-			scif_set_rtrg(port, s->rx_trigger);
+		if (!s->ops->rtrg_enabled(port))
+			s->ops->set_rtrg(port, s->rx_trigger);
 
 		mod_timer(&s->rx_fifo_timer, jiffies + DIV_ROUND_UP(
 			  s->rx_frame * HZ * s->rx_fifo_timeout, 1000000));
@@ -1817,7 +1778,7 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 	 * of whether the I_IXOFF is set, otherwise, how is the interrupt
 	 * to be disabled?
 	 */
-	sci_receive_chars(port);
+	s->ops->receive_chars(port);
 
 	return IRQ_HANDLED;
 }
@@ -1826,9 +1787,10 @@ static irqreturn_t sci_tx_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
 	unsigned long flags;
+	struct sci_port *s = to_sci_port(port);
 
 	uart_port_lock_irqsave(port, &flags);
-	sci_transmit_chars(port);
+	s->ops->transmit_chars(port);
 	uart_port_unlock_irqrestore(port, flags);
 
 	return IRQ_HANDLED;
@@ -1837,16 +1799,19 @@ static irqreturn_t sci_tx_interrupt(int irq, void *ptr)
 static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
+	struct sci_port *s = to_sci_port(port);
+	const struct sci_common_regs *regs = s->params->common_regs;
 	unsigned long flags;
-	unsigned short ctrl;
+	u32 ctrl;
 
 	if (port->type != PORT_SCI)
 		return sci_tx_interrupt(irq, ptr);
 
 	uart_port_lock_irqsave(port, &flags);
-	ctrl = sci_serial_in(port, SCSCR);
-	ctrl &= ~(SCSCR_TE | SCSCR_TEIE);
-	sci_serial_out(port, SCSCR, ctrl);
+	ctrl = s->ops->read_reg(port, regs->control);
+
+	ctrl &= ~(s->params->param_bits->te_clear);
+	s->ops->write_reg(port, regs->control, ctrl);
 	uart_port_unlock_irqrestore(port, flags);
 
 	return IRQ_HANDLED;
@@ -1855,6 +1820,7 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 static irqreturn_t sci_br_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
+	struct sci_port *s = to_sci_port(port);
 
 	/* Handle BREAKs */
 	sci_handle_breaks(port);
@@ -1862,7 +1828,7 @@ static irqreturn_t sci_br_interrupt(int irq, void *ptr)
 	/* drop invalid character received before break was detected */
 	sci_serial_in(port, SCxRDR);
 
-	sci_clear_SCxSR(port, SCxSR_BREAK_CLEAR(port));
+	s->ops->clear_SCxSR(port, SCxSR_BREAK_CLEAR(port));
 
 	return IRQ_HANDLED;
 }
@@ -1890,15 +1856,15 @@ static irqreturn_t sci_er_interrupt(int irq, void *ptr)
 		if (sci_handle_errors(port)) {
 			/* discard character in rx buffer */
 			sci_serial_in(port, SCxSR);
-			sci_clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
+			s->ops->clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
 		}
 	} else {
 		sci_handle_fifo_overrun(port);
 		if (!s->chan_rx)
-			sci_receive_chars(port);
+			s->ops->receive_chars(port);
 	}
 
-	sci_clear_SCxSR(port, SCxSR_ERROR_CLEAR(port));
+	s->ops->clear_SCxSR(port, SCxSR_ERROR_CLEAR(port));
 
 	/* Kick the transmission */
 	if (!s->chan_tx)
@@ -2059,7 +2025,7 @@ static int sci_request_irq(struct sci_port *port)
 	return ret;
 }
 
-static void sci_free_irq(struct sci_port *port)
+void sci_free_irq(struct sci_port *port)
 {
 	int i, j;
 
@@ -2232,7 +2198,7 @@ static unsigned int sci_get_mctrl(struct uart_port *port)
 	return mctrl;
 }
 
-static void sci_enable_ms(struct uart_port *port)
+void sci_enable_ms(struct uart_port *port)
 {
 	mctrl_gpio_enable_ms(to_sci_port(port)->gpios);
 }
@@ -2268,7 +2234,17 @@ static void sci_break_ctl(struct uart_port *port, int break_state)
 	uart_port_unlock_irqrestore(port, flags);
 }
 
-static int sci_startup(struct uart_port *port)
+static void sci_shutdown_complete(struct uart_port *port)
+{
+	struct sci_port *s = to_sci_port(port);
+	u16 scr;
+
+	scr = sci_serial_in(port, SCSCR);
+	sci_serial_out(port, SCSCR,
+		       scr & (SCSCR_CKE1 | SCSCR_CKE0 | s->hscif_tot));
+}
+
+int sci_startup(struct uart_port *port)
 {
 	struct sci_port *s = to_sci_port(port);
 	int ret;
@@ -2291,7 +2267,6 @@ static void sci_shutdown(struct uart_port *port)
 {
 	struct sci_port *s = to_sci_port(port);
 	unsigned long flags;
-	u16 scr;
 
 	dev_dbg(port->dev, "%s(%d)\n", __func__, port->line);
 
@@ -2301,13 +2276,7 @@ static void sci_shutdown(struct uart_port *port)
 	uart_port_lock_irqsave(port, &flags);
 	sci_stop_rx(port);
 	sci_stop_tx(port);
-	/*
-	 * Stop RX and TX, disable related interrupts, keep clock source
-	 * and HSCIF TOT bits
-	 */
-	scr = sci_serial_in(port, SCSCR);
-	sci_serial_out(port, SCSCR,
-		       scr & (SCSCR_CKE1 | SCSCR_CKE0 | s->hscif_tot));
+	s->ops->shutdown_complete(port);
 	uart_port_unlock_irqrestore(port, flags);
 
 #ifdef CONFIG_SERIAL_SH_SCI_DMA
@@ -2383,9 +2352,9 @@ static int sci_brg_calc(struct sci_port *s, unsigned int bps,
 }
 
 /* calculate sample rate, BRR, and clock select */
-static int sci_scbrr_calc(struct sci_port *s, unsigned int bps,
-			  unsigned int *brr, unsigned int *srr,
-			  unsigned int *cks)
+int sci_scbrr_calc(struct sci_port *s, unsigned int bps,
+		   unsigned int *brr, unsigned int *srr,
+		   unsigned int *cks)
 {
 	unsigned long freq = s->clk_rates[SCI_FCK];
 	unsigned int sr, br, prediv, scrate, c;
@@ -2462,9 +2431,9 @@ static void sci_reset(struct uart_port *port)
 	if (reg->size)
 		sci_serial_out(port, SCFCR, SCFCR_RFRST | SCFCR_TFRST);
 
-	sci_clear_SCxSR(port,
-			SCxSR_RDxF_CLEAR(port) & SCxSR_ERROR_CLEAR(port) &
-			SCxSR_BREAK_CLEAR(port));
+	s->ops->clear_SCxSR(port,
+			    SCxSR_RDxF_CLEAR(port) & SCxSR_ERROR_CLEAR(port) &
+			    SCxSR_BREAK_CLEAR(port));
 	if (sci_getreg(port, SCLSR)->size) {
 		status = sci_serial_in(port, SCLSR);
 		status &= ~(SCLSR_TO | SCLSR_ORER);
@@ -2473,14 +2442,14 @@ static void sci_reset(struct uart_port *port)
 
 	if (s->rx_trigger > 1) {
 		if (s->rx_fifo_timeout) {
-			scif_set_rtrg(port, 1);
+			s->ops->set_rtrg(port, 1);
 			timer_setup(&s->rx_fifo_timer, rx_fifo_timer_fn, 0);
 		} else {
 			if (port->type == PORT_SCIFA ||
 			    port->type == PORT_SCIFB)
-				scif_set_rtrg(port, 1);
+				s->ops->set_rtrg(port, 1);
 			else
-				scif_set_rtrg(port, s->rx_trigger);
+				s->ops->set_rtrg(port, s->rx_trigger);
 		}
 	}
 }
@@ -2740,7 +2709,7 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 		sci_enable_ms(port);
 }
 
-static void sci_pm(struct uart_port *port, unsigned int state,
+void sci_pm(struct uart_port *port, unsigned int state,
 		   unsigned int oldstate)
 {
 	struct sci_port *sci_port = to_sci_port(port);
@@ -2803,7 +2772,7 @@ static int sci_remap_port(struct uart_port *port)
 	return 0;
 }
 
-static void sci_release_port(struct uart_port *port)
+void sci_release_port(struct uart_port *port)
 {
 	struct sci_port *sport = to_sci_port(port);
 
@@ -2815,7 +2784,7 @@ static void sci_release_port(struct uart_port *port)
 	release_mem_region(port->mapbase, sport->reg_size);
 }
 
-static int sci_request_port(struct uart_port *port)
+int sci_request_port(struct uart_port *port)
 {
 	struct resource *res;
 	struct sci_port *sport = to_sci_port(port);
@@ -2837,7 +2806,7 @@ static int sci_request_port(struct uart_port *port)
 	return 0;
 }
 
-static void sci_config_port(struct uart_port *port, int flags)
+void sci_config_port(struct uart_port *port, int flags)
 {
 	if (flags & UART_CONFIG_TYPE) {
 		struct sci_port *sport = to_sci_port(port);
@@ -2847,7 +2816,7 @@ static void sci_config_port(struct uart_port *port, int flags)
 	}
 }
 
-static int sci_verify_port(struct uart_port *port, struct serial_struct *ser)
+int sci_verify_port(struct uart_port *port, struct serial_struct *ser)
 {
 	if (ser->baud_base < 2400)
 		/* No paper tape reader for Mitch.. */
@@ -2856,6 +2825,17 @@ static int sci_verify_port(struct uart_port *port, struct serial_struct *ser)
 	return 0;
 }
 
+static void sci_prepare_console_write(struct uart_port *port, u32 ctrl)
+{
+	struct sci_port *s = to_sci_port(port);
+	u32 ctrl_temp =
+		s->params->param_bits->rxtx_enable |
+		(s->cfg->scscr & ~(SCSCR_CKE1 | SCSCR_CKE0)) |
+		(ctrl & (SCSCR_CKE1 | SCSCR_CKE0)) |
+		s->hscif_tot;
+	sci_serial_out(port, SCSCR, ctrl_temp);
+}
+
 static const struct uart_ops sci_uart_ops = {
 	.tx_empty	= sci_tx_empty,
 	.set_mctrl	= sci_set_mctrl,
@@ -2881,6 +2861,19 @@ static const struct uart_ops sci_uart_ops = {
 #endif
 };
 
+static const struct sci_port_ops sci_port_ops = {
+	.read_reg		= sci_serial_in,
+	.write_reg		= sci_serial_out,
+	.receive_chars		= sci_receive_chars,
+	.transmit_chars		= sci_transmit_chars,
+	.poll_put_char		= sci_poll_put_char,
+	.clear_SCxSR		= sci_clear_SCxSR,
+	.set_rtrg		= scif_set_rtrg,
+	.rtrg_enabled		= scif_rtrg_enabled,
+	.shutdown_complete	= sci_shutdown_complete,
+	.prepare_console_write	= sci_prepare_console_write,
+};
+
 static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 {
 	const char *clk_names[] = {
@@ -2974,6 +2967,7 @@ static int sci_init_single(struct platform_device *dev,
 	int ret;
 
 	sci_port->cfg	= p;
+	sci_port->ops	= &sci_port_ops;
 
 	port->ops	= &sci_uart_ops;
 	port->iotype	= UPIO_MEM;
@@ -3095,7 +3089,7 @@ static void sci_cleanup_single(struct sci_port *port)
     defined(CONFIG_SERIAL_SH_SCI_EARLYCON)
 static void serial_console_putchar(struct uart_port *port, unsigned char ch)
 {
-	sci_poll_put_char(port, ch);
+	to_sci_port(port)->ops->poll_put_char(port, ch);
 }
 
 /*
@@ -3107,7 +3101,9 @@ static void serial_console_write(struct console *co, const char *s,
 {
 	struct sci_port *sci_port = &sci_ports[co->index];
 	struct uart_port *port = &sci_port->port;
-	unsigned short bits, ctrl, ctrl_temp;
+	const struct sci_common_regs *regs = sci_port->params->common_regs;
+	unsigned int bits;
+	u32 ctrl;
 	unsigned long flags;
 	int locked = 1;
 
@@ -3119,21 +3115,21 @@ static void serial_console_write(struct console *co, const char *s,
 		uart_port_lock_irqsave(port, &flags);
 
 	/* first save SCSCR then disable interrupts, keep clock source */
-	ctrl = sci_serial_in(port, SCSCR);
-	ctrl_temp = SCSCR_RE | SCSCR_TE |
-		    (sci_port->cfg->scscr & ~(SCSCR_CKE1 | SCSCR_CKE0)) |
-		    (ctrl & (SCSCR_CKE1 | SCSCR_CKE0));
-	sci_serial_out(port, SCSCR, ctrl_temp | sci_port->hscif_tot);
+
+	ctrl = sci_port->ops->read_reg(port, regs->control);
+	sci_port->ops->prepare_console_write(port, ctrl);
 
 	uart_console_write(port, s, count, serial_console_putchar);
 
 	/* wait until fifo is empty and last bit has been transmitted */
-	bits = SCxSR_TDxE(port) | SCxSR_TEND(port);
-	while ((sci_serial_in(port, SCxSR) & bits) != bits)
+
+	bits = sci_ports->params->param_bits->poll_sent_bits;
+
+	while ((sci_port->ops->read_reg(port, regs->status) & bits) != bits)
 		cpu_relax();
 
 	/* restore the SCSCR */
-	sci_serial_out(port, SCSCR, ctrl);
+	sci_port->ops->write_reg(port, regs->control, ctrl);
 
 	if (locked)
 		uart_port_unlock_irqrestore(port, flags);
@@ -3268,7 +3264,6 @@ static void sci_remove(struct platform_device *dev)
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_timeout);
 }
 
-
 #define SCI_OF_DATA(type, regtype)	(void *)((type) << 16 | (regtype))
 #define SCI_OF_TYPE(data)		((unsigned long)(data) >> 16)
 #define SCI_OF_REGTYPE(data)		((unsigned long)(data) & 0xffff)
@@ -3564,9 +3559,11 @@ sh_early_platform_init_buffer("earlyprintk", &sci_driver,
 #ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
 static struct plat_sci_port port_cfg __initdata;
 
-static int __init early_console_setup(struct earlycon_device *device,
+int __init early_console_setup(struct earlycon_device *device,
 				      int type)
 {
+	const struct sci_common_regs *regs;
+
 	if (!device->port.membase)
 		return -ENODEV;
 
@@ -3574,10 +3571,14 @@ static int __init early_console_setup(struct earlycon_device *device,
 	memcpy(&sci_ports[0].port, &device->port, sizeof(struct uart_port));
 	port_cfg.type = type;
 	sci_ports[0].cfg = &port_cfg;
+	sci_ports[0].ops = &sci_port_ops;
 	sci_ports[0].params = sci_probe_regmap(&port_cfg);
-	port_cfg.scscr = sci_serial_in(&sci_ports[0].port, SCSCR);
-	sci_serial_out(&sci_ports[0].port, SCSCR,
-		       SCSCR_RE | SCSCR_TE | port_cfg.scscr);
+	regs = sci_ports[0].params->common_regs;
+
+	port_cfg.scscr = sci_ports[0].ops->read_reg(&sci_ports[0].port, regs->control);
+	sci_ports[0].ops->write_reg(&sci_ports[0].port,
+				    regs->control,
+				    sci_ports[0].params->param_bits->rxtx_enable | port_cfg.scscr);
 
 	device->con->write = serial_console_write;
 	return 0;
diff --git a/drivers/tty/serial/sh-sci_common.h b/drivers/tty/serial/sh-sci_common.h
new file mode 100644
index 000000000000..0bc49ab277b5
--- /dev/null
+++ b/drivers/tty/serial/sh-sci_common.h
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __SH_SCI_COMMON_H__
+#define __SH_SCI_COMMON_H__
+
+#define SCI_MAJOR	204
+#define SCI_MINOR_START	8
+
+#include <linux/serial_core.h>
+
+enum SCI_CLKS {
+	SCI_FCK,		/* Functional Clock */
+	SCI_SCK,		/* Optional External Clock */
+	SCI_BRG_INT,		/* Optional BRG Internal Clock Source */
+	SCI_SCIF_CLK,		/* Optional BRG External Clock Source */
+	SCI_NUM_CLKS
+};
+
+/* Offsets into the sci_port->irqs array */
+enum {
+	SCIx_ERI_IRQ,
+	SCIx_RXI_IRQ,
+	SCIx_TXI_IRQ,
+	SCIx_BRI_IRQ,
+	SCIx_DRI_IRQ,
+	SCIx_TEI_IRQ,
+	SCIx_NR_IRQS,
+
+	SCIx_MUX_IRQ = SCIx_NR_IRQS,	/* special case */
+};
+
+/* Bit x set means sampling rate x + 1 is supported */
+#define SCI_SR(x)		BIT((x) - 1)
+
+void sci_release_port(struct uart_port *port);
+int sci_request_port(struct uart_port *port);
+void sci_config_port(struct uart_port *port, int flags);
+int sci_verify_port(struct uart_port *port, struct serial_struct *ser);
+void sci_pm(struct uart_port *port, unsigned int state,
+		   unsigned int oldstate);
+void sci_enable_ms(struct uart_port *port);
+
+#ifdef CONFIG_CONSOLE_POLL
+int sci_poll_get_char(struct uart_port *port);
+void sci_poll_put_char(struct uart_port *port, unsigned char c);
+#endif /* CONFIG_CONSOLE_POLL */
+
+struct plat_sci_reg {
+	u8 offset;
+	u8 size;
+};
+
+/* The actual number of needed registers depends on the sci controller;
+ * using this value as a max covers both sci and rsci cases
+ */
+#define SCI_NR_REGS 20
+
+struct sci_port_params_bits {
+	unsigned int rxtx_enable;
+	unsigned int te_clear;
+	unsigned int poll_sent_bits;
+};
+
+struct sci_common_regs {
+	unsigned int status;
+	unsigned int control;
+};
+
+struct sci_port_params {
+	const struct plat_sci_reg regs[SCI_NR_REGS];
+	const struct sci_common_regs *common_regs;
+	const struct sci_port_params_bits *param_bits;
+	unsigned int fifosize;
+	unsigned int overrun_reg;
+	unsigned int overrun_mask;
+	unsigned int sampling_rate_mask;
+	unsigned int error_mask;
+	unsigned int error_clear;
+};
+
+struct sci_port_ops {
+	u32 (*read_reg)(struct uart_port *port, int reg);
+	void (*write_reg)(struct uart_port *port, int reg, int value);
+	void (*clear_SCxSR)(struct uart_port *port, unsigned int mask);
+
+	void (*transmit_chars)(struct uart_port *port);
+	void (*receive_chars)(struct uart_port *port);
+
+	void (*poll_put_char)(struct uart_port *port, unsigned char c);
+
+	int (*set_rtrg)(struct uart_port *port, int rx_trig);
+	int (*rtrg_enabled)(struct uart_port *port);
+
+	void (*shutdown_complete)(struct uart_port *port);
+
+	void (*prepare_console_write)(struct uart_port *port, u32 ctrl);
+};
+
+struct sci_port {
+	struct uart_port	port;
+
+	/* Platform configuration */
+	const struct sci_port_params *params;
+	const struct plat_sci_port *cfg;
+
+	unsigned int		sampling_rate_mask;
+	resource_size_t		reg_size;
+	struct mctrl_gpios	*gpios;
+
+	/* Clocks */
+	struct clk		*clks[SCI_NUM_CLKS];
+	unsigned long		clk_rates[SCI_NUM_CLKS];
+
+	int			irqs[SCIx_NR_IRQS];
+	char			*irqstr[SCIx_NR_IRQS];
+
+	struct dma_chan			*chan_tx;
+	struct dma_chan			*chan_rx;
+
+#ifdef CONFIG_SERIAL_SH_SCI_DMA
+	struct dma_chan			*chan_tx_saved;
+	struct dma_chan			*chan_rx_saved;
+	dma_cookie_t			cookie_tx;
+	dma_cookie_t			cookie_rx[2];
+	dma_cookie_t			active_rx;
+	dma_addr_t			tx_dma_addr;
+	unsigned int			tx_dma_len;
+	struct scatterlist		sg_rx[2];
+	void				*rx_buf[2];
+	size_t				buf_len_rx;
+	struct work_struct		work_tx;
+	struct hrtimer			rx_timer;
+	unsigned int			rx_timeout;	/* microseconds */
+#endif
+	unsigned int			rx_frame;
+	int				rx_trigger;
+	struct timer_list		rx_fifo_timer;
+	int				rx_fifo_timeout;
+	u16				hscif_tot;
+
+	const struct sci_port_ops *ops;
+
+	bool has_rtscts;
+	bool autorts;
+	bool tx_occurred;
+};
+
+#define to_sci_port(uart) container_of((uart), struct sci_port, port)
+
+int sci_scbrr_calc(struct sci_port *s, unsigned int bps,
+			  unsigned int *brr, unsigned int *srr,
+			  unsigned int *cks);
+
+void sci_port_disable(struct sci_port *sci_port);
+void sci_port_enable(struct sci_port *sci_port);
+
+int sci_startup(struct uart_port *port);
+void sci_free_irq(struct sci_port *port);
+
+void sci_request_dma(struct uart_port *port);
+void sci_free_dma(struct uart_port *port);
+void sci_flush_buffer(struct uart_port *port);
+
+#define min_sr(_port)		ffs((_port)->sampling_rate_mask)
+#define max_sr(_port)		fls((_port)->sampling_rate_mask)
+
+#ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
+int __init early_console_setup(struct earlycon_device *device, int);
+#endif
+
+#endif /* __SH_SCI_COMMON_H__ */
-- 
2.43.0


