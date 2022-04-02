Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5DE04EFF5B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Apr 2022 09:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243088AbiDBHcq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Apr 2022 03:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243030AbiDBHcp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 03:32:45 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CA4C5174E97;
        Sat,  2 Apr 2022 00:30:53 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,229,1643641200"; 
   d="scan'208";a="115483275"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Apr 2022 16:30:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.166])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7CAB24001944;
        Sat,  2 Apr 2022 16:30:51 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 5/5] arm64: dts: renesas: Add initial device tree for RZ/G2UL Type-1 SMARC EVK
Date:   Sat,  2 Apr 2022 08:30:37 +0100
Message-Id: <20220402073037.23947-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220402073037.23947-1-biju.das.jz@bp.renesas.com>
References: <20220402073037.23947-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add basic support for RZ/G2UL SMARC EVK (based on R9A07G043U11):
- memory
- External input clock
- CPG
- DMA
- SCIF

It shares the same carrier board with RZ/G2L, but the pin mapping is
different. Disable the device nodes which are not tested and delete the
corresponding pinctrl definitions.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
 * Added Rb tag from Geert.
v2->v3:
 * Replaced CONFIG_ARCH_R9A07G043U->CONFIG_ARCH_R9A07G043
 * Renamed SoC file r9a07g043u.dtsi->r9a07g043.dtsi
v1->v2:
 * Changed soc compatible from r9a07g043u->r9a07g043.
---
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   | 111 ++++++++++++++++++
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    |  25 ++++
 3 files changed, 138 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index d000f6b131dc..fa9811251fd7 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -75,6 +75,8 @@ dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-ulcb-kf.dtb
 
 dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc.dtb
+
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
new file mode 100644
index 000000000000..aaa29f83e84c
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2UL Type-1 SMARC EVK board
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r9a07g043.dtsi"
+#include "rzg2ul-smarc-som.dtsi"
+#include "rz-smarc-common.dtsi"
+
+/ {
+	model = "Renesas SMARC EVK based on r9a07g043u11";
+	compatible = "renesas,smarc-evk", "renesas,r9a07g043u11", "renesas,r9a07g043";
+};
+
+&canfd {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+	status = "disabled";
+};
+
+&ehci0 {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+	status = "disabled";
+};
+
+&ehci1 {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+	status = "disabled";
+};
+
+&hsusb {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+	status = "disabled";
+};
+
+&i2c0 {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+	status = "disabled";
+};
+
+&i2c1 {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+	status = "disabled";
+
+	wm8978: codec@1a {
+		compatible = "wlf,wm8978";
+		#sound-dai-cells = <0>;
+		reg = <0x1a>;
+	};
+};
+
+&ohci0 {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+	status = "disabled";
+};
+
+&ohci1 {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+	status = "disabled";
+};
+
+&phyrst {
+	status = "disabled";
+};
+
+&scif0 {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+};
+
+&sdhi1 {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-1;
+	/delete-property/ pinctrl-names;
+	/delete-property/ vmmc-supply;
+	status = "disabled";
+};
+
+&spi1 {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+	status = "disabled";
+};
+
+&ssi0 {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+	status = "disabled";
+};
+
+&usb2_phy0 {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+	status = "disabled";
+};
+
+&usb2_phy1 {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
new file mode 100644
index 000000000000..3bbb8fcd604c
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2UL SMARC SOM common parts
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/ {
+	chosen {
+		bootargs = "ignore_loglevel";
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x38000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>;
+};
-- 
2.17.1

