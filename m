Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEE24EC56B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 15:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245017AbiC3NWg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 09:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345826AbiC3NWd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 09:22:33 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD94C488AB;
        Wed, 30 Mar 2022 06:20:46 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id D3D8F240008;
        Wed, 30 Mar 2022 13:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648646445;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vFe6P3axebG1pOICAJA9/s5G/k36eLkHvgiVyBcLiH0=;
        b=k7CCjFGI9opxoOORGzgFFFbU4U3NdzdAksqVkrRot2sLAMiEEjNctklUwSPYbMpaIX2C6z
        6mBdvNSvGsA2u/m665XpZB8YiRowdXgl4GU/1xSapsI7qR0X+KIj1oh4OuargDZdhLBDUI
        2VzDOJx3haNOo0zRlqSEHGDoAZCcU7AUztnqGAyEo0c0kuuw9YdLeduIzXg/4YKKvrI7oy
        VuTm4J2SU7mwZ+eTWLcUttrFx9wLdy2NWFe3nbXKgsRnDiZspeGy86eGo3dxVjwu4CW0nw
        uf859JGEfDIyuCfOymysGE0KzcMNdnRj6R2Gdk/FvOGRsrIs6JrVZFoahrVFbw==
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
Subject: [PATCH v4 2/9] serial: 8250: dw: Use the device API
Date:   Wed, 30 Mar 2022 15:20:31 +0200
Message-Id: <20220330132038.808679-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220330132038.808679-1-miquel.raynal@bootlin.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
index 1666041513a5..b6238b9bf0b2 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -371,9 +371,9 @@ static bool dw8250_idma_filter(struct dma_chan *chan, void *param)
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

