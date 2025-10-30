Return-Path: <linux-renesas-soc+bounces-23922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 914FFC21978
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33FCC404611
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 17:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254E4375725;
	Thu, 30 Oct 2025 17:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5+BnbTK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625BE36CA90
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761846942; cv=none; b=Z83emCkBzzCkuN0+1jhZdOUY8XHekrhpb100ujXFD8aMEZQAqIizQ8F2Ra1t9cy780+1gl5CVt3RVtDziFJOVPi8dfetMs60mtNV05xrbLBuXJc4w7caiUL/txyvGwvkLlKmxNXjdUra05AlD1eoFmemeDMXFXx0usFQWZvmHPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761846942; c=relaxed/simple;
	bh=l69I5xmyhHro4KhUO/PVpo4RcLcYevtDC9A8q7K0wyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNOYyyo2+SVcWifvT5rHWafj+RVN1khYERhCTyunWEquBOcPPMN3NIFnf7jNgdgYl+rAhG1xPCtgSomZq1LCdZjNKcDm18P69GGfS4fzCt5QRGnYyiLNKVfXEUyCZhSVL8gYBmXzQ+xwq1CyeMMgqgxNKg5RhOMPH3yOfCp2DHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5+BnbTK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4711810948aso10718665e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761846936; x=1762451736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Edvdlqy9JPFDf6Wc3Jobmq+A9++TT7Am/KBqXa8adZg=;
        b=M5+BnbTKRPxR/DiZagiMEuXXjTRe3HqJ3hCTCxgM11nRxIo4osvlw5DnhtA5AdPGQS
         60pzUrmdwez1+Xx8GfG++gOx1OflgfNKCj0ecqjCbyuK2LCXhmiU/SQmpL3jFwBu6bdn
         gP3X33zuqFHFU6JOnb3TIw/V4cffGcAq/sJGknwEYAmgwYvxL3m3CwJE+FBjDLGa8lY0
         wlyY5X1JxEJ5BnP179K4jY4CEfbkUzMPHqOdiflqiNQRGM5IEQh/d8EPN4QYpHOQNveI
         0c+ppbUtSfL949A8nHwbonQV4UAD8Db+GrbixLLIAZTLGPZLYiJGNob4U3BLN0N4jMoz
         kROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761846936; x=1762451736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Edvdlqy9JPFDf6Wc3Jobmq+A9++TT7Am/KBqXa8adZg=;
        b=hvcUj24+ArXPsWb5h6j05jEq7Xh6RTVfhSqRr/FnlriURZSGErYJiQwwQ8xBZ/FfOV
         ev3h+QF/Njh/3G+r0xBhD6stdwn/ZjvcWcjSwrf0Ig9qy7eiiFaCxackFxNl1vkmLMgq
         Tlrh1dzyBn9DrwlLQiQfQ3Bgd5mwcYCv6V4eTlqUXJPeWKhoAK0Yz9a20AnSki5HF8D1
         kFY4ojsyVpA5FUGRqHS4B1O4XAxk5HnzbMr17xo6KlsQMVU60MdXX6hMxD2R52mDpEW3
         f5UTaCF1Oz/On0xKbP8BZUWq7ilYLKGCjE1I3vLhSivsf452u7ZO1rHrGD32xQ6h0q2L
         07Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUf2XVCVCZqZsr2YSQ/DLSwloB6Hg+VKelesD5JeWJRiak0akZyySuXX5yn5ZJApNn6sC7OpxK4+0lck4WpBNPM+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6fc1FE4vQ55RneOJ1JRHg8E8JnnIHJf+vtTvzHuZ23NbEs9dS
	oZCQNa524k+ONdj21pfrhEn2nDBvVvzH/pgpR0yyrjtNaa5U7WQUof9a
X-Gm-Gg: ASbGncv+L8LXAwjKOnzMXzEsQwSFBvADbH9mxjk+WErkVMLWPKPIHgTJlT8wRoGo16i
	WJIzzHccl6PrgfR3xhE5krkb/DJXcHjr/jqjlcRAGMdPxDGY1HsD771HGx7rm073yLOMbymI7I7
	lWoBP/p+i5MZNapHEkzs8zDMaFuF15Rkat9IS/AyaA2hNZuz7DkjO57KeOvWaYVw4ACYn83HJ22
	P+SUYIHQthtsLM+/UrOROtV6MnxkAAXYDFGu+s8t+l8uot5mcUkAfzwunPocgrTRmDHmeyE3db4
	bhGiY9PiiJwPRWw7oEg03WFW3I033zL0tpN/5/clUFr/1De8TvpJoVJ65eIrPK9vIFAM/Vy4cwP
	hZaceqqG7ludvN2uMWC5shxKmkN7ObJ8MC6G3O+xCTp4u8R8FHry5tTJ1nmdfDrR0I+e7qxzeOS
	tyqod1l+LQxBBy3d/180vOh/CRKJKgV7GHu0u9Tvd3PNCWc9EpgJLY+oDbatUR
X-Google-Smtp-Source: AGHT+IHZ4v4xyt6n2fCbsMqLzZeV3M66YmvJIYue7LBx5q08PgWSkNP33rl4YSupEamRgrRJ3iz7yg==
X-Received: by 2002:a05:600c:3511:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-4773089021cmr6614515e9.29.1761846935276;
        Thu, 30 Oct 2025 10:55:35 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm33384041f8f.38.2025.10.30.10.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:55:35 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: 
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 13/13] serial: sh-sci: Add support for RZ/G3E RSCI SCI Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
Date: Thu, 30 Oct 2025 17:55:17 +0000
Message-ID: <20251030175526.607006-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
References: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for RZ/G3E RSCI SCI(a.k.a non FIFO mode).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/tty/serial/rsci.c   | 138 +++++++++++++++++++++++++-----------
 drivers/tty/serial/rsci.h   |   1 +
 drivers/tty/serial/sh-sci.c |   4 ++
 3 files changed, 103 insertions(+), 40 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index a3e216c05b76..43a381e5eace 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -161,8 +161,11 @@ static void rsci_serial_out(struct uart_port *p, int offset, int value)
 
 static void rsci_clear_DRxC(struct uart_port *port)
 {
+	struct sci_port *s = to_sci_port(port);
+
 	rsci_serial_out(port, CFCLR, CFCLR_RDRFC);
-	rsci_serial_out(port, FFCLR, FFCLR_DRC);
+	if (s->type != RSCI_PORT_SCI)
+		rsci_serial_out(port, FFCLR, FFCLR_DRC);
 }
 
 static void rsci_clear_SCxSR(struct uart_port *port, unsigned int mask)
@@ -229,7 +232,6 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 	unsigned long max_freq = 0;
 	unsigned int baud, i;
 	unsigned long flags;
-	unsigned int ctrl;
 	int best_clk = -1;
 
 	if ((termios->c_cflag & CSIZE) == CS7) {
@@ -294,7 +296,11 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 
 	rsci_serial_out(port, CCR0, ccr0_val);
 
-	ccr3_val |= CCR3_FM;
+	if (s->type == RSCI_PORT_SCI)
+		ccr3_val |= CCR3_RXDESEL;
+	else
+		ccr3_val |= CCR3_FM;
+
 	rsci_serial_out(port, CCR3, ccr3_val);
 
 	ccr2_val |= (cks << 20) | (brr << 8);
@@ -303,12 +309,16 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 	rsci_serial_out(port, CCR1, ccr1_val);
 	rsci_serial_out(port, CCR4, ccr4_val);
 
-	ctrl = rsci_serial_in(port, FCR);
-	ctrl |= (FCR_RFRST | FCR_TFRST);
-	rsci_serial_out(port, FCR, ctrl);
+	if (s->type != RSCI_PORT_SCI) {
+		unsigned int ctrl;
 
-	if (s->rx_trigger > 1)
-		rsci_scif_set_rtrg(port, s->rx_trigger);
+		ctrl = rsci_serial_in(port, FCR);
+		ctrl |= (FCR_RFRST | FCR_TFRST);
+		rsci_serial_out(port, FCR, ctrl);
+
+		if (s->rx_trigger > 1)
+			rsci_scif_set_rtrg(port, s->rx_trigger);
+	}
 
 	port->status &= ~UPSTAT_AUTOCTS;
 	s->autorts = false;
@@ -320,7 +330,8 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 
 	rsci_init_pins(port, termios->c_cflag);
 	rsci_serial_out(port, CFCLR, CFCLR_CLRFLAG);
-	rsci_serial_out(port, FFCLR, FFCLR_DRC);
+	if (s->type != RSCI_PORT_SCI)
+		rsci_serial_out(port, FFCLR, FFCLR_DRC);
 
 	ccr0_val |= CCR0_RE;
 	rsci_serial_out(port, CCR0, ccr0_val);
@@ -337,12 +348,23 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 
 static int rsci_txfill(struct uart_port *port)
 {
-	return rsci_serial_in(port, FTSR);
+	struct sci_port *s = to_sci_port(port);
+
+	if (s->type == RSCI_PORT_SCI)
+		return !(rsci_serial_in(port, CSR) & CSR_TDRE);
+	else
+		return rsci_serial_in(port, FTSR);
 }
 
 static int rsci_rxfill(struct uart_port *port)
 {
-	u32 val = rsci_serial_in(port, FRSR);
+	struct sci_port *s = to_sci_port(port);
+	u32 val;
+
+	if (s->type == RSCI_PORT_SCI)
+		return (rsci_serial_in(port, CSR) & CSR_RDRF) != 0;
+
+	val = rsci_serial_in(port, FRSR);
 
 	return FIELD_GET(FRSR_R5_0, val);
 }
@@ -357,7 +379,9 @@ static unsigned int rsci_tx_empty(struct uart_port *port)
 
 static void rsci_set_mctrl(struct uart_port *port, unsigned int mctrl)
 {
-	if (mctrl & TIOCM_LOOP) {
+	struct sci_port *s = to_sci_port(port);
+
+	if ((mctrl & TIOCM_LOOP) && s->type != RSCI_PORT_SCI) {
 		/* Standard loopback mode */
 		rsci_serial_out(port, CCR1, rsci_serial_in(port, CCR1) | CCR1_SPLP);
 	}
@@ -478,12 +502,13 @@ static void rsci_transmit_chars(struct uart_port *port)
 static void rsci_receive_chars(struct uart_port *port)
 {
 	struct tty_port *tport = &port->state->port;
+	struct sci_port *s = to_sci_port(port);
 	u32 rdat, status, frsr_status = 0;
 	int i, count, copied = 0;
 	unsigned char flag;
 
 	status = rsci_serial_in(port, CSR);
-	frsr_status = rsci_serial_in(port, FRSR);
+	frsr_status = (s->type == RSCI_PORT_SCI) ? 0 : rsci_serial_in(port, FRSR);
 
 	if (!(status & CSR_RDRF) && !(frsr_status & FRSR_DR))
 		return;
@@ -496,34 +521,40 @@ static void rsci_receive_chars(struct uart_port *port)
 		if (count == 0)
 			break;
 
-		for (i = 0; i < count; i++) {
-			char c;
-
-			rdat = rsci_serial_in(port, RDR);
-			/* 9-bits data is not supported yet */
-			c = rdat & RDR_RDAT_MSK;
-
-			if (uart_handle_sysrq_char(port, c)) {
-				count--;
-				i--;
-				continue;
-			}
-
-			/*
-			 * Store data and status.
-			 * Non FIFO mode is not supported
-			 */
-			if (rdat & RDR_FFER) {
-				flag = TTY_FRAME;
-				port->icount.frame++;
-			} else if (rdat & RDR_FPER) {
-				flag = TTY_PARITY;
-				port->icount.parity++;
-			} else {
-				flag = TTY_NORMAL;
+		if (s->type == RSCI_PORT_SCI) {
+			char c = rsci_serial_in(port, RDR) & RDR_RDAT_MSK;
+
+			if (uart_handle_sysrq_char(port, c))
+				count = 0;
+			else
+				tty_insert_flip_char(tport, c, TTY_NORMAL);
+		} else {
+			for (i = 0; i < count; i++) {
+				char c;
+
+				rdat = rsci_serial_in(port, RDR);
+				/* 9-bits data is not supported yet */
+				c = rdat & RDR_RDAT_MSK;
+
+				if (uart_handle_sysrq_char(port, c)) {
+					count--;
+					i--;
+					continue;
+				}
+
+				/* Store data and status */
+				if (rdat & RDR_FFER) {
+					flag = TTY_FRAME;
+					port->icount.frame++;
+				} else if (rdat & RDR_FPER) {
+					flag = TTY_PARITY;
+					port->icount.parity++;
+				} else {
+					flag = TTY_NORMAL;
+				}
+
+				tty_insert_flip_char(tport, c, flag);
 			}
-
-			tty_insert_flip_char(tport, c, flag);
 		}
 
 		rsci_serial_in(port, CSR); /* dummy read */
@@ -607,6 +638,8 @@ static const char *rsci_type(struct uart_port *port)
 	struct sci_port *s = to_sci_port(port);
 
 	switch (s->type) {
+	case RSCI_PORT_SCI:
+		return "sci";
 	case RSCI_PORT_SCIF:
 		return "scif";
 	}
@@ -650,6 +683,17 @@ static const struct sci_port_params rsci_port_params = {
 	.common_regs = &rsci_common_regs,
 };
 
+static const struct sci_port_params rsci_rzg3e_sci_port_params = {
+	.fifosize = 1,
+	.overrun_reg = CSR,
+	.overrun_mask = CSR_ORER,
+	.sampling_rate_mask = SCI_SR(32),
+	.error_mask = RSCI_DEFAULT_ERROR_MASK,
+	.error_clear = RSCI_ERROR_CLEAR,
+	.param_bits = &rsci_port_param_bits,
+	.common_regs = &rsci_common_regs,
+};
+
 static const struct sci_port_params rsci_rzg3e_scif_port_params = {
 	.fifosize = 32,
 	.overrun_reg = CSR,
@@ -701,6 +745,13 @@ struct sci_of_data of_sci_rsci_data = {
 	.params = &rsci_port_params,
 };
 
+struct sci_of_data of_rsci_sci_data = {
+	.type = RSCI_PORT_SCI,
+	.ops = &rsci_port_ops,
+	.uart_ops = &rsci_uart_ops,
+	.params = &rsci_rzg3e_sci_port_params,
+};
+
 struct sci_of_data of_rsci_scif_data = {
 	.type = RSCI_PORT_SCIF,
 	.ops = &rsci_port_ops,
@@ -716,12 +767,19 @@ static int __init rsci_early_console_setup(struct earlycon_device *device,
 	return scix_early_console_setup(device, &of_sci_rsci_data);
 }
 
+static int __init rsci_rzg3e_sci_early_console_setup(struct earlycon_device *device,
+						     const char *opt)
+{
+	return scix_early_console_setup(device, &of_rsci_sci_data);
+}
+
 static int __init rsci_rzg3e_scif_early_console_setup(struct earlycon_device *device,
 						      const char *opt)
 {
 	return scix_early_console_setup(device, &of_rsci_scif_data);
 }
 
+OF_EARLYCON_DECLARE(rsci, "renesas,r9a09g047-rsci", rsci_rzg3e_sci_early_console_setup);
 OF_EARLYCON_DECLARE(rsci, "renesas,r9a09g047-rscif", rsci_rzg3e_scif_early_console_setup);
 OF_EARLYCON_DECLARE(rsci, "renesas,r9a09g077-rsci", rsci_early_console_setup);
 
diff --git a/drivers/tty/serial/rsci.h b/drivers/tty/serial/rsci.h
index ba255f58c088..df7a7edad7d4 100644
--- a/drivers/tty/serial/rsci.h
+++ b/drivers/tty/serial/rsci.h
@@ -6,6 +6,7 @@
 #include "sh-sci-common.h"
 
 extern struct sci_of_data of_sci_rsci_data;
+extern struct sci_of_data of_rsci_sci_data;
 extern struct sci_of_data of_rsci_scif_data;
 
 #endif /* __RSCI_H__ */
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 85b89c1ebf15..b7d9ea4091d2 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3492,6 +3492,10 @@ static const struct of_device_id of_sci_match[] __maybe_unused = {
 		.data = &of_sci_scif_rzv2h,
 	},
 #ifdef CONFIG_SERIAL_RSCI
+	{
+		.compatible = "renesas,r9a09g047-rsci",
+		.data = &of_rsci_sci_data,
+	},
 	{
 		.compatible = "renesas,r9a09g047-rscif",
 		.data = &of_rsci_scif_data,
-- 
2.43.0


