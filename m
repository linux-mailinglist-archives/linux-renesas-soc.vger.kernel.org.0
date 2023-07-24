Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE31175EEFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jul 2023 11:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbjGXJUE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jul 2023 05:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232230AbjGXJUD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jul 2023 05:20:03 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 84991E41;
        Mon, 24 Jul 2023 02:20:01 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,228,1684767600"; 
   d="scan'208";a="170613747"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Jul 2023 18:20:00 +0900
Received: from localhost.localdomain (unknown [10.226.92.186])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CB9574155DE0;
        Mon, 24 Jul 2023 18:19:57 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 6/6] arm64: dts: renesas: rzg2ul-smarc: Add support for enabling MTU3
Date:   Mon, 24 Jul 2023 10:19:27 +0100
Message-Id: <20230724091927.123847-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230724091927.123847-1-biju.das.jz@bp.renesas.com>
References: <20230724091927.123847-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for PMOD_MTU3 macro to enable MTU3 node on RZ/G2UL SMARC
EVK.

The MTU3a PWM pins on PMOD0 are muxed with SPI1. Disable SPI1, when
PMOD_MTU3 macro is enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2: No change.
---
 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts  | 11 +++++++++++
 .../boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi  |  6 ++++++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi       | 13 +++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
index 01483b4302c2..8e0107df2d46 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
@@ -17,6 +17,17 @@
 #define SW_SW0_DEV_SEL	1
 #define SW_ET0_EN_N	1
 
+/*
+ * To enable MTU3a PWM on PMOD0,
+ *  - Set DIP-Switch SW1-3 to On position.
+ *  - Set PMOD_MTU3 macro to 1.
+ */
+#define PMOD_MTU3	0
+
+#if (PMOD_MTU3 && !SW_ET0_EN_N)
+#error "Cannot set as both PMOD_MTU3 and !SW_ET0_EN_N are mutually exclusive"
+#endif
+
 #include "r9a07g043u.dtsi"
 #include "rzg2ul-smarc-som.dtsi"
 #include "rzg2ul-smarc.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
index 58923dc83faa..355694fe4af6 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
@@ -50,6 +50,12 @@ i2c1_pins: i2c1 {
 		input-enable;
 	};
 
+	mtu3_pins: mtu3 {
+		mtu2-pwm {
+			pinmux = <RZG2L_PORT_PINMUX(4, 0, 4)>; /* MTIOC2A */
+		};
+	};
+
 	scif0_pins: scif0 {
 		pinmux = <RZG2L_PORT_PINMUX(6, 4, 6)>, /* TxD */
 			 <RZG2L_PORT_PINMUX(6, 3, 6)>; /* RxD */
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
index 2a1331ed1a5c..8eb411aac80d 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
@@ -28,6 +28,19 @@ wm8978: codec@1a {
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
 #if (SW_ET0_EN_N)
 &ssi1 {
 	pinctrl-0 = <&ssi1_pins>;
-- 
2.25.1

