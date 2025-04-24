Return-Path: <linux-renesas-soc+bounces-16299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDB3A9A4FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 09:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0E2C7A5965
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 07:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F621F4E57;
	Thu, 24 Apr 2025 07:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="dhzlwWg5";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="G7Hy00Vk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CB21F4624;
	Thu, 24 Apr 2025 07:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745481352; cv=none; b=R3DXg3gMNIghzn8IFHFpkxohV0kKzXBCcEkeylgYdKCmnQWrLwwIsx0nrDtrMgJY0nDZJMy6jyTe6Kw0yKf/wyAmM6HhyJJdzcdqpIneVJSrfFlCaofk9dtghyi6pfEKWIdFYTNVi6enhO2zAnETT83YisaOMw50IwzC/u4R3IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745481352; c=relaxed/simple;
	bh=dpLKI9p7/oIGPNR0EYq+dCsXEdQxqYPubwc5XqZfyCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s1IR7GqZN5umiVoNrUN/xBOzm6CEi6C/UTQaWoshxtp+8FPP1upu7UYJ34JWLQuwYuQs/X7CKDMX5Zzhxiw/MG0RxTghNH1G4q3zXzUXLHdCqPUE+IWZeX+4IL7p6Y0hZoKXcHqDgIwRtlffiEUQkDNQGN7bXgOX08YbrQfQBSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=dhzlwWg5; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=G7Hy00Vk reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745481349; x=1777017349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XWYzP8owziaI0ZGwDlBa3biD69v8Qx0wNVYY5TCuAWs=;
  b=dhzlwWg5NuP0kbXqlS4qL2invTZOgESbMOWzeLo4QtagmkpTo8q95OJe
   a0ufciW7DL93Cusf18FYtPSWrZY2og2BWsJrl3B2j0m4auTTJCbCMcpgT
   3ihsicFstRVQmAhlVAjQvU9olP1vHw0m+7nZFIIgndlttaettAU+QPmMM
   oHkMNSTO4AxY6JXcdeB9nM+Fnz/7DRDYDIIUwJPpua08lwC6NcCsHwZAk
   4nOEN1XYK8ASkIHMFoZJ8ogCB9++HDSLy/COjsGINKIg6jOyWaYlDBTRy
   Y7QFmSpNcaiO54kIb35+81ikIlSqIPD67e5aON3/SxntNzvjkqUj26aUY
   Q==;
X-CSE-ConnectionGUID: UmiRSI6CTAmkt9o3SSV1iA==
X-CSE-MsgGUID: 6XxeoeLTRdKaMKTkXxjZmQ==
X-IronPort-AV: E=Sophos;i="6.15,235,1739833200"; 
   d="scan'208";a="43691660"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Apr 2025 09:55:48 +0200
X-CheckPoint: {6809EE84-5-B1D34AC3-DEA5B19F}
X-MAIL-CPID: F6FBD4BF527F62A92039E2FC2ECE3E44_4
X-Control-Analysis: str=0001.0A006370.6809EE94.000C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64696166D22;
	Thu, 24 Apr 2025 09:55:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745481343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWYzP8owziaI0ZGwDlBa3biD69v8Qx0wNVYY5TCuAWs=;
	b=G7Hy00VknPiTnvPEXK2y71GrXPeThcCFG8vlyK6k67xPRNlfQBP1sHmfpScC9gBWFBnjBG
	ZMK9hTbRHA7lnmkZehaozPOohHH0IbOzCr335Bqa0osn3oks5Sto1XyVAWspxK/VhDKuLP
	C3wchkFf+Ac7vWtL5JYWnXMwlY1rwc3do1pRAV3zZgg6tbVbYgOmDuZ6lWHi3IoGysL3ir
	mP9JebaGKKFtGc3c4EcAQGq9WD0aELlL3AS94re5hfZd+v+dnBvS16fRVuHi0hgYy+u06h
	2SbTWJeon5XZ+kPfN0gmrbjs2N87n2oPprsyBLXlAotHgWT66Vwqamby57rYwg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: freescale: add initial device tree for TQMa8XxS
Date: Thu, 24 Apr 2025 09:55:30 +0200
Message-ID: <20250424075533.1266435-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424075533.1266435-1-alexander.stein@ew.tq-group.com>
References: <20250424075533.1266435-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This adds support for TQMa8XQPS and TQMa8XDPS modules on MB-SMARC-2 board.
As the only difference is the mounted SoC, both module and baseboard
files are shared.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Changed Ethernet PHY interrupt type to level-low

 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../imx8dxp-tqma8xdps-mb-smarc-2.dts          |  16 +
 .../boot/dts/freescale/imx8dxp-tqma8xdps.dtsi |  24 +
 .../imx8qxp-tqma8xqps-mb-smarc-2.dts          |  16 +
 .../boot/dts/freescale/imx8qxp-tqma8xqps.dtsi |  14 +
 .../dts/freescale/tqma8xxs-mb-smarc-2.dtsi    | 194 +++++
 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi   | 768 ++++++++++++++++++
 8 files changed, 1035 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index b2c3be5f61314..4919e63c69a49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24733,6 +24733,7 @@ F:	arch/arm64/boot/dts/freescale/fsl-*tqml*.dts*
 F:	arch/arm64/boot/dts/freescale/imx*mba*.dts*
 F:	arch/arm64/boot/dts/freescale/imx*tqma*.dts*
 F:	arch/arm64/boot/dts/freescale/mba*.dtsi
+F:	arch/arm64/boot/dts/freescale/tqma8*.dtsi
 F:	arch/arm64/boot/dts/freescale/tqml*.dts*
 F:	drivers/gpio/gpio-tqmx86.c
 F:	drivers/mfd/tqmx86.c
diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f55b9d6a470de..72be1287bb906 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -105,6 +105,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-iris-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-iris.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxl-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-ddr4-evk.dtb
@@ -294,6 +295,7 @@ imx8qxp-mek-pcie-ep-dtbs += imx8qxp-mek.dtb imx8qxp-mek-pcie-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dts
new file mode 100644
index 0000000000000..331787df2fe47
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2021-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+
+#include "imx8dxp-tqma8xdps.dtsi"
+#include "tqma8xxs-mb-smarc-2.dtsi"
+
+/ {
+	model = "TQ-Systems i.MX8DXP TQMa8XDPS on MB-SMARC-2";
+	compatible = "tq,imx8dxp-tqma8xdps-mb-smarc-2", "tq,imx8dxp-tqma8xdps", "fsl,imx8dxp";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps.dtsi b/arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps.dtsi
new file mode 100644
index 0000000000000..a97286fe7e0d7
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps.dtsi
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2021-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#include "imx8dxp.dtsi"
+#include "tqma8xxs.dtsi"
+
+/ {
+	model = "TQ-Systems i.MX8DXP TQMa8XDPS";
+	compatible = "tq,imx8dxp-tqma8xdps", "fsl,imx8dxp";
+};
+
+&pmic0_thermal {
+	cooling-maps {
+		map0 {
+			cooling-device =
+				<&A35_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&A35_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dts
new file mode 100644
index 0000000000000..3fa9b5aee2c38
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+
+#include "imx8qxp-tqma8xqps.dtsi"
+#include "tqma8xxs-mb-smarc-2.dtsi"
+
+/ {
+	model = "TQ-Systems i.MX8QXP TQMa8XQPS on MB-SMARC-2";
+	compatible = "tq,imx8qxp-tqma8xqps-mb-smarc-2", "tq,imx8qxp-tqma8xqps", "fsl,imx8qxp";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps.dtsi
new file mode 100644
index 0000000000000..f008b7a345058
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#include "imx8qxp.dtsi"
+#include "tqma8xxs.dtsi"
+
+/ {
+	model = "TQ-Systems i.MX8QXP TQMa8XQPS";
+	compatible = "tq,imx8qxp-tqma8xqps", "fsl,imx8qxp";
+};
diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
new file mode 100644
index 0000000000000..478cc8ede05ef
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+/ {
+	aliases {
+		rtc0 = &rtc1;
+		rtc1 = &rtc;
+	};
+
+	backlight_lvds0: backlight-lvds0 {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_backlight_lvds0>;
+		/* PWM support still missing */
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <7>;
+		power-supply = <&reg_12v0>;
+		enable-gpios = <&lsio_gpio1 2 GPIO_ACTIVE_HIGH>;
+		status = "disabled";
+	};
+
+	backlight_lvds1: backlight-lvds1 {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_backlight_lvds1>;
+		/* PWM support still missing */
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <7>;
+		power-supply = <&reg_12v0>;
+		enable-gpios = <&lsio_gpio1 0 GPIO_ACTIVE_HIGH>;
+		status = "disabled";
+	};
+
+	chosen {
+		stdout-path = &lpuart0;
+	};
+
+	panel_lvds0: panel-lvds0 {
+		/*
+		 * Display is not fixed, so compatible has to be added from
+		 * DT
+		 */
+		backlight = <&backlight_lvds0>;
+		power-supply = <&reg_lvds0>;
+		status = "disabled";
+
+		port {
+			panel_in_lvds0: endpoint {
+			};
+		};
+	};
+
+	panel_lvds1: panel-lvds1 {
+		/*
+		 * Display is not fixed, so compatible has to be added from
+		 * DT
+		 */
+		backlight = <&backlight_lvds1>;
+		power-supply = <&reg_lvds1>;
+		status = "disabled";
+
+		port {
+			panel_in_lvds1: endpoint {
+			};
+		};
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_12v0: regulator-12v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "12V0";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+	};
+
+	sound {
+		compatible = "fsl,imx-audio-tlv320aic32x4";
+		model = "tqm-tlv320aic32";
+		ssi-controller = <&sai1>;
+		audio-codec = <&tlv320aic3x04>;
+	};
+};
+
+&fec1 {
+	status = "okay";
+};
+
+&fec2 {
+	status = "okay";
+};
+
+&flexcan2 {
+	xceiver-supply = <&reg_3v3>;
+	status = "okay";
+};
+
+&flexcan3 {
+	xceiver-supply = <&reg_3v3>;
+	status = "okay";
+};
+
+&i2c0 {
+	tlv320aic3x04: audio-codec@18 {
+		compatible = "ti,tlv320aic32x4";
+		reg = <0x18>;
+		clocks = <&mclkout0_lpcg 0>;
+		clock-names = "mclk";
+		iov-supply = <&reg_1v8>;
+		ldoin-supply = <&reg_3v3>;
+	};
+
+	eeprom2: eeprom@57 {
+		compatible = "atmel,24c32";
+		reg = <0x57>;
+		pagesize = <32>;
+		vcc-supply = <&reg_3v3>;
+	};
+};
+
+&lpspi1 {
+	status = "okay";
+};
+
+&lpuart0 {
+	status = "okay";
+};
+
+&lpuart3 {
+	status = "okay";
+};
+
+&reg_sdvmmc {
+	off-on-delay-us = <200000>;
+	status = "okay";
+};
+
+&usbotg1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usbotg1>;
+	srp-disable;
+	hnp-disable;
+	adp-disable;
+	power-active-high;
+	over-current-active-low;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbotg3 {
+	status = "okay";
+};
+
+&usbotg3_cdns3 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb3_phy {
+	status = "okay";
+};
+
+&usbphy1 {
+	status = "okay";
+};
+
+&usdhc2 {
+	cd-gpios = <&lsio_gpio4 22 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&lsio_gpio4 21 GPIO_ACTIVE_HIGH>;
+	vmmc-supply = <&reg_sdvmmc>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
new file mode 100644
index 0000000000000..2d0a329c2fa50
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
@@ -0,0 +1,768 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#include <dt-bindings/net/ti-dp83867.h>
+
+/delete-node/ &encoder_rpc;
+
+/ {
+	memory@80000000 {
+		device_type = "memory";
+		/*
+		 * DRAM base addr, minimal size : 1024 MiB DRAM
+		 * should be corrected by bootloader
+		 */
+		reg = <0x00000000 0x80000000 0 0x40000000>;
+	};
+
+	clk_xtal25: clk-xtal25 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+
+	reg_tqma8xxs_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_lvds0: regulator-lvds0 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds0>;
+		regulator-name = "LCD0_VDD_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&lsio_gpio1 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_lvds1: regulator-lvds1 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds1>;
+		regulator-name = "LCD1_VDD_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&lsio_gpio1 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_sdvmmc: regulator-sdvmmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sdvmmc>;
+		regulator-name = "SD1_VMMC";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&lsio_gpio4 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		status = "disabled";
+	};
+
+	reg_vmmc: regulator-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "MMC0_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_vqmmc: regulator-vqmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "MMC0_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * global autoconfigured region for contiguous allocations
+		 * must not exceed memory size and region
+		 */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0 0x20000000>;
+			alloc-ranges = <0 0x96000000 0 0x30000000>;
+			linux,cma-default;
+		};
+
+		decoder_boot: decoder-boot@84000000 {
+			reg = <0 0x84000000 0 0x2000000>;
+			no-map;
+		};
+
+		encoder_boot: encoder-boot@86000000 {
+			reg = <0 0x86000000 0 0x200000>;
+			no-map;
+		};
+
+		m4_reserved: m4@88000000 {
+			no-map;
+			reg = <0 0x88000000 0 0x8000000>;
+			status = "disabled";
+		};
+
+		vdev0vring0: vdev0vring0@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x8000>;
+			no-map;
+			status = "disabled";
+		};
+
+		vdev0vring1: vdev0vring1@90008000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90008000 0 0x8000>;
+			no-map;
+			status = "disabled";
+		};
+
+		vdev1vring0: vdev1vring0@90010000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90010000 0 0x8000>;
+			no-map;
+			status = "disabled";
+		};
+
+		vdev1vring1: vdev1vring1@90018000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90018000 0 0x8000>;
+			no-map;
+			status = "disabled";
+		};
+
+		rsc_table: rsc-table@900ff000 {
+			reg = <0 0x900ff000 0 0x1000>;
+			no-map;
+			status = "disabled";
+		};
+
+		vdevbuffer: vdevbuffer@90400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90400000 0 0x100000>;
+			no-map;
+			status = "disabled";
+		};
+
+		decoder_rpc: decoder-rpc@92000000 {
+			reg = <0 0x92000000 0 0x100000>;
+			no-map;
+		};
+
+		encoder_rpc: encoder-rpc@92100000 {
+			reg = <0 0x92100000 0 0x700000>;
+			no-map;
+		};
+	};
+
+};
+
+/* TQMa8XxS only uses industrial grade, reduce trip points accordingly */
+&cpu_alert0 {
+	temperature = <95000>;
+};
+
+&cpu_crit0 {
+	temperature = <100000>;
+};
+/* end of temperature grade adjustments */
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec1>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy0>;
+	fsl,magic-packet;
+	mac-address = [ 00 00 00 00 00 00 ];
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_ethphy0>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,dp83867-rxctrl-strap-quirk;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+			reset-gpios = <&lsio_gpio3 22 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <500000>;
+			reset-deassert-us = <50000>;
+			enet-phy-lane-no-swap;
+			interrupt-parent = <&lsio_gpio1>;
+			interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
+		};
+
+		ethphy3: ethernet-phy@3 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_ethphy1>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,dp83867-rxctrl-strap-quirk;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+			reset-gpios = <&lsio_gpio0 24 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <500000>;
+			reset-deassert-us = <50000>;
+			enet-phy-lane-no-swap;
+			interrupt-parent = <&lsio_gpio1>;
+			interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
+&fec2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec2>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy3>;
+	fsl,magic-packet;
+	mac-address = [ 00 00 00 00 00 00 ];
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can1>;
+};
+
+&flexcan3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can2>;
+};
+
+&flexspi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexspi0>;
+	status = "okay";
+
+	flash0: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <66000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
+};
+
+&lsio_gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_smarc_fangpio>, <&pinctrl_smarc_mngtpio>;
+
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "LID", "SLEEP", "CHARGING#", "CHGPRSNT#",
+			  "BATLOW#", "", "", "",
+			  "", "SMARC_GPIO6", "SMARC_GPIO5", "",
+			  "PHY3 RST#", "", "", "SPI0_CS0",
+			  "", "SPI0_CS1", "", "";
+};
+
+&lsio_gpio1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_smarc_gpio>;
+
+	gpio-line-names = "LCD1_BLKT_EN", "LCD1_VDD_EN", "LCD0_BLKT_EN", "LCD0_VDD_EN",
+			  "SMARC_GPIO0", "SMARC_GPIO1", "SMARC_GPIO2", "",
+			  "SMARC_GPIO3", "SMARC_GPIO8", "SMARC_GPIO7", "SMARC_GPIO10",
+			  "SMARC_GPIO9", "SMARC_GPIO4", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&lsio_gpio2 {
+	gpio-line-names = "RTC_INT#", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&lsio_gpio3 {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "PHY0_RST#", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&lsio_gpio4 {
+	gpio-line-names = "PCIE_PERST#", "", "PCIE_WAKE#", "USB_OTG1_PWR",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "SDIO_PWR_EN",
+			  "", "SDIO_WP", "SDIO_CD#", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&i2c0 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_lpi2c0>;
+	pinctrl-1 = <&pinctrl_lpi2c0_gpio>;
+	scl-gpios = <&lsio_gpio3 8 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&lsio_gpio3 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	/* NXP SE97BTP with temperature sensor + eeprom */
+	sensor0: temperature-sensor@1b {
+		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
+		reg = <0x1b>;
+	};
+
+	eeprom0: eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+		vcc-supply = <&reg_tqma8xxs_3v3>;
+	};
+
+	rtc1: rtc@51 {
+		compatible = "nxp,pcf85063a";
+		reg = <0x51>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		quartz-load-femtofarads = <7000>;
+		interrupt-parent = <&lsio_gpio2>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	eeprom1: eeprom@53 {
+		compatible = "nxp,se97b", "atmel,24c02";
+		reg = <0x53>;
+		pagesize = <16>;
+		read-only;
+		vcc-supply = <&reg_tqma8xxs_3v3>;
+	};
+
+	pcieclk: clock-generator@6a {
+		compatible = "renesas,9fgv0241";
+		reg = <0x6a>;
+		clocks = <&clk_xtal25>;
+		#clock-cells = <1>;
+	};
+};
+
+&lpspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1>;
+	cs-gpios = <&lsio_gpio0 27 GPIO_ACTIVE_LOW>, <&lsio_gpio0 29 GPIO_ACTIVE_LOW>;
+};
+
+&lpuart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart0>;
+};
+
+&lpuart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart3>;
+};
+
+&mu_m0 {
+	status = "okay";
+};
+
+&mu1_m0 {
+	status = "okay";
+};
+
+&sai1 {
+	assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+			  <&sai1_lpcg 0>;
+	assigned-clock-rates = <786432000>, <49152000>, <12288000>, <49152000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai1>;
+	status = "okay";
+};
+
+&thermal_zones {
+	pmic0_thermal: pmic0-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <2000>;
+		thermal-sensors = <&tsens IMX_SC_R_PMIC_0>;
+
+		trips {
+			pmic_alert0: trip0 {
+				temperature = <110000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
+			pmic_crit0: trip1 {
+				temperature = <125000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+
+		cooling-maps {
+			map0 {
+				trip = <&pmic_alert0>;
+				cooling-device =
+					<&A35_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A35_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A35_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A35_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	vmmc-supply = <&reg_vmmc>;
+	vqmmc-supply = <&reg_vqmmc>;
+	bus-width = <8>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	bus-width = <4>;
+	/* NOTE: CD / WP and VMMC support depends on mainboard */
+};
+
+&vpu {
+	compatible = "nxp,imx8qxp-vpu";
+	status = "okay";
+};
+
+&vpu_core0 {
+	memory-region = <&decoder_boot>, <&decoder_rpc>;
+	status = "okay";
+};
+
+&vpu_core1 {
+	memory-region = <&encoder_boot>, <&encoder_rpc>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_backlight_lvds0: backlight-lvds0grp {
+		fsl,pins = <IMX8QXP_SPI2_SDI_LSIO_GPIO1_IO02	0x00000021>;
+	};
+
+	pinctrl_backlight_lvds1: backlight-lvds1grp {
+		fsl,pins = <IMX8QXP_SPI2_CS0_LSIO_GPIO1_IO00	0x00000021>;
+	};
+
+	pinctrl_can1: can1grp {
+		fsl,pins = <IMX8QXP_UART2_TX_ADMA_FLEXCAN1_TX	0x00000021>,
+			   <IMX8QXP_UART2_RX_ADMA_FLEXCAN1_RX	0x00000021>;
+	};
+
+	pinctrl_can2: can2grp {
+		fsl,pins = <IMX8QXP_FLEXCAN2_TX_ADMA_FLEXCAN2_TX	0x00000021>,
+			   <IMX8QXP_FLEXCAN2_RX_ADMA_FLEXCAN2_RX	0x00000021>;
+	};
+
+	pinctrl_ethphy0: ethphy0grp {
+		fsl,pins = <IMX8QXP_MIPI_DSI1_I2C0_SDA_LSIO_GPIO1_IO30	0x00000040>,
+			   <IMX8QXP_QSPI0B_DQS_LSIO_GPIO3_IO22		0x00000040>;
+	};
+
+	pinctrl_ethphy1: ethphy1grp {
+		fsl,pins = <IMX8QXP_ADC_IN4_LSIO_GPIO1_IO14		0x00000040>,
+			   <IMX8QXP_UART1_CTS_B_LSIO_GPIO0_IO24		0x00000040>;
+	};
+
+	pinctrl_fec1: fec1grp {
+		fsl,pins = <IMX8QXP_ENET0_MDC_CONN_ENET0_MDC			0x06000041>,
+			   <IMX8QXP_ENET0_MDIO_CONN_ENET0_MDIO			0x06000041>,
+			   <IMX8QXP_ENET0_RGMII_TX_CTL_CONN_ENET0_RGMII_TX_CTL	0x00000040>,
+			   <IMX8QXP_ENET0_RGMII_TXC_CONN_ENET0_RGMII_TXC	0x00000040>,
+			   <IMX8QXP_ENET0_RGMII_TXD0_CONN_ENET0_RGMII_TXD0	0x00000040>,
+			   <IMX8QXP_ENET0_RGMII_TXD1_CONN_ENET0_RGMII_TXD1	0x00000040>,
+			   <IMX8QXP_ENET0_RGMII_TXD2_CONN_ENET0_RGMII_TXD2	0x00000040>,
+			   <IMX8QXP_ENET0_RGMII_TXD3_CONN_ENET0_RGMII_TXD3	0x00000040>,
+			   <IMX8QXP_ENET0_RGMII_RXC_CONN_ENET0_RGMII_RXC	0x00000040>,
+			   <IMX8QXP_ENET0_RGMII_RX_CTL_CONN_ENET0_RGMII_RX_CTL	0x00000040>,
+			   <IMX8QXP_ENET0_RGMII_RXD0_CONN_ENET0_RGMII_RXD0	0x00000040>,
+			   <IMX8QXP_ENET0_RGMII_RXD1_CONN_ENET0_RGMII_RXD1	0x00000040>,
+			   <IMX8QXP_ENET0_RGMII_RXD2_CONN_ENET0_RGMII_RXD2	0x00000040>,
+			   <IMX8QXP_ENET0_RGMII_RXD3_CONN_ENET0_RGMII_RXD3	0x00000040>;
+	};
+
+	pinctrl_fec2: fec2grp {
+		fsl,pins = <IMX8QXP_ESAI0_SCKR_CONN_ENET1_RGMII_TX_CTL		0x00000040>,
+			   <IMX8QXP_ESAI0_FSR_CONN_ENET1_RGMII_TXC		0x00000040>,
+			   <IMX8QXP_ESAI0_TX4_RX1_CONN_ENET1_RGMII_TXD0		0x00000040>,
+			   <IMX8QXP_ESAI0_TX5_RX0_CONN_ENET1_RGMII_TXD1		0x00000040>,
+			   <IMX8QXP_ESAI0_FST_CONN_ENET1_RGMII_TXD2		0x00000040>,
+			   <IMX8QXP_ESAI0_SCKT_CONN_ENET1_RGMII_TXD3		0x00000040>,
+			   <IMX8QXP_ESAI0_TX0_CONN_ENET1_RGMII_RXC		0x00000040>,
+			   <IMX8QXP_SPDIF0_TX_CONN_ENET1_RGMII_RX_CTL		0x00000040>,
+			   <IMX8QXP_SPDIF0_RX_CONN_ENET1_RGMII_RXD0		0x00000040>,
+			   <IMX8QXP_ESAI0_TX3_RX2_CONN_ENET1_RGMII_RXD1		0x00000040>,
+			   <IMX8QXP_ESAI0_TX2_RX3_CONN_ENET1_RGMII_RXD2		0x00000040>,
+			   <IMX8QXP_ESAI0_TX1_CONN_ENET1_RGMII_RXD3		0x00000040>;
+	};
+
+	pinctrl_flexspi0: flexspi0grp {
+		fsl,pins = <IMX8QXP_QSPI0A_DATA0_LSIO_QSPI0A_DATA0	0x0000004d>,
+			   <IMX8QXP_QSPI0A_DATA1_LSIO_QSPI0A_DATA1	0x0000004d>,
+			   <IMX8QXP_QSPI0A_DATA2_LSIO_QSPI0A_DATA2	0x0000004d>,
+			   <IMX8QXP_QSPI0A_DATA3_LSIO_QSPI0A_DATA3	0x0000004d>,
+			   <IMX8QXP_QSPI0A_DQS_LSIO_QSPI0A_DQS		0x0000004d>,
+			   <IMX8QXP_QSPI0A_SS0_B_LSIO_QSPI0A_SS0_B	0x0000004d>,
+			   <IMX8QXP_QSPI0A_SCLK_LSIO_QSPI0A_SCLK	0x0000004d>,
+			   <IMX8QXP_QSPI0B_SCLK_LSIO_QSPI0B_SCLK	0x0000004d>,
+			   <IMX8QXP_QSPI0B_DATA0_LSIO_QSPI0B_DATA0	0x0000004d>,
+			   <IMX8QXP_QSPI0B_DATA1_LSIO_QSPI0B_DATA1	0x0000004d>,
+			   <IMX8QXP_QSPI0B_DATA2_LSIO_QSPI0B_DATA2	0x0000004d>,
+			   <IMX8QXP_QSPI0B_DATA3_LSIO_QSPI0B_DATA3	0x0000004d>,
+			   <IMX8QXP_QSPI0B_SS0_B_LSIO_QSPI0B_SS0_B	0x0000004d>,
+			   <IMX8QXP_QSPI0B_SS1_B_LSIO_QSPI0B_SS1_B	0x0000004d>;
+	};
+
+	pinctrl_smarc_gpio: smarcgpiogrp {
+		fsl,pins = /* SMARC_GPIO0 / CAM0_PWR# */
+			   <IMX8QXP_SPI0_SCK_LSIO_GPIO1_IO04	0x00000021>,
+			   /* SMARC_GPIO1 / CAM1_PWR# */
+			   <IMX8QXP_SPI0_SDI_LSIO_GPIO1_IO05	0x00000021>,
+			   /* SMARC_GPIO2 / CAM0_RST# */
+			   <IMX8QXP_SPI0_SDO_LSIO_GPIO1_IO06	0x00000021>,
+			   /* SMARC_GPIO3 / CAM1_RST# */
+			   <IMX8QXP_SPI0_CS0_LSIO_GPIO1_IO08	0x00000021>,
+			   /* SMARC_GPIO4 / HDA_RST# */
+			   <IMX8QXP_ADC_IN5_LSIO_GPIO1_IO13	0x00000021>,
+			   /* SMARC_GPIO7 */
+			   <IMX8QXP_ADC_IN0_LSIO_GPIO1_IO10	0x00000021>,
+			   /* SMARC_GPIO8 */
+			   <IMX8QXP_ADC_IN1_LSIO_GPIO1_IO09	0x00000021>,
+			   /* SMARC_GPIO9 */
+			   <IMX8QXP_ADC_IN2_LSIO_GPIO1_IO12	0x00000021>,
+			   /* SMARC_GPIO10 */
+			   <IMX8QXP_ADC_IN3_LSIO_GPIO1_IO11	0x00000021>;
+	};
+
+	pinctrl_smarc_fangpio: smarcfangpiogrp {
+		fsl,pins = /* SMARC_GPIO5 */
+			   <IMX8QXP_UART1_RX_LSIO_GPIO0_IO22	0x00000021>,
+			   /* SMARC_GPIO6 */
+			   <IMX8QXP_UART1_TX_LSIO_GPIO0_IO21	0x00000021>;
+	};
+
+	pinctrl_smarc_mngtpio: smarcmngtgpiogrp {
+		fsl,pins = /* SMARC BATLOW# */
+			   <IMX8QXP_SPI3_CS0_LSIO_GPIO0_IO16		0x00000021>,
+			   /* SMARC SLEEP */
+			   <IMX8QXP_SPI3_SCK_LSIO_GPIO0_IO13		0x00000021>,
+			   /* SMARC CHGPRSNT# */
+			   <IMX8QXP_SPI3_SDI_LSIO_GPIO0_IO15		0x00000021>,
+			   /* SMARC CHARGING# */
+			   <IMX8QXP_SPI3_SDO_LSIO_GPIO0_IO14		0x00000021>,
+			   /* SMARC LID */
+			   <IMX8QXP_SPDIF0_EXT_CLK_LSIO_GPIO0_IO12	0x00000021>;
+	};
+
+	pinctrl_lvds0: lbdpanel0grp {
+		fsl,pins = /* LCD PWR */
+			<IMX8QXP_SPI2_SCK_LSIO_GPIO1_IO03		0x00000021>;
+	};
+
+	pinctrl_lvds1: lbdpanel1grp {
+		fsl,pins = /* LCD PWR */
+			<IMX8QXP_SPI2_SDO_LSIO_GPIO1_IO01		0x00000021>;
+	};
+
+	pinctrl_lpi2c0: lpi2c0grp {
+		fsl,pins = <IMX8QXP_MIPI_CSI0_GPIO0_00_ADMA_I2C0_SCL	0x06000021>,
+			   <IMX8QXP_MIPI_CSI0_GPIO0_01_ADMA_I2C0_SDA	0x06000021>;
+	};
+
+	pinctrl_lpi2c0_gpio: lpi2c0gpiogrp {
+		fsl,pins = <IMX8QXP_MIPI_CSI0_GPIO0_00_LSIO_GPIO3_IO08	0x00000021>,
+			   <IMX8QXP_MIPI_CSI0_GPIO0_01_LSIO_GPIO3_IO07	0x00000021>;
+	};
+
+	pinctrl_lpuart0: lpuart0grp {
+		fsl,pins = <IMX8QXP_UART0_RX_ADMA_UART0_RX		0x06000020>,
+			   <IMX8QXP_UART0_TX_ADMA_UART0_TX		0x06000020>,
+			   <IMX8QXP_FLEXCAN0_RX_ADMA_UART0_RTS_B	0x06000020>,
+			   <IMX8QXP_FLEXCAN0_TX_ADMA_UART0_CTS_B	0x06000020>;
+	};
+
+	pinctrl_lpuart3: lpuart3grp {
+		fsl,pins = <IMX8QXP_SCU_GPIO0_00_ADMA_UART3_RX		0x06000020>,
+			   <IMX8QXP_SCU_GPIO0_01_ADMA_UART3_TX		0x06000020>;
+	};
+
+	pinctrl_i2c0_mipi_lvds0: mipi-lvds0-i2c0grp {
+		fsl,pins = <IMX8QXP_MIPI_DSI0_I2C0_SCL_MIPI_DSI0_I2C0_SCL	0x06000021>,
+			   <IMX8QXP_MIPI_DSI0_I2C0_SDA_MIPI_DSI0_I2C0_SDA	0x06000021>;
+	};
+
+	pinctrl_i2c0_gpio_mipi_lvds0: mipi-lvds0-i2c0-gpiogrp {
+		fsl,pins = <IMX8QXP_MIPI_DSI0_I2C0_SCL_LSIO_GPIO1_IO25	0x0000021>,
+			   <IMX8QXP_MIPI_DSI0_I2C0_SDA_LSIO_GPIO1_IO26	0x0000021>;
+	};
+
+	pinctrl_pcieb: pcieagrp {
+		fsl,pins = <IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00	0x06000041>,
+			   <IMX8QXP_PCIE_CTRL0_CLKREQ_B_LSIO_GPIO4_IO01	0x06000041>,
+			   <IMX8QXP_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO02	0x04000041>;
+	};
+
+	pinctrl_pwm_mipi_lvds0: mipi-lvds0-pwmgrp {
+		fsl,pins = <IMX8QXP_MIPI_DSI0_GPIO0_00_MIPI_DSI0_PWM0_OUT	0x00000021>;
+	};
+
+	pinctrl_pwm_mipi_lvds1: mipi-lvds1-pwmgrp {
+		fsl,pins = <IMX8QXP_MIPI_DSI1_GPIO0_00_MIPI_DSI1_PWM0_OUT	0x00000021>;
+	};
+
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <IMX8QXP_MIPI_DSI1_GPIO0_01_LSIO_GPIO2_IO00		0x00000021>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <IMX8QXP_EMMC0_CLK_CONN_EMMC0_CLK		0x06000040>,
+			   <IMX8QXP_EMMC0_CMD_CONN_EMMC0_CMD		0x00000020>,
+			   <IMX8QXP_EMMC0_DATA0_CONN_EMMC0_DATA0	0x00000020>,
+			   <IMX8QXP_EMMC0_DATA1_CONN_EMMC0_DATA1	0x00000020>,
+			   <IMX8QXP_EMMC0_DATA2_CONN_EMMC0_DATA2	0x00000020>,
+			   <IMX8QXP_EMMC0_DATA3_CONN_EMMC0_DATA3	0x00000020>,
+			   <IMX8QXP_EMMC0_DATA4_CONN_EMMC0_DATA4	0x00000020>,
+			   <IMX8QXP_EMMC0_DATA5_CONN_EMMC0_DATA5	0x00000020>,
+			   <IMX8QXP_EMMC0_DATA6_CONN_EMMC0_DATA6	0x00000020>,
+			   <IMX8QXP_EMMC0_DATA7_CONN_EMMC0_DATA7	0x00000020>,
+			   <IMX8QXP_EMMC0_STROBE_CONN_EMMC0_STROBE	0x00000040>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1100mhzgrp {
+		fsl,pins = <IMX8QXP_EMMC0_CLK_CONN_EMMC0_CLK		0x06000041>,
+			   <IMX8QXP_EMMC0_CMD_CONN_EMMC0_CMD		0x00000021>,
+			   <IMX8QXP_EMMC0_DATA0_CONN_EMMC0_DATA0	0x00000021>,
+			   <IMX8QXP_EMMC0_DATA1_CONN_EMMC0_DATA1	0x00000021>,
+			   <IMX8QXP_EMMC0_DATA2_CONN_EMMC0_DATA2	0x00000021>,
+			   <IMX8QXP_EMMC0_DATA3_CONN_EMMC0_DATA3	0x00000021>,
+			   <IMX8QXP_EMMC0_DATA4_CONN_EMMC0_DATA4	0x00000021>,
+			   <IMX8QXP_EMMC0_DATA5_CONN_EMMC0_DATA5	0x00000021>,
+			   <IMX8QXP_EMMC0_DATA6_CONN_EMMC0_DATA6	0x00000021>,
+			   <IMX8QXP_EMMC0_DATA7_CONN_EMMC0_DATA7	0x00000021>,
+			   <IMX8QXP_EMMC0_STROBE_CONN_EMMC0_STROBE	0x00000041>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1200mhzgrp {
+		fsl,pins = <IMX8QXP_EMMC0_CLK_CONN_EMMC0_CLK		0x06000041>,
+			   <IMX8QXP_EMMC0_CMD_CONN_EMMC0_CMD		0x00000021>,
+			   <IMX8QXP_EMMC0_DATA0_CONN_EMMC0_DATA0	0x00000021>,
+			   <IMX8QXP_EMMC0_DATA1_CONN_EMMC0_DATA1	0x00000021>,
+			   <IMX8QXP_EMMC0_DATA2_CONN_EMMC0_DATA2	0x00000021>,
+			   <IMX8QXP_EMMC0_DATA3_CONN_EMMC0_DATA3	0x00000021>,
+			   <IMX8QXP_EMMC0_DATA4_CONN_EMMC0_DATA4	0x00000021>,
+			   <IMX8QXP_EMMC0_DATA5_CONN_EMMC0_DATA5	0x00000021>,
+			   <IMX8QXP_EMMC0_DATA6_CONN_EMMC0_DATA6	0x00000021>,
+			   <IMX8QXP_EMMC0_DATA7_CONN_EMMC0_DATA7	0x00000021>,
+			   <IMX8QXP_EMMC0_STROBE_CONN_EMMC0_STROBE	0x00000041>;
+	};
+
+	pinctrl_sdvmmc: sdvmmcgrp {
+		fsl,pins = <IMX8QXP_USDHC1_RESET_B_LSIO_GPIO4_IO19	0x00000021>;
+	};
+
+	pinctrl_spi1: spi1grp {
+		fsl,pins = /* PD + PDRV Low + INOUT - MEK has 0x0600004c */
+			   <IMX8QXP_SAI0_TXC_ADMA_SPI1_SDI		0x06000041>,
+			   <IMX8QXP_SAI0_TXD_ADMA_SPI1_SDO		0x06000041>,
+			   <IMX8QXP_SAI0_TXFS_ADMA_SPI1_SCK		0x06000041>,
+			   <IMX8QXP_SAI0_RXD_LSIO_GPIO0_IO27		0x00000021>,
+			   <IMX8QXP_SAI1_RXD_LSIO_GPIO0_IO29		0x00000021>;
+	};
+
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <IMX8QXP_MCLK_OUT0_ADMA_ACM_MCLK_OUT0	0x06000040>,
+			   <IMX8QXP_SAI1_RXC_ADMA_SAI1_TXC		0x06000040>,
+			   <IMX8QXP_SAI1_RXFS_ADMA_SAI1_TXFS		0x06000040>,
+			   <IMX8QXP_FLEXCAN1_RX_ADMA_SAI1_TXD		0x06000040>,
+			   <IMX8QXP_FLEXCAN1_TX_ADMA_SAI1_RXD		0x06000040>;
+	};
+
+	pinctrl_usbotg1: usbotg1grp {
+		fsl,pins = <IMX8QXP_USB_SS3_TC0_CONN_USB_OTG1_PWR	0x00000021>,
+			   <IMX8QXP_USB_SS3_TC2_CONN_USB_OTG1_OC	0x00000021>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <IMX8QXP_USDHC1_WP_LSIO_GPIO4_IO21		0x00000021>,
+			   <IMX8QXP_USDHC1_CD_B_LSIO_GPIO4_IO22		0x00000021>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <IMX8QXP_USDHC1_CLK_CONN_USDHC1_CLK		0x06000041>,
+			   <IMX8QXP_USDHC1_CMD_CONN_USDHC1_CMD		0x00000021>,
+			   <IMX8QXP_USDHC1_DATA0_CONN_USDHC1_DATA0	0x00000021>,
+			   <IMX8QXP_USDHC1_DATA1_CONN_USDHC1_DATA1	0x00000021>,
+			   <IMX8QXP_USDHC1_DATA2_CONN_USDHC1_DATA2	0x00000021>,
+			   <IMX8QXP_USDHC1_DATA3_CONN_USDHC1_DATA3	0x00000021>,
+			   <IMX8QXP_USDHC1_VSELECT_CONN_USDHC1_VSELECT	0x00000021>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2100mhzgrp {
+		fsl,pins = <IMX8QXP_USDHC1_CLK_CONN_USDHC1_CLK		0x06000040>,
+			   <IMX8QXP_USDHC1_CMD_CONN_USDHC1_CMD		0x00000020>,
+			   <IMX8QXP_USDHC1_DATA0_CONN_USDHC1_DATA0	0x00000020>,
+			   <IMX8QXP_USDHC1_DATA1_CONN_USDHC1_DATA1	0x00000020>,
+			   <IMX8QXP_USDHC1_DATA2_CONN_USDHC1_DATA2	0x00000020>,
+			   <IMX8QXP_USDHC1_DATA3_CONN_USDHC1_DATA3	0x00000020>,
+			   <IMX8QXP_USDHC1_VSELECT_CONN_USDHC1_VSELECT	0x00000020>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2200mhzgrp {
+		fsl,pins = <IMX8QXP_USDHC1_CLK_CONN_USDHC1_CLK		0x06000040>,
+			   <IMX8QXP_USDHC1_CMD_CONN_USDHC1_CMD		0x00000020>,
+			   <IMX8QXP_USDHC1_DATA0_CONN_USDHC1_DATA0	0x00000020>,
+			   <IMX8QXP_USDHC1_DATA1_CONN_USDHC1_DATA1	0x00000020>,
+			   <IMX8QXP_USDHC1_DATA2_CONN_USDHC1_DATA2	0x00000020>,
+			   <IMX8QXP_USDHC1_DATA3_CONN_USDHC1_DATA3	0x00000020>,
+			   <IMX8QXP_USDHC1_VSELECT_CONN_USDHC1_VSELECT	0x00000020>;
+	};
+};
-- 
2.43.0


