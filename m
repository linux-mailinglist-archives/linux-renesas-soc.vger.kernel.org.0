Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EAC5509CCB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 11:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387930AbiDUJ4g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 05:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387934AbiDUJ43 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 05:56:29 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C1225581;
        Thu, 21 Apr 2022 02:53:39 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 79A831BF20E;
        Thu, 21 Apr 2022 09:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650534818;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1o9gHj8wxamYjHVCuaoFpSvvDAO8QSz0Ljq85N7Dk7I=;
        b=nVaj+B69IukC3pSCpy3N042jySgDALJQEBk9rxoSI+2ayU10fKj+GX/lIe7mKNT6IEgf3h
        35Zsp0/056N3zi1OrCSv+kk5LMo5wTWfI3SYaXQeenQyaKuM8kECYn8r1DKklvbV5yqSW7
        U1dxFztd93k/Iz+OgiVf3fedVbtABax5jRAo2GNxACoXEB4j1nttNd/kw0Qt0Ale53ITrd
        HTQWHnimbGjRNt3w+87zuaSi4dCzD6AW9K6r5H/Wj8ev3mXV0URpOlptW+JSEfc4DRizqg
        d9CvCwZTZWqZVZ+HczAfpxXdID4ASvfnUcn7aK/Z+i4FXVrCXsb5hm/qs4IGdQ==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v6 06/12] serial: 8250: dw: Introduce an rx_timeout variable in the IRQ path
Date:   Thu, 21 Apr 2022 11:53:17 +0200
Message-Id: <20220421095323.101811-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220421095323.101811-1-miquel.raynal@bootlin.com>
References: <20220421095323.101811-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In a next change we are going to need the same Rx timeout condition as
we already have in the IRQ handling code. Let's just create a boolean to
clarify what this operation does before reusing it.

There is no functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index b34edc88af3d..ef3f05c82ad6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -225,6 +225,7 @@ static int dw8250_handle_irq(struct uart_port *p)
 	struct uart_8250_port *up = up_to_u8250p(p);
 	struct dw8250_data *d = to_dw8250_data(p->private_data);
 	unsigned int iir = p->serial_in(p, UART_IIR);
+	bool rx_timeout = (iir & 0x3f) == UART_IIR_RX_TIMEOUT;
 	unsigned int status;
 	unsigned long flags;
 
@@ -238,7 +239,7 @@ static int dw8250_handle_irq(struct uart_port *p)
 	 * This problem has only been observed so far when not in DMA mode
 	 * so we limit the workaround only to non-DMA mode.
 	 */
-	if (!up->dma && ((iir & 0x3f) == UART_IIR_RX_TIMEOUT)) {
+	if (!up->dma && rx_timeout) {
 		spin_lock_irqsave(&p->lock, flags);
 		status = p->serial_in(p, UART_LSR);
 
-- 
2.27.0

