Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B75517071
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 15:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385365AbiEBNjC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 09:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385402AbiEBNiy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 09:38:54 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E872BC96
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 May 2022 06:35:23 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:194e:5782:c420:7f87])
        by laurent.telenet-ops.be with bizsmtp
        id RpbK2700L28fWK501pbKcs; Mon, 02 May 2022 15:35:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nlWCt-002mul-7j; Mon, 02 May 2022 15:35:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nlWCs-002vEh-Li; Mon, 02 May 2022 15:35:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779a0: Update to R-Car Gen4 compatible values
Date:   Mon,  2 May 2022 15:35:17 +0200
Message-Id: <73cea9d5e1a6639422c67e4df4285042e31c9fd5.1651497071.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

Despite the name, R-Car V3U is the first member of the R-Car Gen4
family.  Hence update the compatible properties in various device nodes
to include family-specific compatible values for R-Car Gen4 instead of
R-Car Gen3:
  - DMAC,
  - (H)SCIF,
  - I2C,
  - IPMMU,
  - WDT.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.19.

All R-Car Gen4 family-specific compatible values added are already
supported by device drivers in v5.18-rc1, except for HSCIF, where the
driver matches on the generic "renesas,hscif" compatible value instead.
Hence this patch is safe to apply.
Patches to update the corresponding DT bindings[1] and SoC identication
code[1] are in-flight.

Updating the remaining compatible properties is postponed until the
corresponding DT bindings and device drivers have been updated.

[1] [PATCH 0/7] dt-bindings: renesas: R-Car V3U is R-Car Gen4
    https://lore.kernel.org/cover.1651497024.git.geert+renesas@glider.be
[2] [PATCH] soc: renesas: R-Car V3U is R-Car Gen4
    https://lore.kernel.org/2bbecad7b6c24c0d5c1797b3f7f0733d5ba33842.1651497066.git.geert+renesas@glider.be
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 74 ++++++++++++++---------
 1 file changed, 44 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 57d49d27cdca72d0..528ad6049a6fbc15 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -86,7 +86,7 @@ soc: soc {
 
 		rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a779a0-wdt",
-				     "renesas,rcar-gen3-wdt";
+				     "renesas,rcar-gen4-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
 			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 907>;
@@ -430,7 +430,7 @@ tmu4: timer@ffc00000 {
 
 		i2c0: i2c@e6500000 {
 			compatible = "renesas,i2c-r8a779a0",
-				     "renesas,rcar-gen3-i2c";
+				     "renesas,rcar-gen4-i2c";
 			reg = <0 0xe6500000 0 0x40>;
 			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 518>;
@@ -446,7 +446,7 @@ i2c0: i2c@e6500000 {
 
 		i2c1: i2c@e6508000 {
 			compatible = "renesas,i2c-r8a779a0",
-				     "renesas,rcar-gen3-i2c";
+				     "renesas,rcar-gen4-i2c";
 			reg = <0 0xe6508000 0 0x40>;
 			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 519>;
@@ -462,7 +462,7 @@ i2c1: i2c@e6508000 {
 
 		i2c2: i2c@e6510000 {
 			compatible = "renesas,i2c-r8a779a0",
-				     "renesas,rcar-gen3-i2c";
+				     "renesas,rcar-gen4-i2c";
 			reg = <0 0xe6510000 0 0x40>;
 			interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 520>;
@@ -478,7 +478,7 @@ i2c2: i2c@e6510000 {
 
 		i2c3: i2c@e66d0000 {
 			compatible = "renesas,i2c-r8a779a0",
-				     "renesas,rcar-gen3-i2c";
+				     "renesas,rcar-gen4-i2c";
 			reg = <0 0xe66d0000 0 0x40>;
 			interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 521>;
@@ -494,7 +494,7 @@ i2c3: i2c@e66d0000 {
 
 		i2c4: i2c@e66d8000 {
 			compatible = "renesas,i2c-r8a779a0",
-				     "renesas,rcar-gen3-i2c";
+				     "renesas,rcar-gen4-i2c";
 			reg = <0 0xe66d8000 0 0x40>;
 			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 522>;
@@ -510,7 +510,7 @@ i2c4: i2c@e66d8000 {
 
 		i2c5: i2c@e66e0000 {
 			compatible = "renesas,i2c-r8a779a0",
-				     "renesas,rcar-gen3-i2c";
+				     "renesas,rcar-gen4-i2c";
 			reg = <0 0xe66e0000 0 0x40>;
 			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 523>;
@@ -526,7 +526,7 @@ i2c5: i2c@e66e0000 {
 
 		i2c6: i2c@e66e8000 {
 			compatible = "renesas,i2c-r8a779a0",
-				     "renesas,rcar-gen3-i2c";
+				     "renesas,rcar-gen4-i2c";
 			reg = <0 0xe66e8000 0 0x40>;
 			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 524>;
@@ -542,7 +542,7 @@ i2c6: i2c@e66e8000 {
 
 		hscif0: serial@e6540000 {
 			compatible = "renesas,hscif-r8a779a0",
-				     "renesas,rcar-gen3-hscif", "renesas,hscif";
+				     "renesas,rcar-gen4-hscif", "renesas,hscif";
 			reg = <0 0xe6540000 0 0x60>;
 			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 514>,
@@ -558,7 +558,7 @@ hscif0: serial@e6540000 {
 
 		hscif1: serial@e6550000 {
 			compatible = "renesas,hscif-r8a779a0",
-				     "renesas,rcar-gen3-hscif", "renesas,hscif";
+				     "renesas,rcar-gen4-hscif", "renesas,hscif";
 			reg = <0 0xe6550000 0 0x60>;
 			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 515>,
@@ -574,7 +574,7 @@ hscif1: serial@e6550000 {
 
 		hscif2: serial@e6560000 {
 			compatible = "renesas,hscif-r8a779a0",
-				     "renesas,rcar-gen3-hscif", "renesas,hscif";
+				     "renesas,rcar-gen4-hscif", "renesas,hscif";
 			reg = <0 0xe6560000 0 0x60>;
 			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 516>,
@@ -590,7 +590,7 @@ hscif2: serial@e6560000 {
 
 		hscif3: serial@e66a0000 {
 			compatible = "renesas,hscif-r8a779a0",
-				     "renesas,rcar-gen3-hscif", "renesas,hscif";
+				     "renesas,rcar-gen4-hscif", "renesas,hscif";
 			reg = <0 0xe66a0000 0 0x60>;
 			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 517>,
@@ -943,7 +943,7 @@ avb5: ethernet@e6850000 {
 
 		scif0: serial@e6e60000 {
 			compatible = "renesas,scif-r8a779a0",
-				     "renesas,rcar-gen3-scif", "renesas,scif";
+				     "renesas,rcar-gen4-scif", "renesas,scif";
 			reg = <0 0xe6e60000 0 64>;
 			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 702>,
@@ -959,7 +959,7 @@ scif0: serial@e6e60000 {
 
 		scif1: serial@e6e68000 {
 			compatible = "renesas,scif-r8a779a0",
-				     "renesas,rcar-gen3-scif", "renesas,scif";
+				     "renesas,rcar-gen4-scif", "renesas,scif";
 			reg = <0 0xe6e68000 0 64>;
 			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 703>,
@@ -975,7 +975,7 @@ scif1: serial@e6e68000 {
 
 		scif3: serial@e6c50000 {
 			compatible = "renesas,scif-r8a779a0",
-				     "renesas,rcar-gen3-scif", "renesas,scif";
+				     "renesas,rcar-gen4-scif", "renesas,scif";
 			reg = <0 0xe6c50000 0 64>;
 			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 704>,
@@ -991,7 +991,7 @@ scif3: serial@e6c50000 {
 
 		scif4: serial@e6c40000 {
 			compatible = "renesas,scif-r8a779a0",
-				     "renesas,rcar-gen3-scif", "renesas,scif";
+				     "renesas,rcar-gen4-scif", "renesas,scif";
 			reg = <0 0xe6c40000 0 64>;
 			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 705>,
@@ -2003,7 +2003,8 @@ vin31isp3: endpoint@3 {
 		};
 
 		dmac1: dma-controller@e7350000 {
-			compatible = "renesas,dmac-r8a779a0";
+			compatible = "renesas,dmac-r8a779a0",
+				     "renesas,rcar-gen4-dmac";
 			reg = <0 0xe7350000 0 0x1000>,
 			      <0 0xe7300000 0 0x10000>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
@@ -2037,7 +2038,8 @@ dmac1: dma-controller@e7350000 {
 		};
 
 		dmac2: dma-controller@e7351000 {
-			compatible = "renesas,dmac-r8a779a0";
+			compatible = "renesas,dmac-r8a779a0",
+				     "renesas,rcar-gen4-dmac";
 			reg = <0 0xe7351000 0 0x1000>,
 			      <0 0xe7310000 0 0x10000>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
@@ -2092,7 +2094,8 @@ rpc: spi@ee200000 {
 		};
 
 		ipmmu_rt0: iommu@ee480000 {
-			compatible = "renesas,ipmmu-r8a779a0";
+			compatible = "renesas,ipmmu-r8a779a0",
+				     "renesas,rcar-gen4-ipmmu";
 			reg = <0 0xee480000 0 0x20000>;
 			renesas,ipmmu-main = <&ipmmu_mm 10>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -2100,7 +2103,8 @@ ipmmu_rt0: iommu@ee480000 {
 		};
 
 		ipmmu_rt1: iommu@ee4c0000 {
-			compatible = "renesas,ipmmu-r8a779a0";
+			compatible = "renesas,ipmmu-r8a779a0",
+				     "renesas,rcar-gen4-ipmmu";
 			reg = <0 0xee4c0000 0 0x20000>;
 			renesas,ipmmu-main = <&ipmmu_mm 19>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -2108,7 +2112,8 @@ ipmmu_rt1: iommu@ee4c0000 {
 		};
 
 		ipmmu_ds0: iommu@eed00000 {
-			compatible = "renesas,ipmmu-r8a779a0";
+			compatible = "renesas,ipmmu-r8a779a0",
+				     "renesas,rcar-gen4-ipmmu";
 			reg = <0 0xeed00000 0 0x20000>;
 			renesas,ipmmu-main = <&ipmmu_mm 0>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -2116,7 +2121,8 @@ ipmmu_ds0: iommu@eed00000 {
 		};
 
 		ipmmu_ds1: iommu@eed40000 {
-			compatible = "renesas,ipmmu-r8a779a0";
+			compatible = "renesas,ipmmu-r8a779a0",
+				     "renesas,rcar-gen4-ipmmu";
 			reg = <0 0xeed40000 0 0x20000>;
 			renesas,ipmmu-main = <&ipmmu_mm 1>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -2124,7 +2130,8 @@ ipmmu_ds1: iommu@eed40000 {
 		};
 
 		ipmmu_ir: iommu@eed80000 {
-			compatible = "renesas,ipmmu-r8a779a0";
+			compatible = "renesas,ipmmu-r8a779a0",
+				     "renesas,rcar-gen4-ipmmu";
 			reg = <0 0xeed80000 0 0x20000>;
 			renesas,ipmmu-main = <&ipmmu_mm 3>;
 			power-domains = <&sysc R8A779A0_PD_A3IR>;
@@ -2132,7 +2139,8 @@ ipmmu_ir: iommu@eed80000 {
 		};
 
 		ipmmu_vc0: iommu@eedc0000 {
-			compatible = "renesas,ipmmu-r8a779a0";
+			compatible = "renesas,ipmmu-r8a779a0",
+				     "renesas,rcar-gen4-ipmmu";
 			reg = <0 0xeedc0000 0 0x20000>;
 			renesas,ipmmu-main = <&ipmmu_mm 12>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -2140,7 +2148,8 @@ ipmmu_vc0: iommu@eedc0000 {
 		};
 
 		ipmmu_vi0: iommu@eee80000 {
-			compatible = "renesas,ipmmu-r8a779a0";
+			compatible = "renesas,ipmmu-r8a779a0",
+				     "renesas,rcar-gen4-ipmmu";
 			reg = <0 0xeee80000 0 0x20000>;
 			renesas,ipmmu-main = <&ipmmu_mm 14>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -2148,7 +2157,8 @@ ipmmu_vi0: iommu@eee80000 {
 		};
 
 		ipmmu_vi1: iommu@eeec0000 {
-			compatible = "renesas,ipmmu-r8a779a0";
+			compatible = "renesas,ipmmu-r8a779a0",
+				     "renesas,rcar-gen4-ipmmu";
 			reg = <0 0xeeec0000 0 0x20000>;
 			renesas,ipmmu-main = <&ipmmu_mm 15>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -2156,7 +2166,8 @@ ipmmu_vi1: iommu@eeec0000 {
 		};
 
 		ipmmu_3dg: iommu@eee00000 {
-			compatible = "renesas,ipmmu-r8a779a0";
+			compatible = "renesas,ipmmu-r8a779a0",
+				     "renesas,rcar-gen4-ipmmu";
 			reg = <0 0xeee00000 0 0x20000>;
 			renesas,ipmmu-main = <&ipmmu_mm 6>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -2164,7 +2175,8 @@ ipmmu_3dg: iommu@eee00000 {
 		};
 
 		ipmmu_vip0: iommu@eef00000 {
-			compatible = "renesas,ipmmu-r8a779a0";
+			compatible = "renesas,ipmmu-r8a779a0",
+				     "renesas,rcar-gen4-ipmmu";
 			reg = <0 0xeef00000 0 0x20000>;
 			renesas,ipmmu-main = <&ipmmu_mm 5>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -2172,7 +2184,8 @@ ipmmu_vip0: iommu@eef00000 {
 		};
 
 		ipmmu_vip1: iommu@eef40000 {
-			compatible = "renesas,ipmmu-r8a779a0";
+			compatible = "renesas,ipmmu-r8a779a0",
+				     "renesas,rcar-gen4-ipmmu";
 			reg = <0 0xeef40000 0 0x20000>;
 			renesas,ipmmu-main = <&ipmmu_mm 11>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -2180,7 +2193,8 @@ ipmmu_vip1: iommu@eef40000 {
 		};
 
 		ipmmu_mm: iommu@eefc0000 {
-			compatible = "renesas,ipmmu-r8a779a0";
+			compatible = "renesas,ipmmu-r8a779a0",
+				     "renesas,rcar-gen4-ipmmu";
 			reg = <0 0xeefc0000 0 0x20000>;
 			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.25.1

