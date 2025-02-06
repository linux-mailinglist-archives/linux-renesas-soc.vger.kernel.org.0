Return-Path: <linux-renesas-soc+bounces-12911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B56C8A2AA32
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 14:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FC7E3A3328
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 13:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503AC1EA7F7;
	Thu,  6 Feb 2025 13:41:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7601EA7E6;
	Thu,  6 Feb 2025 13:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738849282; cv=none; b=lZqTkz1Z4rfq9fKC80slqPwnrhd0KQ1EeD2PLg9jOAo0mbqfzO5YzaNgWySguMkvx/qoJOKSjebTi0LCzqO4RtJ9Vmy8bNxxamGMwMSfx9x6CUV/NSbnhlmUPjsd4suroOjuTNdzATCZdzcliD9keNkaZywLmP5+IYcw0SLTBLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738849282; c=relaxed/simple;
	bh=njQ0w/Q67Luy8msFHE6OWV345+7CejRyYFpOSIibU0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKjYTFHi+mbzAjSJaP5ow56ANsnhRQPjHuWrrORYPqf126AuaRx81s+/hI5Ox1Jzspb0pdsVjXeXPHEJoOqn0G73h0E5rFhmRSWXuxpVyP+cmqFv9CHsIaBtVpA+5ytpMZa4lbdRDuAjmwJ3Y0nq3Q0SVOFJn7qwGvJHOWwINts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: rmPHV+egSpS9nfCpB35sCw==
X-CSE-MsgGUID: YLb/JQR9QtWGYzF7Eytt4A==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Feb 2025 22:41:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.229])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3ADE3401E51E;
	Thu,  6 Feb 2025 22:41:04 +0900 (JST)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 4/8] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
Date: Thu,  6 Feb 2025 13:40:28 +0000
Message-ID: <20250206134047.67866-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SDHI0-SDHI2 nodes to RZ/G3E ("R9A09G047") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Renamed internal regulator labels vqmmc_sdhi{0..2}->sdhi{0..2}_vqmmc.
v1->v2:
 * Status of internal regulator is disabled in the SoC .dtsi. Override
   the status in the board DTS when needed.
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index c93aa16d0a6e..fe5eec87f2a5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -410,6 +410,66 @@ gic: interrupt-controller@14900000 {
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
+
+		sdhi0: mmc@15c00000  {
+			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x15c00000 0 0x10000>;
+			interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xa3>, <&cpg CPG_MOD 0xa5>,
+				 <&cpg CPG_MOD 0xa4>, <&cpg CPG_MOD 0xa6>;
+			clock-names = "core", "clkh", "cd", "aclk";
+			resets = <&cpg 0xa7>;
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi0_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI0-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				status = "disabled";
+			};
+		};
+
+		sdhi1: mmc@15c10000 {
+			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x15c10000 0 0x10000>;
+			interrupts = <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xa7>, <&cpg CPG_MOD 0xa9>,
+				 <&cpg CPG_MOD 0xa8>, <&cpg CPG_MOD 0xaa>;
+			clock-names = "core", "clkh", "cd", "aclk";
+			resets = <&cpg 0xa8>;
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi1_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI1-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				status = "disabled";
+			};
+		};
+
+		sdhi2: mmc@15c20000 {
+			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x15c20000 0 0x10000>;
+			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 740 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xab>, <&cpg CPG_MOD 0xad>,
+				 <&cpg CPG_MOD 0xac>, <&cpg CPG_MOD 0xae>;
+			clock-names = "core", "clkh", "cd", "aclk";
+			resets = <&cpg 0xa9>;
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi2_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI2-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				status = "disabled";
+			};
+		};
 	};
 
 	timer {
-- 
2.43.0


