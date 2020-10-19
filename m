Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E302926F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Oct 2020 14:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgJSMGV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Oct 2020 08:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgJSMGT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Oct 2020 08:06:19 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB30C0613D0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2020 05:06:19 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id ho6G2300L4C55Sk01o6Gfb; Mon, 19 Oct 2020 14:06:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kUTvc-0000WZ-Nn; Mon, 19 Oct 2020 14:06:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kUTvc-0005mM-Mv; Mon, 19 Oct 2020 14:06:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 6/6] arm64: dts: r8a779a0: Add GPIO nodes
Date:   Mon, 19 Oct 2020 14:06:14 +0200
Message-Id: <20201019120614.22149-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019120614.22149-1-geert+renesas@glider.be>
References: <20201019120614.22149-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device nodes for the General Purpose Input/Output (GPIO) block on
the Renesas R-Car V3u (r8a779a0) SoC.

As there is no node for the PFC yet, all "gpio-ranges" properties are
commented out.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This needs verification on real hardware, as the hardware manual is
unclear w.r.t. the following points:
  - Module clocks and interrupt mappings,
  - There are more/multiple resets for the PFC[0-3] in the Software
    Reset/Reset Clearing Registers 12, 13, and 14.
    The BSP picked up a different set.
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 140 ++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index bc81e6a761d32034..1482bdf1cceb40ee 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -70,6 +70,146 @@
 		#size-cells = <2>;
 		ranges;
 
+		gpio0: gpio@e6058180 {
+			compatible = "renesas,gpio-r8a779a0";
+			reg = <0 0xe6058180 0 0x54>;
+			interrupts = <GIC_SPI 832 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 916>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets =  <&cpg 916>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			// gpio-ranges = <&pfc 0 0 28>;
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
+			// gpio-ranges = <&pfc 0 32 31>;
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
+			// gpio-ranges = <&pfc 0 64 25>;
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
+			// gpio-ranges = <&pfc 0 96 17>;
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
+			// gpio-ranges = <&pfc 0 128 27>;
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
+			// gpio-ranges = <&pfc 0 160 21>;
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
+			// gpio-ranges = <&pfc 0 192 21>;
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
+			// gpio-ranges = <&pfc 0 224 21>;
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
+			// gpio-ranges = <&pfc 0 256 21>;
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
+			// gpio-ranges = <&pfc 0 288 21>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a779a0-cpg-mssr";
 			reg = <0 0xe6150000 0 0x4000>;
-- 
2.17.1

