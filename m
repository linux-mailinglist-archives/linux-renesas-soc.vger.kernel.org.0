Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E459D4E313
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbfFUJRC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:17:02 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34780 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJRC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:17:02 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id AFBF425BE64;
        Fri, 21 Jun 2019 19:16:37 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 46B889430DA; Fri, 21 Jun 2019 11:16:34 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 28/53] arm64: dts: renesas: r8a774a1: Add operating points
Date:   Fri, 21 Jun 2019 11:16:06 +0200
Message-Id: <800037e815b91d8c9ad67906d18129e79a2cfcba.1561107232.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561107232.git.horms+renesas@verge.net.au>
References: <cover.1561107232.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

The RZ/G2M (a.k.a. r8a774a1) comes with two clusters of
processors, similarly to the r8a7796.
The first cluster is made of A57s, the second cluster is
made of A53s.

The operating points for the cluster with the A57s are:

 Frequency | Voltage
-----------|---------
 500 MHz   | 0.82V
 1.0 GHz   | 0.82V
 1.5 GHz   | 0.82V

The operating points for the cluster with the A53s are:

 Frequency | Voltage
-----------|---------
 800 MHz   | 0.82V
 1.0 GHz   | 0.82V
 1.2 GHz   | 0.82V

This patch adds the definitions for the operating points
to the SoC specific DT.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 48 +++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index c2d99f5aaf74..4b1332feaae5 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -56,6 +56,48 @@
 		clock-frequency = <0>;
 	};
 
+	cluster0_opp: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+	};
+
+	cluster1_opp: opp_table1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -68,6 +110,7 @@
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		a57_1: cpu@1 {
@@ -78,6 +121,7 @@
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		a53_0: cpu@100 {
@@ -88,6 +132,7 @@
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z2>;
+			operating-points-v2 = <&cluster1_opp>;
 		};
 
 		a53_1: cpu@101 {
@@ -98,6 +143,7 @@
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z2>;
+			operating-points-v2 = <&cluster1_opp>;
 		};
 
 		a53_2: cpu@102 {
@@ -108,6 +154,7 @@
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z2>;
+			operating-points-v2 = <&cluster1_opp>;
 		};
 
 		a53_3: cpu@103 {
@@ -118,6 +165,7 @@
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z2>;
+			operating-points-v2 = <&cluster1_opp>;
 		};
 
 		L2_CA57: cache-controller-0 {
-- 
2.11.0

