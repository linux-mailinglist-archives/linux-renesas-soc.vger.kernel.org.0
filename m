Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D78AA294E0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Oct 2020 15:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443125AbgJUNxz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Oct 2020 09:53:55 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58531 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2443119AbgJUNxz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Oct 2020 09:53:55 -0400
X-IronPort-AV: E=Sophos;i="5.77,401,1596466800"; 
   d="scan'208";a="60194911"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Oct 2020 22:53:53 +0900
Received: from devel.example.org?044ree.adwin.renesas.com (unknown [10.226.36.120])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1457D429809D;
        Wed, 21 Oct 2020 22:53:50 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5 5/5] arm64: dts: r8a77965: Add DRIF support
Date:   Wed, 21 Oct 2020 14:53:32 +0100
Message-Id: <20201021135332.4928-6-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201021135332.4928-1-fabrizio.castro.jz@renesas.com>
References: <20201021135332.4928-1-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the DRIF controller nodes for r8a77965 (a.k.a. R-Car M3-N).

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
* No change
v3->v4:
* No change
v2->v3:
* New patch

 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 120 ++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index c355460e5f7f..d098eb3ec73a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1550,6 +1550,126 @@ vin7csi40: endpoint@2 {
 			};
 		};
 
+		drif00: rif@e6f40000 {
+			compatible = "renesas,r8a77965-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f40000 0 0x84>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 515>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x20>, <&dmac2 0x20>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 515>;
+			renesas,bonding = <&drif01>;
+			status = "disabled";
+		};
+
+		drif01: rif@e6f50000 {
+			compatible = "renesas,r8a77965-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f50000 0 0x84>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 514>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x22>, <&dmac2 0x22>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 514>;
+			renesas,bonding = <&drif00>;
+			status = "disabled";
+		};
+
+		drif10: rif@e6f60000 {
+			compatible = "renesas,r8a77965-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f60000 0 0x84>;
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 513>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x24>, <&dmac2 0x24>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 513>;
+			renesas,bonding = <&drif11>;
+			status = "disabled";
+		};
+
+		drif11: rif@e6f70000 {
+			compatible = "renesas,r8a77965-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f70000 0 0x84>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 512>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x26>, <&dmac2 0x26>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 512>;
+			renesas,bonding = <&drif10>;
+			status = "disabled";
+		};
+
+		drif20: rif@e6f80000 {
+			compatible = "renesas,r8a77965-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f80000 0 0x84>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 511>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x28>, <&dmac2 0x28>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 511>;
+			renesas,bonding = <&drif21>;
+			status = "disabled";
+		};
+
+		drif21: rif@e6f90000 {
+			compatible = "renesas,r8a77965-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6f90000 0 0x84>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 510>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x2a>, <&dmac2 0x2a>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 510>;
+			renesas,bonding = <&drif20>;
+			status = "disabled";
+		};
+
+		drif30: rif@e6fa0000 {
+			compatible = "renesas,r8a77965-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6fa0000 0 0x84>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 509>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x2c>, <&dmac2 0x2c>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 509>;
+			renesas,bonding = <&drif31>;
+			status = "disabled";
+		};
+
+		drif31: rif@e6fb0000 {
+			compatible = "renesas,r8a77965-drif",
+				     "renesas,rcar-gen3-drif";
+			reg = <0 0xe6fb0000 0 0x84>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 508>;
+			clock-names = "fck";
+			dmas = <&dmac1 0x2e>, <&dmac2 0x2e>;
+			dma-names = "rx", "rx";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
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

