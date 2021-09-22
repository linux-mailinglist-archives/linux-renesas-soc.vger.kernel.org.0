Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36694152A5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 23:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237852AbhIVVWg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 17:22:36 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:47514 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238174AbhIVVWd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 17:22:33 -0400
X-IronPort-AV: E=Sophos;i="5.85,315,1624287600"; 
   d="scan'208";a="94853370"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Sep 2021 06:21:02 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7CF3A4103C3F;
        Thu, 23 Sep 2021 06:21:00 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable CANFD
Date:   Wed, 22 Sep 2021 22:20:49 +0100
Message-Id: <20210922212049.19851-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210922212049.19851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210922212049.19851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable CANFD on RZ/G2L SMARC platform.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 40 ++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index e895f6e7fa28..5dc4fff33076 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -80,6 +80,20 @@
 	clock-frequency = <12288000>;
 };
 
+&canfd {
+	pinctrl-0 = <&can0_pins &can1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	channel0 {
+		status = "okay";
+	};
+
+	channel1 {
+		status = "okay";
+	};
+};
+
 &ehci0 {
 	dr_mode = "otg";
 	status = "okay";
@@ -139,6 +153,32 @@
 	pinctrl-0 = <&sound_clk_pins>;
 	pinctrl-names = "default";
 
+	can0_pins: can0 {
+		pinmux = <RZG2L_PORT_PINMUX(10, 1, 2)>, /* TX */
+			 <RZG2L_PORT_PINMUX(11, 0, 2)>; /* RX */
+	};
+
+	/* SW7 should be at position 2->3 so that GPIO8_CAN0_STB line is activated */
+	can0-stb {
+		gpio-hog;
+		gpios = <RZG2L_GPIO(42, 2) GPIO_ACTIVE_LOW>;
+		output-high;
+		line-name = "can0_stb";
+	};
+
+	can1_pins: can1 {
+		pinmux = <RZG2L_PORT_PINMUX(12, 1, 2)>, /* TX */
+			 <RZG2L_PORT_PINMUX(13, 0, 2)>; /* RX */
+	};
+
+	/* SW8 should be at position 2->3 so that GPIO9_CAN1_STB line is activated */
+	can1-stb {
+		gpio-hog;
+		gpios = <RZG2L_GPIO(42, 3) GPIO_ACTIVE_LOW>;
+		output-high;
+		line-name = "can1_stb";
+	};
+
 	i2c0_pins: i2c0 {
 		pins = "RIIC0_SDA", "RIIC0_SCL";
 		input-enable;
-- 
2.17.1

