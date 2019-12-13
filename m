Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04C5411E88F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 17:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbfLMQlW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 11:41:22 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:59052 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728371AbfLMQlV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 11:41:21 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id dUhG2100N5USYZQ01UhGr1; Fri, 13 Dec 2019 17:41:19 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0006uP-Ez; Fri, 13 Dec 2019 17:41:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0000yt-Do; Fri, 13 Dec 2019 17:41:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/7] ARM: dts: renesas: Group tuples in regulator-gpio states properties
Date:   Fri, 13 Dec 2019 17:41:08 +0100
Message-Id: <20191213164115.3697-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213164115.3697-1-geert+renesas@glider.be>
References: <20191213164115.3697-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To improve human readability and enable automatic validation, the tuples
in the "states" properties of device nodes compatible with
"regulator-gpio" should be grouped, as reported by "make dtbs_check":

    $ make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/regulator/gpio-regulator.yaml
    arch/arm/boot/dts/r8a7791-koelsch.dt.yaml: regulator-vccq-sdhi0: states:0: Additional items are not allowed (1800000, 0 were unexpected)
    arch/arm/boot/dts/r8a7791-koelsch.dt.yaml: regulator-vccq-sdhi0: states:0: [3300000, 1, 1800000, 0] is too long
    arch/arm/boot/dts/r8a7791-koelsch.dt.yaml: regulator-vccq-sdhi1: states:0: Additional items are not allowed (1800000, 0 were unexpected)
    arch/arm/boot/dts/r8a7791-koelsch.dt.yaml: regulator-vccq-sdhi1: states:0: [3300000, 1, 1800000, 0] is too long
    arch/arm/boot/dts/r8a7791-koelsch.dt.yaml: regulator-vccq-sdhi2: states:0: Additional items are not allowed (1800000, 0 were unexpected)
    arch/arm/boot/dts/r8a7791-koelsch.dt.yaml: regulator-vccq-sdhi2: states:0: [3300000, 1, 1800000, 0] is too long
    ...

Fix this by grouping the tuples using angle brackets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/iwg20d-q7-common.dtsi       | 3 +--
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 3 +--
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts   | 3 +--
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts     | 3 +--
 arch/arm/boot/dts/r8a7779-marzen.dts          | 3 +--
 arch/arm/boot/dts/r8a7790-lager.dts           | 6 ++----
 arch/arm/boot/dts/r8a7791-koelsch.dts         | 9 +++------
 arch/arm/boot/dts/r8a7791-porter.dts          | 6 ++----
 arch/arm/boot/dts/r8a7793-gose.dts            | 9 +++------
 arch/arm/boot/dts/r8a7794-alt.dts             | 6 ++----
 arch/arm/boot/dts/r8a7794-silk.dts            | 3 +--
 11 files changed, 18 insertions(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index ab5ae934876279e0..ebbe1518ef8a6adb 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -132,8 +132,7 @@
 
 		gpios = <&gpio2 30 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
index 242cccfe9ba12db5..6bf6ed880c8647ad 100644
--- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
@@ -60,8 +60,7 @@
 
 		enable-gpio = <&pfc 74 GPIO_ACTIVE_HIGH>;
 		gpios = <&pfc 17 GPIO_ACTIVE_HIGH>;
-		states = <3300000 0
-			  1800000 1>;
+		states = <3300000 0>, <1800000 1>;
 
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
index ce6603b0994b7f36..58d369ad82799f4a 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
@@ -76,8 +76,7 @@
 
 		gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index 450efe92300876ea..8ac61b50aec03190 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -65,8 +65,7 @@
 
 		gpios = <&gpio2 24 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/r8a7779-marzen.dts b/arch/arm/boot/dts/r8a7779-marzen.dts
index c755f0b8fd0d72db..d2240b89ee52929b 100644
--- a/arch/arm/boot/dts/r8a7779-marzen.dts
+++ b/arch/arm/boot/dts/r8a7779-marzen.dts
@@ -48,8 +48,7 @@
 
 		gpios = <&gpio3 20 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	ethernet@18000000 {
diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 6ec2cf7eb35455d3..097fd9317c6e2966 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -150,8 +150,7 @@
 
 		gpios = <&gpio5 29 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	vcc_sdhi2: regulator-vcc-sdhi2 {
@@ -174,8 +173,7 @@
 
 		gpios = <&gpio5 30 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	audio_clock: audio_clock {
diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index af6bd8fcd5a4e364..2b096d5e06fb0499 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -193,8 +193,7 @@
 
 		gpios = <&gpio2 12 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	vcc_sdhi1: regulator-vcc-sdhi1 {
@@ -217,8 +216,7 @@
 
 		gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	vcc_sdhi2: regulator-vcc-sdhi2 {
@@ -241,8 +239,7 @@
 
 		gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	audio_clock: audio_clock {
diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
index d6cf16aac14d80f5..f9ece7ab2010679a 100644
--- a/arch/arm/boot/dts/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/r8a7791-porter.dts
@@ -63,8 +63,7 @@
 
 		gpios = <&gpio2 12 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	vcc_sdhi2: regulator-vcc-sdhi2 {
@@ -85,8 +84,7 @@
 
 		gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	hdmi-out {
diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index 48fbeb6340fd4dac..22ca7cd1e7d23ec9 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -179,8 +179,7 @@
 
 		gpios = <&gpio2 12 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	vcc_sdhi1: regulator-vcc-sdhi1 {
@@ -203,8 +202,7 @@
 
 		gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	vcc_sdhi2: regulator-vcc-sdhi2 {
@@ -227,8 +225,7 @@
 
 		gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	audio_clock: audio_clock {
diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index 1d22fcdc5d22358d..f79fce74cd9c3162 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -60,8 +60,7 @@
 
 		gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	vcc_sdhi1: regulator-vcc-sdhi1 {
@@ -84,8 +83,7 @@
 
 		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	lbsc {
diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
index b3177aea45d10252..2c16ad85430020bb 100644
--- a/arch/arm/boot/dts/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/r8a7794-silk.dts
@@ -126,8 +126,7 @@
 
 		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 1
-			  1800000 0>;
+		states = <3300000 1>, <1800000 0>;
 	};
 
 	vga-encoder {
-- 
2.17.1

