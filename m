Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 037D24DCCC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Mar 2022 18:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237061AbiCQRsH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Mar 2022 13:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237063AbiCQRrx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Mar 2022 13:47:53 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C62C1EC984;
        Thu, 17 Mar 2022 10:46:36 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 19AF7FF80B;
        Thu, 17 Mar 2022 17:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1647539195;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KKVr7N2j8FFtbngS0O/xzuSQW98DT1L97+gy+JEQYOU=;
        b=VGF5C5lkEhnb41EQFdPwrQs91EsA2JeSgmsqkR1sxPCMgx1N+t/kAU6LVpXVaHUqmyE5w2
        Lq5zJMWMOraS9IvzGI3xXg9qWtVAyz5qoKUiWe7mkiCDCO81b7n//huz+yE9TD2FPQxLO0
        x0ncHWHkUICsibpjijIlyZZENR+MZP6MbGR4ORaVZ2EhtOBPCrFvCXWBJtYLDrO0Pgl63v
        9CRn0ZVsoKv+NOYyjkH+gPZXTRulx448JxA9/iOUrOalBC5fseltxgJv+CudxnR77VvMyD
        gF0SDwiICiX3YtUZXjogCLOBpj80Bv+/Du3uiDB349s4RsMyL5ECVFIJb4cPCw==
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
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v2 02/10] serial: 8250: dw: Use the device API
Date:   Thu, 17 Mar 2022 18:46:19 +0100
Message-Id: <20220317174627.360815-3-miquel.raynal@bootlin.com>
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

Use the device API instead of the of_* API.
While at it move this operation outside of the if block to reduce the
indentation level.

Cc: Emil Renner Berthing <kernel@esmil.dk>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
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

