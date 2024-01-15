Return-Path: <linux-renesas-soc+bounces-1575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB5B82DA2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 14:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E3DA1C211F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 13:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5451117547;
	Mon, 15 Jan 2024 13:33:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F49F17543
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2024 13:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1376:70aa:e074:32d3])
	by laurent.telenet-ops.be with bizsmtp
	id b1ZK2B00Z34Hgv9011ZKtP; Mon, 15 Jan 2024 14:33:20 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rPN4t-00Fdw8-0t;
	Mon, 15 Jan 2024 14:33:19 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rPN5b-00C0OA-OX;
	Mon, 15 Jan 2024 14:33:19 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779g0: Restore sort order
Date: Mon, 15 Jan 2024 14:33:18 +0100
Message-Id: <f00ef274a73c8fd60f940a1649423a8927b9ae8a.1705324708.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Numerical by unit address, alphabetical by node name.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.9.

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 72 +++++++++++------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index d3d25e077c5d5053..3be1159982b204e9 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -161,11 +161,6 @@ L3_CA76_1: cache-controller-1 {
 		};
 	};
 
-	psci {
-		compatible = "arm,psci-1.0", "arm,psci-0.2";
-		method = "smc";
-	};
-
 	extal_clk: extal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -185,6 +180,11 @@ pmu_a76 {
 		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
 	/* External SCIF clock - to be overridden by boards that provide it */
 	scif_clk: scif {
 		compatible = "fixed-clock";
@@ -1777,6 +1777,37 @@ ssi0: ssi-0 {
 			};
 		};
 
+		mmc0: mmc@ee140000 {
+			compatible = "renesas,sdhi-r8a779g0",
+				     "renesas,rcar-gen4-sdhi";
+			reg = <0 0xee140000 0 0x2000>;
+			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 706>,
+				 <&cpg CPG_CORE R8A779G0_CLK_SD0H>;
+			clock-names = "core", "clkh";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 706>;
+			max-frequency = <200000000>;
+			iommus = <&ipmmu_ds0 32>;
+			status = "disabled";
+		};
+
+		rpc: spi@ee200000 {
+			compatible = "renesas,r8a779g0-rpc-if",
+				     "renesas,rcar-gen4-rpc-if";
+			reg = <0 0xee200000 0 0x200>,
+			      <0 0x08000000 0 0x04000000>,
+			      <0 0xee208000 0 0x100>;
+			reg-names = "regs", "dirmap", "wbuf";
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 629>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 629>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		ipmmu_rt0: iommu@ee480000 {
 			compatible = "renesas,ipmmu-r8a779g0",
 				     "renesas,rcar-gen4-ipmmu-vmsa";
@@ -1886,37 +1917,6 @@ ipmmu_mm: iommu@eefc0000 {
 			#iommu-cells = <1>;
 		};
 
-		mmc0: mmc@ee140000 {
-			compatible = "renesas,sdhi-r8a779g0",
-				     "renesas,rcar-gen4-sdhi";
-			reg = <0 0xee140000 0 0x2000>;
-			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 706>,
-				 <&cpg CPG_CORE R8A779G0_CLK_SD0H>;
-			clock-names = "core", "clkh";
-			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
-			resets = <&cpg 706>;
-			max-frequency = <200000000>;
-			iommus = <&ipmmu_ds0 32>;
-			status = "disabled";
-		};
-
-		rpc: spi@ee200000 {
-			compatible = "renesas,r8a779g0-rpc-if",
-				     "renesas,rcar-gen4-rpc-if";
-			reg = <0 0xee200000 0 0x200>,
-			      <0 0x08000000 0 0x04000000>,
-			      <0 0xee208000 0 0x100>;
-			reg-names = "regs", "dirmap", "wbuf";
-			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 629>;
-			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
-			resets = <&cpg 629>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
-
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.34.1


