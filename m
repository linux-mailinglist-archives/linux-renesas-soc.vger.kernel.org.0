Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF08FBC405
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2019 10:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436699AbfIXIXN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Sep 2019 04:23:13 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:20798 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2436660AbfIXIXN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Sep 2019 04:23:13 -0400
X-IronPort-AV: E=Sophos;i="5.64,543,1559487600"; 
   d="scan'208";a="27342088"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Sep 2019 17:23:10 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id AA38A400B9EE;
        Tue, 24 Sep 2019 17:23:08 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 1/7] arm64: dts: renesas: r8a774b1: Add SDHI support
Date:   Tue, 24 Sep 2019 09:22:49 +0100
Message-Id: <1569313375-53428-2-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569313375-53428-1-git-send-email-biju.das@bp.renesas.com>
References: <1569313375-53428-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SDHI support for the r8a774b1 SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 36 +++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index ed4a57f..532c9ca 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -880,23 +880,51 @@
 		};
 
 		sdhi0: sd@ee100000 {
+			compatible = "renesas,sdhi-r8a774b1",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 314>;
+			max-frequency = <200000000>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 314>;
+			status = "disabled";
 		};
 
 		sdhi1: sd@ee120000 {
+			compatible = "renesas,sdhi-r8a774b1",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 313>;
+			max-frequency = <200000000>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 313>;
+			status = "disabled";
 		};
 
 		sdhi2: sd@ee140000 {
+			compatible = "renesas,sdhi-r8a774b1",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 312>;
+			max-frequency = <200000000>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 312>;
+			status = "disabled";
 		};
 
 		sdhi3: sd@ee160000 {
+			compatible = "renesas,sdhi-r8a774b1",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 311>;
+			max-frequency = <200000000>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 311>;
+			status = "disabled";
 		};
 
 		gic: interrupt-controller@f1010000 {
-- 
2.7.4

