Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 299DC4EB035
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 17:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238523AbiC2P0Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 11:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238514AbiC2P0V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 11:26:21 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611F36831D;
        Tue, 29 Mar 2022 08:24:38 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 5F4F5100004;
        Tue, 29 Mar 2022 15:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648567477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wytuO7Me9MjXv7Hhp4w2eOGWZDHmrxoRQSwtCDnU0cU=;
        b=pnGTPPR95WcATjwOIEXjLWAWDwGu9DtfZ+lq/wybMuUOMJpvgdafjoHAXjUSO0GmcE1MgP
        DvLc+ahdNxEgd7/Lq4XgJgyP7227aa2gAgWUZ//f/e2mHv3OiW/zLwRHWTGGZAlgbLNrJX
        uMEYmnHEG9O+r52a8mXZW72yVXxuv6xdd50EENWBAh788hoNNr6YmRhdVCmMvRl4T8gyL8
        980+VOVb/Zpy8qrZ9AzlPFsHeIS3oyLWTaPcDYBV5xOkaXdWHm0W+vBwKKX94Op1ltLmQ+
        WcQyuo40jO/+DX+9G2a0gRHL4BOqSIhl66+QfM5HlWU8QtBK9/izHi6bFAI71Q==
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
        Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v3 02/10] serial: 8250: dw: Use the device API
Date:   Tue, 29 Mar 2022 17:24:22 +0200
Message-Id: <20220329152430.756947-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220329152430.756947-1-miquel.raynal@bootlin.com>
References: <20220329152430.756947-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_BL_SPAMCOP_NET,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the device API instead of the of_* API.
While at it move this operation outside of the if block to reduce the
indentation level.

Cc: Emil Renner Berthing <kernel@esmil.dk>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/8250/8250_dw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index d89731d6c94c..28f0dea2ed88 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -376,9 +376,9 @@ static bool dw8250_idma_filter(struct dma_chan *chan, void *param)
 static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 {
 	struct device_node *np = p->dev->of_node;
+	unsigned long quirks = (unsigned long)device_get_match_data(p->dev);
 
 	if (np) {
-		unsigned long quirks = (unsigned long)of_device_get_match_data(p->dev);
 		int id;
 
 		/* get index of serial line, if found in DT aliases */
-- 
2.27.0

