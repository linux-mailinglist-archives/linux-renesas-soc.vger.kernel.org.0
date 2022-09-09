Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 055F25B349C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Sep 2022 11:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiIIJyW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Sep 2022 05:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiIIJyK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2022 05:54:10 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B2A8B0B04
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 02:54:07 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:91db:705e:cfbc:a001])
        by michel.telenet-ops.be with bizsmtp
        id Hlu62800L0sKggw06lu6LL; Fri, 09 Sep 2022 11:54:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWai5-004bsd-RI; Fri, 09 Sep 2022 11:54:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWai4-004i51-Fz; Fri, 09 Sep 2022 11:54:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 09/14] arm64: dts: renesas: r8a779f0: Add GPIO nodes
Date:   Fri,  9 Sep 2022 11:53:56 +0200
Message-Id: <81176a5e12a5828cdcdd4b107d0b2e5970232c31.1662715538.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662715538.git.geert+renesas@glider.be>
References: <cover.1662715538.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device nodes for the General Purpose Input/Output (GPIO) blocks on
the Renesas R-Car V4H (R8A779G0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 135 ++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 475b428ea7344c1a..e5f3973b71f732a9 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -79,6 +79,141 @@ pfc: pinctrl@e6050000 {
 			      <0 0xe6068000 0 0x16c>;
 		};
 
+		gpio0: gpio@e6050180 {
+			compatible = "renesas,gpio-r8a779g0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6050180 0 0x54>;
+			interrupts = <GIC_SPI 619 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 0 19>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio1: gpio@e6050980 {
+			compatible = "renesas,gpio-r8a779g0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6050980 0 0x54>;
+			interrupts = <GIC_SPI 623 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 32 29>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio2: gpio@e6058180 {
+			compatible = "renesas,gpio-r8a779g0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6058180 0 0x54>;
+			interrupts = <GIC_SPI 627 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 916>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 916>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 64 20>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio3: gpio@e6058980 {
+			compatible = "renesas,gpio-r8a779g0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6058980 0 0x54>;
+			interrupts = <GIC_SPI 631 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 916>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 916>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 96 30>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio4: gpio@e6060180 {
+			compatible = "renesas,gpio-r8a779g0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6060180 0 0x54>;
+			interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 128 25>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio5: gpio@e6060980 {
+			compatible = "renesas,gpio-r8a779g0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6060980 0 0x54>;
+			interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 160 21>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio6: gpio@e6061180 {
+			compatible = "renesas,gpio-r8a779g0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6061180 0 0x54>;
+			interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 192 21>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio7: gpio@e6061980 {
+			compatible = "renesas,gpio-r8a779g0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6061980 0 0x54>;
+			interrupts = <GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 224 21>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio8: gpio@e6068180 {
+			compatible = "renesas,gpio-r8a779g0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6068180 0 0x54>;
+			interrupts = <GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 918>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 918>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 256 14>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a779g0-cpg-mssr";
 			reg = <0 0xe6150000 0 0x4000>;
-- 
2.25.1

