Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 832FC739D5C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jun 2023 11:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbjFVJeB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Jun 2023 05:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbjFVJcB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Jun 2023 05:32:01 -0400
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [IPv6:2a02:1800:120:4::f00:11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E891E44A7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jun 2023 02:23:21 -0700 (PDT)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by gauss.telenet-ops.be (Postfix) with ESMTPS id 4Qmw080Y4rz4wxRT
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jun 2023 11:23:20 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
        by laurent.telenet-ops.be with bizsmtp
        id C9PJ2A0081yfRTD019PJqL; Thu, 22 Jun 2023 11:23:19 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qCGX6-000Byc-Fh;
        Thu, 22 Jun 2023 11:23:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qCGX8-003Vzo-2v;
        Thu, 22 Jun 2023 11:23:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ARM: dts: armadillo800eva: Add LCD panel
Date:   Thu, 22 Jun 2023 11:23:15 +0200
Message-Id: <c9ad0ea19b3de104f92abb49ebc94907d4812d3f.1687417585.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687417585.git.geert+renesas@glider.be>
References: <cover.1687417585.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the 5" WVGA TFT LCD panel on the Armadillo-800-EVA development
board, and enable the LCD controller that drives it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
index 101413d5164913c5..fb6b432c4df2d948 100644
--- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
@@ -132,7 +132,7 @@ i2c2: i2c-2 {
 		i2c-gpio,delay-us = <5>;
 	};
 
-	backlight {
+	backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&tpu 2 33333 PWM_POLARITY_INVERTED>;
 		brightness-levels = <0 1 2 4 8 16 32 64 128 255>;
@@ -143,6 +143,18 @@ backlight {
 		enable-gpios = <&pfc 61 GPIO_ACTIVE_HIGH>;
 	};
 
+	panel {
+		compatible = "ampire,am-800480l1tmqw-t00h";
+		backlight = <&backlight>;
+		power-supply = <&reg_5p0v>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lcdc0_rgb>;
+			};
+		};
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 
@@ -228,10 +240,22 @@ rtc@30 {
 	};
 };
 
-&pfc {
+&lcdc0 {
 	pinctrl-0 = <&lcd0_pins>;
 	pinctrl-names = "default";
 
+	status = "okay";
+
+	ports {
+		port@0 {
+			endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
+
+&pfc {
 	ether_pins: ether {
 		groups = "gether_mii", "gether_int";
 		function = "gether";
-- 
2.34.1

