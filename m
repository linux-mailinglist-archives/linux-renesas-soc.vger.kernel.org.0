Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61F5930FA53
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Feb 2021 18:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238234AbhBDRyV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Feb 2021 12:54:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238497AbhBDRxE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 12:53:04 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA59FC061356
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Feb 2021 09:50:43 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id R5qf240084C55Sk065qfy4; Thu, 04 Feb 2021 18:50:39 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7im7-003Fgj-1n; Thu, 04 Feb 2021 18:50:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7eK2-006uV2-9f; Thu, 04 Feb 2021 14:05:22 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] arm64: dts: renesas: Group tuples in pin control properties
Date:   Thu,  4 Feb 2021 14:05:17 +0100
Message-Id: <20210204130517.1647073-6-geert+renesas@glider.be>
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
 arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi              | 2 +-
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts           | 2 +-
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts            | 2 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi          | 2 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi                     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index c88229990d422d4d..d8046fedf9c12929 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -615,7 +615,7 @@ &pwm2 {
 };
 
 &rcar_sound {
-	pinctrl-0 = <&sound_pins &sound_clk_pins>;
+	pinctrl-0 = <&sound_pins>, <&sound_clk_pins>;
 	pinctrl-names = "default";
 
 	/* Single DAI */
diff --git a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi b/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
index 929f4a1d3f9054ef..7fc0339a3ac97896 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
@@ -80,7 +80,7 @@ sound_pins: sound {
 };
 
 &rcar_sound {
-	pinctrl-0 = <&sound_pins &sound_clk_pins>;
+	pinctrl-0 = <&sound_pins>, <&sound_clk_pins>;
 	pinctrl-names = "default";
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 07fbbc4f4572016f..a46b24f54c580d96 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -351,7 +351,7 @@ usb30_pins: usb30 {
 };
 
 &rcar_sound {
-	pinctrl-0 = <&sound_pins &sound_clk_pins>;
+	pinctrl-0 = <&sound_pins>, <&sound_clk_pins>;
 	pinctrl-names = "default";
 
 	/* Single DAI */
diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 0992fff676e3dab3..b966541f2e5b6f32 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -621,7 +621,7 @@ &pwm5 {
 };
 
 &rcar_sound {
-	pinctrl-0 = <&sound_pins &sound_clk_pins>;
+	pinctrl-0 = <&sound_pins>, <&sound_clk_pins>;
 	pinctrl-names = "default";
 
 	/* Single DAI */
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 9a0ee01df51327f0..99a8d887e3821f22 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -736,7 +736,7 @@ &pwm1 {
 };
 
 &rcar_sound {
-	pinctrl-0 = <&sound_pins &sound_clk_pins>;
+	pinctrl-0 = <&sound_pins>, <&sound_clk_pins>;
 	pinctrl-names = "default";
 
 	/* Single DAI */
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 97e9ed93cf15cd18..01124efa92bd3875 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -365,7 +365,7 @@ usb1_pins: usb1 {
 };
 
 &rcar_sound {
-	pinctrl-0 = <&sound_pins &sound_clk_pins>;
+	pinctrl-0 = <&sound_pins>, <&sound_clk_pins>;
 	pinctrl-names = "default";
 
 	/* Single DAI */
-- 
2.25.1

