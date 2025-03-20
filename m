Return-Path: <linux-renesas-soc+bounces-14700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2010A6AB46
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 17:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 335E98A78C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 16:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DD32222AC;
	Thu, 20 Mar 2025 16:41:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA19D221F33;
	Thu, 20 Mar 2025 16:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742488894; cv=none; b=F3WCOTgDFVRs68eyjyg7sbkkPCRQIE2EgHqW63VgcDOervXc9HVoBxrwvM6xL4CWt2xm8f1kozHsubhkvgcMlvNZflF/wrjHoRgarJIQSHKu3Uluu2Gxol4fgpTqYDghhWfHfKLEIhtvB+t+HpANAvmGqYG87fNeQnx85MuJS4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742488894; c=relaxed/simple;
	bh=kztYI4lTgmXoH9G3B0QADdnl61quhlzjNkyX0oAig/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ha3TuEiNTovwtbeFEG8TP0JVJeoDcGtaT+TgaBwHPEqqviO2MckR9L/p7ZwxNdSbNf/SDAcxaMJN2rGrIAuNG/TCIEUjVxmKEEOWj5YzL9X6CCSiQY+prQk7RY5VY+/VHjqY+M90R45ok9ie76sHs37ihelawy5GWMUi2vTJQIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: QCjPX9rRQ3+jHt7lvhQrkQ==
X-CSE-MsgGUID: bGEcIBFQR9OlNdt6zeGkjw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Mar 2025 01:41:30 +0900
Received: from localhost.localdomain (unknown [10.226.93.24])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 90E24400721F;
	Fri, 21 Mar 2025 01:41:27 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 1/3] arm64: dts: renesas: r9a09g047: Add CANFD node
Date: Thu, 20 Mar 2025 16:41:16 +0000
Message-ID: <20250320164121.193857-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320164121.193857-1-biju.das.jz@bp.renesas.com>
References: <20250320164121.193857-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CANFD node to RZ/G3E ("R9A09G047") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Replaced integer with hexadecimal for module clock and reset numbers.
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 4bc0b77f721a..b8a78adcdba2 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -272,6 +272,66 @@ scif0: serial@11c01400 {
 			status = "disabled";
 		};
 
+		canfd: can@12440000 {
+			compatible = "renesas,r9a09g047-canfd";
+			reg = <0 0x12440000 0 0x40000>;
+			interrupts = <GIC_SPI 709 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 710 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 703 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 711 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 698 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 704 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 712 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 705 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 713 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 714 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 701 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 715 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g_err", "g_recc",
+					  "ch0_err", "ch0_rec", "ch0_trx",
+					  "ch1_err", "ch1_rec", "ch1_trx",
+					  "ch2_err", "ch2_rec", "ch2_trx",
+					  "ch3_err", "ch3_rec", "ch3_trx",
+					  "ch4_err", "ch4_rec", "ch4_trx",
+					  "ch5_err", "ch5_rec", "ch5_trx";
+			clocks = <&cpg CPG_MOD 0x9c>, <&cpg CPG_MOD 0x9d>,
+				 <&cpg CPG_MOD 0x9e>;
+			clock-names = "fck", "ram_clk", "can_clk";
+			assigned-clocks = <&cpg CPG_MOD 0x9e>;
+			assigned-clock-rates = <80000000>;
+			resets = <&cpg 0xa1>, <&cpg 0xa2>;
+			reset-names = "rstp_n", "rstc_n";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			channel0 {
+				status = "disabled";
+			};
+			channel1 {
+				status = "disabled";
+			};
+			channel2 {
+				status = "disabled";
+			};
+			channel3 {
+				status = "disabled";
+			};
+			channel4 {
+				status = "disabled";
+			};
+			channel5 {
+				status = "disabled";
+			};
+		};
+
 		wdt1: watchdog@14400000 {
 			compatible = "renesas,r9a09g047-wdt", "renesas,r9a09g057-wdt";
 			reg = <0 0x14400000 0 0x400>;
-- 
2.43.0


