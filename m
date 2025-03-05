Return-Path: <linux-renesas-soc+bounces-13984-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BE9A4F26E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 01:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A7C51890558
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 00:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46993FBB3;
	Wed,  5 Mar 2025 00:21:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A111EB5B;
	Wed,  5 Mar 2025 00:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741134118; cv=none; b=LcEFmMcdZfqK0HAr6gECKPD8N4D5SGkrCCAuLposg0DjM66vgy1lD17fyhdfjPUA2YU9RO1ceHZIpyXf2s5vpLym84u1MSasicKrEAj2TaM7xHKaqun8CQm10Qdvt8rRW7iKOefFIRr7Ds0HoG5MEiz7PYvaONFlPs70lYuAcvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741134118; c=relaxed/simple;
	bh=Qo1BcW56hrEtONgesS/g7YidmDyE/zHFCRpnu8DSm+4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=grX/W15XBT0+in7AoTW9RympGHLNCk5abp+01jMhqT6ls9wDYTLYzIMF5Ssm9n9aX4pJ87By2d7fiIOHdkmkjrUqN9FQ0JFkYgSG93MRlmYNJCvZd/p0wY6sN08uLOw6qa/5tQm4fTvCLYTJO4rUcmRWqwv0ulqWbVWRBUhKUIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 5gTCNhyQSweG1IiERbtLeQ==
X-CSE-MsgGUID: iKhDGxMUTxK3MkZFSZvQPQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 05 Mar 2025 09:21:49 +0900
Received: from mulinux.home (unknown [10.226.92.17])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 706FF404D874;
	Wed,  5 Mar 2025 09:21:46 +0900 (JST)
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
Subject: [PATCH v5 6/6] arm64: dts: renesas: r9a09g057: Add DMAC nodes
Date: Wed,  5 Mar 2025 00:21:12 +0000
Message-Id: <20250305002112.5289-7-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305002112.5289-1-fabrizio.castro.jz@renesas.com>
References: <20250305002112.5289-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for the DMAC IPs found on the Renesas RZ/V2H(P) SoC.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4->v5:
* Collected tags.
v3->v4:
* No change.
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


