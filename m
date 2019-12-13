Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6603011E889
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 17:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbfLMQlU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 11:41:20 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:33446 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728274AbfLMQlT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 11:41:19 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id dUhG2100e5USYZQ06UhGDN; Fri, 13 Dec 2019 17:41:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0006uX-I0; Fri, 13 Dec 2019 17:41:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0000zC-Gk; Fri, 13 Dec 2019 17:41:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/7] ARM: dts: renesas: Group tuples in pci ranges and dma-ranges properties
Date:   Fri, 13 Dec 2019 17:41:11 +0100
Message-Id: <20191213164115.3697-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213164115.3697-1-geert+renesas@glider.be>
References: <20191213164115.3697-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To improve human readability and enable automatic validation, the tuples
in the "ranges" and "dma-ranges" properties of PCI devices nodes should
be grouped.  Not doing so causes "make dtbs_check" to emit warnings
like:

    pcie@fe000000: dma-ranges: [[1107296256, 0, 1073741824, 0, 1073741824, 0, 2147483648, 1124073472, 2, 0, 2, 0, 1, 0]] is not valid under any of the given schemas (Possible causes of the failure):
    pcie@fe000000: dma-ranges: [[1107296256, 0, 1073741824, 0, 1073741824, 0, 2147483648, 1124073472, 2, 0, 2, 0, 1, 0]] is not of type 'boolean'
    pcie@fe000000: dma-ranges:0: [1107296256, 0, 1073741824, 0, 1073741824, 0, 2147483648, 1124073472, 2, 0, 2, 0, 1, 0] is too long

Fix this by grouping the tuples of the "ranges" and "dma-ranges"
properties using angle brackets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I still see e.g.:

    arch/arm/boot/dts/r8a7791-koelsch.dt.yaml: soc: pci@ee090000:ranges: [[33554432, 0, 3993501696, 0, 3993501696, 0, 65536]] is not valid under any of the given schemas (Possible causes of the failure):
        arch/arm/boot/dts/r8a7791-koelsch.dt.yaml: soc: pci@ee090000:ranges: True was expected
        arch/arm/boot/dts/r8a7791-koelsch.dt.yaml: soc: pci@ee090000:ranges:0: [33554432, 0, 3993501696, 0, 3993501696, 0, 65536] is too long
---
 arch/arm/boot/dts/r8a7743.dtsi | 12 ++++++------
 arch/arm/boot/dts/r8a7744.dtsi | 12 ++++++------
 arch/arm/boot/dts/r8a7790.dtsi | 12 ++++++------
 arch/arm/boot/dts/r8a7791.dtsi | 12 ++++++------
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 36d45f5a6281bb89..1cd19a569bd0fb66 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -1617,13 +1617,13 @@
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
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000
-				      0x43000000 2 0x00000000 2 0x00000000 1 0x00000000>;
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>,
+				     <0x43000000 2 0x00000000 2 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 366201d0a71d1986..1c82dd0abd76c4c9 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -1603,13 +1603,13 @@
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
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000
-				      0x43000000 2 0x00000000 2 0x00000000 1 0x00000000>;
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>,
+				     <0x43000000 2 0x00000000 2 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index ebe9dbf3f8884e99..334ba19769b998ac 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1617,13 +1617,13 @@
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
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000
-				      0x43000000 1 0x80000000 1 0x80000000 0 0x80000000>;
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>,
+				     <0x43000000 1 0x80000000 1 0x80000000 0 0x80000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 2267607616e6413b..baedfab84cb09134 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1602,13 +1602,13 @@
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
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000
-				      0x43000000 2 0x00000000 2 0x00000000 1 0x00000000>;
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>,
+				     <0x43000000 2 0x00000000 2 0x00000000 1 0x00000000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.17.1

