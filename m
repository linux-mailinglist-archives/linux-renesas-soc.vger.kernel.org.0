Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B321D66990E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 14:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbjAMNvP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Jan 2023 08:51:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241770AbjAMNus (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jan 2023 08:50:48 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AFCEBDF9C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jan 2023 05:46:44 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,214,1669042800"; 
   d="scan'208";a="146238298"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jan 2023 22:46:44 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EFAF8400547E;
        Fri, 13 Jan 2023 22:46:43 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] arm64: dts: renesas: r8a779f0: spider-cpu: Enable UFS device
Date:   Fri, 13 Jan 2023 22:46:39 +0900
Message-Id: <20230113134639.338908-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable UFS device for R-Car S4-8 Spider CPU board.

Note that the conditions of RC21012 on the Spider are:
 - OUT11 (for UFS30_REFCLK_V) is disabled as default.
 - OUT11 is controlled by GPIO0 pin.
 - The GPIO0 pin is inverted sense (low active) and pull-up enabled.

To output the clock, pin 4 of TCA9554 on the Spider board needs to
output low level so that using "gpio-gate-clock" for it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Changes from v1:
 - Add /delete-property/ clock-frequency; in the ufs30_clk.
 - Add Tested-by. (Geert-san, thanks!)

 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
index 25b34d66061a..adb07dfd63f6 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2021 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/gpio/gpio.h>
 #include "r8a779f0.dtsi"
 
 / {
@@ -32,6 +33,12 @@ memory@480000000 {
 		reg = <0x4 0x80000000 0x0 0x80000000>;
 	};
 
+	rc21012_ufs: clk-rc21012-ufs {
+		compatible = "fixed-clock";
+		clock-frequency = <38400000>;
+		#clock-cells = <0>;
+	};
+
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
@@ -67,6 +74,21 @@ &hscif0 {
 	status = "okay";
 };
 
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	gpio_exp_20: gpio@20 {
+		compatible = "ti,tca9554";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
 &i2c4 {
 	pinctrl-0 = <&i2c4_pins>;
 	pinctrl-names = "default";
@@ -112,6 +134,11 @@ hscif0_pins: hscif0 {
 		function = "hscif0";
 	};
 
+	i2c0_pins: i2c0 {
+		groups = "i2c0";
+		function = "i2c0";
+	};
+
 	i2c4_pins: i2c4 {
 		groups = "i2c4";
 		function = "i2c4";
@@ -150,3 +177,14 @@ &scif0 {
 &scif_clk {
 	clock-frequency = <24000000>;
 };
+
+&ufs {
+	status = "okay";
+};
+
+&ufs30_clk {
+	compatible = "gpio-gate-clock";
+	clocks = <&rc21012_ufs>;
+	enable-gpios = <&gpio_exp_20 4 GPIO_ACTIVE_LOW>;
+	/delete-property/ clock-frequency;
+};
-- 
2.25.1

