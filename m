Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CABE4515B33
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 Apr 2022 09:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240657AbiD3IDH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 30 Apr 2022 04:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241443AbiD3IDE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 30 Apr 2022 04:03:04 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0E6FE91571;
        Sat, 30 Apr 2022 00:59:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,187,1647270000"; 
   d="scan'208";a="119653200"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 30 Apr 2022 16:59:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.1])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9C40240065B7;
        Sat, 30 Apr 2022 16:59:39 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC 5/5] [HACK] PWM testing
Date:   Sat, 30 Apr 2022 08:59:15 +0100
Message-Id: <20220430075915.5036-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220430075915.5036-1-biju.das.jz@bp.renesas.com>
References: <20220430075915.5036-1-biju.das.jz@bp.renesas.com>
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
 .../boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi  |  5 +++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       | 14 ++++++++++++++
 arch/arm64/configs/defconfig                       |  1 +
 arch/arm64/configs/renesas_defconfig               |  1 +
 4 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
index 9085d8c76ce1..55442c359b74 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
@@ -38,6 +38,11 @@ can1-stb-hog {
 		line-name = "can1_stb";
 	};
 
+	gpt4_pins: gpt {
+		pinmux = <RZG2L_PORT_PINMUX(43, 0, 2)>, /* GTIOC4A */
+			 <RZG2L_PORT_PINMUX(43, 1, 2)>; /* GTIOC4B */
+	};
+
 	i2c0_pins: i2c0 {
 		pins = "RIIC0_SDA", "RIIC0_SCL";
 		input-enable;
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index aadc41515093..2f9212def887 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -16,6 +16,20 @@ aliases {
 		serial1 = &scif2;
 		i2c3 = &i2c3;
 	};
+#if 0
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&gpt4 0 500000000>;
+		brightness-levels = <0 2 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+	};
+#endif
+};
+
+&gpt4 {
+	pinctrl-0 = <&gpt4_pins>;
+	pinctrl-names = "default";
+	status = "okay";
 };
 
 &i2c3 {
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2836f3c5d361..b8c1b2115e36 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1139,6 +1139,7 @@ CONFIG_PWM_MTK_DISP=m
 CONFIG_PWM_MEDIATEK=m
 CONFIG_PWM_RCAR=m
 CONFIG_PWM_RENESAS_TPU=m
+CONFIG_PWM_RZG2L_GPT=m
 CONFIG_PWM_ROCKCHIP=y
 CONFIG_PWM_SAMSUNG=y
 CONFIG_PWM_SL28CPLD=m
diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 8702f71b2e20..f86f5ab472da 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -354,6 +354,7 @@ CONFIG_RZG2L_ADC=y
 CONFIG_PWM=y
 CONFIG_PWM_RCAR=y
 CONFIG_PWM_RENESAS_TPU=y
+CONFIG_PWM_RZG2L_GPT=y
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
-- 
2.25.1

