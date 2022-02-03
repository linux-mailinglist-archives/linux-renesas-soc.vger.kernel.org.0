Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60F054A87AA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Feb 2022 16:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237798AbiBCP04 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Feb 2022 10:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351867AbiBCP0z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Feb 2022 10:26:55 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3774AC06173E
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Feb 2022 07:26:54 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:15aa:ab80:d2f:edb])
        by xavier.telenet-ops.be with bizsmtp
        id qfSs260024dXKBW01fSsg4; Thu, 03 Feb 2022 16:26:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nFe0Z-00D0pP-O0; Thu, 03 Feb 2022 16:26:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nFe0Z-002txq-AX; Thu, 03 Feb 2022 16:26:51 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] arm64: dts: renesas: r8a779f0: Add I2C nodes
Date:   Thu,  3 Feb 2022 16:26:47 +0100
Message-Id: <e1c7fb17801bc82a74aa5364212d02ba51535dd2.1643898884.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643898884.git.geert+renesas@glider.be>
References: <cover.1643898884.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device nodes for the I2C Bus Interfaces on the Renesas R-Car S4-8
(R8A779F0) SoC.

Based on a larger patch in the BSP by LUU HOAI.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
R-Car S4 Series Hardware User's Manual Rev. 0.51 states I2C2 TX DMARS is
0x05, which is probably a typo?

Changed compared to the BSP:
  - Replace GIC_SPI in reg property by 0,
  - Add DMA-related properties.
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 102 ++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 182861251d22551c..a8d0f930cbb35164 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -222,6 +222,108 @@ sysc: system-controller@e6180000 {
 			#power-domain-cells = <1>;
 		};
 
+		i2c0: i2c@e6500000 {
+			compatible = "renesas,i2c-r8a779f0",
+				     "renesas,rcar-gen4-i2c";
+			reg = <0 0xe6500000 0 0x40>;
+			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 518>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 518>;
+			dmas = <&dmac0 0x91>, <&dmac0 0x90>,
+			       <&dmac1 0x91>, <&dmac1 0x90>;
+			dma-names = "tx", "rx", "tx", "rx";
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@e6508000 {
+			compatible = "renesas,i2c-r8a779f0",
+				     "renesas,rcar-gen4-i2c";
+			reg = <0 0xe6508000 0 0x40>;
+			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 519>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 519>;
+			dmas = <&dmac0 0x93>, <&dmac0 0x92>,
+			       <&dmac1 0x93>, <&dmac1 0x92>;
+			dma-names = "tx", "rx", "tx", "rx";
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@e6510000 {
+			compatible = "renesas,i2c-r8a779f0",
+				     "renesas,rcar-gen4-i2c";
+			reg = <0 0xe6510000 0 0x40>;
+			interrupts = <0 240 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 520>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 520>;
+			dmas = <&dmac0 0x95>, <&dmac0 0x94>,
+			       <&dmac1 0x95>, <&dmac1 0x94>;
+			dma-names = "tx", "rx", "tx", "rx";
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@e66d0000 {
+			compatible = "renesas,i2c-r8a779f0",
+				     "renesas,rcar-gen4-i2c";
+			reg = <0 0xe66d0000 0 0x40>;
+			interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 521>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 521>;
+			dmas = <&dmac0 0x97>, <&dmac0 0x96>,
+			       <&dmac1 0x97>, <&dmac1 0x96>;
+			dma-names = "tx", "rx", "tx", "rx";
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@e66d8000 {
+			compatible = "renesas,i2c-r8a779f0",
+				     "renesas,rcar-gen4-i2c";
+			reg = <0 0xe66d8000 0 0x40>;
+			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 522>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 522>;
+			dmas = <&dmac0 0x99>, <&dmac0 0x98>,
+			       <&dmac1 0x99>, <&dmac1 0x98>;
+			dma-names = "tx", "rx", "tx", "rx";
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@e66e0000 {
+			compatible = "renesas,i2c-r8a779f0",
+				     "renesas,rcar-gen4-i2c";
+			reg = <0 0xe66e0000 0 0x40>;
+			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 523>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 523>;
+			dmas = <&dmac0 0x9b>, <&dmac0 0x9a>,
+			       <&dmac1 0x9b>, <&dmac1 0x9a>;
+			dma-names = "tx", "rx", "tx", "rx";
+			i2c-scl-internal-delay-ns = <110>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		scif3: serial@e6c50000 {
 			compatible = "renesas,scif-r8a779f0",
 				     "renesas,rcar-gen4-scif", "renesas,scif";
-- 
2.25.1

