Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B87534EFF99
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Apr 2022 10:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346494AbiDBIPk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Apr 2022 04:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349686AbiDBIPj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 04:15:39 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9EA2C60ABD;
        Sat,  2 Apr 2022 01:13:45 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,229,1643641200"; 
   d="scan'208";a="116499437"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Apr 2022 17:13:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.166])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4290F41F41F7;
        Sat,  2 Apr 2022 17:13:43 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/7] arm64: dts: renesas: rzg2ul-smarc: Enable microSD on SMARC platform
Date:   Sat,  2 Apr 2022 09:13:26 +0100
Message-Id: <20220402081328.26292-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220402081328.26292-1-biju.das.jz@bp.renesas.com>
References: <20220402081328.26292-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable the microSD card slot connected to SDHI1 on the RZ/G2UL SMARC
platform by removing the sdhi1 override which disabled it, and by adding
the necessary pinmux required for SDHI1.

This patch also adds gpios property to vccq_sdhi1 regulator.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
 * Updated gpios property for vccq_sdhi1 regulator and removed
   sdhi1 node as it is enabled in common.
 * Updated commit description
---
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   | 12 +-----
 .../dts/renesas/rzg2ul-smarc-pinfunction.dtsi | 39 +++++++++++++++++++
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    |  9 +++++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi | 14 +++++++
 4 files changed, 63 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
index 64370faf8f6d..08a0404c6f0b 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
@@ -7,9 +7,7 @@
 
 /dts-v1/;
 #include "r9a07g043.dtsi"
-#include "rzg2ul-smarc-som.dtsi"
-#include "rzg2ul-smarc-pinfunction.dtsi"
-#include "rz-smarc-common.dtsi"
+#include "rzg2ul-smarc.dtsi"
 
 / {
 	model = "Renesas SMARC EVK based on r9a07g043u11";
@@ -74,14 +72,6 @@
 	status = "disabled";
 };
 
-&sdhi1 {
-	/delete-property/ pinctrl-0;
-	/delete-property/ pinctrl-1;
-	/delete-property/ pinctrl-names;
-	/delete-property/ vmmc-supply;
-	status = "disabled";
-};
-
 &spi1 {
 	/delete-property/ pinctrl-0;
 	/delete-property/ pinctrl-names;
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
index 2db9c92cf01f..b515748e6a9a 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
@@ -17,6 +17,45 @@
 			 <RZG2L_PORT_PINMUX(6, 3, 6)>; /* RxD */
 	};
 
+	sd1-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZG2L_GPIO(0, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd1_pwr_en";
+	};
+
+	sdhi1_pins: sd1 {
+		sd1_data {
+			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
+			power-source = <3300>;
+		};
+
+		sd1_ctrl {
+			pins = "SD1_CLK", "SD1_CMD";
+			power-source = <3300>;
+		};
+
+		sd1_mux {
+			pinmux = <RZG2L_PORT_PINMUX(0, 2, 1)>; /* SD1_CD */
+		};
+	};
+
+	sdhi1_pins_uhs: sd1_uhs {
+		sd1_data_uhs {
+			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
+			power-source = <1800>;
+		};
+
+		sd1_ctrl_uhs {
+			pins = "SD1_CLK", "SD1_CMD";
+			power-source = <1800>;
+		};
+
+		sd1_mux_uhs {
+			pinmux = <RZG2L_PORT_PINMUX(0, 2, 1)>; /* SD1_CD */
+		};
+	};
+
 	sound_clk_pins: sound_clk {
 		pins = "AUDIO_CLK1", "AUDIO_CLK2";
 		input-enable;
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
index 3bbb8fcd604c..8ecc650099a7 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
@@ -18,6 +18,15 @@
 		/* first 128MB is reserved for secure area. */
 		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
+
+	reg_3p3v: regulator1 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &extal_clk {
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
new file mode 100644
index 000000000000..f47b4e2e0feb
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2UL Type-1 SMARC EVK parts
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#include "rzg2ul-smarc-som.dtsi"
+#include "rzg2ul-smarc-pinfunction.dtsi"
+#include "rz-smarc-common.dtsi"
+
+&vccq_sdhi1 {
+	gpios = <&pinctrl RZG2L_GPIO(6, 1) GPIO_ACTIVE_HIGH>;
+};
-- 
2.17.1

