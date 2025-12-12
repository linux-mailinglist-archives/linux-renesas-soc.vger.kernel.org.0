Return-Path: <linux-renesas-soc+bounces-25723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72679CB9C99
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 21:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6146B30C1283
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 20:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325452D6E6A;
	Fri, 12 Dec 2025 20:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Umnn8xB/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DF029D292;
	Fri, 12 Dec 2025 20:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571589; cv=none; b=FMzB7a/vri9LKsm2ISFF0oEZmnNWbkegAm0BnDt5CFLmTRchog+v0ZvfXSnUZgP0C7BY6GZx1n77lEzm7p6vattoHaXeO4jT2okNUgEOh8QQYMDDeV0DbmnkFzzehzx3kvjKAZduPGzvzU7Y1wtiMTOfqpTgeLu9cM9u4lLo3QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571589; c=relaxed/simple;
	bh=5B2vSdXoneVvJtO2lTToIM1NsU8oEU7bS285epobsro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QuZDv+awafIznZZJN/TJwSFTb7fvskOYUJ7Cq54XnNCtJUofeAnF8Z2QxFTIYuyGQGNFfGvjYaHBuqz41JTO9SWM2vlnQTmLz2w2H0o9tHJiVR7MvPy+xlj9JKLOn6vs6e7hA52IV6kNJIUx1SA09ApIKvPpL8KTA8NHVVMxk3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Umnn8xB/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4101AC4CEF1;
	Fri, 12 Dec 2025 20:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765571588;
	bh=5B2vSdXoneVvJtO2lTToIM1NsU8oEU7bS285epobsro=;
	h=From:To:Cc:Subject:Date:From;
	b=Umnn8xB/u8umZveLTZqRTZPLPqYcj05BwywjnDtrBYoLZj8d9KK9wkUaQp/3gNDAC
	 w9p4XsO+ta8ydQfGY+lRmP4QlRc39w22dtuZ3G73E1yGNtOknQnUS5BEjzDQQQrD5Q
	 TNBM80rxn6YIt5TAyHgDiwQ3FU+7N0WbhWBE4QG11cfm3s0RPhahkcnPPB+p+GhWrn
	 yYxY8XIMb0k3DDqUbtQdul5oEpaBM6GTo0H/T9ZwH+ZeXZGBdBBeLYclkEXW0rhz1a
	 zpRNiTfQX34+RcTy3LbRgQeRdQ3iP1vr2hCnkI4YMXEnUHQEJ/GqFHEukyTFOGllJJ
	 a/+f61arhBAsg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: nxp/imx6: Drop unused .dtsi
Date: Fri, 12 Dec 2025 14:32:11 -0600
Message-ID: <20251212203226.458694-5-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These .dtsi files are not included anywhere in the tree and can't be
tested.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../dts/nxp/imx/imx6dl-kontron-samx6i.dtsi    | 12 -----
 .../dts/nxp/imx/imx6q-kontron-samx6i.dtsi     | 12 -----
 .../boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi  | 45 ----------------
 .../boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi  | 54 -------------------
 4 files changed, 123 deletions(-)
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
deleted file mode 100644
index 5a9b819d7ee8..000000000000
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR X11
-/*
- * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
- */
-
-#include "imx6dl.dtsi"
-#include "imx6qdl-kontron-samx6i.dtsi"
-
-/ {
-	model = "Kontron SMARC-sAMX6i Dual-Lite/Solo";
-	compatible = "kontron,imx6dl-samx6i", "fsl,imx6dl";
-};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
deleted file mode 100644
index e76963436079..000000000000
--- a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR X11
-/*
- * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
- */
-
-#include "imx6q.dtsi"
-#include "imx6qdl-kontron-samx6i.dtsi"
-
-/ {
-	model = "Kontron SMARC-sAMX6i Quad/Dual";
-	compatible = "kontron,imx6q-samx6i", "fsl,imx6q";
-};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
deleted file mode 100644
index 3a968782e854..000000000000
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
+++ /dev/null
@@ -1,45 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR MIT
-//
-// Copyright 2017 NXP
-
-#include "imx6qdl-pico.dtsi"
-
-/ {
-	leds {
-		compatible = "gpio-leds";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_leds>;
-
-		led {
-			label = "gpio-led";
-			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
-		};
-	};
-
-};
-
-&i2c1 {
-	mpl3115@60 {
-		compatible = "fsl,mpl3115";
-		reg = <0x60>;
-	};
-};
-
-&i2c2 {
-	io-expander@25 {
-		compatible = "nxp,pca9554";
-		reg = <0x25>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		#interrupt-cells = <2>;
-	};
-
-};
-
-&iomuxc {
-	pinctrl_gpio_leds: gpioledsgrp {
-		fsl,pins = <
-			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x1b0b0
-		>;
-	};
-};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
deleted file mode 100644
index 3d56a4216448..000000000000
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
+++ /dev/null
@@ -1,54 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR MIT
-
-#include "imx6qdl-pico.dtsi"
-
-/ {
-	leds {
-		compatible = "gpio-leds";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_leds>;
-
-		led {
-			label = "gpio-led";
-			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
-		};
-	};
-
-};
-
-&i2c1 {
-	adc@52 {
-		compatible = "ti,adc081c";
-		reg = <0x52>;
-		vref-supply = <&reg_2p5v>;
-	};
-};
-
-&i2c2 {
-	io-expander@25 {
-		compatible = "nxp,pca9554";
-		reg = <0x25>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		#interrupt-cells = <2>;
-	};
-};
-
-&i2c3 {
-	rtc@68 {
-		compatible = "dallas,ds1337";
-		reg = <0x68>;
-	};
-};
-
-&pcie {
-	status = "okay";
-};
-
-&iomuxc {
-	pinctrl_gpio_leds: gpioledsgrp {
-		fsl,pins = <
-			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x1b0b0
-		>;
-	};
-};
-- 
2.51.0


