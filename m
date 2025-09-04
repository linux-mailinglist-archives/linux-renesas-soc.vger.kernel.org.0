Return-Path: <linux-renesas-soc+bounces-21322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5A5B437E0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 12:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CA4A166788
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 10:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622DA2EC08B;
	Thu,  4 Sep 2025 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ao9mV0Tr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDC429AAEA;
	Thu,  4 Sep 2025 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756980282; cv=none; b=dTYhUB/Od+Y/CNo1KGYiuM4kE0xnYWWf5OgPnqa4m1OKU14n8FzE7vfhHyDX2WXIFrPmoq4rDtB++z3hjUuflDaYCzecIm8vq5scfVv6XWBpos5P4ax0vRjR19eowikyA70fghf6I30NQTSP8MDvhRAY5zxtxhlZbRzMVoJeRpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756980282; c=relaxed/simple;
	bh=e8sCNKLHXZ3wRWcF/RMe9GH1E1HkP51BQPrLQvBj+Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SZyH+g3b99jk/QyGPO0kIkGqaCS68GwXcviPi/nZn/dzocTJ3q4/7wbioeGFpMM6urafboTQJoGReIcv+BLUcd60tHYoenGtNbJlJwuCZmDfwqbHVovdTMTtSDdTpCQmZyUVQ+ded9HRcOjpCxnL/sItDJ8zJ1s7sQBdxfjt4PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ao9mV0Tr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b7da4101fso2776605e9.3;
        Thu, 04 Sep 2025 03:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756980279; x=1757585079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ek9EYKXS2K219Y+/XLtHfNLMKPr93OF7TadNV0PAfFs=;
        b=Ao9mV0Tr8Lv51GS5B4ntczdKBvYr2c09EZEF8g07rpS3ut6hh5qJckUIFs37QSW4a3
         5SuNohbY6wzX0iMkyoKT6r/Dd4/h+7/XLM1hxvhnmrc321XjPhP5+pMINJnEoIP+Gslm
         6YwhZgORMtc4QoJg5X6XMrK+n1W9lngdTUi7z54JVpNhRHgFEV5XmJmtzI8Yq7CPt8ff
         cMnDgFf5+iZ2XYjmAVfMwe2rUzHKIWyEtl8ZT5gxquXqFdyMQZs1mVElG1yMXw5Z3Jfy
         Adqclcnder1EyGgFqNxfZmLDuNya+dUGZAuGZWSyyMlZPg0TI8YPayJzKnVdhLoIYn9d
         5maQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756980279; x=1757585079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ek9EYKXS2K219Y+/XLtHfNLMKPr93OF7TadNV0PAfFs=;
        b=kmOPyXoCxdioZc3hdfvHoy+VGrUVsElLmtqMy4yN0IJjSxuO0CgWjMWN5F1JoCW+vb
         5+3nhCh1StnEPoFpO9PufpAg9yk4ZKThoBthxyzvqDrb6csj81w0MPrYafFA8Lxogq88
         igMle0wIVH9S5e2q3aAmvbaoX66Xxw0TW8+e85oGrHxBtt5rNPG/mNK+duLtA+g1Nfqm
         gP6sDW+rM3/jNsPVs7/jHeKnh4BfwGm27ZMCEXQquRKQU+sqzf6/LfyaqVwMqzY45UMo
         lc+zMW0aHwhDOsOFCwDijuwHYkcX2nPtmoS/MWV9uyVyWmTIbYnRmNpcBHdzLQyl3vHl
         1GVA==
X-Forwarded-Encrypted: i=1; AJvYcCVkS06iUA2tuKm3ePPhAotUfyDcs1wIfHhc8vBCWvqncAw44Ms9T7jvbkPuU6D5+YBb3XVZbOkQSUrQjRh6@vger.kernel.org, AJvYcCXzsNIkqYCqnvW0D6JUjkaeaaYEcJcmuRxPrGiozreZ3/BVcTvuLonATMtnLq+COMVbdIIzBqtOeXfx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx58Rb/1tJsZuxHt2bNcpS4cfrsYD4bo86QA52F+F2K7zhaL9+1
	QRveht7BKV9Q0mFmqj9XuzMwSLxLO+csY+6NZo9GnG6qB2tGF/XC+8fG
X-Gm-Gg: ASbGnctiPRqUA3OIH9nd2D+3BgAuQaBXOHEGMW7md89rhOeL+tjKDGZoXfUszCnGGr7
	1bHEFS3vTbLUXDcUUnAea3gi1wtKcWiJgHxJLrPZ9rzHtKrh+/NDOQfSrVWVwxiK/9pnre/MKvg
	kqUjiIEQeIgEQXAG7X7CP8UzyLIV52kLJhNN21n8CH6zyaD0USMecKY5NoGe41uwE97D0sjxr1j
	8315aQTxZbJYOfXkfGU4Z9bz6wcQoaRbcfjiC3NDk4C9frj8OODEIebDUm2kf6GwLex+e2x1YEQ
	74aGIyUkGLs29o35/jXLzqyF+BXdTEN4OJ1hUaNH4B6u8bi2blXFR50STP8emiqNkotyTzzBjNB
	u0o342uwrnWzRK3A1VdhYFTH2SMipWvMokxnMfZC4hXlvVJkMPrUP1vI/Wg==
X-Google-Smtp-Source: AGHT+IH/n4569WVp7OYtaqAxS3++rY5OHrFxGS8luoF7L0HnUjYxEiq5MoQT0FbLi9B/HY0tyzRYuA==
X-Received: by 2002:a05:600c:8b8b:b0:45c:b609:cbc5 with SMTP id 5b1f17b1804b1-45cb609cea7mr42663535e9.20.1756980278393;
        Thu, 04 Sep 2025 03:04:38 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e68c83asm301288725e9.20.2025.09.04.03.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:04:37 -0700 (PDT)
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
Subject: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Enable USB2.0 support
Date: Thu,  4 Sep 2025 11:04:35 +0100
Message-ID: <20250904100435.4033858-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
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
v1->v2:
- Reflowed comments to adhere to 80 char width.
- Updated comment about simultaneously using USB host and function interfaces.

Note, this patch was originally part of series [0], rest of the
patches have been accepted so just sending this one.
[0] https://lore.kernel.org/all/20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 36 ++++++++++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 41 +++++++++++++++++++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 22 ++++++++++
 3 files changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 264f7ddb8cc5..2bf867273ad0 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -29,6 +29,28 @@
  */
 #define SD1_MICRO_SD	1
 
+/*
+ * USB Pin Configuration:
+ *
+ * This board is equipped with three USB connectors: Type-A (CN80), Mini-B
+ * (CN79), and Micro-AB (CN33). The RZ/T2H SoC has a single USB channel, so
+ * either the USB host interface or the USB function interface can be used,
+ * but not both simultaneously when using the CN79 and CN80 connectors.
+ *
+ * By default, the Type-A (CN80) and Mini-B (CN79) connectors are enabled.
+ * Configure the switches as follows:
+ *   - P00_0 - P00_2 (control signals for USB power supply): SW1[5] = ON
+ *   - USB_VBUSIN (used for USB function): SW7[7] = OFF; SW7[8] = ON
+ *   - USB_VBUSEN (used for USB_HF_VBUSEN): SW7[9] = OFF; SW7[10] = ON
+ *
+ * To enable the Micro-AB (CN33) USB OTG connector, set the following macro
+ * to 1 and configure the switches as follows:
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
+		pinmux = <RZT2H_PORT_PINMUX(0, 0, 0x13)>, /* VBUSEN */
+			 <RZT2H_PORT_PINMUX(0, 1, 0x13)>; /* OVRCUR */
+	};
 };
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index 80f358fb2d74..084b3a0c8052 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -33,6 +33,33 @@
  */
 #define SD1_MICRO_SD	1
 
+/*
+ * USB Pin Configuration:
+ *
+ * This board is equipped with three USB connectors: Type-A (CN7), Mini-B
+ * (CN8), and Micro-AB (CN9). The RZ/N2H SoC has a single USB channel, so
+ * either the USB host interface or the USB function interface can be used,
+ * but not both simultaneously when using the CN7 and CN8 connectors.
+ *
+ * By default, the Type-A (CN7) and Mini-B (CN8) connectors are enabled.
+ * Configure the switches as follows:
+ *   - P02_2 - P02_3 (control signals for USB power supply): DSW2[6] = OFF;
+ *     - P02_2 (used for VBUSEN): DSW14[5] = OFF; DSW14[6] = ON
+ *     - P02_3 (used for USB_OVRCUR): DSW14[1] = OFF; DSW14[2] = ON
+ *   - USB_VBUSIN (used for VBUS of CN8): DSW16[1] = OFF; DSW16[2] = ON
+ *   - USB_VBUSEN (used for USB_HF_VBUSEN): DSW16[3] = OFF; DSW16[4] = ON
+ *
+ * To enable the Micro-AB (CN9) USB OTG connector, set the following macro
+ * to 1 and configure the switches as follows:
+ *   - P02_2 - P02_3 (control signals for USB power supply): DSW2[6] = OFF;
+ *     - P02_2 (used for VBUSEN): DSW14[5] = OFF; DSW14[6] = ON
+ *     - P02_3 (used for USB_OVRCUR): DSW14[1] = OFF; DSW14[2] = ON
+ *   - USB_VBUSIN (used for VBUS for OTG): DSW16[1] = ON; DSW16[2] = OFF
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
+		pinmux = <RZT2H_PORT_PINMUX(2, 2, 0x13)>, /* VBUSEN */
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


