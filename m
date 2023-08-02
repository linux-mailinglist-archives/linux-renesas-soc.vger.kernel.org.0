Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 272CF76CC96
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Aug 2023 14:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232119AbjHBMZa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Aug 2023 08:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233782AbjHBMZ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Aug 2023 08:25:29 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 92648269E;
        Wed,  2 Aug 2023 05:25:27 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,249,1684767600"; 
   d="scan'208";a="171675629"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Aug 2023 21:25:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.171])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 521A341D1750;
        Wed,  2 Aug 2023 21:25:24 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: rz-smarc-common: Use versa3 clk for audio mclk
Date:   Wed,  2 Aug 2023 13:25:10 +0100
Message-Id: <20230802122510.275420-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230802122510.275420-1-biju.das.jz@bp.renesas.com>
References: <20230802122510.275420-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently audio mclk uses a fixed clk of 11.2896MHz (multiple of 44.1kHz).
Replace this fixed clk with the programmable versa3 clk that can provide
the clocking to support both 44.1kHz (with a clock of 11.2896MHz) and
48kHz (with a clock of 12.2880MHz), based on audio sampling rate for
playback and record.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
prev v1->v1:
 * Added this patch as part of this series.
 * Replaced xtal->x1-clock and x1_x2->x1.
 * Added clock-output-names.
 * Updated clock-frequency = <400000> for RZ/G2UL i2c0
 * Updated assigned-clocks and assigned-clock-rates as per bindings.
 * Replaced mclk from '<&versa3 3>'->'<&versa3 2>'.
---
 .../boot/dts/renesas/rz-smarc-common.dtsi     | 14 +++++-----
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 23 ++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 23 ++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi | 27 +++++++++++++++++++
 4 files changed, 80 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
index a7594ba3a998..b7a3e6caa386 100644
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
@@ -55,7 +49,7 @@ cpu_dai: simple-audio-card,cpu {
 		};
 
 		codec_dai: simple-audio-card,codec {
-			clocks = <&audio_mclock>;
+			clocks = <&versa3 2>;
 			sound-dai = <&wm8978>;
 		};
 	};
@@ -76,6 +70,12 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 		gpios-states = <1>;
 		states = <3300000 1>, <1800000 0>;
 	};
+
+	x1: x1-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
 };
 
 &audio_clk1 {
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index 68eab8e26bf2..186ca8f305db 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -105,6 +105,29 @@ &i2c3 {
 
 	status = "okay";
 
+	versa3: versa3@68 {
+		compatible = "renesas,5p35023";
+		reg = <0x68>;
+		#clock-cells = <1>;
+		clocks = <&x1>;
+
+		renesas,settings = [
+			80 00 11 19 4c 02 23 7f 83 19 08 a9 5f 25 24 bf
+			00 14 7a e1 00 00 00 00 01 55 59 bb 3f 30 90 b6
+			80 b0 45 c4 95
+		];
+
+		clock-output-names = "ref", "se1", "se2", "se3",
+				     "diff1", "diff2";
+
+		assigned-clocks = <&versa3 0>, <&versa3 1>,
+				  <&versa3 2>, <&versa3 3>,
+				  <&versa3 4>, <&versa3 5>;
+		assigned-clock-rates = <24000000>, <11289600>,
+				       <11289600>, <12000000>,
+				       <25000000>, <12288000>;
+	};
+
 	wm8978: codec@1a {
 		compatible = "wlf,wm8978";
 		#sound-dai-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index 83fce96a2575..5abac6bc03c9 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -121,6 +121,29 @@ &i2c2 {
 
 	status = "okay";
 
+	versa3: versa3@68 {
+		compatible = "renesas,5p35023";
+		reg = <0x68>;
+		#clock-cells = <1>;
+		clocks = <&x1>;
+
+		renesas,settings = [
+			80 00 11 19 4c 02 23 7f 83 19 08 a9 5f 25 24 bf
+			00 14 7a e1 00 00 00 00 01 55 59 bb 3f 30 90 b6
+			80 b0 45 c4 95
+		];
+
+		clock-output-names = "ref", "se1", "se2", "se3",
+				     "diff1", "diff2";
+
+		assigned-clocks = <&versa3 0>, <&versa3 1>,
+				  <&versa3 2>, <&versa3 3>,
+				  <&versa3 4>, <&versa3 5>;
+		assigned-clock-rates = <24000000>, <11289600>,
+				       <11289600>, <12000000>,
+				       <25000000>, <12288000>;
+	};
+
 	wm8978: codec@1a {
 		compatible = "wlf,wm8978";
 		#sound-dai-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
index 8eb411aac80d..7e0a5814824e 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
@@ -20,6 +20,33 @@ &cpu_dai {
 	sound-dai = <&ssi1>;
 };
 
+&i2c0 {
+	clock-frequency = <400000>;
+
+	versa3: versa3@68 {
+		compatible = "renesas,5p35023";
+		reg = <0x68>;
+		#clock-cells = <1>;
+		clocks = <&x1>;
+
+		renesas,settings = [
+			80 00 11 19 4c 02 23 7f 83 19 08 a9 5f 25 24 bf
+			00 14 7a e1 00 00 00 00 01 55 59 bb 3f 30 90 b6
+			80 b0 45 c4 95
+		];
+
+		clock-output-names = "ref", "se1", "se2", "se3",
+				     "diff1", "diff2";
+
+		assigned-clocks = <&versa3 0>, <&versa3 1>,
+				  <&versa3 2>, <&versa3 3>,
+				  <&versa3 4>, <&versa3 5>;
+		assigned-clock-rates = <24000000>, <11289600>,
+				       <11289600>, <12000000>,
+				       <25000000>, <12288000>;
+	};
+};
+
 &i2c1 {
 	wm8978: codec@1a {
 		compatible = "wlf,wm8978";
-- 
2.25.1

