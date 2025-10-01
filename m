Return-Path: <linux-renesas-soc+bounces-22506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D67BB00C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 12:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B87017097F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 10:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C462BF015;
	Wed,  1 Oct 2025 10:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aQOBFybd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514A02BF3DF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 10:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759315414; cv=none; b=lmY7RnD3FAwpLB7LMBdiPsf3nlX0YyLWBFOaL3sB6KJBjrIVLj1FfBJ6RV+Iemzr6mwh6jLV/B+HeDnKC+l3rzZ2pvHZ6tG+EMcdSZQvimjyxczqLLuK7yAimSMk3RIzevYovLeionsLZo06m42x8fq5WfmjEcnJaBNZ6YLvBwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759315414; c=relaxed/simple;
	bh=/YciURnIdbkM8Wu492VdYHHi999331iJHAr4GsSNKNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EBHUvV2+kCMB1kWrWGFB+7MoJLUskL6p9dotiFHzGx/exUskqHGR5y9aBcySzfd9TX5GqWUrhqo9vTsxve0ICpEhYVasGemOxSKp3Pfp5wVCoQPPiJornirZeUWsxJNHmwkarFLVzivJp8KDsnlAbbwF/hK1TyoVuOwkGlQeRak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aQOBFybd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding; s=k1; bh=T
	GSFfJotV/sLfDR2Zhgpl9a+GeB8wpK+KOFucAWHlNM=; b=aQOBFybdKCLHE4ZIm
	fnYH9WT14+WzGpLyFLSI2pbZMN7uzcuahnrXjuNnJeirN9ty9TNJu0o+UyMIjYma
	Xm+yWK2meyjNtpWzmrpqG/3syEvTnu42M9CNmcHfizEBCOhuTsPWVBeK1iWL/a77
	U5l3fEAfD3g4to3lXoL2qmSpNW/dfNDj77vQ9jK9hGNFIAqBfF8eoRYPG9QN9+/E
	dpOeeGn+kHdaWDSs3UsldE6n3ZlsJBtYLZuYdpE4D2Y+y0Ybh23UZb8rxzC228Qg
	uQRTuGt+WNG0iNiCS2QUyBfwIsq2sRpCoeerjJ/sNPRsvu30ujHkQ0IueWSoK2st
	+3y8A==
Received: (qmail 4007115 invoked from network); 1 Oct 2025 12:43:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Oct 2025 12:43:21 +0200
X-UD-Smtp-Session: l3s3148p1@66eHiRZAkKAujntN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Herve Codina <herve.codina@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-db: use interrupt for Micrel PHYs
Date: Wed,  1 Oct 2025 12:38:06 +0200
Message-ID: <20251001104312.40771-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make use of the interrupts wired to the Micrel PHYs via the GPIO IRQ
mux.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Works nicely and kinda out-of-the-box for the Micrel PHYs, couldn't get
it to work (reliably?) with the Marvell PHYs on the EB. Leaving this for
later (if ever), no more bandwidth currently. But at least we have an
upstream user for the gpioirqmux now.

RFC because Hervé's patches are still in-flight.

 .../dts/renesas/r9a06g032-rzn1d400-db.dts     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index c3786d54992a..d81e92f787a6 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -186,6 +186,12 @@ fixed-link {
 	};
 };
 
+&gpioirqmux {
+	interrupt-map = <89 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>, /* pin 147: phy@4 */
+			<91 &gic GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>; /* pin 149: phy@5 */
+	status = "okay";
+};
+
 #if DB_SW2_2 == SW_OFF
 &gpio1 {
 	pinctrl-0 = <&pins_gpio1>;
@@ -194,6 +200,12 @@ &gpio1 {
 };
 #endif
 
+&gpio2 {
+	pinctrl-0 = <&pins_gpio2>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&pins_i2c2>;
 	pinctrl-names = "default";
@@ -286,6 +298,13 @@ pins_gpio1: pins-gpio1 {
 	};
 #endif
 
+	pins_gpio2: pins-gpio2 {
+		pinmux = <RZN1_PINMUX(147, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(149, RZN1_FUNC_GPIO)>;
+		drive-strength = <6>;
+		bias-disable;
+	};
+
 	pins_eth3: pins_eth3 {
 		pinmux = <RZN1_PINMUX(36, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
 			 <RZN1_PINMUX(37, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
@@ -355,11 +374,13 @@ mdio {
 		switch0phy4: ethernet-phy@4 {
 			reg = <4>;
 			micrel,led-mode = <1>;
+			interrupts-extended = <&gpio2a 25 IRQ_TYPE_LEVEL_LOW>;
 		};
 
 		switch0phy5: ethernet-phy@5 {
 			reg = <5>;
 			micrel,led-mode = <1>;
+			interrupts-extended = <&gpio2a 27 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
-- 
2.47.2


