Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1C36FDA5D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 May 2023 11:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236936AbjEJJEW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 May 2023 05:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236959AbjEJJEO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2023 05:04:14 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 693C07EEA
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2023 02:04:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,264,1677510000"; 
   d="scan'208";a="158827520"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 10 May 2023 18:04:01 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 74BC4400516F;
        Wed, 10 May 2023 18:04:01 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3] arm64: dts: renesas: Add IOMMU related properties into PCIe host nodes
Date:   Wed, 10 May 2023 18:03:58 +0900
Message-Id: <20230510090358.261266-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add iommu-map and iommu-map-mask properties into PCIe host nodes.
Note that iommu-map-mask should be zero because the IPMMU assigns
one micro TLB ID only, to the PCIe host.

Also change dma-ranges arguments for IOMMU. Notes that the dma-ranges
can be used if IOMMU is disabled.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Changes from v2:
https://lore.kernel.org/all/20230426082812.3621678-1-yoshihiro.shimoda.uh@renesas.com/
 - Revise the commit description.
 - Change the fourth argument of iommu-map.
 - Add IOMMU related propreties into r8a77980 and r8a774{a1,b1,c0,e1}.dtsi.

Changes from v1:
https://lore.kernel.org/all/20230421122608.3389397-1-yoshihiro.shimoda.uh@renesas.com/
 - Drop iommus property.
 - Add iommu-map-mask property.
 - Revise the commit description.

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi |  6 ++++--
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |  5 ++++-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi |  6 ++++--
 10 files changed, 68 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index c21b78685123..9065dc243428 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -2359,8 +2359,8 @@ pciec0: pcie@fe000000 {
 				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
 				 <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
 				 <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
-			/* Map all possible DDR as inbound ranges */
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			/* Map all possible DDR/IOMMU as inbound ranges */
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
@@ -2371,6 +2371,8 @@ pciec0: pcie@fe000000 {
 			clock-names = "pcie", "pcie_bus";
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
 			resets = <&cpg 319>;
+			iommu-map = <0 &ipmmu_hc 0 1>;
+			iommu-map-mask = <0>;
 			status = "disabled";
 		};
 
@@ -2386,8 +2388,8 @@ pciec1: pcie@ee800000 {
 				 <0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000>,
 				 <0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000>,
 				 <0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
-			/* Map all possible DDR as inbound ranges */
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			/* Map all possible DDR/IOMMU as inbound ranges */
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
@@ -2398,6 +2400,8 @@ pciec1: pcie@ee800000 {
 			clock-names = "pcie", "pcie_bus";
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
 			resets = <&cpg 318>;
+			iommu-map = <0 &ipmmu_hc 1 1>;
+			iommu-map-mask = <0>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 82216ce7a92a..75776decd218 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -2238,8 +2238,8 @@ pciec0: pcie@fe000000 {
 				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
 				 <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
 				 <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
-			/* Map all possible DDR as inbound ranges */
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			/* Map all possible DDR/IOMMU as inbound ranges */
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
@@ -2250,6 +2250,8 @@ pciec0: pcie@fe000000 {
 			clock-names = "pcie", "pcie_bus";
 			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
 			resets = <&cpg 319>;
+			iommu-map = <0 &ipmmu_hc 0 1>;
+			iommu-map-mask = <0>;
 			status = "disabled";
 		};
 
@@ -2265,8 +2267,8 @@ pciec1: pcie@ee800000 {
 				 <0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000>,
 				 <0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000>,
 				 <0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
-			/* Map all possible DDR as inbound ranges */
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			/* Map all possible DDR/IOMMU as inbound ranges */
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
@@ -2277,6 +2279,8 @@ pciec1: pcie@ee800000 {
 			clock-names = "pcie", "pcie_bus";
 			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
 			resets = <&cpg 318>;
+			iommu-map = <0 &ipmmu_hc 1 1>;
+			iommu-map-mask = <0>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 10abfde329d0..ad2e87b039ac 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1704,8 +1704,8 @@ pciec0: pcie@fe000000 {
 				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
 				 <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
 				 <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
-			/* Map all possible DDR as inbound ranges */
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x40000000>;
+			/* Map all possible DDR/IOMMU as inbound ranges */
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
@@ -1716,6 +1716,8 @@ pciec0: pcie@fe000000 {
 			clock-names = "pcie", "pcie_bus";
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
 			resets = <&cpg 319>;
+			iommu-map = <0 &ipmmu_hc 0 1>;
+			iommu-map-mask = <0>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 2828e05b40b3..2acf4067ab2f 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -2471,8 +2471,8 @@ pciec0: pcie@fe000000 {
 				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
 				 <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
 				 <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
-			/* Map all possible DDR as inbound ranges */
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			/* Map all possible DDR/IOMMU as inbound ranges */
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
@@ -2483,6 +2483,8 @@ pciec0: pcie@fe000000 {
 			clock-names = "pcie", "pcie_bus";
 			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
 			resets = <&cpg 319>;
+			iommu-map = <0 &ipmmu_hc 0 1>;
+			iommu-map-mask = <0>;
 			status = "disabled";
 		};
 
@@ -2498,8 +2500,8 @@ pciec1: pcie@ee800000 {
 				 <0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000>,
 				 <0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000>,
 				 <0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
-			/* Map all possible DDR as inbound ranges */
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			/* Map all possible DDR/IOMMU as inbound ranges */
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
@@ -2510,6 +2512,8 @@ pciec1: pcie@ee800000 {
 			clock-names = "pcie", "pcie_bus";
 			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
 			resets = <&cpg 318>;
+			iommu-map = <0 &ipmmu_hc 1 1>;
+			iommu-map-mask = <0>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 10b91e9733bf..6d15229d25ab 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -2778,8 +2778,8 @@ pciec0: pcie@fe000000 {
 				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
 				 <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
 				 <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
-			/* Map all possible DDR as inbound ranges */
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x40000000>;
+			/* Map all possible DDR/IOMMU as inbound ranges */
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
@@ -2790,6 +2790,8 @@ pciec0: pcie@fe000000 {
 			clock-names = "pcie", "pcie_bus";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 319>;
+			iommu-map = <0 &ipmmu_hc 0 1>;
+			iommu-map-mask = <0>;
 			status = "disabled";
 		};
 
@@ -2805,8 +2807,8 @@ pciec1: pcie@ee800000 {
 				 <0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000>,
 				 <0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000>,
 				 <0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
-			/* Map all possible DDR as inbound ranges */
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x40000000>;
+			/* Map all possible DDR/IOMMU as inbound ranges */
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
@@ -2817,6 +2819,8 @@ pciec1: pcie@ee800000 {
 			clock-names = "pcie", "pcie_bus";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 318>;
+			iommu-map = <0 &ipmmu_hc 1 1>;
+			iommu-map-mask = <0>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 3ea8572e917f..17062ec506be 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2565,8 +2565,8 @@ pciec0: pcie@fe000000 {
 				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
 				 <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
 				 <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
-			/* Map all possible DDR as inbound ranges */
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			/* Map all possible DDR/IOMMU as inbound ranges */
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
@@ -2577,6 +2577,8 @@ pciec0: pcie@fe000000 {
 			clock-names = "pcie", "pcie_bus";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 319>;
+			iommu-map = <0 &ipmmu_hc 0 1>;
+			iommu-map-mask = <0>;
 			status = "disabled";
 		};
 
@@ -2592,8 +2594,8 @@ pciec1: pcie@ee800000 {
 				 <0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000>,
 				 <0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000>,
 				 <0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
-			/* Map all possible DDR as inbound ranges */
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			/* Map all possible DDR/IOMMU as inbound ranges */
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
@@ -2604,6 +2606,8 @@ pciec1: pcie@ee800000 {
 			clock-names = "pcie", "pcie_bus";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 318>;
+			iommu-map = <0 &ipmmu_hc 1 1>;
+			iommu-map-mask = <0>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index d52cb0b67d80..d3f47da1b626 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2445,8 +2445,8 @@ pciec0: pcie@fe000000 {
 				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
 				 <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
 				 <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
-			/* Map all possible DDR as inbound ranges */
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			/* Map all possible DDR/IOMMU as inbound ranges */
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
@@ -2457,6 +2457,8 @@ pciec0: pcie@fe000000 {
 			clock-names = "pcie", "pcie_bus";
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
 			resets = <&cpg 319>;
+			iommu-map = <0 &ipmmu_hc 0 1>;
+			iommu-map-mask = <0>;
 			status = "disabled";
 		};
 
@@ -2472,8 +2474,8 @@ pciec1: pcie@ee800000 {
 				 <0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000>,
 				 <0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000>,
 				 <0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
-			/* Map all possible DDR as inbound ranges */
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			/* Map all possible DDR/IOMMU as inbound ranges */
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
@@ -2484,6 +2486,8 @@ pciec1: pcie@ee800000 {
 			clock-names = "pcie", "pcie_bus";
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
 			resets = <&cpg 318>;
+			iommu-map = <0 &ipmmu_hc 1 1>;
+			iommu-map-mask = <0>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 9584115c6b17..c75820038491 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2423,8 +2423,8 @@ pciec0: pcie@fe000000 {
 				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
 				 <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
 				 <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
-			/* Map all possible DDR as inbound ranges */
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			/* Map all possible DDR/IOMMU as inbound ranges */
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
@@ -2435,6 +2435,8 @@ pciec0: pcie@fe000000 {
 			clock-names = "pcie", "pcie_bus";
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			resets = <&cpg 319>;
+			iommu-map = <0 &ipmmu_hc 0 1>;
+			iommu-map-mask = <0>;
 			status = "disabled";
 		};
 
@@ -2450,8 +2452,8 @@ pciec1: pcie@ee800000 {
 				 <0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000>,
 				 <0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000>,
 				 <0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
-			/* Map all possible DDR as inbound ranges */
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			/* Map all possible DDR/IOMMU as inbound ranges */
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
@@ -2462,6 +2464,8 @@ pciec1: pcie@ee800000 {
 			clock-names = "pcie", "pcie_bus";
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			resets = <&cpg 318>;
+			iommu-map = <0 &ipmmu_hc 1 1>;
+			iommu-map-mask = <0>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index c4ac28a0f716..5ed2daaca1f0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -1386,7 +1386,8 @@ pciec: pcie@fe000000 {
 				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x0200000>,
 				 <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>,
 				 <0x42000000 0 0x38000000 0 0x38000000 0 0x8000000>;
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			/* Map all possible DDR/IOMMU as inbound ranges */
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
@@ -1399,6 +1400,8 @@ pciec: pcie@fe000000 {
 			resets = <&cpg 319>;
 			phys = <&pcie_phy>;
 			phy-names = "pcie";
+			iommu-map = <0 &ipmmu_vi0 5 1>;
+			iommu-map-mask = <0>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 4529e9b57c33..1be0b99c15ed 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1870,8 +1870,8 @@ pciec0: pcie@fe000000 {
 				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
 				 <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
 				 <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
-			/* Map all possible DDR as inbound ranges */
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x40000000>;
+			/* Map all possible DDR/IOMMU as inbound ranges */
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
@@ -1882,6 +1882,8 @@ pciec0: pcie@fe000000 {
 			clock-names = "pcie", "pcie_bus";
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 319>;
+			iommu-map = <0 &ipmmu_hc 0 1>;
+			iommu-map-mask = <0>;
 			status = "disabled";
 		};
 
-- 
2.25.1

