Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D393ADD51
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Jun 2021 08:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbhFTGJr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Jun 2021 02:09:47 -0400
Received: from lists.levonline.com ([217.70.32.42]:44595 "EHLO
        lists.levonline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhFTGJq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Jun 2021 02:09:46 -0400
Received: from exc-halon1.levonline.com (exc-halon1.levonline.com [217.70.32.123])
        by lists.levonline.com (Postfix) with ESMTP id DEA323A0D46
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Jun 2021 07:59:04 +0200 (CEST)
X-SA-score: -1
X-Halon-ID: f3bf250f-d18c-11eb-8ebc-0050568168d4
Received: from ormen2.djurnet.levonline.com (ormen2.djurnet.levonline.com [192.168.17.32])
        by exc-halon1.levonline.com (Halon) with ESMTPS
        id f3bf250f-d18c-11eb-8ebc-0050568168d4;
        Sun, 20 Jun 2021 08:01:28 +0200 (CEST)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp [218.219.193.216])
        (authenticated bits=0)
        by ormen2.djurnet.levonline.com (8.13.8/8.13.8) with ESMTP id 15K61QbT011916;
        Sun, 20 Jun 2021 08:01:27 +0200
X-Origin-Levonline: b0359001
From:   Magnus Damm <damm@opensource.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <damm@opensource.se>, geert+renesas@glider.be
Date:   Sun, 20 Jun 2021 14:21:37 +0900
Message-Id: <162416649714.11444.12659951671817146236.sendpatchset@octo>
In-Reply-To: <162416647337.11444.4467438519249633023.sendpatchset@octo>
References: <162416647337.11444.4467438519249633023.sendpatchset@octo>
Subject: [PATCH 3/3] arm64: dts: renesas: r8a77990: ebisu: Add SW4 support
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Add support for SW4 via "gpio-keys" on the R-Car E3 Ebisu board.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts |   42 ++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ work/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts	2021-06-19 19:08:07.927645590 +0900
@@ -8,6 +8,7 @@
 /dts-v1/;
 #include "r8a77990.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Renesas Ebisu board based on r8a77990";
@@ -80,6 +81,42 @@
 		};
 	};
 
+	keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&keys_pins>;
+		pinctrl-names = "default";
+
+		key-1 {
+			gpios = <&gpio5 10 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_1>;
+			label = "SW4-1";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-2 {
+			gpios = <&gpio5 11 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_2>;
+			label = "SW4-2";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-3 {
+			gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_3>;
+			label = "SW4-3";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-4 {
+			gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_4>;
+			label = "SW4-4";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+	};
+
 	lvds-decoder {
 		compatible = "thine,thc63lvd1024";
 		vcc-supply = <&reg_3p3v>;
@@ -540,6 +577,11 @@
 		function = "intc_ex";
 	};
 
+	keys_pins: keys {
+		pins = "GP_5_10", "GP_5_11", "GP_5_12", "GP_5_13";
+		bias-pull-up;
+	};
+
 	pwm3_pins: pwm3 {
 		groups = "pwm3_b";
 		function = "pwm3";
