Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC075412454
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Sep 2021 20:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353243AbhITSde (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 14:33:34 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:14414 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1379474AbhITSbc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 14:31:32 -0400
X-IronPort-AV: E=Sophos;i="5.85,309,1624287600"; 
   d="scan'208";a="94592978"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Sep 2021 03:30:04 +0900
Received: from localhost.localdomain (unknown [10.226.92.208])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 391EA40D357E;
        Tue, 21 Sep 2021 03:30:02 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: rzg2l-smarc: Enable I2C{0,1,3} support
Date:   Mon, 20 Sep 2021 19:29:55 +0100
Message-Id: <20210920182955.13445-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210920182955.13445-1-biju.das.jz@bp.renesas.com>
References: <20210920182955.13445-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable I2C{0,1,3} support on RZ/G2L SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 39 ++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index 7ecd4a3f4175..8ecc5b45fc99 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -11,6 +11,9 @@
 / {
 	aliases {
 		serial0 = &scif0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c3 = &i2c3;
 	};
 
 	chosen {
@@ -45,6 +48,27 @@
 	status = "okay";
 };
 
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &ohci0 {
 	dr_mode = "otg";
 	status = "okay";
@@ -59,6 +83,21 @@
 };
 
 &pinctrl {
+	i2c0_pins: i2c0 {
+		pins = "RIIC0_SDA", "RIIC0_SCL";
+		input-enable;
+	};
+
+	i2c1_pins: i2c1 {
+		pins = "RIIC1_SDA", "RIIC1_SCL";
+		input-enable;
+	};
+
+	i2c3_pins: i2c3 {
+		pinmux = <RZG2L_PORT_PINMUX(18, 0, 3)>, /* SDA */
+			 <RZG2L_PORT_PINMUX(18, 1, 3)>; /* SCL */
+	};
+
 	scif0_pins: scif0 {
 		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>,	/* TxD */
 			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
-- 
2.17.1

