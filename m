Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B84F53B4DA7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Jun 2021 10:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbhFZIQi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Jun 2021 04:16:38 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:22217 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229630AbhFZIQh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Jun 2021 04:16:37 -0400
X-IronPort-AV: E=Sophos;i="5.83,301,1616425200"; 
   d="scan'208";a="85587094"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jun 2021 17:14:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.16])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CD46C400389B;
        Sat, 26 Jun 2021 17:14:12 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 10/10] arm64: dts: renesas: r9a07g044: Add I2C nodes
Date:   Sat, 26 Jun 2021 09:13:44 +0100
Message-Id: <20210626081344.5783-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210626081344.5783-1-biju.das.jz@bp.renesas.com>
References: <20210626081344.5783-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add I2C{0,1,2,3} nodes to RZ/G2L (R9A07G044) SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
 * No change.
v2->v3:
 * Added Geert's Rb tab
 * Fixes extra space in interrupt property
v1->v2:
 * Updated reset entries.
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 01482d227506..9a7489dc70d1 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -89,6 +89,86 @@
 			status = "disabled";
 		};
 
+		i2c0: i2c@10058000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,riic-r9a07g044", "renesas,riic-rz";
+			reg = <0 0x10058000 0 0x400>;
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 348 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 349 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_I2C0_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A07G044_I2C0_MRST>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@10058400 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,riic-r9a07g044", "renesas,riic-rz";
+			reg = <0 0x10058400 0 0x400>;
+			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 356 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 357 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_I2C1_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A07G044_I2C1_MRST>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@10058800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,riic-r9a07g044", "renesas,riic-rz";
+			reg = <0 0x10058800 0 0x400>;
+			interrupts = <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 364 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 365 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_I2C2_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A07G044_I2C2_MRST>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@10058c00 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,riic-r9a07g044", "renesas,riic-rz";
+			reg = <0 0x10058c00 0 0x400>;
+			interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 372 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 373 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_I2C3_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A07G044_I2C3_MRST>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a07g044-cpg";
 			reg = <0 0x11010000 0 0x10000>;
-- 
2.17.1

