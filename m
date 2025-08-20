Return-Path: <linux-renesas-soc+bounces-20791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0B3B2E636
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 22:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21F68AA0941
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 20:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34BFB2D4806;
	Wed, 20 Aug 2025 20:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bo08K/m7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558882D3749;
	Wed, 20 Aug 2025 20:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720436; cv=none; b=gQcvW+xSSZbT4Sy6nIg3WOovHxD2U4aRsZzPhM37Sw31gIYdlhYyJGmNO/FqZQCS3hahknLHXrQThT3SOn6B5uzQrcQpI4SgcFNg9zXIYUZobenoizscSbL+TlD6gq1vunD5DojMXbb/HKiElLPFEBjvzIWbgatA4AWdZ7SZk7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720436; c=relaxed/simple;
	bh=x0igbkI1un3h0zS5FCkDZMvgkO9NUTLLsQH2Sgq5+Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rI5Vl2dlLn74HHVpU/Vqu32JbsRPf8QPRfZKVqP7IDngB6y7pRGnkOvulKPQC8vigdmpmIy0EG7zdOFV2SjbbvWof2joEyLkv6SjNLlJH2CkcBuC+Vwo9HBRYwxnpuQiH8TxPyBdAc1FNtceiRpWEvFzbJy8/VacFL34UhNud/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bo08K/m7; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b9e41669d6so179250f8f.2;
        Wed, 20 Aug 2025 13:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755720433; x=1756325233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SscIipCEZUPYeWjGIUiWUz+/QI92e0SxsokxWhFEKUM=;
        b=bo08K/m71QwGvv3CisZklpP8NPqmp4BBEYVXhsd+GKGNIDeKkeoca6xXd1Uzy4zrKt
         N3dLY7NdVcpcMktU4hMgtTT0CWIjrt+nHQJNKg7YgTnroInYx8adRv4WCaN9YM30UTSw
         /juRd2YWe4PDt/48qHq6nnuaD48vh6IIwhEB1PmL3rCkfsHnCrpDDm6uW4HHTffaaueO
         zJfLRkhojHlmlS+BY1IV0+2ylr7INeaQKaHOxmUbSGcl4ZZ+am4FL73LOzJ18k1ea1Md
         HDulI9LHtrjpvb4JhlH5bWUrKBZKGDUy1nWcpTJupJb+FUn92VUK/Bf1Jzl5O4/9q0eK
         jEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755720433; x=1756325233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SscIipCEZUPYeWjGIUiWUz+/QI92e0SxsokxWhFEKUM=;
        b=DeYPuviQ0eGyByk+6keKpybXD8jhAstj8wSglK/ceFxDjGqq2Ux5+/LiRr7vdIi/g/
         dgbsT3n8oc7QM8rMwXEmnjA9VFDUblu/DpYDg8mbokyDVYTwH01gG259SoOFlG8e6r4V
         8vY/KxuqsqvDL5mg4NldDf7GuVhtcgsJx08z4zy4W0FNSr3l+Xhao/hLZi3mZaEt9qHm
         aMU9CtAyz3VpiOq2XIR76R795jjLDwos5iK367XspptqWBuX4tadNtAQAApvY03l+NCu
         wW7dXLVBJWxTUoauW769UxICA4D+ySOXU99mcFzF4WH4YdZPmXSqGa2Fvxh2ZOXUowHs
         7mwA==
X-Forwarded-Encrypted: i=1; AJvYcCWfWn6lcJAZqUCI0T7h9dkVSq3Z5p7jvAW0dzaanP1gzR6y4FksE8WtR3rgYevFOZjdkNqE6kq2J6hfMrYI@vger.kernel.org, AJvYcCXL0xJMYbOCDzeCz/4H+yQXPrsppxSNhoOESKN0CQwEk6yMiNhrqC28micmA4xJpEUsZq2UJm06o6pj@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdg2F7CEldUP9TfbUjyiGakQVjqTGw5X2GmGjQHbwW6iimc/bk
	9cqGPjAwtuWlXHsLy174t46gaWeXiMV6v8f5s78v7Gbv3zEzAIibYK0ycKOZY/vl
X-Gm-Gg: ASbGncvfeyq4pMucQpvGoLzHtruce0qJz3QXKnmj15fZFp1gmhbdWjPTtgiX1+Cp0/5
	amn6OJFWGWPCwQNLQk4HaWr/edcFJ+68H9X3vbaa/5AkXqLyIQ5l+qZ4D/YBOS+PlUjh2+83bS2
	zLCepzaTEKpMoJWmE71JENbAN/C/0e/2xozfIEGBJTldtFEqDl9obHX/upL0A9Je8Zk32Umi+Ry
	mI72w1twtlpwiWsZubNVm68JSEB9+s5mMGtx49Kwd3gklACyGUBASo0xGFovReAv3RZzkHDpJNd
	AYcKgz8qriQvgZ1jFxNwVZMpdOki+mHfUu9mvdPmA3PGxfNpE1RoYZxwcVYwTTDgxLGK9oQwOsp
	fuN0Jq/IrfDRokngFJ5gKVnhpKaPXBFntdTF4j9PW2CsOl6sxAOGbl5iV
X-Google-Smtp-Source: AGHT+IGe5rVcdLN8eimijCMp1Sbfq4WO7h/ghNUNpwpyakIF/7Wb1rUZuCZ3C4K/YeKV59B2PZmCDw==
X-Received: by 2002:a05:6000:1886:b0:3c4:39cc:35c with SMTP id ffacd0b85a97d-3c49727492cmr62481f8f.43.1755720432474;
        Wed, 20 Aug 2025 13:07:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077789c92sm8810302f8f.52.2025.08.20.13.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:07:11 -0700 (PDT)
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
Subject: [PATCH v2 8/9] arm64: dts: renesas: rzt2h/rzn2h: Enable MicroSD card slot
Date: Wed, 20 Aug 2025 21:06:58 +0100
Message-ID: <20250820200659.2048755-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Enable MicroSD card slot which is connected to SDHI1 on the RZ/T2H and
RZ/N2H EVKs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Added alias for mmc1
- Dropped sd1-prefixes
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  9 ++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  6 +++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 51 +++++++++++++++++++
 3 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index cb659b2a4337..37330c837f64 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -17,6 +17,13 @@
  */
 #define SD0_EMMC	1
 
+/*
+ * P17_4 = SD1_CD; SW2[3] = ON
+ * P08_5 = SD1_PWEN; SW2[3] = ON
+ * P08_6 = SD1_IOVS; SW2[3] = ON; SW5[3] = OFF; SW5[4] = ON
+ */
+#define SD1_MICRO_SD	1
+
 #include "rzt2h-n2h-evk-common.dtsi"
 
 / {
@@ -49,6 +56,7 @@ led-2 {
 			function-enumerator = <2>;
 		};
 
+#if (!SD1_MICRO_SD)
 		led-3 {
 			/* SW2-3: OFF */
 			gpios = <&pinctrl RZT2H_GPIO(8, 5) GPIO_ACTIVE_HIGH>;
@@ -56,6 +64,7 @@ led-3 {
 			function = LED_FUNCTION_DEBUG;
 			function-enumerator = <3>;
 		};
+#endif
 
 		led-4 {
 			/* SW8-3: ON, SW8-4: OFF */
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index 87e362f6f09f..87178933bee8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -18,6 +18,12 @@
  */
 #define SD0_EMMC       1
 
+/*
+ * P17_4 = SD1_CD; DSW5[3] = ON; DSW19[1] = OFF; DSW19[2] = ON
+ * P08_6 = SD1_IOVS; DSW5[3] = ON
+ */
+#define SD1_MICRO_SD	1
+
 #include "rzt2h-n2h-evk-common.dtsi"
 
 /*
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 68d493bf5e8c..34572630ecbe 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -14,6 +14,7 @@ aliases {
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
 		serial0 = &sci0;
 	};
 
@@ -38,6 +39,18 @@ reg_3p3v: regulator-3p3v {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+#if SD1_MICRO_SD
+	vccq_sdhi1: regulator-vccq-sdhi1 {
+		compatible = "regulator-gpio";
+		regulator-name = "SDHI1 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pinctrl RZT2H_GPIO(8, 6) GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+	};
+#endif
 };
 
 &extal_clk {
@@ -93,6 +106,30 @@ ctrl-pins {
 				 <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* SD0_RST# */
 		};
 	};
+
+#if SD1_MICRO_SD
+	sdhi1-pwen-hog {
+		gpio-hog;
+		gpios = <RZT2H_GPIO(8, 5) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "SD1_PWEN";
+	};
+#endif
+
+	sdhi1_pins: sd1-group {
+		data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(16, 7, 0x29)>, /* SD1_DATA0 */
+				 <RZT2H_PORT_PINMUX(17, 0, 0x29)>, /* SD1_DATA1 */
+				 <RZT2H_PORT_PINMUX(17, 1, 0x29)>, /* SD1_DATA2 */
+				 <RZT2H_PORT_PINMUX(17, 2, 0x29)>; /* SD1_DATA3 */
+		};
+
+		ctrl-pins {
+			pinmux = <RZT2H_PORT_PINMUX(16, 5, 0x29)>, /* SD1_CLK */
+				 <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* SD1_CMD */
+				 <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* SD1_CD */
+		};
+	};
 };
 
 &sci0 {
@@ -115,3 +152,17 @@ &sdhi0 {
 	status = "okay";
 };
 #endif
+
+#if SD1_MICRO_SD
+&sdhi1 {
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-1 = <&sdhi1_pins>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vccq_sdhi1>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+#endif
-- 
2.51.0


