Return-Path: <linux-renesas-soc+bounces-12521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03954A1C828
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 14:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 357DB188681D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 13:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749E713BC3F;
	Sun, 26 Jan 2025 13:46:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10C213AA20;
	Sun, 26 Jan 2025 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737899213; cv=none; b=Ck5xyX19dI0y+X5xUKsrCusQYk6N7WOInJIKaJYqLw3X+XmfUT74VKoKj08ZEIox8OF7YQBTryzTqT665e3tzHWUwafBMOC7EjSa+9WUBOyJRirMUGqBUzExWKY5SIH5dgTbtVyzv33UhV6YAKiH0ncY8JRksZG07NbCjfZ5lMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737899213; c=relaxed/simple;
	bh=+THuYu/XuFKotuogN6lzYDg/qiXRyiZ/O+BFA98rk2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nuaL756C5x02v5E6y5nDDGZzYc6odMlxlejihzP0YgNm/SER3KAKK/OgeeM1l078a0SD2BxpFaH7oxBcVtMA0S7lL6ywcCu4JRXVCLAq5hXzOOU5bdpVVitKLAtx5O6l8t4KWmhKrubTmB06Dai0CKFTcVWFtPWs6vDMHMWcyYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: WjAQIbrIRdml+sKP4cMFaA==
X-CSE-MsgGUID: LvFQE4MDT6ydC+gs5NGf1g==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jan 2025 22:46:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.41])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 132084007F40;
	Sun, 26 Jan 2025 22:46:36 +0900 (JST)
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
Subject: [PATCH 5/7] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
Date: Sun, 26 Jan 2025 13:46:07 +0000
Message-ID: <20250126134616.37334-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
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
This patch depend upon [1]
[1] https://lore.kernel.org/all/20250120094715.25802-12-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 2023f70d3329..099d13b83f18 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -518,6 +518,63 @@ gic: interrupt-controller@14900000 {
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
+			vqmmc_sdhi0: vqmmc-regulator {
+				regulator-name = "SDHI0-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
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
+			vqmmc_sdhi1: vqmmc-regulator {
+				regulator-name = "SDHI1-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
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
+			vqmmc_sdhi2: vqmmc-regulator {
+				regulator-name = "SDHI2-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+			};
+		};
 	};
 
 	timer {
-- 
2.43.0


