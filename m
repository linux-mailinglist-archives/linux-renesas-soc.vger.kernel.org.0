Return-Path: <linux-renesas-soc+bounces-24656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECABAC5CB52
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AB4C42057F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BAB319875;
	Fri, 14 Nov 2025 10:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ky+Ou8oh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2A131577B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763117539; cv=none; b=Tx/x1pmuRVTPLpz+jPVeWOvmhLQcJV9pXgRA0u89Ij4jHpRT07DfAuLa5xq5QBDaWNaIxksu8HhHUF18bXnr7Qh1856LkIknwxFh3d91/hwgT6ddEbLvjpBbI87qjrBKkrBqfa2sTP+7KnjJQvAnpJt3xhoLL8a33x/3bVro4wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763117539; c=relaxed/simple;
	bh=lbHPQcU720DnCd5DNk+jtPQt2u7O7tImS2GQkL2jFqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dxNu3AKkT5m8md+wXyFAPh7T8eowsKAPxqvCn4sH0LeJgf1jc2mmZqWBayoowTJqVMEpr+YHkkMwvM3VgbnUkKA3PJ4Bze0YODZ/TwZ4iyiJFygGbPmbVXE4uMVNWcv16cdu68m3vmvQTlS3pcTIHG9PyCD6AZZwfTIqAKLXl+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ky+Ou8oh; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b427cda88so1321753f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 02:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763117532; x=1763722332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HavjwLLRI09IoMsVeOFb46LpJDO5tp7YBrbtvc0iWmY=;
        b=Ky+Ou8ohhNDjSYFNdcrD4LV7S40uO5C7YYrlBd/HprndvYjNxNtag0hg7FUWZtkmW9
         N0v6lZ6nrTIDw6//x8PjWx23nU2uOHWniEDo+YpSYbTlgAZwdOjxtSVYYCJjhIsOYL5Z
         rNpnpYWzkC5v1+cctDOUcz61X04RZFIqy/k8HOVdt4whjWYykYhBtNyu7opasJVgafMb
         46ylX3UrGxpC6wGKQpzK8FXcMON9Xk4mgBBP7WvTz+CXGJPJW4+BRp3eA7GlzBAi7ABc
         O7KCc9dTUW4f+X7LYCTlwA1w1Z9j9vLi+JvyYrUh+Cp0dD1X1/y4sHzS06eT9zDzN1dx
         ByxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763117532; x=1763722332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HavjwLLRI09IoMsVeOFb46LpJDO5tp7YBrbtvc0iWmY=;
        b=cQ2vW7dAfZKWbXwa3GlJ+1S+nsC2vkOj7JyzcKK3iF+CZfKyZWEZGpI3vUGJjQpzct
         Y224bqKeKXOHuG/iRsRBTFc23igfNyZF7f8Q2VPUGPcSS4WhZdhWUryaMP043JS9Meph
         YkCDi+HFj0cvBZtGgyPYzZhtdRMazZV+JnO0WcorRYE/UBtpS1WeqkzJie+ACqSEDWRr
         BpY952CL8zQnx3lEJU2xnScaWLejIgnJPbkADiXH3usHS1gSOYoh9tujxgmTNAlRth7q
         gtQugb5Yta94BC/3tle8fQvvLQkUA5XFoq6M6H3NZ+0CGOxa9vGlyrEvl7M0bj5ozK7I
         PiMg==
X-Forwarded-Encrypted: i=1; AJvYcCUfLKU/EvKsc+VuZgFBZkaPI7kKOEEAwWehB/feFWuCXWhfRIBKntyLjQ1zpBLfNPjG31/QnCL5TBxluwl9wlt0Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSN8HyPJ0sETSNsKGhQXsoAaOaKj/GqrzMRhL5jdBWzD5+4r8Q
	KljwGJxW6X2WiNRne2+b4X63l60YJZ8hCWvqDY0Bc1+Nrw/3li10WT1D
X-Gm-Gg: ASbGncskO+FfZIRpfYPd50MxV+zsv9U7YI8YqPtFuxculMeP9EjmBcbE7cmx8PTbRRT
	eZsWipc4aHhhEaemYxvzjoCGZXVI4vhQ0LV67TMP6h0AMdNxZZj7+0Mgsy4vSj2gYykeFBHwKfO
	PtWZ2YM7rVcW1Dl1qdrOfeIKzVxcBG/N+vvCG98z8a8Kn0LmUil4foObhZBiRELWWwTSmqGdQ5+
	5tS0vLedJlLJcqG6piomIEsKwDwR/7VUuyIfgEWO8eIuD6aTYS1NII/tVNm/rKqkzRKnjeekH70
	1BsWZuG3qiHc5e2cx0eek/ijuMnIHlzWLIc8qSN+5eEzZcsjexJ8hZgQvkFkMSnEgfOhxLznCHu
	uP7Rofcc75QaornIb+DCoR/IjamCR35x/U32o0ltnv3pgcBbo00yedXJ8/r2Kt8lMk9fcXdNrYx
	ugBxeDQY0EFJuOyKDzyalm1EpINeJO+qeif/D9TVlK5FaDdAcmEg0jI79106qfvjGF6j1kx3kaP
	aHqEKNHOqUeWhrP
X-Google-Smtp-Source: AGHT+IFJAmRdO4MRYD2NWBgM4MysNvLYHPYKoFM50FQxAI03/cMRzsqL9Qyq0AmQnBCfJY4tw9YKOw==
X-Received: by 2002:a05:6000:4008:b0:429:bce4:20bf with SMTP id ffacd0b85a97d-42b59385ac8mr2347834f8f.55.1763117532176;
        Fri, 14 Nov 2025 02:52:12 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm9031255f8f.35.2025.11.14.02.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:52:11 -0800 (PST)
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
Subject: [PATCH v3 12/13] serial: sh-sci: Add support for RZ/G3E RSCI SCIF
Date: Fri, 14 Nov 2025 10:51:21 +0000
Message-ID: <20251114105201.107406-13-biju.das.jz@bp.renesas.com>
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

Add support for RZ/G3E RSCI SCIF(a.k.a FIFO mode). RSCI IP found on the
RZ/G3E SoC is similar to RZ/T2H, but it has a 32-stage FIFO. it has 6
clocks(5 module clocks + 1 external clock) instead of 3 clocks(2 module
clocks + 1 external clock) on T2H and has multiple resets. Add support
for the hardware flow control.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Dropped cpu_relax() from rsci_finish_console_write() and added a
   comment.
 * Added sci_is_rsci_fifo_type() helper for reuse in probe() and remove().
v1->v2:
 * Updated commit description.
 * Updated multiline comment to fit into single line.
 * Updated set_termios() for getting baud_rate()
---
 drivers/tty/serial/rsci.c   | 282 ++++++++++++++++++++++++++++++++++--
 drivers/tty/serial/rsci.h   |   1 +
 drivers/tty/serial/sh-sci.c |  13 +-
 3 files changed, 285 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 9609ef73a0d4..43b2e5588d4d 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -11,6 +11,8 @@
 #include <linux/serial_core.h>
 #include <linux/serial_sci.h>
 #include <linux/tty_flip.h>
+
+#include "serial_mctrl_gpio.h"
 #include "rsci.h"
 
 MODULE_IMPORT_NS("SH_SCI");
@@ -59,6 +61,41 @@ MODULE_IMPORT_NS("SH_SCI");
 #define CCR1_CTSPEN		BIT(1)	/* CTS External Pin Enable */
 #define CCR1_CTSE		BIT(0)	/* CTS Enable */
 
+/* CCR2 (Common Control Register 2) */
+#define CCR2_INIT			0xFF000004
+#define CCR2_CKS_TCLK			(0)	/* TCLK clock */
+#define CCR2_CKS_TCLK_DIV4		BIT(20)	/* TCLK/4 clock */
+#define CCR2_CKS_TCLK_DIV16		BIT(21)	/* TCLK16 clock */
+#define CCR2_CKS_TCLK_DIV64		(BIT(21) | BIT(20)) /* TCLK/64 clock */
+#define CCR2_BRME			BIT(16)	/* Bitrate Modulation Enable */
+#define CCR2_ABCSE			BIT(6)	/* Asynchronous Mode Extended Base Clock Select */
+#define CCR2_ABCS			BIT(5)	/* Asynchronous Mode Base Clock Select */
+#define CCR2_BGDM			BIT(4)	/* Baud Rate Generator Double-Speed Mode Select */
+
+/* CCR3 (Common Control Register 3) */
+#define CCR3_INIT			0x1203
+#define CCR3_BLK			BIT(29)	/* Block Transfer Mode */
+#define CCR3_GM				BIT(28)	/* GSM Mode */
+#define CCR3_CKE1			BIT(25)	/* Clock Enable 1 */
+#define CCR3_CKE0			BIT(24)	/* Clock Enable 0 */
+#define CCR3_DEN			BIT(21)	/* Driver Enabled */
+#define CCR3_FM				BIT(20)	/* FIFO Mode Select */
+#define CCR3_MP				BIT(19)	/* Multi-Processor Mode */
+#define CCR3_MOD_ASYNC			0	/* Asynchronous mode (Multi-processor mode) */
+#define CCR3_MOD_IRDA			BIT(16)	/* Smart card interface mode */
+#define CCR3_MOD_CLK_SYNC		BIT(17)	/* Clock synchronous mode */
+#define CCR3_MOD_SPI			(BIT(17) | BIT(16)) /* Simple SPI mode */
+#define CCR3_MOD_I2C			BIT(18)	/* Simple I2C mode */
+#define CCR3_RXDESEL			BIT(15)	/* Asynchronous Start Bit Edge Detection Select */
+#define CCR3_STP			BIT(14)	/* Stop bit Length */
+#define CCR3_SINV			BIT(13)	/* Transmitted/Received Data Invert */
+#define CCR3_LSBF			BIT(12)	/* LSB First select */
+#define CCR3_CHR1			BIT(9)	/* Character Length */
+#define CCR3_CHR0			BIT(8)	/* Character Length */
+#define CCR3_BPEN			BIT(7)	/* Synchronizer Bypass Enable */
+#define CCR3_CPOL			BIT(1)	/* Clock Polarity Select */
+#define CCR3_CPHA			BIT(0)	/* Clock Phase Select */
+
 /* FCR (FIFO Control Register) */
 #define FCR_RFRST		BIT(23)	/* Receive FIFO Data Register Reset */
 #define FCR_TFRST		BIT(15)	/* Transmit FIFO Data Register Reset */
@@ -142,21 +179,160 @@ static void rsci_start_rx(struct uart_port *port)
 	rsci_serial_out(port, CCR0, ctrl);
 }
 
+static void rsci_enable_ms(struct uart_port *port)
+{
+	mctrl_gpio_enable_ms(to_sci_port(port)->gpios);
+}
+
+static void rsci_init_pins(struct uart_port *port, unsigned int cflag)
+{
+	struct sci_port *s = to_sci_port(port);
+
+	/* Use port-specific handler if provided */
+	if (s->cfg->ops && s->cfg->ops->init_pins) {
+		s->cfg->ops->init_pins(port, cflag);
+		return;
+	}
+
+	if (!s->has_rtscts)
+		return;
+
+	if (s->autorts)
+		rsci_serial_out(port, CCR1, rsci_serial_in(port, CCR1) |
+				CCR1_CTSE | CCR1_CTSPEN);
+}
+
+static int rsci_scif_set_rtrg(struct uart_port *port, int rx_trig)
+{
+	unsigned int bits;
+
+	if (rx_trig >= port->fifosize)
+		rx_trig = port->fifosize - 1;
+	else if (rx_trig < 1)
+		rx_trig = 1;
+
+	bits = rx_trig << 16;
+	rsci_serial_out(port, FCR, (rsci_serial_in(port, FCR) & ~FCR_RTRG4_0) | bits);
+
+	return rx_trig;
+}
+
 static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 			     const struct ktermios *old)
 {
+	unsigned int ccr2_val = CCR2_INIT, ccr3_val = CCR3_INIT;
+	unsigned int ccr0_val = 0, ccr1_val = 0, ccr4_val = 0;
+	unsigned int brr1 = 255, cks1 = 0, srr1 = 15;
 	struct sci_port *s = to_sci_port(port);
+	unsigned int brr = 255, cks = 0;
+	int min_err = INT_MAX, err;
+	unsigned long max_freq = 0;
+	unsigned int baud, i;
 	unsigned long flags;
+	unsigned int ctrl;
+	int best_clk = -1;
+
+	if ((termios->c_cflag & CSIZE) == CS7) {
+		ccr3_val |= CCR3_CHR0;
+	} else {
+		termios->c_cflag &= ~CSIZE;
+		termios->c_cflag |= CS8;
+	}
+
+	if (termios->c_cflag & PARENB)
+		ccr1_val |= CCR1_PE;
+
+	if (termios->c_cflag & PARODD)
+		ccr1_val |= (CCR1_PE | CCR1_PM);
+
+	if (termios->c_cflag & CSTOPB)
+		ccr3_val |= CCR3_STP;
+
+	/* Enable noise filter function */
+	ccr1_val |= CCR1_NFEN;
+
+	/*
+	 * earlyprintk comes here early on with port->uartclk set to zero.
+	 * the clock framework is not up and running at this point so here
+	 * we assume that 115200 is the maximum baud rate. please note that
+	 * the baud rate is not programmed during earlyprintk - it is assumed
+	 * that the previous boot loader has enabled required clocks and
+	 * setup the baud rate generator hardware for us already.
+	 */
+	if (!port->uartclk) {
+		max_freq = 115200;
+	} else {
+		for (i = 0; i < SCI_NUM_CLKS; i++)
+			max_freq = max(max_freq, s->clk_rates[i]);
+
+		max_freq /= min_sr(s);
+	}
+
+	baud = uart_get_baud_rate(port, termios, old, 0, max_freq);
+	if (!baud)
+		goto done;
+
+	/* Divided Functional Clock using standard Bit Rate Register */
+	err = sci_scbrr_calc(s, baud, &brr1, &srr1, &cks1);
+	if (abs(err) < abs(min_err)) {
+		best_clk = SCI_FCK;
+		ccr0_val = 0;
+		min_err = err;
+		brr = brr1;
+		cks = cks1;
+	}
+
+done:
+	if (best_clk >= 0)
+		dev_dbg(port->dev, "Using clk %pC for %u%+d bps\n",
+			s->clks[best_clk], baud, min_err);
 
 	sci_port_enable(s);
 	uart_port_lock_irqsave(port, &flags);
 
-	/* For now, only RX enabling is supported */
-	if (termios->c_cflag & CREAD)
+	uart_update_timeout(port, termios->c_cflag, baud);
+
+	rsci_serial_out(port, CCR0, ccr0_val);
+
+	ccr3_val |= CCR3_FM;
+	rsci_serial_out(port, CCR3, ccr3_val);
+
+	ccr2_val |= (cks << 20) | (brr << 8);
+	rsci_serial_out(port, CCR2, ccr2_val);
+
+	rsci_serial_out(port, CCR1, ccr1_val);
+	rsci_serial_out(port, CCR4, ccr4_val);
+
+	ctrl = rsci_serial_in(port, FCR);
+	ctrl |= (FCR_RFRST | FCR_TFRST);
+	rsci_serial_out(port, FCR, ctrl);
+
+	if (s->rx_trigger > 1)
+		rsci_scif_set_rtrg(port, s->rx_trigger);
+
+	port->status &= ~UPSTAT_AUTOCTS;
+	s->autorts = false;
+
+	if ((port->flags & UPF_HARD_FLOW) && (termios->c_cflag & CRTSCTS)) {
+		port->status |= UPSTAT_AUTOCTS;
+		s->autorts = true;
+	}
+
+	rsci_init_pins(port, termios->c_cflag);
+	rsci_serial_out(port, CFCLR, CFCLR_CLRFLAG);
+	rsci_serial_out(port, FFCLR, FFCLR_DRC);
+
+	ccr0_val |= CCR0_RE;
+	rsci_serial_out(port, CCR0, ccr0_val);
+
+	if ((termios->c_cflag & CREAD) != 0)
 		rsci_start_rx(port);
 
 	uart_port_unlock_irqrestore(port, flags);
 	sci_port_disable(s);
+
+	if (UART_ENABLE_MS(port, termios->c_cflag))
+		rsci_enable_ms(port);
 }
 
 static int rsci_txfill(struct uart_port *port)
@@ -181,13 +357,34 @@ static unsigned int rsci_tx_empty(struct uart_port *port)
 
 static void rsci_set_mctrl(struct uart_port *port, unsigned int mctrl)
 {
-	/* Not supported yet */
+	if (mctrl & TIOCM_LOOP) {
+		/* Standard loopback mode */
+		rsci_serial_out(port, CCR1, rsci_serial_in(port, CCR1) | CCR1_SPLP);
+	}
 }
 
 static unsigned int rsci_get_mctrl(struct uart_port *port)
 {
-	/* Not supported yet */
-	return 0;
+	struct sci_port *s = to_sci_port(port);
+	struct mctrl_gpios *gpios = s->gpios;
+	unsigned int mctrl = 0;
+
+	mctrl_gpio_get(gpios, &mctrl);
+
+	/*
+	 * CTS/RTS is handled in hardware when supported, while nothing
+	 * else is wired up.
+	 */
+	if (!mctrl_gpio_to_gpiod(gpios, UART_GPIO_CTS))
+		mctrl |= TIOCM_CTS;
+
+	if (!mctrl_gpio_to_gpiod(gpios, UART_GPIO_DSR))
+		mctrl |= TIOCM_DSR;
+
+	if (!mctrl_gpio_to_gpiod(gpios, UART_GPIO_DCD))
+		mctrl |= TIOCM_CAR;
+
+	return mctrl;
 }
 
 static void rsci_start_tx(struct uart_port *port)
@@ -312,7 +509,8 @@ static void rsci_receive_chars(struct uart_port *port)
 				continue;
 			}
 
-			/* Store data and status.
+			/*
+			 * Store data and status.
 			 * Non FIFO mode is not supported
 			 */
 			if (rdat & RDR_FFER) {
@@ -346,6 +544,28 @@ static void rsci_receive_chars(struct uart_port *port)
 	}
 }
 
+static void rsci_break_ctl(struct uart_port *port, int break_state)
+{
+	unsigned short ccr0_val, ccr1_val;
+	unsigned long flags;
+
+	uart_port_lock_irqsave(port, &flags);
+	ccr1_val = rsci_serial_in(port, CCR1);
+	ccr0_val = rsci_serial_in(port, CCR0);
+
+	if (break_state == -1) {
+		ccr1_val = (ccr1_val | CCR1_SPB2IO) & ~CCR1_SPB2DT;
+		ccr0_val &= ~CCR0_TE;
+	} else {
+		ccr1_val = (ccr1_val | CCR1_SPB2DT) & ~CCR1_SPB2IO;
+		ccr0_val |= CCR0_TE;
+	}
+
+	rsci_serial_out(port, CCR1, ccr1_val);
+	rsci_serial_out(port, CCR0, ccr0_val);
+	uart_port_unlock_irqrestore(port, flags);
+}
+
 static void rsci_poll_put_char(struct uart_port *port, unsigned char c)
 {
 	u32 status;
@@ -367,14 +587,30 @@ static void rsci_poll_put_char(struct uart_port *port, unsigned char c)
 static void rsci_prepare_console_write(struct uart_port *port, u32 ctrl)
 {
 	struct sci_port *s = to_sci_port(port);
-	u32 ctrl_temp =
-		s->params->param_bits->rxtx_enable | CCR0_TIE |
-		s->hscif_tot;
+	u32 ctrl_temp = s->params->param_bits->rxtx_enable;
+
+	if (s->type == SCI_PORT_RSCI)
+		ctrl_temp |= CCR0_TIE | s->hscif_tot;
+
 	rsci_serial_out(port, CCR0, ctrl_temp);
 }
 
+static void rsci_finish_console_write(struct uart_port *port, u32 ctrl)
+{
+	/* First set TE = 0 and then restore the CCR0 value */
+	rsci_serial_out(port, CCR0, ctrl & ~CCR0_TE);
+	rsci_serial_out(port, CCR0, ctrl);
+}
+
 static const char *rsci_type(struct uart_port *port)
 {
+	struct sci_port *s = to_sci_port(port);
+
+	switch (s->type) {
+	case RSCI_PORT_SCIF:
+		return "scif";
+	}
+
 	return "rsci";
 }
 
@@ -413,6 +649,17 @@ static const struct sci_port_params rsci_port_params = {
 	.common_regs = &rsci_common_regs,
 };
 
+static const struct sci_port_params rsci_rzg3e_scif_port_params = {
+	.fifosize = 32,
+	.overrun_reg = CSR,
+	.overrun_mask = CSR_ORER,
+	.sampling_rate_mask = SCI_SR(32),
+	.error_mask = RSCI_DEFAULT_ERROR_MASK,
+	.error_clear = RSCI_ERROR_CLEAR,
+	.param_bits = &rsci_port_param_bits,
+	.common_regs = &rsci_common_regs,
+};
+
 static const struct uart_ops rsci_uart_ops = {
 	.tx_empty	= rsci_tx_empty,
 	.set_mctrl	= rsci_set_mctrl,
@@ -420,6 +667,8 @@ static const struct uart_ops rsci_uart_ops = {
 	.start_tx	= rsci_start_tx,
 	.stop_tx	= rsci_stop_tx,
 	.stop_rx	= rsci_stop_rx,
+	.enable_ms	= rsci_enable_ms,
+	.break_ctl	= rsci_break_ctl,
 	.startup	= sci_startup,
 	.shutdown	= sci_shutdown,
 	.set_termios	= rsci_set_termios,
@@ -439,6 +688,7 @@ static const struct sci_port_ops rsci_port_ops = {
 	.receive_chars		= rsci_receive_chars,
 	.poll_put_char		= rsci_poll_put_char,
 	.prepare_console_write	= rsci_prepare_console_write,
+	.finish_console_write	= rsci_finish_console_write,
 	.suspend_regs_size	= rsci_suspend_regs_size,
 	.shutdown_complete	= rsci_shutdown_complete,
 };
@@ -450,6 +700,13 @@ struct sci_of_data of_sci_rsci_data = {
 	.params = &rsci_port_params,
 };
 
+struct sci_of_data of_rsci_scif_data = {
+	.type = RSCI_PORT_SCIF,
+	.ops = &rsci_port_ops,
+	.uart_ops = &rsci_uart_ops,
+	.params = &rsci_rzg3e_scif_port_params,
+};
+
 #ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
 
 static int __init rsci_early_console_setup(struct earlycon_device *device,
@@ -458,6 +715,13 @@ static int __init rsci_early_console_setup(struct earlycon_device *device,
 	return scix_early_console_setup(device, &of_sci_rsci_data);
 }
 
+static int __init rsci_rzg3e_scif_early_console_setup(struct earlycon_device *device,
+						      const char *opt)
+{
+	return scix_early_console_setup(device, &of_rsci_scif_data);
+}
+
+OF_EARLYCON_DECLARE(rsci, "renesas,r9a09g047-rscif", rsci_rzg3e_scif_early_console_setup);
 OF_EARLYCON_DECLARE(rsci, "renesas,r9a09g077-rsci", rsci_early_console_setup);
 
 #endif /* CONFIG_SERIAL_SH_SCI_EARLYCON */
diff --git a/drivers/tty/serial/rsci.h b/drivers/tty/serial/rsci.h
index 2af3f28b465a..ba255f58c088 100644
--- a/drivers/tty/serial/rsci.h
+++ b/drivers/tty/serial/rsci.h
@@ -6,5 +6,6 @@
 #include "sh-sci-common.h"
 
 extern struct sci_of_data of_sci_rsci_data;
+extern struct sci_of_data of_rsci_scif_data;
 
 #endif /* __RSCI_H__ */
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index e269f4f9edd0..7c3d25a6138c 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3563,6 +3563,11 @@ static struct uart_driver sci_uart_driver = {
 	.cons		= SCI_CONSOLE,
 };
 
+static bool sci_is_rsci_fifo_type(u8 type)
+{
+	return (type == SCI_PORT_RSCI || type == RSCI_PORT_SCIF);
+}
+
 static void sci_remove(struct platform_device *dev)
 {
 	struct sci_port *s = platform_get_drvdata(dev);
@@ -3574,7 +3579,7 @@ static void sci_remove(struct platform_device *dev)
 	if (s->port.fifosize > 1)
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_trigger);
 	if (type == PORT_SCIFA || type == PORT_SCIFB || type == PORT_HSCIF ||
-	    type == SCI_PORT_RSCI)
+	    sci_is_rsci_fifo_type(type))
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_timeout);
 }
 
@@ -3669,6 +3674,10 @@ static const struct of_device_id of_sci_match[] __maybe_unused = {
 		.data = &of_sci_scif_rzv2h,
 	},
 #ifdef CONFIG_SERIAL_RSCI
+	{
+		.compatible = "renesas,r9a09g047-rscif",
+		.data = &of_rsci_scif_data,
+	},
 	{
 		.compatible = "renesas,r9a09g077-rsci",
 		.data = &of_sci_rsci_data,
@@ -3936,7 +3945,7 @@ static int sci_probe(struct platform_device *dev)
 			return ret;
 	}
 	if (sp->type == PORT_SCIFA || sp->type == PORT_SCIFB ||
-	    sp->type == PORT_HSCIF || sp->type == SCI_PORT_RSCI) {
+	    sp->type == PORT_HSCIF || sci_is_rsci_fifo_type(sp->type)) {
 		ret = device_create_file(&dev->dev, &dev_attr_rx_fifo_timeout);
 		if (ret) {
 			if (sp->port.fifosize > 1) {
-- 
2.43.0


