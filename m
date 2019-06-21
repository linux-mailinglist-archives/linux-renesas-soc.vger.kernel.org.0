Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C26A54E321
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfFUJRR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:17:17 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34780 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJRR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:17:17 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id AEAFF25BE91;
        Fri, 21 Jun 2019 19:16:38 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 742149434C1; Fri, 21 Jun 2019 11:16:35 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 44/53] arm64: dts: renesas: hihope-common: Add USB 2.0 support
Date:   Fri, 21 Jun 2019 11:16:22 +0200
Message-Id: <734d277f412ae9e6ea9f2ee7a6b5f1b3deadf2fc.1561107232.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561107232.git.horms+renesas@verge.net.au>
References: <cover.1561107232.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Add USB 2.0 support to the HiHope RZ/G2M.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 76 ++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 12047ee65a97..18763ca553f7 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -35,6 +35,17 @@
 		regulator-always-on;
 	};
 
+	vbus0_usb2: regulator-vbus0-usb2 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "USB20_VBUS0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&gpio6 16 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	vccq_sdhi0: regulator-vccq-sdhi0 {
 		compatible = "regulator-gpio";
 
@@ -49,6 +60,14 @@
 	};
 };
 
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
@@ -57,6 +76,28 @@
 	clock-frequency = <32768>;
 };
 
+&gpio6 {
+	usb1-reset {
+		gpio-hog;
+		gpios = <10 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "usb1-reset";
+	};
+};
+
+&hsusb {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
 &pcie_bus_clk {
 	clock-frequency = <100000000>;
 };
@@ -92,6 +133,23 @@
 		function = "sdhi3";
 		power-source = <1800>;
 	};
+
+	usb0_pins: usb0 {
+		groups = "usb0";
+		function = "usb0";
+	};
+
+	usb1_pins: usb1 {
+		mux {
+			groups = "usb1";
+			function = "usb1";
+		};
+
+		ovc {
+			pins = "GP_6_27";
+			bias-pull-up;
+		};
+	};
 };
 
 &rwdt {
@@ -135,5 +193,23 @@
 	mmc-hs200-1_8v;
 	non-removable;
 	fixed-emmc-driver-type = <1>;
+};
+
+&usb_extal_clk {
+	clock-frequency = <50000000>;
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+
+	vbus-supply = <&vbus0_usb2>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
-- 
2.11.0

