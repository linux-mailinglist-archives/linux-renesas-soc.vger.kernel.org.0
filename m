Return-Path: <linux-renesas-soc+bounces-24657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B47C5CB6A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2D8FC34726F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DC931AF0E;
	Fri, 14 Nov 2025 10:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dbag8zqM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BCD3161B3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763117539; cv=none; b=hVct8bE0q4BmmWc0PNskZOxvTNNfCBwAn2ra9GtEfB/hdCEn3nAaZg8jI+alQRLd8wx2XfFi1jYNsyExzaazZntl8GC2zDC7GYrfuZwi+549nzYxQJAlNo9rRcIDeEZV7/3ZSV9dDYSMjPdLGSfFYjYSA0kw+Ai95R/Y/LkHNRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763117539; c=relaxed/simple;
	bh=6O3doIFr9IR4S2kx1M6uldVyjIjXurTG0Y9yc4WTdAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FI681F5dJD4ys/lCmtdk5E2AoFBd/6cnobXMxXpuXOpA7uQqsi9me8ni8kK09CdogVt3KrOyr4HklzPuwfOfJx8q5g0yFzPkXGvi+uVbCppl+bP3ssDBpLamaS2JW++HqQcJ0YLAzMN4IGGa+DMLDlu2TdiS32Go9V6CvwyCgic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dbag8zqM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47755a7652eso13046325e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 02:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763117533; x=1763722333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATfnSc/33FwJ+wue2neEbqFM/q6MAl95n5pgQFg9uxw=;
        b=Dbag8zqM2hgs798YIf3xt4zw2mUO89SFiIfrZCt9vxg0SiCO9RS1nR0zSSvsp0HV+k
         L7UxiYdRZfLNmvRkcbn/IQllDk881c33Qvl3PH4Gwj46KLJMYiP+e4s5hO4dCmLJlY92
         +XapvLSUXUjtK9ld6DWLtEDRB+vrqqjSiwRqnoOvuqij3iRrxnHBXpbNTukixvafjqH5
         RWqTFW62agAXZlgV8hN1lGoobBjwguONcRCVw5W+lUpH1WzRx3Irvc+wFWPgjdsTW7rZ
         hclU3+PbROovElufxqfX7w/1j7mHDQEmLso7vpjsdjuJOqO4Z+JX7UXoUoDs2nJXMHt7
         zRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763117533; x=1763722333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ATfnSc/33FwJ+wue2neEbqFM/q6MAl95n5pgQFg9uxw=;
        b=Ttnw60wrGnkJPDhzzTaAXIgSAFvjuLUqSaTEcAl0GDpH3GIqNWpNt58CsUI/9lUFxw
         mXrti4Bl55/D7LqGbyjFoUU4raluQrqVAWTbBqyISSMhUA6sz8D6zwvde/T3gpA7f1SJ
         JRcfJQ/eo/nWaCYuW16Hgqnv2VAtqHlC4YKwgoH0yrJqzzPCcKjB8cwHBUIVtdBG3Twx
         ljxeS4hCUTK70YWxL2Qi7WzzJ9KFO30EQTZJqg8TN3kV0hRlvkqWyY/OW/uf8U9XDjOh
         NXXebzcQfedN78agDiScIBdqAjlP33QG4khu1+014eDvDQ7kbBNBFuK20SOqeFQmw1WG
         N6GA==
X-Forwarded-Encrypted: i=1; AJvYcCXOJDnVsjKRhcArrEipQH5xP5RL2319SlsK01vtQMwpf+vkJ3EX8HjbZmqZ+RvjCobc2v3yB8Esq/+EjbIrDtAeUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYc8Sd4eb6+7fogFTRuvl3QxUlbkGQlZ+xkmpWTVshLDXNrEPf
	zEfS2BNzkm8H6gmad/dIFis5p5Q3IOLGXnwqyFrrrTWCdiQCO/CgUvsp
X-Gm-Gg: ASbGnctEeIyy38fP6vzrFr633GgfV7BP8FQSEswQKQ3Jn3F95dwAIMYcNrIRsAtFfSQ
	0arXo0KTOmf5+73DMoXX4ehI1YGH7PNz7NDMYMuvcsscfGyb0/aR/zYR8GCT61tlFjBV2p5nFeA
	mHWuYon50GoIVQk4do/GFcvzoxew4rMBKAFl8gDh7Cdv0qjaUt5aWl9otIV4BmKFtrIqQ1gEBWc
	Lw2yp7RVDGEWOiSxjocNOBdXmqqwh7bp1usR3A5Wu0Yat6BWwoDNDZWG97e3mC1sMEXZU9DKvAQ
	G9PbX5UyJTPh1jCYPNfQ2OuUEDVCznLmZDRJoNgBEp3rq9rdgKE0h7x0+pVtaBdtDusKI/1dW1p
	e4ZJWdp1RyNVnd9e+kQkOmfKWmclx6nvMjGbFTNS3NzFmjl+NWampdGpIwRHFpUsXivUSEC8l0L
	BuADLPEmEvFSVydNkAD+7XSArORbwQTjFsCSdfRIo6U1fG/cLumpJgCPq++11unKwcMSIxMQFfS
	x7eQzBT5lgOx3Tl
X-Google-Smtp-Source: AGHT+IEl0rijUjBj5KTVPuwgJ52eLtySyACZ+02OvsE0VUgnXG69c8DNIvntukmMZa1vwSgobwIWIg==
X-Received: by 2002:a05:600c:8b22:b0:475:dd89:abc with SMTP id 5b1f17b1804b1-4778fe583f0mr22856285e9.11.1763117532866;
        Fri, 14 Nov 2025 02:52:12 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm9031255f8f.35.2025.11.14.02.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:52:12 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 13/13] serial: sh-sci: Add support for RZ/G3E RSCI SCI
Date: Fri, 14 Nov 2025 10:51:22 +0000
Message-ID: <20251114105201.107406-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
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
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/rsci.c   | 138 +++++++++++++++++++++++++-----------
 drivers/tty/serial/rsci.h   |   1 +
 drivers/tty/serial/sh-sci.c |   4 ++
 3 files changed, 103 insertions(+), 40 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 43b2e5588d4d..39960e7c60ac 100644
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
@@ -649,6 +682,17 @@ static const struct sci_port_params rsci_port_params = {
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
@@ -700,6 +744,13 @@ struct sci_of_data of_sci_rsci_data = {
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
@@ -715,12 +766,19 @@ static int __init rsci_early_console_setup(struct earlycon_device *device,
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
index 7c3d25a6138c..82e472957913 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3674,6 +3674,10 @@ static const struct of_device_id of_sci_match[] __maybe_unused = {
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


