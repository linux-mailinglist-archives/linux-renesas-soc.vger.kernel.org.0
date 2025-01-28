Return-Path: <linux-renesas-soc+bounces-12644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3959A208EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 258B53A60B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE31E19D090;
	Tue, 28 Jan 2025 10:48:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D9E19340D;
	Tue, 28 Jan 2025 10:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738061301; cv=none; b=dvzhI4w0/+9pJu1JiHratD6hS2MWX/ymOo1GC/9coRj4ynLt956P+SUs6y9a5Deyn36zxgiGn58CAdoNH9ZX61OZdQ6Is+jX+DJIKbvK3Vv4ul6Seyaq1JQI4cWBn8p+5Gxbhx8CSJ8JSgcPUBc9L/AEKx0eaoyz+TX8CcLZCUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738061301; c=relaxed/simple;
	bh=DuYLcu4oh2l1ypcpXuc+en1YT4M5z6jn6b33ze7xF9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TlFBMuVjO37S/0WpdRFT6bmSKF0QXa8Ieio2aVu+jvcuPrGeEEG9tjA15fARDGU+nN/Ud+q07xrP5DNGeZU92mz1I2nbc5QS3fDMOzfnvAsOEp2ui485mNjaJrP0ckeyoYhVc+/jrsGD1PD5Sgio9S1TUSTSKl9aBKsPlOkfnqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: hG8JVvdMQDSFgxEBDD81Mg==
X-CSE-MsgGUID: wFMN+ys6RFCrBjoI5RHIdA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Jan 2025 19:48:18 +0900
Received: from localhost.localdomain (unknown [10.226.93.131])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9A63B41FB5AD;
	Tue, 28 Jan 2025 19:47:58 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v3 13/13] arm64: dts: renesas: r9a09g047: Add icu node
Date: Tue, 28 Jan 2025 10:47:03 +0000
Message-ID: <20250128104714.80807-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add interrupt control node to RZ/G3E ("R9A09G047") SoC DTSI
and add icu as interrupt-parent of pincontrol.

Also, define the ICU IRQs for board DT users.

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Collected tags.
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index c93aa16d0a6e..2023f70d3329 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -8,6 +8,24 @@
 #include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
+#define RZG3E_NMI	0
+#define RZG3E_IRQ0	1
+#define RZG3E_IRQ1	2
+#define RZG3E_IRQ2	3
+#define RZG3E_IRQ3	4
+#define RZG3E_IRQ4	5
+#define RZG3E_IRQ5	6
+#define RZG3E_IRQ6	7
+#define RZG3E_IRQ7	8
+#define RZG3E_IRQ8	9
+#define RZG3E_IRQ9	10
+#define RZG3E_IRQ10	11
+#define RZG3E_IRQ11	12
+#define RZG3E_IRQ12	13
+#define RZG3E_IRQ13	14
+#define RZG3E_IRQ14	15
+#define RZG3E_IRQ15	16
+
 / {
 	compatible = "renesas,r9a09g047";
 	#address-cells = <2>;
@@ -131,6 +149,95 @@ soc: soc {
 		#size-cells = <2>;
 		ranges;
 
+		icu: interrupt-controller@10400000 {
+			compatible = "renesas,r9a09g047-icu";
+			reg = <0 0x10400000 0 0x10000>;
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 263 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "nmi",
+					  "port_irq0", "port_irq1", "port_irq2",
+					  "port_irq3", "port_irq4", "port_irq5",
+					  "port_irq6", "port_irq7", "port_irq8",
+					  "port_irq9", "port_irq10", "port_irq11",
+					  "port_irq12", "port_irq13", "port_irq14",
+					  "port_irq15",
+					  "tint0", "tint1", "tint2", "tint3",
+					  "tint4", "tint5", "tint6", "tint7",
+					  "tint8", "tint9", "tint10", "tint11",
+					  "tint12", "tint13", "tint14", "tint15",
+					  "tint16", "tint17", "tint18", "tint19",
+					  "tint20", "tint21", "tint22", "tint23",
+					  "tint24", "tint25", "tint26", "tint27",
+					  "tint28", "tint29", "tint30", "tint31",
+					  "int-ca55-0", "int-ca55-1",
+					  "int-ca55-2", "int-ca55-3",
+					  "icu-error-ca55",
+					  "gpt-u0-gtciada", "gpt-u0-gtciadb",
+					  "gpt-u1-gtciada", "gpt-u1-gtciadb";
+			clocks = <&cpg CPG_MOD 0x5>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0x36>;
+		};
+
 		pinctrl: pinctrl@10410000 {
 			compatible = "renesas,r9a09g047-pinctrl";
 			reg = <0 0x10410000 0 0x10000>;
@@ -140,6 +247,7 @@ pinctrl: pinctrl@10410000 {
 			gpio-ranges = <&pinctrl 0 0 232>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
+			interrupt-parent = <&icu>;
 			power-domains = <&cpg>;
 			resets = <&cpg 0xa5>, <&cpg 0xa6>;
 		};
-- 
2.43.0


