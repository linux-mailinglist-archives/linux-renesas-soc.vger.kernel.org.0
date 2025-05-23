Return-Path: <linux-renesas-soc+bounces-17449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6A6AC24F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 16:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB9C1A45465
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 14:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA61296FCE;
	Fri, 23 May 2025 14:24:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC4429614B;
	Fri, 23 May 2025 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748010298; cv=none; b=I8NCOzAnDGgDIr/GmpSjo8Z5YKVliSX9Y8f9lyvkwvUjZpPi4o2bC2OrBnKvpL6JtKrDh0mtyQ1Y2jK/MsUlLtcfGDnae3ABW2SG5JsVIYXFwnDLhCwVZ9FLC1sluEUc6sGo1E1O5BVR70R/HP1wYTuBYeOrRcRbQrSNooM+HA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748010298; c=relaxed/simple;
	bh=U/rv3S4MToT0ffNj/zyDyto5819ef6F1SIAyPKvAQMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MqDoUv7U/PdUECaOmOpEA54kFVHBD+/5lLJa9QrABjveARVJHOYdX1zuRTrGv389ttVCcmFjBaKn81UAQd7pdKwvVTXWIyW1/qiFblha4ScJqM/p2VfM2CxCEuUXPQiZS/kekuQtYBz3s3Qrw6pnq4NlAi8QqzT1vk/2oA04XpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: cNazEeJjSAOz6YauSpWVWA==
X-CSE-MsgGUID: Zj1pTx/lT8eqpE6mGCm4qA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 May 2025 23:24:55 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.97])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A97834010DE6;
	Fri, 23 May 2025 23:24:52 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 08/10] arm64: dts: renesas: Add initial support for renesas RZ/T2H SoC
Date: Fri, 23 May 2025 16:24:12 +0200
Message-ID: <20250523142417.2840797-9-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com>
References: <20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the initial dtsi for the RZ/T2H Soc:

- gic
- armv8-timer
- cpg clock
- sci0 uart

also add arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi, that keeps
all 4 CPUs enabled, for consistency with later support of -m24
and -m04 SoC revisions, that only have 2 and 1 Cortex-A55, respectively,
and that will use /delete-node/ to disable the missing CPUs.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v9->v10: none
Changes v8->v9:
  - Fixed RCSI clock names
  - No longer uses removed R9A09G077_PCLK_SCI0 definition
Changes v7->v8:
  - removed loco clock
  - added sci0 secondary clock
Changes v6->v7:
  - Renamed compatible string to r9a09g077-rsci
Changes v5->v6: none
Changes v4->v5: none
Changes v3->v4: none
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 122 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi |  13 ++
 2 files changed, 135 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
new file mode 100644
index 000000000000..48b889da9095
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/T2H SoC
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "renesas,r9a09g077";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	extal_clk: extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		l3_ca55: cache-controller-0 {
+			compatible = "cache";
+			cache-unified;
+			cache-size = <0x100000>;
+			cache-level = <3>;
+		};
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			reg = <0>;
+			device_type = "cpu";
+			next-level-cache = <&l3_ca55>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			device_type = "cpu";
+			next-level-cache = <&l3_ca55>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			device_type = "cpu";
+			next-level-cache = <&l3_ca55>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			device_type = "cpu";
+			next-level-cache = <&l3_ca55>;
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		sci0: serial@80005000 {
+			compatible = "renesas,r9a09g077-rsci";
+			reg = <0 0x80005000 0 0x400>;
+			interrupts = <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 8>, <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		cpg: clock-controller@80280000 {
+			compatible = "renesas,r9a09g077-cpg-mssr";
+			reg = <0 0x80280000 0 0x1000>,
+			      <0 0x81280000 0 0x9000>;
+			clocks = <&extal_clk>;
+			clock-names = "extal";
+			#clock-cells = <2>;
+			#reset-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
+		gic: interrupt-controller@83000000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x83000000 0 0x40000>,
+			      <0x0 0x83040000 0 0x160000>;
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi
new file mode 100644
index 000000000000..6f4a11b39d12
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/T2H 4-core SoC
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r9a09g077.dtsi"
+
+/ {
+	compatible = "renesas,r9a09g077m44", "renesas,r9a09g077";
+};
-- 
2.43.0


