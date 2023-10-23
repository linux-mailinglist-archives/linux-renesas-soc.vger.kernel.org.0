Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49A407D3878
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Oct 2023 15:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjJWNwf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Oct 2023 09:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbjJWNwb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2023 09:52:31 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8879FF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 06:52:26 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:375d:2b56:c03f:d72d])
        by xavier.telenet-ops.be with bizsmtp
        id 1RsQ2B0053CbNjd01RsQU8; Mon, 23 Oct 2023 15:52:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1quvLt-007KH9-1f;
        Mon, 23 Oct 2023 15:52:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1quvLz-007oKw-U2;
        Mon, 23 Oct 2023 15:52:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] ARM: dts: renesas: Add missing ADV751[13] power supply properties
Date:   Mon, 23 Oct 2023 15:52:16 +0200
Message-Id: <6c49fd83d327a68040f052bd9fd96fe25b0fc301.1698068647.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698068646.git.geert+renesas@glider.be>
References: <cover.1698068646.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

make dtbs_check:

    arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: hdmi@39: 'avdd-supply' is a required property
	    from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
    arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: hdmi@39: 'dvdd-supply' is a required property
	    from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
    arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: hdmi@39: 'pvdd-supply' is a required property
	    from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
    arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: hdmi@39: 'dvdd-3v-supply' is a required property
	    from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
    arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: hdmi@39: 'bgvdd-supply' is a required property
	    from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
    ...

Fix this by adding the missing power supply properties, and by adding
fixed regulators where needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi   | 15 ++++++++++++
 .../renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts | 15 ++++++++++++
 arch/arm/boot/dts/renesas/r8a7790-lager.dts   | 15 ++++++++++++
 arch/arm/boot/dts/renesas/r8a7790-stout.dts   | 15 ++++++++++++
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 24 +++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7791-porter.dts  | 24 +++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7792-blanche.dts | 15 ++++++++++++
 arch/arm/boot/dts/renesas/r8a7792-wheat.dts   | 21 ++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7793-gose.dts    | 24 +++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7794-silk.dts    | 15 ++++++++++++
 10 files changed, 183 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi b/arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi
index e10f99278c77aa41..de52218ceaa4c0e0 100644
--- a/arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi
+++ b/arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi
@@ -27,6 +27,15 @@ hdmi_con_out: endpoint {
 			};
 		};
 	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &can1 {
@@ -69,6 +78,12 @@ hdmi@39 {
 		clocks = <&cec_clock>;
 		clock-names = "cec";
 
+		avdd-supply = <&reg_1p8v>;
+		dvdd-supply = <&reg_1p8v>;
+		pvdd-supply = <&reg_1p8v>;
+		dvdd-3v-supply = <&reg_3p3v>;
+		bgvdd-supply = <&reg_1p8v>;
+
 		adi,input-depth = <8>;
 		adi,input-colorspace = "rgb";
 		adi,input-clock = "1x";
diff --git a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts
index b1f679da36b2ede1..a0b574398055ad2d 100644
--- a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts
+++ b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts
@@ -34,6 +34,15 @@ hdmi_con: endpoint {
 			};
 		};
 	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &du {
@@ -81,6 +90,12 @@ hdmi@39 {
 		clock-names = "cec";
 		pd-gpios = <&gpio2 24 GPIO_ACTIVE_HIGH>;
 
+		avdd-supply = <&reg_1p8v>;
+		dvdd-supply = <&reg_1p8v>;
+		pvdd-supply = <&reg_1p8v>;
+		dvdd-3v-supply = <&reg_3p3v>;
+		bgvdd-supply = <&reg_1p8v>;
+
 		adi,input-depth = <8>;
 		adi,input-colorspace = "rgb";
 		adi,input-clock = "1x";
diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 2567f5d297227ca9..3764ac7c9285193c 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -122,6 +122,15 @@ led8 {
 		};
 	};
 
+	fixedregulator1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	fixedregulator3v3: regulator-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-3.3V";
@@ -361,6 +370,12 @@ hdmi@39 {
 			clocks = <&cec_clock>;
 			clock-names = "cec";
 
+			avdd-supply = <&fixedregulator1v8>;
+			dvdd-supply = <&fixedregulator1v8>;
+			pvdd-supply = <&fixedregulator1v8>;
+			dvdd-3v-supply = <&fixedregulator3v3>;
+			bgvdd-supply = <&fixedregulator1v8>;
+
 			adi,input-depth = <8>;
 			adi,input-colorspace = "rgb";
 			adi,input-clock = "1x";
diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
index f9213927a1094649..537be288ce35944a 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
@@ -44,6 +44,15 @@ led5 {
 		};
 	};
 
+	fixedregulator1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	fixedregulator3v3: regulator-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-3.3V";
@@ -297,6 +306,12 @@ hdmi@39 {
 		clocks = <&osc4_clk>;
 		clock-names = "cec";
 
+		avdd-supply = <&fixedregulator1v8>;
+		dvdd-supply = <&fixedregulator1v8>;
+		pvdd-supply = <&fixedregulator1v8>;
+		dvdd-3v-supply = <&fixedregulator3v3>;
+		bgvdd-supply = <&fixedregulator1v8>;
+
 		adi,input-depth = <8>;
 		adi,input-colorspace = "rgb";
 		adi,input-clock = "1x";
diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
index 857d44571f9b9507..8dcf2a8a8ec28335 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
@@ -171,6 +171,24 @@ led8 {
 		};
 	};
 
+	reg_1p8v: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vcc_sdhi0: regulator-vcc-sdhi0 {
 		compatible = "regulator-fixed";
 
@@ -381,6 +399,12 @@ hdmi@39 {
 			clocks = <&cec_clock>;
 			clock-names = "cec";
 
+			avdd-supply = <&reg_1p8v>;
+			dvdd-supply = <&reg_1p8v>;
+			pvdd-supply = <&reg_1p8v>;
+			dvdd-3v-supply = <&reg_3p3v>;
+			bgvdd-supply = <&reg_1p8v>;
+
 			adi,input-depth = <8>;
 			adi,input-colorspace = "rgb";
 			adi,input-clock = "1x";
diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
index 950b7a22dee5743e..ee5b44d0f8f7126d 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
@@ -47,6 +47,24 @@ memory@200000000 {
 		reg = <2 0x00000000 0 0x40000000>;
 	};
 
+	reg_1p8v: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vcc_sdhi0: regulator-vcc-sdhi0 {
 		compatible = "regulator-fixed";
 
@@ -179,6 +197,12 @@ hdmi@39 {
 			interrupt-parent = <&gpio3>;
 			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
 
+			avdd-supply = <&reg_1p8v>;
+			dvdd-supply = <&reg_1p8v>;
+			pvdd-supply = <&reg_1p8v>;
+			dvdd-3v-supply = <&reg_3p3v>;
+			bgvdd-supply = <&reg_1p8v>;
+
 			adi,input-depth = <8>;
 			adi,input-colorspace = "rgb";
 			adi,input-clock = "1x";
diff --git a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
index de9484c6bb8d1675..185b7fd8a9e05805 100644
--- a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
+++ b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
@@ -30,6 +30,15 @@ memory@40000000 {
 		reg = <0 0x40000000 0 0x40000000>;
 	};
 
+	d1_8v: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "D1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	d3_3v: regulator-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "D3.3V";
@@ -331,6 +340,12 @@ hdmi@39 {
 		interrupt-parent = <&irqc>;
 		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
 
+		avdd-supply = <&d1_8v>;
+		dvdd-supply = <&d1_8v>;
+		pvdd-supply = <&d1_8v>;
+		dvdd-3v-supply = <&d3_3v>;
+		bgvdd-supply = <&d1_8v>;
+
 		adi,input-depth = <8>;
 		adi,input-colorspace = "rgb";
 		adi,input-clock = "1x";
diff --git a/arch/arm/boot/dts/renesas/r8a7792-wheat.dts b/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
index f8207f2eb2b26eea..d90261c40a3ad9c8 100644
--- a/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
+++ b/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
@@ -29,6 +29,15 @@ memory@40000000 {
 		reg = <0 0x40000000 0 0x40000000>;
 	};
 
+	d1_8v: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "D1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	d3_3v: regulator-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "D3.3V";
@@ -255,6 +264,12 @@ hdmi@3d {
 		reg = <0x3d>, <0x4d>, <0x2d>, <0x5d>;
 		reg-names = "main", "edid", "cec", "packet";
 
+		avdd-supply = <&d1_8v>;
+		dvdd-supply = <&d1_8v>;
+		pvdd-supply = <&d1_8v>;
+		dvdd-3v-supply = <&d3_3v>;
+		bgvdd-supply = <&d1_8v>;
+
 		adi,input-depth = <8>;
 		adi,input-colorspace = "rgb";
 		adi,input-clock = "1x";
@@ -284,6 +299,12 @@ hdmi@39 {
 		reg = <0x39>, <0x49>, <0x29>, <0x59>;
 		reg-names = "main", "edid", "cec", "packet";
 
+		avdd-supply = <&d1_8v>;
+		dvdd-supply = <&d1_8v>;
+		pvdd-supply = <&d1_8v>;
+		dvdd-3v-supply = <&d3_3v>;
+		bgvdd-supply = <&d1_8v>;
+
 		adi,input-depth = <8>;
 		adi,input-colorspace = "rgb";
 		adi,input-clock = "1x";
diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
index af7a8019b4b127f3..33a56c757f107340 100644
--- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
@@ -162,6 +162,24 @@ led8 {
 		};
 	};
 
+	reg_1p8v: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vcc_sdhi0: regulator-vcc-sdhi0 {
 		compatible = "regulator-fixed";
 
@@ -365,6 +383,12 @@ hdmi@39 {
 			interrupt-parent = <&gpio3>;
 			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
 
+			avdd-supply = <&reg_1p8v>;
+			dvdd-supply = <&reg_1p8v>;
+			pvdd-supply = <&reg_1p8v>;
+			dvdd-3v-supply = <&reg_3p3v>;
+			bgvdd-supply = <&reg_1p8v>;
+
 			adi,input-depth = <8>;
 			adi,input-colorspace = "rgb";
 			adi,input-clock = "1x";
diff --git a/arch/arm/boot/dts/renesas/r8a7794-silk.dts b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
index e1110f24f97bdf94..52f0b1d32f84ac27 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
@@ -102,6 +102,15 @@ key-d {
 		};
 	};
 
+	d1_8v: regulator-d1-8v {
+		compatible = "regulator-fixed";
+		regulator-name = "D1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	d3_3v: regulator-d3-3v {
 		compatible = "regulator-fixed";
 		regulator-name = "D3.3V";
@@ -256,6 +265,12 @@ hdmi@39 {
 			interrupt-parent = <&gpio5>;
 			interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
 
+			avdd-supply = <&d1_8v>;
+			dvdd-supply = <&d1_8v>;
+			pvdd-supply = <&d1_8v>;
+			dvdd-3v-supply = <&d3_3v>;
+			bgvdd-supply = <&d1_8v>;
+
 			adi,input-depth = <8>;
 			adi,input-colorspace = "rgb";
 			adi,input-clock = "1x";
-- 
2.34.1

