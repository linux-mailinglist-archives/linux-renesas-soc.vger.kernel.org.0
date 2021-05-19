Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD60388E1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 May 2021 14:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353400AbhESMdH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 May 2021 08:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353396AbhESMdG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 May 2021 08:33:06 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C595CC06175F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 May 2021 05:31:46 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:c161:a89e:52bd:1787])
        by laurent.telenet-ops.be with bizsmtp
        id 6cXi25005446CkP01cXihn; Wed, 19 May 2021 14:31:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ljLMT-007EqW-LD; Wed, 19 May 2021 14:31:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ljLMT-007agr-4o; Wed, 19 May 2021 14:31:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3] ARM: dts: renesas: Move enable-method to CPU nodes
Date:   Wed, 19 May 2021 14:31:37 +0200
Message-Id: <35fcfedf9de9269185c48ca5a6dfcba7cdd3484b.1621427319.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to Documentation/devicetree/bindings/arm/cpus.yaml, the
"enable-method" property should be a property of the individual CPU
nodes, and not of the parent "cpus" container node.
However, on R-Car Gen2 and RZ/G1 SoCs, the property is tied to the
"cpus" node instead.

Secondary CPU bringup and CPU hot (un)plug work regardless, as
arm_dt_init_cpu_maps() falls back to looking in the "cpus" node.

The cpuidle code does not have such a fallback, so it does not detect
the enable-method.  Note that cpuidle does not support the
"renesas,apmu" enable-method yet, so for now this does not make any
difference.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.14.
Note that v1 and v2 never received any feedback.

Arm64 and powerpc do not have such a fallback, but SH has, like arm32.

v3:
  - Extend to cover all R-Car Gen2 and RZ/G2 .dtsi files,

v2:
  - Update reference after commit 672951cbd1b70a9e ("dt-bindings: arm:
    Convert cpu binding to json-schema").
---
 arch/arm/boot/dts/r8a7742.dtsi  | 5 ++++-
 arch/arm/boot/dts/r8a7743.dtsi  | 3 ++-
 arch/arm/boot/dts/r8a7744.dtsi  | 3 ++-
 arch/arm/boot/dts/r8a7745.dtsi  | 3 ++-
 arch/arm/boot/dts/r8a77470.dtsi | 3 ++-
 arch/arm/boot/dts/r8a7790.dtsi  | 9 ++++++++-
 arch/arm/boot/dts/r8a7791.dtsi  | 3 ++-
 arch/arm/boot/dts/r8a7792.dtsi  | 3 ++-
 arch/arm/boot/dts/r8a7793.dtsi  | 3 ++-
 arch/arm/boot/dts/r8a7794.dtsi  | 3 ++-
 10 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
index 8e989063d7027dc2..a2279686ffcccb04 100644
--- a/arch/arm/boot/dts/r8a7742.dtsi
+++ b/arch/arm/boot/dts/r8a7742.dtsi
@@ -47,7 +47,6 @@ can_clk: can {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -56,6 +55,7 @@ cpu0: cpu@0 {
 			clock-frequency = <1400000000>;
 			clocks = <&cpg CPG_CORE R8A7742_CLK_Z>;
 			power-domains = <&sysc R8A7742_PD_CA15_CPU0>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA15>;
 			capacity-dmips-mhz = <1024>;
 			voltage-tolerance = <1>; /* 1% */
@@ -77,6 +77,7 @@ cpu1: cpu@1 {
 			clock-frequency = <1400000000>;
 			clocks = <&cpg CPG_CORE R8A7742_CLK_Z>;
 			power-domains = <&sysc R8A7742_PD_CA15_CPU1>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA15>;
 			capacity-dmips-mhz = <1024>;
 			voltage-tolerance = <1>; /* 1% */
@@ -98,6 +99,7 @@ cpu2: cpu@2 {
 			clock-frequency = <1400000000>;
 			clocks = <&cpg CPG_CORE R8A7742_CLK_Z>;
 			power-domains = <&sysc R8A7742_PD_CA15_CPU2>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA15>;
 			capacity-dmips-mhz = <1024>;
 			voltage-tolerance = <1>; /* 1% */
@@ -119,6 +121,7 @@ cpu3: cpu@3 {
 			clock-frequency = <1400000000>;
 			clocks = <&cpg CPG_CORE R8A7742_CLK_Z>;
 			power-domains = <&sysc R8A7742_PD_CA15_CPU3>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA15>;
 			capacity-dmips-mhz = <1024>;
 			voltage-tolerance = <1>; /* 1% */
diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 16e3bf01fc88f0b8..7e5e09d210ec5a60 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -49,7 +49,6 @@ can_clk: can {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -59,6 +58,7 @@ cpu0: cpu@0 {
 			clocks = <&cpg CPG_CORE R8A7743_CLK_Z>;
 			clock-latency = <300000>; /* 300 us */
 			power-domains = <&sysc R8A7743_PD_CA15_CPU0>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA15>;
 
 			/* kHz - uV - OPPs unknown yet */
@@ -78,6 +78,7 @@ cpu1: cpu@1 {
 			clocks = <&cpg CPG_CORE R8A7743_CLK_Z>;
 			clock-latency = <300000>; /* 300 us */
 			power-domains = <&sysc R8A7743_PD_CA15_CPU1>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA15>;
 
 			/* kHz - uV - OPPs unknown yet */
diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 4865e39164fafaa1..8419683a9d83915c 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -49,7 +49,6 @@ can_clk: can {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -59,6 +58,7 @@ cpu0: cpu@0 {
 			clocks = <&cpg CPG_CORE R8A7744_CLK_Z>;
 			clock-latency = <300000>; /* 300 us */
 			power-domains = <&sysc R8A7744_PD_CA15_CPU0>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA15>;
 
 			/* kHz - uV - OPPs unknown yet */
@@ -78,6 +78,7 @@ cpu1: cpu@1 {
 			clocks = <&cpg CPG_CORE R8A7744_CLK_Z>;
 			clock-latency = <300000>; /* 300 us */
 			power-domains = <&sysc R8A7744_PD_CA15_CPU1>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA15>;
 
 			/* kHz - uV - OPPs unknown yet */
diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index 0756197258de4a4b..817edb61a54409a3 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -64,7 +64,6 @@ can_clk: can {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -73,6 +72,7 @@ cpu0: cpu@0 {
 			clock-frequency = <1000000000>;
 			clocks = <&cpg CPG_CORE R8A7745_CLK_Z2>;
 			power-domains = <&sysc R8A7745_PD_CA7_CPU0>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA7>;
 		};
 
@@ -83,6 +83,7 @@ cpu1: cpu@1 {
 			clock-frequency = <1000000000>;
 			clocks = <&cpg CPG_CORE R8A7745_CLK_Z2>;
 			power-domains = <&sysc R8A7745_PD_CA7_CPU1>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA7>;
 		};
 
diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 5d1f3570d5c7ed2a..13ef1e9bf4d5e292 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -25,7 +25,6 @@ aliases {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -34,6 +33,7 @@ cpu0: cpu@0 {
 			clock-frequency = <1000000000>;
 			clocks = <&cpg CPG_CORE R8A77470_CLK_Z2>;
 			power-domains = <&sysc R8A77470_PD_CA7_CPU0>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA7>;
 		};
 
@@ -44,6 +44,7 @@ cpu1: cpu@1 {
 			clock-frequency = <1000000000>;
 			clocks = <&cpg CPG_CORE R8A77470_CLK_Z2>;
 			power-domains = <&sysc R8A77470_PD_CA7_CPU1>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA7>;
 		};
 
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index f7c4b52b8c26a59d..ed6dd4fcc503cbd8 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -69,7 +69,6 @@ can_clk: can {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -78,6 +77,7 @@ cpu0: cpu@0 {
 			clock-frequency = <1300000000>;
 			clocks = <&cpg CPG_CORE R8A7790_CLK_Z>;
 			power-domains = <&sysc R8A7790_PD_CA15_CPU0>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA15>;
 			capacity-dmips-mhz = <1024>;
 			voltage-tolerance = <1>; /* 1% */
@@ -99,6 +99,7 @@ cpu1: cpu@1 {
 			clock-frequency = <1300000000>;
 			clocks = <&cpg CPG_CORE R8A7790_CLK_Z>;
 			power-domains = <&sysc R8A7790_PD_CA15_CPU1>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA15>;
 			capacity-dmips-mhz = <1024>;
 			voltage-tolerance = <1>; /* 1% */
@@ -120,6 +121,7 @@ cpu2: cpu@2 {
 			clock-frequency = <1300000000>;
 			clocks = <&cpg CPG_CORE R8A7790_CLK_Z>;
 			power-domains = <&sysc R8A7790_PD_CA15_CPU2>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA15>;
 			capacity-dmips-mhz = <1024>;
 			voltage-tolerance = <1>; /* 1% */
@@ -141,6 +143,7 @@ cpu3: cpu@3 {
 			clock-frequency = <1300000000>;
 			clocks = <&cpg CPG_CORE R8A7790_CLK_Z>;
 			power-domains = <&sysc R8A7790_PD_CA15_CPU3>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA15>;
 			capacity-dmips-mhz = <1024>;
 			voltage-tolerance = <1>; /* 1% */
@@ -162,6 +165,7 @@ cpu4: cpu@100 {
 			clock-frequency = <780000000>;
 			clocks = <&cpg CPG_CORE R8A7790_CLK_Z2>;
 			power-domains = <&sysc R8A7790_PD_CA7_CPU0>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA7>;
 			capacity-dmips-mhz = <539>;
 		};
@@ -173,6 +177,7 @@ cpu5: cpu@101 {
 			clock-frequency = <780000000>;
 			clocks = <&cpg CPG_CORE R8A7790_CLK_Z2>;
 			power-domains = <&sysc R8A7790_PD_CA7_CPU1>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA7>;
 			capacity-dmips-mhz = <539>;
 		};
@@ -184,6 +189,7 @@ cpu6: cpu@102 {
 			clock-frequency = <780000000>;
 			clocks = <&cpg CPG_CORE R8A7790_CLK_Z2>;
 			power-domains = <&sysc R8A7790_PD_CA7_CPU2>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA7>;
 			capacity-dmips-mhz = <539>;
 		};
@@ -195,6 +201,7 @@ cpu7: cpu@103 {
 			clock-frequency = <780000000>;
 			clocks = <&cpg CPG_CORE R8A7790_CLK_Z2>;
 			power-domains = <&sysc R8A7790_PD_CA7_CPU3>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA7>;
 			capacity-dmips-mhz = <539>;
 		};
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index f05d7541f87ec574..0ccc162d3c2c981a 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -68,7 +68,6 @@ can_clk: can {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -77,6 +76,7 @@ cpu0: cpu@0 {
 			clock-frequency = <1500000000>;
 			clocks = <&cpg CPG_CORE R8A7791_CLK_Z>;
 			power-domains = <&sysc R8A7791_PD_CA15_CPU0>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA15>;
 			voltage-tolerance = <1>; /* 1% */
 			clock-latency = <300000>; /* 300 us */
@@ -97,6 +97,7 @@ cpu1: cpu@1 {
 			clock-frequency = <1500000000>;
 			clocks = <&cpg CPG_CORE R8A7791_CLK_Z>;
 			power-domains = <&sysc R8A7791_PD_CA15_CPU1>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA15>;
 			voltage-tolerance = <1>; /* 1% */
 			clock-latency = <300000>; /* 300 us */
diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index bd7ff205433e8e9f..9cdb73894ac23a80 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -45,7 +45,6 @@ can_clk: can {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -54,6 +53,7 @@ cpu0: cpu@0 {
 			clock-frequency = <1000000000>;
 			clocks = <&cpg CPG_CORE R8A7792_CLK_Z>;
 			power-domains = <&sysc R8A7792_PD_CA15_CPU0>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA15>;
 		};
 
@@ -64,6 +64,7 @@ cpu1: cpu@1 {
 			clock-frequency = <1000000000>;
 			clocks = <&cpg CPG_CORE R8A7792_CLK_Z>;
 			power-domains = <&sysc R8A7792_PD_CA15_CPU1>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA15>;
 		};
 
diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 6d74475030edfeb6..dea4b1e108af0a82 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -60,7 +60,6 @@ can_clk: can {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -69,6 +68,7 @@ cpu0: cpu@0 {
 			clock-frequency = <1500000000>;
 			clocks = <&cpg CPG_CORE R8A7793_CLK_Z>;
 			power-domains = <&sysc R8A7793_PD_CA15_CPU0>;
+			enable-method = "renesas,apmu";
 			voltage-tolerance = <1>; /* 1% */
 			clock-latency = <300000>; /* 300 us */
 
@@ -89,6 +89,7 @@ cpu1: cpu@1 {
 			clock-frequency = <1500000000>;
 			clocks = <&cpg CPG_CORE R8A7793_CLK_Z>;
 			power-domains = <&sysc R8A7793_PD_CA15_CPU1>;
+			enable-method = "renesas,apmu";
 			voltage-tolerance = <1>; /* 1% */
 			clock-latency = <300000>; /* 300 us */
 
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index f974b8676bc59222..6a4709332acc4b52 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -62,7 +62,6 @@ can_clk: can {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -71,6 +70,7 @@ cpu0: cpu@0 {
 			clock-frequency = <1000000000>;
 			clocks = <&cpg CPG_CORE R8A7794_CLK_Z2>;
 			power-domains = <&sysc R8A7794_PD_CA7_CPU0>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA7>;
 		};
 
@@ -81,6 +81,7 @@ cpu1: cpu@1 {
 			clock-frequency = <1000000000>;
 			clocks = <&cpg CPG_CORE R8A7794_CLK_Z2>;
 			power-domains = <&sysc R8A7794_PD_CA7_CPU1>;
+			enable-method = "renesas,apmu";
 			next-level-cache = <&L2_CA7>;
 		};
 
-- 
2.25.1

