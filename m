Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9683F1E119A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2020 17:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404132AbgEYPXF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 11:23:05 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:47234 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404050AbgEYPXE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 11:23:04 -0400
X-IronPort-AV: E=Sophos;i="5.73,433,1583161200"; 
   d="scan'208";a="47971339"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 May 2020 00:23:03 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2D34B4006A8E;
        Tue, 26 May 2020 00:23:00 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] ARM: dts: r8a7742-iwg21d-q7: Enable SDHI2 controller
Date:   Mon, 25 May 2020 16:22:07 +0100
Message-Id: <1590420129-7531-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590420129-7531-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1590420129-7531-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable the SDHI2 controller on iWave RZ/G1H carrier board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 47 +++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
index e154e3a..bb1deb0 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
@@ -21,6 +21,28 @@
 		bootargs = "ignore_loglevel root=/dev/mmcblk0p1 rw rootwait";
 		stdout-path = "serial2:115200n8";
 	};
+
+	vcc_sdhi2: regulator-vcc-sdhi2 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "SDHI2 Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&gpio1 27 GPIO_ACTIVE_LOW>;
+	};
+
+	vccq_sdhi2: regulator-vccq-sdhi2 {
+		compatible = "regulator-gpio";
+
+		regulator-name = "SDHI2 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&gpio1 8 GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <3300000 1>, <1800000 0>;
+	};
 };
 
 &pfc {
@@ -33,6 +55,18 @@
 		groups = "scifb2_data", "scifb2_ctrl";
 		function = "scifb2";
 	};
+
+	sdhi2_pins: sd2 {
+		groups = "sdhi2_data4", "sdhi2_ctrl";
+		function = "sdhi2";
+		power-source = <3300>;
+	};
+
+	sdhi2_pins_uhs: sd2_uhs {
+		groups = "sdhi2_data4", "sdhi2_ctrl";
+		function = "sdhi2";
+		power-source = <1800>;
+	};
 };
 
 &scifa2 {
@@ -49,3 +83,16 @@
 	uart-has-rtscts;
 	status = "okay";
 };
+
+&sdhi2 {
+	pinctrl-0 = <&sdhi2_pins>;
+	pinctrl-1 = <&sdhi2_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&vcc_sdhi2>;
+	vqmmc-supply = <&vccq_sdhi2>;
+	cd-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
+	sd-uhs-sdr50;
+	status = "okay";
+};
-- 
2.7.4

