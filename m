Return-Path: <linux-renesas-soc+bounces-15900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A304A87CBA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 12:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 005683B2E9D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 10:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B088194094;
	Mon, 14 Apr 2025 10:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OwQcbk2s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7FC1A9B58
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Apr 2025 10:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624946; cv=none; b=bUbX8h0dnJCbOmbUetwrCqAWDpXw4SVRvjAQQPBqhUMUtrEPKvvsUJ7UFebuiQfo9F1qdB18s+WGr0kebT6WV6zN6jRsJgfcvr2BQTPJxZl45E/CU8yxay+hl6xMqcS8bJSUa5fdpxsGKbMbWQety4gIIVfdKfKuPV7zJwlm57o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624946; c=relaxed/simple;
	bh=FfLFviB1dgFGoRFmstXijEl6bx0DXQ/QuRWLNagTGrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fzijjcp1dQ/TsoeTf06CYsbwGDqxIHmRJ/efhoXQdQcneznA3miMCRxG7e8rIxaWQXI5oJ5gGm1qtsB3qn1nsRjaejXlcMIVYdtVHyq5YWh4nCXNU080Hza7pjbIO5c4WeoFd/RvQRv0bnuPoAMT6EUtKVufyfy/GabluO3Ngvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OwQcbk2s; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding; s=k1; bh=g
	C+3HXcqHlrIg8k1i6gZ+tETFXVfKFnaUdkkcsMJ0/k=; b=OwQcbk2sWQSHPtRUQ
	GDkuybFKPqT3ZkeMMvlEkSm5butJPjmxLN8a3ZHC/pbhLj5kJeXWfWGweSCdkwrn
	w0hurVnPyFgLHV7nT3j3M+KuuCCnTIx/BZDdxMaCSxzw5Au7K5r77qH2Q0y9OMuK
	iDcJ17So7wcGQqUIsb8000gvRviTu1LUWbOlQrO1i6iykDP634HHX+WQAWRaIJM8
	WG7sL5l/snGGLBmGms/XPSkxScu8rqGceB/FfAxY+H142k7ee2mSmdDcCygZaAkD
	YkmUDHkHZLUnIfeOftA+aQPbAULfqtMx0iBWGx1v07xLuay+MTJNsKCDLUbsCGg5
	4T5PA==
Received: (qmail 2241609 invoked from network); 14 Apr 2025 12:02:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Apr 2025 12:02:20 +0200
X-UD-Smtp-Session: l3s3148p1@DgvOJboybJcujnth
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Add GMAC1 port
Date: Mon, 14 Apr 2025 12:01:13 +0200
Message-ID: <20250414100206.7185-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This port bypasses the switch and is directly connected to the GMAC.

Co-developed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Based on renesas-dts-for-v6.16 as of today.

 .../dts/renesas/r9a06g032-rzn1d400-eb.dts     | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
index e539df514d1e..975446b2ac97 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
@@ -15,6 +15,42 @@ / {
 		     "renesas,r9a06g032";
 };
 
+&gmac1 {
+	pinctrl-0 = <&pins_eth0>, <&pins_mdio0>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy_mii0>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		phy_mii0: ethernet-phy@8 {
+			reg = <8>;
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_LAN;
+					default-state = "keep";
+				};
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_ORANGE>;
+					function = LED_FUNCTION_ACTIVITY;
+					default-state = "keep";
+				};
+			};
+		};
+	};
+};
+
 &i2c2 {
 	/* Sensors are different across revisions. All are LM75B compatible */
 	sensor@49 {
@@ -23,6 +59,11 @@ sensor@49 {
 	};
 };
 
+&mii_conv1 {
+	renesas,miic-input = <MIIC_GMAC1_PORT>;
+	status = "okay";
+};
+
 &mii_conv2 {
 	renesas,miic-input = <MIIC_SWITCH_PORTD>;
 	status = "okay";
@@ -34,6 +75,23 @@ &mii_conv3 {
 };
 
 &pinctrl {
+	pins_eth0: pins-eth0 {
+		pinmux = <RZN1_PINMUX(0, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(1, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(2, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(3, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(4, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(5, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(6, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(7, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(8, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(9, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(10, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
+			 <RZN1_PINMUX(11, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>;
+		drive-strength = <6>;
+		bias-disable;
+	};
+
 	pins_eth1: pins-eth1 {
 		pinmux = <RZN1_PINMUX(12, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
 			 <RZN1_PINMUX(13, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
@@ -68,6 +126,11 @@ pins_eth2: pins-eth2 {
 		bias-disable;
 	};
 
+	pins_mdio0: pins-mdio0 {
+		pinmux = <RZN1_PINMUX(150, RZN1_FUNC_MDIO0_GMAC0)>,
+			 <RZN1_PINMUX(151, RZN1_FUNC_MDIO0_GMAC0)>;
+	};
+
 	pins_sdio1: pins-sdio1 {
 		pinmux = <RZN1_PINMUX(95, RZN1_FUNC_SDIO)>,
 			 <RZN1_PINMUX(97, RZN1_FUNC_SDIO)>,
-- 
2.47.2


