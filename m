Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFF0925F63B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 11:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728386AbgIGJUS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 05:20:18 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:44534 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728331AbgIGJUM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 05:20:12 -0400
X-IronPort-AV: E=Sophos;i="5.76,401,1592838000"; 
   d="scan'208";a="56349417"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Sep 2020 18:20:09 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6A03540065CD;
        Mon,  7 Sep 2020 18:20:09 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 14/14] arm64: dts: renesas: Add Renesas Falcon boards support
Date:   Mon,  7 Sep 2020 18:19:50 +0900
Message-Id: <1599470390-29719-15-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Initial support for the Renesas Falcon CPU and BreakOut boards
support.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile            |  2 ++
 arch/arm64/boot/dts/renesas/falcon-cpu.dtsi     | 44 +++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts | 23 +++++++++++++
 3 files changed, 69 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/falcon-cpu.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index d790229..6757d66 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -53,3 +53,5 @@ dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-v3hsk.dtb
 dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
 
 dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
+
+dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
diff --git a/arch/arm64/boot/dts/renesas/falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/falcon-cpu.dtsi
new file mode 100644
index 0000000..0286279
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/falcon-cpu.dtsi
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Falcon CPU board
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+/ {
+	model = "Renesas Falcon CPU board";
+	compatible = "renesas,falcon-cpu";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+
+	memory@500000000 {
+		device_type = "memory";
+		reg = <0x5 0x00000000 0x0 0x80000000>;
+	};
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0x0 0x80000000>;
+	};
+
+	memory@700000000 {
+		device_type = "memory";
+		reg = <0x7 0x00000000 0x0 0x80000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <16666666>;
+};
+
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
+&scif0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
new file mode 100644
index 0000000..56c0e5f
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Falcon board
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a779a0.dtsi"
+#include "falcon-cpu.dtsi"
+
+/ {
+	model = "Renesas Falcon board based on r8a779a0";
+	compatible = "renesas,falcon-cpu", "renesas,r8a779a0";
+
+	aliases {
+		serial0 = &scif0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
-- 
2.7.4

