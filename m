Return-Path: <linux-renesas-soc+bounces-23934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 96071C21A74
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 19:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 711594F41D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0E237FC78;
	Thu, 30 Oct 2025 17:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+bEFrXy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F4437DBE9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761847105; cv=none; b=g5lr6WKnqOgvEHUVz+v9fWlkU8oQhSDVcZjBlhpeJAOhsFJeP34N3hKWLRrci12Mt1VqbAqpl5Vj5PWzYnyyu3lJI8TbrsuIt2uckLHYiTj9qllmbgbF7nZXHR0DqdLWTEZoBpJ9Hvj1gxLq/aQUxVS3rMA1A4K+2TXIkFvLfkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761847105; c=relaxed/simple;
	bh=HxHvhoN6WLI2e6cUh87N9UQ5gXQc56q7zIhiyZRxEVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RKPtUMi0tLOQAh9FWj+Ts1As1C7TojYA3H0jlt0IFokcu9WKqIEIsHBt6wXTH26IJndy8tqGmtQkG69nsMlBVZfeX6e5VnvZw+KzIOZM8+SKJyns8zJ4odDtzQqIrv4MYwL/pOBLevoaBAnWG87Db79s0DgDaRO9q/3Vna4M1vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+bEFrXy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4770e7062b5so10279455e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761847100; x=1762451900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12vawuhA5hn/B4rj402RgiwkldKOu83rfuQdTW3rcow=;
        b=U+bEFrXy3v6WW+QjI64U2va/kjLoS0OGi3R7k8blDuxhwuco8BVnXLI2OWhwawz0+E
         m3rGLXCrbATZpKFr3sISRq8WKPDWs3n0T2ZlEM+gVdzoHfNMrpoqPrFJOGVu2w/DWwh+
         xORFb+iCcFJpsqxJyQB5WCWF3J+79NplrINyghDHqLDhvdDnfiqX+Et1kGMWlFFUG7rb
         mah7Xta5+qHJo5PzgsHWRf+R/OK6L5FQ3jB6ry4x/mZZHF4sa96MYag2eCw4uPSMEDB5
         kp6JWtF+iJLOOgB1YW6jUrTuW0y5C1cMLvEnTobanwppvxbQ2p8HnMuHxnS01EHHt9HV
         vJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761847100; x=1762451900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12vawuhA5hn/B4rj402RgiwkldKOu83rfuQdTW3rcow=;
        b=E6XNavoa8ksPvo9D+3Bai6jfcg/GVFMgz/qaacuBnAvljJwWUL/MQAZEsuEYTfCwWF
         HDCamkEl4hqEGMelllhsrvBoXcPCz9TqWqs8KhO0yS7k25rl4Apno79tVXDgSC0Ebr/N
         P3NKu1tvLLbAqWRiCPtzA+vZ6D8UKlofVo1tRa0gH+jv/BpvME0ndnI5YlLuKBNGw2Em
         tSD0LL7oqllACMoTqcZxc0AGmbp61DJoQHj1RzppJITMbfcrUA/TnLEKT6VHx2JFRT4M
         ESHLDTizl1qS7u+2K3eHgck5OJX900tYvMQY3DOAAxXjnNMdn0/kqev/ZhwX6XkMib/X
         EmLA==
X-Forwarded-Encrypted: i=1; AJvYcCWrAaUZxYssglToGNF9FO5MUXtvnoMYDsXDoXdLklzyenI1e0sqGbJ+igdwcZrIiahIR/BEDN3W7Klf1m+y1ZAecA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvBLYDBvZFrseozAe+VwwPl/GZwzOWDNp3EIvNxAjKPVj4SEp4
	O4srUHGFnBLia7a/Q/1BTPpKIRgMZ8rYFaIbSekh6gfkmRrvN6cRAtJV
X-Gm-Gg: ASbGncu6s6QPk7Xhj4XPU1zQSd0OIaVVR48FTdw0U81dRW2XizPmH8QjvN2iNZ2v01z
	9vLHayngxhb0LzcrjLAZgiytMAWxWa4LaAn9VisaHt2Xwb374FRStnfHgbLpKCBBfEQvWBEdgde
	x0v5j0OM54z/1IGlyRtgHaf+4gioufkSh4yQb6Czt75sv/xArwnjfY+l3R1GaTGkr5BPEBB0bHN
	RQ+139P7OIIAqrHoowz2k0TjZeGUCpL9UEirIHmIizZvlOrV84lg/fCxnHB8epYDGICc0aJkl0o
	cC41PaRqgQjceMU06tPjMxRm34L4YE/iEDq0Wlgs1Q6dcue/D4xmbQKmfTnaTIUKST8KzCzPpY6
	qyBeCNDlrJMs1d6nERHxUSLOfbVe4kUE6nzx0HtKPkJMQqWtRSx0d5tRc3Spy/QU219Jn+sT2dm
	oUb9bN1uEQNMwhB3yJBRjt6cMRv3wetoRpQdjsO7eZ/RBfUhO7QMl7xAPFsxUgT5RhExQTLJc=
X-Google-Smtp-Source: AGHT+IFejjMV1MXViC7OFDq4Wo7fp6zfnGlAxE/CnK4NP1eTIIt/Hwjp8uRSRgo4dYR8KGjeX07+Zg==
X-Received: by 2002:a05:600c:4e05:b0:46e:3550:9390 with SMTP id 5b1f17b1804b1-477308b60camr5418935e9.20.1761847100380;
        Thu, 30 Oct 2025 10:58:20 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772f53aad6sm15098055e9.13.2025.10.30.10.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:58:20 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 12/13] serial: sh-sci: Add support for RZ/G3E RSCI SCIF
Date: Thu, 30 Oct 2025 17:58:00 +0000
Message-ID: <20251030175811.607137-13-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
References: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * Updated commit description.
 * Updated multiline comment to fit into single line.
 * Updated set_termios() for getting baud_rate()
---
 drivers/tty/serial/rsci.c   | 282 ++++++++++++++++++++++++++++++++++--
 drivers/tty/serial/rsci.h   |   1 +
 drivers/tty/serial/sh-sci.c |   9 +-
 3 files changed, 281 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index ade5ee479e99..a3e216c05b76 100644
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
+	rsci_serial_out(port, CCR0, ctrl & ~CCR0_TE);
+	cpu_relax();
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
 
@@ -414,6 +650,17 @@ static const struct sci_port_params rsci_port_params = {
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
@@ -421,6 +668,8 @@ static const struct uart_ops rsci_uart_ops = {
 	.start_tx	= rsci_start_tx,
 	.stop_tx	= rsci_stop_tx,
 	.stop_rx	= rsci_stop_rx,
+	.enable_ms	= rsci_enable_ms,
+	.break_ctl	= rsci_break_ctl,
 	.startup	= sci_startup,
 	.shutdown	= sci_shutdown,
 	.set_termios	= rsci_set_termios,
@@ -440,6 +689,7 @@ static const struct sci_port_ops rsci_port_ops = {
 	.receive_chars		= rsci_receive_chars,
 	.poll_put_char		= rsci_poll_put_char,
 	.prepare_console_write	= rsci_prepare_console_write,
+	.finish_console_write	= rsci_finish_console_write,
 	.suspend_regs_size	= rsci_suspend_regs_size,
 	.shutdown_complete	= rsci_shutdown_complete,
 };
@@ -451,6 +701,13 @@ struct sci_of_data of_sci_rsci_data = {
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
@@ -459,6 +716,13 @@ static int __init rsci_early_console_setup(struct earlycon_device *device,
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
index fac83dace27c..85b89c1ebf15 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3397,7 +3397,7 @@ static void sci_remove(struct platform_device *dev)
 	if (s->port.fifosize > 1)
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_trigger);
 	if (type == PORT_SCIFA || type == PORT_SCIFB || type == PORT_HSCIF ||
-	    type == SCI_PORT_RSCI)
+	    type == SCI_PORT_RSCI || type == RSCI_PORT_SCIF)
 		device_remove_file(&dev->dev, &dev_attr_rx_fifo_timeout);
 }
 
@@ -3492,6 +3492,10 @@ static const struct of_device_id of_sci_match[] __maybe_unused = {
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
@@ -3759,7 +3763,8 @@ static int sci_probe(struct platform_device *dev)
 			return ret;
 	}
 	if (sp->type == PORT_SCIFA || sp->type == PORT_SCIFB ||
-	    sp->type == PORT_HSCIF || sp->type == SCI_PORT_RSCI) {
+	    sp->type == PORT_HSCIF || sp->type == SCI_PORT_RSCI ||
+	    sp->type == RSCI_PORT_SCIF) {
 		ret = device_create_file(&dev->dev, &dev_attr_rx_fifo_timeout);
 		if (ret) {
 			if (sp->port.fifosize > 1) {
-- 
2.43.0


