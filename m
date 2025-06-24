Return-Path: <linux-renesas-soc+bounces-18680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8001AAE6F81
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 21:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74DE77B22BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D14C2E92A8;
	Tue, 24 Jun 2025 19:23:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30E02EBB8D;
	Tue, 24 Jun 2025 19:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793025; cv=none; b=EvfrWBKhB0J4RPep1/lqARg11J3dMW9e6fz6syUv/v5hWUn7QiI8CbJZ/mifkfRU7nYgB0zez+fvkSlcOTB5MR6g4cTnPIK65cHfhWIEkxpejX+IkRgLq4fQ8h4fzdHXGV83u7ceLM+IyRovLH3mymdG+howReP4P51DAvZaSyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793025; c=relaxed/simple;
	bh=PlcAM2qhzIFWKcx23OZO4BzDOXwu5EK7j3B56nLLiK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=un4ZHsHKE5NRT29iMpAiTZK9l93/g5P2d5Udy7NNAjbUiSIUKD5N2il+/hBvOuCSOi3AIJMjumGx/WGKC7ab1UaTjluKN352Kz+5J8QVs3PurrYR2s9ij+IuczM3qYACeUUXeYsCzPduDGMAwl7zx4w1xqAWKKAX5A+Dm93w1aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: Uf6t76tmT1mnA59w9SX47Q==
X-CSE-MsgGUID: 1K2++EtIRSOonD9na/jdQA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jun 2025 04:23:42 +0900
Received: from mulinux.example.org (unknown [10.26.240.23])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7A2EB4003FBF;
	Wed, 25 Jun 2025 04:23:38 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 6/6] arm64: dts: renesas: r9a09g057: Add RSPI nodes
Date: Tue, 24 Jun 2025 20:23:04 +0100
Message-Id: <20250624192304.338979-7-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624192304.338979-1-fabrizio.castro.jz@renesas.com>
References: <20250624192304.338979-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for the RSPI IPs found in the Renesas RZ/V2H(P) SoC.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 45aedd62a259..ae1f88b7aac5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -586,6 +586,69 @@ scif: serial@11c01400 {
 			status = "disabled";
 		};
 
+		rspi0: spi@12800000 {
+			compatible = "renesas,r9a09g057-rspi";
+			reg = <0x0 0x12800000 0x0 0x400>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 107 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 500 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 501 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD 0x54>,
+				 <&cpg CPG_MOD 0x55>,
+				 <&cpg CPG_MOD 0x56>;
+			clock-names = "pclk", "pclk_sfr", "tclk";
+			resets = <&cpg 0x7b>, <&cpg 0x7c>;
+			reset-names = "presetn", "tresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rspi1: spi@12800400 {
+			compatible = "renesas,r9a09g057-rspi";
+			reg = <0x0 0x12800400 0x0 0x400>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 502 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 503 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD 0x57>,
+				 <&cpg CPG_MOD 0x58>,
+				 <&cpg CPG_MOD 0x59>;
+			clock-names = "pclk", "pclk_sfr", "tclk";
+			resets = <&cpg 0x7d>, <&cpg 0x7e>;
+			reset-names = "presetn", "tresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rspi2: spi@12800800 {
+			compatible = "renesas,r9a09g057-rspi";
+			reg = <0x0 0x12800800 0x0 0x400>;
+			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 113 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 504 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 505 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD 0x5a>,
+				 <&cpg CPG_MOD 0x5b>,
+				 <&cpg CPG_MOD 0x5c>;
+			clock-names = "pclk", "pclk_sfr", "tclk";
+			resets = <&cpg 0x7f>, <&cpg 0x80>;
+			reset-names = "presetn", "tresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@14400400 {
 			compatible = "renesas,riic-r9a09g057";
 			reg = <0 0x14400400 0 0x400>;
-- 
2.34.1


