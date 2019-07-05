Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAA4160459
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2019 12:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbfGEKUp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Jul 2019 06:20:45 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:54193 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728035AbfGEKUo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jul 2019 06:20:44 -0400
X-IronPort-AV: E=Sophos;i="5.62,454,1554735600"; 
   d="scan'208";a="20430357"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 05 Jul 2019 19:20:43 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7AADF4002629;
        Fri,  5 Jul 2019 19:20:41 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add WLAN support
Date:   Fri,  5 Jul 2019 11:15:20 +0100
Message-Id: <1562321720-18735-4-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562321720-18735-1-git-send-email-biju.das@bp.renesas.com>
References: <1562321720-18735-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enables WLAN support for the HiHope RZ/G2[MN] boards.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 45 ++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index fdeb4d2..52d61c9 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -54,6 +54,13 @@
 		led3 {
 			gpios = <&gpio0  0 GPIO_ACTIVE_HIGH>;
 		};
+
+		wlan_active_led {
+			label = "yellow:wlan";
+			gpios = <&gpio7  1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "phy0tx";
+			default-state = "off";
+		};
 	};
 
 	reg_1p8v: regulator0 {
@@ -98,6 +105,17 @@
 			  1800000 0>;
 	};
 
+	wlan_en_reg: regulator-wlan_en {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan-en-regulator";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		startup-delay-us = <70000>;
+
+		gpio = <&gpio_expander 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	x302_clk: x302-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -242,6 +260,12 @@
 		power-source = <1800>;
 	};
 
+	sdhi2_pins: sd2 {
+		groups = "sdhi2_data4", "sdhi2_ctrl";
+		function = "sdhi2";
+		power-source = <1800>;
+	};
+
 	sdhi3_pins: sd3 {
 		groups = "sdhi3_data8", "sdhi3_ctrl", "sdhi3_ds";
 		function = "sdhi3";
@@ -301,6 +325,27 @@
 	status = "okay";
 };
 
+&sdhi2 {
+	status = "okay";
+	pinctrl-0 = <&sdhi2_pins>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&wlan_en_reg>;
+	bus-width = <4>;
+	non-removable;
+	cap-power-off-card;
+	keep-power-in-suspend;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+	wlcore: wlcore@2 {
+		compatible = "ti,wl1837";
+		reg = <2>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
+
 &sdhi3 {
 	pinctrl-0 = <&sdhi3_pins>;
 	pinctrl-1 = <&sdhi3_pins>;
-- 
2.7.4

