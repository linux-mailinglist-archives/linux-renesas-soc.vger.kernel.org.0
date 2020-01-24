Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C47E148637
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2020 14:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388539AbgAXNdg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Jan 2020 08:33:36 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:35924 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388500AbgAXNdf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Jan 2020 08:33:35 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id uDZX210025USYZQ01DZX3g; Fri, 24 Jan 2020 14:33:33 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iuz5X-0007fb-2B; Fri, 24 Jan 2020 14:33:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iuz5X-0004DK-0M; Fri, 24 Jan 2020 14:33:31 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Gilad Ben-Yossef <gilad@benyossef.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: rcar-gen3: Add CCREE nodes
Date:   Fri, 24 Jan 2020 14:33:30 +0100
Message-Id: <20200124133330.16121-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device nodes for the CryptoCell instances on the various Renesas
R-Car Gen3 SoCs that do not have support for them yet in their device
trees (M3-W, M3-W+, M3-N, E3, D3).

The R-Car H3 device tree already supports this device.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on:
  - Salvator-X with R-Car M3-W ES1.0,
  - Salvator-XS with R-Car M3-W+ ES3.0,
  - Salvator-XS with R-Car M3-N ES1.0,
  - Ebisu-4D with R-Car E3 ES1.0,
  - Draak with R-Car D3 ES1.0.

$ grep selftest /proc/crypto | sort | uniq -c
    116 selftest     : passed
---
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 9 +++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 9 +++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 9 +++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 9 +++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 9 +++++++++
 5 files changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 988b83fe62d485eb..ea03b91bdf9d9cbc 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -862,6 +862,15 @@
 			status = "disabled";
 		};
 
+		arm_cc630p: crypto@e6601000 {
+			compatible = "arm,cryptocell-630p-ree";
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x0 0xe6601000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 229>;
+			resets = <&cpg 229>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+		};
+
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a7796",
 				     "renesas,rcar-dmac";
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index be3824bda632233e..b6915319a61c8bf0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -629,6 +629,15 @@
 			/* placeholder */
 		};
 
+		arm_cc630p: crypto@e6601000 {
+			compatible = "arm,cryptocell-630p-ree";
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x0 0xe6601000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 229>;
+			resets = <&cpg 229>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+		};
+
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a77961",
 				     "renesas,rcar-dmac";
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 7d2b283b7f556b1d..1a20ebe9ea5be5da 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -717,6 +717,15 @@
 			status = "disabled";
 		};
 
+		arm_cc630p: crypto@e6601000 {
+			compatible = "arm,cryptocell-630p-ree";
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x0 0xe6601000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 229>;
+			resets = <&cpg 229>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+		};
+
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a77965",
 				     "renesas,rcar-dmac";
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 80e8ef3007c5b646..c05ee98043b2c7a5 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -667,6 +667,15 @@
 			dma-channels = <2>;
 		};
 
+		arm_cc630p: crypto@e6601000 {
+			compatible = "arm,cryptocell-630p-ree";
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x0 0xe6601000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 229>;
+			resets = <&cpg 229>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+		};
+
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a77990",
 				     "renesas,rcar-dmac";
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 2b5c39bd86856579..7d3102dccac96e42 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -389,6 +389,15 @@
 			dma-channels = <2>;
 		};
 
+		arm_cc630p: crypto@e6601000 {
+			compatible = "arm,cryptocell-630p-ree";
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x0 0xe6601000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 229>;
+			resets = <&cpg 229>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+		};
+
 		canfd: can@e66c0000 {
 			compatible = "renesas,r8a77995-canfd",
 				     "renesas,rcar-gen3-canfd";
-- 
2.17.1

