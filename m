Return-Path: <linux-renesas-soc+bounces-17194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C904ABBD76
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 14:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8D3C3BCFD5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 12:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89EF01E25FA;
	Mon, 19 May 2025 12:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="T0bFF6ji"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C6A27586A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 12:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656932; cv=none; b=JiRQHXs7JsjwN4DUIl/iZdeQy0WT8rQaM1TbYC6IQyKUmyocNfLV+vTSlVF2sC3Xx5iwF9QE41FIrgKGBt5bIZXtXSoLB5iPKrgoDFcAN7YGJEPqSRSYRIu8765vKqEm59cngX6N4XnVK2obj2/VVUCt3R18sjXk89C15gsvQd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656932; c=relaxed/simple;
	bh=wiPBbGRGVihT1hcUNGXlalqJ/+zPJoVNEnWEVhl++P4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAAdt52bDJC3+7mYUE5gW4sIhZmXCJRZlJLkKxeySyy4CVKLGQrTOuwAnV+GnAvwWd9Hg2WkcfskZJylMFuM0h9Ju+DddSd1rOjEDzINFzwPE6Id+O9zGiLN1KgclR9nVhukTpqpuG5l4kHucA9vujpO5vXLT9XUtg3m6StuhZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=T0bFF6ji; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=WnzkvKUcONXW+3BbJltifVErcGXMo+QTrvkfcfs+jS0=; b=T0bFF6
	jiFV5ve05a0DWbWo460IBrldr9CgBmKMWv7Mxd7Tw1VrMAaW/+G3L3kQI0NvCiBr
	j+GBCJxj0aPeUk1/BAY28qNPtB/LlS6MhMOCQFA3WI2/rrr04YUblqTTgJbXkvVj
	KhFenq+ZQpl2qq+e6+C2QCLyb/qJ1Gy/awcIp5o+k4tVEptH2bQuUi1ZnrJRTKBy
	Rg2Rv+vy8iUKHusFN2FkTA3GgEsjV2WAGMOSZRXne8cAVKmATMLsXYQdWCcIw5q5
	5HRepr6KYw2lx7u9V8NHCnqTP5qZTFYcv8wngeDghN7DwQSIukOr/EuZVF/dXdTK
	QXx++PLfpYqdaUfA==
Received: (qmail 2475141 invoked from network); 19 May 2025 14:15:27 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 14:15:27 +0200
X-UD-Smtp-Session: l3s3148p1@6OxLFnw1ErBZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/7] ARM: dts: microchip: use proper node names for GPIO based I2C busses
Date: Mon, 19 May 2025 14:15:03 +0200
Message-ID: <20250519121512.5657-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There shall not be a '-' before the number.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/microchip/at91-foxg20.dts           | 2 +-
 arch/arm/boot/dts/microchip/at91-qil_a9260.dts        | 2 +-
 arch/arm/boot/dts/microchip/at91-sam9_l9260.dts       | 2 +-
 arch/arm/boot/dts/microchip/at91rm9200.dtsi           | 2 +-
 arch/arm/boot/dts/microchip/at91sam9260.dtsi          | 2 +-
 arch/arm/boot/dts/microchip/at91sam9260ek.dts         | 2 +-
 arch/arm/boot/dts/microchip/at91sam9261.dtsi          | 2 +-
 arch/arm/boot/dts/microchip/at91sam9263.dtsi          | 2 +-
 arch/arm/boot/dts/microchip/at91sam9263ek.dts         | 2 +-
 arch/arm/boot/dts/microchip/at91sam9g20ek_common.dtsi | 2 +-
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi          | 2 +-
 arch/arm/boot/dts/microchip/at91sam9n12.dtsi          | 2 +-
 arch/arm/boot/dts/microchip/at91sam9rl.dtsi           | 4 ++--
 arch/arm/boot/dts/microchip/at91sam9rlek.dts          | 4 ++--
 arch/arm/boot/dts/microchip/at91sam9x5.dtsi           | 6 +++---
 arch/arm/boot/dts/microchip/ethernut5.dts             | 2 +-
 arch/arm/boot/dts/microchip/evk-pro3.dts              | 2 +-
 arch/arm/boot/dts/microchip/mpa1600.dts               | 2 +-
 arch/arm/boot/dts/microchip/tny_a9263.dts             | 2 +-
 arch/arm/boot/dts/microchip/usb_a9260_common.dtsi     | 2 +-
 arch/arm/boot/dts/microchip/usb_a9263.dts             | 2 +-
 arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts         | 2 +-
 22 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91-foxg20.dts b/arch/arm/boot/dts/microchip/at91-foxg20.dts
index 8e9e87665045..6b9f6afc1c0c 100644
--- a/arch/arm/boot/dts/microchip/at91-foxg20.dts
+++ b/arch/arm/boot/dts/microchip/at91-foxg20.dts
@@ -137,7 +137,7 @@ usb0: usb@500000 {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c0>;
 		i2c-gpio,delay-us = <5>;	/* ~85 kHz */
diff --git a/arch/arm/boot/dts/microchip/at91-qil_a9260.dts b/arch/arm/boot/dts/microchip/at91-qil_a9260.dts
index 892dbd8dbbed..ae14e54cca8e 100644
--- a/arch/arm/boot/dts/microchip/at91-qil_a9260.dts
+++ b/arch/arm/boot/dts/microchip/at91-qil_a9260.dts
@@ -207,7 +207,7 @@ button-user {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/microchip/at91-sam9_l9260.dts b/arch/arm/boot/dts/microchip/at91-sam9_l9260.dts
index 49dc1a4ccb36..6fd4f5fbc0d4 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9_l9260.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9_l9260.dts
@@ -111,7 +111,7 @@ usb0: usb@500000 {
 
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/microchip/at91rm9200.dtsi b/arch/arm/boot/dts/microchip/at91rm9200.dtsi
index e105ad855ce8..e9f808182b6b 100644
--- a/arch/arm/boot/dts/microchip/at91rm9200.dtsi
+++ b/arch/arm/boot/dts/microchip/at91rm9200.dtsi
@@ -712,7 +712,7 @@ usb0: usb@300000 {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pioA 25 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&pioA 26 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/microchip/at91sam9260.dtsi b/arch/arm/boot/dts/microchip/at91sam9260.dtsi
index fc0b6a73204f..23ae36c2eef6 100644
--- a/arch/arm/boot/dts/microchip/at91sam9260.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9260.dtsi
@@ -779,7 +779,7 @@ nand_controller: nand-controller {
 		};
 	};
 
-	i2c_gpio0: i2c-gpio-0 {
+	i2c_gpio0: i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pioA 23 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&pioA 24 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/microchip/at91sam9260ek.dts b/arch/arm/boot/dts/microchip/at91sam9260ek.dts
index 8522a210b484..8373980b9bc9 100644
--- a/arch/arm/boot/dts/microchip/at91sam9260ek.dts
+++ b/arch/arm/boot/dts/microchip/at91sam9260ek.dts
@@ -162,7 +162,7 @@ button-4 {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		status = "okay";
 
 		eeprom@50 {
diff --git a/arch/arm/boot/dts/microchip/at91sam9261.dtsi b/arch/arm/boot/dts/microchip/at91sam9261.dtsi
index d1d678b77e84..9fe1918fc0b5 100644
--- a/arch/arm/boot/dts/microchip/at91sam9261.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9261.dtsi
@@ -651,7 +651,7 @@ gpbr: syscon@fffffd50 {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c_bitbang>;
diff --git a/arch/arm/boot/dts/microchip/at91sam9263.dtsi b/arch/arm/boot/dts/microchip/at91sam9263.dtsi
index a4b5d1f228f9..42949a989ec5 100644
--- a/arch/arm/boot/dts/microchip/at91sam9263.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9263.dtsi
@@ -824,7 +824,7 @@ nand_controller1: nand-controller {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pioB 4 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&pioB 5 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/microchip/at91sam9263ek.dts b/arch/arm/boot/dts/microchip/at91sam9263ek.dts
index 93c5268a0845..3dafdd02f6c0 100644
--- a/arch/arm/boot/dts/microchip/at91sam9263ek.dts
+++ b/arch/arm/boot/dts/microchip/at91sam9263ek.dts
@@ -250,7 +250,7 @@ button-right-click {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		status = "okay";
 
 		eeprom@50 {
diff --git a/arch/arm/boot/dts/microchip/at91sam9g20ek_common.dtsi b/arch/arm/boot/dts/microchip/at91sam9g20ek_common.dtsi
index 84a7287107f8..3f4d27c3644e 100644
--- a/arch/arm/boot/dts/microchip/at91sam9g20ek_common.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9g20ek_common.dtsi
@@ -217,7 +217,7 @@ usb0: usb@500000 {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		status = "okay";
 
 		eeprom@50 {
diff --git a/arch/arm/boot/dts/microchip/at91sam9g45.dtsi b/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
index 4e00ed2d3ecd..a4de194a724f 100644
--- a/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
@@ -1008,7 +1008,7 @@ nand_controller: nand-controller {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pioA 20 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&pioA 21 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/microchip/at91sam9n12.dtsi b/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
index af41c3dbb4bf..e8239fcfff01 100644
--- a/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
@@ -784,7 +784,7 @@ nand_controller: nand-controller {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pioA 30 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&pioA 31 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/microchip/at91sam9rl.dtsi b/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
index de74cf2980a0..f1e2f383ed86 100644
--- a/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
@@ -831,7 +831,7 @@ rtc@fffffe00 {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pioA 23 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&pioA 24 GPIO_ACTIVE_HIGH>;
@@ -845,7 +845,7 @@ i2c-gpio-0 {
 		status = "disabled";
 	};
 
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pioD 10 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&pioD 11 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/microchip/at91sam9rlek.dts b/arch/arm/boot/dts/microchip/at91sam9rlek.dts
index a57351270551..0ab5adebb8ff 100644
--- a/arch/arm/boot/dts/microchip/at91sam9rlek.dts
+++ b/arch/arm/boot/dts/microchip/at91sam9rlek.dts
@@ -266,11 +266,11 @@ button-left-click {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		status = "okay";
 	};
 
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/microchip/at91sam9x5.dtsi b/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
index 9070fd06995a..65044901f662 100644
--- a/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
@@ -931,7 +931,7 @@ nand_controller: nand-controller {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pioA 30 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&pioA 31 GPIO_ACTIVE_HIGH>;
@@ -945,7 +945,7 @@ i2c-gpio-0 {
 		status = "disabled";
 	};
 
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pioC 0 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&pioC 1 GPIO_ACTIVE_HIGH>;
@@ -959,7 +959,7 @@ i2c-gpio-1 {
 		status = "disabled";
 	};
 
-	i2c-gpio-2 {
+	i2c-gpio2 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pioB 4 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&pioB 5 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/microchip/ethernut5.dts b/arch/arm/boot/dts/microchip/ethernut5.dts
index 52ccef31b391..98ae08549362 100644
--- a/arch/arm/boot/dts/microchip/ethernut5.dts
+++ b/arch/arm/boot/dts/microchip/ethernut5.dts
@@ -107,7 +107,7 @@ usb0: usb@500000 {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		status = "okay";
 
 		pcf8563@50 {
diff --git a/arch/arm/boot/dts/microchip/evk-pro3.dts b/arch/arm/boot/dts/microchip/evk-pro3.dts
index 40c5111c2f0a..be4619191538 100644
--- a/arch/arm/boot/dts/microchip/evk-pro3.dts
+++ b/arch/arm/boot/dts/microchip/evk-pro3.dts
@@ -51,7 +51,7 @@ usb0: usb@500000 {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/microchip/mpa1600.dts b/arch/arm/boot/dts/microchip/mpa1600.dts
index 2a97e2c0b894..485a76609718 100644
--- a/arch/arm/boot/dts/microchip/mpa1600.dts
+++ b/arch/arm/boot/dts/microchip/mpa1600.dts
@@ -63,7 +63,7 @@ usb0: usb@300000 {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/microchip/tny_a9263.dts b/arch/arm/boot/dts/microchip/tny_a9263.dts
index fd8244b56e05..784dbafb3856 100644
--- a/arch/arm/boot/dts/microchip/tny_a9263.dts
+++ b/arch/arm/boot/dts/microchip/tny_a9263.dts
@@ -120,7 +120,7 @@ data@7ca0000 {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
index da32c5fdcc47..80f7262ad22a 100644
--- a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
+++ b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
@@ -146,7 +146,7 @@ button-user-pb {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/microchip/usb_a9263.dts b/arch/arm/boot/dts/microchip/usb_a9263.dts
index 8e1a3fb61087..2019f0b8c44d 100644
--- a/arch/arm/boot/dts/microchip/usb_a9263.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9263.dts
@@ -165,7 +165,7 @@ button-user-pb {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts b/arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts
index 2eda00477bc5..1f1719d5029d 100644
--- a/arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts
@@ -29,7 +29,7 @@ mmc@0 {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		rtc@56 {
 			compatible = "microcrystal,rv3029";
 			reg = <0x56>;
-- 
2.47.2


