Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623131E439F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2020 15:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387821AbgE0N3J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 May 2020 09:29:09 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:24989 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387564AbgE0N3I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 May 2020 09:29:08 -0400
X-IronPort-AV: E=Sophos;i="5.73,441,1583161200"; 
   d="scan'208";a="47945759"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 May 2020 22:29:07 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 732A142E07B9;
        Wed, 27 May 2020 22:29:05 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add device tree for camera DB
Date:   Wed, 27 May 2020 14:29:01 +0100
Message-Id: <1590586141-21006-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the camera daughter board which is connected to
iWave's RZ/G1H Qseven carrier board. Also enable ttySC[0135] and
ethernet1 interfaces.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 arch/arm/boot/dts/Makefile                      |  1 +
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts | 94 +++++++++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index ed3376c..118e35c 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -918,6 +918,7 @@ dtb-$(CONFIG_ARCH_RENESAS) += \
 	r8a73a4-ape6evm.dtb \
 	r8a7740-armadillo800eva.dtb \
 	r8a7742-iwg21d-q7.dtb \
+	r8a7742-iwg21d-q7-dbcm-ca.dtb \
 	r8a7743-iwg20d-q7.dtb \
 	r8a7743-iwg20d-q7-dbcm-ca.dtb \
 	r8a7743-sk-rzg1m.dtb \
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
new file mode 100644
index 0000000..857aab5
--- /dev/null
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the iWave-RZ/G1H Qseven board development
+ * platform with camera daughter board
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a7742-iwg21d-q7.dts"
+
+/ {
+	model = "iWave Systems RZ/G1H Qseven development platform with camera add-on";
+	compatible = "iwave,g21d", "iwave,g21m", "renesas,r8a7742";
+
+	aliases {
+		serial0 = &scif0;
+		serial1 = &scif1;
+		serial3 = &scifb1;
+		serial5 = &hscif0;
+		ethernet1 = &ether;
+	};
+};
+
+&avb {
+	/* Pins shared with VIN0, keep status disabled */
+	status = "disabled";
+};
+
+&ether {
+	pinctrl-0 = <&ether_pins>;
+	pinctrl-names = "default";
+
+	phy-handle = <&phy1>;
+	renesas,ether-link-active-low;
+	status = "okay";
+
+	phy1: ethernet-phy@1 {
+		reg = <1>;
+		micrel,led-mode = <1>;
+	};
+};
+
+&hscif0 {
+	pinctrl-0 = <&hscif0_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&pfc {
+	ether_pins: ether {
+		groups = "eth_mdio", "eth_rmii";
+		function = "eth";
+	};
+
+	hscif0_pins: hscif0 {
+		groups = "hscif0_data", "hscif0_ctrl";
+		function = "hscif0";
+	};
+
+	scif0_pins: scif0 {
+		groups = "scif0_data";
+		function = "scif0";
+	};
+
+	scif1_pins: scif1 {
+		groups = "scif1_data";
+		function = "scif1";
+	};
+
+	scifb1_pins: scifb1 {
+		groups = "scifb1_data";
+		function = "scifb1";
+	};
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scif1 {
+	pinctrl-0 = <&scif1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scifb1 {
+	pinctrl-0 = <&scifb1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.7.4

