Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD3FBC407
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2019 10:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436710AbfIXIXP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Sep 2019 04:23:15 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:20798 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2436668AbfIXIXP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Sep 2019 04:23:15 -0400
X-IronPort-AV: E=Sophos;i="5.64,543,1559487600"; 
   d="scan'208";a="27342098"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Sep 2019 17:23:13 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4C59C400B9EE;
        Tue, 24 Sep 2019 17:23:11 +0900 (JST)
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
Subject: [PATCH 2/7] arm64: dts: renesas: r8a774b1: Add I2C and IIC-DVFS support
Date:   Tue, 24 Sep 2019 09:22:50 +0100
Message-Id: <1569313375-53428-3-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569313375-53428-1-git-send-email-biju.das@bp.renesas.com>
References: <1569313375-53428-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the I2C[0-6] and IIC Bus Interface for DVFS (IIC for DVFS)
devices nodes to the r8a774b1 device tree.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 126 +++++++++++++++++++++++++++++-
 1 file changed, 125 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 532c9ca..fde845a 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -450,11 +450,135 @@
 			status = "disabled";
 		};
 
+		i2c0: i2c@e6500000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a774b1",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe6500000 0 0x40>;
+			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 931>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 931>;
+			dmas = <&dmac1 0x91>, <&dmac1 0x90>,
+			       <&dmac2 0x91>, <&dmac2 0x90>;
+			dma-names = "tx", "rx", "tx", "rx";
+			i2c-scl-internal-delay-ns = <110>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@e6508000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a774b1",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe6508000 0 0x40>;
+			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 930>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 930>;
+			dmas = <&dmac1 0x93>, <&dmac1 0x92>,
+			       <&dmac2 0x93>, <&dmac2 0x92>;
+			dma-names = "tx", "rx", "tx", "rx";
+			i2c-scl-internal-delay-ns = <6>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@e6510000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a774b1",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe6510000 0 0x40>;
+			interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 929>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 929>;
+			dmas = <&dmac1 0x95>, <&dmac1 0x94>,
+			       <&dmac2 0x95>, <&dmac2 0x94>;
+			dma-names = "tx", "rx", "tx", "rx";
+			i2c-scl-internal-delay-ns = <6>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@e66d0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a774b1",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe66d0000 0 0x40>;
+			interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 928>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 928>;
+			dmas = <&dmac0 0x97>, <&dmac0 0x96>;
+			dma-names = "tx", "rx";
+			i2c-scl-internal-delay-ns = <110>;
+			status = "disabled";
+		};
+
 		i2c4: i2c@e66d8000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a774b1",
+				     "renesas,rcar-gen3-i2c";
 			reg = <0 0xe66d8000 0 0x40>;
-			/* placeholder */
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 927>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 927>;
+			dmas = <&dmac0 0x99>, <&dmac0 0x98>;
+			dma-names = "tx", "rx";
+			i2c-scl-internal-delay-ns = <110>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@e66e0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a774b1",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe66e0000 0 0x40>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 919>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 919>;
+			dmas = <&dmac0 0x9b>, <&dmac0 0x9a>;
+			dma-names = "tx", "rx";
+			i2c-scl-internal-delay-ns = <110>;
+			status = "disabled";
+		};
+
+		i2c6: i2c@e66e8000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a774b1",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe66e8000 0 0x40>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 918>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 918>;
+			dmas = <&dmac0 0x9d>, <&dmac0 0x9c>;
+			dma-names = "tx", "rx";
+			i2c-scl-internal-delay-ns = <6>;
+			status = "disabled";
+		};
+
+		i2c_dvfs: i2c@e60b0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,iic-r8a774b1",
+				     "renesas,rcar-gen3-iic",
+				     "renesas,rmobile-iic";
+			reg = <0 0xe60b0000 0 0x425>;
+			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 926>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 926>;
+			dmas = <&dmac0 0x11>, <&dmac0 0x10>;
+			dma-names = "tx", "rx";
+			status = "disabled";
 		};
 
 		hscif0: serial@e6540000 {
-- 
2.7.4

