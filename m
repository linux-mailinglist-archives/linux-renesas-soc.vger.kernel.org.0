Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 358A9745D4D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jul 2023 15:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbjGCN3r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Jul 2023 09:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjGCN3q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jul 2023 09:29:46 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 69D9310C8;
        Mon,  3 Jul 2023 06:29:35 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,178,1684767600"; 
   d="scan'208";a="170243840"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Jul 2023 22:29:34 +0900
Received: from localhost.localdomain (unknown [10.226.93.24])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EBDD44001B5F;
        Mon,  3 Jul 2023 22:29:31 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r9a07g0{4,5}4: Add support for enabling MTU3
Date:   Mon,  3 Jul 2023 14:29:29 +0100
Message-Id: <20230703132929.356009-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.0 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for MTU3 macro to enable MTU3 node on RZ/{G2,V2}L SMARC EVK.

The MTU3a PWM pins are muxed with spi1 pins and counter external input
phase clock pins are muxed with scif2 pins. Disable these IPs when MTU3
macro is enabled.

Apart from this, the counter Z phase clock signal is muxed with the
SDHI1 cd signal. So disable SDHI1 IP, when the counter Z phase signal
is enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a07g044l2-smarc.dts    | 36 +++++++++++++++++++
 .../boot/dts/renesas/r9a07g054l2-smarc.dts    | 36 +++++++++++++++++++
 .../dts/renesas/rzg2l-smarc-pinfunction.dtsi  | 14 ++++++++
 3 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
index bc2af6c92ccd..03cbae78d640 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
@@ -12,7 +12,43 @@
 #include "rz-smarc-common.dtsi"
 #include "rzg2l-smarc.dtsi"
 
+#define MTU3	0
+#define MTU3_COUNTER_Z_PHASE_SIGNAL	0
+#if (!MTU3 && MTU3_COUNTER_Z_PHASE_SIGNAL)
+#error "Cannot set 1 to MTU3_COUNTER_Z_PHASE_SIGNAL as MTU3=0"
+#endif
+
 / {
 	model = "Renesas SMARC EVK based on r9a07g044l2";
 	compatible = "renesas,smarc-evk", "renesas,r9a07g044l2", "renesas,r9a07g044";
 };
+
+#if MTU3
+&mtu3 {
+	pinctrl-0 = <&mtu3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&scif2 {
+	status = "disabled";
+};
+
+#if MTU3_COUNTER_Z_PHASE_SIGNAL
+/* SDHI cd pin is used for counter Z phase signal */
+&mtu3_pins {
+	mtu3-zphase-clk {
+		pinmux = <RZG2L_PORT_PINMUX(19, 0, 3)>; /* MTIOC1A */
+	};
+};
+
+&sdhi1 {
+	status = "disabled";
+};
+#endif /* MTU3_COUNTER_Z_PHASE_SIGNAL */
+
+&spi1 {
+	status = "disabled";
+};
+#endif /* MTU3 */
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
index 3d01a4cf0fbe..4186bfe739fa 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
@@ -12,7 +12,43 @@
 #include "rz-smarc-common.dtsi"
 #include "rzg2l-smarc.dtsi"
 
+#define MTU3	0
+#define MTU3_COUNTER_Z_PHASE_SIGNAL	0
+#if (!MTU3 && MTU3_COUNTER_Z_PHASE_SIGNAL)
+#error "Cannot set 1 to MTU3_COUNTER_Z_PHASE_SIGNAL as MTU3=0"
+#endif
+
 / {
 	model = "Renesas SMARC EVK based on r9a07g054l2";
 	compatible = "renesas,smarc-evk", "renesas,r9a07g054l2", "renesas,r9a07g054";
 };
+
+#if MTU3
+&mtu3 {
+	pinctrl-0 = <&mtu3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&scif2 {
+	status = "disabled";
+};
+
+#if MTU3_COUNTER_Z_PHASE_SIGNAL
+/* SDHI cd pin is used for counter Z phase signal */
+&mtu3_pins {
+	mtu3-zphase-clk {
+		pinmux = <RZG2L_PORT_PINMUX(19, 0, 3)>; /* MTIOC1A */
+	};
+};
+
+&sdhi1 {
+	status = "disabled";
+};
+#endif /* MTU3_COUNTER_Z_PHASE_SIGNAL */
+
+&spi1 {
+	status = "disabled";
+};
+#endif /* MTU3 */
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
index 9085d8c76ce1..e8fbadd44af9 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
@@ -53,6 +53,20 @@ i2c3_pins: i2c3 {
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
+	};
+
 	scif0_pins: scif0 {
 		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>,	/* TxD */
 			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
-- 
2.25.1

