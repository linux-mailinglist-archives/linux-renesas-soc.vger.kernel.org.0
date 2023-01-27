Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40A367E6E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jan 2023 14:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjA0Nj7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Jan 2023 08:39:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232810AbjA0Njs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 08:39:48 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30BA7BBE4;
        Fri, 27 Jan 2023 05:39:42 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso5677339wmb.0;
        Fri, 27 Jan 2023 05:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHAzVytwSDQUsIPIl4S956zch1TbyeMj6yxzYPu0CoM=;
        b=dIlHo5rQ2ziQEJAEY6FXCOZSEgSEkBVEu04nheaQDjC/q/rD2GNTptosrSwGVqiD9i
         DoWxJ5zVvKJt7qGhoNelsBq4wU+37XtjXMrO4fXiCadMbi+zvnE2Orz7r9PcGazLawCe
         nPSnt1QOhlPrnrRD8RLdclxQ79/ZI+y5CfVDCCKCdNSt0rdoyeQ7gd5bWxtDlIeJikTm
         RgGjN5PiFvuSlu4aVryBIeNpYz4qKSFo2t4Z3LFtjgV5tcEmGPjswpu8AudWeN40qwAg
         AgA/x08u3hepqYtJwCDO++2dkdwA6AIVL898eWu0z9zKveYmaKvl5qr45Z3axD1zVHoN
         VYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHAzVytwSDQUsIPIl4S956zch1TbyeMj6yxzYPu0CoM=;
        b=ru+zoZtvrD73pNafLbbbAEG+cgMUDj9ejKQ8CAxgdpXow/TWlmnLo3wrlovvZGsNHf
         +g7e1IismdWLVJ/Im2mJzYa7fckFbf+2xd7/JmNVYevEW/ze8/ISCzIjAzENtMEaA7Tp
         3R4zrY6zQbn3XruoaRqVWkQymIOQ13bFRW9YM7cbGGNaVTaMWEgPjsedAbYuJ5yO0c5Y
         B+zGTi34BESK4LcDb5QyZgaxhCmBwjs75IN01iBpH6vcb2S23l2kkjOel/gT+e9+pxH3
         Gpl5CGKU7QtbzQVK8u3OTRb9CYUjQKuq/TE0r3qpQ4hv/trg2AUVS5YAR2ryg4u+dWZo
         xwTA==
X-Gm-Message-State: AFqh2kptjXGRs/fQR+DHPP9Ln5RkxuqKiVqabjZtynZBSvmU2ivi1mzF
        hv4RFl2XpEgdV0A4DlT38lY=
X-Google-Smtp-Source: AMrXdXvR3a9wY2eCU+F9sDrnP/lJdLNSQaLzrzUrT4DmSdggh8QBODzokgZaqW9drwmL+dbZ1sNirQ==
X-Received: by 2002:a05:600c:3d16:b0:3d3:3deb:d916 with SMTP id bh22-20020a05600c3d1600b003d33debd916mr39638165wmb.4.1674826781329;
        Fri, 27 Jan 2023 05:39:41 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:ca6:cb06:c6e7:59f6])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c468c00b003dc22ee5a2bsm5752918wmo.39.2023.01.27.05.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 05:39:40 -0800 (PST)
From:   Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r9a07g054: Reuse RZ/G2L SoC DTSI
Date:   Fri, 27 Jan 2023 13:39:09 +0000
Message-Id: <20230127133909.144774-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127133909.144774-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230127133909.144774-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

RZ/V2L SoC is almost identical to RZ/G2L SoC hence re-use the RZ/G2L SoC
DTSI and just update the compatible strings wherever required.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 1149 +++-----------------
 1 file changed, 127 insertions(+), 1022 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 304ade54425b..f8dae9e1ffab 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -5,1071 +5,176 @@
  * Copyright (C) 2021 Renesas Electronics Corp.
  */
 
-#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/r9a07g054-cpg.h>
 
-/ {
-	compatible = "renesas,r9a07g054";
-	#address-cells = <2>;
-	#size-cells = <2>;
-
-	audio_clk1: audio1-clk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		/* This value must be overridden by boards that provide it */
-		clock-frequency = <0>;
-	};
-
-	audio_clk2: audio2-clk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		/* This value must be overridden by boards that provide it */
-		clock-frequency = <0>;
-	};
-
-	/* External CAN clock - to be overridden by boards that provide it */
-	can_clk: can-clk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <0>;
-	};
-
-	/* clock can be either from exclk or crystal oscillator (XIN/XOUT) */
-	extal_clk: extal-clk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		/* This value must be overridden by the board */
-		clock-frequency = <0>;
-	};
-
-	cluster0_opp: opp-table-0 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-150000000 {
-			opp-hz = /bits/ 64 <150000000>;
-			opp-microvolt = <1100000>;
-			clock-latency-ns = <300000>;
-		};
-		opp-300000000 {
-			opp-hz = /bits/ 64 <300000000>;
-			opp-microvolt = <1100000>;
-			clock-latency-ns = <300000>;
-		};
-		opp-600000000 {
-			opp-hz = /bits/ 64 <600000000>;
-			opp-microvolt = <1100000>;
-			clock-latency-ns = <300000>;
-		};
-		opp-1200000000 {
-			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <1100000>;
-			clock-latency-ns = <300000>;
-			opp-suspend;
-		};
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu-map {
-			cluster0 {
-				core0 {
-					cpu = <&cpu0>;
-				};
-				core1 {
-					cpu = <&cpu1>;
-				};
-			};
-		};
-
-		cpu0: cpu@0 {
-			compatible = "arm,cortex-a55";
-			reg = <0>;
-			device_type = "cpu";
-			#cooling-cells = <2>;
-			next-level-cache = <&L3_CA55>;
-			enable-method = "psci";
-			clocks = <&cpg CPG_CORE R9A07G054_CLK_I>;
-			operating-points-v2 = <&cluster0_opp>;
-		};
-
-		cpu1: cpu@100 {
-			compatible = "arm,cortex-a55";
-			reg = <0x100>;
-			device_type = "cpu";
-			next-level-cache = <&L3_CA55>;
-			enable-method = "psci";
-			clocks = <&cpg CPG_CORE R9A07G054_CLK_I>;
-			operating-points-v2 = <&cluster0_opp>;
-		};
-
-		L3_CA55: cache-controller-0 {
-			compatible = "cache";
-			cache-unified;
-			cache-size = <0x40000>;
-			cache-level = <3>;
-		};
-	};
-
-	gpu_opp_table: opp-table-1 {
-		compatible = "operating-points-v2";
-
-		opp-500000000 {
-			opp-hz = /bits/ 64 <500000000>;
-			opp-microvolt = <1100000>;
-		};
-
-		opp-400000000 {
-			opp-hz = /bits/ 64 <400000000>;
-			opp-microvolt = <1100000>;
-		};
-
-		opp-250000000 {
-			opp-hz = /bits/ 64 <250000000>;
-			opp-microvolt = <1100000>;
-		};
-
-		opp-200000000 {
-			opp-hz = /bits/ 64 <200000000>;
-			opp-microvolt = <1100000>;
-		};
-
-		opp-125000000 {
-			opp-hz = /bits/ 64 <125000000>;
-			opp-microvolt = <1100000>;
-		};
-
-		opp-100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-			opp-microvolt = <1100000>;
-		};
+#define SOC_CPG_PREFIX(X)	R9A07G054_ ## X
 
-		opp-62500000 {
-			opp-hz = /bits/ 64 <62500000>;
-			opp-microvolt = <1100000>;
-		};
+#include "r9a07g044.dtsi"
 
-		opp-50000000 {
-			opp-hz = /bits/ 64 <50000000>;
-			opp-microvolt = <1100000>;
-		};
-	};
-
-	psci {
-		compatible = "arm,psci-1.0", "arm,psci-0.2";
-		method = "smc";
-	};
-
-	soc: soc {
-		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		ssi0: ssi@10049c00 {
-			compatible = "renesas,r9a07g054-ssi",
-				     "renesas,rz-ssi";
-			reg = <0 0x10049c00 0 0x400>;
-			interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 327 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 328 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 329 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
-			clocks = <&cpg CPG_MOD R9A07G054_SSI0_PCLK2>,
-				 <&cpg CPG_MOD R9A07G054_SSI0_PCLK_SFR>,
-				 <&audio_clk1>, <&audio_clk2>;
-			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
-			resets = <&cpg R9A07G054_SSI0_RST_M2_REG>;
-			dmas = <&dmac 0x2655>, <&dmac 0x2656>;
-			dma-names = "tx", "rx";
-			power-domains = <&cpg>;
-			#sound-dai-cells = <0>;
-			status = "disabled";
-		};
-
-		ssi1: ssi@1004a000 {
-			compatible = "renesas,r9a07g054-ssi",
-				     "renesas,rz-ssi";
-			reg = <0 0x1004a000 0 0x400>;
-			interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 331 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 332 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 333 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
-			clocks = <&cpg CPG_MOD R9A07G054_SSI1_PCLK2>,
-				 <&cpg CPG_MOD R9A07G054_SSI1_PCLK_SFR>,
-				 <&audio_clk1>, <&audio_clk2>;
-			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
-			resets = <&cpg R9A07G054_SSI1_RST_M2_REG>;
-			dmas = <&dmac 0x2659>, <&dmac 0x265a>;
-			dma-names = "tx", "rx";
-			power-domains = <&cpg>;
-			#sound-dai-cells = <0>;
-			status = "disabled";
-		};
-
-		ssi2: ssi@1004a400 {
-			compatible = "renesas,r9a07g054-ssi",
-				     "renesas,rz-ssi";
-			reg = <0 0x1004a400 0 0x400>;
-			interrupts = <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 335 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 336 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 337 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
-			clocks = <&cpg CPG_MOD R9A07G054_SSI2_PCLK2>,
-				 <&cpg CPG_MOD R9A07G054_SSI2_PCLK_SFR>,
-				 <&audio_clk1>, <&audio_clk2>;
-			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
-			resets = <&cpg R9A07G054_SSI2_RST_M2_REG>;
-			dmas = <&dmac 0x265f>;
-			dma-names = "rt";
-			power-domains = <&cpg>;
-			#sound-dai-cells = <0>;
-			status = "disabled";
-		};
-
-		ssi3: ssi@1004a800 {
-			compatible = "renesas,r9a07g054-ssi",
-				     "renesas,rz-ssi";
-			reg = <0 0x1004a800 0 0x400>;
-			interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 339 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 340 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 341 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
-			clocks = <&cpg CPG_MOD R9A07G054_SSI3_PCLK2>,
-				 <&cpg CPG_MOD R9A07G054_SSI3_PCLK_SFR>,
-				 <&audio_clk1>, <&audio_clk2>;
-			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
-			resets = <&cpg R9A07G054_SSI3_RST_M2_REG>;
-			dmas = <&dmac 0x2661>, <&dmac 0x2662>;
-			dma-names = "tx", "rx";
-			power-domains = <&cpg>;
-			#sound-dai-cells = <0>;
-			status = "disabled";
-		};
-
-		spi0: spi@1004ac00 {
-			compatible = "renesas,r9a07g054-rspi", "renesas,rspi-rz";
-			reg = <0 0x1004ac00 0 0x400>;
-			interrupts = <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "error", "rx", "tx";
-			clocks = <&cpg CPG_MOD R9A07G054_RSPI0_CLKB>;
-			resets = <&cpg R9A07G054_RSPI0_RST>;
-			dmas = <&dmac 0x2e95>, <&dmac 0x2e96>;
-			dma-names = "tx", "rx";
-			power-domains = <&cpg>;
-			num-cs = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
-
-		spi1: spi@1004b000 {
-			compatible = "renesas,r9a07g054-rspi", "renesas,rspi-rz";
-			reg = <0 0x1004b000 0 0x400>;
-			interrupts = <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "error", "rx", "tx";
-			clocks = <&cpg CPG_MOD R9A07G054_RSPI1_CLKB>;
-			resets = <&cpg R9A07G054_RSPI1_RST>;
-			dmas = <&dmac 0x2e99>, <&dmac 0x2e9a>;
-			dma-names = "tx", "rx";
-			power-domains = <&cpg>;
-			num-cs = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
-
-		spi2: spi@1004b400 {
-			compatible = "renesas,r9a07g054-rspi", "renesas,rspi-rz";
-			reg = <0 0x1004b400 0 0x400>;
-			interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "error", "rx", "tx";
-			clocks = <&cpg CPG_MOD R9A07G054_RSPI2_CLKB>;
-			resets = <&cpg R9A07G054_RSPI2_RST>;
-			dmas = <&dmac 0x2e9d>, <&dmac 0x2e9e>;
-			dma-names = "tx", "rx";
-			power-domains = <&cpg>;
-			num-cs = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
-
-		scif0: serial@1004b800 {
-			compatible = "renesas,scif-r9a07g054",
-				     "renesas,scif-r9a07g044";
-			reg = <0 0x1004b800 0 0x400>;
-			interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "eri", "rxi", "txi",
-					  "bri", "dri", "tei";
-			clocks = <&cpg CPG_MOD R9A07G054_SCIF0_CLK_PCK>;
-			clock-names = "fck";
-			power-domains = <&cpg>;
-			resets = <&cpg R9A07G054_SCIF0_RST_SYSTEM_N>;
-			status = "disabled";
-		};
-
-		scif1: serial@1004bc00 {
-			compatible = "renesas,scif-r9a07g054",
-				     "renesas,scif-r9a07g044";
-			reg = <0 0x1004bc00 0 0x400>;
-			interrupts = <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "eri", "rxi", "txi",
-					  "bri", "dri", "tei";
-			clocks = <&cpg CPG_MOD R9A07G054_SCIF1_CLK_PCK>;
-			clock-names = "fck";
-			power-domains = <&cpg>;
-			resets = <&cpg R9A07G054_SCIF1_RST_SYSTEM_N>;
-			status = "disabled";
-		};
-
-		scif2: serial@1004c000 {
-			compatible = "renesas,scif-r9a07g054",
-				     "renesas,scif-r9a07g044";
-			reg = <0 0x1004c000 0 0x400>;
-			interrupts = <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "eri", "rxi", "txi",
-					  "bri", "dri", "tei";
-			clocks = <&cpg CPG_MOD R9A07G054_SCIF2_CLK_PCK>;
-			clock-names = "fck";
-			power-domains = <&cpg>;
-			resets = <&cpg R9A07G054_SCIF2_RST_SYSTEM_N>;
-			status = "disabled";
-		};
-
-		scif3: serial@1004c400 {
-			compatible = "renesas,scif-r9a07g054",
-				     "renesas,scif-r9a07g044";
-			reg = <0 0x1004c400 0 0x400>;
-			interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "eri", "rxi", "txi",
-					  "bri", "dri", "tei";
-			clocks = <&cpg CPG_MOD R9A07G054_SCIF3_CLK_PCK>;
-			clock-names = "fck";
-			power-domains = <&cpg>;
-			resets = <&cpg R9A07G054_SCIF3_RST_SYSTEM_N>;
-			status = "disabled";
-		};
-
-		scif4: serial@1004c800 {
-			compatible = "renesas,scif-r9a07g054",
-				     "renesas,scif-r9a07g044";
-			reg = <0 0x1004c800 0 0x400>;
-			interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "eri", "rxi", "txi",
-					  "bri", "dri", "tei";
-			clocks = <&cpg CPG_MOD R9A07G054_SCIF4_CLK_PCK>;
-			clock-names = "fck";
-			power-domains = <&cpg>;
-			resets = <&cpg R9A07G054_SCIF4_RST_SYSTEM_N>;
-			status = "disabled";
-		};
-
-		sci0: serial@1004d000 {
-			compatible = "renesas,r9a07g054-sci", "renesas,sci";
-			reg = <0 0x1004d000 0 0x400>;
-			interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 406 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 407 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "eri", "rxi", "txi", "tei";
-			clocks = <&cpg CPG_MOD R9A07G054_SCI0_CLKP>;
-			clock-names = "fck";
-			power-domains = <&cpg>;
-			resets = <&cpg R9A07G054_SCI0_RST>;
-			status = "disabled";
-		};
+/ {
+	compatible = "renesas,r9a07g054";
+};
 
-		sci1: serial@1004d400 {
-			compatible = "renesas,r9a07g054-sci", "renesas,sci";
-			reg = <0 0x1004d400 0 0x400>;
-			interrupts = <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 410 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 411 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "eri", "rxi", "txi", "tei";
-			clocks = <&cpg CPG_MOD R9A07G054_SCI1_CLKP>;
-			clock-names = "fck";
-			power-domains = <&cpg>;
-			resets = <&cpg R9A07G054_SCI1_RST>;
-			status = "disabled";
-		};
+&ssi0 {
+	compatible = "renesas,r9a07g054-ssi", "renesas,rz-ssi";
+};
 
-		canfd: can@10050000 {
-			compatible = "renesas,r9a07g054-canfd", "renesas,rzg2l-canfd";
-			reg = <0 0x10050000 0 0x8000>;
-			interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "g_err", "g_recc",
-					  "ch0_err", "ch0_rec", "ch0_trx",
-					  "ch1_err", "ch1_rec", "ch1_trx";
-			clocks = <&cpg CPG_MOD R9A07G054_CANFD_PCLK>,
-				 <&cpg CPG_CORE R9A07G054_CLK_P0_DIV2>,
-				 <&can_clk>;
-			clock-names = "fck", "canfd", "can_clk";
-			assigned-clocks = <&cpg CPG_CORE R9A07G054_CLK_P0_DIV2>;
-			assigned-clock-rates = <50000000>;
-			resets = <&cpg R9A07G054_CANFD_RSTP_N>,
-				 <&cpg R9A07G054_CANFD_RSTC_N>;
-			reset-names = "rstp_n", "rstc_n";
-			power-domains = <&cpg>;
-			status = "disabled";
+&ssi1 {
+	compatible = "renesas,r9a07g054-ssi", "renesas,rz-ssi";
+};
 
-			channel0 {
-				status = "disabled";
-			};
-			channel1 {
-				status = "disabled";
-			};
-		};
+&ssi2 {
+	compatible = "renesas,r9a07g054-ssi", "renesas,rz-ssi";
+};
 
-		i2c0: i2c@10058000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "renesas,riic-r9a07g054", "renesas,riic-rz";
-			reg = <0 0x10058000 0 0x400>;
-			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 348 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 349 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "tei", "ri", "ti", "spi", "sti",
-					  "naki", "ali", "tmoi";
-			clocks = <&cpg CPG_MOD R9A07G054_I2C0_PCLK>;
-			clock-frequency = <100000>;
-			resets = <&cpg R9A07G054_I2C0_MRST>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
+&ssi3 {
+	compatible = "renesas,r9a07g054-ssi", "renesas,rz-ssi";
+};
 
-		i2c1: i2c@10058400 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "renesas,riic-r9a07g054", "renesas,riic-rz";
-			reg = <0 0x10058400 0 0x400>;
-			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 356 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 357 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "tei", "ri", "ti", "spi", "sti",
-					  "naki", "ali", "tmoi";
-			clocks = <&cpg CPG_MOD R9A07G054_I2C1_PCLK>;
-			clock-frequency = <100000>;
-			resets = <&cpg R9A07G054_I2C1_MRST>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
+&spi0 {
+	compatible = "renesas,r9a07g054-rspi", "renesas,rspi-rz";
+};
 
-		i2c2: i2c@10058800 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "renesas,riic-r9a07g054", "renesas,riic-rz";
-			reg = <0 0x10058800 0 0x400>;
-			interrupts = <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 364 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 365 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "tei", "ri", "ti", "spi", "sti",
-					  "naki", "ali", "tmoi";
-			clocks = <&cpg CPG_MOD R9A07G054_I2C2_PCLK>;
-			clock-frequency = <100000>;
-			resets = <&cpg R9A07G054_I2C2_MRST>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
+&spi1 {
+	compatible = "renesas,r9a07g054-rspi", "renesas,rspi-rz";
+};
 
-		i2c3: i2c@10058c00 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "renesas,riic-r9a07g054", "renesas,riic-rz";
-			reg = <0 0x10058c00 0 0x400>;
-			interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 372 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 373 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "tei", "ri", "ti", "spi", "sti",
-					  "naki", "ali", "tmoi";
-			clocks = <&cpg CPG_MOD R9A07G054_I2C3_PCLK>;
-			clock-frequency = <100000>;
-			resets = <&cpg R9A07G054_I2C3_MRST>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
+&spi2 {
+	compatible = "renesas,r9a07g054-rspi", "renesas,rspi-rz";
+};
 
-		adc: adc@10059000 {
-			compatible = "renesas,r9a07g054-adc", "renesas,rzg2l-adc";
-			reg = <0 0x10059000 0 0x400>;
-			interrupts = <GIC_SPI 347 IRQ_TYPE_EDGE_RISING>;
-			clocks = <&cpg CPG_MOD R9A07G054_ADC_ADCLK>,
-				 <&cpg CPG_MOD R9A07G054_ADC_PCLK>;
-			clock-names = "adclk", "pclk";
-			resets = <&cpg R9A07G054_ADC_PRESETN>,
-				 <&cpg R9A07G054_ADC_ADRST_N>;
-			reset-names = "presetn", "adrst-n";
-			power-domains = <&cpg>;
-			status = "disabled";
+&scif0 {
+	compatible = "renesas,scif-r9a07g054", "renesas,scif-r9a07g044";
+};
 
-			#address-cells = <1>;
-			#size-cells = <0>;
+&scif1 {
+	compatible = "renesas,scif-r9a07g054", "renesas,scif-r9a07g044";
+};
 
-			channel@0 {
-				reg = <0>;
-			};
-			channel@1 {
-				reg = <1>;
-			};
-			channel@2 {
-				reg = <2>;
-			};
-			channel@3 {
-				reg = <3>;
-			};
-			channel@4 {
-				reg = <4>;
-			};
-			channel@5 {
-				reg = <5>;
-			};
-			channel@6 {
-				reg = <6>;
-			};
-			channel@7 {
-				reg = <7>;
-			};
-		};
+&scif2 {
+	compatible = "renesas,scif-r9a07g054", "renesas,scif-r9a07g044";
+};
 
-		tsu: thermal@10059400 {
-			compatible = "renesas,r9a07g054-tsu",
-				     "renesas,rzg2l-tsu";
-			reg = <0 0x10059400 0 0x400>;
-			clocks = <&cpg CPG_MOD R9A07G054_TSU_PCLK>;
-			resets = <&cpg R9A07G054_TSU_PRESETN>;
-			power-domains = <&cpg>;
-			#thermal-sensor-cells = <1>;
-		};
+&scif3 {
+	compatible = "renesas,scif-r9a07g054", "renesas,scif-r9a07g044";
+};
 
-		sbc: spi@10060000 {
-			compatible = "renesas,r9a07g054-rpc-if",
-				     "renesas,rzg2l-rpc-if";
-			reg = <0 0x10060000 0 0x10000>,
-			      <0 0x20000000 0 0x10000000>,
-			      <0 0x10070000 0 0x10000>;
-			reg-names = "regs", "dirmap", "wbuf";
-			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD R9A07G054_SPI_CLK2>,
-				 <&cpg CPG_MOD R9A07G054_SPI_CLK>;
-			resets = <&cpg R9A07G054_SPI_RST>;
-			power-domains = <&cpg>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
+&scif4 {
+	compatible = "renesas,scif-r9a07g054", "renesas,scif-r9a07g044";
+};
 
-		cpg: clock-controller@11010000 {
-			compatible = "renesas,r9a07g054-cpg";
-			reg = <0 0x11010000 0 0x10000>;
-			clocks = <&extal_clk>;
-			clock-names = "extal";
-			#clock-cells = <2>;
-			#reset-cells = <1>;
-			#power-domain-cells = <0>;
-		};
+&sci0 {
+	compatible = "renesas,r9a07g054-sci", "renesas,sci";
+};
 
-		sysc: system-controller@11020000 {
-			compatible = "renesas,r9a07g054-sysc";
-			reg = <0 0x11020000 0 0x10000>;
-			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "lpm_int", "ca55stbydone_int",
-					  "cm33stbyr_int", "ca55_deny";
-			status = "disabled";
-		};
+&sci1 {
+	compatible = "renesas,r9a07g054-sci", "renesas,sci";
+};
 
-		pinctrl: pinctrl@11030000 {
-			compatible = "renesas,r9a07g054-pinctrl",
-				     "renesas,r9a07g044-pinctrl";
-			reg = <0 0x11030000 0 0x10000>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			#interrupt-cells = <2>;
-			interrupt-parent = <&irqc>;
-			interrupt-controller;
-			gpio-ranges = <&pinctrl 0 0 392>;
-			clocks = <&cpg CPG_MOD R9A07G054_GPIO_HCLK>;
-			power-domains = <&cpg>;
-			resets = <&cpg R9A07G054_GPIO_RSTN>,
-				 <&cpg R9A07G054_GPIO_PORT_RESETN>,
-				 <&cpg R9A07G054_GPIO_SPARE_RESETN>;
-		};
+&canfd {
+	compatible = "renesas,r9a07g054-canfd", "renesas,rzg2l-canfd";
+};
 
-		irqc: interrupt-controller@110a0000 {
-			compatible = "renesas,r9a07g054-irqc",
-				     "renesas,rzg2l-irqc";
-			#interrupt-cells = <2>;
-			#address-cells = <0>;
-			interrupt-controller;
-			reg = <0 0x110a0000 0 0x10000>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD R9A07G054_IA55_CLK>,
-				 <&cpg CPG_MOD R9A07G054_IA55_PCLK>;
-			clock-names = "clk", "pclk";
-			power-domains = <&cpg>;
-			resets = <&cpg R9A07G054_IA55_RESETN>;
-		};
+&i2c0 {
+	compatible = "renesas,riic-r9a07g054", "renesas,riic-rz";
+};
 
-		dmac: dma-controller@11820000 {
-			compatible = "renesas,r9a07g054-dmac",
-				     "renesas,rz-dmac";
-			reg = <0 0x11820000 0 0x10000>,
-			      <0 0x11830000 0 0x10000>;
-			interrupts = <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 125 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 128 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 129 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 130 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 132 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 133 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 134 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 135 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 136 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 137 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 138 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 139 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 140 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "error",
-					  "ch0", "ch1", "ch2", "ch3",
-					  "ch4", "ch5", "ch6", "ch7",
-					  "ch8", "ch9", "ch10", "ch11",
-					  "ch12", "ch13", "ch14", "ch15";
-			clocks = <&cpg CPG_MOD R9A07G054_DMAC_ACLK>,
-				 <&cpg CPG_MOD R9A07G054_DMAC_PCLK>;
-			power-domains = <&cpg>;
-			resets = <&cpg R9A07G054_DMAC_ARESETN>,
-				 <&cpg R9A07G054_DMAC_RST_ASYNC>;
-			#dma-cells = <1>;
-			dma-channels = <16>;
-		};
+&i2c1 {
+	compatible = "renesas,riic-r9a07g054", "renesas,riic-rz";
+};
 
-		gpu: gpu@11840000 {
-			compatible = "renesas,r9a07g054-mali",
-				     "arm,mali-bifrost";
-			reg = <0x0 0x11840000 0x0 0x10000>;
-			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "job", "mmu", "gpu", "event";
-			clocks = <&cpg CPG_MOD R9A07G054_GPU_CLK>,
-				 <&cpg CPG_MOD R9A07G054_GPU_AXI_CLK>,
-				 <&cpg CPG_MOD R9A07G054_GPU_ACE_CLK>;
-			clock-names = "gpu", "bus", "bus_ace";
-			power-domains = <&cpg>;
-			resets = <&cpg R9A07G054_GPU_RESETN>,
-				 <&cpg R9A07G054_GPU_AXI_RESETN>,
-				 <&cpg R9A07G054_GPU_ACE_RESETN>;
-			reset-names = "rst", "axi_rst", "ace_rst";
-			operating-points-v2 = <&gpu_opp_table>;
-		};
+&i2c2 {
+	compatible = "renesas,riic-r9a07g054", "renesas,riic-rz";
+};
 
-		gic: interrupt-controller@11900000 {
-			compatible = "arm,gic-v3";
-			#interrupt-cells = <3>;
-			#address-cells = <0>;
-			interrupt-controller;
-			reg = <0x0 0x11900000 0 0x40000>,
-			      <0x0 0x11940000 0 0x60000>;
-			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
-		};
+&i2c3 {
+	compatible = "renesas,riic-r9a07g054", "renesas,riic-rz";
+};
 
-		sdhi0: mmc@11c00000 {
-			compatible = "renesas,sdhi-r9a07g054",
-				     "renesas,rcar-gen3-sdhi";
-			reg = <0x0 0x11c00000 0 0x10000>;
-			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD R9A07G054_SDHI0_IMCLK>,
-				 <&cpg CPG_MOD R9A07G054_SDHI0_CLK_HS>,
-				 <&cpg CPG_MOD R9A07G054_SDHI0_IMCLK2>,
-				 <&cpg CPG_MOD R9A07G054_SDHI0_ACLK>;
-			clock-names = "core", "clkh", "cd", "aclk";
-			resets = <&cpg R9A07G054_SDHI0_IXRST>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
+&adc {
+	compatible = "renesas,r9a07g054-adc", "renesas,rzg2l-adc";
+};
 
-		sdhi1: mmc@11c10000 {
-			compatible = "renesas,sdhi-r9a07g054",
-				     "renesas,rcar-gen3-sdhi";
-			reg = <0x0 0x11c10000 0 0x10000>;
-			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD R9A07G054_SDHI1_IMCLK>,
-				 <&cpg CPG_MOD R9A07G054_SDHI1_CLK_HS>,
-				 <&cpg CPG_MOD R9A07G054_SDHI1_IMCLK2>,
-				 <&cpg CPG_MOD R9A07G054_SDHI1_ACLK>;
-			clock-names = "core", "clkh", "cd", "aclk";
-			resets = <&cpg R9A07G054_SDHI1_IXRST>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
+&tsu {
+	compatible = "renesas,r9a07g054-tsu", "renesas,rzg2l-tsu";
+};
 
-		eth0: ethernet@11c20000 {
-			compatible = "renesas,r9a07g054-gbeth",
-				     "renesas,rzg2l-gbeth";
-			reg = <0 0x11c20000 0 0x10000>;
-			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "mux", "fil", "arp_ns";
-			phy-mode = "rgmii";
-			clocks = <&cpg CPG_MOD R9A07G054_ETH0_CLK_AXI>,
-				 <&cpg CPG_MOD R9A07G054_ETH0_CLK_CHI>,
-				 <&cpg CPG_CORE R9A07G054_CLK_HP>;
-			clock-names = "axi", "chi", "refclk";
-			resets = <&cpg R9A07G054_ETH0_RST_HW_N>;
-			power-domains = <&cpg>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
+&sbc {
+	compatible = "renesas,r9a07g054-rpc-if", "renesas,rzg2l-rpc-if";
+};
 
-		eth1: ethernet@11c30000 {
-			compatible = "renesas,r9a07g054-gbeth",
-				     "renesas,rzg2l-gbeth";
-			reg = <0 0x11c30000 0 0x10000>;
-			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "mux", "fil", "arp_ns";
-			phy-mode = "rgmii";
-			clocks = <&cpg CPG_MOD R9A07G054_ETH1_CLK_AXI>,
-				 <&cpg CPG_MOD R9A07G054_ETH1_CLK_CHI>,
-				 <&cpg CPG_CORE R9A07G054_CLK_HP>;
-			clock-names = "axi", "chi", "refclk";
-			resets = <&cpg R9A07G054_ETH1_RST_HW_N>;
-			power-domains = <&cpg>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
+&cpg {
+	compatible = "renesas,r9a07g054-cpg";
+};
 
-		phyrst: usbphy-ctrl@11c40000 {
-			compatible = "renesas,r9a07g054-usbphy-ctrl",
-				     "renesas,rzg2l-usbphy-ctrl";
-			reg = <0 0x11c40000 0 0x10000>;
-			clocks = <&cpg CPG_MOD R9A07G054_USB_PCLK>;
-			resets = <&cpg R9A07G054_USB_PRESETN>;
-			power-domains = <&cpg>;
-			#reset-cells = <1>;
-			status = "disabled";
-		};
+&sysc {
+	compatible = "renesas,r9a07g054-sysc";
+};
 
-		ohci0: usb@11c50000 {
-			compatible = "generic-ohci";
-			reg = <0 0x11c50000 0 0x100>;
-			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD R9A07G054_USB_PCLK>,
-				 <&cpg CPG_MOD R9A07G054_USB_U2H0_HCLK>;
-			resets = <&phyrst 0>,
-				 <&cpg R9A07G054_USB_U2H0_HRESETN>;
-			phys = <&usb2_phy0 1>;
-			phy-names = "usb";
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
+&pinctrl {
+	compatible = "renesas,r9a07g054-pinctrl", "renesas,r9a07g044-pinctrl";
+};
 
-		ohci1: usb@11c70000 {
-			compatible = "generic-ohci";
-			reg = <0 0x11c70000 0 0x100>;
-			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD R9A07G054_USB_PCLK>,
-				 <&cpg CPG_MOD R9A07G054_USB_U2H1_HCLK>;
-			resets = <&phyrst 1>,
-				 <&cpg R9A07G054_USB_U2H1_HRESETN>;
-			phys = <&usb2_phy1 1>;
-			phy-names = "usb";
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
+&irqc {
+	compatible = "renesas,r9a07g054-irqc", "renesas,rzg2l-irqc";
+};
 
-		ehci0: usb@11c50100 {
-			compatible = "generic-ehci";
-			reg = <0 0x11c50100 0 0x100>;
-			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD R9A07G054_USB_PCLK>,
-				 <&cpg CPG_MOD R9A07G054_USB_U2H0_HCLK>;
-			resets = <&phyrst 0>,
-				 <&cpg R9A07G054_USB_U2H0_HRESETN>;
-			phys = <&usb2_phy0 2>;
-			phy-names = "usb";
-			companion = <&ohci0>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
+&dmac {
+	compatible = "renesas,r9a07g054-dmac", "renesas,rz-dmac";
+};
 
-		ehci1: usb@11c70100 {
-			compatible = "generic-ehci";
-			reg = <0 0x11c70100 0 0x100>;
-			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD R9A07G054_USB_PCLK>,
-				 <&cpg CPG_MOD R9A07G054_USB_U2H1_HCLK>;
-			resets = <&phyrst 1>,
-				 <&cpg R9A07G054_USB_U2H1_HRESETN>;
-			phys = <&usb2_phy1 2>;
-			phy-names = "usb";
-			companion = <&ohci1>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
+&gpu {
+	compatible = "renesas,r9a07g054-mali", "arm,mali-bifrost";
+};
 
-		usb2_phy0: usb-phy@11c50200 {
-			compatible = "renesas,usb2-phy-r9a07g054",
-				     "renesas,rzg2l-usb2-phy";
-			reg = <0 0x11c50200 0 0x700>;
-			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD R9A07G054_USB_PCLK>,
-				 <&cpg CPG_MOD R9A07G054_USB_U2H0_HCLK>;
-			resets = <&phyrst 0>;
-			#phy-cells = <1>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
+&sdhi0 {
+	compatible = "renesas,sdhi-r9a07g054", "renesas,rcar-gen3-sdhi";
+};
 
-		usb2_phy1: usb-phy@11c70200 {
-			compatible = "renesas,usb2-phy-r9a07g054",
-				     "renesas,rzg2l-usb2-phy";
-			reg = <0 0x11c70200 0 0x700>;
-			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD R9A07G054_USB_PCLK>,
-				 <&cpg CPG_MOD R9A07G054_USB_U2H1_HCLK>;
-			resets = <&phyrst 1>;
-			#phy-cells = <1>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
+&sdhi1 {
+	compatible = "renesas,sdhi-r9a07g054", "renesas,rcar-gen3-sdhi";
+};
 
-		hsusb: usb@11c60000 {
-			compatible = "renesas,usbhs-r9a07g054",
-				     "renesas,rza2-usbhs";
-			reg = <0 0x11c60000 0 0x10000>;
-			interrupts = <GIC_SPI 100 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD R9A07G054_USB_PCLK>,
-				 <&cpg CPG_MOD R9A07G054_USB_U2P_EXR_CPUCLK>;
-			resets = <&phyrst 0>,
-				 <&cpg R9A07G054_USB_U2P_EXL_SYSRST>;
-			renesas,buswait = <7>;
-			phys = <&usb2_phy0 3>;
-			phy-names = "usb";
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
+&eth0 {
+	compatible = "renesas,r9a07g054-gbeth", "renesas,rzg2l-gbeth";
+};
 
-		wdt0: watchdog@12800800 {
-			compatible = "renesas,r9a07g054-wdt",
-				     "renesas,rzg2l-wdt";
-			reg = <0 0x12800800 0 0x400>;
-			clocks = <&cpg CPG_MOD R9A07G054_WDT0_PCLK>,
-				 <&cpg CPG_MOD R9A07G054_WDT0_CLK>;
-			clock-names = "pclk", "oscclk";
-			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "wdt", "perrout";
-			resets = <&cpg R9A07G054_WDT0_PRESETN>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
+&eth1 {
+	compatible = "renesas,r9a07g054-gbeth", "renesas,rzg2l-gbeth";
+};
 
-		wdt1: watchdog@12800c00 {
-			compatible = "renesas,r9a07g054-wdt",
-				     "renesas,rzg2l-wdt";
-			reg = <0 0x12800C00 0 0x400>;
-			clocks = <&cpg CPG_MOD R9A07G054_WDT1_PCLK>,
-				 <&cpg CPG_MOD R9A07G054_WDT1_CLK>;
-			clock-names = "pclk", "oscclk";
-			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "wdt", "perrout";
-			resets = <&cpg R9A07G054_WDT1_PRESETN>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
+&phyrst {
+	compatible = "renesas,r9a07g054-usbphy-ctrl", "renesas,rzg2l-usbphy-ctrl";
+};
 
-		ostm0: timer@12801000 {
-			compatible = "renesas,r9a07g054-ostm",
-				     "renesas,ostm";
-			reg = <0x0 0x12801000 0x0 0x400>;
-			interrupts = <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
-			clocks = <&cpg CPG_MOD R9A07G054_OSTM0_PCLK>;
-			resets = <&cpg R9A07G054_OSTM0_PRESETZ>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
+&usb2_phy0 {
+	compatible = "renesas,usb2-phy-r9a07g054", "renesas,rzg2l-usb2-phy";
+};
 
-		ostm1: timer@12801400 {
-			compatible = "renesas,r9a07g054-ostm",
-				     "renesas,ostm";
-			reg = <0x0 0x12801400 0x0 0x400>;
-			interrupts = <GIC_SPI 47 IRQ_TYPE_EDGE_RISING>;
-			clocks = <&cpg CPG_MOD R9A07G054_OSTM1_PCLK>;
-			resets = <&cpg R9A07G054_OSTM1_PRESETZ>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
+&usb2_phy1 {
+	compatible = "renesas,usb2-phy-r9a07g054", "renesas,rzg2l-usb2-phy";
+};
 
-		ostm2: timer@12801800 {
-			compatible = "renesas,r9a07g054-ostm",
-				     "renesas,ostm";
-			reg = <0x0 0x12801800 0x0 0x400>;
-			interrupts = <GIC_SPI 48 IRQ_TYPE_EDGE_RISING>;
-			clocks = <&cpg CPG_MOD R9A07G054_OSTM2_PCLK>;
-			resets = <&cpg R9A07G054_OSTM2_PRESETZ>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
-	};
+&hsusb {
+	compatible = "renesas,usbhs-r9a07g054", "renesas,rza2-usbhs";
+};
 
-	thermal-zones {
-		cpu-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-			thermal-sensors = <&tsu 0>;
-			sustainable-power = <717>;
+&wdt0 {
+	compatible = "renesas,r9a07g054-wdt", "renesas,rzg2l-wdt";
+};
 
-			cooling-maps {
-				map0 {
-					trip = <&target>;
-					cooling-device = <&cpu0 0 2>;
-					contribution = <1024>;
-				};
-			};
+&wdt1 {
+	compatible = "renesas,r9a07g054-wdt", "renesas,rzg2l-wdt";
+};
 
-			trips {
-				sensor_crit: sensor-crit {
-					temperature = <125000>;
-					hysteresis = <1000>;
-					type = "critical";
-				};
+&ostm0 {
+	compatible = "renesas,r9a07g054-ostm", "renesas,ostm";
+};
 
-				target: trip-point {
-					temperature = <100000>;
-					hysteresis = <1000>;
-					type = "passive";
-				};
-			};
-		};
-	};
+&ostm1 {
+	compatible = "renesas,r9a07g054-ostm", "renesas,ostm";
+};
 
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
-	};
+&ostm2 {
+	compatible = "renesas,r9a07g054-ostm", "renesas,ostm";
 };
-- 
2.25.1

