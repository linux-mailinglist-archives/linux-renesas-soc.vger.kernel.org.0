Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 403E374B4BD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jul 2023 17:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbjGGP65 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jul 2023 11:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjGGP64 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jul 2023 11:58:56 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DADA51BC3;
        Fri,  7 Jul 2023 08:58:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,189,1684767600"; 
   d="scan'208";a="171099728"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Jul 2023 00:58:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.190])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7C4104014CD9;
        Sat,  8 Jul 2023 00:58:51 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: rzg2lc-smarc: Add support for enabling MTU3
Date:   Fri,  7 Jul 2023 16:58:49 +0100
Message-Id: <20230707155849.86649-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.0 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for PMOD_MTU3 macro to enable MTU3 node on RZ/G2LC SMARC
EVK.

The MTU3a PWM pins on PMOD0 are muxed with SPI1. Disable SPI1, when
PMOD_MTU3 macro is enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts  | 12 ++++++++++++
 .../boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi |  9 +++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      | 14 +++++++++++++-
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
index f67a6f125d9c..0b90367b6d1e 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
@@ -35,6 +35,18 @@
 /* comment the #define statement to disable SCIF1 (SER0) on PMOD1 (CN7) */
 #define PMOD1_SER0	1
 
+/*
+ * To enable MTU3a PWM on PMOD0,
+ *  - Set DIP-Switch SW1-4 to Off position.
+ *  - Set SW_RSPI_CAN macro to 0.
+ *  - Set PMOD_MTU3 macro to 1.
+ */
+#define PMOD_MTU3	0
+
+#if (PMOD_MTU3 && SW_RSPI_CAN)
+#error "Cannot set as both PMOD_MTU3 and SW_RSPI_CAN are mutually exclusive"
+#endif
+
 #include "r9a07g044c2.dtsi"
 #include "rzg2lc-smarc-som.dtsi"
 #include "rzg2lc-smarc.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
index a78a8def363e..92c64d58349f 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
@@ -50,6 +50,15 @@ i2c2_pins: i2c2 {
 			 <RZG2L_PORT_PINMUX(42, 4, 1)>; /* SCL */
 	};
 
+	mtu3_pins: mtu3 {
+		mtu3-pwm {
+			pinmux = <RZG2L_PORT_PINMUX(44, 0, 4)>, /* MTIOC3A */
+				 <RZG2L_PORT_PINMUX(44, 1, 4)>, /* MTIOC3B */
+				 <RZG2L_PORT_PINMUX(44, 2, 4)>, /* MTIOC3C */
+				 <RZG2L_PORT_PINMUX(44, 3, 4)>; /* MTIOC3D */
+		};
+	};
+
 	scif0_pins: scif0 {
 		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>,	/* TxD */
 			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index 6818fd49b2be..83fce96a2575 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -11,7 +11,6 @@
 #include "rzg2lc-smarc-pinfunction.dtsi"
 #include "rz-smarc-common.dtsi"
 
-
 / {
 	aliases {
 		serial1 = &scif1;
@@ -129,6 +128,19 @@ wm8978: codec@1a {
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
+&spi1 {
+	status = "disabled";
+};
+#endif
+
 /*
  * To enable SCIF1 (SER0) on PMOD1 (CN7), On connector board
  * SW1 should be at position 2->3 so that SER0_CTS# line is activated
-- 
2.25.1

