Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 595C774A109
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jul 2023 17:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233785AbjGFPbH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jul 2023 11:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233772AbjGFPbF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jul 2023 11:31:05 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3C9F41FC8;
        Thu,  6 Jul 2023 08:30:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,185,1684767600"; 
   d="scan'208";a="167244436"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 07 Jul 2023 00:30:53 +0900
Received: from localhost.localdomain (unknown [10.226.93.34])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 732CF4006C96;
        Fri,  7 Jul 2023 00:30:50 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] arm64: dts: renesas: rzg2l-smarc: Add support for enabling MTU3
Date:   Thu,  6 Jul 2023 16:30:47 +0100
Message-Id: <20230706153047.368993-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.0 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for PMOD_MTU3 macro to enable MTU3 node on RZ/{G2,V2}L SMARC
EVK.

The MTU3a PWM pins are muxed with spi1 pins and counter external input
phase clock pins are muxed with scif2 pins. Disable these IPs when
PMOD_MTU3 macro is enabled.

Apart from this, the counter Z phase clock signal is muxed with the
SDHI1 cd signal. So disable SDHI1 IP, when the counter Z phase signal
is enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Renamed macro MTU3->PMOD_MTU3.
 * Moved macro "PMOD1_SER0" from common dts to board-specific dts
   and added an error check as it is mutually exclusive with PMOD_MTU3
   macro.
 * Moved mtu3-zphase-clk pin definition to rzg2l-smarc-pinfunction.dtsi.
 * Moved mtu3 node to common dts.
 * Moved macro definitions before dtsi includes, so that macros are
   visible on these files.
---
 .../boot/dts/renesas/r9a07g044l2-smarc.dts    | 20 ++++++++++++++++
 .../boot/dts/renesas/r9a07g054l2-smarc.dts    | 20 ++++++++++++++++
 .../dts/renesas/rzg2l-smarc-pinfunction.dtsi  | 20 ++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 23 ++++++++++++++++---
 4 files changed, 80 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
index bc2af6c92ccd..7219e785b74c 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
@@ -6,6 +6,26 @@
  */
 
 /dts-v1/;
+
+/* Enable SCIF2 (SER0) on PMOD1 (CN7) */
+#define PMOD1_SER0	1
+
+/*
+ * To enable MTU3a PWM on PMOD0,
+ * Disable PMOD1_SER0 by setting "#define PMOD1_SER0	0" above and
+ * enable PMOD_MTU3 by setting "#define PMOD_MTU3	1" below.
+ */
+#define PMOD_MTU3	0
+
+#if (PMOD_MTU3 && PMOD1_SER0)
+#error "Cannot set as PMOD_MTU3 and PMOD1_SER0 are mutually exclusive "
+#endif
+
+#define MTU3_COUNTER_Z_PHASE_SIGNAL	0
+#if (!PMOD_MTU3 && MTU3_COUNTER_Z_PHASE_SIGNAL)
+#error "Cannot set 1 to MTU3_COUNTER_Z_PHASE_SIGNAL as PMOD_MTU3=0"
+#endif
+
 #include "r9a07g044l2.dtsi"
 #include "rzg2l-smarc-som.dtsi"
 #include "rzg2l-smarc-pinfunction.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
index 3d01a4cf0fbe..b3e6016880dd 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
@@ -6,6 +6,26 @@
  */
 
 /dts-v1/;
+
+/* Enable SCIF2 (SER0) on PMOD1 (CN7) */
+#define PMOD1_SER0	1
+
+/*
+ * To enable MTU3a PWM on PMOD0,
+ * Disable PMOD1_SER0 by setting "#define PMOD1_SER0	0" above and
+ * enable PMOD_MTU3 by setting "#define PMOD_MTU3	1" below.
+ */
+#define PMOD_MTU3	0
+
+#if (PMOD_MTU3 && PMOD1_SER0)
+#error "Cannot set as PMOD_MTU3 and PMOD1_SER0 are mutually exclusive "
+#endif
+
+#define MTU3_COUNTER_Z_PHASE_SIGNAL	0
+#if (!PMOD_MTU3 && MTU3_COUNTER_Z_PHASE_SIGNAL)
+#error "Cannot set 1 to MTU3_COUNTER_Z_PHASE_SIGNAL as PMOD_MTU3=0"
+#endif
+
 #include "r9a07g054l2.dtsi"
 #include "rzg2l-smarc-som.dtsi"
 #include "rzg2l-smarc-pinfunction.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
index 9085d8c76ce1..18c526c7a4cf 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
@@ -53,6 +53,26 @@ i2c3_pins: i2c3 {
 			 <RZG2L_PORT_PINMUX(18, 1, 3)>; /* SCL */
 	};
 
+	mtu3_pins: mtu3 {
+		mtu3-ext-clk-input-pin {
+			pinmux = <RZG2L_PORT_PINMUX(48, 0, 4)>, /* MTCLKA */
+				 <RZG2L_PORT_PINMUX(48, 1, 4)>; /* MTCLKB */
+		};
+
+		mtu3-pwm {
+			pinmux = <RZG2L_PORT_PINMUX(44, 0, 4)>, /* MTIOC3A */
+				 <RZG2L_PORT_PINMUX(44, 1, 4)>, /* MTIOC3B */
+				 <RZG2L_PORT_PINMUX(44, 2, 4)>, /* MTIOC3C */
+				 <RZG2L_PORT_PINMUX(44, 3, 4)>; /* MTIOC3D */
+		};
+
+#if MTU3_COUNTER_Z_PHASE_SIGNAL
+		mtu3-zphase-clk {
+			pinmux = <RZG2L_PORT_PINMUX(19, 0, 3)>; /* MTIOC1A */
+		};
+#endif /* MTU3_COUNTER_Z_PHASE_SIGNAL */
+	};
+
 	scif0_pins: scif0 {
 		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>,	/* TxD */
 			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index 2a158a954b2f..68eab8e26bf2 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -8,9 +8,6 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
-/* comment the #define statement to disable SCIF2 (SER0) on PMOD1 (CN7) */
-#define PMOD1_SER0	1
-
 / {
 	aliases {
 		serial1 = &scif2;
@@ -115,6 +112,26 @@ wm8978: codec@1a {
 	};
 };
 
+#if PMOD_MTU3
+&mtu3 {
+	pinctrl-0 = <&mtu3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+#if MTU3_COUNTER_Z_PHASE_SIGNAL
+/* SDHI cd pin is muxed with counter Z phase signal */
+&sdhi1 {
+	status = "disabled";
+};
+#endif /* MTU3_COUNTER_Z_PHASE_SIGNAL */
+
+&spi1 {
+	status = "disabled";
+};
+#endif /* PMOD_MTU3 */
+
 /*
  * To enable SCIF2 (SER0) on PMOD1 (CN7)
  * SW1 should be at position 2->3 so that SER0_CTS# line is activated
-- 
2.25.1

