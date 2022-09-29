Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF265EF389
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Sep 2022 12:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235532AbiI2KbT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Sep 2022 06:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235534AbiI2KbS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2022 06:31:18 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9BB6712AEF6;
        Thu, 29 Sep 2022 03:31:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,354,1654527600"; 
   d="scan'208";a="136619519"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 Sep 2022 19:31:16 +0900
Received: from localhost.localdomain (unknown [10.226.92.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 596BE400F7A2;
        Thu, 29 Sep 2022 19:31:13 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC 7/7] arm64: dts: renesas: rzg2l-smarc: [HACK] Enable MTU3 PWM channel 3 for PWM mode 1 testing
Date:   Thu, 29 Sep 2022 11:30:43 +0100
Message-Id: <20220929103043.1228235-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929103043.1228235-1-biju.das.jz@bp.renesas.com>
References: <20220929103043.1228235-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/rz-smarc-common.dtsi     |  2 ++
 .../dts/renesas/rzg2l-smarc-pinfunction.dtsi  | 11 ++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |  5 +++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 20 +++++++++++++++++++
 4 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
index 3962d47b3e59..1414cc8e99ca 100644
--- a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
@@ -160,12 +160,14 @@ &sdhi1 {
 	status = "okay";
 };
 
+#if 0
 &spi1 {
 	pinctrl-0 = <&spi1_pins>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
+#endif
 
 &usb2_phy0 {
 	pinctrl-0 = <&usb0_pins>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
index bd81028d5462..40772bde9d05 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
@@ -64,6 +64,15 @@ mtu3_clk {
 			pinmux = <RZG2L_PORT_PINMUX(48, 0, 4)>, /* MTCLKA */
 				 <RZG2L_PORT_PINMUX(48, 1, 4)>; /* MTLCKB */
 		};
+
+		mtu3_pwm {
+			pinmux =
+
+				<RZG2L_PORT_PINMUX(44, 0, 4)>, /* MTIOC3A */
+				<RZG2L_PORT_PINMUX(44, 1, 4)>, /* MTIOC3B */
+				<RZG2L_PORT_PINMUX(44, 2, 4)>, /* MTIOC3C */
+				<RZG2L_PORT_PINMUX(44, 3, 4)>; /* MTIOC3D */
+		};
 	};
 #endif
 
@@ -125,12 +134,14 @@ sound_clk_pins: sound_clk {
 		input-enable;
 	};
 
+#if 0
 	spi1_pins: spi1 {
 		pinmux = <RZG2L_PORT_PINMUX(44, 0, 1)>, /* CK */
 			 <RZG2L_PORT_PINMUX(44, 1, 1)>, /* MOSI */
 			 <RZG2L_PORT_PINMUX(44, 2, 1)>, /* MISO */
 			 <RZG2L_PORT_PINMUX(44, 3, 1)>; /* SSL */
 	};
+#endif
 
 	ssi0_pins: ssi0 {
 		pinmux = <RZG2L_PORT_PINMUX(45, 0, 1)>, /* BCK */
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index 6ce6e9434873..b9f8f1759fce 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -62,6 +62,11 @@ counter@1 {
 	counter@2 {
 		status = "okay";
 	};
+
+	pwm@3 {
+		renesas,pwm-mode1;
+		status = "okay";
+	};
 };
 #endif
 
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index 6be25a8a28db..f17428c5826d 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -18,6 +18,8 @@
  * Please change below macros according to SW1 setting
  */
 
+#define MTU3_PHASE_COUNTING_SUPPORT	1
+
 #define SW_SD0_DEV_SEL	1
 
 #define SW_SCIF_CAN	0
@@ -78,6 +80,24 @@ wm8978: codec@1a {
 	};
 };
 
+#if (MTU3_PHASE_COUNTING_SUPPORT)
+&mtu3 {
+	status = "okay";
+	counter@1 {
+		status = "okay";
+	};
+
+	counter@2 {
+		status = "okay";
+	};
+
+	pwm@3 {
+		renesas,pwm-mode1;
+		status = "okay";
+	};
+};
+#endif
+
 /*
  * To enable SCIF1 (SER0) on PMOD1 (CN7), On connector board
  * SW1 should be at position 2->3 so that SER0_CTS# line is activated
-- 
2.25.1

