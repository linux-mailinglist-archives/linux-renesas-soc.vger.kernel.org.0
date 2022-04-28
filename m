Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9435251399D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 18:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349893AbiD1QW5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 12:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349882AbiD1QW5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 12:22:57 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3738C5C85E;
        Thu, 28 Apr 2022 09:19:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,295,1647270000"; 
   d="scan'208";a="118337581"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Apr 2022 01:19:41 +0900
Received: from localhost.localdomain (unknown [10.226.92.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DECE64010DC0;
        Fri, 29 Apr 2022 01:19:38 +0900 (JST)
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
Subject: [PATCH v2 1/3] arm64: dts: renesas: rzg2l-smarc: Move ssi0 and cpu sound_dai nodes from common dtsi
Date:   Thu, 28 Apr 2022 17:19:30 +0100
Message-Id: <20220428161932.20370-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428161932.20370-1-biju.das.jz@bp.renesas.com>
References: <20220428161932.20370-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On RZ/G2{L,LC} SoM module, the wm8978 audio codec is connected to ssi0,
whereas on RZ/G2UL it is connected to ssi1. So move ssi0 and cpu
sound_dai nodes from common dtsi to soc specific dtsi.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Fixed commit description
 * started using cpu_dai node instead of snd_rzg2l in board dtsi.
---
 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts |  6 ------
 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi   |  8 --------
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       | 11 +++++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      | 11 +++++++++++
 4 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
index df27b63f0465..52ee1640c3c1 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
@@ -54,12 +54,6 @@ &spi1 {
 	status = "disabled";
 };
 
-&ssi0 {
-	/delete-property/ pinctrl-0;
-	/delete-property/ pinctrl-names;
-	status = "disabled";
-};
-
 &usb2_phy0 {
 	/delete-property/ pinctrl-0;
 	/delete-property/ pinctrl-names;
diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
index 0e61b85efb43..3962d47b3e59 100644
--- a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
@@ -52,7 +52,6 @@ snd_rzg2l: sound {
 			    "Mic Bias", "Microphone Jack";
 
 		cpu_dai: simple-audio-card,cpu {
-			sound-dai = <&ssi0>;
 		};
 
 		codec_dai: simple-audio-card,codec {
@@ -168,13 +167,6 @@ &spi1 {
 	status = "okay";
 };
 
-&ssi0 {
-	pinctrl-0 = <&ssi0_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
 &usb2_phy0 {
 	pinctrl-0 = <&usb0_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index aadc41515093..e180a955b6ac 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -18,6 +18,10 @@ aliases {
 	};
 };
 
+&cpu_dai {
+	sound-dai = <&ssi0>;
+};
+
 &i2c3 {
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "default";
@@ -49,6 +53,13 @@ &scif2 {
 };
 #endif
 
+&ssi0 {
+	pinctrl-0 = <&ssi0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &vccq_sdhi1 {
 	gpios = <&pinctrl RZG2L_GPIO(39, 1) GPIO_ACTIVE_HIGH>;
 };
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index 74a844ea7537..aa170492dd2b 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -60,6 +60,10 @@ &canfd {
 };
 #endif
 
+&cpu_dai {
+	sound-dai = <&ssi0>;
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -91,6 +95,13 @@ &scif1 {
 };
 #endif
 
+&ssi0 {
+	pinctrl-0 = <&ssi0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 #if (SW_RSPI_CAN)
 &spi1 {
 	/delete-property/ pinctrl-0;
-- 
2.25.1

