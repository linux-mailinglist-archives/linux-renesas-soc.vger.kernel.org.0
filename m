Return-Path: <linux-renesas-soc+bounces-18877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D067AEC6E6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 13:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB6837AC454
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 11:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65A7253B5C;
	Sat, 28 Jun 2025 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Co55/rJT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE00724A063;
	Sat, 28 Jun 2025 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751111846; cv=none; b=sqX+4u1/tfOWnRQyo0plVJsAh8wOQzG+swRpG1KI5y+gML2ejCyPyBDlAcVtJVCoeLSdaviG58K5/C2u5tuZ69LxtLAcsTW9gUun9+fsh1okJujw8NS8JXR7VU9TIi9zVMQSDl5/qScWciSubzTsj0DTcObqBxDYIt/g6yZ8oIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751111846; c=relaxed/simple;
	bh=NVj33GGtqtNsoY5q50Y5QCy2i9xI5ZKYXt759VsiPHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JPc2rWVzDhDOnLonBwJILk50b+UxSGKc7ae0oi1E6AldTtt+2Gusi9U0QplqYWI+Yb3s4ZU3BVG00mxqlLuv6c6nZJoOf6FGrjEPiHkS7WiN5RdJEh0Dudh3npu5ATVY2b38XTP+xvnnoc3jJu4Fnck3kaP3O1jCx7MlYkkrQSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Co55/rJT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-453643020bdso26361225e9.1;
        Sat, 28 Jun 2025 04:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751111842; x=1751716642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jRY762+mddMevHXqV+MenoIZG0gyllUIhFlampiqTg=;
        b=Co55/rJT64ub2hQHHvfyr4eO9HEL0bUDbajabRHRWngkzGOsl9r/jpG3Swwm3VbqoJ
         VS0IfS2tM/lgpD2mFoQfUta6pcIPHoxet7j4aAQ+//rLA6N1RZGs5197yEdtFAjs/Fq9
         D0IAEC33W85aZ4OK+AD8OhftrL8PoS9XxvE3tj7v4dAdHLpSOOE2tzPVEJoQRQtzKyPr
         /EUpbVP72FBYak4VGBIhzuror9/+BB6A4x8GCN/1xp2dopHwsidbG9HgFVKWL05hMmkQ
         Fn78TfI3YGyj6GkwCs6AsaQuQ3XsQeYTDn5rhYJpOucL63PSKasAc474DRu1/Y762f8r
         v/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751111842; x=1751716642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jRY762+mddMevHXqV+MenoIZG0gyllUIhFlampiqTg=;
        b=Evsl3+ovR0BXHF3nK/6lIpArf4QybE8zm4v13j9TyfU5oR+pN5itb4jcdObD6sYUJX
         u695m94aA5mU1AGZH85uKzFhFgyrSMY3EhiHpSiN4kjT0n4F+rgeJp/AUJ708wsEmUI3
         QJoRxDNAedOYGDru+8xY8lp1RItfDz+dwkwqV5sUEm6E8iex0L4d17o4/pOjmI9iVKXr
         HRoZ16zfsDJwEszzeArDvRzuA5juhDO3o0bQ5B4rTn5OHGnJHrnB1BQbz1DSTaa27TCz
         kGOhCZXd8sxyhPqLtesqgBzzgNmYaeJclo9YwQkWgsMa53uNHqGhTJOOcO6eaJYIwzHq
         mjCg==
X-Forwarded-Encrypted: i=1; AJvYcCWj3rUUc2WlNBJLzFyWNkpy8es1h4kQ/+mV7y3VXyccRsf82fmDQJHcnuP+SQOn+8FDRfJbNwijFTMDChRb@vger.kernel.org, AJvYcCWxLp2UMsUzhhY/r4mXXvMPUmkbJYMAXTQDHar9/ix7m/FubvsXdwyDUV99VdAIZgFrTFiLqfYHp/WR@vger.kernel.org, AJvYcCWyS2n3WOhuPAOAp2D6y3dSxUusKJsSA9mYkDpXL/lPQHisT+GPsSFAQF+6QVKR/A7L6xHaJvx+QXFsvX5WAF0/voQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYbI7FAjkcPymZeG+k/2IVlq1nFaT5yozq7JtBBtln19Pd1jji
	K1WVLA4Zoyiielc36pyAo5Ny/KrvnPDvu6Yv/fITg7RP5Js+bW8TbD3d
X-Gm-Gg: ASbGncv9uVU60WSrv/wKp0dgCfWfNjyFq44RvSJzSzEzJ0N0gFq76MObT4zcghlCj3k
	CjWenPrW/kVLXYtyr5zMlU+DJd9E+5GPM1sIe+aXchio7ccOElJyYOuKNn/AEYWLFC3SWh4iMcj
	GD+OrZrMDX133renrDXnoXd8g2qfqsYQzCPLoQWLWuNlGpi8xaIEtFH3qY2rMls2EmxhHL93mql
	bYP/y8zt9QOI8f+ovV1bwDRel1rwEsQSWuCAgpSc2yfkBjPH7dAoHU7ecl+XZDYqRjoOGBqfp+a
	GspmZ7XXg0mKWOp+/e2iTtfBcALlCNj5t+dsZNcJ/moqEKUIaTlA8zzra5pyoeu0WTFuYLOzjb5
	DjpVO1FBw5GwxWEgA0YAB
X-Google-Smtp-Source: AGHT+IFnQszQuMXXj4LRtHpeK/0BEi4QaYtX0di12sKq+z8xv6GpqMApsavO100OXSxjllQFPPG3Nw==
X-Received: by 2002:a05:600c:4f95:b0:453:23fe:ca86 with SMTP id 5b1f17b1804b1-4538ee50438mr73315585e9.4.1751111841792;
        Sat, 28 Jun 2025 04:57:21 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:dca0:b0f1:f055:ea37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7310sm5247818f8f.18.2025.06.28.04.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 04:57:20 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v13 4/5] serial: sh-sci: Use private port ID
Date: Sat, 28 Jun 2025 12:57:14 +0100
Message-ID: <20250628115715.102338-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250628115715.102338-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250628115715.102338-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

New port types cannot be added in serial_core.h, which is shared with
userspace.
In order to support new port types, the coming new ones will have
BIT(7) set in the id value, and in this case, uartport->type is
set to PORT_GENERIC.
This commit therefore changes all the places where the port type is
read, by not relying on uartport->type but on the private
value stored in struct sci_port.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v12-> v13:
- Fixed checkpatch warnings.
---
 drivers/tty/serial/sh-sci-common.h |   3 +
 drivers/tty/serial/sh-sci.c        | 161 ++++++++++++++++-------------
 2 files changed, 93 insertions(+), 71 deletions(-)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index bd9d9cfac1c8..fcddf66780c9 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -142,6 +142,9 @@ struct sci_port {
 	int				rx_fifo_timeout;
 	u16				hscif_tot;
 
+	u8				type;
+	u8				regtype;
+
 	const struct sci_port_ops *ops;
 
 	bool has_rtscts;
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 5c4283ce542d..26536ff2eda1 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -75,6 +75,8 @@
 
 #define SCI_NPORTS CONFIG_SERIAL_SH_SCI_NR_UARTS
 
+#define SCI_PUBLIC_PORT_ID(port) (((port) & BIT(7)) ? PORT_GENERIC : (port))
+
 static struct sci_port sci_ports[SCI_NPORTS];
 static unsigned long sci_ports_in_use;
 static struct uart_driver sci_uart_driver;
@@ -580,7 +582,7 @@ static void sci_start_tx(struct uart_port *port)
 	unsigned short ctrl;
 
 #ifdef CONFIG_SERIAL_SH_SCI_DMA
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB) {
 		u16 new, scr = sci_serial_in(port, SCSCR);
 		if (s->chan_tx)
 			new = scr | SCSCR_TDRQE;
@@ -592,7 +594,7 @@ static void sci_start_tx(struct uart_port *port)
 
 	if (s->chan_tx && !kfifo_is_empty(&port->state->port.xmit_fifo) &&
 	    dma_submit_error(s->cookie_tx)) {
-		if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
+		if (s->regtype == SCIx_RZ_SCIFA_REGTYPE)
 			/* Switch irq from SCIF to DMA */
 			disable_irq_nosync(s->irqs[SCIx_TXI_IRQ]);
 
@@ -601,8 +603,8 @@ static void sci_start_tx(struct uart_port *port)
 	}
 #endif
 
-	if (!s->chan_tx || s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE ||
-	    port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+	if (!s->chan_tx || s->regtype == SCIx_RZ_SCIFA_REGTYPE ||
+	    s->type == PORT_SCIFA || s->type == PORT_SCIFB) {
 		/* Set TIE (Transmit Interrupt Enable) bit in SCSCR */
 		ctrl = sci_serial_in(port, SCSCR);
 
@@ -611,7 +613,7 @@ static void sci_start_tx(struct uart_port *port)
 		 * (transmit interrupt enable) or in the same instruction to start
 		 * the transmit process.
 		 */
-		if (port->type == PORT_SCI)
+		if (s->type == PORT_SCI)
 			ctrl |= SCSCR_TE;
 
 		sci_serial_out(port, SCSCR, ctrl | SCSCR_TIE);
@@ -620,12 +622,13 @@ static void sci_start_tx(struct uart_port *port)
 
 static void sci_stop_tx(struct uart_port *port)
 {
+	struct sci_port *s = to_sci_port(port);
 	unsigned short ctrl;
 
 	/* Clear TIE (Transmit Interrupt Enable) bit in SCSCR */
 	ctrl = sci_serial_in(port, SCSCR);
 
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB)
 		ctrl &= ~SCSCR_TDRQE;
 
 	ctrl &= ~SCSCR_TIE;
@@ -633,21 +636,22 @@ static void sci_stop_tx(struct uart_port *port)
 	sci_serial_out(port, SCSCR, ctrl);
 
 #ifdef CONFIG_SERIAL_SH_SCI_DMA
-	if (to_sci_port(port)->chan_tx &&
-	    !dma_submit_error(to_sci_port(port)->cookie_tx)) {
-		dmaengine_terminate_async(to_sci_port(port)->chan_tx);
-		to_sci_port(port)->cookie_tx = -EINVAL;
+	if (s->chan_tx &&
+	    !dma_submit_error(s->cookie_tx)) {
+		dmaengine_terminate_async(s->chan_tx);
+		s->cookie_tx = -EINVAL;
 	}
 #endif
 }
 
 static void sci_start_rx(struct uart_port *port)
 {
+	struct sci_port *s = to_sci_port(port);
 	unsigned short ctrl;
 
 	ctrl = sci_serial_in(port, SCSCR) | port_rx_irq_mask(port);
 
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB)
 		ctrl &= ~SCSCR_RDRQE;
 
 	sci_serial_out(port, SCSCR, ctrl);
@@ -655,11 +659,12 @@ static void sci_start_rx(struct uart_port *port)
 
 static void sci_stop_rx(struct uart_port *port)
 {
+	struct sci_port *s = to_sci_port(port);
 	unsigned short ctrl;
 
 	ctrl = sci_serial_in(port, SCSCR);
 
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB)
 		ctrl &= ~SCSCR_RDRQE;
 
 	ctrl &= ~port_rx_irq_mask(port);
@@ -669,10 +674,12 @@ static void sci_stop_rx(struct uart_port *port)
 
 static void sci_clear_SCxSR(struct uart_port *port, unsigned int mask)
 {
-	if (port->type == PORT_SCI) {
+	struct sci_port *s = to_sci_port(port);
+
+	if (s->type == PORT_SCI) {
 		/* Just store the mask */
 		sci_serial_out(port, SCxSR, mask);
-	} else if (to_sci_port(port)->params->overrun_mask == SCIFA_ORER) {
+	} else if (s->params->overrun_mask == SCIFA_ORER) {
 		/* SCIFA/SCIFB and SCIF on SH7705/SH7720/SH7721 */
 		/* Only clear the status bits we want to clear */
 		sci_serial_out(port, SCxSR, sci_serial_in(port, SCxSR) & mask);
@@ -742,13 +749,13 @@ static void sci_init_pins(struct uart_port *port, unsigned int cflag)
 		return;
 	}
 
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB) {
 		u16 data = sci_serial_in(port, SCPDR);
 		u16 ctrl = sci_serial_in(port, SCPCR);
 
 		/* Enable RXD and TXD pin functions */
 		ctrl &= ~(SCPCR_RXDC | SCPCR_TXDC);
-		if (to_sci_port(port)->has_rtscts) {
+		if (s->has_rtscts) {
 			/* RTS# is output, active low, unless autorts */
 			if (!(port->mctrl & TIOCM_RTS)) {
 				ctrl |= SCPCR_RTSC;
@@ -765,7 +772,7 @@ static void sci_init_pins(struct uart_port *port, unsigned int cflag)
 		}
 		sci_serial_out(port, SCPDR, data);
 		sci_serial_out(port, SCPCR, ctrl);
-	} else if (sci_getreg(port, SCSPTR)->size && s->cfg->regtype != SCIx_RZV2H_SCIF_REGTYPE) {
+	} else if (sci_getreg(port, SCSPTR)->size && s->regtype != SCIx_RZV2H_SCIF_REGTYPE) {
 		u16 status = sci_serial_in(port, SCSPTR);
 
 		/* RTS# is always output; and active low, unless autorts */
@@ -852,8 +859,8 @@ static void sci_transmit_chars(struct uart_port *port)
 			c = port->x_char;
 			port->x_char = 0;
 		} else if (stopped || !kfifo_get(&tport->xmit_fifo, &c)) {
-			if (port->type == PORT_SCI &&
-				   kfifo_is_empty(&tport->xmit_fifo)) {
+			if (s->type == PORT_SCI &&
+			    kfifo_is_empty(&tport->xmit_fifo)) {
 				ctrl = sci_serial_in(port, SCSCR);
 				ctrl &= ~SCSCR_TE;
 				sci_serial_out(port, SCSCR, ctrl);
@@ -873,7 +880,7 @@ static void sci_transmit_chars(struct uart_port *port)
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
 	if (kfifo_is_empty(&tport->xmit_fifo)) {
-		if (port->type == PORT_SCI) {
+		if (s->type == PORT_SCI) {
 			ctrl = sci_serial_in(port, SCSCR);
 			ctrl &= ~SCSCR_TIE;
 			ctrl |= SCSCR_TEIE;
@@ -904,7 +911,7 @@ static void sci_receive_chars(struct uart_port *port)
 		if (count == 0)
 			break;
 
-		if (port->type == PORT_SCI) {
+		if (s->type == PORT_SCI) {
 			char c = sci_serial_in(port, SCxRDR);
 			if (uart_handle_sysrq_char(port, c))
 				count = 0;
@@ -914,8 +921,8 @@ static void sci_receive_chars(struct uart_port *port)
 			for (i = 0; i < count; i++) {
 				char c;
 
-				if (port->type == PORT_SCIF ||
-				    port->type == PORT_HSCIF) {
+				if (s->type == PORT_SCIF ||
+				    s->type == PORT_HSCIF) {
 					status = sci_serial_in(port, SCxSR);
 					c = sci_serial_in(port, SCxRDR);
 				} else {
@@ -1052,6 +1059,7 @@ static int sci_handle_breaks(struct uart_port *port)
 
 static int scif_set_rtrg(struct uart_port *port, int rx_trig)
 {
+	struct sci_port *s = to_sci_port(port);
 	unsigned int bits;
 
 	if (rx_trig >= port->fifosize)
@@ -1065,7 +1073,7 @@ static int scif_set_rtrg(struct uart_port *port, int rx_trig)
 		return rx_trig;
 	}
 
-	switch (port->type) {
+	switch (s->type) {
 	case PORT_SCIF:
 		if (rx_trig < 4) {
 			bits = 0;
@@ -1150,7 +1158,7 @@ static ssize_t rx_fifo_trigger_store(struct device *dev,
 		return ret;
 
 	sci->rx_trigger = sci->ops->set_rtrg(port, r);
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
+	if (sci->type == PORT_SCIFA || sci->type == PORT_SCIFB)
 		sci->ops->set_rtrg(port, 1);
 
 	return count;
@@ -1166,7 +1174,7 @@ static ssize_t rx_fifo_timeout_show(struct device *dev,
 	struct sci_port *sci = to_sci_port(port);
 	int v;
 
-	if (port->type == PORT_HSCIF)
+	if (sci->type == PORT_HSCIF)
 		v = sci->hscif_tot >> HSSCR_TOT_SHIFT;
 	else
 		v = sci->rx_fifo_timeout;
@@ -1188,7 +1196,7 @@ static ssize_t rx_fifo_timeout_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (port->type == PORT_HSCIF) {
+	if (sci->type == PORT_HSCIF) {
 		if (r < 0 || r > 3)
 			return -EINVAL;
 		sci->hscif_tot = r << HSSCR_TOT_SHIFT;
@@ -1229,11 +1237,11 @@ static void sci_dma_tx_complete(void *arg)
 		schedule_work(&s->work_tx);
 	} else {
 		s->cookie_tx = -EINVAL;
-		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
-		    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
+		if (s->type == PORT_SCIFA || s->type == PORT_SCIFB ||
+		    s->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 			u16 ctrl = sci_serial_in(port, SCSCR);
 			sci_serial_out(port, SCSCR, ctrl & ~SCSCR_TIE);
-			if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
+			if (s->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 				/* Switch irq from DMA to SCIF */
 				dmaengine_pause(s->chan_tx_saved);
 				enable_irq(s->irqs[SCIx_TXI_IRQ]);
@@ -1315,10 +1323,10 @@ static void sci_dma_rx_reenable_irq(struct sci_port *s)
 
 	/* Direct new serial port interrupts back to CPU */
 	scr = sci_serial_in(port, SCSCR);
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
-	    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB ||
+	    s->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 		enable_irq(s->irqs[SCIx_RXI_IRQ]);
-		if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
+		if (s->regtype == SCIx_RZ_SCIFA_REGTYPE)
 			s->ops->set_rtrg(port, s->rx_trigger);
 		else
 			scr &= ~SCSCR_RDRQE;
@@ -1558,8 +1566,8 @@ static enum hrtimer_restart sci_dma_rx_timer_fn(struct hrtimer *t)
 			tty_flip_buffer_push(&port->state->port);
 	}
 
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
-	    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB ||
+	    s->regtype == SCIx_RZ_SCIFA_REGTYPE)
 		sci_dma_rx_submit(s, true);
 
 	sci_dma_rx_reenable_irq(s);
@@ -1682,8 +1690,8 @@ static void sci_request_dma(struct uart_port *port)
 
 		s->chan_rx_saved = s->chan_rx = chan;
 
-		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
-		    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
+		if (s->type == PORT_SCIFA || s->type == PORT_SCIFB ||
+		    s->regtype == SCIx_RZ_SCIFA_REGTYPE)
 			sci_dma_rx_submit(s, false);
 	}
 }
@@ -1753,10 +1761,10 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 		u16 ssr = sci_serial_in(port, SCxSR);
 
 		/* Disable future Rx interrupts */
-		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
-		    s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
+		if (s->type == PORT_SCIFA || s->type == PORT_SCIFB ||
+		    s->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 			disable_irq_nosync(s->irqs[SCIx_RXI_IRQ]);
-			if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
+			if (s->regtype == SCIx_RZ_SCIFA_REGTYPE) {
 				s->ops->set_rtrg(port, 1);
 				scr |= SCSCR_RIE;
 			} else {
@@ -1820,7 +1828,7 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 	unsigned long flags;
 	u32 ctrl;
 
-	if (port->type != PORT_SCI)
+	if (s->type != PORT_SCI)
 		return sci_tx_interrupt(irq, ptr);
 
 	uart_port_lock_irqsave(port, &flags);
@@ -1867,7 +1875,7 @@ static irqreturn_t sci_er_interrupt(int irq, void *ptr)
 	}
 
 	/* Handle errors */
-	if (port->type == PORT_SCI) {
+	if (s->type == PORT_SCI) {
 		if (sci_handle_errors(port)) {
 			/* discard character in rx buffer */
 			sci_serial_in(port, SCxSR);
@@ -2091,7 +2099,9 @@ static unsigned int sci_tx_empty(struct uart_port *port)
 
 static void sci_set_rts(struct uart_port *port, bool state)
 {
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+	struct sci_port *s = to_sci_port(port);
+
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB) {
 		u16 data = sci_serial_in(port, SCPDR);
 
 		/* Active low */
@@ -2118,7 +2128,9 @@ static void sci_set_rts(struct uart_port *port, bool state)
 
 static bool sci_get_cts(struct uart_port *port)
 {
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+	struct sci_port *s = to_sci_port(port);
+
+	if (s->type == PORT_SCIFA || s->type == PORT_SCIFB) {
 		/* Active low */
 		return !(sci_serial_in(port, SCPDR) & SCPDR_CTSD);
 	} else if (sci_getreg(port, SCSPTR)->size) {
@@ -2164,21 +2176,21 @@ static void sci_set_mctrl(struct uart_port *port, unsigned int mctrl)
 
 	if (!(mctrl & TIOCM_RTS)) {
 		/* Disable Auto RTS */
-		if (s->cfg->regtype != SCIx_RZV2H_SCIF_REGTYPE)
+		if (s->regtype != SCIx_RZV2H_SCIF_REGTYPE)
 			sci_serial_out(port, SCFCR,
 				       sci_serial_in(port, SCFCR) & ~SCFCR_MCE);
 
 		/* Clear RTS */
 		sci_set_rts(port, 0);
 	} else if (s->autorts) {
-		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+		if (s->type == PORT_SCIFA || s->type == PORT_SCIFB) {
 			/* Enable RTS# pin function */
 			sci_serial_out(port, SCPCR,
 				sci_serial_in(port, SCPCR) & ~SCPCR_RTSC);
 		}
 
 		/* Enable Auto RTS */
-		if (s->cfg->regtype != SCIx_RZV2H_SCIF_REGTYPE)
+		if (s->regtype != SCIx_RZV2H_SCIF_REGTYPE)
 			sci_serial_out(port, SCFCR,
 				       sci_serial_in(port, SCFCR) | SCFCR_MCE);
 	} else {
@@ -2315,7 +2327,7 @@ static int sci_sck_calc(struct sci_port *s, unsigned int bps,
 	int err, min_err = INT_MAX;
 	unsigned int sr;
 
-	if (s->port.type != PORT_HSCIF)
+	if (s->type != PORT_HSCIF)
 		freq *= 2;
 
 	for_each_sr(sr, s) {
@@ -2342,7 +2354,7 @@ static int sci_brg_calc(struct sci_port *s, unsigned int bps,
 	int err, min_err = INT_MAX;
 	unsigned int sr, dl;
 
-	if (s->port.type != PORT_HSCIF)
+	if (s->type != PORT_HSCIF)
 		freq *= 2;
 
 	for_each_sr(sr, s) {
@@ -2375,7 +2387,7 @@ static int sci_scbrr_calc(struct sci_port *s, unsigned int bps,
 	unsigned int sr, br, prediv, scrate, c;
 	int err, min_err = INT_MAX;
 
-	if (s->port.type != PORT_HSCIF)
+	if (s->type != PORT_HSCIF)
 		freq *= 2;
 
 	/*
@@ -2460,8 +2472,8 @@ static void sci_reset(struct uart_port *port)
 			s->ops->set_rtrg(port, 1);
 			timer_setup(&s->rx_fifo_timer, rx_fifo_timer_fn, 0);
 		} else {
-			if (port->type == PORT_SCIFA ||
-			    port->type == PORT_SCIFB)
+			if (s->type == PORT_SCIFA ||
+			    s->type == PORT_SCIFB)
 				s->ops->set_rtrg(port, 1);
 			else
 				s->ops->set_rtrg(port, s->rx_trigger);
@@ -2521,8 +2533,8 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 	 */
 
 	/* Optional Undivided External Clock */
-	if (s->clk_rates[SCI_SCK] && port->type != PORT_SCIFA &&
-	    port->type != PORT_SCIFB) {
+	if (s->clk_rates[SCI_SCK] && s->type != PORT_SCIFA &&
+	    s->type != PORT_SCIFB) {
 		err = sci_sck_calc(s, baud, &srr1);
 		if (abs(err) < abs(min_err)) {
 			best_clk = SCI_SCK;
@@ -2607,7 +2619,7 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 		sci_serial_out(port, SEMR, 0);
 
 	if (best_clk >= 0) {
-		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
+		if (s->type == PORT_SCIFA || s->type == PORT_SCIFB)
 			switch (srr + 1) {
 			case 5:  smr_val |= SCSMR_SRC_5;  break;
 			case 7:  smr_val |= SCSMR_SRC_7;  break;
@@ -2692,12 +2704,12 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 	 * (transmit interrupt enable) or in the same instruction to
 	 * start the transmitting process. So skip setting TE here for SCI.
 	 */
-	if (port->type != PORT_SCI)
+	if (s->type != PORT_SCI)
 		scr_val |= SCSCR_TE;
 	scr_val |= SCSCR_RE | (s->cfg->scscr & ~(SCSCR_CKE1 | SCSCR_CKE0));
 	sci_serial_out(port, SCSCR, scr_val | s->hscif_tot);
 	if ((srr + 1 == 5) &&
-	    (port->type == PORT_SCIFA || port->type == PORT_SCIFB)) {
+	    (s->type == PORT_SCIFA || s->type == PORT_SCIFB)) {
 		/*
 		 * In asynchronous mode, when the sampling rate is 1/5, first
 		 * received data may become invalid on some SCIFA and SCIFB.
@@ -2741,7 +2753,9 @@ void sci_pm(struct uart_port *port, unsigned int state,
 
 static const char *sci_type(struct uart_port *port)
 {
-	switch (port->type) {
+	struct sci_port *s = to_sci_port(port);
+
+	switch (s->type) {
 	case PORT_IRDA:
 		return "irda";
 	case PORT_SCI:
@@ -2825,8 +2839,7 @@ void sci_config_port(struct uart_port *port, int flags)
 {
 	if (flags & UART_CONFIG_TYPE) {
 		struct sci_port *sport = to_sci_port(port);
-
-		port->type = sport->cfg->type;
+		port->type = SCI_PUBLIC_PORT_ID(sport->type);
 		sci_request_port(port);
 	}
 }
@@ -2964,7 +2977,7 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 	struct clk *clk;
 	unsigned int i;
 
-	if (sci_port->cfg->type == PORT_HSCIF)
+	if (sci_port->type == PORT_HSCIF)
 		clk_names[SCI_SCK] = "hsck";
 
 	for (i = 0; i < SCI_NUM_CLKS; i++) {
@@ -3050,6 +3063,9 @@ static int sci_init_single(struct platform_device *dev,
 
 	sci_port->cfg	= p;
 
+	sci_port->type	= p->type;
+	sci_port->regtype = p->regtype;
+
 	port->iotype	= UPIO_MEM;
 	port->line	= index;
 	port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_SH_SCI_CONSOLE);
@@ -3128,11 +3144,11 @@ static int sci_init_single(struct platform_device *dev,
 			return ret;
 	}
 
-	port->type		= p->type;
+	port->type		= SCI_PUBLIC_PORT_ID(p->type);
 	port->flags		= UPF_FIXED_PORT | UPF_BOOT_AUTOCONF | p->flags;
 	port->fifosize		= sci_port->params->fifosize;
 
-	if (port->type == PORT_SCI && !dev->dev.of_node) {
+	if (p->type == PORT_SCI && !dev->dev.of_node) {
 		if (sci_port->reg_size >= 0x20)
 			port->regshift = 2;
 		else
@@ -3322,13 +3338,13 @@ static struct uart_driver sci_uart_driver = {
 
 static void sci_remove(struct platform_device *dev)
 {
-	struct sci_port *port = platform_get_drvdata(dev);
-	unsigned int type = port->port.type;	/* uart_remove_... clears it */
+	struct sci_port *s = platform_get_drvdata(dev);
+	unsigned int type = s->type;	/* uart_remove_... clears it */
 
-	sci_ports_in_use &= ~BIT(port->port.line);
-	uart_remove_one_port(&sci_uart_driver, &port->port);
+	sci_ports_in_use &= ~BIT(s->port.line);
+	uart_remove_one_port(&sci_uart_driver, &s->port);
 
-	if (port->port.fifosize > 1)
+	if (s->port.fifosize > 1)
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_trigger);
 	if (type == PORT_SCIFA || type == PORT_SCIFB || type == PORT_HSCIF)
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_timeout);
@@ -3682,8 +3698,8 @@ static int sci_probe(struct platform_device *dev)
 		if (ret)
 			return ret;
 	}
-	if (sp->port.type == PORT_SCIFA || sp->port.type == PORT_SCIFB ||
-	    sp->port.type == PORT_HSCIF) {
+	if (sp->type == PORT_SCIFA || sp->type == PORT_SCIFB ||
+	    sp->type == PORT_HSCIF) {
 		ret = device_create_file(&dev->dev, &dev_attr_rx_fifo_timeout);
 		if (ret) {
 			if (sp->port.fifosize > 1) {
@@ -3799,8 +3815,11 @@ int __init scix_early_console_setup(struct earlycon_device *device,
 	if (!device->port.membase)
 		return -ENODEV;
 
-	device->port.type = data->type;
+	device->port.type = SCI_PUBLIC_PORT_ID(data->type);
+
 	sci_ports[0].port = device->port;
+	sci_ports[0].type = data->type;
+	sci_ports[0].regtype = data->regtype;
 
 	port_cfg.type = data->type;
 	port_cfg.regtype = data->regtype;
-- 
2.49.0


