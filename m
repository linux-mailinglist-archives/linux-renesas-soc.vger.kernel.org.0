Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A306C6B2B78
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 18:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbjCIRB1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 12:01:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjCIRAp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 12:00:45 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BA1CD28D3A;
        Thu,  9 Mar 2023 08:55:45 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.98,246,1673881200"; 
   d="scan'208";a="155417079"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 10 Mar 2023 01:55:44 +0900
Received: from localhost.localdomain (unknown [10.226.92.41])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6C44B4006DEA;
        Fri, 10 Mar 2023 01:55:42 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/3] arm64: dts: renesas: rzg2l-smarc: Use versa3 clk for audio mclk
Date:   Thu,  9 Mar 2023 16:55:29 +0000
Message-Id: <20230309165529.223052-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230309165529.223052-1-biju.das.jz@bp.renesas.com>
References: <20230309165529.223052-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently audio mclk uses a fixed clk 11.2896MHz(multiple of 44.1KHz).
Replace this fixed clk to programmable versa3 clk that can provide
2 rates 11.2896MHz and 12.2880(multiple of 48KHz) based on audio
sampling rate for the playback/record.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/rz-smarc-common.dtsi     |  7 ----
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
index 3962d47b3e59..d724f49bd067 100644
--- a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
@@ -32,12 +32,6 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	audio_mclock: audio_mclock {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <11289600>;
-	};
-
 	snd_rzg2l: sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
@@ -55,7 +49,6 @@ cpu_dai: simple-audio-card,cpu {
 		};
 
 		codec_dai: simple-audio-card,codec {
-			clocks = <&audio_mclock>;
 			sound-dai = <&wm8978>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index e180a955b6ac..4a84076cc85e 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -16,12 +16,22 @@ aliases {
 		serial1 = &scif2;
 		i2c3 = &i2c3;
 	};
+
+	x1_x2: xtal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
 };
 
 &cpu_dai {
 	sound-dai = <&ssi0>;
 };
 
+&codec_dai {
+	clocks = <&versa3 3>;
+};
+
 &i2c3 {
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "default";
@@ -29,6 +39,28 @@ &i2c3 {
 
 	status = "okay";
 
+	versa3: versa3@68 {
+		compatible = "renesas,5p35023";
+		reg = <0x68>;
+		#clock-cells = <1>;
+		clocks = <&x1_x2>;
+
+		renesas,settings = [
+			80 00 11 19 4c 02 23 7f 83 19 08 a9 5f 25 24 bf
+			00 14 7a e1 00 00 00 00 01 55 59 bb 3f 30 90 b6
+			80 b0 45 c4 95
+		];
+		assigned-clocks = <&versa3 0>,
+				  <&versa3 1>,
+				  <&versa3 2>,
+				  <&versa3 3>,
+				  <&versa3 4>,
+				  <&versa3 5>;
+		assigned-clock-rates =	<12288000>, <25000000>,
+					<12000000>, <11289600>,
+					<11289600>, <24000000>;
+	};
+
 	wm8978: codec@1a {
 		compatible = "wlf,wm8978";
 		#sound-dai-cells = <0>;
-- 
2.25.1

