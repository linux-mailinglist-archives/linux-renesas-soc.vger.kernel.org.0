Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82ADF78A4E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 06:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjH1EPN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 00:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbjH1EOq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 00:14:46 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C9326130
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Aug 2023 21:14:43 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,206,1688396400"; 
   d="scan'208";a="174158847"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Aug 2023 13:14:40 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4FE2040071EF;
        Mon, 28 Aug 2023 13:14:40 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/2] arm64: dts: renesas: r8a779f0: Add PCIe Host and Endpoint nodes
Date:   Mon, 28 Aug 2023 13:14:33 +0900
Message-Id: <20230828041434.2747699-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230828041434.2747699-1-yoshihiro.shimoda.uh@renesas.com>
References: <20230828041434.2747699-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add PCIe Host and Endpoint nodes for R-Car S4-8 (R8A779F0).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 128 ++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 0059c9c580f3..a95e45bc791f 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -262,6 +262,20 @@ extalr_clk: extalr {
 		clock-frequency = <0>;
 	};
 
+	pcie0_clkref: pcie0_clkref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	pcie1_clkref: pcie1_clkref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
 	pmu_a55 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
@@ -726,6 +740,120 @@ hscif3: serial@e66a0000 {
 			status = "disabled";
 		};
 
+		pciec0: pcie@e65d0000 {
+			compatible = "renesas,r8a779f0-pcie",
+				     "renesas,rcar-gen4-pcie";
+			reg = <0 0xe65d0000 0 0x1000>, <0 0xe65d2000 0 0x0800>,
+			      <0 0xe65d3000 0 0x2000>, <0 0xe65d5000 0 0x1200>,
+			      <0 0xe65d6200 0 0x1100>, <0 0xfe000000 0 0x400000>;
+			reg-names = "dbi", "dbi2", "atu", "dma", "app", "config";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			ranges = <0x82000000 0 0x30000000 0 0x30000000 0 0x10000000>;
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
+			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi", "dma", "sft_ce", "app";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 624>, <&pcie0_clkref>;
+			clock-names = "core", "ref";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 624>;
+			reset-names = "pwr";
+			num-lanes = <2>;
+			snps,enable-cdm-check;
+			max-link-speed = <4>;
+			status = "disabled";
+		};
+
+		pciec1: pcie@e65d8000 {
+			compatible = "renesas,r8a779f0-pcie",
+				     "renesas,rcar-gen4-pcie";
+			reg = <0 0xe65d8000 0 0x1000>, <0 0xe65da000 0 0x0800>,
+			      <0 0xe65db000 0 0x2000>, <0 0xe65dd000 0 0x1200>,
+			      <0 0xe65de200 0 0x1100>, <0 0xee900000 0 0x400000>;
+			reg-names = "dbi", "dbi2", "atu", "dma", "app", "config";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			ranges = <0x82000000 0 0xc0000000 0 0xc0000000 0 0x10000000>;
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
+			interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi", "dma", "sft_ce", "app";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &gic GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 625>, <&pcie1_clkref>;
+			clock-names = "core", "ref";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 625>;
+			reset-names = "pwr";
+			num-lanes = <2>;
+			snps,enable-cdm-check;
+			max-link-speed = <4>;
+			status = "disabled";
+		};
+
+		pciec0_ep: pcie-ep@e65d0000 {
+			compatible = "renesas,r8a779f0-pcie-ep",
+				     "renesas,rcar-gen4-pcie-ep";
+			reg = <0 0xe65d0000 0 0x2000>, <0 0xe65d2000 0 0x1000>,
+			      <0 0xe65d3000 0 0x2000>, <0 0xe65d5000 0 0x1200>,
+			      <0 0xe65d6200 0 0x0e00>, <0 0xfe000000 0 0x400000>;
+			reg-names = "dbi", "dbi2", "atu", "dma", "app", "addr_space";
+			interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma", "sft_ce", "app";
+			clocks = <&cpg CPG_MOD 624>, <&pcie0_clkref>;
+			clock-names = "core", "ref";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 624>;
+			reset-names = "pwr";
+			num-lanes = <2>;
+			max-link-speed = <4>;
+			max-functions = /bits/ 8 <2>;
+			status = "disabled";
+		};
+
+		pciec1_ep: pcie-ep@e65d8000 {
+			compatible = "renesas,r8a779f0-pcie-ep",
+				     "renesas,rcar-gen4-pcie-ep";
+			reg = <0 0xe65d8000 0 0x2000>, <0 0xe65da000 0 0x1000>,
+			      <0 0xe65db000 0 0x2000>, <0 0xe65dd000 0 0x1200>,
+			      <0 0xe65de200 0 0x0e00>, <0 0xee900000 0 0x400000>;
+			reg-names = "dbi", "dbi2", "atu", "dma", "app", "addr_space";
+			interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma", "sft_ce", "app";
+			clocks = <&cpg CPG_MOD 625>, <&pcie1_clkref>;
+			clock-names = "core", "ref";
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 625>;
+			reset-names = "pwr";
+			num-lanes = <2>;
+			max-link-speed = <4>;
+			max-functions = /bits/ 8 <2>;
+			status = "disabled";
+		};
+
 		ufs: ufs@e6860000 {
 			compatible = "renesas,r8a779f0-ufs";
 			reg = <0 0xe6860000 0 0x100>;
-- 
2.25.1

