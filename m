Return-Path: <linux-renesas-soc+bounces-17195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CD9ABBD78
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 14:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2D2B3BC392
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 12:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F44F2777E4;
	Mon, 19 May 2025 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ieUtbq46"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8337275846
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 12:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656935; cv=none; b=dQ7Eg6kqPyjCJycK+nejC1FLK4qL/qMfTbk7m/aCR2UvFeQoelqmcP8/aIVSZutR2LJefrfrGkxRXTfG7UtJQJ6X6+j58OFOQzWD2abVGTA3YAiGPVFBuQY5Ie/6AcYLnPldYJw4FryLMFyFS5AM7+XaoynCP1T/mpjXw3pqxTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656935; c=relaxed/simple;
	bh=W+MvnJ2/FgnOqAonCE0oZ4OE+mCsqLsJj2i5O0mqYSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BxoJbYtZ+KWKGToojeoSX/8iRJ1kJiqGv0BE2hcQND6UOKXy+y6avVKJkgSczorO7ZpqSJVEBOg0Cox+vfu2jwCYUSA4G1m+2/wdv9k429HYUh0Pn9P3kPVaeeLG7Cy0jXWaMIWfqaKWyNoz6OniRWfQTNBrrF8cJobPG9fQkos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ieUtbq46; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=UrX4aYErdjaal258RDMYJgFigt8w+tlGcSSKjmeWR7Q=; b=ieUtbq
	46SU9nRmgkMaKncXUo/Qq7bNO/sMcu3VGDi/5ONH3445bqJzoZqkI2mBbqsvAax2
	7h7hYApOQqwZRcS4xhZvr9sqaqnU7RNNAicDMQkb0UEaFWdZgXdXx2tiJ3sePsTe
	wTzmheB5dl0KFd+bCIdqTo29V/lx88kMTHlXcHyN0lo+7kXBDyI6Mcr+5atFm21Z
	CqmGDr8XPzX/ZEjF+Eep54m1e5r+k8bOS5pNIK6l5OHpdc2kdvccekFLkkpmuYSl
	nhi6dFILxomUveNJCbbjC+Kbk/sd0cGt+gcn62sKQAo03T2Ut8iChuo3vnQEy9Gv
	PzzmbnuGIwdjRn5Q==
Received: (qmail 2475212 invoked from network); 19 May 2025 14:15:29 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 14:15:29 +0200
X-UD-Smtp-Session: l3s3148p1@N3tsFnw1ILBZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 4/7] ARM: dts: samsung: use proper node names for GPIO based I2C busses
Date: Mon, 19 May 2025 14:15:04 +0200
Message-ID: <20250519121512.5657-5-wsa+renesas@sang-engineering.com>
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
 arch/arm/boot/dts/samsung/exynos3250-monk.dts    |  2 +-
 arch/arm/boot/dts/samsung/exynos3250-rinato.dts  |  2 +-
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts   |  6 +++---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi   | 10 +++++-----
 .../boot/dts/samsung/exynos4412-galaxy-s3.dtsi   |  4 ++--
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi  |  6 +++---
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi |  8 ++++----
 arch/arm/boot/dts/samsung/s5pv210-aries.dtsi     | 16 ++++++++--------
 arch/arm/boot/dts/samsung/s5pv210-galaxys.dts    |  2 +-
 9 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos3250-monk.dts b/arch/arm/boot/dts/samsung/exynos3250-monk.dts
index 2de877d4ccc5..2a95ebad94ba 100644
--- a/arch/arm/boot/dts/samsung/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/samsung/exynos3250-monk.dts
@@ -56,7 +56,7 @@ vemmc_reg: voltage-regulator-0 {
 		enable-active-high;
 	};
 
-	i2c_max77836: i2c-gpio-0 {
+	i2c_max77836: i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpd0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpd0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
diff --git a/arch/arm/boot/dts/samsung/exynos3250-rinato.dts b/arch/arm/boot/dts/samsung/exynos3250-rinato.dts
index 88fb3e68ff02..f34b593ee933 100644
--- a/arch/arm/boot/dts/samsung/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/samsung/exynos3250-rinato.dts
@@ -58,7 +58,7 @@ wlan_pwrseq: mshc1-pwrseq {
 		reset-gpios = <&gpe0 4 GPIO_ACTIVE_LOW>;
 	};
 
-	i2c_max77836: i2c-gpio-0 {
+	i2c_max77836: i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpd0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpd0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index 0d8495792a70..6d9afc297e7a 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -130,7 +130,7 @@ wlan_pwrseq: sdhci3-pwrseq {
 		reset-gpios = <&gpl1 2 GPIO_ACTIVE_LOW>;
 	};
 
-	i2c_max17042_fuel: i2c-gpio-0 {
+	i2c_max17042_fuel: i2c-gpio0 {
 		compatible = "i2c-gpio";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -154,7 +154,7 @@ battery@36 {
 		};
 	};
 
-	i2c_s5k5baf: i2c-gpio-1 {
+	i2c_s5k5baf: i2c-gpio1 {
 		compatible = "i2c-gpio";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -184,7 +184,7 @@ s5k5bafx_ep: endpoint {
 		};
 	};
 
-	i2c-gpio-2 {
+	i2c-gpio2 {
 		compatible = "i2c-gpio";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 70e3091062f9..31f73fb9dbdc 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -123,7 +123,7 @@ led-touchkeys {
 		color = <LED_COLOR_ID_WHITE>;
 	};
 
-	i2c_max77693: i2c-gpio-1 {
+	i2c_max77693: i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpm2 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpm2 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -169,7 +169,7 @@ charger {
 		};
 	};
 
-	i2c_max77693_fuel: i2c-gpio-2 {
+	i2c_max77693_fuel: i2c-gpio2 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpy0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpy0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -190,7 +190,7 @@ fuel-gauge@36 {
 		};
 	};
 
-	i2c_magnetometer: i2c-gpio-3 {
+	i2c_magnetometer: i2c-gpio3 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpy2 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpy2 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -208,7 +208,7 @@ magnetometer@2e {
 		};
 	};
 
-	i2c_lightsensor: i2c-gpio-4 {
+	i2c_lightsensor: i2c-gpio4 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpl0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpl0 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -220,7 +220,7 @@ i2c_lightsensor: i2c-gpio-4 {
 		/* WiFi model uses CM3323, 3G/LTE use CM36653 */
 	};
 
-	i2c_bl: i2c-gpio-5 {
+	i2c_bl: i2c-gpio5 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpm4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpm4 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
diff --git a/arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi
index 54e1a57ae886..29eecaad067a 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi
@@ -53,7 +53,7 @@ ps_als_reg: voltage-regulator-11 {
 		enable-active-high;
 	};
 
-	i2c_ak8975: i2c-gpio-0 {
+	i2c_ak8975: i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpy2 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpy2 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -68,7 +68,7 @@ magnetometer@c {
 		};
 	};
 
-	i2c_cm36651: i2c-gpio-2 {
+	i2c_cm36651: i2c-gpio2 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpf0 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpf0 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
diff --git a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
index 3d5aace668dc..5d1703a67b5f 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
@@ -166,7 +166,7 @@ key-ok {
 		};
 	};
 
-	i2c_max77693: i2c-gpio-1 {
+	i2c_max77693: i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpm2 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpm2 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -246,7 +246,7 @@ charger {
 		};
 	};
 
-	i2c_max77693_fuel: i2c-gpio-3 {
+	i2c_max77693_fuel: i2c-gpio3 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpf1 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpf1 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -267,7 +267,7 @@ fuel-gauge@36 {
 		};
 	};
 
-	i2c-gpio-4 {
+	i2c-gpio4 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpl0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpl0 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index 28a605802733..822d4bf2dfab 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -140,7 +140,7 @@ battery_cell: battery-cell {
 		constant-charge-voltage-max-microvolt = <4200000>;
 	};
 
-	i2c-gpio-1 {
+	i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpy2 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpy2 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -158,7 +158,7 @@ magnetometer@c {
 		};
 	};
 
-	i2c-gpio-2 {
+	i2c-gpio2 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpy0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpy0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -179,7 +179,7 @@ fuel-gauge@36 {
 		};
 	};
 
-	i2c-gpio-3 {
+	i2c-gpio3 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpm4 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpm4 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -207,7 +207,7 @@ adc {
 		};
 	};
 
-	i2c-gpio-4 {
+	i2c-gpio4 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpm2 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpm2 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
diff --git a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
index 153514e80c9a..f93fe4e60c90 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
@@ -102,7 +102,7 @@ wifi_pwrseq: wifi-pwrseq {
 		power-off-delay-us = <500>;
 	};
 
-	i2c_sound: i2c-gpio-0 {
+	i2c_sound: i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&mp05 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&mp05 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -150,7 +150,7 @@ wm8994: audio-codec@1a {
 		};
 	};
 
-	i2c_accel: i2c-gpio-1 {
+	i2c_accel: i2c-gpio1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj3 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpj3 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -170,7 +170,7 @@ accelerometer@38 {
 		};
 	};
 
-	i2c_pmic: i2c-gpio-2 {
+	i2c_pmic: i2c-gpio2 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj4 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpj4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -420,7 +420,7 @@ safe2_sreg: ESAFEOUT2 {
 		};
 	};
 
-	i2c_musb: i2c-gpio-3 {
+	i2c_musb: i2c-gpio3 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj3 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpj3 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -442,7 +442,7 @@ fsa9480: musb@25 {
 		};
 	};
 
-	i2c_fuel: i2c-gpio-4 {
+	i2c_fuel: i2c-gpio4 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&mp05 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&mp05 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -459,7 +459,7 @@ fg: fuelgauge@36 {
 		};
 	};
 
-	i2c_touchkey: i2c-gpio-5 {
+	i2c_touchkey: i2c-gpio5 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj3 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpj3 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -485,7 +485,7 @@ touchkey@20 {
 		};
 	};
 
-	i2c_prox: i2c-gpio-6 {
+	i2c_prox: i2c-gpio6 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpg2 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpg0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -513,7 +513,7 @@ light-sensor@44 {
 		};
 	};
 
-	i2c_magnetometer: i2c-gpio-7 {
+	i2c_magnetometer: i2c-gpio7 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj0 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpj0 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
diff --git a/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts b/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts
index 879294412381..cde026524891 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts
+++ b/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts
@@ -51,7 +51,7 @@ key-home {
 		};
 	};
 
-	i2c_fmradio: i2c-gpio-8 {
+	i2c_fmradio: i2c-gpio8 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpd1 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpd1 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-- 
2.47.2


