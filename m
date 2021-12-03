Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7A44676CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Dec 2021 12:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380591AbhLCLzg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Dec 2021 06:55:36 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:36104 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231944AbhLCLzg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 06:55:36 -0500
X-IronPort-AV: E=Sophos;i="5.87,284,1631545200"; 
   d="scan'208";a="102706795"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2021 20:52:12 +0900
Received: from localhost.localdomain (unknown [10.226.93.66])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3F16440158E3;
        Fri,  3 Dec 2021 20:52:10 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/6] arm64: dts: renesas: r9a07g044: Add Mali-G31 GPU node
Date:   Fri,  3 Dec 2021 11:51:53 +0000
Message-Id: <20211203115154.31864-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211203115154.31864-1-biju.das.jz@bp.renesas.com>
References: <20211203115154.31864-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add Mali-G31 GPU node to SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 439870930fb3..908e7f044cb0 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -111,6 +111,50 @@
 		};
 	};
 
+	gpu_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <1100000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1100000>;
+		};
+
+		opp-250000000 {
+			opp-hz = /bits/ 64 <250000000>;
+			opp-microvolt = <1100000>;
+		};
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <1100000>;
+		};
+
+		opp-125000000 {
+			opp-hz = /bits/ 64 <125000000>;
+			opp-microvolt = <1100000>;
+		};
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <1100000>;
+		};
+
+		opp-62500000 {
+			opp-hz = /bits/ 64 <62500000>;
+			opp-microvolt = <1100000>;
+		};
+
+		opp-50000000 {
+			opp-hz = /bits/ 64 <50000000>;
+			opp-microvolt = <1100000>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0", "arm,psci-0.2";
 		method = "smc";
@@ -627,6 +671,26 @@
 			dma-channels = <16>;
 		};
 
+		gpu: gpu@11840000 {
+			compatible = "renesas,r9a07g044-mali",
+				     "arm,mali-bifrost";
+			reg = <0x0 0x11840000 0x0 0x10000>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu", "event";
+			clocks = <&cpg CPG_MOD R9A07G044_GPU_CLK>,
+				 <&cpg CPG_MOD R9A07G044_GPU_AXI_CLK>,
+				 <&cpg CPG_MOD R9A07G044_GPU_ACE_CLK>;
+			clock-names = "gpu", "bus", "bus_ace";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_GPU_RESETN>,
+				 <&cpg R9A07G044_GPU_AXI_RESETN>,
+				 <&cpg R9A07G044_GPU_ACE_RESETN>;
+			operating-points-v2 = <&gpu_opp_table>;
+		};
+
 		gic: interrupt-controller@11900000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.17.1

