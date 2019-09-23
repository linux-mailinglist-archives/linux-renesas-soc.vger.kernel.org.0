Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6578EBB75D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Sep 2019 16:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbfIWO5w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Sep 2019 10:57:52 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:38012 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726902AbfIWO5w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 10:57:52 -0400
X-IronPort-AV: E=Sophos;i="5.64,540,1559487600"; 
   d="scan'208";a="27260559"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Sep 2019 23:57:50 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1E5A54006196;
        Mon, 23 Sep 2019 23:57:47 +0900 (JST)
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
Subject: [PATCH 4/4] arm64: dts: renesas: r8a774b1: Add TMU device nodes
Date:   Mon, 23 Sep 2019 15:57:28 +0100
Message-Id: <1569250648-33857-5-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569250648-33857-1-git-send-email-biju.das@bp.renesas.com>
References: <1569250648-33857-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds TMU[01234] device tree nodes to the
r8a774b1 SoC specific DT.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 65 +++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index c99672f..ed4a57f 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -385,6 +385,71 @@
 			#thermal-sensor-cells = <1>;
 		};
 
+		tmu0: timer@e61e0000 {
+			compatible = "renesas,tmu-r8a774b1", "renesas,tmu";
+			reg = <0 0xe61e0000 0 0x30>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 125>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 125>;
+			status = "disabled";
+		};
+
+		tmu1: timer@e6fc0000 {
+			compatible = "renesas,tmu-r8a774b1", "renesas,tmu";
+			reg = <0 0xe6fc0000 0 0x30>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 124>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 124>;
+			status = "disabled";
+		};
+
+		tmu2: timer@e6fd0000 {
+			compatible = "renesas,tmu-r8a774b1", "renesas,tmu";
+			reg = <0 0xe6fd0000 0 0x30>;
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 123>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 123>;
+			status = "disabled";
+		};
+
+		tmu3: timer@e6fe0000 {
+			compatible = "renesas,tmu-r8a774b1", "renesas,tmu";
+			reg = <0 0xe6fe0000 0 0x30>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 122>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 122>;
+			status = "disabled";
+		};
+
+		tmu4: timer@ffc00000 {
+			compatible = "renesas,tmu-r8a774b1", "renesas,tmu";
+			reg = <0 0xffc00000 0 0x30>;
+			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 121>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 121>;
+			status = "disabled";
+		};
+
 		i2c4: i2c@e66d8000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.7.4

