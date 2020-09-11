Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDD4265F54
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 14:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbgIKMNv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 08:13:51 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:1998 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725824AbgIKMNs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 08:13:48 -0400
X-IronPort-AV: E=Sophos;i="5.76,415,1592838000"; 
   d="scan'208";a="56821913"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Sep 2020 21:13:14 +0900
Received: from devel.example.org?044ree.adwin.renesas.com (unknown [10.226.36.120])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 11F9A4260FB3;
        Fri, 11 Sep 2020 21:13:11 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] arm64: dts: renesas: r8a77990: Add DRIF support
Date:   Fri, 11 Sep 2020 13:12:59 +0100
Message-Id: <20200911121259.5669-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the DRIF controller nodes for the r8a77990 (a.k.a. R-Car E3).

Please note that R-Car E3 has register BITCTR located at offset
0x80 (this register is not available on the r8a77960 and r8a77951,
whose support has already been upstreamed), and even though it is
not dealt with just yet within the driver, we have to keep that
into account with our device tree nodes.

Also, please note that while testing it has emerged that the
HW User Manual has the wrong DMA details for DRIF2 and DRIF3
on E3, as they are only allowed SYS-DMAC0 rather than SYS-DMAC1
and SYS-DMAC2. An errata addressing this issue will be available
soon.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 120 ++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 1991bdc36792..caeddc2c1a70 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1288,6 +1288,126 @@ vin5csi40: endpoint@2 {
 			};
 		};
 
+		drif00: rif@e6f40000 {
+			compatible = "renesas,r8a77990-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f40000 0 0x84>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 515>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x20>, <&dmac2 0x20>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 515>;
+			renesas,bonding = <&drif01>;
+			status = "disabled";
+		};
+
+		drif01: rif@e6f50000 {
+			compatible = "renesas,r8a77990-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f50000 0 0x84>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 514>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x22>, <&dmac2 0x22>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 514>;
+			renesas,bonding = <&drif00>;
+			status = "disabled";
+		};
+
+		drif10: rif@e6f60000 {
+			compatible = "renesas,r8a77990-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f60000 0 0x84>;
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 513>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x24>, <&dmac2 0x24>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 513>;
+			renesas,bonding = <&drif11>;
+			status = "disabled";
+		};
+
+		drif11: rif@e6f70000 {
+			compatible = "renesas,r8a77990-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f70000 0 0x84>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 512>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x26>, <&dmac2 0x26>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 512>;
+			renesas,bonding = <&drif10>;
+			status = "disabled";
+		};
+
+		drif20: rif@e6f80000 {
+			compatible = "renesas,r8a77990-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f80000 0 0x84>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 511>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x28>;
+			dma-names = "rx";
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 511>;
+			renesas,bonding = <&drif21>;
+			status = "disabled";
+		};
+
+		drif21: rif@e6f90000 {
+			compatible = "renesas,r8a77990-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f90000 0 0x84>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 510>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x2a>;
+			dma-names = "rx";
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 510>;
+			renesas,bonding = <&drif20>;
+			status = "disabled";
+		};
+
+		drif30: rif@e6fa0000 {
+			compatible = "renesas,r8a77990-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6fa0000 0 0x84>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 509>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x2c>;
+			dma-names = "rx";
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 509>;
+			renesas,bonding = <&drif31>;
+			status = "disabled";
+		};
+
+		drif31: rif@e6fb0000 {
+			compatible = "renesas,r8a77990-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6fb0000 0 0x84>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 508>;
+			clock-names = "fck";
+			dmas = <&dmac0 0x2e>;
+			dma-names = "rx";
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 508>;
+			renesas,bonding = <&drif30>;
+			status = "disabled";
+		};
+
 		rcar_sound: sound@ec500000 {
 			/*
 			 * #sound-dai-cells is required
-- 
2.25.1

