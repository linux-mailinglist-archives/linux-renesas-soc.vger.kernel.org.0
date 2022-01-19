Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 002FC493BCB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jan 2022 15:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354949AbiASOPR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jan 2022 09:15:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355020AbiASOPM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 09:15:12 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72599C06161C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jan 2022 06:15:12 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a44d:f245:bac9:611c])
        by xavier.telenet-ops.be with bizsmtp
        id keFA2600R2FKFx601eFAAN; Wed, 19 Jan 2022 15:15:11 +0100
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABjy-00AS7x-Lc; Wed, 19 Jan 2022 15:15:10 +0100
Received: from geert by rox with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABjy-009iiG-6F; Wed, 19 Jan 2022 15:15:10 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 3/3] arm64: dts: renesas: r8a779f0: Add GPIO nodes
Date:   Wed, 19 Jan 2022 15:15:08 +0100
Message-Id: <b15bc8e9a68d34d5c0c36b06c9ef7e681b37596c.1642601310.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642601310.git.geert+renesas@glider.be>
References: <cover.1642601310.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device nodes for the General Purpose Input/Output (GPIO) blocks on
the Renesas R-Car S4-8 (R8A779F0) SoC.

Disable gpio4-7, as they do not seem to be accessible as-is using either
the Control Domain (0xffd9....) or Application Domain (0xdfd9....)
addresses.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
How to make the Control Domain release the bus guard, so the registers
become accessible?
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 124 ++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index ada6ff380b203625..182861251d22551c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -77,6 +77,130 @@ pfc: pinctrl@e6050000 {
 			      <0 0xffd91000 0 0x16c>, <0 0xffd91800 0 0x16c>;
 		};
 
+		gpio0: gpio@e6050180 {
+			compatible = "renesas,gpio-r8a779f0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6050180 0 0x54>;
+			interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 0 21>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio1: gpio@e6050980 {
+			compatible = "renesas,gpio-r8a779f0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6050980 0 0x54>;
+			interrupts = <GIC_SPI 823 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 32 25>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio2: gpio@e6051180 {
+			compatible = "renesas,gpio-r8a779f0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6051180 0 0x54>;
+			interrupts = <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 64 17>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio3: gpio@e6051980 {
+			compatible = "renesas,gpio-r8a779f0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6051980 0 0x54>;
+			interrupts = <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 96 19>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio4: gpio@ffd90180 {
+			compatible = "renesas,gpio-r8a779f0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xffd90180 0 0x54>;
+			interrupts = <GIC_SPI 826 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 128 31>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio5: gpio@ffd90980 {
+			compatible = "renesas,gpio-r8a779f0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xffd90980 0 0x54>;
+			interrupts = <GIC_SPI 827 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 160 20>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio6: gpio@ffd91180 {
+			compatible = "renesas,gpio-r8a779f0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xffd91180 0 0x54>;
+			interrupts = <GIC_SPI 828 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 192 32>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio7: gpio@ffd91980 {
+			compatible = "renesas,gpio-r8a779f0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xffd91980 0 0x54>;
+			interrupts = <GIC_SPI 829 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 224 32>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a779f0-cpg-mssr";
 			reg = <0 0xe6150000 0 0x4000>;
-- 
2.25.1

