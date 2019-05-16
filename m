Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 420CD2022A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 11:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbfEPJGu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 05:06:50 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:58069 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726537AbfEPJGu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 05:06:50 -0400
X-IronPort-AV: E=Sophos;i="5.60,476,1549897200"; 
   d="scan'208";a="16122345"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 May 2019 18:06:49 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id ED0EB42BEB90;
        Thu, 16 May 2019 18:06:46 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a774c0-cat874: Add WLAN support
Date:   Thu, 16 May 2019 09:59:25 +0100
Message-Id: <1557997166-63351-2-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557997166-63351-1-git-send-email-biju.das@bp.renesas.com>
References: <1557997166-63351-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enables WLAN support for the CAT874 board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 38 +++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index b7183f1..72cccfc 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -104,6 +104,17 @@
 			  1800000 0>;
 	};
 
+	wlan_en_reg: fixedregulator {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan-en-regulator";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		startup-delay-us = <70000>;
+
+		gpio = <&gpio2 25 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	x13_clk: x13 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -243,6 +254,12 @@
 		power-source = <1800>;
 	};
 
+	sdhi3_pins: sd3 {
+		groups = "sdhi3_data4", "sdhi3_ctrl";
+		function = "sdhi3";
+		power-source = <1800>;
+	};
+
 	sound_pins: sound {
 		groups = "ssi01239_ctrl", "ssi0_data";
 		function = "ssi";
@@ -300,6 +317,27 @@
 	status = "okay";
 };
 
+&sdhi3 {
+	status = "okay";
+	pinctrl-0 = <&sdhi3_pins>;
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
+		interrupt-parent = <&gpio1>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
+
 &usb2_phy0 {
 	renesas,no-otg-pins;
 	status = "okay";
-- 
2.7.4

