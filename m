Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8DCF627E92
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 13:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237309AbiKNMtM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 07:49:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237317AbiKNMtL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 07:49:11 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA4D3AB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 04:49:10 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:9cda:b28b:1ded:8138])
        by laurent.telenet-ops.be with bizsmtp
        id kCp62800V3NlhLw01Cp6VX; Mon, 14 Nov 2022 13:49:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ouYte-000UUE-Af; Mon, 14 Nov 2022 13:49:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ouYtd-003gzS-4D; Mon, 14 Nov 2022 13:49:05 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] arm64: dts: renesas: r8a779g0: Add CA76 operating points
Date:   Mon, 14 Nov 2022 13:49:04 +0100
Message-Id: <8afb32f5dc123ebf2b941703483152ff0992191d.1668429870.git.geert+renesas@glider.be>
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

Add operating points for running the Cortex-A76 CPU cores on R-Car V4H
at various speeds, up to the Normal (1.7 GHz) performance mode.

Based on a patch in the BSP by Tho Vu.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
An operating point for the High Performance mode (1.8 GHz) is not added,
as it is not yet supported by the clock driver, and thus was not tested.
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 31 +++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 9cbe337220ed4dfc..45d8d927ad2642f3 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -14,6 +14,33 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	cluster0_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <825000>;
+			clock-latency-ns = <500000>;
+		};
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <825000>;
+			clock-latency-ns = <500000>;
+		};
+		opp-1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <825000>;
+			clock-latency-ns = <500000>;
+		};
+		opp-1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <825000>;
+			clock-latency-ns = <500000>;
+			opp-suspend;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -47,6 +74,7 @@ a76_0: cpu@0 {
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		a76_1: cpu@100 {
@@ -58,6 +86,7 @@ a76_1: cpu@100 {
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		a76_2: cpu@10000 {
@@ -69,6 +98,7 @@ a76_2: cpu@10000 {
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		a76_3: cpu@10100 {
@@ -80,6 +110,7 @@ a76_3: cpu@10100 {
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		idle-states {
-- 
2.25.1

