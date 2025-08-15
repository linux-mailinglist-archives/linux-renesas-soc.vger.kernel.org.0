Return-Path: <linux-renesas-soc+bounces-20571-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BABEB288A3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Aug 2025 01:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E3D2A24F04
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Aug 2025 23:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D672D0619;
	Fri, 15 Aug 2025 23:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mc8zaiJd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E936C79F2;
	Fri, 15 Aug 2025 23:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755299340; cv=none; b=pHiZKsqRN6vK7OxWv4uQStpJkoI0ZgPquOHTFjzQuNNO7bE4JBc/nzLM5Q9pAdPfDDke9e7UiZ5w8Wqyj8497hI3WPIznpImfy7XwXvBuaFQeF/uN0GMEE8sSl7iEtX7OYT1b3XYT/hgMlROoHVe7P5lrSnt1PLfMjqiIzBYh8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755299340; c=relaxed/simple;
	bh=2GRJzTk+BtY2YrnH++wopzOmkdTjrCsNi98W9z6N620=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QYG3nRUZqheQ/WkTFeLveQsaSW4HJSgudYtxBbuhOls3IFVFjsV2uXS2Y0EXG0blhgmO6coalMqX6zgdJ4GTuZjO2mvJTbojwGRBOJmbaNk89XltJacH8spNt9i9Sf+TkKfeNFQIohT9TIL+yT8wXenkTxQCUgeLPuFdPC/eDt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mc8zaiJd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E631C4CEEB;
	Fri, 15 Aug 2025 23:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755299338;
	bh=2GRJzTk+BtY2YrnH++wopzOmkdTjrCsNi98W9z6N620=;
	h=From:To:Cc:Subject:Date:From;
	b=Mc8zaiJdlfbcfAlsWKhmAZAKFanuVxseD1OxvsAfJtKF7081GIZmX+rbRA7HOZ0at
	 4aBO7StfsaIXLTw7l7sFhi3gdMg8qqrZ3Rn3h+Xm0crT/GalDBjITPv5knK18QSHEs
	 NL4wqvH7d3FEhs6o/cXm+QqjY4eV1N6DASn8B6aJSoi9xOrX3xX0DNt/C9nZPeWF9X
	 ihvvW/H7NFXJWPaVyKXqjDysZhkgQy1q1Q87/ahn/0QOmZG8m+hKS10HibR0+Kn2aI
	 9SV6KOU1i44Od3IXVIwHVMHVU4sjzSBQlFKAHiA5IDE1wJIPTZdBtctncTx93eJiTR
	 /g3fu1jJJP71A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: dts: aspeed: Fix/add I2C device vendor prefixes
Date: Fri, 15 Aug 2025 18:08:39 -0500
Message-ID: <20250815230841.3487764-1-robh@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASpeed DTS files have various I2C devices with missing or incorrect
vendor prefixes in their compatible strings. This hasn't really mattered
and doesn't impact ABI compatibility as I2C devices get matched with their
vendor prefix stripped.

With this, the "maxim,max31790" nodes now validate and have some
warnings. Remove the spurious "#address-cells" and "#size-cells"
properties to fix the warnings.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../aspeed-bmc-arm-stardragon4800-rep2.dts    |  2 +-
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  |  8 ++-----
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 24 +++++--------------
 .../aspeed/aspeed-bmc-facebook-tiogapass.dts  |  2 +-
 .../dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts |  2 +-
 .../dts/aspeed/aspeed-bmc-opp-palmetto.dts    |  2 +-
 .../boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts |  4 ++--
 7 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dts
index 9605ccade155..b550a48f48f0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dts
@@ -171,7 +171,7 @@ eeprom@50 {
 				reg = <0x50>;
 			};
 			dps650ab@58 {
-				compatible = "dps650ab";
+				compatible = "delta,dps650ab";
 				reg = <0x58>;
 			};
 		};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index b9a93f23bd0a..1aae3645cc8c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -184,10 +184,8 @@ &i2c0 {
 	status = "okay";
 
 	pwm@5e{
-		compatible = "max31790";
+		compatible = "maxim,max31790";
 		reg = <0x5e>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 	};
 
 	power-sensor@40 {
@@ -258,10 +256,8 @@ &i2c2 {
 	status = "okay";
 
 	pwm@5e{
-		compatible = "max31790";
+		compatible = "maxim,max31790";
 		reg = <0x5e>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 	};
 
 	power-sensor@40 {
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index ef96b17becb2..4584d3b536b4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -313,10 +313,8 @@ eeprom@50 {
 			};
 
 			pwm@5e{
-				compatible = "max31790";
+				compatible = "maxim,max31790";
 				reg = <0x5e>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 			};
 
 			power-sensor@40 {
@@ -436,10 +434,8 @@ eeprom@50 {
 			};
 
 			pwm@5e{
-				compatible = "max31790";
+				compatible = "maxim,max31790";
 				reg = <0x5e>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 			};
 
 			power-sensor@40 {
@@ -559,10 +555,8 @@ eeprom@50 {
 			};
 
 			pwm@5e{
-				compatible = "max31790";
+				compatible = "maxim,max31790";
 				reg = <0x5e>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 			};
 
 			power-sensor@40 {
@@ -682,10 +676,8 @@ eeprom@50 {
 			};
 
 			pwm@5e{
-				compatible = "max31790";
+				compatible = "maxim,max31790";
 				reg = <0x5e>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 			};
 
 			power-sensor@40 {
@@ -805,10 +797,8 @@ eeprom@50 {
 			};
 
 			pwm@5e{
-				compatible = "max31790";
+				compatible = "maxim,max31790";
 				reg = <0x5e>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 			};
 
 			power-sensor@40 {
@@ -927,10 +917,8 @@ eeprom@50 {
 			};
 
 			pwm@5e{
-				compatible = "max31790";
+				compatible = "maxim,max31790";
 				reg = <0x5e>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 			};
 
 			power-sensor@40 {
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dts
index 704ee684e0fb..5d4c7d979f1e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dts
@@ -508,7 +508,7 @@ &i2c7 {
 	status = "okay";
 	//HSC, AirMax Conn A
 	adm1278@45 {
-		compatible = "adm1275";
+		compatible = "adi,adm1275";
 		reg = <0x45>;
 		shunt-resistor-micro-ohms = <250>;
 	};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts
index de61eac54585..adc598cca50c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts
@@ -211,7 +211,7 @@ &i2c1 {
 	status = "okay";
 	bus-frequency = <90000>;
 	HotSwap@10 {
-		compatible = "adm1272";
+		compatible = "adi,adm1272";
 		reg = <0x10>;
 	};
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dts
index 123da82c04d5..e6f33d7cfc45 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dts
@@ -151,7 +151,7 @@ eeprom@50 {
 	};
 
 	rtc@68 {
-		compatible = "dallas,ds3231";
+		compatible = "maxim,ds3231";
 		reg = <0x68>;
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts
index fd361cf073c2..86451227847b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts
@@ -509,7 +509,7 @@ U197_PCA9546_CH1: i2c@1 {
 			reg = <1>;
 
 			cpu0_pvccin@60 {
-				compatible = "isil,raa229004";
+				compatible = "renesas,raa229004";
 				reg = <0x60>;
 			};
 
@@ -530,7 +530,7 @@ U197_PCA9546_CH2: i2c@2 {
 			reg = <2>;
 
 			cpu1_pvccin@72 {
-				compatible = "isil,raa229004";
+				compatible = "renesas,raa229004";
 				reg = <0x72>;
 			};
 
-- 
2.50.1


