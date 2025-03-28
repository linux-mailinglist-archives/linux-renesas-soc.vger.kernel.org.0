Return-Path: <linux-renesas-soc+bounces-14999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03757A74DE1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 16:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D2C317B6B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 15:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2751C5D7F;
	Fri, 28 Mar 2025 15:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FyyjuU44"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A39A1A0BF1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Mar 2025 15:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175992; cv=none; b=R6Tu1Vx88PRZTqlBcNl273rSxxVsXIMEyWqHtBR4rusUHhjgP93DMfxdWUOSzSFcQjuwisHHxXA9TWMsCMrnYabjnunGk9ySTLmggqoaVa3dHSXPipZOsZ7q+ucx9BaLv1sWzWPq29N505GssaNvKNNzJIYCT1mkRqDZtDkt2Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175992; c=relaxed/simple;
	bh=D3LsNOB0pXcrNPWazU5BAzrFvHL7lD46hnhAuY5uZX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3i7UMH/Ze3Yc5DopJK2iLbnefLNtaU/fhE7AJ0IZ78/8EQuws/pziO6avrH5OuV8GmOte49XODHHTe309JEqFTx0ZpFa3FLHaz/sgyavu9FOn0YEGopVESXnfMBYdtnkQbPYDG7JKc8kssbM3KLC7RXBxEjlJcjmKs5iWk0wqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FyyjuU44; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=oChmzxKxLjZEK/kZPcsn/jDIGGWyUlkc6XPmpbYrMOc=; b=FyyjuU
	44TKS1ty5J7r8q+uyKm9zWY/CCGu5ZmbIKBbosHj8t4vB4v9zob7//MdSVU+aQ21
	Bdq1tFtGiLDh0/h9WZhvDKPK+V9U11K1jor9WMmyyktyhpbszLt7nfize4NdVSx7
	9fJq3r5ipgSI5skcTjMhWhzVZuJHYpV3cyN/XK2VRqpaFZ/Z+PRPohV/XH4hn9Wf
	ZHHqlRcAvgmmco1fcXpx+j9ENQQtBmxBWIhJJ2vZl5ysRwcLgKoOfTpyG4ov42Xn
	+qU4ThsTOwxE0RuPipA4k2XlwoepsIyfWYopztewUK3gD+fBGbZ2p7cNFdztTvdh
	bT8OJIc7zQZYAAUQ==
Received: (qmail 298947 invoked from network); 28 Mar 2025 16:33:07 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Mar 2025 16:33:07 +0100
X-UD-Smtp-Session: l3s3148p1@eX+DyWgx8GxtKjE8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/5] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe I2C bus
Date: Fri, 28 Mar 2025 16:31:35 +0100
Message-ID: <20250328153134.2881-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250328153134.2881-7-wsa+renesas@sang-engineering.com>
References: <20250328153134.2881-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Schematics mention a 24cs64 on the bus, but I definitely have only a
24c64. So, it is only mentioned as a comment.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../dts/renesas/r9a06g032-rzn1d400-db.dts     | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index 31cdca3e623c..d50a1d91e968 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -57,6 +57,44 @@ fixed-link {
 	};
 };
 
+&i2c2 {
+	pinctrl-0 = <&pins_i2c2>;
+	pinctrl-names = "default";
+	status = "okay";
+	clock-frequency = <400000>;
+
+	pca9698: gpio@20 {
+		compatible = "nxp,pca9698";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		/* configure the analog switch to let i2c2 access the eeprom */
+		max4662-in1-hog {
+			gpio-hog;
+			gpios = <16 0>;
+			output-high;
+		};
+		max4662-in2-hog {
+			gpio-hog;
+			gpios = <17 0>;
+			output-low;
+		};
+		max4662-in3-hog {
+			gpio-hog;
+			gpios = <18 0>;
+			output-low;
+		};
+	};
+
+	/* Some revisions may have a 24cs64 at address 0x58 */
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		pagesize = <32>;
+		reg = <0x50>;
+	};
+};
+
 &mii_conv4 {
 	renesas,miic-input = <MIIC_SWITCH_PORTB>;
 	status = "okay";
@@ -114,6 +152,12 @@ pins_eth4: pins_eth4 {
 		bias-disable;
 	};
 
+	pins_i2c2: pins_i2c2 {
+		pinmux = <RZN1_PINMUX(115, RZN1_FUNC_I2C)>,
+			 <RZN1_PINMUX(116, RZN1_FUNC_I2C)>;
+		drive-strength = <12>;
+	};
+
 	pins_mdio1: pins_mdio1 {
 		pinmux = <RZN1_PINMUX(152, RZN1_FUNC_MDIO1_SWITCH)>,
 			 <RZN1_PINMUX(153, RZN1_FUNC_MDIO1_SWITCH)>;
-- 
2.47.2


