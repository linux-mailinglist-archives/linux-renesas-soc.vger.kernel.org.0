Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6994D4ED4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Mar 2022 17:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242362AbiCJQSo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 11:18:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242146AbiCJQSE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 11:18:04 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1660C191405
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 08:16:57 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 139A9C0002;
        Thu, 10 Mar 2022 16:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1646929016;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OI+rKHEpqRIrjR3Tah2YGtk8yTfjmktV3JYE6NKdQlQ=;
        b=dTs3NKGUK1vPl99yeVirt1PGt18l2hPMSM0LqG0eRCoCkiAkbPBObpQcEokGH8/FHly5ah
        ostyAeBni+/FxTM2Wly7YTx7ld7lsHdvCEdW4MpFD47YAsZaxyOT1zmE+yRaFUheR6LBXk
        KVmRJbYAm2i8XjXbef228Mg8c6vD9eeCLwhmAsK7wf9sKn5iSzVr14z9CkSsuAO9IpYvsR
        csAoSeqsUzZ1YYmrtJrubQbUN7ZsexWAmAa3FEbRMlBdZyq/eJuvV09UIIB11co1tamwTH
        W50z2dDtj9gzUhtr94eBYY1k2lpQEBfbvX+Cn3WEptro8AJ1Tw7g0y0VsXR4DA==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/7] serial: 8250_dma: Use ->tx_dma function pointer to start next DMA
Date:   Thu, 10 Mar 2022 17:16:44 +0100
Message-Id: <20220310161650.289387-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220310161650.289387-1-miquel.raynal@bootlin.com>
References: <20220310161650.289387-1-miquel.raynal@bootlin.com>
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

From: Phil Edworthy <phil.edworthy@renesas.com>

The 8250 driver is quite flexible. Regarding DMA handling, there is the
possibility to either use the default helper (serial8250_tx_dma()) or
call a specific function. Only the omap and brcm implementation do
that. In both cases, they don't use the serial8250_tx_dma() helper at
all.

As we are going to write a new DMA handling function for the RZ/N1 SoCs
which will use the serial8250_tx_dma() implementation (preceded by a
couple of register writes), we need the ->tx_dma() pointer to link to
our own function, but within the __dma_tx_complete() helper we also need
to call our own implementation instead of the default one directly.

In order to do that, let's call ->tx_dma() instead of
serial8250_tx_dma() from __dma_tx_complete().

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
[miquel.raynal@bootlin.com: Re-write commit message]
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/tty/serial/8250/8250_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index 890fa7ddaa7f..a0563f2341ac 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -33,7 +33,7 @@ static void __dma_tx_complete(void *param)
 	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
 		uart_write_wakeup(&p->port);
 
-	ret = serial8250_tx_dma(p);
+	ret = dma->tx_dma(p);
 	if (ret)
 		serial8250_set_THRI(p);
 
-- 
2.27.0

