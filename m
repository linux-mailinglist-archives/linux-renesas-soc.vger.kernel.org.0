Return-Path: <linux-renesas-soc+bounces-25120-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF364C85AF7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 16:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 17F74352664
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 15:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DECE32C925;
	Tue, 25 Nov 2025 15:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwzSD3iC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD31329383
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 15:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083213; cv=none; b=LClYRAXLasvnYu6cexl1RJ05RLbcD13fO1YQXgZFDaT7APXfWYT3WaBxYQTXyRaYKrLN/FOvjdx9UcAgmGiTHT54cC4TBfbUBRpyzbBOPdfanDFr1JcgXQ13ILIJKRz6fM5Mz0Rh9s6nfbrgVbTTwepPUptkvF4nekqIkeRxtpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083213; c=relaxed/simple;
	bh=Hu3Q3V7OclDC6uu2PcyfhwaN1/BAkZSnn5FwWaIGLec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qrsT1vKesZV0G1FbjSKGbhw/2+h71rGcwx2BtMP9/hVyOWGG6FCjOaYTBdhzI9k6VsQWN4I+vg/qJeYwKbLxDqdarIws5j9NAPv1RWxuytlWd59g1niGKdDYI3fCFjs7Oi7zG55wRxW8iufYnl1gqVm2WthfoVGpBX3Kiaom+Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwzSD3iC; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3c965df5so3040414f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 07:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764083207; x=1764688007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=httfXM+8l0sum1iuPhimnyuIWDvW8Bl0comT+k/p0tE=;
        b=jwzSD3iCLEdfqVWVZvH8CM+3zyJqkQZDsXPsH/55bbzGM5JoAtuGgMJ/aUAlx/sQwz
         tDPQV2dy8rmWL/Q5LF3hEFFLAW8q38wIpN33xvbILJggwWmjaBOLHiM0/qdWOVfVfaEd
         TKObGrpsPmhmBDNzCsOoxL91/127v8bEVZ0VVNNfhluFe0rg4Pi0oWscGHVF4GdSMLNU
         ZqumfTar2UMCdZEoJyOKi5OSF0bPtx/RYpIJEp5KxlmqYyjML03TjaSY19ogoLiDsVOg
         rgSyGImRoyKDdyHuWQqNzMp93EwQrV6oPNq0iXVJ7M/cRTJj07KnhR7stHBJNYANNqbH
         mzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083207; x=1764688007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=httfXM+8l0sum1iuPhimnyuIWDvW8Bl0comT+k/p0tE=;
        b=UGzZOI9HzpDPOe+eaPjVADqHjxBimQHkzzIJQXqVcAOzUlbCymmzcASEMvkFIgce90
         0+cbEILIqajI/zxUCmlUvYQ8NE+9aWLPB1GJ0mCwZfqh+ipmX1v6DE2PMeJ0A4kIGL8Y
         AZXWJTUZZTV7hxdAwed1zhuHo1zyKqgOxItf1VAYzMkp+00C5t2GsOF1LDBoJoNOYekq
         IPttRSdPGi7NHzA/yuEyT84r7efe/nbSKQyoEu5SW21XlqZhmOK+mN82Oka+7KCzhrl7
         lfBWlzNBwuir90/y4TjI+odkvMYzKHmdPCXY30FHmZRz3tp5+ZaK+uCmuMzAgGVh9t/a
         hxyg==
X-Forwarded-Encrypted: i=1; AJvYcCU8RbH+1u6w0OuHg9+iRLHTl5K3IfPJAtRnTCOkN/35Cg8Vje6bUMIjKhdugtspNwVNrb1BAffRy8cw9/kmwP9JTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz72xwTr3xFGRAkWgWuhJWjVS+k6wNdE5qpIuZ5Rhj5T2swVAaQ
	r1FuEuriptniiE03OPbq9o5opPrKqmJyZ0KhMOSt8sINAypcHEFtfqrX
X-Gm-Gg: ASbGncvD9hEKLJ9niJVloZRxugJ8yviX6Y2ymUo0HSVNVdrttaaBXtQt24uroK9UAYS
	+afAc3av5GsiUWohduIvqXvld7Vt8wzbjuwVLqDcG5w+2Qg7hXGvNyO3/sB6wFqeq/BFgExQC2G
	dnns9YsJxehZam/4L/xP6yyMmKuhCU927IU//zX0uHPAj9/rJly6ggjtpc3rA5H8tnTAzCAyK59
	ARc7mpbWRofP+fW+hQXHccEL8Noychrvg9Vp/kDN6k4V8xehEIoi+fAZx5Y2TTmcezj7HNwl+cM
	s233SFFllvPO/Zo0wvEAZSO2eQFrp6WEUv3w2NOSXxMysfDyqbKUQZyxt9p86ZzKhrOcc91WjbG
	zdCz/MXEpDz6yt3BeIdloHXlYkAE+fY5YMiTOmUCUsnzI2KhXboeLFlIIRv9zI2Xv3y3/Vi9y25
	aSZgxGbJwwuaq/kWaQ18FOIX5KNI5TmpHIBuhfp1MbG4k64CcfEq+tqkQKsqUeMvJIVhPebq7Yk
	w==
X-Google-Smtp-Source: AGHT+IHjNZydxVq7AuLRYXQnRrP8lXXoOKThgfVqZ9Vnj2hHER2VIik477gS/3joBWng93Q7yIowVQ==
X-Received: by 2002:a5d:588b:0:b0:429:c2fb:c268 with SMTP id ffacd0b85a97d-42e0f35bba3mr3525798f8f.56.1764083207002;
        Tue, 25 Nov 2025 07:06:47 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm34797809f8f.32.2025.11.25.07.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:06:46 -0800 (PST)
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
Subject: [PATCH v4 16/16] serial: sh-sci: Add support for RZ/G3E RSCI
Date: Tue, 25 Nov 2025 15:06:18 +0000
Message-ID: <20251125150632.299890-17-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
References: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for RZ/G3E RSCI. RSCI IP found on the RZ/G3E SoC is similar
to RZ/T2H, but it has a 32-stage FIFO. it has 6 clocks(5 module clocks
+ 1 external clock) instead of 3 clocks(2 module clocks + 1 external
clock) on T2H and has multiple resets. Add support for the hardware
flow control.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated commit description and header
 * Updated rsci_type() to drop "scif" type instead use "rsci"
 * Replaced the compatible "renesas,r9a09g047-rscif" with
   "renesas,r9a09g047-rsci"
 * Renamed the port enum from RSCI_PORT_SCIF->RSCI_PORT_SCIF32.
 * Renamed of_rsci_scif_data->of_rsci_rzg3e_data
 * Renamed the funvtion rsci_rzg3e_scif_early_console_setup() with
   rsci_rzg3e_early_console_setup().
v2->v3:
 * Dropped cpu_relax() from rsci_finish_console_write() and added a
   comment.
 * Added sci_is_rsci_fifo_type() helper for reuse in probe() and remove().
v1->v2:
 * Updated commit description.
 * Updated multiline comment to fit into single line.
 * Updated set_termios() for getting baud_rate()
---
 drivers/tty/serial/rsci.c   | 275 ++++++++++++++++++++++++++++++++++--
 drivers/tty/serial/rsci.h   |   1 +
 drivers/tty/serial/sh-sci.c |   5 +
 3 files changed, 272 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index f6b61f33358c..94107ef3823f 100644
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
@@ -138,21 +175,160 @@ static void rsci_start_rx(struct uart_port *port)
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
@@ -177,13 +353,34 @@ static unsigned int rsci_tx_empty(struct uart_port *port)
 
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
 
 static void rsci_clear_CFC(struct uart_port *port, unsigned int mask)
@@ -313,7 +510,8 @@ static void rsci_receive_chars(struct uart_port *port)
 				continue;
 			}
 
-			/* Store data and status.
+			/*
+			 * Store data and status.
 			 * Non FIFO mode is not supported
 			 */
 			if (rdat & RDR_FFER) {
@@ -347,6 +545,28 @@ static void rsci_receive_chars(struct uart_port *port)
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
@@ -368,12 +588,21 @@ static void rsci_poll_put_char(struct uart_port *port, unsigned char c)
 static void rsci_prepare_console_write(struct uart_port *port, u32 ctrl)
 {
 	struct sci_port *s = to_sci_port(port);
-	u32 ctrl_temp =
-		s->params->param_bits->rxtx_enable | CCR0_TIE |
-		s->hscif_tot;
+	u32 ctrl_temp = s->params->param_bits->rxtx_enable;
+
+	if (s->type == RSCI_PORT_SCIF16)
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
 	return "rsci";
@@ -414,6 +643,17 @@ static const struct sci_port_params rsci_port_params = {
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
@@ -421,6 +661,8 @@ static const struct uart_ops rsci_uart_ops = {
 	.start_tx	= rsci_start_tx,
 	.stop_tx	= rsci_stop_tx,
 	.stop_rx	= rsci_stop_rx,
+	.enable_ms	= rsci_enable_ms,
+	.break_ctl	= rsci_break_ctl,
 	.startup	= sci_startup,
 	.shutdown	= sci_shutdown,
 	.set_termios	= rsci_set_termios,
@@ -440,10 +682,18 @@ static const struct sci_port_ops rsci_port_ops = {
 	.receive_chars		= rsci_receive_chars,
 	.poll_put_char		= rsci_poll_put_char,
 	.prepare_console_write	= rsci_prepare_console_write,
+	.finish_console_write	= rsci_finish_console_write,
 	.suspend_regs_size	= rsci_suspend_regs_size,
 	.shutdown_complete	= rsci_shutdown_complete,
 };
 
+struct sci_of_data of_rsci_rzg3e_data = {
+	.type = RSCI_PORT_SCIF32,
+	.ops = &rsci_port_ops,
+	.uart_ops = &rsci_uart_ops,
+	.params = &rsci_rzg3e_scif_port_params,
+};
+
 struct sci_of_data of_rsci_rzt2h_data = {
 	.type = RSCI_PORT_SCIF16,
 	.ops = &rsci_port_ops,
@@ -453,12 +703,19 @@ struct sci_of_data of_rsci_rzt2h_data = {
 
 #ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
 
+static int __init rsci_rzg3e_early_console_setup(struct earlycon_device *device,
+						 const char *opt)
+{
+	return scix_early_console_setup(device, &of_rsci_rzg3e_data);
+}
+
 static int __init rsci_rzt2h_early_console_setup(struct earlycon_device *device,
 						 const char *opt)
 {
 	return scix_early_console_setup(device, &of_rsci_rzt2h_data);
 }
 
+OF_EARLYCON_DECLARE(rsci, "renesas,r9a09g047-rsci", rsci_rzg3e_early_console_setup);
 OF_EARLYCON_DECLARE(rsci, "renesas,r9a09g077-rsci", rsci_rzt2h_early_console_setup);
 
 #endif /* CONFIG_SERIAL_SH_SCI_EARLYCON */
diff --git a/drivers/tty/serial/rsci.h b/drivers/tty/serial/rsci.h
index 9547148e8bd1..2aa2ba3973ee 100644
--- a/drivers/tty/serial/rsci.h
+++ b/drivers/tty/serial/rsci.h
@@ -5,6 +5,7 @@
 
 #include "sh-sci-common.h"
 
+extern struct sci_of_data of_rsci_rzg3e_data;
 extern struct sci_of_data of_rsci_rzt2h_data;
 
 #endif /* __RSCI_H__ */
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index e7d4cac39906..e887bca140e7 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3329,6 +3329,7 @@ static int sci_init_single(struct platform_device *dev,
 		sci_port->rx_trigger = 64;
 		break;
 	case PORT_SCIFA:
+	case RSCI_PORT_SCIF32:
 		sci_port->rx_trigger = 32;
 		break;
 	case PORT_SCIF:
@@ -3670,6 +3671,10 @@ static const struct of_device_id of_sci_match[] __maybe_unused = {
 		.data = &of_sci_scif_rzv2h,
 	},
 #ifdef CONFIG_SERIAL_RSCI
+	{
+		.compatible = "renesas,r9a09g047-rsci",
+		.data = &of_rsci_rzg3e_data,
+	},
 	{
 		.compatible = "renesas,r9a09g077-rsci",
 		.data = &of_rsci_rzt2h_data,
-- 
2.43.0


