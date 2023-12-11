Return-Path: <linux-renesas-soc+bounces-895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6109C80D06F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 17:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC9AEB2095E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 16:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA634C3B9;
	Mon, 11 Dec 2023 16:04:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25BFE26BC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 08:01:33 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:dadd:5da9:a38f:8d88])
	by laurent.telenet-ops.be with bizsmtp
	id M41S2B00f3oFjQr0141SXh; Mon, 11 Dec 2023 17:01:26 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rCiiM-00BkBN-RY;
	Mon, 11 Dec 2023 17:01:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rCiik-00BmWA-I3;
	Mon, 11 Dec 2023 17:01:26 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 6/7] arm64: dts: renesas: r8a779g0: white-hawk: Factor out common parts
Date: Mon, 11 Dec 2023 17:01:21 +0100
Message-Id: <f6c8413b688cbb5648deecb8859162adf442910b.1702309604.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702309604.git.geert+renesas@glider.be>
References: <cover.1702309604.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Factor out the parts on the White Hawk BreakOut board that are also
present on the White Hawk Single board, so they can be reused when
introducing support for the latter.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../boot/dts/renesas/r8a779g0-white-hawk.dts  | 56 +------------------
 ...-white-hawk.dts => white-hawk-common.dtsi} |  8 +--
 2 files changed, 3 insertions(+), 61 deletions(-)
 copy arch/arm64/boot/dts/renesas/{r8a779g0-white-hawk.dts => white-hawk-common.dtsi} (78%)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
index 8d82294a1a56444c..992837e7e7b976b0 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
@@ -7,63 +7,9 @@
 
 /dts-v1/;
 #include "r8a779g0-white-hawk-cpu.dtsi"
-#include "white-hawk-csi-dsi.dtsi"
-#include "white-hawk-ethernet.dtsi"
+#include "white-hawk-common.dtsi"
 
 / {
 	model = "Renesas White Hawk CPU and Breakout boards based on r8a779g0";
 	compatible = "renesas,white-hawk-breakout", "renesas,white-hawk-cpu", "renesas,r8a779g0";
-
-	can_transceiver0: can-phy0 {
-		compatible = "nxp,tjr1443";
-		#phy-cells = <0>;
-		enable-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
-		max-bitrate = <5000000>;
-	};
-};
-
-&can_clk {
-	clock-frequency = <40000000>;
-};
-
-&canfd {
-	pinctrl-0 = <&canfd0_pins>, <&canfd1_pins>, <&can_clk_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	channel0 {
-		status = "okay";
-		phys = <&can_transceiver0>;
-	};
-
-	channel1 {
-		status = "okay";
-	};
-};
-
-&i2c0 {
-	eeprom@51 {
-		compatible = "rohm,br24g01", "atmel,24c01";
-		label = "breakout-board";
-		reg = <0x51>;
-		pagesize = <8>;
-	};
-};
-
-&pfc {
-	can_clk_pins: can-clk {
-		groups = "can_clk";
-		function = "can_clk";
-	};
-
-	canfd0_pins: canfd0 {
-		groups = "canfd0_data";
-		function = "canfd0";
-	};
-
-	canfd1_pins: canfd1 {
-		groups = "canfd1_data";
-		function = "canfd1";
-	};
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts b/arch/arm64/boot/dts/renesas/white-hawk-common.dtsi
similarity index 78%
copy from arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
copy to arch/arm64/boot/dts/renesas/white-hawk-common.dtsi
index 8d82294a1a56444c..c99086edadcaacdb 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/white-hawk-common.dtsi
@@ -1,19 +1,15 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /*
- * Device Tree Source for the White Hawk CPU and BreakOut boards
+ * Device Tree Source for the common parts shared by the White Hawk BreakOut
+ * and White Hawk Single boards
  *
  * Copyright (C) 2022 Renesas Electronics Corp.
  */
 
-/dts-v1/;
-#include "r8a779g0-white-hawk-cpu.dtsi"
 #include "white-hawk-csi-dsi.dtsi"
 #include "white-hawk-ethernet.dtsi"
 
 / {
-	model = "Renesas White Hawk CPU and Breakout boards based on r8a779g0";
-	compatible = "renesas,white-hawk-breakout", "renesas,white-hawk-cpu", "renesas,r8a779g0";
-
 	can_transceiver0: can-phy0 {
 		compatible = "nxp,tjr1443";
 		#phy-cells = <0>;
-- 
2.34.1


