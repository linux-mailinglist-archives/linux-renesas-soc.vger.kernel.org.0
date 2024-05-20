Return-Path: <linux-renesas-soc+bounces-5411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A8A8C999C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2024 09:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C64731C20C65
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2024 07:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C591B7F4;
	Mon, 20 May 2024 07:59:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74C51CA81
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 May 2024 07:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716191981; cv=none; b=rdKXZAOhmEA4lHAkXwTG4uyy1WaAOZgLonELDkyhm0Yl/1+wSAq7LMT9OHCfkjioXwQVicoccf23v/rXhdWICRnsclibL1pd/sZSnvj2Ow/h1U+enoiLRO/fTXfqWDMrLJetkj7sN5cNlnMyp2EATZuOzkHo6OApldW4BV8YVrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716191981; c=relaxed/simple;
	bh=Omf1lWs1nsQ3p33vbw/x+VyczADrLrljPv78LzpxAsg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W4S9SXqEsn1gVg+J2ImAnw+QOhmGF/W2z163NAqEdxqdtPysI+rysVpOPUgZjoYAu1ek12ApwaKqCJIMXi2Jda3fsoJmv362cuhbsjdgTR6pfzQh5335NT7mNChWL0NuW8RySEpXIXph5zwJkc5Tzo3HQiGjMDPr+A4/sV/RdBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.08,174,1712588400"; 
   d="scan'208";a="209033455"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 20 May 2024 16:59:38 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6A2DD41C29CE;
	Mon, 20 May 2024 16:59:38 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/2] arm64: dts: renesas: r8a779g0: Add PCIe Host and Endpoint nodes
Date: Mon, 20 May 2024 16:59:30 +0900
Message-Id: <20240520075931.126476-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240520075931.126476-1-yoshihiro.shimoda.uh@renesas.com>
References: <20240520075931.126476-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PCIe Host and Endpoint nodes for R-Car V4H (R8A779G0).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 134 ++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 9bc542bc6169..7d33214d99f2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -175,6 +175,20 @@ extalr_clk: extalr {
 		clock-frequency = <0>;
 	};
 
+	pcie0_clkref: pcie0-clkref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	pcie1_clkref: pcie1-clkref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
 	pmu_a76 {
 		compatible = "arm,cortex-a76-pmu";
 		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
@@ -723,6 +737,126 @@ hscif3: serial@e66a0000 {
 			status = "disabled";
 		};
 
+		pciec0: pcie@e65d0000 {
+			compatible = "renesas,r8a779g0-pcie",
+				     "renesas,rcar-gen4-pcie";
+			reg = <0 0xe65d0000 0 0x1000>, <0 0xe65d2000 0 0x0800>,
+			      <0 0xe65d3000 0 0x2000>, <0 0xe65d5000 0 0x1200>,
+			      <0 0xe65d6200 0 0x0e00>, <0 0xe65d7000 0 0x0400>,
+			      <0 0xfe000000 0 0x400000>;
+			reg-names = "dbi", "dbi2", "atu", "dma", "app", "phy", "config";
+			interrupts = <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi", "dma", "sft_ce", "app";
+			clocks = <&cpg CPG_MOD 624>, <&pcie0_clkref>;
+			clock-names = "core", "ref";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 624>;
+			reset-names = "pwr";
+			max-link-speed = <4>;
+			num-lanes = <2>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			ranges = <0x01000000 0 0x00000000 0 0xfe000000 0 0x00400000>,
+				 <0x02000000 0 0x30000000 0 0x30000000 0 0x10000000>;
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
+			snps,enable-cdm-check;
+			status = "disabled";
+		};
+
+		pciec1: pcie@e65d8000 {
+			compatible = "renesas,r8a779g0-pcie",
+				     "renesas,rcar-gen4-pcie";
+			reg = <0 0xe65d8000 0 0x1000>, <0 0xe65da000 0 0x0800>,
+			      <0 0xe65db000 0 0x2000>, <0 0xe65dd000 0 0x1200>,
+			      <0 0xe65de200 0 0x0e00>, <0 0xe65df000 0 0x0400>,
+			      <0 0xee900000 0 0x400000>;
+			reg-names = "dbi", "dbi2", "atu", "dma", "app", "phy", "config";
+			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi", "dma", "sft_ce", "app";
+			clocks = <&cpg CPG_MOD 625>, <&pcie1_clkref>;
+			clock-names = "core", "ref";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 625>;
+			reset-names = "pwr";
+			max-link-speed = <4>;
+			num-lanes = <2>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			ranges = <0x01000000 0 0x00000000 0 0xee900000 0 0x00400000>,
+				 <0x02000000 0 0xc0000000 0 0xc0000000 0 0x10000000>;
+			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
+			snps,enable-cdm-check;
+			status = "disabled";
+		};
+
+		pciec0_ep: pcie-ep@e65d0000 {
+			compatible = "renesas,r8a779g0-pcie-ep",
+				     "renesas,rcar-gen4-pcie-ep";
+			reg = <0 0xe65d0000 0 0x2000>, <0 0xe65d2000 0 0x1000>,
+			      <0 0xe65d3000 0 0x2000>, <0 0xe65d5000 0 0x1200>,
+			      <0 0xe65d6200 0 0x0e00>, <0 0xe65d7000 0 0x0400>,
+			      <0 0xfe000000 0 0x400000>;
+			reg-names = "dbi", "dbi2", "atu", "dma", "app", "phy", "addr_space";
+			interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma", "sft_ce", "app";
+			clocks = <&cpg CPG_MOD 624>, <&pcie0_clkref>;
+			clock-names = "core", "ref";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 624>;
+			reset-names = "pwr";
+			max-link-speed = <4>;
+			num-lanes = <2>;
+			max-functions = /bits/ 8 <2>;
+			status = "disabled";
+		};
+
+		pciec1_ep: pcie-ep@e65d8000 {
+			compatible = "renesas,r8a779g0-pcie-ep",
+				     "renesas,rcar-gen4-pcie-ep";
+			reg = <0 0xe65d8000 0 0x2000>, <0 0xe65da000 0 0x1000>,
+			      <0 0xe65db000 0 0x2000>, <0 0xe65dd000 0 0x1200>,
+			      <0 0xe65de200 0 0x0e00>, <0 0xe65df000 0 0x0400>,
+			      <0 0xee900000 0 0x400000>;
+			reg-names = "dbi", "dbi2", "atu", "dma", "app", "phy", "addr_space";
+			interrupts = <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma", "sft_ce", "app";
+			clocks = <&cpg CPG_MOD 625>, <&pcie1_clkref>;
+			clock-names = "core", "ref";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 625>;
+			reset-names = "pwr";
+			max-link-speed = <4>;
+			num-lanes = <2>;
+			max-functions = /bits/ 8 <2>;
+			status = "disabled";
+		};
+
 		canfd: can@e6660000 {
 			compatible = "renesas,r8a779g0-canfd",
 				     "renesas,rcar-gen4-canfd";
-- 
2.25.1


