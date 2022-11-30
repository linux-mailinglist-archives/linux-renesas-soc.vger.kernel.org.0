Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00D3E63D7ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Nov 2022 15:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiK3OQ0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Nov 2022 09:16:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiK3OQZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Nov 2022 09:16:25 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D861140
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Nov 2022 06:16:22 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:3c4f:c29d:dee7:957c])
        by michel.telenet-ops.be with bizsmtp
        id qeGG2800H1wQlgf06eGG1T; Wed, 30 Nov 2022 15:16:18 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p0Nsm-0028RH-5F; Wed, 30 Nov 2022 15:16:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p0Nsl-003ruc-OB; Wed, 30 Nov 2022 15:16:15 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Tho Vu <tho.vu.wh@renesas.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779f0: Add CA55 operating points
Date:   Wed, 30 Nov 2022 15:16:13 +0100
Message-Id: <ae78351d702a53702a1d5fa26675fe982b99cdf5.1669817508.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add operating points for running the Cortex-A55 CPU cores on R-Car S4-8
at various speeds, up to the maximum supported frequency (1200 MHz).

R-Car S4-8 has 8 Cortex-A55 cores, grouped in 4 clusters.
CA55 Sub-System 0 (first 2 clusters / CPU cores 0-3) is clocked by Z0φ.
CA55 Sub-System 1 (last 2 clusters / CPU cores 4-7) is clocked by Z1φ.

As the two sets of clusters are driven by separate clocks, this requires
specifying two separate tables (using the same operating performance
point values), with "opp-shared" to indicate that the CPU cores in each
set share state.

Based on a patch in the BSP by Tho Vu.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.3.

Changes compared to the BSP:
  - Use two tables.

Tested on the Renesas Spider development board by using the CPUfreq
userspace governor, writing the desired CPU clock rate to the CPUfreq
policy's "scaling_setspeed" file in sysfs, verifying the clock rate of
the Z0φ and Z1φ clocks in debugfs, and running the dhrystones benchmark
on the various CPU cores.

The Linux cpufreq driver creates two policies under
/sys/devices/system/cpu/cpufreq/: "policy0" and "policy4".

With a single table and "opp-shared", only "policy0" would be created,
and clock Z1φ would never be changed.
With a single table and without "opp-shared", 8 policies would be
created, and the rate of clocks Z0φ and Z1φ would reflect the value for
the last touched CPU core from the corresponding set.
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 62 +++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 67a4f2d4480d8450..ac294168c86785db 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -14,6 +14,60 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	cluster01_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <880000>;
+			clock-latency-ns = <500000>;
+		};
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <880000>;
+			clock-latency-ns = <500000>;
+		};
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <880000>;
+			clock-latency-ns = <500000>;
+		};
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <880000>;
+			clock-latency-ns = <500000>;
+			opp-suspend;
+		};
+	};
+
+	cluster23_opp: opp-table-1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <880000>;
+			clock-latency-ns = <500000>;
+		};
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <880000>;
+			clock-latency-ns = <500000>;
+		};
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <880000>;
+			clock-latency-ns = <500000>;
+		};
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <880000>;
+			clock-latency-ns = <500000>;
+			opp-suspend;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -65,6 +119,7 @@ a55_0: cpu@0 {
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z0>;
+			operating-points-v2 = <&cluster01_opp>;
 		};
 
 		a55_1: cpu@100 {
@@ -76,6 +131,7 @@ a55_1: cpu@100 {
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z0>;
+			operating-points-v2 = <&cluster01_opp>;
 		};
 
 		a55_2: cpu@10000 {
@@ -87,6 +143,7 @@ a55_2: cpu@10000 {
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z0>;
+			operating-points-v2 = <&cluster01_opp>;
 		};
 
 		a55_3: cpu@10100 {
@@ -98,6 +155,7 @@ a55_3: cpu@10100 {
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z0>;
+			operating-points-v2 = <&cluster01_opp>;
 		};
 
 		a55_4: cpu@20000 {
@@ -109,6 +167,7 @@ a55_4: cpu@20000 {
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z1>;
+			operating-points-v2 = <&cluster23_opp>;
 		};
 
 		a55_5: cpu@20100 {
@@ -120,6 +179,7 @@ a55_5: cpu@20100 {
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z1>;
+			operating-points-v2 = <&cluster23_opp>;
 		};
 
 		a55_6: cpu@30000 {
@@ -131,6 +191,7 @@ a55_6: cpu@30000 {
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z1>;
+			operating-points-v2 = <&cluster23_opp>;
 		};
 
 		a55_7: cpu@30100 {
@@ -142,6 +203,7 @@ a55_7: cpu@30100 {
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z1>;
+			operating-points-v2 = <&cluster23_opp>;
 		};
 
 		L3_CA55_0: cache-controller-0 {
-- 
2.25.1

