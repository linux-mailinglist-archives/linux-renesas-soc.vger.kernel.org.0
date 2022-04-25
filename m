Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2BFA50E67E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 19:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243754AbiDYRJb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 13:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243739AbiDYRJY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 13:09:24 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DA90038D9C;
        Mon, 25 Apr 2022 10:06:17 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,288,1643641200"; 
   d="scan'208";a="119104528"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Apr 2022 02:06:17 +0900
Received: from localhost.localdomain (unknown [10.226.93.95])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E63F14004D06;
        Tue, 26 Apr 2022 02:06:13 +0900 (JST)
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
Subject: [PATCH 11/13] arm64: dts: renesas: rzg2ul-smarc: Enable CANFD
Date:   Mon, 25 Apr 2022 18:05:28 +0100
Message-Id: <20220425170530.200921-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425170530.200921-1-biju.das.jz@bp.renesas.com>
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable CANFD on RZ/G2UL SMARC platform.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   |  6 ----
 .../dts/renesas/rzg2ul-smarc-pinfunction.dtsi | 28 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi |  8 ++++++
 3 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
index 54f30adf5f64..2d740bd420ca 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
@@ -14,12 +14,6 @@ / {
 	compatible = "renesas,smarc-evk", "renesas,r9a07g043u11", "renesas,r9a07g043";
 };
 
-&canfd {
-	/delete-property/ pinctrl-0;
-	/delete-property/ pinctrl-names;
-	status = "disabled";
-};
-
 &spi1 {
 	/delete-property/ pinctrl-0;
 	/delete-property/ pinctrl-names;
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
index c5a07ed5bca7..0456c40bdcad 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
@@ -12,6 +12,34 @@ &pinctrl {
 	pinctrl-0 = <&sound_clk_pins>;
 	pinctrl-names = "default";
 
+	can0_pins: can0 {
+		pinmux = <RZG2L_PORT_PINMUX(1, 1, 3)>, /* TX */
+			 <RZG2L_PORT_PINMUX(1, 2, 3)>; /* RX */
+	};
+
+#if (SW_ET0_EN_N)
+	can0-stb-hog {
+		gpio-hog;
+		gpios = <RZG2L_GPIO(2, 2) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "can0_stb";
+	};
+#endif
+
+	can1_pins: can1 {
+		pinmux = <RZG2L_PORT_PINMUX(2, 0, 3)>, /* TX */
+			 <RZG2L_PORT_PINMUX(2, 1, 3)>; /* RX */
+	};
+
+#if (SW_ET0_EN_N)
+	can1-stb-hog {
+		gpio-hog;
+		gpios = <RZG2L_GPIO(2, 3) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "can1_stb";
+	};
+#endif
+
 	i2c0_pins: i2c0 {
 		pins = "RIIC0_SDA", "RIIC0_SCL";
 		input-enable;
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
index 0f7a9f000c5a..371bd34d7ae3 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
@@ -19,6 +19,14 @@
 #include "rzg2ul-smarc-pinfunction.dtsi"
 #include "rz-smarc-common.dtsi"
 
+#if (!SW_ET0_EN_N)
+&canfd {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+	status = "disabled";
+};
+#endif
+
 &i2c1 {
 	wm8978: codec@1a {
 		compatible = "wlf,wm8978";
-- 
2.25.1

