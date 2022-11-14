Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25788627E94
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 13:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237319AbiKNMtO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 07:49:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237324AbiKNMtM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 07:49:12 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34486C33
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 04:49:11 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:9cda:b28b:1ded:8138])
        by albert.telenet-ops.be with bizsmtp
        id kCp6280063NlhLw06Cp6XX; Mon, 14 Nov 2022 13:49:09 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ouYtd-000UUB-MN; Mon, 14 Nov 2022 13:49:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ouYtd-003gz6-0p; Mon, 14 Nov 2022 13:49:05 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/5] arm64: dts: renesas: r8a779g0: Add secondary CA76 CPU cores
Date:   Mon, 14 Nov 2022 13:49:01 +0100
Message-Id: <ccb55458bd87f8ba70d28c61bcc254f22184824c.1668429870.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668429870.git.geert+renesas@glider.be>
References: <cover.1668429870.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Complete the description of the Cortex-A76 CPU cores and L3 cache
controllers on the Renesas R-Car V4H (R8A779G0) SoC, including CPU
topology and PSCI support for enabling CPU cores.

R-Car V4H has 4 Cortex-A76 cores, grouped in 2 clusters.

Based on a patch in the BSP by Takeshi Kihara.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Move device_type and enable-method properties,
  - Fix PSCI compatible value for PSCI v1.0,
  - Drop "arm,armv8" compatible values.
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 70 +++++++++++++++++++++--
 1 file changed, 65 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index ef75e2603f5ac9d9..dc5f27c114a7ad96 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -18,12 +18,60 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&a76_0>;
+				};
+				core1 {
+					cpu = <&a76_1>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&a76_2>;
+				};
+				core1 {
+					cpu = <&a76_3>;
+				};
+			};
+		};
+
 		a76_0: cpu@0 {
 			compatible = "arm,cortex-a76";
 			reg = <0>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A779G0_PD_A1E0D0C0>;
 			next-level-cache = <&L3_CA76_0>;
+			enable-method = "psci";
+		};
+
+		a76_1: cpu@100 {
+			compatible = "arm,cortex-a76";
+			reg = <0x100>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A779G0_PD_A1E0D0C1>;
+			next-level-cache = <&L3_CA76_0>;
+			enable-method = "psci";
+		};
+
+		a76_2: cpu@10000 {
+			compatible = "arm,cortex-a76";
+			reg = <0x10000>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A779G0_PD_A1E0D1C0>;
+			next-level-cache = <&L3_CA76_1>;
+			enable-method = "psci";
+		};
+
+		a76_3: cpu@10100 {
+			compatible = "arm,cortex-a76";
+			reg = <0x10100>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A779G0_PD_A1E0D1C1>;
+			next-level-cache = <&L3_CA76_1>;
+			enable-method = "psci";
 		};
 
 		L3_CA76_0: cache-controller-0 {
@@ -32,6 +80,18 @@ L3_CA76_0: cache-controller-0 {
 			cache-unified;
 			cache-level = <3>;
 		};
+
+		L3_CA76_1: cache-controller-1 {
+			compatible = "cache";
+			power-domains = <&sysc R8A779G0_PD_A2E0D1>;
+			cache-unified;
+			cache-level = <3>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
 	};
 
 	extal_clk: extal {
@@ -1088,7 +1148,7 @@ gic: interrupt-controller@f1000000 {
 			reg = <0x0 0xf1000000 0 0x20000>,
 			      <0x0 0xf1060000 0 0x110000>;
 			interrupts = <GIC_PPI 9
-				      (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
+				      (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
 		prr: chipid@fff00044 {
@@ -1099,9 +1159,9 @@ prr: chipid@fff00044 {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 };
-- 
2.25.1

