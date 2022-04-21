Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9631F509CD5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 11:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387949AbiDUJ4r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 05:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387943AbiDUJ4h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 05:56:37 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD7025581;
        Thu, 21 Apr 2022 02:53:47 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 3E0FD1BF210;
        Thu, 21 Apr 2022 09:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650534826;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OkvzJztRthVaGIL1bz3XTVaBBeEF3F6WAHdml+C/P4M=;
        b=CeuMlaXHaxnLLUOSPSMnw1pelWNWBfKMNPABDz13we9vGFEx9jhhsv6OTeawoddlCGkxx3
        GSXsvWW/gzPdSUDZpbMK51z1IH0zZCbMxLoku5NYNy0IvR7SucgbCAMZqo1xqrDMOaUizF
        PG1S4K2wdNhcS50rD8yzhZgaIbMjtpArRh5VNPZXjKZqyCbHrhAkQen2AvznPH+YCxr63u
        lsFszQ84MPuGfXixzp1bBhp8gPGBM+M/rbeTm0/TCcKchl8bR1kAXBDERqoOpy5H/VOlrA
        iY1DhrU8dc44MQ/azRU2xkOuAVioHBdx06Y3S5uNTB7UexBdX6iqWCf0PR4gJg==
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
Subject: [PATCH v6 11/12] bestla: Enable DMA, UART3 and UART4
Date:   Thu, 21 Apr 2022 11:53:22 +0200
Message-Id: <20220421095323.101811-12-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220421095323.101811-1-miquel.raynal@bootlin.com>
References: <20220421095323.101811-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../boot/dts/r9a06g032-rzn1d400-bestla.dts    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032-rzn1d400-bestla.dts b/arch/arm/boot/dts/r9a06g032-rzn1d400-bestla.dts
index f42a3ba70541..70aa026bd292 100644
--- a/arch/arm/boot/dts/r9a06g032-rzn1d400-bestla.dts
+++ b/arch/arm/boot/dts/r9a06g032-rzn1d400-bestla.dts
@@ -22,6 +22,8 @@ chosen {
 
 	aliases {
 		serial0 = &uart0;
+		serial3 = &uart3;
+
 	};
 };
 
@@ -31,6 +33,22 @@ &uart0 {
 	status = "okay";
 };
 
+&uart3 {
+	pinctrl-0 = <&pins_uart3>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-0 = <&pins_uart4>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&dma0 {
+	status = "okay";
+};
+
 &nand_controller {
 	pinctrl-0 = <&pins_nand>;
 	pinctrl-names = "default";
@@ -82,4 +100,21 @@ RZN1_PINMUX(104, RZN1_FUNC_UART0_I)	/* UART0_RXD */
 		>;
 		bias-disable;
 	};
+
+	pins_uart3: pins_uart3 {
+		pinmux = <
+			RZN1_PINMUX(123, RZN1_FUNC_UART3)       /* UART3_TXD */
+			RZN1_PINMUX(124, RZN1_FUNC_UART3)       /* UART3_RXD */
+			RZN1_PINMUX(125, RZN1_FUNC_UART3)       /* UART3_RTS_N */
+                >;
+		bias-disable;
+	};
+
+	pins_uart4: pins_uart4 {
+		pinmux = <
+			RZN1_PINMUX(109, RZN1_FUNC_UART4)       /* UART4_TXD */
+			RZN1_PINMUX(110, RZN1_FUNC_UART4)       /* UART4_RXD */
+                >;
+		bias-disable;
+	};
 };
-- 
2.27.0

