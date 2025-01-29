Return-Path: <linux-renesas-soc+bounces-12712-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2876FA2224B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 17:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8A54168D72
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 16:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2742B1E3DF9;
	Wed, 29 Jan 2025 16:52:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8CB1DFE00;
	Wed, 29 Jan 2025 16:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738169567; cv=none; b=e+eCZqwUzhQIXSb701Sij+PKwFPcrvHRURwx8eW69VLTkI+7ecNK6kDSQ3SN1s6e2lKoK9Wy8yy3C1/TuT7V16RCfJZTWqDST9r9Xr6FBh9hw9iZ2/DqjQNNb7MCJbnC9qkWk98Zu/xHpTTd3Oofi6nQAsf7IZ5Ya3NM3xh0fIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738169567; c=relaxed/simple;
	bh=NUT/d3UeYWQltVBqEhEx9CsCqthGyzfLH4Fa5L4NTqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kaz+3DumdQ56+lSOiK0ZsjpFRi5WpPBkb0xspzMH5Ee0YwmzZsJexU305haDLbF5++bH0z1l5u4X4r1iylEB5NMKfAkMWL3euQXNdPwrlHLqOzr5DmT8+GhzTc5KtrBXTD3bCUU8w2+tq8zykxoZrAqDRxRIU8SmYAFhEBcIp38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: l+3Q2I5FQFSP2+nLSI7oBw==
X-CSE-MsgGUID: 8Q46k3C3SJiIM9rg9VrBiQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 Jan 2025 01:52:44 +0900
Received: from wvbox.administration.lan (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id F2724402F02E;
	Thu, 30 Jan 2025 01:52:40 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/14] arm64: dts: renesas: Add initial support for renesas RZ/T2H SoC
Date: Wed, 29 Jan 2025 16:37:48 +0000
Message-ID: <20250129165122.2980-13-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
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

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 129 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi |   8 ++
 2 files changed, 137 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
new file mode 100644
index 000000000000..55a2b1bd8100
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/T2H SoC
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/clock/r9a09g077-cpg.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "renesas,r9a09g077";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	extal: extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	loco: loco {
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
+		L3_CA55: cache-controller-0 {
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
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
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
+			compatible = "renesas,r9a09g077-sci";
+			reg = <0 0x80005000 0 0x400>;
+			interrupts = <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD R9A09G077_SCI0_CLK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		cpg: clock-controller@80280000 {
+			compatible = "renesas,r9a09g077-cpg";
+			reg = <0 0x80280000 0 0x1000>,
+			      <0 0x81280000 0 0x9000>;
+			clocks = <&extal>, <&loco>;
+			clock-names = "extal", "loco";
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
index 000000000000..f54bb50829db
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/T2H 4-core SoC
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include "r9a09g077.dtsi"
-- 
2.43.0


