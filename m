Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686764770CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 12:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232136AbhLPLnS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 06:43:18 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:49635 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231464AbhLPLnR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 06:43:17 -0500
X-IronPort-AV: E=Sophos;i="5.88,211,1635174000"; 
   d="scan'208";a="103716759"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Dec 2021 20:43:15 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8397C4012258;
        Thu, 16 Dec 2021 20:43:13 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: Add initial DTSI for RZ/G2LC SoC
Date:   Thu, 16 Dec 2021 11:43:04 +0000
Message-Id: <20211216114305.5842-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211216114305.5842-1-biju.das.jz@bp.renesas.com>
References: <20211216114305.5842-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L and RZ/G2LC SoC's are similar and they share the same DEVID.
RZ/G2LC has fewer peripherals compared to RZ/G2L.

SSI (3 channels vs 4 channels)
GbEthernet (1 channel vs 2 channels)
SCIFA (4 channels vs 5 channels)
ADC is only supported in RZ/G2L.

Add initial DTSI for RZ/G2LC SoC by reusing the common r9a07g044.dtsi
file with unsupported device nodes deleted in the below SoC specific dtsi
files.

r9a07g044c1.dtsi => RZ/G2LC R9A07G044C1 SoC specific parts
r9a07g044c2.dtsi => RZ/G2LC R9A07G044C2 SoC specific parts

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi | 32 ++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g044c2.dtsi | 20 ++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c2.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
new file mode 100644
index 000000000000..1d57df706939
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2LC R9A07G044C1 SoC specific parts
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r9a07g044.dtsi"
+
+/ {
+	compatible = "renesas,r9a07g044c1", "renesas,r9a07g044";
+
+	cpus {
+		/delete-node/ cpu-map;
+		/delete-node/ cpu@100;
+	};
+
+	timer {
+		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
+
+&soc {
+	/delete-node/ ssi@1004a800;
+	/delete-node/ serial@1004c800;
+	/delete-node/ adc@10059000;
+	/delete-node/ ethernet@11c30000;
+};
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044c2.dtsi
new file mode 100644
index 000000000000..7bb8917fe421
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2LC R9A07G044C2 SoC specific parts
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r9a07g044.dtsi"
+
+/ {
+	compatible = "renesas,r9a07g044c2", "renesas,r9a07g044";
+};
+
+&soc {
+	/delete-node/ ssi@1004a800;
+	/delete-node/ serial@1004c800;
+	/delete-node/ adc@10059000;
+	/delete-node/ ethernet@11c30000;
+};
-- 
2.17.1

