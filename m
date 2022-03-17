Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 253CD4DCCD2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Mar 2022 18:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237074AbiCQRsL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Mar 2022 13:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237127AbiCQRsC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Mar 2022 13:48:02 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C0DF1F161C;
        Thu, 17 Mar 2022 10:46:45 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 4470DFF80D;
        Thu, 17 Mar 2022 17:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1647539203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QkFsoUM1G2A8N1gYSgo0lG2lRmJrwCRFb9Kysg5VQRQ=;
        b=VrB31/v35ewU1uLBtkME+ZhzbM/hGRMdq0f4EjBGYTxR7gqk6yH9tW17U9fuutD8IYTGOn
        Zg5Ekv0ZVCVFemWOVBQSSL25rWoXkh4dDCf9TZasn3l8S5Yw+sB7GgrOQJbb5wdOt18cCM
        +IWP/RFN1Nhtu3zPw4UO9PB1nONdXVM7bxaMeKAVJKdQQe7WlhSOPQTNJHHUsgfZnjqWBX
        agVlFNDT10oDUH8Pxvr2Hf3kL/Tjb+DCh/Z7Zij8dtT2pX/qGLI4umvbbUsWMzzTLePrz1
        QaAOCwQJehgGrroy8Ohy/Bx0xT94nMl7PFJdv1EgX+HI6qknUE1/ogWZ/SGmVg==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-serial@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 07/10] serial: 8250: dw: Introduce an rx_timeout variable in the IRQ path
Date:   Thu, 17 Mar 2022 18:46:24 +0100
Message-Id: <20220317174627.360815-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220317174627.360815-1-miquel.raynal@bootlin.com>
References: <20220317174627.360815-1-miquel.raynal@bootlin.com>
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
---
 drivers/tty/serial/8250/8250_dw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 2f4a818f787c..c27f32f67680 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -228,6 +228,7 @@ static int dw8250_handle_irq(struct uart_port *p)
 	struct uart_8250_port *up = up_to_u8250p(p);
 	struct dw8250_data *d = to_dw8250_data(p->private_data);
 	unsigned int iir = p->serial_in(p, UART_IIR);
+	bool rx_timeout = (iir & 0x3f) == UART_IIR_RX_TIMEOUT;
 	unsigned int status;
 	unsigned long flags;
 
@@ -241,7 +242,7 @@ static int dw8250_handle_irq(struct uart_port *p)
 	 * This problem has only been observed so far when not in DMA mode
 	 * so we limit the workaround only to non-DMA mode.
 	 */
-	if (!up->dma && ((iir & 0x3f) == UART_IIR_RX_TIMEOUT)) {
+	if (!up->dma && rx_timeout) {
 		spin_lock_irqsave(&p->lock, flags);
 		status = p->serial_in(p, UART_LSR);
 
-- 
2.27.0

