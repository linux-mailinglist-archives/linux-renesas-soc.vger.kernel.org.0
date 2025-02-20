Return-Path: <linux-renesas-soc+bounces-13428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D7BA3DE96
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 16:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6529A4201DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 15:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE011FFC4E;
	Thu, 20 Feb 2025 15:28:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237D31FDA99;
	Thu, 20 Feb 2025 15:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065298; cv=none; b=epCrQTuIwpEECqhzngpb9nZpcIv2MvPRgemJxbG0n99Wn7aHDJlA7m5VGO6TIVdZOz2GjJitQP9OrGZgHD3Qf4NQX2f5zQg/VYzOiLA9SSf5FSILv0mjjMbuNNl13r5oqRiescuxyIn3QI70l9ln5mhSn5x8PhSVcl7qyp9EUuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065298; c=relaxed/simple;
	bh=usBPXFFU9MqU7K53My2sZMzvvydPBdqueacCzstI5VA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U7UzUqmh0yDX6KYFVd6pysNib1Bs5cL6m9wQuyU5u9E4QciIP50KSy7iJD8Nxbo+0bKfj4HealqO+95aO4nMwl6P4AzzSzg/VG1GVYE9ZUd0LBkV/V+3Ds72tCtRs6Lp/+djc3wKm/4F06BmgzqK+ogE6qGFi6Ebw0rLqpP/jI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: c8ByFnxfQW+HRcbRlb+2eg==
X-CSE-MsgGUID: Y5f5dgZjQX2N2Tl2w2Bpog==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Feb 2025 00:28:14 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.134])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 252084043708;
	Fri, 21 Feb 2025 00:28:08 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: mturquette@baylibre.com,
	magnus.damm@gmail.com,
	krzk+dt@kernel.org,
	rui.zhang@intel.com,
	daniel.lezcano@linaro.org,
	sboyd@kernel.org,
	geert+renesas@glider.be,
	lukasz.luba@arm.com,
	rafael@kernel.org,
	robh@kernel.org,
	p.zabel@pengutronix.de
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH 6/7] arm64: dts: renesas: r9a09g047: Add TSU node
Date: Thu, 20 Feb 2025 16:26:11 +0100
Message-ID: <20250220152640.49010-7-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220152640.49010-1-john.madieu.xa@bp.renesas.com>
References: <20250220152640.49010-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add TSU node along with thermal zones and keep it enabled in the SoC DTSI.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index a6b83e057a40..8560be5b79cb 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -64,6 +64,7 @@ cpu0: cpu@0 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A09G047_CA55_0_CORECLK0>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -74,6 +75,7 @@ cpu1: cpu@100 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A09G047_CA55_0_CORECLK1>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -84,6 +86,7 @@ cpu2: cpu@200 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A09G047_CA55_0_CORECLK2>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -94,6 +97,7 @@ cpu3: cpu@300 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A09G047_CA55_0_CORECLK3>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -302,6 +306,20 @@ wdt3: watchdog@13000400 {
 			status = "disabled";
 		};
 
+		tsu: thermal@14002000 {
+			compatible = "renesas,r9a09g047-tsu";
+			reg = <0 0x14002000 0 0x1000>;
+			interrupts = <GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "S12TSUADI1", "S12TSUADCMPI1";
+			clocks = <&cpg CPG_MOD 0x10a>;
+			resets = <&cpg 0xf8>;
+			power-domains = <&cpg>;
+			#thermal-sensor-cells = <0>;
+			renesas,tsu-operating-mode = <0>;
+			renesas,tsu-calibration-sys = <&sys>;
+		};
+
 		i2c0: i2c@14400400 {
 			compatible = "renesas,riic-r9a09g047", "renesas,riic-r9a09g057";
 			reg = <0 0x14400400 0 0x400>;
@@ -502,6 +520,37 @@ gic: interrupt-controller@14900000 {
 		};
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&tsu>;
+
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device = <&cpu0 0 3>, <&cpu1 0 3>,
+							 <&cpu2 0 3>, <&cpu3 0 3>;
+					contribution = <1024>;
+				};
+			};
+
+			trips {
+				target: trip-point {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				sensor_crit: sensor-crit {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
-- 
2.25.1


