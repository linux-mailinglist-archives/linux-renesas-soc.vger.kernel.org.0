Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE884EC57A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 15:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345876AbiC3NXN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 09:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345901AbiC3NWp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 09:22:45 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D7A49272;
        Wed, 30 Mar 2022 06:20:58 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 1BE8B240008;
        Wed, 30 Mar 2022 13:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648646457;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VjUPIaxQ1WBMLteeByIABCjhVWOu3Y3N20N5eUaJ/3w=;
        b=dYzZpVWm/sUXXRq6H5Mcp7pYqmwE5wZE0X1ehFPz7/2ploOvhtAvzQ/9vfCAdaJh7DzSjJ
        oPtAzIjGeiznjhW4zHbBmqrS7zxU2aV2aJUuqAWIXe4hIwcLyUxLRnKZMvMndlGLjrcNPK
        2+GhjGtwLnlzSgdWFbIgDkCKkVlOCu0fzy9xuedKgMrVnj854dSzVW74EPK0FkZ+ru4mPQ
        BdmJkM/DTjGY5jqG39XNqRUWafEdWjIgX5S60jraPiGBjGKYRrHD7lF1dUYbf1kQKAU9Iu
        nefFX+T5OLfgaVGOcK4bpWbWN3tkGFabZ0b2bKJQQD0JV3QLbH7VozzVjyg7Ww==
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
        Clement Leger <clement.leger@bootlin.com>
Subject: [PATCH v4 9/9] ARM: dts: r9a06g032: Fill the UART DMA properties
Date:   Wed, 30 Mar 2022 15:20:38 +0200
Message-Id: <20220330132038.808679-10-miquel.raynal@bootlin.com>
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

UART 0 to 2 do not have DMA support, while UART 3 to 7 do.

Fill the "dmas" and "dma-names" properties for each of these nodes.

Please mind that these nodes go through the dmamux node which will
redirect the requests to the right DMA controller. The first 4 cells of
the "dmas" properties will be transferred as-is to the DMA
controllers. The last 2 cells are consumed by the dmamux. Which means
cell 0 and 4 are almost redundant, one giving the controller request ID
and the other the dmamux channel which is a 1:1 translation of the
request IDs, shifted by 16 when pointing to the second DMA controller.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 804f2d6f416f..aa447e2622e0 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -128,6 +128,9 @@ uart3: serial@50000000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART3>, <&sysctrl R9A06G032_HCLK_UART3>;
 			clock-names = "baudclk", "apb_pclk";
+			dmas =  <&dmamux 0 0 0 0 0 1>,
+				<&dmamux 1 0 0 0 1 1>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -139,6 +142,9 @@ uart4: serial@50001000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART4>, <&sysctrl R9A06G032_HCLK_UART4>;
 			clock-names = "baudclk", "apb_pclk";
+			dmas =  <&dmamux 2 0 0 0 2 1>,
+				<&dmamux 3 0 0 0 3 1>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -150,6 +156,9 @@ uart5: serial@50002000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART5>, <&sysctrl R9A06G032_HCLK_UART5>;
 			clock-names = "baudclk", "apb_pclk";
+			dmas =  <&dmamux 4 0 0 0 4 1>,
+				<&dmamux 5 0 0 0 5 1>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -161,6 +170,9 @@ uart6: serial@50003000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART6>, <&sysctrl R9A06G032_HCLK_UART6>;
 			clock-names = "baudclk", "apb_pclk";
+			dmas =  <&dmamux 6 0 0 0 6 1>,
+				<&dmamux 7 0 0 0 7 1>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -172,6 +184,9 @@ uart7: serial@50004000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART7>, <&sysctrl R9A06G032_HCLK_UART7>;
 			clock-names = "baudclk", "apb_pclk";
+			dmas =  <&dmamux 4 0 0 0 20 1>,
+				<&dmamux 5 0 0 0 21 1>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
-- 
2.27.0

