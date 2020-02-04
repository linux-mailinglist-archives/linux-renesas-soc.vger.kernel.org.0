Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCE261517BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2020 10:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgBDJXA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Feb 2020 04:23:00 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:13935 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726554AbgBDJW7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Feb 2020 04:22:59 -0500
X-IronPort-AV: E=Sophos;i="5.70,398,1574089200"; 
   d="scan'208";a="38188325"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 04 Feb 2020 18:22:58 +0900
Received: from marian-VirtualBox.ree.adwin.renesas.com (unknown [10.226.36.164])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 547424006DEE;
        Tue,  4 Feb 2020 18:22:57 +0900 (JST)
From:   Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Chris Paterson <chris.paterson2@renesas.com>,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Subject: [PATCH] ARM: dts: iwg22d-sodimm: Enable touchscreen
Date:   Tue,  4 Feb 2020 09:22:54 +0000
Message-Id: <1580808174-11289-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In one of the iWave-G22D development board variants, called Generic SODIMM
Development Platform, we have an LCD with touchscreen. The resistive touch
controller, STMPE811 is on the development board and is connected through
the i2c5 of the RZ-G1E.

Additionally, this controller should generate an interrupt to the CPU and
it is connected through GPIO4,4 to the GIC.

Touch was tested with one of our iW-RainboW-G22D-SODIMM RZ/G1E development
platforms.

More details on the iWave website:
https://www.iwavesystems.com/rz-g1e-sodimm-development-kit.html

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
index ce6603b..1051d82 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
@@ -128,6 +128,47 @@
 	status = "okay";
 	clock-frequency = <400000>;
 
+	stmpe811@44 {
+		compatible = "st,stmpe811";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x44>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpio = <&gpio4 4 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&touch>;
+		pinctrl-names = "default";
+		id = <0>;
+		blocks = <0x5>;
+		irq-trigger = <0x1>;
+
+		stmpe_touchscreen {
+			compatible = "st,stmpe-ts";
+			reg = <0>;
+			/* 3.25 MHz ADC clock speed */
+			st,adc-freq = <3>;
+			/* 8 sample average control */
+			st,ave-ctrl = <2>;
+			/* 7 length fractional part in z */
+			st,fraction-z = <7>;
+			/*
+			 * 50 mA typical 80 mA max touchscreen drivers
+			 * current limit value
+			 */
+			st,i-drive = <0>;
+			/* 12-bit ADC */
+			st,mod-12b = <1>;
+			/* internal ADC reference */
+			st,ref-sel = <0>;
+			/* ADC converstion time: 80 clocks */
+			st,sample-time = <4>;
+			/* 1 ms panel driver settling time */
+			st,settling = <3>;
+			/* 5 ms touch detect interrupt delay */
+			st,touch-det-delay = <4>;
+		};
+	};
+
 	sgtl5000: codec@a {
 		compatible = "fsl,sgtl5000";
 		#sound-dai-cells = <0>;
@@ -181,6 +222,11 @@
 		function = "ssi";
 	};
 
+	touch: stmpe811 {
+		groups = "intc_irq0";
+		function = "intc";
+	};
+
 	usb0_pins: usb0 {
 		groups = "usb0";
 		function = "usb0";
-- 
2.7.4

