Return-Path: <linux-renesas-soc+bounces-20790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 250D0B2E621
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 22:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A99AA1C82D46
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 20:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069802D3A9F;
	Wed, 20 Aug 2025 20:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfmXzynW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249E42C3757;
	Wed, 20 Aug 2025 20:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720434; cv=none; b=eKDa4tBWnvybzxiaBbaY/fS4Lsb2mE93YDTCFNFeBjxMGqvAXuQNbxgkFQU7+AzBE2rBtL9oZSddnNdsPYJZgFIP7ND17FSvEP4qkOBIY/zhdnvZ1I6GVJOhXazss5GPHMd0RGCD0SpjkpvWVHIdiZjdng946UZOC/Otb3b8iwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720434; c=relaxed/simple;
	bh=Ws8jTQKyqqTYfA+0APjfVkTBwo0WOVlc8IJu8YeCj1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8M8v8935VQTo7Pm5kMKlwgE/4yDde4YD0WB4ol7R6ITHAwDgGJiJJ/ouO64XAWaqLPtUi5QrQfkKIefTqPEq6FE93EM+xNpY3lIO8k+DyNK3pp/fNtMm7yJeuZK/QgpQJcA1Beaa/EiCLoQOriUc2IKzcmjFo0+JDtV2I5V7bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfmXzynW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b0b42d5so1837845e9.2;
        Wed, 20 Aug 2025 13:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755720431; x=1756325231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7H/GxMvbuHSprlA/Mp3OkELlz9WON/lPjat++4BqmtQ=;
        b=LfmXzynWs/nMnSIVLakWFxcbBrlnUstHmXX/L6xFpP3mMOitdHzeQBoQzwicEvy8N/
         FFSiwZP0sDRk2sEdE+rYTrms0D3duFOy+Uuzb34RBy61SMojAvQTbFZdJm6Y52jGr7UB
         W2WHlXWPAFmW965SUwpVbv7D+26+QvykmES8D+SyjhwEuYswUFYHPJyualimr32QKCnM
         GbUI1uJKMNtjQt8Flxp19UYlsDWmBQWv0YsFntnA27HG6CpHplT05y+81r8Tlp9w8B+Q
         YUfSXMetDoqU0guXITwMH/N88wiNwwhlNzEu+lES+tPWgkkhSr0RSx1MEM0OJuUvIpNr
         qDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755720431; x=1756325231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7H/GxMvbuHSprlA/Mp3OkELlz9WON/lPjat++4BqmtQ=;
        b=crpay12CguI8AuPfb/HTRzuOaxEa9g8cZjjKEEmfbclcgu+vg7XSNHbVCQax04yFSk
         ezgpX3wQ6phkUmP++Zfm8cLk59iv4TPjMqfIJwln6whgQWP+6RZV0htkDnUB/Z8NE5/+
         fSmPnrZDaW3ajo8n0Oa2Xp6vFoWBXQhnfRX/v014gbIL011yyfJkkPuWXjIGlrm1xpoV
         AA7Tz3uBi9h9xe62gq8/TdhSXk2+zQopoy4Lg9+oyBH6comU635mCjK8yNv2sLjAObrb
         VDIF8YEBmzvx8jzPXLGGREuLeTHugjqGQEOp4Q/nHAw4GsBEUuwMVtFddVcdKqq9GkHQ
         8aJw==
X-Forwarded-Encrypted: i=1; AJvYcCUjk6+XDUw7Io5vvBTsyzdGB/2BEA2JL6PSsl40PGlSasiAzFlTcrb/msOaR5/LBvn0FgG5A/CGLnb1@vger.kernel.org, AJvYcCVVbR7aYrRC2fedMMnaylAUic6YsbkcA90sFqLx+PDNlhYScaO89J3F0cVaP55a+sCtPM15KIp73q1IW1SS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2HM3V7RpuVcdyLiaVNbj9y5mVrZjXewTNTJpn6dVs2uNzG9lv
	docBID/VDGgIFCEf2LkRS3xyKRO0tYknlrMczE6c72r3fccoHJiGx73m
X-Gm-Gg: ASbGncvI+PZ46ugk+HJVe1//ydhUBc7+TyerVE/HdLaprFU32gUGhFBKQkaxR92VHoE
	KIBagkBGFsZzG64tjom5m4saPtbegcpBAuEaJUkYY5tj8NkJrGSSFwXIbOPb93M0PZuH/0PRLdT
	DfDVOf1UQyp4xE6jlswPYbB5ztKmEtgl2R2aPgqR6l8oUsHVCvXVaauxarEqopY7MsEqBbC/nhj
	Q6DKazUXUOEI2icefXE57GrEcJ5gFIXU+2YUAUBcUjKydYJ3EU1UGuVqPaofFerEW/55NBX9EBW
	TUoejgWQRlOO8qLVAf/sa0aXqY1Zf4AvVToZL0RQF6RoK2zr4Ft3XnmPU8NXTOXJs/f79Xzs1tV
	2/wTQBr4NLyBIbuqZzbIC3j5yh/ka845K8lP0POfgsW9Qy/kSwMXAJw1t
X-Google-Smtp-Source: AGHT+IHTvH8pzn6TvbP1I6Y7MRsQXrUvWLNvi3j4XwThxyTEyEWSHPGk0sQ04j5EpjMeHPJRasuKEg==
X-Received: by 2002:a05:600c:8010:b0:456:f1e:205c with SMTP id 5b1f17b1804b1-45b4a1797femr23870665e9.4.1755720431284;
        Wed, 20 Aug 2025 13:07:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077789c92sm8810302f8f.52.2025.08.20.13.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:07:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 7/9] arm64: dts: renesas: rzt2h/rzn2h: Enable eMMC
Date: Wed, 20 Aug 2025 21:06:57 +0100
Message-ID: <20250820200659.2048755-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable eMMC on RZ/T2H and RZ/N2H EVKs. As SDHI0 can be connected to
either eMMC0/SD0 `SD0_EMMC` macro is added.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Added comment regarding DSW17 settings
- Dropped sd0-emmc-prefixes
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  9 +++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 10 +++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 62 +++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index a7b91c96f311..cb659b2a4337 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -8,6 +8,15 @@
 /dts-v1/;
 
 #include "r9a09g077m44.dtsi"
+
+/*
+ * SD0 can be connected to either eMMC (IC49) or SD card slot CN31
+ * Lets by default enable the eMMC, note we need the below SW settings
+ * for eMMC.
+ * SW2[1] = ON; SW2[2] = ON
+ */
+#define SD0_EMMC	1
+
 #include "rzt2h-n2h-evk-common.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index a068661fc442..87e362f6f09f 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -8,6 +8,16 @@
 /dts-v1/;
 
 #include "r9a09g087m44.dtsi"
+
+/*
+ * SD0 can be connected to either eMMC (U33) or SD card slot CN21
+ * Lets by default enable the eMMC, note we need the below SW settings
+ * for eMMC.
+ * DSW5[1] = ON; DSW5[2] = ON
+ * DSW17[5] = OFF; DSW17[6] = ON
+ */
+#define SD0_EMMC       1
+
 #include "rzt2h-n2h-evk-common.dtsi"
 
 /*
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 1b7e16ffe6b6..68d493bf5e8c 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -13,12 +13,31 @@ / {
 	aliases {
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
+		mmc0 = &sdhi0;
 		serial0 = &sci0;
 	};
 
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &extal_clk {
@@ -46,6 +65,34 @@ sci0_pins: sci0-pins {
 		pinmux = <RZT2H_PORT_PINMUX(27, 4, 0x14)>,
 			 <RZT2H_PORT_PINMUX(27, 5, 0x14)>;
 	};
+
+#if SD0_EMMC
+	sdhi0-emmc-iovs-hog {
+		gpio-hog;
+		gpios = <RZT2H_GPIO(2, 6) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "SD0_IOVS";
+	};
+#endif
+
+	sdhi0_emmc_pins: sd0-emmc-group {
+		data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 2, 0x29)>, /* SD0_DATA0 */
+				 <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0_DATA1 */
+				 <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0_DATA2 */
+				 <RZT2H_PORT_PINMUX(12, 5, 0x29)>, /* SD0_DATA3 */
+				 <RZT2H_PORT_PINMUX(12, 6, 0x29)>, /* SD0_DATA4 */
+				 <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* SD0_DATA5 */
+				 <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* SD0_DATA6 */
+				 <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* SD0_DATA7 */
+		};
+
+		ctrl-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
+				 <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
+				 <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* SD0_RST# */
+		};
+	};
 };
 
 &sci0 {
@@ -53,3 +100,18 @@ &sci0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+#if SD0_EMMC
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_emmc_pins>;
+	pinctrl-1 = <&sdhi0_emmc_pins>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	bus-width = <8>;
+	non-removable;
+	mmc-hs200-1_8v;
+	fixed-emmc-driver-type = <1>;
+	status = "okay";
+};
+#endif
-- 
2.51.0


