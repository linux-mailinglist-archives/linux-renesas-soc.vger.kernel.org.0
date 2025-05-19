Return-Path: <linux-renesas-soc+bounces-17196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C2809ABBD7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 14:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6BE77A30E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 12:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3412427815A;
	Mon, 19 May 2025 12:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aDUORtl4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23A62777E0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 12:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656936; cv=none; b=JVsQPl4gv7TZgycB3OXScObY1Hj5/IEOSX9nMVqoCW6t9X8U+i0Th+IM5pJAmSMi5mWIuxrYl14t+hBXi6Em3D0OsCD5lBiFUoS6SyEDlmzx1cm63w/6jBNmSmHU0+yhP3s1WOUVUE456xZj5DXqw3cxlB/gwebQZN78MieKNRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656936; c=relaxed/simple;
	bh=kQirraHRo7tl8S0ILof1ErIEHp5SfRrIF1ZuCMtMGuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZxWHQsYuvfCr5CrpCKwetKO8Ds5ZV7IUNwCfp7aZkNh3AuBPcfcajCwvqQ58DhEKC01GtwJ8RQIKq5zpRqk9gx5GF18LgxkbPVV4R81lxra640ee8/G799NZFXdihmZ84hVhhapmdc+jtDnIXViz1okdXlmvyedO+tGt4mkhQgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aDUORtl4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=IUMwquEcLTEIyJvMVgeI6/iFdQPruiZ2t0nL4eXINl0=; b=aDUORt
	l4nfwsb+//J640DGHRqpWelkosl14ymxsscdNvk0cP6FSZG5wMHlOoD0QJjahO8T
	gnzcifl+AsHvIR65/umeshsHm8BeKD6eJoysnkxvyeeduLb8GlmRDuiSV7oFFd2K
	qrkQJ+ydsOVNONx3PkKAZlmuz/AiqVPA18VHX2KuclIzRmeoBv0B3UavWgv8NS1o
	/xPnIWXSSSpnlLthuKAno8RFl1ldshyUyLZV6A2NTKIs+pbQKPIBMNoiFHjOqwlz
	umI3r9exQP+XdI0r8NP5+m7SzbViQJczVVc+U9zYq0J+EHvHiC1X5P0qsDAuAw/z
	9iQNx4aQWo1h5ZoQ==
Received: (qmail 2475253 invoked from network); 19 May 2025 14:15:31 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 14:15:31 +0200
X-UD-Smtp-Session: l3s3148p1@CQCJFnw1JrBZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 5/7] ARM: dts: stm32: use proper node names for GPIO based I2C busses
Date: Mon, 19 May 2025 14:15:05 +0200
Message-ID: <20250519121512.5657-6-wsa+renesas@sang-engineering.com>
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
 .../boot/dts/st/ste-ux500-samsung-codina-tmo.dts |  8 ++++----
 .../arm/boot/dts/st/ste-ux500-samsung-codina.dts |  8 ++++----
 .../arm/boot/dts/st/ste-ux500-samsung-gavini.dts | 12 ++++++------
 .../arm/boot/dts/st/ste-ux500-samsung-golden.dts |  8 ++++----
 .../arm/boot/dts/st/ste-ux500-samsung-janice.dts | 16 ++++++++--------
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts  |  8 ++++----
 .../arm/boot/dts/st/ste-ux500-samsung-skomer.dts |  8 ++++----
 7 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
index 404d4ea9347b..7e6be26549ef 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
@@ -215,7 +215,7 @@ led {
 	};
 
 	/* Bit-banged I2C on GPIO143 and GPIO144 also called "SUBPMU I2C" */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -228,7 +228,7 @@ i2c-gpio-0 {
 	};
 
 	/* Bit-banged I2C on GPIO151 and GPIO152 also called "COMP I2C" */
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 24 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 23 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -690,7 +690,7 @@ codina_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for subpmu */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		i2c_gpio_0_default: i2c_gpio_0 {
 			codina_cfg1 {
 				pins = "GPIO143_D12", "GPIO144_B13";
@@ -699,7 +699,7 @@ codina_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for the NFC */
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		i2c_gpio_1_default: i2c_gpio_1 {
 			codina_cfg1 {
 				pins = "GPIO151_D17", "GPIO152_D16";
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
index 40b0d92dfb15..6706c31ff1a5 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
@@ -285,7 +285,7 @@ led {
 	};
 
 	/* Bit-banged I2C on GPIO143 and GPIO144 also called "SUBPMU I2C" */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -306,7 +306,7 @@ magnetometer@c {
 	};
 
 	/* Bit-banged I2C on GPIO151 and GPIO152 also called "NFC I2C" */
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 24 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 23 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -816,7 +816,7 @@ codina_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for subpmu */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		i2c_gpio_0_default: i2c_gpio_0 {
 			codina_cfg1 {
 				pins = "GPIO143_D12", "GPIO144_B13";
@@ -825,7 +825,7 @@ codina_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for the NFC */
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		i2c_gpio_1_default: i2c_gpio_1 {
 			codina_cfg1 {
 				pins = "GPIO151_D17", "GPIO152_D16";
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
index ad9a20ccaaeb..f9423f168f62 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
@@ -249,7 +249,7 @@ ktd259: backlight {
 	};
 
 	/* Bit-banged I2C on GPIO143 and GPIO144 also called "SUBPMU I2C" */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -321,7 +321,7 @@ panel_in: endpoint {
 	};
 
 	/* Bit-banged I2C on GPIO201 and GPIO202 also called "MOT_I2C" */
-	i2c-gpio-2 {
+	i2c-gpio2 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio6 10 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio6 9 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -333,7 +333,7 @@ i2c-gpio-2 {
 	};
 
 	/* Bit-banged I2C on GPIO196 and GPIO197 also called "MPR_I2C" */
-	i2c-gpio-3 {
+	i2c-gpio3 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio6 5 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio6 4 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -796,7 +796,7 @@ gavini_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for magnetometer and NCP6914 */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		i2c_gpio_0_default: i2c_gpio_0 {
 			gavini_cfg1 {
 				pins = "GPIO143_D12", "GPIO144_B13";
@@ -805,7 +805,7 @@ gavini_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for the Immersion ISA1200 */
-	i2c-gpio-2 {
+	i2c-gpio2 {
 		i2c_gpio_2_default: i2c_gpio_2 {
 			gavini_cfg1 {
 				pins = "GPIO201_AF24", "GPIO202_AF25";
@@ -814,7 +814,7 @@ gavini_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for the TI DPP2601 */
-	i2c-gpio-3 {
+	i2c-gpio3 {
 		i2c_gpio_3_default: i2c_gpio_3 {
 			gavini_cfg1 {
 				pins = "GPIO196_AG26", "GPIO197_AH24";
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
index f736888474e7..fad867964a50 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
@@ -55,7 +55,7 @@ bat_therm: thermistor {
 		#thermal-sensor-cells = <0>;
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio2 14 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio2 13 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -81,7 +81,7 @@ touchkey@20 {
 		};
 	};
 
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 24 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 23 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -553,7 +553,7 @@ golden_cfg1 {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		i2c_gpio_0_default: i2c_gpio_0 {
 			golden_cfg1 {
 				pins = "GPIO77",	/* TOUCHKEY_SCL */
@@ -572,7 +572,7 @@ golden_cfg1 {
 		};
 	};
 
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		i2c_gpio_1_default: i2c_gpio_1 {
 			golden_cfg1 {
 				pins = "GPIO151",	/* COMP_SCL */
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
index 229f7c32103c..580a5da69187 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
@@ -239,7 +239,7 @@ led {
 	};
 
 	/* Bit-banged I2C on GPIO143 and GPIO144 also called "SUBPMU I2C" */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -324,7 +324,7 @@ gp2a_shunt: current-sense-shunt {
 	};
 
 	/* Bit-banged I2C on GPIO196 and GPIO197 also called "TOUCHKEY_I2C" */
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio6 5 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio6 4 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -352,7 +352,7 @@ touchkey@20 {
 	};
 
 	/* Bit-banged I2C on GPIO201 and GPIO202 also called "MOT_I2C" */
-	i2c-gpio-2 {
+	i2c-gpio2 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio6 10 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio6 9 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -364,7 +364,7 @@ i2c-gpio-2 {
 	};
 
 	/* Bit-banged I2C on GPIO151 and GPIO152 also called "NFC_I2C" */
-	i2c-gpio-3 {
+	i2c-gpio3 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 24 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 23 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -875,7 +875,7 @@ janice_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for magnetometer and NCP6914 */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		i2c_gpio_0_default: i2c_gpio_0 {
 			janice_cfg1 {
 				pins = "GPIO143_D12", "GPIO144_B13";
@@ -884,7 +884,7 @@ janice_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for the Cypress touchkeys */
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		i2c_gpio_1_default: i2c_gpio_1 {
 			janice_cfg1 {
 				pins = "GPIO196_AG26", "GPIO197_AH24";
@@ -893,7 +893,7 @@ janice_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for the Immersion ISA1200 */
-	i2c-gpio-2 {
+	i2c-gpio2 {
 		i2c_gpio_2_default: i2c_gpio_2 {
 			janice_cfg1 {
 				pins = "GPIO201_AF24", "GPIO202_AF25";
@@ -902,7 +902,7 @@ janice_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for the NFC */
-	i2c-gpio-3 {
+	i2c-gpio3 {
 		i2c_gpio_3_default: i2c_gpio_3 {
 			janice_cfg1 {
 				pins = "GPIO151_D17", "GPIO152_D16";
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
index cdb147dcc1db..bd8eb2b3bacd 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
@@ -196,7 +196,7 @@ led {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -207,7 +207,7 @@ i2c-gpio-0 {
 		/* TODO: this should be used by the NCP6914 Camera power management unit */
 	};
 
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 24 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 23 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -629,7 +629,7 @@ kyle_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for NCP6914 */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		i2c_gpio_0_default: i2c_gpio_0 {
 			kyle_cfg1 {
 				pins = "GPIO143_D12", "GPIO144_B13";
@@ -638,7 +638,7 @@ kyle_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for ALPS HSCD compass */
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		i2c_gpio_1_default: i2c_gpio_1 {
 			kyle_cfg1 {
 				pins = "GPIO151_B17", "GPIO152_D16";
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
index 064d6fee8821..a8c854a82d4e 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
@@ -175,7 +175,7 @@ led {
 		};
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -186,7 +186,7 @@ i2c-gpio-0 {
 		/* TODO: this should be used by the NCP6914 Camera power management unit */
 	};
 
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpio4 24 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpio4 23 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -616,7 +616,7 @@ skomer_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for NCP6914 */
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		i2c_gpio_0_default: i2c_gpio_0 {
 			skomer_cfg1 {
 				pins = "GPIO143_D12", "GPIO144_B13";
@@ -625,7 +625,7 @@ skomer_cfg1 {
 		};
 	};
 	/* GPIO-based I2C bus for ALPS HSCD compass */
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		i2c_gpio_1_default: i2c_gpio_1 {
 			skomer_cfg1 {
 				pins = "GPIO151_B17", "GPIO152_D16";
-- 
2.47.2


