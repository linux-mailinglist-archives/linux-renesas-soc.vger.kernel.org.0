Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5AA91F0E17
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jun 2020 20:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728299AbgFGSl6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 Jun 2020 14:41:58 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:26544 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728055AbgFGSlz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Jun 2020 14:41:55 -0400
X-IronPort-AV: E=Sophos;i="5.73,485,1583161200"; 
   d="scan'208";a="49036333"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jun 2020 03:41:54 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9EAAC40CCFCF;
        Mon,  8 Jun 2020 03:41:52 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 04/11] arm64: dts: renesas: Add HiHope RZ/G2M[N] Rev.3.0/4.0 specific into common file
Date:   Sun,  7 Jun 2020 19:41:00 +0100
Message-Id: <1591555267-21822-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Rev.3.0 and Rev.4.0 are identical and can be identified by using GP5_19
and GP5_21.

	Rev		GP5_19	GP5_21
	==============================
	Rev.3.0		0	0
	Rev.4.0		0	1

This patch creates hihope-common-rev4.dtsi file with
Rev.3.0/4.0 specific changes for HopeRun HiHope RZ/G2M[N] boards.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 .../boot/dts/renesas/hihope-common-rev4.dtsi  | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-common-rev4.dtsi

diff --git a/arch/arm64/boot/dts/renesas/hihope-common-rev4.dtsi b/arch/arm64/boot/dts/renesas/hihope-common-rev4.dtsi
new file mode 100644
index 000000000000..dbe715118f88
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/hihope-common-rev4.dtsi
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the HiHope RZ/G2[MN] Rev.3.0/4.0 main board
+ * common parts
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	audio_clkout: audio-clkout {
+		/*
+		 * This is same as <&rcar_sound 0>
+		 * but needed to avoid cs2000/rcar_sound probe dead-lock
+		 */
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12288000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led1 {
+			gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
+		};
+
+		led2 {
+			gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
+		};
+
+		led3 {
+			gpios = <&gpio0  0 GPIO_ACTIVE_HIGH>;
+		};
+
+		led4 {
+			gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	wlan_en_reg: regulator-wlan_en {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan-en-regulator";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		startup-delay-us = <70000>;
+
+		gpio = <&gpio4 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	x1801_clk: x1801-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24576000>;
+	};
+};
+
+&hscif0 {
+	bluetooth {
+		compatible = "ti,wl1837-st";
+		enable-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	cs2000: clk_multiplier@4f {
+		#clock-cells = <0>;
+		compatible = "cirrus,cs2000-cp";
+		reg = <0x4f>;
+		clocks = <&audio_clkout>, <&x1801_clk>;
+		clock-names = "clk_in", "ref_clk";
+
+		assigned-clocks = <&cs2000>;
+		assigned-clock-rates = <24576000>; /* 1/1 divide */
+	};
+};
+
+&pfc {
+	i2c2_pins: i2c2 {
+		groups = "i2c2_a";
+		function = "i2c2";
+	};
+
+	sound_clk_pins: sound_clk {
+		groups = "audio_clk_a_a", "audio_clk_b_a", "audio_clkout_a";
+		function = "audio_clk";
+	};
+
+	sound_pins: sound {
+		groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a";
+		function = "ssi";
+	};
+};
+
+&rcar_sound {
+	pinctrl-0 = <&sound_pins &sound_clk_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	/* Single DAI */
+	#sound-dai-cells = <0>;
+
+	/* audio_clkout0/1/2/3 */
+	#clock-cells = <1>;
+	clock-frequency = <12288000 11289600>;
+
+	/* update <audio_clk_b> to <cs2000> */
+	clocks = <&cpg CPG_MOD 1005>,
+		 <&cpg CPG_MOD 1006>, <&cpg CPG_MOD 1007>,
+		 <&cpg CPG_MOD 1008>, <&cpg CPG_MOD 1009>,
+		 <&cpg CPG_MOD 1010>, <&cpg CPG_MOD 1011>,
+		 <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1013>,
+		 <&cpg CPG_MOD 1014>, <&cpg CPG_MOD 1015>,
+		 <&cpg CPG_MOD 1022>, <&cpg CPG_MOD 1023>,
+		 <&cpg CPG_MOD 1024>, <&cpg CPG_MOD 1025>,
+		 <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>,
+		 <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
+		 <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
+		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
+		 <&audio_clk_a>, <&cs2000>,
+		 <&audio_clk_c>,
+		 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
+
+	rsnd_port: port {
+		rsnd_endpoint: endpoint {
+			remote-endpoint = <&dw_hdmi0_snd_in>;
+
+			dai-format = "i2s";
+			bitclock-master = <&rsnd_endpoint>;
+			frame-master = <&rsnd_endpoint>;
+
+			playback = <&ssi2>;
+		};
+	};
+};
-- 
2.17.1

