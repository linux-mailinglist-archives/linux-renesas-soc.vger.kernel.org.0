Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA05B45A50F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 15:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233815AbhKWORi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 09:17:38 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:53210 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237711AbhKWORg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 09:17:36 -0500
X-IronPort-AV: E=Sophos;i="5.87,257,1631545200"; 
   d="scan'208";a="101515728"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Nov 2021 23:14:28 +0900
Received: from localhost.localdomain (unknown [10.226.93.159])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 523E4400C45E;
        Tue, 23 Nov 2021 23:14:26 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Add WDT nodes
Date:   Tue, 23 Nov 2021 14:14:19 +0000
Message-Id: <20211123141420.23529-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123141420.23529-1-biju.das.jz@bp.renesas.com>
References: <20211123141420.23529-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add WDT{0, 1, 2} nodes to RZ/G2L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 97d52afd9014..f39265e51445 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -833,6 +833,51 @@
 			status = "disabled";
 		};
 
+		wdt0: watchdog@12800800 {
+			compatible = "renesas,r9a07g044-wdt",
+				     "renesas,rzg2l-wdt";
+			reg = <0 0x12800800 0 0x400>;
+			clocks = <&cpg CPG_MOD R9A07G044_WDT0_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_WDT0_CLK>;
+			clock-names = "pclk", "oscclk";
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "wdt", "perrout";
+			resets = <&cpg R9A07G044_WDT0_PRESETN>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt1: watchdog@12800c00 {
+			compatible = "renesas,r9a07g044-wdt",
+				     "renesas,rzg2l-wdt";
+			reg = <0 0x12800C00 0 0x400>;
+			clocks = <&cpg CPG_MOD R9A07G044_WDT1_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_WDT1_CLK>;
+			clock-names = "pclk", "oscclk";
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "wdt", "perrout";
+			resets = <&cpg R9A07G044_WDT1_PRESETN>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt2: watchdog@12800400 {
+			compatible = "renesas,r9a07g044-wdt",
+				     "renesas,rzg2l-wdt";
+			reg = <0 0x12800400 0 0x400>;
+			clocks = <&cpg CPG_MOD R9A07G044_WDT2_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_WDT2_CLK>;
+			clock-names = "pclk", "oscclk";
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "wdt", "perrout";
+			resets = <&cpg R9A07G044_WDT2_PRESETN>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		ostm0: timer@12801000 {
 			compatible = "renesas,r9a07g044-ostm",
 				     "renesas,ostm";
-- 
2.17.1

