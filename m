Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABA6B6D5B99
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Apr 2023 11:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234282AbjDDJJ2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Apr 2023 05:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbjDDJJH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2023 05:09:07 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F06FA3AB1;
        Tue,  4 Apr 2023 02:08:39 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,317,1673881200"; 
   d="scan'208";a="154821120"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Apr 2023 18:08:38 +0900
Received: from localhost.localdomain (unknown [10.226.93.86])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 72628424A67F;
        Tue,  4 Apr 2023 18:08:36 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 3/3] arm64: dts: renesas: rzg2l-smarc: Use versa3 clk for audio mclk
Date:   Tue,  4 Apr 2023 10:08:23 +0100
Message-Id: <20230404090823.148226-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230404090823.148226-1-biju.das.jz@bp.renesas.com>
References: <20230404090823.148226-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
v3->v4:
 * No change.
v2->v3:
 * Updated the changes for RZ/G2LC and RZ/G2{UL, Five}.
RFC->v2:
 * No change
RFC:
 * New patch
---
 .../boot/dts/renesas/rz-smarc-common.dtsi     | 13 +++++-----
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 23 +++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 23 +++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi | 25 +++++++++++++++++++
 4 files changed, 77 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
index 3962d47b3e59..ca868af2db38 100644
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
@@ -76,6 +69,12 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 		gpios-states = <1>;
 		states = <3300000 1>, <1800000 0>;
 	};
+
+	x1_x2: xtal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
 };
 
 &audio_clk1{
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index e180a955b6ac..9fb3cd07faa3 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -18,6 +18,10 @@ aliases {
 	};
 };
 
+&codec_dai {
+	clocks = <&versa3 3>;
+};
+
 &cpu_dai {
 	sound-dai = <&ssi0>;
 };
@@ -29,6 +33,25 @@ &i2c3 {
 
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
+		assigned-clocks = <&versa3 0>, <&versa3 1>,
+				  <&versa3 2>, <&versa3 3>,
+				  <&versa3 4>, <&versa3 5>;
+		assigned-clock-rates = <12288000>, <25000000>,
+				       <12000000>, <11289600>,
+				       <11289600>, <24000000>;
+	};
+
 	wm8978: codec@1a {
 		compatible = "wlf,wm8978";
 		#sound-dai-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index b6bd27196d88..ba91b2e653bc 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -32,6 +32,10 @@ &canfd {
 };
 #endif
 
+&codec_dai {
+	clocks = <&versa3 3>;
+};
+
 &cpu_dai {
 	sound-dai = <&ssi0>;
 };
@@ -43,6 +47,25 @@ &i2c2 {
 
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
+		assigned-clocks = <&versa3 0>, <&versa3 1>,
+				  <&versa3 2>, <&versa3 3>,
+				  <&versa3 4>, <&versa3 5>;
+		assigned-clock-rates = <12288000>, <25000000>,
+				       <12000000>, <11289600>,
+				       <11289600>, <24000000>;
+	};
+
 	wm8978: codec@1a {
 		compatible = "wlf,wm8978";
 		#sound-dai-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
index 2a1331ed1a5c..85383f86cf2e 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
@@ -16,10 +16,35 @@ &canfd {
 };
 #endif
 
+&codec_dai {
+	clocks = <&versa3 3>;
+};
+
 &cpu_dai {
 	sound-dai = <&ssi1>;
 };
 
+&i2c0 {
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
+		assigned-clocks = <&versa3 0>, <&versa3 1>,
+				  <&versa3 2>, <&versa3 3>,
+				  <&versa3 4>, <&versa3 5>;
+		assigned-clock-rates = <12288000>, <25000000>,
+				       <12000000>, <11289600>,
+				       <11289600>, <24000000>;
+	};
+};
+
 &i2c1 {
 	wm8978: codec@1a {
 		compatible = "wlf,wm8978";
-- 
2.25.1

