Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24CD94FF0DF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 09:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233517AbiDMHyV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 03:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233495AbiDMHyK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 03:54:10 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E421E2AE2B;
        Wed, 13 Apr 2022 00:51:49 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 10939FF803;
        Wed, 13 Apr 2022 07:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649836308;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5kSK+IjrQW24cRviZQ9BaVYH9zhXeVeAjvyFftosVsc=;
        b=OZy+6uzSTIzW7GhTnKPv+eV3wCMdLwwi1g6ydwZR1J6itAqnWJCrVzVCMjGL0dPOJTWKzm
        pyqV58UbJJxBmAGJJgtg1ZhG4/B0gvF0pG6KkL8XW+ZUIN2Sw12Gy4ds1yDTVm2wpUrgh0
        4OQNquhc860JZFt8hvIvRMu8BKXnnF8amRSzuJa+owL97rRXNeEIa6LFh50tCGr6KIUyUT
        2jUjp7ax0v6g3Ja26kUMmrGs49JBF/1rNmm/FxrC2Y9nRkSW51w286kwamNwtrgCVEk1QB
        eass6MrwTJozCFcbfJ/jsXf+ESSAHq1ZpHl5w5N4/5BdbBdfXZkuMaOSm02MRA==
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
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
        Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v5 02/11] serial: 8250: dw: Use the device API
Date:   Wed, 13 Apr 2022 09:51:32 +0200
Message-Id: <20220413075141.72777-3-miquel.raynal@bootlin.com>
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

Use the device API instead of the of_* API.
While at it move this operation outside of the if block to reduce the
indentation level.

Cc: Emil Renner Berthing <kernel@esmil.dk>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 1666041513a5..e9f8b65563a1 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -19,6 +19,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/workqueue.h>
 #include <linux/notifier.h>
 #include <linux/slab.h>
@@ -371,9 +372,9 @@ static bool dw8250_idma_filter(struct dma_chan *chan, void *param)
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

