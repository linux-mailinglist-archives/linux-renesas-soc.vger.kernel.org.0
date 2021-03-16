Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A882233D801
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 16:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237286AbhCPPr3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 11:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237434AbhCPPrK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 11:47:10 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A438C061762
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 08:47:09 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b1e0:9434:c5b6:aecd])
        by albert.telenet-ops.be with bizsmtp
        id h3n72400Z0UTkXy063n7qe; Tue, 16 Mar 2021 16:47:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lMBuV-0089ur-1h; Tue, 16 Mar 2021 16:47:07 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lMBuU-00AD5T-8V; Tue, 16 Mar 2021 16:47:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hoang Vo <hoang.vo.eb@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] arm64: dts: renesas: falcon: Move AVB0 to main DTS
Date:   Tue, 16 Mar 2021 16:47:05 +0100
Message-Id: <20210316154705.2433528-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316154705.2433528-1-geert+renesas@glider.be>
References: <20210316154705.2433528-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Ethernet PHY for the first AVB instance is located on the Falcon
BreakOut board.  Hence move its description from the DTS file that
describes the CPU board to the main Falcon DTS file.

Fixes: e8ac55a5e70a9522 ("arm64: dts: renesas: falcon: Add Ethernet-AVB0 support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 34 -----------------
 .../boot/dts/renesas/r8a779a0-falcon.dts      | 37 +++++++++++++++++++
 2 files changed, 37 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index 97d40e3e05ff3b1b..e9133f9348df8969 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -60,22 +60,6 @@ reg_3p3v: regulator-3p3v {
 	};
 };
 
-&avb0 {
-	pinctrl-0 = <&avb0_pins>;
-	pinctrl-names = "default";
-	phy-handle = <&phy0>;
-	tx-internal-delay-ps = <2000>;
-	status = "okay";
-
-	phy0: ethernet-phy@0 {
-		rxc-skew-ps = <1500>;
-		reg = <0>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
-		reset-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
-	};
-};
-
 &extal_clk {
 	clock-frequency = <16666666>;
 };
@@ -136,24 +120,6 @@ &pfc {
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
 
-	avb0_pins: avb0 {
-		mux {
-			groups = "avb0_link", "avb0_mdio", "avb0_rgmii", "avb0_txcrefclk";
-			function = "avb0";
-		};
-
-		pins_mdio {
-			groups = "avb0_mdio";
-			drive-strength = <21>;
-		};
-
-		pins_mii {
-			groups = "avb0_rgmii";
-			drive-strength = <21>;
-		};
-
-	};
-
 	i2c0_pins: i2c0 {
 		groups = "i2c0";
 		function = "i2c0";
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index 04cd2ae5b4f4892e..687f019e79f059a1 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -19,6 +19,22 @@ aliases {
 	};
 };
 
+&avb0 {
+	pinctrl-0 = <&avb0_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy0>;
+	tx-internal-delay-ps = <2000>;
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &i2c0 {
 	eeprom@51 {
 		compatible = "rohm,br24g01", "atmel,24c01";
@@ -27,3 +43,24 @@ eeprom@51 {
 		pagesize = <8>;
 	};
 };
+
+&pfc {
+	avb0_pins: avb0 {
+		mux {
+			groups = "avb0_link", "avb0_mdio", "avb0_rgmii",
+				 "avb0_txcrefclk";
+			function = "avb0";
+		};
+
+		pins_mdio {
+			groups = "avb0_mdio";
+			drive-strength = <21>;
+		};
+
+		pins_mii {
+			groups = "avb0_rgmii";
+			drive-strength = <21>;
+		};
+
+	};
+};
-- 
2.25.1

