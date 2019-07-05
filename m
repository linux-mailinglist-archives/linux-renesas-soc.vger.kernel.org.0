Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3822560455
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2019 12:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728100AbfGEKUm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Jul 2019 06:20:42 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:54193 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727723AbfGEKUm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jul 2019 06:20:42 -0400
X-IronPort-AV: E=Sophos;i="5.62,454,1554735600"; 
   d="scan'208";a="20430351"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 05 Jul 2019 19:20:41 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BFD674007531;
        Fri,  5 Jul 2019 19:20:38 +0900 (JST)
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
Subject: [PATCH 2/3] arm64: dts: renesas: hihope-common: Add BT support
Date:   Fri,  5 Jul 2019 11:15:19 +0100
Message-Id: <1562321720-18735-3-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562321720-18735-1-git-send-email-biju.das@bp.renesas.com>
References: <1562321720-18735-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enables BT support for the HiHope RZ/G2[MN] boards.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 1480242..fdeb4d2 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -10,6 +10,7 @@
 / {
 	aliases {
 		serial0 = &scif2;
+		serial1 = &hscif0;
 	};
 
 	chosen {
@@ -31,6 +32,13 @@
 	leds {
 		compatible = "gpio-leds";
 
+		bt_active_led {
+			label = "blue:bt";
+			gpios = <&gpio7  0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "hci0-power";
+			default-state = "off";
+		};
+
 		led0 {
 			gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
 		};
@@ -153,6 +161,19 @@
 	};
 };
 
+&hscif0 {
+	pinctrl-0 = <&hscif0_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "ti,wl1837-st";
+		enable-gpios = <&gpio_expander 2 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &hsusb {
 	dr_mode = "otg";
 	status = "okay";
@@ -194,6 +215,11 @@
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
 
+	hscif0_pins: hscif0 {
+		groups = "hscif0_data", "hscif0_ctrl";
+		function = "hscif0";
+	};
+
 	scif2_pins: scif2 {
 		groups = "scif2_data_a";
 		function = "scif2";
-- 
2.7.4

