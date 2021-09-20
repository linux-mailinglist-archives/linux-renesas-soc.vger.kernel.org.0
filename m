Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3011E412452
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Sep 2021 20:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353244AbhITSdc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 14:33:32 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:53180 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1379953AbhITSba (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 14:31:30 -0400
X-IronPort-AV: E=Sophos;i="5.85,309,1624287600"; 
   d="scan'208";a="94592965"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Sep 2021 03:30:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.208])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CFC7840D2FEC;
        Tue, 21 Sep 2021 03:29:59 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: rzg2l-smarc: Enable USB2.0 support
Date:   Mon, 20 Sep 2021 19:29:54 +0100
Message-Id: <20210920182955.13445-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210920182955.13445-1-biju.das.jz@bp.renesas.com>
References: <20210920182955.13445-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable USB2.0 Host/Device support on RZ/G2L SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 61 ++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index 0987163f25ee..7ecd4a3f4175 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -17,17 +17,63 @@
 		bootargs = "ignore_loglevel";
 		stdout-path = "serial0:115200n8";
 	};
+
+	usb0_vbus_otg: regulator-usb0-vbus-otg {
+		compatible = "regulator-fixed";
+
+		regulator-name = "USB0_VBUS_OTG";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+};
+
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
 };
 
 &extal_clk {
 	clock-frequency = <24000000>;
 };
 
+&hsusb {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&phyrst {
+	status = "okay";
+};
+
 &pinctrl {
 	scif0_pins: scif0 {
 		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>,	/* TxD */
 			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
 	};
+
+	usb0_pins: usb0 {
+		pinmux = <RZG2L_PORT_PINMUX(4, 0, 1)>, /* VBUS */
+			 <RZG2L_PORT_PINMUX(5, 0, 1)>, /* OVC */
+			 <RZG2L_PORT_PINMUX(5, 1, 1)>; /* OTG_ID */
+	};
+
+	usb1_pins: usb1 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 0, 1)>, /* VBUS */
+			 <RZG2L_PORT_PINMUX(42, 1, 1)>; /* OVC */
+	};
 };
 
 &scif0 {
@@ -35,3 +81,18 @@
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
2.17.1

