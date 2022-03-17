Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 679274DCCD6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Mar 2022 18:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237083AbiCQRsN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Mar 2022 13:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237154AbiCQRsF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Mar 2022 13:48:05 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650541F2DFF;
        Thu, 17 Mar 2022 10:46:48 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 88214FF803;
        Thu, 17 Mar 2022 17:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1647539207;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qgpw4atx94cJSZySLKvheDqmzOrZHQhOeNUtmGPnW18=;
        b=OVh4WYe0BpTGyjipaG875ejoCbhLwz411VDC61mBCx8UfJoX+2M2L0UTFsreR/BDTWWsj4
        hGQ//AWFT14CgwueDqUJMDVkAH1qpmfrwBx+1Fi9MOGYO50yCLdn4OTG2s4ntqhqTp0vzR
        +vVU5wtWhDbnyyV3W9Ka4JHQMFxfZ/hs3nJp1aN4/gRNgBhBFJz3lh5fgT3RXBu2qG3H2Q
        4QlpCEO1WOBrIoXW3e2x/HlziwMxa68/JWhHW5EtyoaAlwGUFjBSIiSQVwDAKgK14WgOJz
        qlAZV7c4SniLtEejXlQVAJ/XiFjhDcva35WCgYC9hZmhN/shlfCu/2LMWbCMOw==
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
Subject: [PATCH v2 09/10] serial: 8250: dw: Improve RZN1 support
Date:   Thu, 17 Mar 2022 18:46:26 +0100
Message-Id: <20220317174627.360815-10-miquel.raynal@bootlin.com>
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
index edb3f347be8e..9b393770d40e 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -756,6 +756,11 @@ static const struct dw8250_platform_data dw8250_armada_38x_data = {
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
@@ -764,7 +769,7 @@ static const struct of_device_id dw8250_of_match[] = {
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

