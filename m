Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA72E4E327
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfFUJRY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:17:24 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34780 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJRY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:17:24 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5F00A25BEAF;
        Fri, 21 Jun 2019 19:16:39 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C8ACD943521; Fri, 21 Jun 2019 11:16:35 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 48/53] arm64: dts: renesas: r8a774a1: Add CPU capacity-dmips-mhz
Date:   Fri, 21 Jun 2019 11:16:26 +0200
Message-Id: <5f5249497bd7ed65d90cac36c3c3dabcda2903dd.1561107232.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561107232.git.horms+renesas@verge.net.au>
References: <cover.1561107232.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

Set the capacity-dmips-mhz for RZ/G2M(r8a774a1) SoC, that is based on
dhrystone.

Based on work done by Gaku Inami <gaku.inami.xw@bp.renesas.com> for
r8a7796 SoC.

The average dhrystone result for 5 iterations is as below:

r8a774a1 SoC (CA57x2 + CA53x4)
  CPU   max-freq   dhrystone
  ---------------------------------
  CA57   1500 MHz  11428571 lps/s
  CA53   1200 MHz   5000000 lps/s

From this, CPU capacity-dmips-mhz for CA57 and CA53 are calculated
as follows:

r8a774a1 SoC
  CA57 : 1024 / (11428571 / 1500) * (11428571 / 1500) = 1024
  CA53 : 1024 / (11428571 / 1500) * ( 5000000 / 1200) =  560

Since each CPUs have different max frequencies, the final CPU
capacities of A53 scaled by the above difference is as below

$ cat /sys/devices/system/cpu/cpu*/cpu_capacity
1024
1024
448
448
448
448

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index b06d7149e5fa..21fb7919d3bb 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -137,6 +137,7 @@
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
+			capacity-dmips-mhz = <1024>;
 		};
 
 		a57_1: cpu@1 {
@@ -148,6 +149,7 @@
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
+			capacity-dmips-mhz = <1024>;
 		};
 
 		a53_0: cpu@100 {
@@ -159,6 +161,7 @@
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <560>;
 		};
 
 		a53_1: cpu@101 {
@@ -170,6 +173,7 @@
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <560>;
 		};
 
 		a53_2: cpu@102 {
@@ -181,6 +185,7 @@
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <560>;
 		};
 
 		a53_3: cpu@103 {
@@ -192,6 +197,7 @@
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R8A774A1_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <560>;
 		};
 
 		L2_CA57: cache-controller-0 {
-- 
2.11.0

