Return-Path: <linux-renesas-soc+bounces-14100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF40A54F10
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 16:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B0943B3751
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 15:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2773211476;
	Thu,  6 Mar 2025 15:26:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE51320E6F2;
	Thu,  6 Mar 2025 15:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741274792; cv=none; b=J+EeQAOr2pJIOzmLUXyZcvN7E8DxsDgT9VyMqeqLI+g81M4FFDidWfw9s8+zBcY2HyecQG+pkmn1kYCxUXeD9J9JTBsIgXCWkvgOY+rkph7iXft0RsmRjYN1p0E9rZzdpD07aerJj4KgBuULyFwZs5pAGL1k45txrEcI6R4kfr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741274792; c=relaxed/simple;
	bh=xbEjq8vouWVW1guIJxL9vtVG4+juQikmUgdS2VHb8xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hJ/3w/djUka77XW3CzB9UIbCsGY0i44zrYVbAATkgrNN0YLXmyyY+iHUwgvC5Md/dsEG6jFnqnnl7DTbgVpUOilqIY40rVT338NYYsiwcVBoTUL39nyRU4iP3BEUcOzyPj7WinAJCEwpmxErL5Lk16yxSdfOgcZ0IHTS1ok8rUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: gaOFJ/2cQ5mNOby87TwY+g==
X-CSE-MsgGUID: 03y9wzqXTFqzApUJacYTpw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Mar 2025 00:26:28 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.123])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7EE464007213;
	Fri,  7 Mar 2025 00:26:25 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v4 08/13] serial: sh-sci: Introduced function pointers
Date: Thu,  6 Mar 2025 16:24:42 +0100
Message-ID: <20250306152451.2356762-9-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
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
Changes v3->v4:
   - Add missing #include <bitfield.h>
   - Remove sci_poll_get_char sci_poll_put_char from sh-sci-common.h (both 
     function are not used by rzsci yet).
   - Add missing #ifdef around .poll_put_char pointer initialization.
   - More registers to save & restore due to rebase on tty-next
---
 drivers/tty/serial/sh-sci-common.h | 158 ++++++++++
 drivers/tty/serial/sh-sci.c        | 482 +++++++++++++++--------------
 drivers/tty/serial/sh-sci.h        |   2 -
 3 files changed, 405 insertions(+), 237 deletions(-)
 create mode 100644 drivers/tty/serial/sh-sci-common.h

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
new file mode 100644
index 000000000000..3ea116033d53
--- /dev/null
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -0,0 +1,158 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __SH_SCI_COMMON_H__
+#define __SH_SCI_COMMON_H__
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
+#define SCI_SR_RANGE(x, y)	GENMASK((y) - 1, (x) - 1)
+
+void sci_release_port(struct uart_port *port);
+int sci_request_port(struct uart_port *port);
+void sci_config_port(struct uart_port *port, int flags);
+int sci_verify_port(struct uart_port *port, struct serial_struct *ser);
+void sci_pm(struct uart_port *port, unsigned int state,
+		   unsigned int oldstate);
+
+struct plat_sci_reg {
+	u8 offset;
+	u8 size;
+};
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
+/* The actual number of needed registers. This is used by sci only */
+#define SCI_NR_REGS 20
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
+	void (*console_save)(struct uart_port *port);
+	void (*console_restore)(struct uart_port *port);
+	size_t (*suspend_regs_size)(void);
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
+	struct reset_control		*rstc;
+	struct sci_suspend_regs		*suspend_regs;
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
+void sci_port_disable(struct sci_port *sci_port);
+void sci_port_enable(struct sci_port *sci_port);
+
+int sci_startup(struct uart_port *port);
+
+#define min_sr(_port)		ffs((_port)->sampling_rate_mask)
+#define max_sr(_port)		fls((_port)->sampling_rate_mask)
+
+#ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
+int __init scix_early_console_setup(struct earlycon_device *device, int);
+#endif
+
+#endif /* __SH_SCI_COMMON_H__ */
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index d7a060033a89..4e82055a41c8 100644
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
+#include "sh-sci-common.h"
 
 #define SCIx_IRQ_IS_MUXED(port)			\
 	((port)->irqs[SCIx_ERI_IRQ] ==	\
@@ -76,32 +64,38 @@ enum {
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
-#define SCI_SR_RANGE(x, y)	GENMASK((y) - 1, (x) - 1)
-
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
+#define SCI_NPORTS CONFIG_SERIAL_SH_SCI_NR_UARTS
+
+static struct sci_port sci_ports[SCI_NPORTS];
+static unsigned long sci_ports_in_use;
+static struct uart_driver sci_uart_driver;
+static bool sci_uart_earlycon;
+static bool sci_uart_earlycon_dev_probing;
+
+static const struct sci_port_params_bits sci_sci_port_params_bits = {
+	.rxtx_enable = SCSCR_RE | SCSCR_TE,
+	.te_clear = SCSCR_TE | SCSCR_TEIE,
+	.poll_sent_bits = SCI_TDRE | SCI_TEND
+};
+
+static const struct sci_port_params_bits sci_scif_port_params_bits = {
+	.rxtx_enable = SCSCR_RE | SCSCR_TE,
+	.te_clear = SCSCR_TE | SCSCR_TEIE,
+	.poll_sent_bits = SCIF_TDFE | SCIF_TEND
+};
+
+static const struct sci_common_regs sci_common_regs = {
+	.status = SCxSR,
+	.control = SCSCR,
 };
 
 struct sci_suspend_regs {
@@ -118,77 +112,9 @@ struct sci_suspend_regs {
 	u8 semr;
 };
 
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
-	struct reset_control		*rstc;
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
-	struct sci_suspend_regs		suspend_regs;
-	u16				hscif_tot;
-
-	bool has_rtscts;
-	bool autorts;
-	bool tx_occurred;
-};
-
-#define SCI_NPORTS CONFIG_SERIAL_SH_SCI_NR_UARTS
-
-static struct sci_port sci_ports[SCI_NPORTS];
-static unsigned long sci_ports_in_use;
-static struct uart_driver sci_uart_driver;
-static bool sci_uart_earlycon;
-static bool sci_uart_earlycon_dev_probing;
-
-static inline struct sci_port *
-to_sci_port(struct uart_port *uart)
+static size_t sci_suspend_regs_size(void)
 {
-	return container_of(uart, struct sci_port, port);
+	return sizeof(struct sci_suspend_regs);
 }
 
 static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
@@ -211,6 +137,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCI_DEFAULT_ERROR_MASK | SCI_ORER,
 		.error_clear = SCI_ERROR_CLEAR & ~SCI_ORER,
+		.param_bits = &sci_sci_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -233,6 +161,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCI_DEFAULT_ERROR_MASK | SCI_ORER,
 		.error_clear = SCI_ERROR_CLEAR & ~SCI_ORER,
+		.param_bits = &sci_scif_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -257,6 +187,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR_SCIFAB,
 		.error_mask = SCIF_DEFAULT_ERROR_MASK | SCIFA_ORER,
 		.error_clear = SCIF_ERROR_CLEAR & ~SCIFA_ORER,
+		.param_bits = &sci_scif_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -282,6 +214,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR_SCIFAB,
 		.error_mask = SCIF_DEFAULT_ERROR_MASK | SCIFA_ORER,
 		.error_clear = SCIF_ERROR_CLEAR & ~SCIFA_ORER,
+		.param_bits = &sci_scif_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -307,6 +241,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scif_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -335,6 +271,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scif_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -366,6 +304,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scif_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -388,6 +328,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scif_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -412,6 +354,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scif_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -439,6 +383,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scif_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -468,6 +414,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR_RANGE(8, 32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scif_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -492,6 +440,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scif_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -519,6 +469,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(32),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK,
 		.error_clear = SCIF_ERROR_CLEAR,
+		.param_bits = &sci_scif_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 
 	/*
@@ -542,6 +494,8 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.sampling_rate_mask = SCI_SR(16),
 		.error_mask = SCIF_DEFAULT_ERROR_MASK | SCIFA_ORER,
 		.error_clear = SCIF_ERROR_CLEAR & ~SCIFA_ORER,
+		.param_bits = &sci_scif_port_params_bits,
+		.common_regs = &sci_common_regs,
 	},
 };
 
@@ -579,7 +533,7 @@ static void sci_serial_out(struct uart_port *p, int offset, int value)
 		WARN(1, "Invalid register access\n");
 }
 
-static void sci_port_enable(struct sci_port *sci_port)
+void sci_port_enable(struct sci_port *sci_port)
 {
 	unsigned int i;
 
@@ -595,7 +549,7 @@ static void sci_port_enable(struct sci_port *sci_port)
 	sci_port->port.uartclk = sci_port->clk_rates[SCI_FCK];
 }
 
-static void sci_port_disable(struct sci_port *sci_port)
+void sci_port_disable(struct sci_port *sci_port)
 {
 	unsigned int i;
 
@@ -735,12 +689,13 @@ static void sci_clear_SCxSR(struct uart_port *port, unsigned int mask)
 static int sci_poll_get_char(struct uart_port *port)
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
@@ -753,7 +708,7 @@ static int sci_poll_get_char(struct uart_port *port)
 
 	/* Dummy read */
 	sci_serial_in(port, SCxSR);
-	sci_clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
+	s->ops->clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
 
 	return c;
 }
@@ -761,14 +716,16 @@ static int sci_poll_get_char(struct uart_port *port)
 
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
@@ -911,7 +868,7 @@ static void sci_transmit_chars(struct uart_port *port)
 		port->icount.tx++;
 	} while (--count > 0);
 
-	sci_clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
+	s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
 
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
@@ -930,6 +887,7 @@ static void sci_transmit_chars(struct uart_port *port)
 static void sci_receive_chars(struct uart_port *port)
 {
 	struct tty_port *tport = &port->state->port;
+	struct sci_port *s = to_sci_port(port);
 	int i, count, copied = 0;
 	unsigned short status;
 	unsigned char flag;
@@ -984,7 +942,7 @@ static void sci_receive_chars(struct uart_port *port)
 		}
 
 		sci_serial_in(port, SCxSR); /* dummy read */
-		sci_clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
+		s->ops->clear_SCxSR(port, SCxSR_RDxF_CLEAR(port));
 
 		copied += count;
 		port->icount.rx += count;
@@ -997,16 +955,17 @@ static void sci_receive_chars(struct uart_port *port)
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
@@ -1165,7 +1124,7 @@ static void rx_fifo_timer_fn(struct timer_list *t)
 	struct uart_port *port = &s->port;
 
 	dev_dbg(port->dev, "Rx timed out\n");
-	scif_set_rtrg(port, 1);
+	s->ops->set_rtrg(port, 1);
 }
 
 static ssize_t rx_fifo_trigger_show(struct device *dev,
@@ -1190,9 +1149,9 @@ static ssize_t rx_fifo_trigger_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	sci->rx_trigger = scif_set_rtrg(port, r);
+	sci->rx_trigger = sci->ops->set_rtrg(port, r);
 	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
-		scif_set_rtrg(port, 1);
+		sci->ops->set_rtrg(port, 1);
 
 	return count;
 }
@@ -1235,7 +1194,7 @@ static ssize_t rx_fifo_timeout_store(struct device *dev,
 		sci->hscif_tot = r << HSSCR_TOT_SHIFT;
 	} else {
 		sci->rx_fifo_timeout = r;
-		scif_set_rtrg(port, 1);
+		sci->ops->set_rtrg(port, 1);
 		if (r > 0)
 			timer_setup(&sci->rx_fifo_timer, rx_fifo_timer_fn, 0);
 	}
@@ -1360,7 +1319,7 @@ static void sci_dma_rx_reenable_irq(struct sci_port *s)
 	    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 		enable_irq(s->irqs[SCIx_RXI_IRQ]);
 		if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
-			scif_set_rtrg(port, s->rx_trigger);
+			s->ops->set_rtrg(port, s->rx_trigger);
 		else
 			scr &= ~SCSCR_RDRQE;
 	}
@@ -1798,7 +1757,7 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 		    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 			disable_irq_nosync(s->irqs[SCIx_RXI_IRQ]);
 			if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
-				scif_set_rtrg(port, 1);
+				s->ops->set_rtrg(port, 1);
 				scr |= SCSCR_RIE;
 			} else {
 				scr |= SCSCR_RDRQE;
@@ -1824,8 +1783,8 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 #endif
 
 	if (s->rx_trigger > 1 && s->rx_fifo_timeout > 0) {
-		if (!scif_rtrg_enabled(port))
-			scif_set_rtrg(port, s->rx_trigger);
+		if (!s->ops->rtrg_enabled(port))
+			s->ops->set_rtrg(port, s->rx_trigger);
 
 		mod_timer(&s->rx_fifo_timer, jiffies + DIV_ROUND_UP(
 			  s->rx_frame * HZ * s->rx_fifo_timeout, 1000000));
@@ -1835,7 +1794,7 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 	 * of whether the I_IXOFF is set, otherwise, how is the interrupt
 	 * to be disabled?
 	 */
-	sci_receive_chars(port);
+	s->ops->receive_chars(port);
 
 	return IRQ_HANDLED;
 }
@@ -1844,9 +1803,10 @@ static irqreturn_t sci_tx_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
 	unsigned long flags;
+	struct sci_port *s = to_sci_port(port);
 
 	uart_port_lock_irqsave(port, &flags);
-	sci_transmit_chars(port);
+	s->ops->transmit_chars(port);
 	uart_port_unlock_irqrestore(port, flags);
 
 	return IRQ_HANDLED;
@@ -1855,16 +1815,18 @@ static irqreturn_t sci_tx_interrupt(int irq, void *ptr)
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
+	ctrl = s->ops->read_reg(port, regs->control) &
+		~(s->params->param_bits->te_clear);
+	s->ops->write_reg(port, regs->control, ctrl);
 	uart_port_unlock_irqrestore(port, flags);
 
 	return IRQ_HANDLED;
@@ -1873,6 +1835,7 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 static irqreturn_t sci_br_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
+	struct sci_port *s = to_sci_port(port);
 
 	/* Handle BREAKs */
 	sci_handle_breaks(port);
@@ -1880,7 +1843,7 @@ static irqreturn_t sci_br_interrupt(int irq, void *ptr)
 	/* drop invalid character received before break was detected */
 	sci_serial_in(port, SCxRDR);
 
-	sci_clear_SCxSR(port, SCxSR_BREAK_CLEAR(port));
+	s->ops->clear_SCxSR(port, SCxSR_BREAK_CLEAR(port));
 
 	return IRQ_HANDLED;
 }
@@ -1908,15 +1871,15 @@ static irqreturn_t sci_er_interrupt(int irq, void *ptr)
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
@@ -2286,7 +2249,17 @@ static void sci_break_ctl(struct uart_port *port, int break_state)
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
@@ -2309,7 +2282,6 @@ static void sci_shutdown(struct uart_port *port)
 {
 	struct sci_port *s = to_sci_port(port);
 	unsigned long flags;
-	u16 scr;
 
 	dev_dbg(port->dev, "%s(%d)\n", __func__, port->line);
 
@@ -2319,13 +2291,7 @@ static void sci_shutdown(struct uart_port *port)
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
@@ -2402,8 +2368,8 @@ static int sci_brg_calc(struct sci_port *s, unsigned int bps,
 
 /* calculate sample rate, BRR, and clock select */
 static int sci_scbrr_calc(struct sci_port *s, unsigned int bps,
-			  unsigned int *brr, unsigned int *srr,
-			  unsigned int *cks)
+		   unsigned int *brr, unsigned int *srr,
+		   unsigned int *cks)
 {
 	unsigned long freq = s->clk_rates[SCI_FCK];
 	unsigned int sr, br, prediv, scrate, c;
@@ -2480,9 +2446,9 @@ static void sci_reset(struct uart_port *port)
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
@@ -2491,14 +2457,14 @@ static void sci_reset(struct uart_port *port)
 
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
@@ -2758,7 +2724,7 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 		sci_enable_ms(port);
 }
 
-static void sci_pm(struct uart_port *port, unsigned int state,
+void sci_pm(struct uart_port *port, unsigned int state,
 		   unsigned int oldstate)
 {
 	struct sci_port *sci_port = to_sci_port(port);
@@ -2821,7 +2787,7 @@ static int sci_remap_port(struct uart_port *port)
 	return 0;
 }
 
-static void sci_release_port(struct uart_port *port)
+void sci_release_port(struct uart_port *port)
 {
 	struct sci_port *sport = to_sci_port(port);
 
@@ -2833,7 +2799,7 @@ static void sci_release_port(struct uart_port *port)
 	release_mem_region(port->mapbase, sport->reg_size);
 }
 
-static int sci_request_port(struct uart_port *port)
+int sci_request_port(struct uart_port *port)
 {
 	struct resource *res;
 	struct sci_port *sport = to_sci_port(port);
@@ -2855,7 +2821,7 @@ static int sci_request_port(struct uart_port *port)
 	return 0;
 }
 
-static void sci_config_port(struct uart_port *port, int flags)
+void sci_config_port(struct uart_port *port, int flags)
 {
 	if (flags & UART_CONFIG_TYPE) {
 		struct sci_port *sport = to_sci_port(port);
@@ -2865,7 +2831,7 @@ static void sci_config_port(struct uart_port *port, int flags)
 	}
 }
 
-static int sci_verify_port(struct uart_port *port, struct serial_struct *ser)
+int sci_verify_port(struct uart_port *port, struct serial_struct *ser)
 {
 	if (ser->baud_base < 2400)
 		/* No paper tape reader for Mitch.. */
@@ -2874,6 +2840,75 @@ static int sci_verify_port(struct uart_port *port, struct serial_struct *ser)
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
+static void sci_console_save(struct uart_port *port)
+{
+	struct sci_port *s = to_sci_port(port);
+	struct sci_suspend_regs *regs = s->suspend_regs;
+
+	if (sci_getreg(port, SCDL)->size)
+		regs->scdl = sci_serial_in(port, SCDL);
+	if (sci_getreg(port, SCCKS)->size)
+		regs->sccks = sci_serial_in(port, SCCKS);
+	if (sci_getreg(port, SCSMR)->size)
+		regs->scsmr = sci_serial_in(port, SCSMR);
+	if (sci_getreg(port, SCSCR)->size)
+		regs->scscr = sci_serial_in(port, SCSCR);
+	if (sci_getreg(port, SCFCR)->size)
+		regs->scfcr = sci_serial_in(port, SCFCR);
+	if (sci_getreg(port, SCSPTR)->size)
+		regs->scsptr = sci_serial_in(port, SCSPTR);
+	if (sci_getreg(port, SCBRR)->size)
+		regs->scbrr = sci_serial_in(port, SCBRR);
+	if (sci_getreg(port, HSSRR)->size)
+		regs->hssrr = sci_serial_in(port, HSSRR);
+	if (sci_getreg(port, SCPCR)->size)
+		regs->scpcr = sci_serial_in(port, SCPCR);
+	if (sci_getreg(port, SCPDR)->size)
+		regs->scpdr = sci_serial_in(port, SCPDR);
+	if (sci_getreg(port, SEMR)->size)
+		regs->semr = sci_serial_in(port, SEMR);
+}
+
+static void sci_console_restore(struct uart_port *port)
+{
+	struct sci_port *s = to_sci_port(port);
+	struct sci_suspend_regs *regs = s->suspend_regs;
+
+	if (sci_getreg(port, SCDL)->size)
+		sci_serial_out(port, SCDL, regs->scdl);
+	if (sci_getreg(port, SCCKS)->size)
+		sci_serial_out(port, SCCKS, regs->sccks);
+	if (sci_getreg(port, SCSMR)->size)
+		sci_serial_out(port, SCSMR, regs->scsmr);
+	if (sci_getreg(port, SCSCR)->size)
+		sci_serial_out(port, SCSCR, regs->scscr);
+	if (sci_getreg(port, SCFCR)->size)
+		sci_serial_out(port, SCFCR, regs->scfcr);
+	if (sci_getreg(port, SCSPTR)->size)
+		sci_serial_out(port, SCSPTR, regs->scsptr);
+	if (sci_getreg(port, SCBRR)->size)
+		sci_serial_out(port, SCBRR, regs->scbrr);
+	if (sci_getreg(port, HSSRR)->size)
+		sci_serial_out(port, HSSRR, regs->hssrr);
+	if (sci_getreg(port, SCPCR)->size)
+		sci_serial_out(port, SCPCR, regs->scpcr);
+	if (sci_getreg(port, SCPDR)->size)
+		sci_serial_out(port, SCPDR, regs->scpdr);
+	if (sci_getreg(port, SEMR)->size)
+		sci_serial_out(port, SEMR, regs->semr);
+}
+
 static const struct uart_ops sci_uart_ops = {
 	.tx_empty	= sci_tx_empty,
 	.set_mctrl	= sci_set_mctrl,
@@ -2899,6 +2934,25 @@ static const struct uart_ops sci_uart_ops = {
 #endif
 };
 
+static const struct sci_port_ops sci_port_ops = {
+	.read_reg		= sci_serial_in,
+	.write_reg		= sci_serial_out,
+	.clear_SCxSR		= sci_clear_SCxSR,
+	.transmit_chars		= sci_transmit_chars,
+	.receive_chars		= sci_receive_chars,
+#if defined(CONFIG_SERIAL_SH_SCI_CONSOLE) || \
+    defined(CONFIG_SERIAL_SH_SCI_EARLYCON)
+	.poll_put_char		= sci_poll_put_char,
+#endif
+	.set_rtrg		= scif_set_rtrg,
+	.rtrg_enabled		= scif_rtrg_enabled,
+	.shutdown_complete	= sci_shutdown_complete,
+	.prepare_console_write	= sci_prepare_console_write,
+	.console_save		= sci_console_save,
+	.console_restore	= sci_console_restore,
+	.suspend_regs_size	= sci_suspend_regs_size,
+};
+
 static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 {
 	const char *clk_names[] = {
@@ -2992,6 +3046,7 @@ static int sci_init_single(struct platform_device *dev,
 	int ret;
 
 	sci_port->cfg	= p;
+	sci_port->ops	= &sci_port_ops;
 
 	port->ops	= &sci_uart_ops;
 	port->iotype	= UPIO_MEM;
@@ -3104,7 +3159,7 @@ static int sci_init_single(struct platform_device *dev,
     defined(CONFIG_SERIAL_SH_SCI_EARLYCON)
 static void serial_console_putchar(struct uart_port *port, unsigned char ch)
 {
-	sci_poll_put_char(port, ch);
+	to_sci_port(port)->ops->poll_put_char(port, ch);
 }
 
 /*
@@ -3116,7 +3171,9 @@ static void serial_console_write(struct console *co, const char *s,
 {
 	struct sci_port *sci_port = &sci_ports[co->index];
 	struct uart_port *port = &sci_port->port;
-	unsigned short bits, ctrl, ctrl_temp;
+	const struct sci_common_regs *regs = sci_port->params->common_regs;
+	unsigned int bits;
+	u32 ctrl;
 	unsigned long flags;
 	int locked = 1;
 
@@ -3128,21 +3185,21 @@ static void serial_console_write(struct console *co, const char *s,
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
+	bits = sci_port->params->param_bits->poll_sent_bits;
+
+	while ((sci_port->ops->read_reg(port, regs->status) & bits) != bits)
 		cpu_relax();
 
 	/* restore the SCSCR */
-	sci_serial_out(port, SCSCR, ctrl);
+	sci_port->ops->write_reg(port, regs->control, ctrl);
 
 	if (locked)
 		uart_port_unlock_irqrestore(port, flags);
@@ -3275,7 +3332,6 @@ static void sci_remove(struct platform_device *dev)
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_timeout);
 }
 
-
 #define SCI_OF_DATA(type, regtype)	(void *)((type) << 16 | (regtype))
 #define SCI_OF_TYPE(data)		((unsigned long)(data) >> 16)
 #define SCI_OF_REGTYPE(data)		((unsigned long)(data) & 0xffff)
@@ -3512,6 +3568,11 @@ static int sci_probe(struct platform_device *dev)
 	}
 
 	sp = &sci_ports[dev_id];
+	sp->suspend_regs = devm_kzalloc(&dev->dev,
+					sp->ops->suspend_regs_size(),
+					GFP_KERNEL);
+	if (!sp->suspend_regs)
+		return -ENOMEM;
 
 	/*
 	 * In case:
@@ -3563,64 +3624,6 @@ static int sci_probe(struct platform_device *dev)
 	return 0;
 }
 
-static void sci_console_save(struct sci_port *s)
-{
-	struct sci_suspend_regs *regs = &s->suspend_regs;
-	struct uart_port *port = &s->port;
-
-	if (sci_getreg(port, SCDL)->size)
-		regs->scdl = sci_serial_in(port, SCDL);
-	if (sci_getreg(port, SCCKS)->size)
-		regs->sccks = sci_serial_in(port, SCCKS);
-	if (sci_getreg(port, SCSMR)->size)
-		regs->scsmr = sci_serial_in(port, SCSMR);
-	if (sci_getreg(port, SCSCR)->size)
-		regs->scscr = sci_serial_in(port, SCSCR);
-	if (sci_getreg(port, SCFCR)->size)
-		regs->scfcr = sci_serial_in(port, SCFCR);
-	if (sci_getreg(port, SCSPTR)->size)
-		regs->scsptr = sci_serial_in(port, SCSPTR);
-	if (sci_getreg(port, SCBRR)->size)
-		regs->scbrr = sci_serial_in(port, SCBRR);
-	if (sci_getreg(port, HSSRR)->size)
-		regs->hssrr = sci_serial_in(port, HSSRR);
-	if (sci_getreg(port, SCPCR)->size)
-		regs->scpcr = sci_serial_in(port, SCPCR);
-	if (sci_getreg(port, SCPDR)->size)
-		regs->scpdr = sci_serial_in(port, SCPDR);
-	if (sci_getreg(port, SEMR)->size)
-		regs->semr = sci_serial_in(port, SEMR);
-}
-
-static void sci_console_restore(struct sci_port *s)
-{
-	struct sci_suspend_regs *regs = &s->suspend_regs;
-	struct uart_port *port = &s->port;
-
-	if (sci_getreg(port, SCDL)->size)
-		sci_serial_out(port, SCDL, regs->scdl);
-	if (sci_getreg(port, SCCKS)->size)
-		sci_serial_out(port, SCCKS, regs->sccks);
-	if (sci_getreg(port, SCSMR)->size)
-		sci_serial_out(port, SCSMR, regs->scsmr);
-	if (sci_getreg(port, SCSCR)->size)
-		sci_serial_out(port, SCSCR, regs->scscr);
-	if (sci_getreg(port, SCFCR)->size)
-		sci_serial_out(port, SCFCR, regs->scfcr);
-	if (sci_getreg(port, SCSPTR)->size)
-		sci_serial_out(port, SCSPTR, regs->scsptr);
-	if (sci_getreg(port, SCBRR)->size)
-		sci_serial_out(port, SCBRR, regs->scbrr);
-	if (sci_getreg(port, HSSRR)->size)
-		sci_serial_out(port, HSSRR, regs->hssrr);
-	if (sci_getreg(port, SCPCR)->size)
-		sci_serial_out(port, SCPCR, regs->scpcr);
-	if (sci_getreg(port, SCPDR)->size)
-		sci_serial_out(port, SCPDR, regs->scpdr);
-	if (sci_getreg(port, SEMR)->size)
-		sci_serial_out(port, SEMR, regs->semr);
-}
-
 static __maybe_unused int sci_suspend(struct device *dev)
 {
 	struct sci_port *sport = dev_get_drvdata(dev);
@@ -3628,8 +3631,10 @@ static __maybe_unused int sci_suspend(struct device *dev)
 	if (sport) {
 		uart_suspend_port(&sci_uart_driver, &sport->port);
 
-		if (!console_suspend_enabled && uart_console(&sport->port))
-			sci_console_save(sport);
+		if (!console_suspend_enabled && uart_console(&sport->port)) {
+			if (sport->ops->console_save)
+				sport->ops->console_save(&sport->port);
+		}
 		else
 			return reset_control_assert(sport->rstc);
 	}
@@ -3643,7 +3648,8 @@ static __maybe_unused int sci_resume(struct device *dev)
 
 	if (sport) {
 		if (!console_suspend_enabled && uart_console(&sport->port)) {
-			sci_console_restore(sport);
+			if (sport->ops->console_restore)
+				sport->ops->console_restore(&sport->port);
 		} else {
 			int ret = reset_control_deassert(sport->rstc);
 
@@ -3707,9 +3713,11 @@ static int early_console_exit(struct console *co)
 	return 0;
 }
 
-static int __init early_console_setup(struct earlycon_device *device,
+int __init scix_early_console_setup(struct earlycon_device *device,
 				      int type)
 {
+	const struct sci_common_regs *regs;
+
 	if (!device->port.membase)
 		return -ENODEV;
 
@@ -3717,11 +3725,15 @@ static int __init early_console_setup(struct earlycon_device *device,
 	sci_ports[0].port = device->port;
 	port_cfg.type = type;
 	sci_ports[0].cfg = &port_cfg;
+	sci_ports[0].ops = &sci_port_ops;
 	sci_ports[0].params = sci_probe_regmap(&port_cfg);
 	sci_uart_earlycon = true;
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
 	device->con->exit = early_console_exit;
@@ -3731,41 +3743,41 @@ static int __init early_console_setup(struct earlycon_device *device,
 static int __init sci_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
-	return early_console_setup(device, PORT_SCI);
+	return scix_early_console_setup(device, PORT_SCI);
 }
 static int __init scif_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
-	return early_console_setup(device, PORT_SCIF);
+	return scix_early_console_setup(device, PORT_SCIF);
 }
 static int __init rzscifa_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
 	port_cfg.regtype = SCIx_RZ_SCIFA_REGTYPE;
-	return early_console_setup(device, PORT_SCIF);
+	return scix_early_console_setup(device, PORT_SCIF);
 }
 
 static int __init rzv2hscif_early_console_setup(struct earlycon_device *device,
 						const char *opt)
 {
 	port_cfg.regtype = SCIx_RZV2H_SCIF_REGTYPE;
-	return early_console_setup(device, PORT_SCIF);
+	return scix_early_console_setup(device, PORT_SCIF);
 }
 
 static int __init scifa_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
-	return early_console_setup(device, PORT_SCIFA);
+	return scix_early_console_setup(device, PORT_SCIFA);
 }
 static int __init scifb_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
-	return early_console_setup(device, PORT_SCIFB);
+	return scix_early_console_setup(device, PORT_SCIFB);
 }
 static int __init hscif_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
-	return early_console_setup(device, PORT_HSCIF);
+	return scix_early_console_setup(device, PORT_HSCIF);
 }
 
 OF_EARLYCON_DECLARE(sci, "renesas,sci", sci_early_console_setup);
diff --git a/drivers/tty/serial/sh-sci.h b/drivers/tty/serial/sh-sci.h
index 0b65563c4e9e..951681aba586 100644
--- a/drivers/tty/serial/sh-sci.h
+++ b/drivers/tty/serial/sh-sci.h
@@ -32,8 +32,6 @@ enum {
 	HSRTRGR,			/* Rx FIFO Data Count Trigger Register */
 	HSTTRGR,			/* Tx FIFO Data Count Trigger Register */
 	SEMR,				/* Serial extended mode register */
-
-	SCIx_NR_REGS,
 };
 
 
-- 
2.43.0


