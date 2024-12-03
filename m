Return-Path: <linux-renesas-soc+bounces-10821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF519E19DD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03561161717
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D491E1C17;
	Tue,  3 Dec 2024 10:50:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A085E1E25F0;
	Tue,  3 Dec 2024 10:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223046; cv=none; b=SOBXryXEDh+beeFN2z0g8gCMIzEMngWsEpoew/eBE5lgnbInDPIxS8bBxRkjEiBwi8+vi1U9011lg9xvmtSd04lFIoVIVy9DWLExus9QJ+LsNPzEHnKBXHMPimhgLM2cl/nLIy33vxdaHi5O7nccb/UWaRIxSnvSmMJTUvTWkCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223046; c=relaxed/simple;
	bh=0o4J4J8nc2g+xgTx0PcuHy4Ujy7JYoHu87x6kLgXW8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=maF4+LOnl7j5DYSLu3sno+dP9eE8NCNmIDPo8Nh8BDRLRbzsuSZq6uHZG2YwLZOyjxHTf+8EIb4QbNA64WGcvxccvcxjuDjEgzWSk7Rfm51GgZkZQfTggM907WMGur+6Ks0DB3qKzzRUjMif9B7igZCPR8KmRzuCXCK7v39MNSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: acGjIY8xRmqVWZGWVr8SXg==
X-CSE-MsgGUID: kL9QiM0tRzabTjBlJOKxkg==
X-IronPort-AV: E=Sophos;i="6.12,204,1728918000"; 
   d="scan'208";a="230754414"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2024 19:50:43 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B93A040062A5;
	Tue,  3 Dec 2024 19:50:40 +0900 (JST)
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
Subject: [PATCH v2 09/13] arm64: dts: renesas: Add initial DTSI for RZ/G3E SoC
Date: Tue,  3 Dec 2024 10:49:36 +0000
Message-ID: <20241203105005.103927-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the initial DTSI for the RZ/G3E SoC.
The files in this commit have the following meaning:
  - r9a09g047.dtsi:    RZ/G3E family SoC common parts
  - r9a09g047e57.dtsi: RZ/G3E R0A09G047E{4,5}{7,8} SoC specific parts
  - r9a09g047e37.dtsi: RZ/G3E R0A09G047E{2,3}{7,8} SoC specific parts

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 144 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi |  18 +++
 arch/arm64/boot/dts/renesas/r9a09g047e57.dtsi |  13 ++
 3 files changed, 175 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
new file mode 100644
index 000000000000..4176b9aa6892
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G3E SoC
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "renesas,r9a09g047";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	audio_extal_clk: audio-clk {
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
+
+		L3_CA55: cache-controller-0 {
+			compatible = "cache";
+			cache-unified;
+			cache-size = <0x100000>;
+			cache-level = <3>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
+	qextal_clk: qextal-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	rtxin_clk: rtxin-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cpg: clock-controller@10420000 {
+			compatible = "renesas,r9a09g047-cpg";
+			reg = <0 0x10420000 0 0x10000>;
+			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
+			clock-names = "audio_extal", "rtxin", "qextal";
+			#clock-cells = <2>;
+			#reset-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
+		scif0: serial@11c01400 {
+			compatible = "renesas,scif-r9a09g047", "renesas,scif-r9a09g057";
+			reg = <0 0x11c01400 0 0x400>;
+			interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 536 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 537 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eri", "rxi", "txi", "bri", "dri",
+					  "tei", "tei-dri", "rxi-edge", "txi-edge";
+			clocks = <&cpg CPG_MOD 0x8f>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x95>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@14900000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x14900000 0 0x20000>,
+			      <0x0 0x14940000 0 0x80000>;
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi
new file mode 100644
index 000000000000..e50d9159e832
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G3E R9A09G047E37 SoC specific parts
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r9a09g047.dtsi"
+
+/ {
+	compatible = "renesas,r9a09g047e37", "renesas,r9a09g047";
+
+	cpus {
+		/delete-node/ cpu@200;
+		/delete-node/ cpu@300;
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047e57.dtsi
new file mode 100644
index 000000000000..98a5faebd47a
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G3E R9A09G047E57 SoC specific parts
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r9a09g047.dtsi"
+
+/ {
+	compatible = "renesas,r9a09g047e57", "renesas,r9a09g047";
+};
-- 
2.43.0


