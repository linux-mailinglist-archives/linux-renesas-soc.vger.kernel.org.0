Return-Path: <linux-renesas-soc+bounces-12709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5840BA22236
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 17:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C04D188425C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 16:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51721E1A16;
	Wed, 29 Jan 2025 16:52:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E261E04BD;
	Wed, 29 Jan 2025 16:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738169538; cv=none; b=eK+JhNBbBomip/XrmCaqOqckOH1IMH4VgtgC7zUe0XY1OmmMBmcNnfv93GvSRli1T9Z2RGEcJVmYd/oCv3I71ItCgZuPml5MzI06CmnF52WPegWyUrJ5kcANzfS92gHGNRVzU8o5OHss3dO6BXVYPyoZLrpoMZpsJ09LUF6mIj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738169538; c=relaxed/simple;
	bh=9lLPFIXz6ZQceuk/AtSkSJ0SfJktgU8m3ojTa4ld+d0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRTwZ1UD8iD5UFMvD8jl9ifVYTuI5s80PsN09lGea7CQyRptgR5wLHwsWY7VLX2u4Yq1puc8QUD2AI0rmN2+3b7156P7LRkeyAWY2Vph9CLx5gxfmWrJ1iNWwrkDjOnv+3jueVjoZTnz26aaQIFV7mJ9R6IVKtn1xyrBgKDjU0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: pMXj4B3YSs2NyQm8dJ20ZA==
X-CSE-MsgGUID: 3Pil8R0NQAeozhfuZSwFWg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Jan 2025 01:52:13 +0900
Received: from wvbox.administration.lan (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 66D24402E786;
	Thu, 30 Jan 2025 01:51:59 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/14] dt-bindings: clock: Document cpg bindings for the Renesas RZ/T2H SoC
Date: Wed, 29 Jan 2025 16:37:40 +0000
Message-ID: <20250129165122.2980-5-thierry.bultel.yh@bp.renesas.com>
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

Document RZ/T2H (a.k.a r9a09g077) CPG (Clock Pulse Generator) binding.
Add the header file for the resets and clocks definitions.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
 .../bindings/clock/renesas,rzt2h-cpg.yaml     |  73 +++++++++
 include/dt-bindings/clock/r9a09g077-cpg.h     | 144 ++++++++++++++++++
 2 files changed, 217 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzt2h-cpg.yaml
 create mode 100644 include/dt-bindings/clock/r9a09g077-cpg.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzt2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzt2h-cpg.yaml
new file mode 100644
index 000000000000..9a3a00126d2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,rzt2h-cpg.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/renesas,rzt2h-cpg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/T2H(P) Clock Pulse Generator (CPG)
+
+maintainers:
+  - Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
+
+description:
+  On Renesas RZ/T2H SoCs, the CPG (Clock Pulse Generator) handles generation
+  and control of clock signals for the IP modules, generation and control of resets,
+  and control over booting, low power consumption and power supply domains.
+
+properties:
+  compatible:
+    const: renesas,r9a09g077-cpg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: EXTAL clock input
+      - description: LOCO clock input
+
+  clock-names:
+    items:
+      - const: extal
+      - const: loco
+
+  '#clock-cells':
+    description: |
+      - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
+        and a core clock reference, as defined in
+        <dt-bindings/clock/renesas,r9a09g077-cpg.h>,
+      - For module clocks, the two clock specifier cells must be "CPG_MOD" and
+        a module number, also defined <dt-bindings/clock/r9a09g077-cpg.h>,
+    const: 2
+
+  '#power-domain-cells':
+    const: 0
+
+  '#reset-cells':
+    description:
+      The single reset specifier cell must be the reset number, as defined in
+      <dt-bindings/clock/r9a09g077-cpg.h>.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#power-domain-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@10420000 {
+        compatible = "renesas,r9a09g077-cpg";
+        reg = <0x10420000 0x10000>;
+        clocks = <&extal>, <&loco>;
+        clock-names = "extal", "loco";
+        #clock-cells = <2>;
+        #power-domain-cells = <0>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/r9a09g077-cpg.h b/include/dt-bindings/clock/r9a09g077-cpg.h
new file mode 100644
index 000000000000..413c428478df
--- /dev/null
+++ b/include/dt-bindings/clock/r9a09g077-cpg.h
@@ -0,0 +1,144 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__
+#define __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* R9A09G077 CPG Core Clocks */
+#define R9A09G077_CA55C0		0
+#define R9A09G077_CA55C1		1
+#define R9A09G077_CA55C2		2
+#define R9A09G077_CA55C3		3
+#define R9A09G077_SDHIHS		4
+#define R9A09G077_CLK_PLL1_ETH_PHY	5
+#define R9A09G077_CLK_OSC_ETH_PHY	6
+#define R9A09G077_CLK_ETHPHY		7
+#define R9A09G077_PCLKAH		8
+#define R9A09G077_PCLKAM		9
+#define R9A09G077_PCLKAL		10
+#define R9A09G077_CLK_SEL_ETH_PHY	11
+#define R9A09G077_DFI			12
+#define R9A09G077_PCLKH			13
+#define R9A09G077_PCLKM			14
+#define R9A09G077_PCLKL			15
+#define R9A09G077_PCLKGPTL		16
+#define R9A09G077_PCLKSHOST		17
+#define R9A09G077_PCLKRTC		18
+#define R9A09G077_USB			19
+#define R9A09G077_SPI0			20
+#define R9A09G077_SPI1			21
+#define R9A09G077_SPI2			22
+#define R9A09G077_SPI3			23
+#define R9A09G077_ETCLKA		24
+#define R9A09G077_ETCLKB		25
+#define R9A09G077_ETCLKC		26
+#define R9A09G077_ETCLKD		27
+#define R9A09G077_ETCLKE		28
+#define R9A09G077_ETHCLKE		29
+#define R9A09G077_ETHCLK_EXTAL		30
+#define R9A09G077_ETH_REFCLK		31
+#define R9A09G077_LCDC_CLKA		32
+#define R9A09G077_LCDC_CLKP		33
+#define R9A09G077_CA55			34
+#define R9A09G077_LCDC_CLKD		35
+
+/* R9A09G077 Module Clocks */
+#define R9A09G077_SCI0_CLK		0
+#define R9A09G077_CA55_CORE0_CLK	1
+#define R9A09G077_CA55_CORE1_CLK	2
+#define R9A09G077_CA55_CORE2_CLK	3
+#define R9A09G077_CA55_CORE3_CLK	4
+#define R9A09G077_PCIE_CLK		5
+#define R9A09G077_USB_CLK		6
+#define R9A09G077_SDHI0_CLK		7
+#define R9A09G077_SDHI1_CLK		8
+#define R9A09G077_MTU3_CLK		9
+#define R9A09G077_GPT0_CLK		10
+#define R9A09G077_GPT1_CLK		11
+#define R9A09G077_ACD0_CLK		12
+#define R9A09G077_ACD1_CLK		13
+#define R9A09G077_ACD2_CLK		14
+#define R9A09G077_GMAC0_CLK		15
+#define R9A09G077_GMAC1_CLK		16
+#define R9A09G077_GMAC2_CLK		17
+#define R9A09G077_SHOSTIF_CLK		18
+#define R9A09G077_IIC0_CLK		19
+#define R9A09G077_IIC1_CLK		20
+#define R9A09G077_IIC2_CLK		21
+#define R9A09G077_DOC_CLK		22
+#define R9A09G077_CMT0_CLK		23
+#define R9A09G077_CMT1_CLK		24
+#define R9A09G077_CMT2_CLK		25
+#define R9A09G077_CMTW0_CLK		26
+#define R9A09G077_CMTW1_CLK		27
+#define R9A09G077_SPI0_CLK		28
+#define R9A09G077_SPI1_CLK		29
+#define R9A09G077_SPI2_CLK		30
+#define R9A09G077_SPI3_CLK		31
+#define R9A09G077_SCI1_CLK		32
+#define R9A09G077_SCI2_CLK		33
+#define R9A09G077_SCI3_CLK		34
+#define R9A09G077_SCI4_CLK		35
+#define R9A09G077_SCI5_CLK		36
+#define R9A09G077_SCIE0_CLK		37
+#define R9A09G077_SCIE1_CLK		38
+#define R9A09G077_SCIE2_CLK		39
+#define R9A09G077_SCIE3_CLK		40
+#define R9A09G077_SCIE4_CLK		41
+#define R9A09G077_SCIE5_CLK		42
+#define R9A09G077_SCIE6_CLK		43
+#define R9A09G077_SCIE7_CLK		44
+#define R9A09G077_SCIE8_CLK		45
+#define R9A09G077_SCIE9_CLK		46
+#define R9A09G077_SCIE10_CLK		47
+#define R9A09G077_SCIE11_CLK		48
+#define R9A09G077_RTC_CLK		49
+#define R9A09G077_ETHSS_CLK		50
+#define R9A09G077_ETHSW_CLK		51
+#define R9A09G077_GPT2_CLK		52
+#define R9A09G077_GPT3_CLK		53
+#define R9A09G077_GPT4_CLK		54
+#define R9A09G077_GPT5_CLK		55
+#define R9A09G077_GPT6_CLK		56
+#define R9A09G077_GPT7_CLK		57
+#define R9A09G077_GPT8_CLK		58
+#define R9A09G077_GPT9_CLK		59
+#define R9A09G077_GPT10_CLK		60
+#define R9A09G077_CANFD_CLK		61
+#define R9A09G077_TSU_CLK		62
+#define R9A09G077_LCDC_CLK		63
+
+/* R9A09G077 Resets */
+#define R9A09G077_xSPI0_RST		0
+#define R9A09G077_xSPI1_RST		1
+#define R9A09G077_GMAC0_PCLKH_RST	2
+#define R9A09G077_GMAC0_PCLKM_RST	3
+#define R9A09G077_ETHSW_RST		4
+#define R9A09G077_ESC_BUS_RST		5
+#define R9A09G077_ESC_IP_RST		6
+#define R9A09G077_ETH_SUBSYSTEM_RST	7
+#define R9A09G077_MII_CONVERT_RST	8
+#define R9A09G077_GMAC1_PCLKAH_RST	9
+#define R9A09G077_GMAC1_PCLKAM_RST	10
+#define R9A09G077_GMAC2_PCLKAH_RST	11
+#define R9A09G077_GMAC2_PCLKAM_RST	12
+#define R9A09G077_SHOSTIF_MASTER_RST	13
+#define R9A09G077_SHOSTIF_SLAVE_RST	14
+#define R9A09G077_SHOSTIF_IP_RST	15
+#define R9A09G077_DDRSS_RST_N_RST	16
+#define R9A09G077_DDRSS_PWROKIN_RST	17
+#define R9A09G077_DDRSS_RST_RST		18
+#define R9A09G077_DDRSS_AXI0_RST	19
+#define R9A09G077_DDRSS_AXI1_RST	20
+#define R9A09G077_DDRSS_AXI2_RST	21
+#define R9A09G077_DDRSS_AXI3_RST	22
+#define R9A09G077_DDRSS_AXI4_RST	23
+#define R9A09G077_DDRSS_MC_RST		24
+#define R9A09G077_PCIE_RST		25
+#define R9A09G077_DDRSS_PHY_RST		26
+
+#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
\ No newline at end of file
-- 
2.43.0


