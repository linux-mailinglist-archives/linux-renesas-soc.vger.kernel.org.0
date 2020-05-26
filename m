Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E17C1E30D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 23:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390389AbgEZVCH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 May 2020 17:02:07 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:19207 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389124AbgEZVCH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 May 2020 17:02:07 -0400
X-IronPort-AV: E=Sophos;i="5.73,437,1583161200"; 
   d="scan'208";a="47867543"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 May 2020 06:02:05 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2D4BC40DB28B;
        Wed, 27 May 2020 06:02:02 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] ARM: dts: r8a7742: Add audio support
Date:   Tue, 26 May 2020 22:01:44 +0100
Message-Id: <1590526904-13855-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590526904-13855-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1590526904-13855-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add sound support for the RZ/G1H SoC (a.k.a. R8A7742).

This work is based on similar work done on the R8A7744 SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7742.dtsi | 284 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 284 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
index 3a9c67b..3ed05c6 100644
--- a/arch/arm/boot/dts/r8a7742.dtsi
+++ b/arch/arm/boot/dts/r8a7742.dtsi
@@ -15,6 +15,27 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	/*
+	 * The external audio clocks are configured as 0 Hz fixed frequency
+	 * clocks by default.
+	 * Boards that provide audio clocks should override them.
+	 */
+	audio_clk_a: audio_clk_a {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+	audio_clk_b: audio_clk_b {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+	audio_clk_c: audio_clk_c {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -821,6 +842,269 @@
 			status = "disabled";
 		};
 
+		rcar_sound: sound@ec500000 {
+			/*
+			 * #sound-dai-cells is required
+			 *
+			 * Single DAI : #sound-dai-cells = <0>;         <&rcar_sound>;
+			 * Multi  DAI : #sound-dai-cells = <1>;         <&rcar_sound N>;
+			 */
+			compatible = "renesas,rcar_sound-r8a7742",
+				     "renesas,rcar_sound-gen2";
+			reg = <0 0xec500000 0 0x1000>, /* SCU */
+			      <0 0xec5a0000 0 0x100>,  /* ADG */
+			      <0 0xec540000 0 0x1000>, /* SSIU */
+			      <0 0xec541000 0 0x280>,  /* SSI */
+			      <0 0xec740000 0 0x200>;  /* Audio DMAC peri peri*/
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
+				 <&cpg CPG_MOD 1021>, <&cpg CPG_MOD 1020>,
+				 <&cpg CPG_MOD 1021>, <&cpg CPG_MOD 1020>,
+				 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
+				 <&audio_clk_a>, <&audio_clk_b>, <&audio_clk_c>,
+				 <&cpg CPG_CORE R8A7742_CLK_M2>;
+			clock-names = "ssi-all",
+				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
+				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
+				      "ssi.1", "ssi.0",
+				      "src.9", "src.8", "src.7", "src.6",
+				      "src.5", "src.4", "src.3", "src.2",
+				      "src.1", "src.0",
+				      "ctu.0", "ctu.1",
+				      "mix.0", "mix.1",
+				      "dvc.0", "dvc.1",
+				      "clk_a", "clk_b", "clk_c", "clk_i";
+			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
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
+
+			status = "disabled";
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
+
+			rcar_sound,ssi {
+				ssi0: ssi-0 {
+					interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x01>, <&audma1 0x02>,
+					       <&audma0 0x15>, <&audma1 0x16>;
+					dma-names = "rx", "tx", "rxu", "txu";
+				};
+				ssi1: ssi-1 {
+					 interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x03>, <&audma1 0x04>,
+					       <&audma0 0x49>, <&audma1 0x4a>;
+					dma-names = "rx", "tx", "rxu", "txu";
+				};
+				ssi2: ssi-2 {
+					interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x05>, <&audma1 0x06>,
+					       <&audma0 0x63>, <&audma1 0x64>;
+					dma-names = "rx", "tx", "rxu", "txu";
+				};
+				ssi3: ssi-3 {
+					interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x07>, <&audma1 0x08>,
+					       <&audma0 0x6f>, <&audma1 0x70>;
+					dma-names = "rx", "tx", "rxu", "txu";
+				};
+				ssi4: ssi-4 {
+					interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x09>, <&audma1 0x0a>,
+					       <&audma0 0x71>, <&audma1 0x72>;
+					dma-names = "rx", "tx", "rxu", "txu";
+				};
+				ssi5: ssi-5 {
+					interrupts = <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x0b>, <&audma1 0x0c>,
+					       <&audma0 0x73>, <&audma1 0x74>;
+					dma-names = "rx", "tx", "rxu", "txu";
+				};
+				ssi6: ssi-6 {
+					interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x0d>, <&audma1 0x0e>,
+					       <&audma0 0x75>, <&audma1 0x76>;
+					dma-names = "rx", "tx", "rxu", "txu";
+				};
+				ssi7: ssi-7 {
+					interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x0f>, <&audma1 0x10>,
+					       <&audma0 0x79>, <&audma1 0x7a>;
+					dma-names = "rx", "tx", "rxu", "txu";
+				};
+				ssi8: ssi-8 {
+					interrupts = <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x11>, <&audma1 0x12>,
+					       <&audma0 0x7b>, <&audma1 0x7c>;
+					dma-names = "rx", "tx", "rxu", "txu";
+				};
+				ssi9: ssi-9 {
+					interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x13>, <&audma1 0x14>,
+					       <&audma0 0x7d>, <&audma1 0x7e>;
+					dma-names = "rx", "tx", "rxu", "txu";
+				};
+			};
+		};
+
+		audma0: dma-controller@ec700000 {
+			compatible = "renesas,dmac-r8a7742",
+				     "renesas,rcar-dmac";
+			reg = <0 0xec700000 0 0x10000>;
+			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12";
+			clocks = <&cpg CPG_MOD 502>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
+			resets = <&cpg 502>;
+			#dma-cells = <1>;
+			dma-channels = <13>;
+		};
+
+		audma1: dma-controller@ec720000 {
+			compatible = "renesas,dmac-r8a7742",
+				     "renesas,rcar-dmac";
+			reg = <0 0xec720000 0 0x10000>;
+			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12";
+			clocks = <&cpg CPG_MOD 501>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
+			resets = <&cpg 501>;
+			#dma-cells = <1>;
+			dma-channels = <13>;
+		};
+
 		xhci: usb@ee000000 {
 			compatible = "renesas,xhci-r8a7742",
 				     "renesas,rcar-gen2-xhci";
-- 
2.7.4

