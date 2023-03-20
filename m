Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4D0A6C1BFF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Mar 2023 17:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbjCTQjU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Mar 2023 12:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231477AbjCTQix (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2023 12:38:53 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABFF7211C8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 09:33:26 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by baptiste.telenet-ops.be with bizsmtp
        id agZP2900A1C8whw01gZPd8; Mon, 20 Mar 2023 17:33:23 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1peIR8-00E2vb-PL;
        Mon, 20 Mar 2023 17:33:23 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1peIRn-007SWm-JF;
        Mon, 20 Mar 2023 17:33:23 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: marzen: Add slide switches
Date:   Mon, 20 Mar 2023 17:33:22 +0100
Message-Id: <f834a3c397362f2424fcae6a0c0440356208b182.1679329829.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

Describe the four General Purpose Switches on the Marzen development
board, so they can be used for user input and/or for wake-up from s2ram.

The GPIO block on R-Car H1 does not support triggering interrupts on
both edges of a changing input signal, hence one cannot use gpio-keys
with gpios properties.  Instead, one of two alternatives needs to be
used:
  1. Use gpio-keys with interrupts instead of gpios properties, at the
     expense of receiving only key presses (release events will be
     auto-generated),
  2. Use gpio-keys-polled with gpios properties, at the expense of
     making these keys unusable as wake-up sources.

As the DTS for the Marzen development board serves mainly as an example,
the approach taken is to use the first alternative for the first two
switches, and the second alternative for the last two switches.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
For proper operation, this depends on "[PATCH] pinctrl: renesas:
r8a7779: Add bias pinconf support"
https://lore.kernel.org/r/dd966cfc916ef881051ec53bc3393dce7eea8e03.1679328215.git.geert+renesas@glider.be

To be queued in renesas-devel-for-v6.4.

 arch/arm/boot/dts/r8a7779-marzen.dts | 63 ++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7779-marzen.dts b/arch/arm/boot/dts/r8a7779-marzen.dts
index 5f05f2b44a481669..60c9c4b7faa151f4 100644
--- a/arch/arm/boot/dts/r8a7779-marzen.dts
+++ b/arch/arm/boot/dts/r8a7779-marzen.dts
@@ -9,6 +9,7 @@
 /dts-v1/;
 #include "r8a7779.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
@@ -66,6 +67,51 @@ ethernet@18000000 {
 		vdd33a-supply = <&fixedregulator3v3>;
 	};
 
+	keyboard-irq {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&keyboard_irq_pins>;
+		pinctrl-names = "default";
+
+		interrupt-parent = <&gpio0>;
+
+		key-1 {
+			interrupts = <17 IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_1>;
+			label = "SW1-1";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-2 {
+			interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_2>;
+			label = "SW1-2";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+	};
+
+	keyboard-gpio {
+		compatible = "gpio-keys-polled";
+		poll-interval = <50>;
+
+		pinctrl-0 = <&keyboard_gpio_pins>;
+		pinctrl-names = "default";
+
+		key-3 {
+			gpios = <&gpio0 19 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_3>;
+			label = "SW1-3";
+			debounce-interval = <20>;
+		};
+		key-4 {
+			gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_4>;
+			label = "SW1-4";
+			debounce-interval = <20>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		led2 {
@@ -161,6 +207,14 @@ endpoint {
 	};
 };
 
+&gpio0 {
+	keyboard-irq-hog {
+		gpio-hog;
+		gpios = <17 GPIO_ACTIVE_LOW>, <18 GPIO_ACTIVE_LOW>;
+		input;
+	};
+};
+
 &irqpin0 {
 	status = "okay";
 };
@@ -223,6 +277,15 @@ hspi0_pins: hspi0 {
 		groups = "hspi0";
 		function = "hspi0";
 	};
+
+	keyboard_irq_pins: keyboard-irq {
+		pins = "GP_0_17", "GP_0_18";
+		bias-pull-up;
+	};
+	keyboard_gpio_pins: keyboard-gpio {
+		pins = "GP_0_19", "GP_0_20";
+		bias-pull-up;
+	};
 };
 
 &sata {
-- 
2.34.1

