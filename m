Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD438456EEB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 13:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235076AbhKSMkj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 07:40:39 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:59276 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230385AbhKSMkj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 07:40:39 -0500
X-IronPort-AV: E=Sophos;i="5.87,247,1631545200"; 
   d="scan'208";a="100832770"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 19 Nov 2021 21:37:36 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7961540061A3;
        Fri, 19 Nov 2021 21:37:34 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: rzg2l-smarc-som: Enable serial NOR flash
Date:   Fri, 19 Nov 2021 12:37:10 +0000
Message-Id: <20211119123710.31575-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable mt25qu512a flash connected to QSPI0.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index 7e84a29dddfa..e53c17954566 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -178,6 +178,18 @@
 		line-name = "gpio_sd0_pwr_en";
 	};
 
+	qspi_pins0: qspi0 {
+		qspi0-data {
+			pins = "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO3";
+			power-source  = <1800>;
+		};
+
+		qspi0-ctrl {
+			pins = "QSPI0_SPCLK", "QSPI0_SSL", "QSPI_RESET#";
+			power-source  = <1800>;
+		};
+	};
+
 	/*
 	 * SD0 device selection is XOR between GPIO_SD0_DEV_SEL and SW1[2]
 	 * The below switch logic can be used to select the device between
@@ -243,6 +255,34 @@
 	};
 };
 
+&sbc {
+	pinctrl-0 = <&qspi_pins0>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "micron,mt25qu512a", "jedec,spi-nor";
+		reg = <0>;
+		m25p,fast-read;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			boot@0 {
+				reg = <0x00000000 0x2000000>;
+				read-only;
+			};
+			user@2000000 {
+				reg = <0x2000000 0x2000000>;
+			};
+		};
+	};
+};
+
 #if SDHI
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_pins>;
-- 
2.17.1

