Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64656CBD6B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2019 16:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388986AbfJDOhJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Oct 2019 10:37:09 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:39795 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389100AbfJDOhJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Oct 2019 10:37:09 -0400
X-IronPort-AV: E=Sophos;i="5.67,256,1566831600"; 
   d="scan'208";a="28306159"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Oct 2019 23:37:05 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CA759426DFB3;
        Fri,  4 Oct 2019 23:37:02 +0900 (JST)
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
Subject: [PATCH v2 2/2] arm64: dts: renesas: r8a774b1: Add Sound and Audio DMAC device nodes
Date:   Fri,  4 Oct 2019 15:36:35 +0100
Message-Id: <1570199795-49169-2-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570199795-49169-1-git-send-email-biju.das@bp.renesas.com>
References: <1570199795-49169-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Based on a similar patch of the R8A7796 device tree
by Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
 * Incorporated Morimoto-San's review comment
---
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 474 +++++++++++++++++++++++++++++-
 1 file changed, 464 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 0163b284..34c8823 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -1178,24 +1178,478 @@
 		};
 
 		rcar_sound: sound@ec500000 {
+			/*
+			 * #sound-dai-cells is required
+			 *
+			 * Single DAI : #sound-dai-cells = <0>;	<&rcar_sound>;
+			 * Multi  DAI : #sound-dai-cells = <1>;	<&rcar_sound N>;
+			 */
+			/*
+			 * #clock-cells is required for audio_clkout0/1/2/3
+			 *
+			 * clkout	: #clock-cells = <0>;	<&rcar_sound>;
+			 * clkout0/1/2/3: #clock-cells = <1>;	<&rcar_sound N>;
+			 */
+			compatible =  "renesas,rcar_sound-r8a774b1", "renesas,rcar_sound-gen3";
 			reg = <0 0xec500000 0 0x1000>, /* SCU */
 			      <0 0xec5a0000 0 0x100>,  /* ADG */
 			      <0 0xec540000 0 0x1000>, /* SSIU */
 			      <0 0xec541000 0 0x280>,  /* SSI */
 			      <0 0xec760000 0 0x200>;  /* Audio DMAC peri peri*/
+			reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
+
+			clocks = <&cpg CPG_MOD 1005>,
+				 <&cpg CPG_MOD 1006>, <&cpg CPG_MOD 1007>,
+				 <&cpg CPG_MOD 1008>, <&cpg CPG_MOD 1009>,
+				 <&cpg CPG_MOD 1010>, <&cpg CPG_MOD 1011>,
+				 <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1013>,
+				 <&cpg CPG_MOD 1014>, <&cpg CPG_MOD 1015>,
+				 <&cpg CPG_MOD 1022>, <&cpg CPG_MOD 1023>,
+				 <&cpg CPG_MOD 1024>, <&cpg CPG_MOD 1025>,
+				 <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>,
+				 <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
+				 <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
+				 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+				 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+				 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
+				 <&audio_clk_a>, <&audio_clk_b>,
+				 <&audio_clk_c>,
+				 <&cpg CPG_CORE R8A774B1_CLK_S0D4>;
+			clock-names = "ssi-all",
+				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
+				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
+				      "ssi.1", "ssi.0",
+				      "src.9", "src.8", "src.7", "src.6",
+				      "src.5", "src.4", "src.3", "src.2",
+				      "src.1", "src.0",
+				      "mix.1", "mix.0",
+				      "ctu.1", "ctu.0",
+				      "dvc.0", "dvc.1",
+				      "clk_a", "clk_b", "clk_c", "clk_i";
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 1005>,
+				 <&cpg 1006>, <&cpg 1007>,
+				 <&cpg 1008>, <&cpg 1009>,
+				 <&cpg 1010>, <&cpg 1011>,
+				 <&cpg 1012>, <&cpg 1013>,
+				 <&cpg 1014>, <&cpg 1015>;
+			reset-names = "ssi-all",
+				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
+				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
+				      "ssi.1", "ssi.0";
+			status = "disabled";
+
+			rcar_sound,ctu {
+				ctu00: ctu-0 { };
+				ctu01: ctu-1 { };
+				ctu02: ctu-2 { };
+				ctu03: ctu-3 { };
+				ctu10: ctu-4 { };
+				ctu11: ctu-5 { };
+				ctu12: ctu-6 { };
+				ctu13: ctu-7 { };
+			};
+
+			rcar_sound,dvc {
+				dvc0: dvc-0 {
+					dmas = <&audma1 0xbc>;
+					dma-names = "tx";
+				};
+				dvc1: dvc-1 {
+					dmas = <&audma1 0xbe>;
+					dma-names = "tx";
+				};
+			};
+
+			rcar_sound,mix {
+				mix0: mix-0 { };
+				mix1: mix-1 { };
+			};
+
+			rcar_sound,src {
+				src0: src-0 {
+					interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x85>, <&audma1 0x9a>;
+					dma-names = "rx", "tx";
+				};
+				src1: src-1 {
+					interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x87>, <&audma1 0x9c>;
+					dma-names = "rx", "tx";
+				};
+				src2: src-2 {
+					interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x89>, <&audma1 0x9e>;
+					dma-names = "rx", "tx";
+				};
+				src3: src-3 {
+					interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x8b>, <&audma1 0xa0>;
+					dma-names = "rx", "tx";
+				};
+				src4: src-4 {
+					interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x8d>, <&audma1 0xb0>;
+					dma-names = "rx", "tx";
+				};
+				src5: src-5 {
+					interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x8f>, <&audma1 0xb2>;
+					dma-names = "rx", "tx";
+				};
+				src6: src-6 {
+					interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x91>, <&audma1 0xb4>;
+					dma-names = "rx", "tx";
+				};
+				src7: src-7 {
+					interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x93>, <&audma1 0xb6>;
+					dma-names = "rx", "tx";
+				};
+				src8: src-8 {
+					interrupts = <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x95>, <&audma1 0xb8>;
+					dma-names = "rx", "tx";
+				};
+				src9: src-9 {
+					interrupts = <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x97>, <&audma1 0xba>;
+					dma-names = "rx", "tx";
+				};
+			};
 
 			rcar_sound,ssi {
-				ssi0: ssi-0 { };
-				ssi1: ssi-1 { };
-				ssi2: ssi-2 { };
-				ssi3: ssi-3 { };
-				ssi4: ssi-4 { };
-				ssi5: ssi-5 { };
-				ssi6: ssi-6 { };
-				ssi7: ssi-7 { };
-				ssi8: ssi-8 { };
-				ssi9: ssi-9 { };
+				ssi0: ssi-0 {
+					interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x01>, <&audma1 0x02>;
+					dma-names = "rx", "tx";
+				};
+				ssi1: ssi-1 {
+					interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x03>, <&audma1 0x04>;
+					dma-names = "rx", "tx";
+				};
+				ssi2: ssi-2 {
+					interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x05>, <&audma1 0x06>;
+					dma-names = "rx", "tx";
+				};
+				ssi3: ssi-3 {
+					interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x07>, <&audma1 0x08>;
+					dma-names = "rx", "tx";
+				};
+				ssi4: ssi-4 {
+					interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x09>, <&audma1 0x0a>;
+					dma-names = "rx", "tx";
+				};
+				ssi5: ssi-5 {
+					interrupts = <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x0b>, <&audma1 0x0c>;
+					dma-names = "rx", "tx";
+				};
+				ssi6: ssi-6 {
+					interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x0d>, <&audma1 0x0e>;
+					dma-names = "rx", "tx";
+				};
+				ssi7: ssi-7 {
+					interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x0f>, <&audma1 0x10>;
+					dma-names = "rx", "tx";
+				};
+				ssi8: ssi-8 {
+					interrupts = <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x11>, <&audma1 0x12>;
+					dma-names = "rx", "tx";
+				};
+				ssi9: ssi-9 {
+					interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x13>, <&audma1 0x14>;
+					dma-names = "rx", "tx";
+				};
 			};
+
+			rcar_sound,ssiu {
+				ssiu00: ssiu-0 {
+					dmas = <&audma0 0x15>, <&audma1 0x16>;
+					dma-names = "rx", "tx";
+				};
+				ssiu01: ssiu-1 {
+					dmas = <&audma0 0x35>, <&audma1 0x36>;
+					dma-names = "rx", "tx";
+				};
+				ssiu02: ssiu-2 {
+					dmas = <&audma0 0x37>, <&audma1 0x38>;
+					dma-names = "rx", "tx";
+				};
+				ssiu03: ssiu-3 {
+					dmas = <&audma0 0x47>, <&audma1 0x48>;
+					dma-names = "rx", "tx";
+				};
+				ssiu04: ssiu-4 {
+					dmas = <&audma0 0x3F>, <&audma1 0x40>;
+					dma-names = "rx", "tx";
+				};
+				ssiu05: ssiu-5 {
+					dmas = <&audma0 0x43>, <&audma1 0x44>;
+					dma-names = "rx", "tx";
+				};
+				ssiu06: ssiu-6 {
+					dmas = <&audma0 0x4F>, <&audma1 0x50>;
+					dma-names = "rx", "tx";
+				};
+				ssiu07: ssiu-7 {
+					dmas = <&audma0 0x53>, <&audma1 0x54>;
+					dma-names = "rx", "tx";
+				};
+				ssiu10: ssiu-8 {
+					dmas = <&audma0 0x49>, <&audma1 0x4a>;
+					dma-names = "rx", "tx";
+				};
+				ssiu11: ssiu-9 {
+					dmas = <&audma0 0x4B>, <&audma1 0x4C>;
+					dma-names = "rx", "tx";
+				};
+				ssiu12: ssiu-10 {
+					dmas = <&audma0 0x57>, <&audma1 0x58>;
+					dma-names = "rx", "tx";
+				};
+				ssiu13: ssiu-11 {
+					dmas = <&audma0 0x59>, <&audma1 0x5A>;
+					dma-names = "rx", "tx";
+				};
+				ssiu14: ssiu-12 {
+					dmas = <&audma0 0x5F>, <&audma1 0x60>;
+					dma-names = "rx", "tx";
+				};
+				ssiu15: ssiu-13 {
+					dmas = <&audma0 0xC3>, <&audma1 0xC4>;
+					dma-names = "rx", "tx";
+				};
+				ssiu16: ssiu-14 {
+					dmas = <&audma0 0xC7>, <&audma1 0xC8>;
+					dma-names = "rx", "tx";
+				};
+				ssiu17: ssiu-15 {
+					dmas = <&audma0 0xCB>, <&audma1 0xCC>;
+					dma-names = "rx", "tx";
+				};
+				ssiu20: ssiu-16 {
+					dmas = <&audma0 0x63>, <&audma1 0x64>;
+					dma-names = "rx", "tx";
+				};
+				ssiu21: ssiu-17 {
+					dmas = <&audma0 0x67>, <&audma1 0x68>;
+					dma-names = "rx", "tx";
+				};
+				ssiu22: ssiu-18 {
+					dmas = <&audma0 0x6B>, <&audma1 0x6C>;
+					dma-names = "rx", "tx";
+				};
+				ssiu23: ssiu-19 {
+					dmas = <&audma0 0x6D>, <&audma1 0x6E>;
+					dma-names = "rx", "tx";
+				};
+				ssiu24: ssiu-20 {
+					dmas = <&audma0 0xCF>, <&audma1 0xCE>;
+					dma-names = "rx", "tx";
+				};
+				ssiu25: ssiu-21 {
+					dmas = <&audma0 0xEB>, <&audma1 0xEC>;
+					dma-names = "rx", "tx";
+				};
+				ssiu26: ssiu-22 {
+					dmas = <&audma0 0xED>, <&audma1 0xEE>;
+					dma-names = "rx", "tx";
+				};
+				ssiu27: ssiu-23 {
+					dmas = <&audma0 0xEF>, <&audma1 0xF0>;
+					dma-names = "rx", "tx";
+				};
+				ssiu30: ssiu-24 {
+					dmas = <&audma0 0x6f>, <&audma1 0x70>;
+					dma-names = "rx", "tx";
+				};
+				ssiu31: ssiu-25 {
+					dmas = <&audma0 0x21>, <&audma1 0x22>;
+					dma-names = "rx", "tx";
+				};
+				ssiu32: ssiu-26 {
+					dmas = <&audma0 0x23>, <&audma1 0x24>;
+					dma-names = "rx", "tx";
+				};
+				ssiu33: ssiu-27 {
+					dmas = <&audma0 0x25>, <&audma1 0x26>;
+					dma-names = "rx", "tx";
+				};
+				ssiu34: ssiu-28 {
+					dmas = <&audma0 0x27>, <&audma1 0x28>;
+					dma-names = "rx", "tx";
+				};
+				ssiu35: ssiu-29 {
+					dmas = <&audma0 0x29>, <&audma1 0x2A>;
+					dma-names = "rx", "tx";
+				};
+				ssiu36: ssiu-30 {
+					dmas = <&audma0 0x2B>, <&audma1 0x2C>;
+					dma-names = "rx", "tx";
+				};
+				ssiu37: ssiu-31 {
+					dmas = <&audma0 0x2D>, <&audma1 0x2E>;
+					dma-names = "rx", "tx";
+				};
+				ssiu40: ssiu-32 {
+					dmas =	<&audma0 0x71>, <&audma1 0x72>;
+					dma-names = "rx", "tx";
+				};
+				ssiu41: ssiu-33 {
+					dmas = <&audma0 0x17>, <&audma1 0x18>;
+					dma-names = "rx", "tx";
+				};
+				ssiu42: ssiu-34 {
+					dmas = <&audma0 0x19>, <&audma1 0x1A>;
+					dma-names = "rx", "tx";
+				};
+				ssiu43: ssiu-35 {
+					dmas = <&audma0 0x1B>, <&audma1 0x1C>;
+					dma-names = "rx", "tx";
+				};
+				ssiu44: ssiu-36 {
+					dmas = <&audma0 0x1D>, <&audma1 0x1E>;
+					dma-names = "rx", "tx";
+				};
+				ssiu45: ssiu-37 {
+					dmas = <&audma0 0x1F>, <&audma1 0x20>;
+					dma-names = "rx", "tx";
+				};
+				ssiu46: ssiu-38 {
+					dmas = <&audma0 0x31>, <&audma1 0x32>;
+					dma-names = "rx", "tx";
+				};
+				ssiu47: ssiu-39 {
+					dmas = <&audma0 0x33>, <&audma1 0x34>;
+					dma-names = "rx", "tx";
+				};
+				ssiu50: ssiu-40 {
+					dmas = <&audma0 0x73>, <&audma1 0x74>;
+					dma-names = "rx", "tx";
+				};
+				ssiu60: ssiu-41 {
+					dmas = <&audma0 0x75>, <&audma1 0x76>;
+					dma-names = "rx", "tx";
+				};
+				ssiu70: ssiu-42 {
+					dmas = <&audma0 0x79>, <&audma1 0x7a>;
+					dma-names = "rx", "tx";
+				};
+				ssiu80: ssiu-43 {
+					dmas = <&audma0 0x7b>, <&audma1 0x7c>;
+					dma-names = "rx", "tx";
+				};
+				ssiu90: ssiu-44 {
+					dmas = <&audma0 0x7d>, <&audma1 0x7e>;
+					dma-names = "rx", "tx";
+				};
+				ssiu91: ssiu-45 {
+					dmas = <&audma0 0x7F>, <&audma1 0x80>;
+					dma-names = "rx", "tx";
+				};
+				ssiu92: ssiu-46 {
+					dmas = <&audma0 0x81>, <&audma1 0x82>;
+					dma-names = "rx", "tx";
+				};
+				ssiu93: ssiu-47 {
+					dmas = <&audma0 0x83>, <&audma1 0x84>;
+					dma-names = "rx", "tx";
+				};
+				ssiu94: ssiu-48 {
+					dmas = <&audma0 0xA3>, <&audma1 0xA4>;
+					dma-names = "rx", "tx";
+				};
+				ssiu95: ssiu-49 {
+					dmas = <&audma0 0xA5>, <&audma1 0xA6>;
+					dma-names = "rx", "tx";
+				};
+				ssiu96: ssiu-50 {
+					dmas = <&audma0 0xA7>, <&audma1 0xA8>;
+					dma-names = "rx", "tx";
+				};
+				ssiu97: ssiu-51 {
+					dmas = <&audma0 0xA9>, <&audma1 0xAA>;
+					dma-names = "rx", "tx";
+				};
+			};
+		};
+
+		audma0: dma-controller@ec700000 {
+			compatible = "renesas,dmac-r8a774b1",
+				     "renesas,rcar-dmac";
+			reg = <0 0xec700000 0 0x10000>;
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					"ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7",
+					"ch8", "ch9", "ch10", "ch11",
+					"ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 502>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 502>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+		};
+
+		audma1: dma-controller@ec720000 {
+			compatible = "renesas,dmac-r8a774b1",
+				     "renesas,rcar-dmac";
+			reg = <0 0xec720000 0 0x10000>;
+			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					"ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7",
+					"ch8", "ch9", "ch10", "ch11",
+					"ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 501>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 501>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
 		};
 
 		xhci0: usb@ee000000 {
-- 
2.7.4

