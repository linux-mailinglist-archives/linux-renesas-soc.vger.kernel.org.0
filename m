Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2501D11E88D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 17:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbfLMQlV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 11:41:21 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:58214 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728352AbfLMQlU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 11:41:20 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id dUhG2100U5USYZQ01UhGSf; Fri, 13 Dec 2019 17:41:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0006uj-Ln; Fri, 13 Dec 2019 17:41:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0000zL-Jx; Fri, 13 Dec 2019 17:41:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/7] arm64: dts: renesas: Group tuples in pci ranges and dma-ranges properties
Date:   Fri, 13 Dec 2019 17:41:14 +0100
Message-Id: <20191213164115.3697-8-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213164115.3697-1-geert+renesas@glider.be>
References: <20191213164115.3697-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To improve human readability and enable automatic validation, the tuples
in the "ranges" and "dma-ranges" properties of PCI device nodes should
be grouped.

Fix this by grouping the tuples of the "ranges" and "dma-ranges"
properties using angle brackets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I still see e.g.

    arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dt.yaml: soc: pcie@fe000000:ranges: [[16777216, 0, 0, 0, 4262461440, 0, 1048576], [33554432, 0, 4263510016, 0, 4263510016, 0, 2097152], [33554432, 0, 805306368, 0, 805306368, 0, 134217728], [1107296256, 0, 939524096, 0, 939524096, 0, 134217728]] is not valid under any of the given schemas (Possible causes of the failure):
	arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dt.yaml: soc: pcie@fe000000:ranges: True was expected
	arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dt.yaml: soc: pcie@fe000000:ranges:0: [16777216, 0, 0, 0, 4262461440, 0, 1048576] is too long
	arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dt.yaml: soc: pcie@fe000000:ranges:1: [33554432, 0, 4263510016, 0, 4263510016, 0, 2097152] is too long
	arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dt.yaml: soc: pcie@fe000000:ranges:2: [33554432, 0, 805306368, 0, 805306368, 0, 134217728] is too long
	arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dt.yaml: soc: pcie@fe000000:ranges:3: [1107296256, 0, 939524096, 0, 939524096, 0, 134217728] is too long
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 16 ++++++++--------
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 16 ++++++++--------
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi |  8 ++++----
 arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 16 ++++++++--------
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 16 ++++++++--------
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 16 ++++++++--------
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 13 +++++--------
 arch/arm64/boot/dts/renesas/r8a77990.dtsi |  8 ++++----
 8 files changed, 53 insertions(+), 56 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index a733dc26e1f3196f..507e78ebaab52330 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -2323,10 +2323,10 @@
 			#size-cells = <2>;
 			bus-range = <0x00 0xff>;
 			device_type = "pci";
-			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000
-				0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000
-				0x02000000 0 0x30000000 0 0x30000000 0 0x08000000
-				0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
+			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000>,
+				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
+				 <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
+				 <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
 			/* Map all possible DDR as inbound ranges */
 			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
@@ -2350,10 +2350,10 @@
 			#size-cells = <2>;
 			bus-range = <0x00 0xff>;
 			device_type = "pci";
-			ranges = <0x01000000 0 0x00000000 0 0xee900000 0 0x00100000
-				0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000
-				0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000
-				0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
+			ranges = <0x01000000 0 0x00000000 0 0xee900000 0 0x00100000>,
+				 <0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000>,
+				 <0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000>,
+				 <0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
 			/* Map all possible DDR as inbound ranges */
 			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 4ea64290da5b7f85..93dd10b5d6d05712 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -2192,10 +2192,10 @@
 			#size-cells = <2>;
 			bus-range = <0x00 0xff>;
 			device_type = "pci";
-			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000
-				  0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000
-				  0x02000000 0 0x30000000 0 0x30000000 0 0x08000000
-				  0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
+			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000>,
+				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
+				 <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
+				 <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
 			/* Map all possible DDR as inbound ranges */
 			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
@@ -2219,10 +2219,10 @@
 			#size-cells = <2>;
 			bus-range = <0x00 0xff>;
 			device_type = "pci";
-			ranges = <0x01000000 0 0x00000000 0 0xee900000 0 0x00100000
-				  0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000
-				  0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000
-				  0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
+			ranges = <0x01000000 0 0x00000000 0 0xee900000 0 0x00100000>,
+				 <0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000>,
+				 <0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000>,
+				 <0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
 			/* Map all possible DDR as inbound ranges */
 			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index e2fc1b9385d3f65f..d4eee8fef35da74e 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1679,10 +1679,10 @@
 			#size-cells = <2>;
 			bus-range = <0x00 0xff>;
 			device_type = "pci";
-			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000
-				  0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000
-				  0x02000000 0 0x30000000 0 0x30000000 0 0x08000000
-				  0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
+			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000>,
+				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
+				 <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
+				 <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
 			/* Map all possible DDR as inbound ranges */
 			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x40000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index c49b539e895f7868..4c9eab4852891e7b 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -2679,10 +2679,10 @@
 			#size-cells = <2>;
 			bus-range = <0x00 0xff>;
 			device_type = "pci";
-			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000
-				0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000
-				0x02000000 0 0x30000000 0 0x30000000 0 0x08000000
-				0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
+			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000>,
+				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
+				 <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
+				 <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
 			/* Map all possible DDR as inbound ranges */
 			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x40000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
@@ -2706,10 +2706,10 @@
 			#size-cells = <2>;
 			bus-range = <0x00 0xff>;
 			device_type = "pci";
-			ranges = <0x01000000 0 0x00000000 0 0xee900000 0 0x00100000
-				0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000
-				0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000
-				0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
+			ranges = <0x01000000 0 0x00000000 0 0xee900000 0 0x00100000>,
+				 <0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000>,
+				 <0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000>,
+				 <0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
 			/* Map all possible DDR as inbound ranges */
 			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x40000000>;
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index f4804153f41ce285..988b83fe62d485eb 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2462,10 +2462,10 @@
 			#size-cells = <2>;
 			bus-range = <0x00 0xff>;
 			device_type = "pci";
-			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000
-				0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000
-				0x02000000 0 0x30000000 0 0x30000000 0 0x08000000
-				0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
+			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000>,
+				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
+				 <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
+				 <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
 			/* Map all possible DDR as inbound ranges */
 			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
@@ -2489,10 +2489,10 @@
 			#size-cells = <2>;
 			bus-range = <0x00 0xff>;
 			device_type = "pci";
-			ranges = <0x01000000 0 0x00000000 0 0xee900000 0 0x00100000
-				0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000
-				0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000
-				0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
+			ranges = <0x01000000 0 0x00000000 0 0xee900000 0 0x00100000>,
+				 <0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000>,
+				 <0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000>,
+				 <0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
 			/* Map all possible DDR as inbound ranges */
 			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 143b4fae7ea0042a..7d2b283b7f556b1d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2184,10 +2184,10 @@
 			#size-cells = <2>;
 			bus-range = <0x00 0xff>;
 			device_type = "pci";
-			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000
-				0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000
-				0x02000000 0 0x30000000 0 0x30000000 0 0x08000000
-				0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
+			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000>,
+				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
+				 <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
+				 <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
 			/* Map all possible DDR as inbound ranges */
 			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
@@ -2211,10 +2211,10 @@
 			#size-cells = <2>;
 			bus-range = <0x00 0xff>;
 			device_type = "pci";
-			ranges = <0x01000000 0 0x00000000 0 0xee900000 0 0x00100000
-				0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000
-				0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000
-				0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
+			ranges = <0x01000000 0 0x00000000 0 0xee900000 0 0x00100000>,
+				 <0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000>,
+				 <0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000>,
+				 <0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
 			/* Map all possible DDR as inbound ranges */
 			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index f5afb28043eb62ce..6a39ec2299bc79cf 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -1367,14 +1367,11 @@
 			#size-cells = <2>;
 			bus-range = <0x00 0xff>;
 			device_type = "pci";
-			ranges = <
-				0x01000000 0 0x00000000 0 0xfe100000 0 0x0100000
-				0x02000000 0 0xfe200000 0 0xfe200000 0 0x0200000
-				0x02000000 0 0x30000000 0 0x30000000 0 0x8000000
-				0x42000000 0 0x38000000 0 0x38000000 0 0x8000000
-			>;
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000
-				      0 0x80000000>;
+			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x0100000>,
+				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x0200000>,
+				 <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>,
+				 <0x42000000 0 0x38000000 0 0x38000000 0 0x8000000>;
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 8318466df00cca71..80e8ef3007c5b646 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1635,10 +1635,10 @@
 			#size-cells = <2>;
 			bus-range = <0x00 0xff>;
 			device_type = "pci";
-			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000
-				  0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000
-				  0x02000000 0 0x30000000 0 0x30000000 0 0x08000000
-				  0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
+			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000>,
+				 <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
+				 <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
+				 <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
 			/* Map all possible DDR as inbound ranges */
 			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x40000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.17.1

