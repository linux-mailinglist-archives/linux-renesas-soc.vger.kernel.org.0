Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 955084EB047
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 17:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238541AbiC2P1A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 11:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238543AbiC2P0n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 11:26:43 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20CE8694BC;
        Tue, 29 Mar 2022 08:24:52 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id C08A010000E;
        Tue, 29 Mar 2022 15:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648567491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bdmrb1IRZraVgtf2kJEClbv+BN6v8+ptDaZlkUI1uL4=;
        b=ooz480BI8vR6MdBXw/ZMa3IDPRssejSkPYWYj8R/ZWn0yXIbwtO5GjSnIfIgwqomC18O9v
        fTBvo98iXrN38UGdbjFr5pRPuS6gPbKlJZ29uU8RxHhdDNWklufadZkRbKyRXxMxBPoPDJ
        AUuoF/8ztlZGP6C7F0wd5hZH9X984x2syzZDzL4gFEc3Lny4JnhMSoLgVVIe8oayT0/KbF
        +5XcbkqIg5ESHEY4jXLyc513Rv+do2u06UijYbrHiadvWMQcPENVpXfZBkjJiXpNGMQVcn
        M4G1ZtwxVtROVg6okw5ZrSsrKQ8qY6D8hd6DJ6sDmC0+j8Y+j9E2nmaWP5hcbg==
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
Subject: [PATCH v3 09/10] serial: 8250: dw: Improve RZN1 support
Date:   Tue, 29 Mar 2022 17:24:29 +0200
Message-Id: <20220329152430.756947-10-miquel.raynal@bootlin.com>
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

From: Phil Edworthy <phil.edworthy@renesas.com>

Renesas RZ/N1 SoC features a slightly modified DW UART.

On this SoC, the CPR register value is known but not synthetized in
hardware. We hence need to provide a CPR value in the platform
data. This version of the controller also relies on acting as flow
controller when using DMA, so we need to provide the
'IS_DMA_FLOW_CONTROLLER' quirk.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/tty/serial/8250/8250_dw.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index af9fcc77ee76..efc5c686dbfa 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -758,6 +758,11 @@ static const struct dw8250_platform_data dw8250_armada_38x_data = {
 	.quirks = DW_UART_QUIRK_ARMADA_38X,
 };
 
+static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
+	.quirks = DW_UART_QUIRK_IS_DMA_FLOW_CONTROLLER,
+	.cpr = 0x00012f32,
+};
+
 static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
 	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
 };
@@ -766,7 +771,7 @@ static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart" },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
-	{ .compatible = "renesas,rzn1-uart" },
+	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
 	{ .compatible = "starfive,jh7100-hsuart", .data = &dw8250_starfive_jh7100_data },
 	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_starfive_jh7100_data },
 	{ /* Sentinel */ }
-- 
2.27.0

