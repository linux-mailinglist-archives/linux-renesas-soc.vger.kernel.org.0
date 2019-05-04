Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9E0136A8
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 May 2019 02:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbfEDApb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 20:45:31 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40536 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbfEDApb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 20:45:31 -0400
Received: by mail-wr1-f65.google.com with SMTP id h4so9853590wre.7;
        Fri, 03 May 2019 17:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sMqlC6T/pDP84f5tXF9/8B2A9RjGIFKJexKEfFDd6F0=;
        b=NgzaCTuDb+k/M7/bM6wlDXR/9dhXfONj31X9UBQgT+lLYQA0SLouT3nKpQC57/Y3zx
         RF5nFVE6t0iQ4spEX48ywmtXfVdG/TR+XiloXWIXcu59YB58KWaOOIE3yJdb0390jxRL
         r9h1D1OGaCEw0/xCpH8qzLFNYlTmO3S5PqZopqsTE8aoz3L/s0DG1fCqnoTAG4tgu3Y5
         eR+G+bA3IgZzjo0v9y1uDG+IG4JPuCpx+y0blD5fo0Ez813mSoCRQ2aGqxMdWrUveU/9
         82sDXPxrqb3RXeKJo1Ah3B6aEkrlTH6BH2jhfptWtwcTHaGBR8z1cgoMR9HaiBtK8Y3A
         2+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sMqlC6T/pDP84f5tXF9/8B2A9RjGIFKJexKEfFDd6F0=;
        b=fFGh+feyo6Hfq9ElfFn/EQ9erI4S7czdazM1zhZ/c4AoGhpnIa8b6Whd+1tXoFCGnh
         DwxmCAREm3zxfIbH46tTv+45IanwIDcKSNSJOq0W40XihtNtNNQ3g6kuycGFQNguNaGS
         tH1SId29ut1Ms/HvMOjsKtFpQx/l/t+yejkgTdZjcyyj5d8IWulFNgfH3im69Qn67bo0
         WIO49aIrOUHe9A7S+Sk/U3f5i6YIUZ3CJG8u7DwEYwJ/neIxtcaBZt1pJk4XCXvdVxk9
         4Xxoa/7Fq//GBwBWMea7e210N6yFpjIV3Mca4ak6b2vCdr26aTiHwiqQ4ORJkEX133Bt
         6XJw==
X-Gm-Message-State: APjAAAV2C6o5opXkUr6oxjSeKv81T2RN6Q0fQi3XaZV5H+cyYbHBEyB7
        Lt680zv4XK7rjXcZ3tjBVR0=
X-Google-Smtp-Source: APXvYqwOyYUVQhhiLp0oWbe1KzrPalyUTE72wkvMD9D6qv4Iz9QMpuvF+7jA/WnKpNhO+yMBhIUD/w==
X-Received: by 2002:adf:c748:: with SMTP id b8mr9065704wrh.292.1556930728909;
        Fri, 03 May 2019 17:45:28 -0700 (PDT)
Received: from localhost.localdomain (ipb218f40a.dynamic.kabel-deutschland.de. [178.24.244.10])
        by smtp.gmail.com with ESMTPSA id b11sm5979161wmh.29.2019.05.03.17.45.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 03 May 2019 17:45:28 -0700 (PDT)
From:   Eugeniu Rosca <roscaeugeniu@gmail.com>
X-Google-Original-From: Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "George G . Davis" <george_davis@mentor.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: [PATCH 1/6] serial: sh-sci: Reveal ptrval in dev_dbg
Date:   Sat,  4 May 2019 02:42:53 +0200
Message-Id: <20190504004258.23574-2-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190504004258.23574-1-erosca@de.adit-jv.com>
References: <20190504004258.23574-1-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Starting with v4.15-rc2 commit ad67b74d2469d9 ("printk: hash addresses
printed with %p"), enabling debug prints in sh-sci.c would generate
output like below confusing the users who try to sneak into the
internals of the driver:

sh-sci e6e88000.serial: sci_request_dma: TX: got channel (____ptrval____)
sh-sci e6e88000.serial: sci_request_dma: mapped 4096@(____ptrval____) to 0x00000006798bf000
sh-sci e6e88000.serial: sci_request_dma: RX: got channel (____ptrval____)
sh-sci e6e88000.serial: sci_dma_tx_work_fn: (____ptrval____): 0...2, cookie 2

There are two possible fixes for that:
 - get rid of '%p' prints if they don't reveal any useful information
 - s/%p/%px/, since it is unlikely we have any concerns leaking the
   pointer values when running a debug/non-production kernel

Go second route to preserve original debug output and minimize the diff.

Fixes: ad67b74d2469d9 ("printk: hash addresses printed with %p")
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 drivers/tty/serial/sh-sci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 3cd139752d3f..82660f8e6d86 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1434,7 +1434,7 @@ static void sci_dma_tx_work_fn(struct work_struct *work)
 		goto switch_to_pio;
 	}
 
-	dev_dbg(port->dev, "%s: %p: %d...%d, cookie %d\n",
+	dev_dbg(port->dev, "%s: %px: %d...%d, cookie %d\n",
 		__func__, xmit->buf, xmit->tail, xmit->head, s->cookie_tx);
 
 	dma_async_issue_pending(chan);
@@ -1570,7 +1570,7 @@ static void sci_request_dma(struct uart_port *port)
 		return;
 
 	chan = sci_request_dma_chan(port, DMA_MEM_TO_DEV);
-	dev_dbg(port->dev, "%s: TX: got channel %p\n", __func__, chan);
+	dev_dbg(port->dev, "%s: TX: got channel %px\n", __func__, chan);
 	if (chan) {
 		/* UART circular tx buffer is an aligned page. */
 		s->tx_dma_addr = dma_map_single(chan->device->dev,
@@ -1581,7 +1581,7 @@ static void sci_request_dma(struct uart_port *port)
 			dev_warn(port->dev, "Failed mapping Tx DMA descriptor\n");
 			dma_release_channel(chan);
 		} else {
-			dev_dbg(port->dev, "%s: mapped %lu@%p to %pad\n",
+			dev_dbg(port->dev, "%s: mapped %lu@%px to %pad\n",
 				__func__, UART_XMIT_SIZE,
 				port->state->xmit.buf, &s->tx_dma_addr);
 
@@ -1591,7 +1591,7 @@ static void sci_request_dma(struct uart_port *port)
 	}
 
 	chan = sci_request_dma_chan(port, DMA_DEV_TO_MEM);
-	dev_dbg(port->dev, "%s: RX: got channel %p\n", __func__, chan);
+	dev_dbg(port->dev, "%s: RX: got channel %px\n", __func__, chan);
 	if (chan) {
 		unsigned int i;
 		dma_addr_t dma;
-- 
2.21.0

