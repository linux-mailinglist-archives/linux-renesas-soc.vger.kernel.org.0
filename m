Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F17BC453D85
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 02:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbhKQBP5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 20:15:57 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:58500 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230429AbhKQBPz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 20:15:55 -0500
X-IronPort-AV: E=Sophos;i="5.87,239,1631545200"; 
   d="scan'208";a="100847662"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Nov 2021 10:12:57 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 458F9400F501;
        Wed, 17 Nov 2021 10:12:55 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: rzg2l-smarc: Enable RSPI1 on carrier board
Date:   Wed, 17 Nov 2021 01:12:47 +0000
Message-Id: <20211117011247.27621-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117011247.27621-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211117011247.27621-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RSPI1 (SPI1) interface is available on PMOD0 connector (J1) on carrier
board, This patch adds pinmux and spi1 node to carrier board dtsi file.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index 4c32f068a1f0..f9460ec5c8fa 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -31,6 +31,7 @@
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c3 = &i2c3;
+		spi1 = &spi1;
 	};
 
 	chosen {
@@ -263,6 +264,13 @@
 		input-enable;
 	};
 
+	spi1_pins: spi1 {
+		pinmux = <RZG2L_PORT_PINMUX(44, 0, 1)>, /* CK */
+			 <RZG2L_PORT_PINMUX(44, 1, 1)>, /* MOSI */
+			 <RZG2L_PORT_PINMUX(44, 2, 1)>, /* MISO */
+			 <RZG2L_PORT_PINMUX(44, 3, 1)>; /* SSL */
+	};
+
 	ssi0_pins: ssi0 {
 		pinmux = <RZG2L_PORT_PINMUX(45, 0, 1)>, /* BCK */
 			 <RZG2L_PORT_PINMUX(45, 1, 1)>, /* RCK */
@@ -318,6 +326,13 @@
 	status = "okay";
 };
 
+&spi1 {
+	pinctrl-0 = <&spi1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &ssi0 {
 	pinctrl-0 = <&ssi0_pins>;
 	pinctrl-names = "default";
-- 
2.17.1

