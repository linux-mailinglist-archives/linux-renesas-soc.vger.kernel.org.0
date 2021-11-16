Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E822452C0A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 08:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbhKPHq7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 02:46:59 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:62354 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231389AbhKPHp7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 02:45:59 -0500
X-IronPort-AV: E=Sophos;i="5.87,238,1631545200"; 
   d="scan'208";a="100767157"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Nov 2021 16:42:38 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C768140083D3;
        Tue, 16 Nov 2021 16:42:38 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takehito Nakamura <takehito.nakamura.nx@renesas.com>
Subject: [PATCH 15/16] arm64: dts: renesas: Add Renesas Spider boards support
Date:   Tue, 16 Nov 2021 16:41:29 +0900
Message-Id: <20211116074130.107554-16-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Initial support for the Renesas Spider CPU and BreakOut boards
support.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Takehito Nakamura <takehito.nakamura.nx@renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 ++
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 36 +++++++++++++++++++
 .../boot/dts/renesas/r8a779f0-spider.dts      | 22 ++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0-spider.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index d1c5c21d8d14..5bc8065a7864 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -63,6 +63,8 @@ dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
 
 dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
 
+dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f0-spider.dtb
+
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb-kf.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
new file mode 100644
index 000000000000..156586532c84
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the Spider CPU board
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+#include "r8a779f0.dtsi"
+
+/ {
+	model = "Renesas Spider CPU board";
+	compatible = "renesas,spider-cpu", "renesas,r8a779f0";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+
+	memory@480000000 {
+		device_type = "memory";
+		reg = <0x4 0x80000000 0x0 0x80000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <20000000>;
+};
+
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
+&scif3 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
new file mode 100644
index 000000000000..f286254b41d8
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the Spider CPU and BreakOut boards
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a779f0-spider-cpu.dtsi"
+
+/ {
+	model = "Renesas Spider CPU and Breakout boards based on r8a779f0";
+	compatible = "renesas,spider-breakout", "renesas,spider-cpu", "renesas,r8a779f0";
+
+	aliases {
+		serial0 = &scif3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
-- 
2.25.1

