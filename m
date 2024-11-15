Return-Path: <linux-renesas-soc+bounces-10532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D499CE07C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Nov 2024 14:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDFC01F23C2E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Nov 2024 13:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EFF1D47A8;
	Fri, 15 Nov 2024 13:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qkQRBzjs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001AB1D434D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Nov 2024 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731678258; cv=none; b=n3Smgct4Ubn+CN1N3t/uVJwtFVgc+F0cQkUZTGtN2vQcCf24GRGAmv29ekrVbNKjW8zwrRmn8dUjqxSwIfLkujxESkTAeK55aB1Y67VPoPXACT9Cdlrb9NzyxFIlEnyRlK4JTjHiTw3TcEmLUIRKkTk6nOccJOw9vFuktqL17QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731678258; c=relaxed/simple;
	bh=+KsWKchUufpoPCqQG4uoP+gjV/+ev+Z95Zo8TDMS2kI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=auGiv6ngMXPR9g0Ii3kKANIzVtwm/rxePmUC7yYESo9FeQPI9iMP57yD8PrXkdpBFQeyXHZ4SDgKgpxyUXuJKddPMaNnUHfuSfIdEGtw4juiqa61eu9IW3p+y9iZb8dpcuPq2bjM3O8V7+BRQp5UW/xpoRWZxrvYul6L5jpe7F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qkQRBzjs; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38221306992so922411f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Nov 2024 05:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731678254; x=1732283054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iEdUECHFmk4I0P8OuONHc3S4huRYfPCWKtdoNW9iyY=;
        b=qkQRBzjsQDBZhPyKsArYJYMTPAyDHxJbIhqRXNhHDsQhqyXAtjG6B+rXXbIJ++um3O
         8UoAiB0O8Y9SDfDK4lM0ArASN5/mB2K1AHAC8123LFSVXgGFCI6/iyhzVW2202vLc4b1
         7XsY7KXJo6pq9MSb+3+NJxuUeqCrT71FmmIv3EfxB1jmLx1shumk6JSrNAwEi1qoXq23
         g52HaR0KutETH1C5q39MfUJnLkR88YDMkQQEK1vz00SHWMxnsQ3FGqAoM3xUbHqe3pg9
         HXg6mng0vBoQ1OPEf+gCuA0ZG0SGqG7e6FTpzz6lMQJVa5E3yFtQ3FuBe27kJFq5twn0
         NocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731678254; x=1732283054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8iEdUECHFmk4I0P8OuONHc3S4huRYfPCWKtdoNW9iyY=;
        b=eYBBFZ0TWQAeLywActt6U1knAKhst5LggklYluyyGr4SFbIcwYh2bWQRbRwYTNbPua
         PT5xNydNLM3lduan5EaYpdwVPeW1HbQtjWzZvaDZlpVvf6UeqTEaZF4f5wbb4TUzpLZ1
         XSerT9OjKN0ChmwdGCnywq3T3D9NXiUfGSrJ+fOnhlmNOREZKDSgq/zLag3h5+i6GOY8
         d9Vkc8vA1wBOup0v5yC1cLBxdR/gM9XnPSPbYV9EHvY3VOIk65ToF4NUZYczQ2Aujnpt
         HBGJfcfPjl1rwFekZRYYpRFSreYQbKcUU/2hOEymPmCMAnPXQjNs1jKDq9W8Y3fXJ6FV
         0XeQ==
X-Gm-Message-State: AOJu0Yxgr0B5WHqNheuZS6wjmdja6nTkZt9CQrZh87m8mGUX6fqjCenP
	O784wnvOuzpHiVSAmLG+sjn8Q8uwCZpbCaItEyy67tjjk0mJRX5Mmkmt6IpL5lY=
X-Google-Smtp-Source: AGHT+IHREok9BoAyXyx6cs96noJtJb7OY9pRSi5wp/pt8MiabvddgDJ+Peg3bta54bxlDckbF5XiWw==
X-Received: by 2002:a05:6000:460b:b0:37c:cc77:3e72 with SMTP id ffacd0b85a97d-38225a86684mr2136074f8f.33.1731678254355;
        Fri, 15 Nov 2024 05:44:14 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada3fc9sm4378016f8f.20.2024.11.15.05.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 05:44:13 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	p.zabel@pengutronix.de,
	lethal@linux-sh.org,
	g.liakhovetski@gmx.de
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/8] serial: sh-sci: Check if TX data was written to device in .tx_empty()
Date: Fri, 15 Nov 2024 15:43:55 +0200
Message-Id: <20241115134401.3893008-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On the Renesas RZ/G3S, when doing suspend to RAM, the uart_suspend_port()
is called. The uart_suspend_port() calls 3 times the
struct uart_port::ops::tx_empty() before shutting down the port.

According to the documentation, the struct uart_port::ops::tx_empty()
API tests whether the transmitter FIFO and shifter for the port is
empty.

The Renesas RZ/G3S SCIFA IP reports the number of data units stored in the
transmit FIFO through the FDR (FIFO Data Count Register). The data units
in the FIFOs are written in the shift register and transmitted from there.
The TEND bit in the Serial Status Register reports if the data was
transmitted from the shift register.

In the previous code, in the tx_empty() API implemented by the sh-sci
driver, it is considered that the TX is empty if the hardware reports the
TEND bit set and the number of data units in the FIFO is zero.

According to the HW manual, the TEND bit has the following meaning:

0: Transmission is in the waiting state or in progress.
1: Transmission is completed.

It has been noticed that when opening the serial device w/o using it and
then switch to a power saving mode, the tx_empty() call in the
uart_port_suspend() function fails, leading to the "Unable to drain
transmitter" message being printed on the console. This is because the
TEND=0 if nothing has been transmitted and the FIFOs are empty. As the
TEND=0 has double meaning (waiting state, in progress) we can't
determined the scenario described above.

Add a software workaround for this. This sets a variable if any data has
been sent on the serial console (when using PIO) or if the DMA callback has
been called (meaning something has been transmitted). In the tx_empty()
API the status of the DMA transaction is also checked and if it is
completed or in progress the code falls back in checking the hardware
registers instead of relying on the software variable.

Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- s/first_time_tx/tx_occurred/g
- checked the DMA status in sci_tx_empty() through sci_dma_check_tx_occurred()
  function; added this new function as the DMA support is conditioned by
  the CONFIG_SERIAL_SH_SCI_DMA flag
- dropped the tx_occurred initialization in sci_shutdown() as it is already
  initialized in sci_startup()
- adjusted the commit message to reflect latest changes

Changes in v2:
- use bool type instead of atomic_t

 drivers/tty/serial/sh-sci.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 136e0c257af1..ade151ff39d2 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -157,6 +157,7 @@ struct sci_port {
 
 	bool has_rtscts;
 	bool autorts;
+	bool tx_occurred;
 };
 
 #define SCI_NPORTS CONFIG_SERIAL_SH_SCI_NR_UARTS
@@ -850,6 +851,7 @@ static void sci_transmit_chars(struct uart_port *port)
 {
 	struct tty_port *tport = &port->state->port;
 	unsigned int stopped = uart_tx_stopped(port);
+	struct sci_port *s = to_sci_port(port);
 	unsigned short status;
 	unsigned short ctrl;
 	int count;
@@ -885,6 +887,7 @@ static void sci_transmit_chars(struct uart_port *port)
 		}
 
 		sci_serial_out(port, SCxTDR, c);
+		s->tx_occurred = true;
 
 		port->icount.tx++;
 	} while (--count > 0);
@@ -1241,6 +1244,8 @@ static void sci_dma_tx_complete(void *arg)
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
 
+	s->tx_occurred = true;
+
 	if (!kfifo_is_empty(&tport->xmit_fifo)) {
 		s->cookie_tx = 0;
 		schedule_work(&s->work_tx);
@@ -1731,6 +1736,16 @@ static void sci_flush_buffer(struct uart_port *port)
 		s->cookie_tx = -EINVAL;
 	}
 }
+
+static void sci_dma_check_tx_occurred(struct sci_port *s)
+{
+	struct dma_tx_state state;
+	enum dma_status status;
+
+	status = dmaengine_tx_status(s->chan_tx, s->cookie_tx, &state);
+	if (status == DMA_COMPLETE || status == DMA_IN_PROGRESS)
+		s->tx_occurred = true;
+}
 #else /* !CONFIG_SERIAL_SH_SCI_DMA */
 static inline void sci_request_dma(struct uart_port *port)
 {
@@ -1740,6 +1755,10 @@ static inline void sci_free_dma(struct uart_port *port)
 {
 }
 
+static void sci_dma_check_tx_occurred(struct sci_port *s)
+{
+}
+
 #define sci_flush_buffer	NULL
 #endif /* !CONFIG_SERIAL_SH_SCI_DMA */
 
@@ -2076,6 +2095,12 @@ static unsigned int sci_tx_empty(struct uart_port *port)
 {
 	unsigned short status = sci_serial_in(port, SCxSR);
 	unsigned short in_tx_fifo = sci_txfill(port);
+	struct sci_port *s = to_sci_port(port);
+
+	sci_dma_check_tx_occurred(s);
+
+	if (!s->tx_occurred)
+		return TIOCSER_TEMT;
 
 	return (status & SCxSR_TEND(port)) && !in_tx_fifo ? TIOCSER_TEMT : 0;
 }
@@ -2247,6 +2272,7 @@ static int sci_startup(struct uart_port *port)
 
 	dev_dbg(port->dev, "%s(%d)\n", __func__, port->line);
 
+	s->tx_occurred = false;
 	sci_request_dma(port);
 
 	ret = sci_request_irq(s);
-- 
2.39.2


