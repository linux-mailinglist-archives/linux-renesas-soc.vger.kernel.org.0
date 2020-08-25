Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2223E251D34
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Aug 2020 18:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgHYQ2c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Aug 2020 12:28:32 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:40146 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725805AbgHYQ2b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Aug 2020 12:28:31 -0400
X-IronPort-AV: E=Sophos;i="5.76,353,1592838000"; 
   d="scan'208";a="55277832"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Aug 2020 01:28:30 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0D981409E769;
        Wed, 26 Aug 2020 01:28:28 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH 2/4] ARM: dts: r8a7742-iwg21d-q7: Add SPI NOR support
Date:   Tue, 25 Aug 2020 17:27:16 +0100
Message-Id: <20200825162718.5838-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the SPI NOR device which is connected to MSIOF0 interface
on the iWave RainboW-G21d-q7 board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
index 73300ab46ea6..e709a132f2f7 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
@@ -220,6 +220,32 @@
 	status = "okay";
 };
 
+&msiof0 {
+	pinctrl-0 = <&msiof0_pins>;
+	pinctrl-names = "default";
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+
+	flash1: flash@0 {
+		compatible = "sst,sst25vf016b", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "user";
+				reg = <0x00000000 0x00200000>;
+			};
+		};
+	};
+};
+
 &pci0 {
 	pinctrl-0 = <&usb0_pins>;
 	pinctrl-names = "default";
@@ -266,6 +292,11 @@
 		function = "i2c2";
 	};
 
+	msiof0_pins: msiof0 {
+		groups = "msiof0_clk", "msiof0_tx", "msiof0_rx";
+		function = "msiof0";
+	};
+
 	scifa2_pins: scifa2 {
 		groups = "scifa2_data_c";
 		function = "scifa2";
-- 
2.17.1

