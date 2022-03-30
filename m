Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F20824EC576
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 15:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345997AbiC3NXL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 09:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345894AbiC3NWo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 09:22:44 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA924924A;
        Wed, 30 Mar 2022 06:20:57 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 005B5240019;
        Wed, 30 Mar 2022 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648646455;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JsBf7EKV8RqbFBrnOs2PXsmVApqOvKVpjknHgkugL6c=;
        b=Tbf0sPeEQ6kn+bP9uSTI7a9EsQ3/jh0u0YsLqzE9Ad38IhWs4+z2BnCLSvydFPN8BRJaUs
        v9fmBHUNkdVZqEDystIRa7NMiPtZl4Nxs1l8D2pxKK2UJGflgUBZMIALzGs0vTkEHRhdh7
        C+Is8G6y/SG8eJ5xMy0lK6oM5845DBzObYVBVgA3cTvXYNoDu9Q3OHEfEsGP6SdBn3XXgo
        IaNbTliWkbQaaoP9GqvWPvZJQBmWSsyjWbCizVtFfcULxTeb2BT66tMq1Mg4A7Azx/JPRK
        i/u9Mjiko33ahtiS+Plzhd+PG19V4MHFOZE8POCIg+CQrEY2xGs1r3rAEQy8Tw==
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
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH v4 8/9] serial: 8250: dw: Improve RZN1 support
Date:   Wed, 30 Mar 2022 15:20:37 +0200
Message-Id: <20220330132038.808679-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220330132038.808679-1-miquel.raynal@bootlin.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Phil Edworthy <phil.edworthy@renesas.com>

Renesas RZ/N1 SoC features a slightly modified DW UART.

On this SoC, the CPR register value is known but not synthetized in
hardware. We hence need to provide a CPR value in the platform
data. This version of the controller also relies on acting as flow
controller when using DMA, so we need to provide the
"is dma flow controller" quirk.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/tty/serial/8250/8250_dw.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 977a473535e8..195aa4516b2b 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -755,7 +755,10 @@ static const struct dw8250_platform_data dw8250_armada_38x_data = {
 	.quirks = DW_UART_QUIRK_ARMADA_38X,
 };
 
-static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {};
+static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
+	.quirks = DW_UART_QUIRK_IS_DMA_FC,
+	.cpr = 0x00012f32,
+};
 
 static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
 	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
-- 
2.27.0

