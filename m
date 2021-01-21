Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAD92FE72F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jan 2021 11:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728896AbhAUKKa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jan 2021 05:10:30 -0500
Received: from www.zeus03.de ([194.117.254.33]:48444 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729005AbhAUKH2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 05:07:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=gttZ/1liVnb/3Z
        3TVIe3G63cwP0OaP/4JR5ZxcIYYL0=; b=F1wLTCSiDwgAEN0yFWVuWUXxYHuVEb
        5KR8cicL88ff/a3K9fjXmJcVbybcW/ivK1oc3587Crpxp7ApO+yrK5+fEFjO3Zga
        HFpBdF4U8KN2jsu8T4Gu3cCgWkIk4RCd0N2haWu2CxY1kROtjaTGrwmKiCgOn/tF
        KV8G5n6KDtTl0=
Received: (qmail 1790576 invoked from network); 21 Jan 2021 11:06:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2021 11:06:29 +0100
X-UD-Smtp-Session: l3s3148p1@J/6rOWa5uL4gAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: renesas: falcon: Add Ethernet-AVB0 support
Date:   Thu, 21 Jan 2021 11:06:18 +0100
Message-Id: <20210121100619.5653-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121100619.5653-1-wsa+renesas@sang-engineering.com>
References: <20210121100619.5653-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Change since v1:

* removed avb1-5 which couldn't be tested
* added alias for avb0 so firmware can add MAC address
* added custom tx-internal-delay-ps
* dropped '_tx' suffix from 'pins_mii' config
* moved entries to Falcon CPU dtsi

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 35 +++++++++++++++++++
 .../boot/dts/renesas/r8a779a0-falcon.dts      |  1 +
 2 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index 6dcd4683b071..f96b03f39787 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2020 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/gpio/gpio.h>
 #include "r8a779a0.dtsi"
 
 / {
@@ -33,6 +34,22 @@ memory@700000000 {
 	};
 };
 
+&avb0 {
+	pinctrl-0 = <&avb0_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy0>;
+	tx-internal-delay-ps = <2000>;
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
 &extal_clk {
 	clock-frequency = <16666666>;
 };
@@ -98,6 +115,24 @@ &i2c6 {
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
+		pins_mii {
+			groups = "avb0_rgmii";
+			drive-strength = <21>;
+		};
+
+	};
+
 	i2c0_pins: i2c0 {
 		groups = "i2c0";
 		function = "i2c0";
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index fb9978ea18f4..5617b81dd7dc 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -13,6 +13,7 @@ / {
 	compatible = "renesas,falcon-breakout", "renesas,falcon-cpu", "renesas,r8a779a0";
 
 	aliases {
+		ethernet0 = &avb0;
 		serial0 = &scif0;
 	};
 
-- 
2.29.2

