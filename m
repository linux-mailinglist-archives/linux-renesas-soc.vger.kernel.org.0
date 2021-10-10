Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77C104281E0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Oct 2021 16:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbhJJO13 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 10 Oct 2021 10:27:29 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:33850 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231928AbhJJO12 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 10 Oct 2021 10:27:28 -0400
X-IronPort-AV: E=Sophos;i="5.85,362,1624287600"; 
   d="scan'208";a="96527130"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 10 Oct 2021 23:25:29 +0900
Received: from localhost.localdomain (unknown [10.226.92.12])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BECF540065DA;
        Sun, 10 Oct 2021 23:25:27 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/2] arm64: dts: renesas: rzg2l-smarc: Enable microSD on SMARC platform
Date:   Sun, 10 Oct 2021 15:25:20 +0100
Message-Id: <20211010142520.21976-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211010142520.21976-1-biju.das.jz@bp.renesas.com>
References: <20211010142520.21976-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enables microSD card slot connected to SDHI1 on RZ/G2L SMARC
platform.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch has dependency upon [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20211006171605.6861-1-biju.das.jz@bp.renesas.com/
v3->v4:
 * No change
v2->v3
 * No change
v1->v2:
 * Used angular brackets for states
 * Removed extra space from power source
 * Fixed gpio-hog node name
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 62 ++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index a02784fab46a..d8b3d32dc6f5 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -70,6 +70,16 @@
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	vccq_sdhi1: regulator-vccq-sdhi1 {
+		compatible = "regulator-gpio";
+		regulator-name = "SDHI1 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pinctrl RZG2L_GPIO(39, 1) GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <3300000 1>, <1800000 0>;
+	};
 };
 
 &audio_clk1{
@@ -199,6 +209,45 @@
 			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
 	};
 
+	sd1-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZG2L_GPIO(39, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd1_pwr_en";
+	};
+
+	sdhi1_pins: sd1 {
+		sd1_data {
+			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
+			power-source = <3300>;
+		};
+
+		sd1_ctrl {
+			pins = "SD1_CLK", "SD1_CMD";
+			power-source = <3300>;
+		};
+
+		sd1_mux {
+			pinmux = <RZG2L_PORT_PINMUX(19, 0, 1)>; /* SD1_CD */
+		};
+	};
+
+	sdhi1_pins_uhs: sd1_uhs {
+		sd1_data_uhs {
+			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
+			power-source = <1800>;
+		};
+
+		sd1_ctrl_uhs {
+			pins = "SD1_CLK", "SD1_CMD";
+			power-source = <1800>;
+		};
+
+		sd1_mux_uhs {
+			pinmux = <RZG2L_PORT_PINMUX(19, 0, 1)>; /* SD1_CD */
+		};
+	};
+
 	sound_clk_pins: sound_clk {
 		pins = "AUDIO_CLK1", "AUDIO_CLK2";
 		input-enable;
@@ -229,6 +278,19 @@
 	status = "okay";
 };
 
+&sdhi1 {
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-1 = <&sdhi1_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vccq_sdhi1>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
 &ssi0 {
 	pinctrl-0 = <&ssi0_pins>;
 	pinctrl-names = "default";
-- 
2.17.1

