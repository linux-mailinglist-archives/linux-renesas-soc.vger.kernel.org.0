Return-Path: <linux-renesas-soc+bounces-10915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9999E4066
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 18:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B317B387E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 16:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC6C2144A5;
	Wed,  4 Dec 2024 15:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="V7zFlQL5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A442144AA
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Dec 2024 15:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327899; cv=none; b=Ix9Kp+1PPw9ILOMGxhfZRCoarr4IqqFnkPvdqF4Iu31BKAJ1cIjm4ZCWE1gud1KVMWn7KH/6rtJj35Ld5agKi2euTlo2q+IAOyE+pByl8aiMiYYYJI8Ky8cplPJs+maHesC3xStc0eYLULflklsPN9bjGhNOqq559S6sgeBxqL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327899; c=relaxed/simple;
	bh=eKmGJN/hdldvnD2ziuy0kMEX3JoK/YzfUj6m/JU908Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qNCxuas/Z56iL4kxzE04eWg90r/jYjhjbnSy7Cu57K8k1XDXc98xZUHEwm/XBY5c6LdGQbyDkw21whNI0RQfo5staSAnDHgS7EEq7+loW8UoRCo2QaDmrbHguNZV3fGJIivA1qLJtujpIiESWLqdfNQrcUAlmeBmf4rX6FQC8hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=V7zFlQL5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-432d86a3085so58889105e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Dec 2024 07:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733327896; x=1733932696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k67t0AHTbgurPxTOX/jkHsLw2xGkhWr4QjypFy+JQHs=;
        b=V7zFlQL5FJq6uN8jU5zMVEdkrePPmTG+cYAYFvmUhUzgYsZmhjNsfrp6buvM1qi3JW
         sPRuRAqEOl+8fe/tYO71zZl2pETtqn0yBKyM6Y66r94zD66ImyNXRSt3aY1eYVSN9ivm
         h/nEo0PRRUu0/APpwfrSKjekcxdOerdYomnbzIDVDmiTkXyrLhGb5vtW6fPj4pEAPVje
         iePQ0BoopIn9F+uJ2ntBGA63sJMsl0pacOfzlAHVTgMebAp7JUxSWeEiX/bXOJi2I9lI
         WDLcQoHJTHlcrPWFeIOvkT3xCsCbMVFKuUildSTdLeVPxuKLEUtIY6Og32/hAFcCIRHp
         70EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327896; x=1733932696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k67t0AHTbgurPxTOX/jkHsLw2xGkhWr4QjypFy+JQHs=;
        b=Kr7e2/XSd/+0ES+wsT7guvYiIUCrGwMlW/yeryk0cN6JKhxWtl6rGn6AcxO8MXfNxn
         n1MMHgZaTm9RZQ04+hZTegoFE3q4KDI+DV7Pc445T8A7bkUG0zseU6+1tR82mFOamkl7
         IBK5GPW8QIzWipYD7juB6dUnnx5nsafOAz3eMkOXpIJrHbr3DIf6mTx5mM2ezoBxC0kA
         LeTillLQJrWhiTkp+n799/7BHXTkkW1EiNt2QtT56CZXrxkC6ZvhD47QoY+s1NsO1jw9
         wzrDY2raEA3AW5jiKTLEFbD2W0ZPIFOcG6zBJZ5n6YMi5Y/5RbloNIBY8SuRtDPTSOxB
         9fjA==
X-Forwarded-Encrypted: i=1; AJvYcCXDBZ9Yy92exWySzmlqKk5rwTGkAQ4eORzMAGUYWWgeM5WFMZ7b4mNaTkPUeXZfmsb6Ga14YahVfgpsPvjrKVbkQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7sOMxYUsEwmefVL2GD//TY+NEGpuH1JQ9j83+V+0ZQnBXyL9j
	ileIDhD37iAKPP1qYObjtwq8fxyE6LISPamd9Z55iAhMK9zzqyBf3lk+bfFvaY8=
X-Gm-Gg: ASbGncsg++GdqnP+aJTGSFNEnS//8KPzHHyOy1n1C2jQXIkepUmsqQGwbhecc/Hjc6U
	diI5/3q7//6AsgeFMtHe/tPPCre1ucFPy+ZjCg5aWl1dtM8ulxW3aIXtpI4LrXr5p9im/F10tD7
	ZJQvwVWqSduii4t21GC/tUf+ZTLWACm9YUokukbXS8gOqHpJ1rBIqOfnbUB5yDvEwXM5vJUN5Zx
	Iu7kOrkZQA2sc5RHC9zmlO4uxLYBekyH/ebQzdunfyyxR9KRPy6mH5O8u3iIhlJxzbi/Pt2AO7Z
	zOw5
X-Google-Smtp-Source: AGHT+IGXCyAtkFpwaTBfcYQVs6ode3X2km7CTocnfjtuPAOGNzHHc8ilh09JcBMny1fNIazaj2zftQ==
X-Received: by 2002:a05:600c:1f8f:b0:434:a396:9474 with SMTP id 5b1f17b1804b1-434d09cbe39mr63094175e9.18.1733327895803;
        Wed, 04 Dec 2024 07:58:15 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52b5677sm29043695e9.37.2024.12.04.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:58:15 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	wsa+renesas@sang-engineering.com,
	geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lethal@linux-sh.org,
	g.liakhovetski@gmx.de,
	groeck@chromium.org,
	mka@chromium.org,
	ulrich.hecht+renesas@gmail.com,
	ysato@users.sourceforge.jp
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH RFT 1/6] serial: sh-sci: Check if TX data was written to device in .tx_empty()
Date: Wed,  4 Dec 2024 17:58:01 +0200
Message-Id: <20241204155806.3781200-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com>
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
 drivers/tty/serial/sh-sci.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index df523c744423..924b803af440 100644
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
@@ -1731,6 +1736,19 @@ static void sci_flush_buffer(struct uart_port *port)
 		s->cookie_tx = -EINVAL;
 	}
 }
+
+static void sci_dma_check_tx_occurred(struct sci_port *s)
+{
+	struct dma_tx_state state;
+	enum dma_status status;
+
+	if (!s->chan_tx)
+		return;
+
+	status = dmaengine_tx_status(s->chan_tx, s->cookie_tx, &state);
+	if (status == DMA_COMPLETE || status == DMA_IN_PROGRESS)
+		s->tx_occurred = true;
+}
 #else /* !CONFIG_SERIAL_SH_SCI_DMA */
 static inline void sci_request_dma(struct uart_port *port)
 {
@@ -1740,6 +1758,10 @@ static inline void sci_free_dma(struct uart_port *port)
 {
 }
 
+static void sci_dma_check_tx_occurred(struct sci_port *s)
+{
+}
+
 #define sci_flush_buffer	NULL
 #endif /* !CONFIG_SERIAL_SH_SCI_DMA */
 
@@ -2076,6 +2098,12 @@ static unsigned int sci_tx_empty(struct uart_port *port)
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
@@ -2247,6 +2275,7 @@ static int sci_startup(struct uart_port *port)
 
 	dev_dbg(port->dev, "%s(%d)\n", __func__, port->line);
 
+	s->tx_occurred = false;
 	sci_request_dma(port);
 
 	ret = sci_request_irq(s);
-- 
2.39.2


