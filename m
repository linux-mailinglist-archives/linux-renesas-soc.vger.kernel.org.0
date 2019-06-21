Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBC6A4E337
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfFUJRm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:17:42 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34780 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbfFUJRm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:17:42 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 97E7625BECE;
        Fri, 21 Jun 2019 19:16:43 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7ED0394333F; Fri, 21 Jun 2019 11:16:34 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 31/53] arm64: dts: renesas: Add HiHope RZ/G2M sub board support
Date:   Fri, 21 Jun 2019 11:16:09 +0200
Message-Id: <7433f1fb8ec8fe40d069215ae431d5c33235bfb5.1561107232.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561107232.git.horms+renesas@verge.net.au>
References: <cover.1561107232.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

The HiHope RZ/G2M sub board sits below the HiHope RZ/G2M main board.
This patch also adds ethernet support along with a dtsi common to
both HiHope RZ/G2M and RZ/G2N sub boards.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/Makefile               |  1 +
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |  2 +
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    | 55 ++++++++++++++++++++++
 .../boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dts  | 15 ++++++
 4 files changed, 73 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index aa33074b7360..42b74c283289 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m.dtb
+dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-h3ulcb-kf.dtb
diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index de206b7ae4e0..4cc924d38cf6 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -5,6 +5,8 @@
  * Copyright (C) 2019 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	aliases {
 		serial0 = &scif2;
diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
new file mode 100644
index 000000000000..b1e459447d1a
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the RZ/G2[MN] HiHope sub board common parts
+ *
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ */
+
+/ {
+	aliases {
+		ethernet0 = &avb;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
+	};
+};
+
+&avb {
+	pinctrl-0 = <&avb_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-txid";
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&pfc {
+	pinctrl-0 = <&scif_clk_pins>;
+	pinctrl-names = "default";
+
+	avb_pins: avb {
+		mux {
+			groups = "avb_link", "avb_mdio", "avb_mii";
+			function = "avb";
+		};
+
+		pins_mdio {
+			groups = "avb_mdio";
+			drive-strength = <24>;
+		};
+
+		pins_mii_tx {
+			pins = "PIN_AVB_TX_CTL", "PIN_AVB_TXC", "PIN_AVB_TD0",
+			       "PIN_AVB_TD1", "PIN_AVB_TD2", "PIN_AVB_TD3";
+			drive-strength = <12>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dts b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dts
new file mode 100644
index 000000000000..6e33a3b27706
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the HiHope RZ/G2M sub board
+ *
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ */
+
+#include "r8a774a1-hihope-rzg2m.dts"
+#include "hihope-rzg2-ex.dtsi"
+
+/ {
+	model = "HopeRun HiHope RZ/G2M with sub board";
+	compatible = "hoperun,hihope-rzg2-ex", "hoperun,hihope-rzg2m",
+		     "renesas,r8a774a1";
+};
-- 
2.11.0

