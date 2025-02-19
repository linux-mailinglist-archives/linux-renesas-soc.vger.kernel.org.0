Return-Path: <linux-renesas-soc+bounces-13310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59909A3ACB7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 00:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E88A53B0D8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 23:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811AD1DE4CD;
	Tue, 18 Feb 2025 23:43:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD511DF267;
	Tue, 18 Feb 2025 23:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739922223; cv=none; b=J2AualkSpCdM3HXXXt9VaOzR6rhET1/5lop/mAqtg1EYMwF+KGjopAeUDjpMB0mQrYKN0ClZ7NCCc2LV98z8Ln9kRmmUAk6VLBSYhTCNcsj5F9o/b2iBgBqfycaQeMUcjb6vsOjjv4VToS7Z1YkHzynzYQ23FbvcUVJy50dsQcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739922223; c=relaxed/simple;
	bh=PzVh2UYRDrFSgcPZz+IN0YUVEm+4PmqFc5hpCubpJRI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DnYzXhVuMYsLK13X+JiZmSG2rgToAPEPCcAoB9qA4oi7JyBFxycpiQ0ETEuU7Ux/WYv6b92p/7y+5+iL0ijdVPiSjxM189vT1roSx9uowAe9Gt6eIo+QP1aCg+I8sXqolyBLrkOn1r6RBL6nP1MJHaHHeuKFd04mwSDMZ5KMLrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: H22OX5uQQpqu2fByWFYzKw==
X-CSE-MsgGUID: 5vmMer5nRsypC+oqKvlSeA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Feb 2025 08:43:39 +0900
Received: from mulinux.example.org (unknown [10.226.92.65])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6529A40FDEC8;
	Wed, 19 Feb 2025 08:43:36 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 7/7] arm64: dts: renesas: r9a09g057: Add DMAC nodes
Date: Tue, 18 Feb 2025 23:43:04 +0000
Message-Id: <20250218234305.700317-8-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218234305.700317-1-fabrizio.castro.jz@renesas.com>
References: <20250218234305.700317-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for the DMAC IPs found on the Renesas RZ/V2H(P) SoC.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
v2->v3:
* No change.
v1->v2:
* No change.
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 165 +++++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 1c550b22b164..0a7d0c801e32 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -252,6 +252,171 @@ sys: system-controller@10430000 {
 			status = "disabled";
 		};
 
+		dmac0: dma-controller@11400000 {
+			compatible = "renesas,r9a09g057-dmac";
+			reg = <0 0x11400000 0 0x10000>;
+			interrupts = <GIC_SPI 499 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 89  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 90  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 91  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 92  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 93  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 94  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 95  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 96  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 97  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 98  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 99  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 100 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 101 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 103 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 104 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 0x0>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0x31>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			renesas,icu = <&icu 4>;
+		};
+
+		dmac1: dma-controller@14830000 {
+			compatible = "renesas,r9a09g057-dmac";
+			reg = <0 0x14830000 0 0x10000>;
+			interrupts = <GIC_SPI 495 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 25  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 26  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 27  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 28  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 29  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 30  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 31  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 32  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 33  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 34  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 35  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 36  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 37  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 38  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 39  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 40  IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 0x1>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0x32>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			renesas,icu = <&icu 0>;
+		};
+
+		dmac2: dma-controller@14840000 {
+			compatible = "renesas,r9a09g057-dmac";
+			reg = <0 0x14840000 0 0x10000>;
+			interrupts = <GIC_SPI 496 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 41  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 42  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 43  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 44  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 45  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 46  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 47  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 48  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 49  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 50  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 51  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 52  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 53  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 54  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 55  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 56  IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 0x2>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0x33>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			renesas,icu = <&icu 1>;
+		};
+
+		dmac3: dma-controller@12000000 {
+			compatible = "renesas,r9a09g057-dmac";
+			reg = <0 0x12000000 0 0x10000>;
+			interrupts = <GIC_SPI 497 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 57  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 58  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 59  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 60  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 61  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 62  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 63  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 64  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 65  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 66  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 67  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 68  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 69  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 70  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 71  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 72  IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 0x3>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0x34>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			renesas,icu = <&icu 2>;
+		};
+
+		dmac4: dma-controller@12010000 {
+			compatible = "renesas,r9a09g057-dmac";
+			reg = <0 0x12010000 0 0x10000>;
+			interrupts = <GIC_SPI 498 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 73  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 74  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 75  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 76  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 77  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 78  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 79  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 80  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 81  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 82  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 83  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 84  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 85  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 86  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 87  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 88  IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 0x4>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0x35>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			renesas,icu = <&icu 3>;
+		};
+
 		ostm0: timer@11800000 {
 			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
 			reg = <0x0 0x11800000 0x0 0x1000>;
-- 
2.34.1


