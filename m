Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356D02FE72C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jan 2021 11:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbhAUKKE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jan 2021 05:10:04 -0500
Received: from www.zeus03.de ([194.117.254.33]:48468 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729013AbhAUKH2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 05:07:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=ikbIfM7+1dIC1e
        1IQLe0jNrwz9NKadaOzjOrT7MTOC0=; b=HRxLTigWXYJXcdhgnPwnDXJ7PQ5Qbc
        VDhdi333OFks4Wu+Y70Gqn334SKqiUTIT7aqdxNVg7LeQYMF/MPOkq100iY8u2Hr
        M1BiHlwfri4S0/O24nElSaYVfgP9dcYxX+zdLplsMiUP08UCewl9/N/7eVIkr1L1
        NBdTVuoROR2Po=
Received: (qmail 1790615 invoked from network); 21 Jan 2021 11:06:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2021 11:06:29 +0100
X-UD-Smtp-Session: l3s3148p1@B+S2OWa5ur4gAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] WIP! arm64: dts: renesas: falcon: Add Ethernet-AVB1-5 support
Date:   Thu, 21 Jan 2021 11:06:19 +0100
Message-Id: <20210121100619.5653-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121100619.5653-1-wsa+renesas@sang-engineering.com>
References: <20210121100619.5653-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PHYs on the subboard could not be reached via remote access. But this is
the latest DTS snipplet with some fixes suggested by Geert as a starting
point. Not for upstream yet!

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Change since v1:

* new patch
* removed rxc-skew-ps property
* renamed phy-addresses to 0 ('@0')
* dropped '_tx' suffix from 'pins_mii' config
* added 'okay' status
* moved entries to Falcon CPU dtsi

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 160 ++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index f96b03f39787..0059381443f6 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -50,6 +50,81 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&avb1 {
+	pinctrl-0 = <&avb1_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-txid";
+	status = "okay";
+
+	phy1: ethernet-phy@0 {
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
+	status = "okay";
+
+	phy2: ethernet-phy@0 {
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
+	status = "okay";
+
+	phy3: ethernet-phy@0 {
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
+	status = "okay";
+
+	phy4: ethernet-phy@0 {
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
+	status = "okay";
+
+	phy5: ethernet-phy@0 {
+		reg = <0>;
+		interrupt-parent = <&gpio9>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio9 15 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
@@ -133,6 +208,91 @@ pins_mii {
 
 	};
 
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
+		pins_mii {
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
+		pins_mii {
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
+		pins_mii {
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
+		pins_mii {
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
+		ins_mii {
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

