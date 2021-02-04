Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B500830FABB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Feb 2021 19:10:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238750AbhBDSHP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Feb 2021 13:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237044AbhBDSDy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 13:03:54 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0ABC061225
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Feb 2021 10:02:36 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id R62b2400D4C55Sk0162bx8; Thu, 04 Feb 2021 19:02:35 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7im7-003Fgj-6L; Thu, 04 Feb 2021 18:50:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7eK2-006uUs-7P; Thu, 04 Feb 2021 14:05:22 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] ARM: dts: renesas: Group tuples in pin control properties
Date:   Thu,  4 Feb 2021 14:05:15 +0100
Message-Id: <20210204130517.1647073-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204130517.1647073-1-geert+renesas@glider.be>
References: <20210204130517.1647073-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To improve human readability and enable automatic validation, the tuples
in "pinctrl-*" properties should be grouped using angle brackets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts | 2 +-
 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts | 2 +-
 arch/arm/boot/dts/r8a7790-lager.dts    | 4 ++--
 arch/arm/boot/dts/r8a7790-stout.dts    | 4 ++--
 arch/arm/boot/dts/r8a7791-koelsch.dts  | 4 ++--
 arch/arm/boot/dts/r8a7791-porter.dts   | 4 ++--
 arch/arm/boot/dts/r8a7792-blanche.dts  | 2 +-
 arch/arm/boot/dts/r8a7792-wheat.dts    | 2 +-
 arch/arm/boot/dts/r8a7793-gose.dts     | 4 ++--
 arch/arm/boot/dts/r8a7794-alt.dts      | 2 +-
 arch/arm/boot/dts/r8a7794-silk.dts     | 6 +++---
 11 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts b/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
index 807e7d0d6b620c83..4ace117470e800f8 100644
--- a/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
+++ b/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
@@ -61,7 +61,7 @@ &scif0 {
 };
 
 &ether {
-	pinctrl-0 = <&ether_pins &phy1_pins>;
+	pinctrl-0 = <&ether_pins>, <&phy1_pins>;
 	pinctrl-names = "default";
 
 	phy-handle = <&phy1>;
diff --git a/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts b/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
index db72a801abe548fe..59d1a9bfab05a27e 100644
--- a/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
+++ b/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
@@ -56,7 +56,7 @@ &scif2 {
 };
 
 &ether {
-	pinctrl-0 = <&ether_pins &phy1_pins>;
+	pinctrl-0 = <&ether_pins>, <&phy1_pins>;
 	pinctrl-names = "default";
 
 	phy-handle = <&phy1>;
diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 58687f2af3c504a8..26cada66854a51cd 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -659,7 +659,7 @@ sound_clk_pins: sound_clk {
 };
 
 &ether {
-	pinctrl-0 = <&ether_pins &phy1_pins>;
+	pinctrl-0 = <&ether_pins>, <&phy1_pins>;
 	pinctrl-names = "default";
 
 	phy-handle = <&phy1>;
@@ -908,7 +908,7 @@ vin1ep0: endpoint {
 };
 
 &rcar_sound {
-	pinctrl-0 = <&sound_pins &sound_clk_pins>;
+	pinctrl-0 = <&sound_pins>, <&sound_clk_pins>;
 	pinctrl-names = "default";
 
 	/* Single DAI */
diff --git a/arch/arm/boot/dts/r8a7790-stout.dts b/arch/arm/boot/dts/r8a7790-stout.dts
index 6a457bc9280a4949..d51f23572d7fc727 100644
--- a/arch/arm/boot/dts/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/r8a7790-stout.dts
@@ -191,7 +191,7 @@ usb0_pins: usb0 {
 };
 
 &ether {
-	pinctrl-0 = <&ether_pins &phy1_pins>;
+	pinctrl-0 = <&ether_pins>, <&phy1_pins>;
 	pinctrl-names = "default";
 
 	phy-handle = <&phy1>;
@@ -321,7 +321,7 @@ adv7511_out: endpoint {
 
 &iic3 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&iic3_pins &pmic_irq_pins>;
+	pinctrl-0 = <&iic3_pins>, <&pmic_irq_pins>;
 	status = "okay";
 
 	pmic@58 {
diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index 7f58e56bcf13935e..facd703e8336bd5c 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -618,7 +618,7 @@ sound_clk_pins: sound_clk {
 };
 
 &ether {
-	pinctrl-0 = <&ether_pins &phy1_pins>;
+	pinctrl-0 = <&ether_pins>, <&phy1_pins>;
 	pinctrl-names = "default";
 
 	phy-handle = <&phy1>;
@@ -878,7 +878,7 @@ vin1ep: endpoint {
 };
 
 &rcar_sound {
-	pinctrl-0 = <&sound_pins &sound_clk_pins>;
+	pinctrl-0 = <&sound_pins>, <&sound_clk_pins>;
 	pinctrl-names = "default";
 
 	/* Single DAI */
diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
index c6d563fb7ec7c17f..d4fe360d725ad720 100644
--- a/arch/arm/boot/dts/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/r8a7791-porter.dts
@@ -292,7 +292,7 @@ &scif0 {
 };
 
 &ether {
-	pinctrl-0 = <&ether_pins &phy1_pins>;
+	pinctrl-0 = <&ether_pins>, <&phy1_pins>;
 	pinctrl-names = "default";
 
 	phy-handle = <&phy1>;
@@ -494,7 +494,7 @@ lvds_connector: endpoint {
 };
 
 &rcar_sound {
-	pinctrl-0 = <&ssi_pins &audio_clk_pins>;
+	pinctrl-0 = <&ssi_pins>, <&audio_clk_pins>;
 	pinctrl-names = "default";
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/r8a7792-blanche.dts b/arch/arm/boot/dts/r8a7792-blanche.dts
index 9368ac2cf5082ff9..c100ae903a46bb1c 100644
--- a/arch/arm/boot/dts/r8a7792-blanche.dts
+++ b/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -334,7 +334,7 @@ wdt {
 };
 
 &du {
-	pinctrl-0 = <&du0_pins &du1_pins>;
+	pinctrl-0 = <&du0_pins>, <&du1_pins>;
 	pinctrl-names = "default";
 
 	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>, <&x1_clk>, <&x2_clk>;
diff --git a/arch/arm/boot/dts/r8a7792-wheat.dts b/arch/arm/boot/dts/r8a7792-wheat.dts
index ba2d2a58901261f6..434e4655be9daff7 100644
--- a/arch/arm/boot/dts/r8a7792-wheat.dts
+++ b/arch/arm/boot/dts/r8a7792-wheat.dts
@@ -307,7 +307,7 @@ adv7513_1_out: endpoint {
 };
 
 &du {
-	pinctrl-0 = <&du0_pins &du1_pins>;
+	pinctrl-0 = <&du0_pins>, <&du1_pins>;
 	pinctrl-names = "default";
 
 	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>, <&osc2_clk>;
diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index 7516811f98e20ae7..45d85505ad717c76 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -576,7 +576,7 @@ vin1_pins: vin1 {
 };
 
 &ether {
-	pinctrl-0 = <&ether_pins &phy1_pins>;
+	pinctrl-0 = <&ether_pins>, <&phy1_pins>;
 	pinctrl-names = "default";
 
 	phy-handle = <&phy1>;
@@ -751,7 +751,7 @@ &i2c4 {
 };
 
 &rcar_sound {
-	pinctrl-0 = <&sound_pins &sound_clk_pins>;
+	pinctrl-0 = <&sound_pins>, <&sound_clk_pins>;
 	pinctrl-names = "default";
 
 	/* Single DAI */
diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index 3f1cc5bbf32979e8..2185c6f383144ffd 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -330,7 +330,7 @@ qspi_pins: qspi {
 };
 
 &ether {
-	pinctrl-0 = <&ether_pins &phy1_pins>;
+	pinctrl-0 = <&ether_pins>, <&phy1_pins>;
 	pinctrl-names = "default";
 
 	phy-handle = <&phy1>;
diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
index 677596f6c9c9a7d9..9c019b8803c2975b 100644
--- a/arch/arm/boot/dts/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/r8a7794-silk.dts
@@ -379,7 +379,7 @@ &scif_clk {
 };
 
 &ether {
-	pinctrl-0 = <&ether_pins &phy1_pins>;
+	pinctrl-0 = <&ether_pins>, <&phy1_pins>;
 	pinctrl-names = "default";
 
 	phy-handle = <&phy1>;
@@ -518,7 +518,7 @@ &usbphy {
 };
 
 &du {
-	pinctrl-0 = <&du0_pins &du1_pins>;
+	pinctrl-0 = <&du0_pins>, <&du1_pins>;
 	pinctrl-names = "default";
 	status = "okay";
 
@@ -541,7 +541,7 @@ endpoint {
 };
 
 &rcar_sound {
-	pinctrl-0 = <&ssi_pins &audio_clk_pins>;
+	pinctrl-0 = <&ssi_pins>, <&audio_clk_pins>;
 	pinctrl-names = "default";
 	status = "okay";
 
-- 
2.25.1

