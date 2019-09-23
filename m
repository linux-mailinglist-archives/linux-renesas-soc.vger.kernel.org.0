Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAC54BB622
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Sep 2019 16:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730891AbfIWOEI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Sep 2019 10:04:08 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:8821 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730870AbfIWOEI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 10:04:08 -0400
X-IronPort-AV: E=Sophos;i="5.64,540,1559487600"; 
   d="scan'208";a="27258795"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Sep 2019 23:04:06 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9B48440078B1;
        Mon, 23 Sep 2019 23:04:04 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 3/5] arm64: dts: renesas: r8a774b1: Add GPIO device nodes
Date:   Mon, 23 Sep 2019 15:03:44 +0100
Message-Id: <1569247426-28215-4-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569247426-28215-1-git-send-email-biju.das@bp.renesas.com>
References: <1569247426-28215-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add GPIO device nodes to the DT of the r8a774b1 SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 64 +++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index af1992c..789f1d8 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -132,75 +132,123 @@
 		};
 
 		gpio0: gpio@e6050000 {
+			compatible = "renesas,gpio-r8a774b1",
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6050000 0 0x50>;
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 0 16>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
-			/* placeholder */
+			clocks = <&cpg CPG_MOD 912>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 912>;
 		};
 
 		gpio1: gpio@e6051000 {
+			compatible = "renesas,gpio-r8a774b1",
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6051000 0 0x50>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 32 29>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
-			/* placeholder */
+			clocks = <&cpg CPG_MOD 911>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 911>;
 		};
 
 		gpio2: gpio@e6052000 {
+			compatible = "renesas,gpio-r8a774b1",
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6052000 0 0x50>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 64 15>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
-			/* placeholder */
+			clocks = <&cpg CPG_MOD 910>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 910>;
 		};
 
 		gpio3: gpio@e6053000 {
+			compatible = "renesas,gpio-r8a774b1",
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6053000 0 0x50>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 96 16>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
-			/* placeholder */
+			clocks = <&cpg CPG_MOD 909>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 909>;
 		};
 
 		gpio4: gpio@e6054000 {
+			compatible = "renesas,gpio-r8a774b1",
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6054000 0 0x50>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 128 18>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
-			/* placeholder */
+			clocks = <&cpg CPG_MOD 908>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 908>;
 		};
 
 		gpio5: gpio@e6055000 {
+			compatible = "renesas,gpio-r8a774b1",
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6055000 0 0x50>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 160 26>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
-			/* placeholder */
+			clocks = <&cpg CPG_MOD 907>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 907>;
 		};
 
 		gpio6: gpio@e6055400 {
+			compatible = "renesas,gpio-r8a774b1",
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6055400 0 0x50>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 192 32>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
-			/* placeholder */
+			clocks = <&cpg CPG_MOD 906>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 906>;
 		};
 
 		gpio7: gpio@e6055800 {
+			compatible = "renesas,gpio-r8a774b1",
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6055800 0 0x50>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pfc 0 224 4>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
-			/* placeholder */
+			clocks = <&cpg CPG_MOD 905>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 905>;
 		};
 
 		pfc: pin-controller@e6060000 {
-- 
2.7.4

