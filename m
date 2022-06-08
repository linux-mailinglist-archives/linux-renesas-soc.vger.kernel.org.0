Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 975675437A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 17:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244488AbiFHPkd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 11:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244140AbiFHPkb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 11:40:31 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EFEA1CC5EA
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 08:40:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:243a:e14b:d107:1f56])
        by xavier.telenet-ops.be with bizsmtp
        id gfgR270071qF9lr01fgRmT; Wed, 08 Jun 2022 17:40:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyxnE-003E0C-Nu; Wed, 08 Jun 2022 17:40:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyxnE-008kJa-60; Wed, 08 Jun 2022 17:40:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] arm64: dts: renesas: r8a779f0: Add secondary CA55 CPU cores
Date:   Wed,  8 Jun 2022 17:40:20 +0200
Message-Id: <d6af5975090d5830cb053b52400439bd1cbe8fc7.1654701480.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654701480.git.geert+renesas@glider.be>
References: <cover.1654701480.git.geert+renesas@glider.be>
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

Complete the description of the Cortex-A55 CPU cores and L3 cache
controllers on the Renesas R-Car S4-8 (R8A779F0) SoC, including CPU
topology and PSCI support for enabling CPU cores.

R-Car S4-8 has 8 Cortex-A55 cores, grouped in 4 clusters.

Based on patches in the BSP by Takeshi Kihara.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 138 +++++++++++++++++++++-
 1 file changed, 133 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 41aa23e557179af8..197e452c8623dffb 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -18,12 +18,114 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&a55_0>;
+				};
+				core1 {
+					cpu = <&a55_1>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&a55_2>;
+				};
+				core1 {
+					cpu = <&a55_3>;
+				};
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&a55_4>;
+				};
+				core1 {
+					cpu = <&a55_5>;
+				};
+			};
+
+			cluster3 {
+				core0 {
+					cpu = <&a55_6>;
+				};
+				core1 {
+					cpu = <&a55_7>;
+				};
+			};
+		};
+
 		a55_0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A779F0_PD_A1E0D0C0>;
 			next-level-cache = <&L3_CA55_0>;
+			enable-method = "psci";
+		};
+
+		a55_1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A779F0_PD_A1E0D0C1>;
+			next-level-cache = <&L3_CA55_0>;
+			enable-method = "psci";
+		};
+
+		a55_2: cpu@10000 {
+			compatible = "arm,cortex-a55";
+			reg = <0x10000>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A779F0_PD_A1E0D1C0>;
+			next-level-cache = <&L3_CA55_1>;
+			enable-method = "psci";
+		};
+
+		a55_3: cpu@10100 {
+			compatible = "arm,cortex-a55";
+			reg = <0x10100>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A779F0_PD_A1E0D1C1>;
+			next-level-cache = <&L3_CA55_1>;
+			enable-method = "psci";
+		};
+
+		a55_4: cpu@20000 {
+			compatible = "arm,cortex-a55";
+			reg = <0x20000>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A779F0_PD_A1E1D0C0>;
+			next-level-cache = <&L3_CA55_2>;
+			enable-method = "psci";
+		};
+
+		a55_5: cpu@20100 {
+			compatible = "arm,cortex-a55";
+			reg = <0x20100>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A779F0_PD_A1E1D0C1>;
+			next-level-cache = <&L3_CA55_2>;
+			enable-method = "psci";
+		};
+
+		a55_6: cpu@30000 {
+			compatible = "arm,cortex-a55";
+			reg = <0x30000>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A779F0_PD_A1E1D1C0>;
+			next-level-cache = <&L3_CA55_3>;
+			enable-method = "psci";
+		};
+
+		a55_7: cpu@30100 {
+			compatible = "arm,cortex-a55";
+			reg = <0x30100>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A779F0_PD_A1E1D1C1>;
+			next-level-cache = <&L3_CA55_3>;
+			enable-method = "psci";
 		};
 
 		L3_CA55_0: cache-controller-0 {
@@ -32,6 +134,27 @@ L3_CA55_0: cache-controller-0 {
 			cache-unified;
 			cache-level = <3>;
 		};
+
+		L3_CA55_1: cache-controller-1 {
+			compatible = "cache";
+			power-domains = <&sysc R8A779F0_PD_A2E0D1>;
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA55_2: cache-controller-2 {
+			compatible = "cache";
+			power-domains = <&sysc R8A779F0_PD_A2E1D0>;
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA55_3: cache-controller-3 {
+			compatible = "cache";
+			power-domains = <&sysc R8A779F0_PD_A2E1D1>;
+			cache-unified;
+			cache-level = <3>;
+		};
 	};
 
 	extal_clk: extal {
@@ -53,6 +176,11 @@ pmu_a55 {
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
@@ -421,7 +549,7 @@ gic: interrupt-controller@f1000000 {
 			reg = <0x0 0xf1000000 0 0x20000>,
 			      <0x0 0xf1060000 0 0x110000>;
 			interrupts = <GIC_PPI 9
-				      (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
+				      (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
 		prr: chipid@fff00044 {
@@ -432,9 +560,9 @@ prr: chipid@fff00044 {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 };
-- 
2.25.1

