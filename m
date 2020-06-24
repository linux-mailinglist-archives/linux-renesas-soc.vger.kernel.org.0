Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE12207420
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 15:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390993AbgFXNOn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 09:14:43 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:62151 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387938AbgFXNOl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 09:14:41 -0400
X-IronPort-AV: E=Sophos;i="5.75,275,1589209200"; 
   d="scan'208";a="50279171"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Jun 2020 22:14:41 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3ED2C40062A1;
        Wed, 24 Jun 2020 22:14:39 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 07/11] arm64: dts: renesas: hihope-rzg2-ex: Separate out lvds specific nodes into common file
Date:   Wed, 24 Jun 2020 14:12:06 +0100
Message-Id: <1593004330-5039-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593004330-5039-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1593004330-5039-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Separate out LVDS specific nodes into common file
hihope-rzg2-ex-lvds.dtsi so that this can be re-used by RZ/G2M[N]
variants.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi | 52 +++++++++++++++++++
 .../boot/dts/renesas/hihope-rzg2-ex.dtsi      | 37 -------------
 ...a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dts | 39 +-------------
 3 files changed, 53 insertions(+), 75 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi

diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi
new file mode 100644
index 000000000000..40c5e8d6d841
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the RZ/G2[MN] HiHope sub board LVDS common parts
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+/ {
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm0 0 50000>;
+
+		brightness-levels = <0 2 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+	};
+};
+
+&gpio1 {
+	/*
+	 * When GP1_20 is LOW LVDS0 is connected to the LVDS connector
+	 * When GP1_20 is HIGH LVDS0 is connected to the LT8918L
+	 */
+	lvds-connector-en-gpio {
+		gpio-hog;
+		gpios = <20 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "lvds-connector-en-gpio";
+	};
+};
+
+&lvds0 {
+	ports {
+		port@1 {
+			lvds_connector: endpoint {
+			};
+		};
+	};
+};
+
+&pfc {
+	pwm0_pins: pwm0 {
+		groups = "pwm0";
+		function = "pwm0";
+	};
+};
+
+&pwm0 {
+	pinctrl-0 = <&pwm0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
index 28fe17e3bc4e..acfcfd050a6c 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
@@ -13,14 +13,6 @@
 	chosen {
 		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 	};
-
-	backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pwm0 0 50000>;
-
-		brightness-levels = <0 2 8 16 32 64 128 255>;
-		default-brightness-level = <6>;
-	};
 };
 
 &avb {
@@ -51,35 +43,6 @@
 	status = "okay";
 };
 
-&gpio1 {
-	/*
-	 * When GP1_20 is LOW LVDS0 is connected to the LVDS connector
-	 * When GP1_20 is HIGH LVDS0 is connected to the LT8918L
-	 */
-	lvds-connector-en-gpio {
-		gpio-hog;
-		gpios = <20 GPIO_ACTIVE_HIGH>;
-		output-low;
-		line-name = "lvds-connector-en-gpio";
-	};
-};
-
-&lvds0 {
-	/*
-	 * Please include the LVDS panel .dtsi file and uncomment the below line
-	 * to enable LVDS panel connected to RZ/G2[MN] boards.
-	 */
-
-	/* status = "okay"; */
-
-	ports {
-		port@1 {
-			lvds_connector: endpoint {
-			};
-		};
-	};
-};
-
 &pciec0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dts b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dts
index 3a1dcc914985..c0e9d8ca4a8c 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dts
@@ -7,46 +7,9 @@
  */
 
 #include "r8a774a1-hihope-rzg2m-rev2-ex.dts"
+#include "hihope-rzg2-ex-lvds.dtsi"
 #include "rzg2-advantech-idk-1110wr-panel.dtsi"
 
-/ {
-	backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pwm0 0 50000>;
-
-		brightness-levels = <0 2 8 16 32 64 128 255>;
-		default-brightness-level = <6>;
-	};
-
-};
-
-&gpio1 {
-	/*
-	 * When GP1_20 is LOW LVDS0 is connected to the LVDS connector
-	 * When GP1_20 is HIGH LVDS0 is connected to the LT8918L
-	 */
-	lvds-connector-en-gpio {
-		gpio-hog;
-		gpios = <20 GPIO_ACTIVE_HIGH>;
-		output-low;
-		line-name = "lvds-connector-en-gpio";
-	};
-};
-
 &lvds0 {
 	status = "okay";
 };
-
-&pfc {
-	pwm0_pins: pwm0 {
-		groups = "pwm0";
-		function = "pwm0";
-	};
-};
-
-&pwm0 {
-	pinctrl-0 = <&pwm0_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-- 
2.17.1

