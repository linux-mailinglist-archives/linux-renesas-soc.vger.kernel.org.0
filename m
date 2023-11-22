Return-Path: <linux-renesas-soc+bounces-127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADC57F4C0C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 17:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7772BB20D06
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 16:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9144D5B1;
	Wed, 22 Nov 2023 16:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E554A1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Nov 2023 08:12:48 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d60:3031:68fb:d1ad])
	by baptiste.telenet-ops.be with bizsmtp
	id DUCm2B00E3EmSSH01UCmq7; Wed, 22 Nov 2023 17:12:46 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r5pq4-009ylE-99;
	Wed, 22 Nov 2023 17:12:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r5pqI-00GzNS-8L;
	Wed, 22 Nov 2023 17:12:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/3] ARM: dts: renesas: r8a7740: Add LCDC nodes
Date: Wed, 22 Nov 2023 17:12:42 +0100
Message-Id: <12dcec10e6fb3b55c39f6221349d35d6d6f17a5d.1700669207.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700669207.git.geert+renesas@glider.be>
References: <cover.1700669207.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device nodes for the two LCD Controllers (LCDC) on the R-Mobile A1
SoC, and for the two optional external LCDL clock inputs.

Note that the HDMI clock for LCDC1 is not added, as this clock is not
yet supported.

Based on a patch by Laurent Pinchart adding the first LCDC device node.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.

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
 arch/arm/boot/dts/renesas/r8a7740.dtsi | 65 ++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index 1b2cf5fa322b2985..55884ec701f8dab4 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
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


