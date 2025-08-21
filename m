Return-Path: <linux-renesas-soc+bounces-20880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F87B2FFE9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 18:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 295731898310
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 16:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A942E0921;
	Thu, 21 Aug 2025 16:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQjoKhXp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898B92E03F1;
	Thu, 21 Aug 2025 16:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755793201; cv=none; b=jayApoPXIpgO1XLjuXnbXXjRDpshn8l4blDasz9PdI8ZBdrpziUNgKj1q6ODg2CqVT3bsuj36fcM0OmORQqRSlr5vDJc+9K+iqsr4NfMx1FHctUpxVvzH1l0Kdw8VqMwnH75Mqwzf2ySvWdJQ323mnS7lwGxH3wQLCqR1ZFhB8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755793201; c=relaxed/simple;
	bh=ZfDfAV0fw+CxOSYaDy2UJtAi01sCWQXxJ3dBO1z+mY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Om0c+055y3JxRupry/UQumWq6zN49W1YUUyWpqrkHjWIPQEYybL1CKO1tU24vcYrTN9W7eWLgdPXZd7MZVN78U6Fjk0aV3d1jlVOrQlRDfJeqBAJn9erfN0t1uv6c86xow0XQxQrMNkKcVMcsqxEAZmqXcu2GrPDpb1fFWw6PTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQjoKhXp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a15fd04d9so15446825e9.1;
        Thu, 21 Aug 2025 09:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755793198; x=1756397998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUwl4lHULbuFZyTdNB8HgG3miIV3jmFvUoA4fTcloX8=;
        b=BQjoKhXpFE7OtPRuj9VZaNojb8NT4hNVUFjBbukgzlIxfiYINGE8TW9zVMPlpm9RLL
         rwF+9e1DCMdR5iktIecF341GyuuRlLj5BtspL9LSXV+JBpMIsXTL5OCwOXwpznjXn2Bm
         Ap1ftnEQfzoSaHdeqnOFb5m1Pk2Aii/N57GhusKU0RbEKKKHuVf9nG2CRCKUlP3poK6q
         hDtwvqOiqpsIb4CtXK7HkCibzwvz1tvt7mTSYhNdNTzSioxsNz3ZoJ2Fg8/HMOKHPbGJ
         H3sBUX8sh1CxCVgXVJbGEVNQT5Sg/0IleH3lHUYOpL+oQy6mD8kB214rPnwOaxAcpZDq
         FGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755793198; x=1756397998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUwl4lHULbuFZyTdNB8HgG3miIV3jmFvUoA4fTcloX8=;
        b=JHJNvtutftEnYRfJheYcxtdfsa9LQ0tYoPiCPx0iYfUaGuodXcfX4KRMjv4lewzFBp
         ShSXivhJ4ZLOlzXtfsF2Adk8z+s0LvE7zRf4QsAnuLj/HbzqpX56f8JMwNuIE3N0KPzM
         Xou5FL6ZXep8rxnUI8b/H2cuV0jW/+/LFAlNnTXwBB0lbLrKzdbNkZNZzYeaklMtFfQm
         HoDRGWW3A8Tdrj1I0NFD/6Gj+PS8qqhi4m4aCPMj6fPkQVr6buOtP9OmQr0LIk9Vjgnf
         twafH27ExB7AYIiZfkk1zlBsk6HjvySybJnmmNHf7gm7DjJTOoW3emFYlmmW1DUhAs07
         Rk0w==
X-Forwarded-Encrypted: i=1; AJvYcCVcWQdbqPm3wJarDxiIjtupb3bOevnk+XPSQOmHSUibhTJPQxSxuf6ZOUqQ/kKe32v9iggsS1du6KKU9D0/@vger.kernel.org, AJvYcCXz4ZU8eCGRduXloGy+pZZ9Qq/SvmzomU632pmTpOmm9Rib3DFLcsR5gzkYm4zU2LVomeE2QTYYKil1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9WovGxa4pchZjka7F+X7CXnZUG8LV16G6EsYQbk5B4FKHPlRu
	w3NWla+F+FOcL7F+Yjvlpmith6d1ByQZFJ2zmJm4w1hLjY/c7snedSDL
X-Gm-Gg: ASbGncv2VDTNW7oUmzULVMsRvB+Zu5VZgCb8zsC06Vut4LHnMqFNCICaUs/a0r9/Xpb
	zpWmsagKh/F0rjb6KjkL9keqbfsnRwLWZI/XMtLM7iErtcAavWMxUfKrU82m+8Dy5ZB0kIWLnpg
	QlrA++D2JUs2RsbXTPEulae2rLA8qvAqfm/d4eNdyxv0a58OTD2eTFJAgxGRdk361H9aF8dLEBs
	k/ppJLvjMIVBZXUoaIolyDTKUKCqJURJ0spHICbiYsCVM9nBQNFvou4yM7nBuFpf2ZaUF0fC1s1
	5gUHaQwv8TDGlGda5EUkrGkhyYqt6CFBquLRega6lBKxoIxyvBD5FPAdfLoQ2SzsucCs/q1k6ys
	jSer2KWm/J3DRSVRoq+mFl84QRt/SZri65WL41QFIkTCF31LTnhzrjMdY
X-Google-Smtp-Source: AGHT+IEGayJpj9nTFFyGvSf6RL68PjeNxrg5hrK0DqjA3ihENtnuj5/kASPFF0jPAQxpDnDVD0y1tQ==
X-Received: by 2002:a05:6000:24c3:b0:3b7:590d:ac7d with SMTP id ffacd0b85a97d-3c4b4256002mr2058205f8f.1.1755793197600;
        Thu, 21 Aug 2025 09:19:57 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9ed2:95cd:69a:8d10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c4f77e969asm2316464f8f.20.2025.08.21.09.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 09:19:56 -0700 (PDT)
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
Subject: [PATCH 6/6] arm64: dts: renesas: rzt2h-n2h-evk: Enable USB2.0 support
Date: Thu, 21 Aug 2025 17:19:46 +0100
Message-ID: <20250821161946.1096033-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable USB2.0 support on RZ/T2H and RZ/N2H EVKs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 36 ++++++++++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 41 +++++++++++++++++++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 22 ++++++++++
 3 files changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 264f7ddb8cc5..bcd779cd51a2 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -29,6 +29,28 @@
  */
 #define SD1_MICRO_SD	1
 
+/*
+ * USB Pin Configuration:
+ *
+ * This board is equipped with three USB connectors: Type-A (CN80), Mini-B (CN79),
+ * and Micro-AB (CN33). The RZ/T2H SoC has a single USB channel, so either the USB
+ * host interface or the USB function interface can be used, but not both at the
+ * same time.
+ *
+ * By default, the Type-A (CN80) and Mini-B (CN79) connectors are enabled.
+ * Configure the switches as follows:
+ *   - P00_0 - P00_2 (control signals for USB power supply): SW1[5] = ON
+ *   - USB_VBUSIN (used for USB function): SW7[7] = OFF; SW7[8] = ON
+ *   - USB_VBUSEN (used for USB_HF_VBUSEN): SW7[9] = OFF; SW7[10] = ON
+ *
+ * To enable the Micro-AB (CN33) USB OTG connector, set the following macro to 1
+ * and configure the switches as follows:
+ *   - P00_0 - P00_2 (control signals for USB power supply): SW1[5] = ON
+ *   - USB_VBUSIN (used for USB OTG): SW7[7] = ON; SW7[8] = OFF
+ *   - USB_VBUSEN (used for USB_OTG_VBUSEN): SW7[9] = ON; SW7[10] = OFF
+ */
+#define USB_OTG		0
+
 #include "rzt2h-n2h-evk-common.dtsi"
 
 / {
@@ -145,4 +167,18 @@ i2c1_pins: i2c1-pins {
 		pinmux = <RZT2H_PORT_PINMUX(5, 0, 0x17)>, /* SDA */
 			 <RZT2H_PORT_PINMUX(4, 7, 0x17)>; /* SCL */
 	};
+
+#if USB_OTG
+	usb-exicen-hog {
+		gpio-hog;
+		gpios = <RZT2H_GPIO(0, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "usb_exicen_a";
+	};
+#endif
+
+	usb_pins: usb-pins {
+		pinmux = <RZT2H_PORT_PINMUX(0, 0, 0x13)>, /* VBUS */
+			 <RZT2H_PORT_PINMUX(0, 1, 0x13)>; /* OVRCUR */
+	};
 };
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index 80f358fb2d74..b98b0f7c1128 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -33,6 +33,33 @@
  */
 #define SD1_MICRO_SD	1
 
+/*
+ * USB Pin Configuration:
+ *
+ * This board is equipped with three USB connectors: Type-A (CN7), Mini-B (CN8),
+ * and Micro-AB (CN9). The RZ/N2H SoC has a single USB channel, so either the USB
+ * host interface or the USB function interface can be used, but not both at the
+ * same time.
+ *
+ * By default, the Type-A (CN7) and Mini-B (CN8) connectors are enabled.
+ * Configure the switches as follows:
+ *   - P02_2 - P02_3 (control signals for USB power supply): DSW2[6] = OFF;
+ *     - P02_2 (used for VBUSEN): DSW14[5] = OFF; DSW14[6] = ON
+ *     - P02_3 (used for USB_OVRCUR): DSW14[1] = OFF; DSW14[2] = ON
+ *   - USB_VBUSIN (used for VBUS of CN8 for function): DSW16[1] = OFF; DSW16[2] = ON
+ *   - USB_VBUSEN (used for USB_HF_VBUSEN): DSW16[3] = OFF; DSW16[4] = ON
+ *
+ * To enable the Micro-AB (CN9) USB OTG connector, set the following macro to 1
+ * and configure the switches as follows:
+ *   - P02_2 - P02_3 (control signals for USB power supply): DSW2[6] = OFF;
+ *     - P02_2 (used for VBUSEN): DSW14[5] = OFF; DSW14[6] = ON
+ *     - P02_3 (used for USB_OVRCUR): DSW14[1] = OFF; DSW14[2] = ON
+ *   - USB_VBUSIN (used for VBUS of CN9 for OTG): DSW16[1] = ON; DSW16[2] = OFF
+ *   - USB_VBUSEN (used for USB_OTG_VBUSEN): DSW16[3] = ON; DSW16[4] = OFF
+ *   - USB_EXICEN (used for USB OTG EXICEN): DSW14[3] = OFF; DSW14[4] = ON
+ */
+#define USB_OTG		0
+
 #include "rzt2h-n2h-evk-common.dtsi"
 
 /*
@@ -185,4 +212,18 @@ i2c1_pins: i2c1-pins {
 		pinmux = <RZT2H_PORT_PINMUX(3, 3, 0x17)>,
 			 <RZT2H_PORT_PINMUX(3, 4, 0x17)>;
 	};
+
+#if USB_OTG
+	usb-exicen-hog {
+		gpio-hog;
+		gpios = <RZT2H_GPIO(2, 4) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "usb_exicen_a";
+	};
+#endif
+
+	usb_pins: usb-pins {
+		pinmux = <RZT2H_PORT_PINMUX(2, 2, 0x13)>, /* VBUS */
+			 <RZT2H_PORT_PINMUX(2, 3, 0x13)>; /* OVRCUR */
+	};
 };
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 91068042bec0..5c91002c99c4 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -65,10 +65,20 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 #endif
 };
 
+&ehci {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <25000000>;
 };
 
+&hsusb {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &i2c0 {
 	eeprom: eeprom@50 {
 		compatible = "renesas,r1ex24016", "atmel,24c16";
@@ -77,6 +87,11 @@ eeprom: eeprom@50 {
 	};
 };
 
+&ohci {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &pinctrl {
 	/*
 	 * SCI0 Pin Configuration:
@@ -218,6 +233,13 @@ &sdhi1 {
 };
 #endif
 
+&usb2_phy {
+	pinctrl-0 = <&usb_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &wdt2 {
 	status = "okay";
 	timeout-sec = <60>;
-- 
2.51.0


