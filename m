Return-Path: <linux-renesas-soc+bounces-9007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 841E897DCFB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Sep 2024 13:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBA86B2167D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Sep 2024 11:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3000142E86;
	Sat, 21 Sep 2024 11:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SPsdAMIF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15C7156C6C
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Sep 2024 11:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726919322; cv=none; b=rLCGUpzbUq+WAnWquOCjCBNARDyj1ZyLmCBXtkOFskrzRtGZ8kQKImDk8ZM48dor7RbnpilZyJD6/Y8S8I1Iu9IS4Ug36KYcdhEFAxIu1/1KNGfTLlO2jiOheVgs72klBoNs76gL/qtjIFPLGvhf2ct5BvLzuM8Vf/V9UHx/56I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726919322; c=relaxed/simple;
	bh=eDhk0IVXaB3CVJzLUQ1WN80UMNPj8bfM9Jph3Xl1Orw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFturJkraE/OazGpP7ORpZ3rNGUyxJzC7AJ+vziu6bbPo8hyQz+EikdTiYmSyrI6rG/iV0W8gKntu1YShgPp8LR1wfd5qalkOnBev7A+Tq5ZAOlFPXN/aQoMPPUxspre6FkMGgleEQTDbYKGJdEFiO1BuMaTSUUzyGcyd2c3wz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SPsdAMIF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=W8XOb4jH8dPYU1ok4f1hmPLVJQEVLPoLo1IYvlwIC0s=; b=SPsdAM
	IFPgNS88+NuzSijhfjmS9Vli3KNmCcxiI9UKYrGpmJQa6akr7hKWs052OU0F8BjC
	8XTkMoYue1tWWN6jmeq1Hjk/ivYb8vw18uBRlbScMKzkCiZcBh3Xy8iHJwGBY6Fz
	Ze1tbyL5MuaVbD9gPp+jGGzgJFV6iebac3QTgeD86t9NIEi+BC+jI93MeLgMBsY5
	+lfZHhC5Bc7znL1Y7UVYv+b9hz9UOpsXts62XumGRSdR46aHlMbDw2x/gw8CL8qV
	gOAMwf3zvZH+XzYtKht3Fe0/bW79Ivt5mlmsr2mBHIMb+zn4FalF4/4G0ISs0Y7Y
	amlx4NTO5lLJ3Grg==
Received: (qmail 3652803 invoked from network); 21 Sep 2024 13:48:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2024 13:48:38 +0200
X-UD-Smtp-Session: l3s3148p1@ogqGvJ8ikOEgAwDwn0Nz2qARpwvTE8dN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 3/5] ARM: dts: renesas: genmai: sort nodes
Date: Sat, 21 Sep 2024 13:48:15 +0200
Message-ID: <20240921114813.4124-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240921114813.4124-7-wsa+renesas@sang-engineering.com>
References: <20240921114813.4124-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To make future additions easier.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 102 +++++++++---------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index c4c2d750ad79..5728b1080ca6 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -72,45 +72,6 @@ led2 {
 	};
 };
 
-&pinctrl {
-
-	scif2_pins: serial2 {
-		/* P3_0 as TxD2; P3_2 as RxD2 */
-		pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
-	};
-
-	i2c2_pins: i2c2 {
-		/* RIIC2: P1_4 as SCL, P1_5 as SDA */
-		pinmux = <RZA1_PINMUX(1, 4, 1)>, <RZA1_PINMUX(1, 5, 1)>;
-	};
-
-	ether_pins: ether {
-		/* Ethernet on Ports 1,2,3,5 */
-		pinmux = <RZA1_PINMUX(1, 14, 4)>,/* P1_14 = ET_COL  */
-			 <RZA1_PINMUX(5, 9, 2)>, /* P5_9 = ET_MDC   */
-			 <RZA1_PINMUX(3, 3, 2)>, /* P3_3 = ET_MDIO */
-			 <RZA1_PINMUX(3, 4, 2)>, /* P3_4 = ET_RXCLK */
-			 <RZA1_PINMUX(3, 5, 2)>, /* P3_5 = ET_RXER  */
-			 <RZA1_PINMUX(3, 6, 2)>, /* P3_6 = ET_RXDV  */
-			 <RZA1_PINMUX(2, 0, 2)>, /* P2_0 = ET_TXCLK */
-			 <RZA1_PINMUX(2, 1, 2)>, /* P2_1 = ET_TXER  */
-			 <RZA1_PINMUX(2, 2, 2)>, /* P2_2 = ET_TXEN  */
-			 <RZA1_PINMUX(2, 3, 2)>, /* P2_3 = ET_CRS   */
-			 <RZA1_PINMUX(2, 4, 2)>, /* P2_4 = ET_TXD0  */
-			 <RZA1_PINMUX(2, 5, 2)>, /* P2_5 = ET_TXD1  */
-			 <RZA1_PINMUX(2, 6, 2)>, /* P2_6 = ET_TXD2  */
-			 <RZA1_PINMUX(2, 7, 2)>, /* P2_7 = ET_TXD3  */
-			 <RZA1_PINMUX(2, 8, 2)>, /* P2_8 = ET_RXD0  */
-			 <RZA1_PINMUX(2, 9, 2)>, /* P2_9 = ET_RXD1  */
-			 <RZA1_PINMUX(2, 10, 2)>,/* P2_10 = ET_RXD2 */
-			 <RZA1_PINMUX(2, 11, 2)>;/* P2_11 = ET_RXD3 */
-	};
-};
-
-&extal_clk {
-	clock-frequency = <13330000>;
-};
-
 &bsc {
 	flash@0 {
 		compatible = "cfi-flash";
@@ -167,18 +128,6 @@ partition@60000 {
 	};
 };
 
-&usb_x1_clk {
-	clock-frequency = <48000000>;
-};
-
-&rtc_x1_clk {
-	clock-frequency = <32768>;
-};
-
-&mtu2 {
-	status = "okay";
-};
-
 &ether {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ether_pins>;
@@ -194,6 +143,10 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&extal_clk {
+	clock-frequency = <13330000>;
+};
+
 &i2c2 {
 	status = "okay";
 	clock-frequency = <400000>;
@@ -208,6 +161,10 @@ eeprom@50 {
 	};
 };
 
+&mtu2 {
+	status = "okay";
+};
+
 &ostm0 {
 	status = "okay";
 };
@@ -216,6 +173,45 @@ &ostm1 {
 	status = "okay";
 };
 
+&pinctrl {
+
+	scif2_pins: serial2 {
+		/* P3_0 as TxD2; P3_2 as RxD2 */
+		pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
+	};
+
+	i2c2_pins: i2c2 {
+		/* RIIC2: P1_4 as SCL, P1_5 as SDA */
+		pinmux = <RZA1_PINMUX(1, 4, 1)>, <RZA1_PINMUX(1, 5, 1)>;
+	};
+
+	ether_pins: ether {
+		/* Ethernet on Ports 1,2,3,5 */
+		pinmux = <RZA1_PINMUX(1, 14, 4)>,/* P1_14 = ET_COL  */
+			 <RZA1_PINMUX(5, 9, 2)>, /* P5_9 = ET_MDC   */
+			 <RZA1_PINMUX(3, 3, 2)>, /* P3_3 = ET_MDIO */
+			 <RZA1_PINMUX(3, 4, 2)>, /* P3_4 = ET_RXCLK */
+			 <RZA1_PINMUX(3, 5, 2)>, /* P3_5 = ET_RXER  */
+			 <RZA1_PINMUX(3, 6, 2)>, /* P3_6 = ET_RXDV  */
+			 <RZA1_PINMUX(2, 0, 2)>, /* P2_0 = ET_TXCLK */
+			 <RZA1_PINMUX(2, 1, 2)>, /* P2_1 = ET_TXER  */
+			 <RZA1_PINMUX(2, 2, 2)>, /* P2_2 = ET_TXEN  */
+			 <RZA1_PINMUX(2, 3, 2)>, /* P2_3 = ET_CRS   */
+			 <RZA1_PINMUX(2, 4, 2)>, /* P2_4 = ET_TXD0  */
+			 <RZA1_PINMUX(2, 5, 2)>, /* P2_5 = ET_TXD1  */
+			 <RZA1_PINMUX(2, 6, 2)>, /* P2_6 = ET_TXD2  */
+			 <RZA1_PINMUX(2, 7, 2)>, /* P2_7 = ET_TXD3  */
+			 <RZA1_PINMUX(2, 8, 2)>, /* P2_8 = ET_RXD0  */
+			 <RZA1_PINMUX(2, 9, 2)>, /* P2_9 = ET_RXD1  */
+			 <RZA1_PINMUX(2, 10, 2)>,/* P2_10 = ET_RXD2 */
+			 <RZA1_PINMUX(2, 11, 2)>;/* P2_11 = ET_RXD3 */
+	};
+};
+
+&rtc_x1_clk {
+	clock-frequency = <32768>;
+};
+
 &rtc {
 	status = "okay";
 };
@@ -237,6 +233,10 @@ codec: codec@0 {
 	};
 };
 
+&usb_x1_clk {
+	clock-frequency = <48000000>;
+};
+
 &wdt {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.45.2


