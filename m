Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAEF2F5F86
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 12:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbhANLMD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 06:12:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbhANLMD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 06:12:03 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD151C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 03:11:22 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id GbBK2400A4C55Sk01bBKMX; Thu, 14 Jan 2021 12:11:19 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l00X8-003X8D-SP; Thu, 14 Jan 2021 12:11:18 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l00X8-009I2y-B3; Thu, 14 Jan 2021 12:11:18 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3] arm64: dts: renesas: r8a779a0: Add GPIO nodes
Date:   Thu, 14 Jan 2021 12:11:17 +0100
Message-Id: <20210114111117.2214281-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device nodes for the General Purpose Input/Output (GPIO) block on
the Renesas R-Car V3U (r8a779a0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
To be queued in renesas-devel for v5.12.

v3:
  - Drop obsolete paragraph about commented-out "gpio-ranges"
    properties,

v2:
  - Add Tested-by,
  - Fix "V3u" typo in patch description,
  - Uncomment "gpio-ranges" properties,
  - Verified resets values.
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 140 ++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 6ac2c9d37acd55ae..66b47a848443c2a5 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -89,6 +89,146 @@ pfc: pin-controller@e6050000 {
 			      <0 0xe6069000 0 0x16c>, <0 0xe6069800 0 0x16c>;
 		};
 
+		gpio0: gpio@e6058180 {
+			compatible = "renesas,gpio-r8a779a0";
+			reg = <0 0xe6058180 0 0x54>;
+			interrupts = <GIC_SPI 832 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 916>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets =  <&cpg 916>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 0 28>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio1: gpio@e6050180 {
+			compatible = "renesas,gpio-r8a779a0";
+			reg = <0 0xe6050180 0 0x54>;
+			interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets =  <&cpg 915>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 32 31>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio2: gpio@e6050980 {
+			compatible = "renesas,gpio-r8a779a0";
+			reg = <0 0xe6050980 0 0x54>;
+			interrupts = <GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets =  <&cpg 915>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 64 25>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio3: gpio@e6058980 {
+			compatible = "renesas,gpio-r8a779a0";
+			reg = <0 0xe6058980 0 0x54>;
+			interrupts = <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 916>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets =  <&cpg 916>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 96 17>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio4: gpio@e6060180 {
+			compatible = "renesas,gpio-r8a779a0";
+			reg = <0 0xe6060180 0 0x54>;
+			interrupts = <GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets =  <&cpg 917>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 128 27>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio5: gpio@e6060980 {
+			compatible = "renesas,gpio-r8a779a0";
+			reg = <0 0xe6060980 0 0x54>;
+			interrupts = <GIC_SPI 852 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets =  <&cpg 917>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 160 21>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio6: gpio@e6068180 {
+			compatible = "renesas,gpio-r8a779a0";
+			reg = <0 0xe6068180 0 0x54>;
+			interrupts = <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 918>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets =  <&cpg 918>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 192 21>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio7: gpio@e6068980 {
+			compatible = "renesas,gpio-r8a779a0";
+			reg = <0 0xe6068980 0 0x54>;
+			interrupts = <GIC_SPI 860 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 918>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets =  <&cpg 918>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 224 21>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio8: gpio@e6069180 {
+			compatible = "renesas,gpio-r8a779a0";
+			reg = <0 0xe6069180 0 0x54>;
+			interrupts = <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 918>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets =  <&cpg 918>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 256 21>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio9: gpio@e6069980 {
+			compatible = "renesas,gpio-r8a779a0";
+			reg = <0 0xe6069980 0 0x54>;
+			interrupts = <GIC_SPI 868 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 918>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets =  <&cpg 918>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 288 21>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a779a0-cpg-mssr";
 			reg = <0 0xe6150000 0 0x4000>;
-- 
2.25.1

