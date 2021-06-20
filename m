Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45F343ADD52
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Jun 2021 08:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbhFTGJs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Jun 2021 02:09:48 -0400
Received: from lists.levonline.com ([217.70.32.42]:44596 "EHLO
        lists.levonline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhFTGJq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Jun 2021 02:09:46 -0400
Received: from exc-halon1.levonline.com (exc-halon1.levonline.com [217.70.32.123])
        by lists.levonline.com (Postfix) with ESMTP id 20BF13A0D4C
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Jun 2021 07:58:49 +0200 (CEST)
X-SA-score: -1
X-Halon-ID: ea5938f2-d18c-11eb-8ebc-0050568168d4
Received: from ormen2.djurnet.levonline.com (ormen2.djurnet.levonline.com [192.168.17.32])
        by exc-halon1.levonline.com (Halon) with ESMTPS
        id ea5938f2-d18c-11eb-8ebc-0050568168d4;
        Sun, 20 Jun 2021 08:01:12 +0200 (CEST)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp [218.219.193.216])
        (authenticated bits=0)
        by ormen2.djurnet.levonline.com (8.13.8/8.13.8) with ESMTP id 15K61ANZ011876;
        Sun, 20 Jun 2021 08:01:11 +0200
X-Origin-Levonline: b0359001
From:   Magnus Damm <damm@opensource.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <damm@opensource.se>, geert+renesas@glider.be
Date:   Sun, 20 Jun 2021 14:21:21 +0900
Message-Id: <162416648156.11444.10425966868846910243.sendpatchset@octo>
In-Reply-To: <162416647337.11444.4467438519249633023.sendpatchset@octo>
References: <162416647337.11444.4467438519249633023.sendpatchset@octo>
Subject: [PATCH 1/3] arm64: dts: renesas: r8a77995: draak: Add SW56 support
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Add support for SW56 via "gpio-keys" on the R-Car D3 Draak board.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts |   42 ++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ work/arch/arm64/boot/dts/renesas/r8a77995-draak.dts	2021-06-19 19:14:36.138670038 +0900
@@ -9,6 +9,7 @@
 /dts-v1/;
 #include "r8a77995.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Renesas Draak board based on r8a77995";
@@ -67,6 +68,42 @@
 		};
 	};
 
+	keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&keys_pins>;
+		pinctrl-names = "default";
+
+		key-1 {
+			gpios = <&gpio4 12 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_1>;
+			label = "SW56-1";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-2 {
+			gpios = <&gpio4 13 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_2>;
+			label = "SW56-2";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-3 {
+			gpios = <&gpio4 14 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_3>;
+			label = "SW56-3";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-4 {
+			gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_4>;
+			label = "SW56-4";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+	};
+
 	lvds-decoder {
 		compatible = "thine,thc63lvd1024";
 		vcc-supply = <&reg_3p3v>;
@@ -422,6 +459,11 @@
 		function = "i2c1";
 	};
 
+	keys_pins: keys {
+		pins = "GP_4_12", "GP_4_13", "GP_4_14", "GP_4_15";
+		bias-pull-up;
+	};
+
 	pwm0_pins: pwm0 {
 		groups = "pwm0_c";
 		function = "pwm0";
