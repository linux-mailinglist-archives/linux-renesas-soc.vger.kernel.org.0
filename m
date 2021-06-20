Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2553ADD50
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Jun 2021 08:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhFTGJq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Jun 2021 02:09:46 -0400
Received: from lists.levonline.com ([217.70.32.42]:44597 "EHLO
        lists.levonline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhFTGJq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Jun 2021 02:09:46 -0400
X-Greylist: delayed 384 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Jun 2021 02:09:45 EDT
Received: from exc-halon1.levonline.com (exc-halon1.levonline.com [217.70.32.123])
        by lists.levonline.com (Postfix) with ESMTP id 287E73A0D55
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Jun 2021 07:58:57 +0200 (CEST)
X-SA-score: -1
X-Halon-ID: ef235bb1-d18c-11eb-8ebc-0050568168d4
Received: from ormen2.djurnet.levonline.com (ormen2.djurnet.levonline.com [192.168.17.32])
        by exc-halon1.levonline.com (Halon) with ESMTPS
        id ef235bb1-d18c-11eb-8ebc-0050568168d4;
        Sun, 20 Jun 2021 08:01:20 +0200 (CEST)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp [218.219.193.216])
        (authenticated bits=0)
        by ormen2.djurnet.levonline.com (8.13.8/8.13.8) with ESMTP id 15K61HfW011889;
        Sun, 20 Jun 2021 08:01:19 +0200
X-Origin-Levonline: b0359001
From:   Magnus Damm <damm@opensource.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <damm@opensource.se>, geert+renesas@glider.be
Date:   Sun, 20 Jun 2021 14:21:29 +0900
Message-Id: <162416648909.11444.15000511904887495628.sendpatchset@octo>
In-Reply-To: <162416647337.11444.4467438519249633023.sendpatchset@octo>
References: <162416647337.11444.4467438519249633023.sendpatchset@octo>
Subject: [PATCH 2/3] arm64: dts: renesas: r8a77970: eagle: Add SW2 support
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Add support for SW2 via "gpio-keys" on the R-Car V3M Eagle board.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |   43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ work/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts	2021-06-19 19:26:28.399714892 +0900
@@ -8,6 +8,8 @@
 
 /dts-v1/;
 #include "r8a77970.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Renesas Eagle board based on r8a77970";
@@ -43,6 +45,42 @@
 		};
 	};
 
+	keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&keys_pins>;
+		pinctrl-names = "default";
+
+		key-1 {
+			gpios = <&gpio1 21 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_1>;
+			label = "SW2-1";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-2 {
+			gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_2>;
+			label = "SW2-2";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-3 {
+			gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_3>;
+			label = "SW2-3";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-4 {
+			gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_4>;
+			label = "SW2-4";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+	};
+
 	lvds-decoder {
 		compatible = "thine,thc63lvd1024";
 
@@ -196,6 +234,11 @@
 		function = "i2c0";
 	};
 
+	keys_pins: keys {
+		pins = "GP_1_21", "GP_1_22", "GP_1_23", "GP_1_24";
+		bias-pull-up;
+	};
+
 	qspi0_pins: qspi0 {
 		groups = "qspi0_ctrl", "qspi0_data4";
 		function = "qspi0";
