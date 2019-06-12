Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62AF2428D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 16:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437345AbfFLOZr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 10:25:47 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:57300 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2437334AbfFLOZq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 10:25:46 -0400
X-IronPort-AV: E=Sophos;i="5.62,366,1554735600"; 
   d="scan'208";a="18291143"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 12 Jun 2019 23:25:45 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C0A23400967E;
        Wed, 12 Jun 2019 23:25:42 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 2/4] arm64: dts: renesas: r8a774a1: Add CPU capacity-dmips-mhz
Date:   Wed, 12 Jun 2019 15:20:53 +0100
Message-Id: <1560349255-26336-3-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560349255-26336-1-git-send-email-biju.das@bp.renesas.com>
References: <1560349255-26336-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

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
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index e6ea5a1..603cfdb 100644
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
2.7.4

