Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F5136FB3F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Apr 2021 15:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbhD3NLx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Apr 2021 09:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232484AbhD3NLt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Apr 2021 09:11:49 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE81C06138E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Apr 2021 06:11:01 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by xavier.telenet-ops.be with bizsmtp
        id z1Az2400X4p6Y38011B0S4; Fri, 30 Apr 2021 15:11:00 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSv5-001f3t-Jq; Fri, 30 Apr 2021 15:10:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSv5-00FCPU-0F; Fri, 30 Apr 2021 15:10:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/5] ARM: dts: gose: Configure pull-up for SOFT_SW GPIO keys
Date:   Fri, 30 Apr 2021 15:10:54 +0200
Message-Id: <1cdec892b1491309b12bdaf7bc8428b3a19b1ed5.1619785905.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619785905.git.geert+renesas@glider.be>
References: <cover.1619785905.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The GPIO pins connected to the 4 Software Switches ("SOFT_SW", SW2) do
not have external pull-up resistors, but rely on internal pull-ups being
enabled.  Fortunately this is satisfied by the initial state of these
pins.

Make this explicit by enabling bias-pull-up, to remove the dependency on
initial state and/or boot loader configuration.

While at it, rename the surrounding device node from "gpio-keys" to
"keyboard", to comply with generic node name recommendations.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7793-gose.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index 87fa57a99399b73d..479e0fdf0c37311e 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -64,9 +64,12 @@ memory@40000000 {
 		reg = <0 0x40000000 0 0x40000000>;
 	};
 
-	gpio-keys {
+	keyboard {
 		compatible = "gpio-keys";
 
+		pinctrl-0 = <&keyboard_pins>;
+		pinctrl-names = "default";
+
 		key-1 {
 			gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_1>;
@@ -567,6 +570,11 @@ sound_clk_pins: sound_clk {
 		function = "audio_clk";
 	};
 
+	keyboard_pins: keyboard {
+		pins = "GP_5_0", "GP_5_1", "GP_5_2", "GP_5_3";
+		bias-pull-up;
+	};
+
 	vin0_pins: vin0 {
 		groups = "vin0_data24", "vin0_sync", "vin0_clkenb", "vin0_clk";
 		function = "vin0";
-- 
2.25.1

