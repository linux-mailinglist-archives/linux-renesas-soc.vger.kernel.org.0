Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A236EAA56
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 14:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjDUM01 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 08:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjDUM00 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 08:26:26 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D8D9786B0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Apr 2023 05:26:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,214,1677510000"; 
   d="scan'208";a="160286574"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Apr 2023 21:26:24 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 446C942332B8;
        Fri, 21 Apr 2023 21:26:24 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: Add IOMMU related properties into PCIe host nodes
Date:   Fri, 21 Apr 2023 21:26:08 +0900
Message-Id: <20230421122608.3389397-1-yoshihiro.shimoda.uh@renesas.com>
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

Add iommus and iommu-map properties into PCIe host nodes. Also
change dma-ranges arguments for IOMMU. Notes that the dma-ranges
can be used on non-IOMMU environment.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 12 ++++++++----
 arch/arm64/boot/dts/renesas/r8a77990.dtsi |  6 ++++--
 5 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 10b91e9733bf..6061fb61492a 100644
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
+			iommus = <&ipmmu_hc 0>;
+			iommu-map = <0 &ipmmu_hc 0 0x10000>;
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
+			iommus = <&ipmmu_hc 1>;
+			iommu-map = <0 &ipmmu_hc 1 0x10000>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 3ea8572e917f..8e56a6bcfc0e 100644
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
+			iommus = <&ipmmu_hc 0>;
+			iommu-map = <0 &ipmmu_hc 0 0x10000>;
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
+			iommus = <&ipmmu_hc 1>;
+			iommu-map = <0 &ipmmu_hc 1 0x10000>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index d52cb0b67d80..ecb210096fe2 100644
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
+			iommus = <&ipmmu_hc 0>;
+			iommu-map = <0 &ipmmu_hc 0 0x10000>;
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
+			iommus = <&ipmmu_hc 1>;
+			iommu-map = <0 &ipmmu_hc 1 0x10000>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 9584115c6b17..e50fa81dd7d2 100644
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
+			iommus = <&ipmmu_hc 0>;
+			iommu-map = <0 &ipmmu_hc 0 0x10000>;
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
+			iommus = <&ipmmu_hc 1>;
+			iommu-map = <0 &ipmmu_hc 1 0x10000>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 4529e9b57c33..49bcd033a6b2 100644
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
+			iommus = <&ipmmu_hc 0>;
+			iommu-map = <0 &ipmmu_hc 0 0x10000>;
 			status = "disabled";
 		};
 
-- 
2.25.1

