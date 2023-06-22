Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92689739D38
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jun 2023 11:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbjFVJdQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Jun 2023 05:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbjFVJcB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Jun 2023 05:32:01 -0400
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [IPv6:2a02:1800:120:4::f00:10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E969A44A6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jun 2023 02:23:20 -0700 (PDT)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by cantor.telenet-ops.be (Postfix) with ESMTPS id 4Qmw074ZrLz4wxyH
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jun 2023 11:23:19 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
        by michel.telenet-ops.be with bizsmtp
        id C9PJ2A0091yfRTD069PJK6; Thu, 22 Jun 2023 11:23:19 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qCGX6-000Bya-F8;
        Thu, 22 Jun 2023 11:23:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qCGX8-003Vzk-1x;
        Thu, 22 Jun 2023 11:23:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: dts: r8a7740: Add LCDC nodes
Date:   Thu, 22 Jun 2023 11:23:14 +0200
Message-Id: <1994a9c58321667733d7cd7500d7e25d30308498.1687417585.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687417585.git.geert+renesas@glider.be>
References: <cover.1687417585.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device nodes for the two LCD Controllers (LCDC) on the R-Mobile A1
SoC, and for the two optional external LCDL clock inputs.

Note that the HDMI clock for LCDC1 is not added, as this clock is not
yet supported.

Based on a patch by Laurent Pinchart adding the first LCDC device node.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to Laurent's original:
  - Add lcdc0 label,
  - Rename node from display to lcdc-controller,
  - Rename compatible value from "renesas,lcdc-r8a7740" to
    "renesas,r8a7740-lcdc",
  - Correct syntax of reg property,
  - Use GIC_SPI macro,
  - Add more clocks,
  - Add power-domains property,
  - Add status disabled,
  - Remove second port from lcdc0, as only lcdc1 has an HDMI port,
  - Add lcdc1 device node.
---
 arch/arm/boot/dts/r8a7740.dtsi | 65 ++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index 1b2cf5fa322b2985..55884ec701f8dab4 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -398,6 +398,61 @@ sh_fsi2: sound@fe1f0000 {
 		status = "disabled";
 	};
 
+	lcdc0: lcd-controller@fe940000 {
+		compatible = "renesas,r8a7740-lcdc";
+		reg = <0xfe940000 0x4000>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp1_clks R8A7740_CLK_LCDC0>,
+			 <&cpg_clocks R8A7740_CLK_M3>, <&lcdlclk0_clk>,
+			 <&vou_clk>;
+		clock-names = "fck", "media", "lclk", "video";
+		power-domains = <&pd_a4lc>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lcdc0_rgb: endpoint {
+				};
+			};
+		};
+	};
+
+	lcdc1: lcd-controller@fe944000 {
+		compatible = "renesas,r8a7740-lcdc";
+		reg = <0xfe944000 0x4000>;
+		interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp1_clks R8A7740_CLK_LCDC1>,
+			 <&cpg_clocks R8A7740_CLK_M3>, <&lcdlclk1_clk>,
+			 <&vou_clk>;
+		clock-names = "fck", "media", "lclk", "video";
+		power-domains = <&pd_a4lc>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lcdc1_rgb: endpoint {
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lcdc1_hdmi: endpoint {
+				};
+			};
+		};
+	};
+
 	tmu0: timer@fff80000 {
 		compatible = "renesas,tmu-r8a7740", "renesas,tmu";
 		reg = <0xfff80000 0x2c>;
@@ -474,6 +529,16 @@ fsibck_clk: fsibck {
 			#clock-cells = <0>;
 			clock-frequency = <0>;
 		};
+		lcdlclk0_clk: lcdlclk0 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+		};
+		lcdlclk1_clk: lcdlclk1 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+		};
 
 		/* Special CPG clocks */
 		cpg_clocks: cpg_clocks@e6150000 {
-- 
2.34.1

