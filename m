Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D464D4FF0E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 09:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbiDMHy0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 03:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233512AbiDMHyU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 03:54:20 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97BB241FA4;
        Wed, 13 Apr 2022 00:51:59 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id DBB29FF806;
        Wed, 13 Apr 2022 07:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649836318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XFiyV4hvI7uUiv0v2hsPJJtKWfdwUNh4ammNKKQDV1k=;
        b=AksRdt9mtefDnv7Vr9I75h0uLx9Q1EXWNfOD3T3SFyFOEp+4ipJ1vPUj8txNeYzJ6JkvMX
        uvMFw9lywS1SMf3Zm907G8OJvn7cqYsjVy9kqqUyhYp1V2GjCCoiQtKqNMhFneJHYDWSYd
        AoR29CYoeKQSZNVZQQ+7d5NOhneelI/gohx/jhz2GLjQhXTwhi1OVeE6AETOIk8YhbESz5
        xI0Xfs7VAcRirv1K/V5sT+QP70LX7EviMc4t5x6Vao8WoFCvAytSaFchSfw0N3ld/im9wn
        qFzFMIVPSUCL84hdFUQAvmuUG5o1jSawZ4GCX47NS/cwIrPJDY4Fk3gs6F8qeQ==
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
Subject: [PATCH v5 07/11] serial: 8250: dw: Introduce an rx_timeout variable in the IRQ path
Date:   Wed, 13 Apr 2022 09:51:37 +0200
Message-Id: <20220413075141.72777-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220413075141.72777-1-miquel.raynal@bootlin.com>
References: <20220413075141.72777-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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
index babf5dc597a8..238bcdf1bab0 100644
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

