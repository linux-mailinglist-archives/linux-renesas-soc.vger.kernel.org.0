Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9AD52E312F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Dec 2020 14:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgL0NFG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Dec 2020 08:05:06 -0500
Received: from www.zeus03.de ([194.117.254.33]:37888 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726188AbgL0NFF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Dec 2020 08:05:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=Rpqirwi+FXK5ul
        96UovB2vnZP2Py1L6QK4XMz/599TE=; b=hRtIpVvizaSe+zsWaed1eZnnNlgNjl
        u1OjfjZchS+KyNNZtZ7zvmnD5GYwlSqXHApHovF/roIYjpm4BIT40FrHCL0OR/+Y
        mbMyLP09PQyvy5CRW3XvqGrK9Apc3Z/+4xu+aqmsGf+bUSY6Ii/LQp3X/jfWCT4X
        ACZrIDlzecvQ4=
Received: (qmail 1501215 invoked from network); 27 Dec 2020 14:04:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Dec 2020 14:04:20 +0100
X-UD-Smtp-Session: l3s3148p1@3Zi1y3G3aMEgAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Tho Vu <tho.vu.wh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: renesas: falcon: Add Ethernet-AVB support
Date:   Sun, 27 Dec 2020 14:04:05 +0100
Message-Id: <20201227130407.10991-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201227130407.10991-1-wsa+renesas@sang-engineering.com>
References: <20201227130407.10991-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Tho Vu <tho.vu.wh@renesas.com>

Define the Falcon board dependent part of the Ethernet-AVB device nodes.
Only AVB0 was tested because it was the only port with a PHY on current
hardware.

Signed-off-by: Tho Vu <tho.vu.wh@renesas.com>
[wsa: rebased]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../boot/dts/renesas/r8a779a0-falcon.dts      | 195 ++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index f7f62fc40429..f5f27dece6ee 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 #include "r8a779a0-falcon-cpu.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Renesas Falcon CPU and Breakout boards based on r8a779a0";
@@ -21,6 +22,97 @@ chosen {
 	};
 };
 
+&avb0 {
+	pinctrl-0 = <&avb0_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-txid";
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&avb1 {
+	pinctrl-0 = <&avb1_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-txid";
+
+	phy1: ethernet-phy@1 {
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio5 15 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&avb2 {
+	pinctrl-0 = <&avb2_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy2>;
+	phy-mode = "rgmii-txid";
+
+	phy2: ethernet-phy@2 {
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&avb3 {
+	pinctrl-0 = <&avb3_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy3>;
+	phy-mode = "rgmii-txid";
+
+	phy3: ethernet-phy@3{
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+		interrupt-parent = <&gpio7>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio7 15 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&avb4 {
+	pinctrl-0 = <&avb4_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy4>;
+	phy-mode = "rgmii-txid";
+
+	phy4: ethernet-phy@4 {
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+		interrupt-parent = <&gpio8>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio8 15 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&avb5 {
+	pinctrl-0 = <&avb5_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy5>;
+	phy-mode = "rgmii-txid";
+
+	phy5: ethernet-phy@5 {
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+		interrupt-parent = <&gpio9>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio9 15 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
@@ -78,6 +170,109 @@ &i2c6 {
 };
 
 &pfc {
+	avb0_pins: avb0 {
+		mux {
+			groups = "avb0_link", "avb0_mdio", "avb0_rgmii", "avb0_txcrefclk";
+			function = "avb0";
+		};
+
+		pins_mdio {
+			groups = "avb0_mdio";
+			drive-strength = <21>;
+		};
+
+		pins_mii_tx {
+			groups = "avb0_rgmii";
+			drive-strength = <21>;
+		};
+
+	};
+
+	avb1_pins: avb1 {
+		mux {
+			groups = "avb1_link", "avb1_mdio", "avb1_rgmii", "avb1_txcrefclk";
+			function = "avb1";
+		};
+
+		pins_mdio {
+			groups = "avb1_mdio";
+			drive-strength = <21>;
+		};
+
+		pins_mii_tx {
+			groups = "avb1_rgmii";
+			drive-strength = <21>;
+		};
+	};
+
+	avb2_pins: avb2 {
+		mux {
+			groups = "avb2_link", "avb2_mdio", "avb2_rgmii", "avb2_txcrefclk";
+			function = "avb2";
+		};
+
+		pins_mdio {
+			groups = "avb2_mdio";
+			drive-strength = <21>;
+		};
+
+		pins_mii_tx {
+			groups = "avb2_rgmii";
+			drive-strength = <21>;
+		};
+	};
+
+	avb3_pins: avb3 {
+		mux {
+			groups = "avb3_link", "avb3_mdio", "avb3_rgmii", "avb3_txcrefclk";
+			function = "avb3";
+		};
+
+		pins_mdio {
+			groups = "avb3_mdio";
+			drive-strength = <21>;
+		};
+
+		pins_mii_tx {
+			groups = "avb3_rgmii";
+			drive-strength = <21>;
+		};
+	};
+
+	avb4_pins: avb4 {
+		mux {
+			groups = "avb4_link", "avb4_mdio", "avb4_rgmii", "avb4_txcrefclk";
+			function = "avb4";
+		};
+
+		pins_mdio {
+			groups = "avb4_mdio";
+			drive-strength = <21>;
+		};
+
+		pins_mii_tx {
+			groups = "avb4_rgmii";
+			drive-strength = <21>;
+		};
+	};
+
+	avb5_pins: avb5 {
+		mux {
+			groups = "avb5_link", "avb5_mdio", "avb5_rgmii", "avb5_txcrefclk";
+			function = "avb5";
+		};
+
+		pins_mdio {
+			groups = "avb5_mdio";
+			drive-strength = <21>;
+		};
+
+		pins_mii_tx {
+			groups = "avb5_rgmii";
+			drive-strength = <21>;
+		};
+	};
+
 	i2c0_pins: i2c0 {
 		groups = "i2c0";
 		function = "i2c0";
-- 
2.29.2

