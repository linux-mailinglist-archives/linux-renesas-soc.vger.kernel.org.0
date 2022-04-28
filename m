Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D35005135B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 15:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347749AbiD1NyT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 09:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347887AbiD1NyQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 09:54:16 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2AD501EC50
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Apr 2022 06:51:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,295,1647270000"; 
   d="scan'208";a="119517570"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Apr 2022 22:50:59 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DE04F4010DD5;
        Thu, 28 Apr 2022 22:50:59 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 3/3] arm64: dts: renesas: Add Renesas White Hawk boards support
Date:   Thu, 28 Apr 2022 22:50:58 +0900
Message-Id: <20220428135058.597586-4-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428135058.597586-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220428135058.597586-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Initial support for the Renesas White Hawk CPU and BreakOut boards.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  | 45 +++++++++++++++++++
 .../boot/dts/renesas/r8a779g0-white-hawk.dts  | 22 +++++++++
 3 files changed, 69 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index fa9811251fd7..15309309a2e1 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -65,6 +65,8 @@ dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
 
 dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f0-spider.dtb
 
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk.dtb
+
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb-kf.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
new file mode 100644
index 000000000000..8784bce7ec22
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the White Hawk CPU board
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#include "r8a779g0.dtsi"
+
+/ {
+	model = "Renesas White Hawk CPU board";
+	compatible = "renesas,white-hawk-cpu", "renesas,r8a779g0";
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
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0x1 0x00000000>;
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
+&hscif0 {
+	status = "okay";
+};
+
+&scif_clk {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
new file mode 100644
index 000000000000..e905ac63b130
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the White Hawk CPU and BreakOut boards
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a779g0-white-hawk-cpu.dtsi"
+
+/ {
+	model = "Renesas White Hawk CPU and Breakout boards based on r8a779g0";
+	compatible = "renesas,white-hawk-breakout", "renesas,white-hawk-cpu", "renesas,r8a779g0";
+
+	aliases {
+		serial0 = &hscif0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+};
-- 
2.25.1

