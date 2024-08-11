Return-Path: <linux-renesas-soc+bounces-7799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE6194E316
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 22:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9191C1C20F4A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 20:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD8D16C876;
	Sun, 11 Aug 2024 20:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrcQURF5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B605516B395;
	Sun, 11 Aug 2024 20:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723409422; cv=none; b=Y1ng79uuqk3VTPZA7lpNtMkGDL0KspLZWi6aJjdw75XODh1wVq1UkKK52O5BRax0is7jWeLloiMyhSaTVt4gLPWDcZXtrawjC58hLhYxHoeLW5vgDd4iaAgXa0z/MgiioLjlLPSSIXx/quE31Ls4nOpiYIJ51tNoNa89UCJpQYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723409422; c=relaxed/simple;
	bh=mmC4Y+QnNhYq0JNsgZGKRMEF4UxfAoIExQ2MZkP0xAU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cep7n2jHiqqBKDlY6Ybib9ykIBF44jwkhe1p/QZ3e60c9ENyAz0BDPpEnG30e5sLhp/cPSru0hJeFb0UMcLvZATmRt1gCzPxfV+KicBJdbor+vzGjQjoaaNOXmTmBYDWBX16mTDsQ7x6fPXQj5qhHAv1xi1E5Xp26K7y/xlhiDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrcQURF5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso36193855e9.3;
        Sun, 11 Aug 2024 13:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723409419; x=1724014219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30MmO5Ubfbl97I5Vw8DCl6ThReVZ4KR6KWgGD+D3XV4=;
        b=lrcQURF5xsPSUbONZob1d2ZAQHCeK1Y92fz7zDC7vnPVPYWsrzDATOBo7GslexUYEM
         PhzOxAVrhhGEMjP5jr8Qe+B3H00B5o2tahxQvZWn5Yt3mWy3Nus4aM4X4A3QD8akog5c
         TOKCon6gy7wMvu0qq48JUW9k3dErviLjwme+CGzhx+lH26tLow6wVFHX4GD27frcCitb
         8tsBddwZIAT4qjY6mydS8CUaUE37vjx69PUQQgo67mUQ/+i8wWPqa6IANC6nUW2Ikf0e
         EAbYJQ2R/RO5Yh1Ql7Jc5iSOsHpPPIg3FaT1gER3z5fTKC1+u7OcL2+N64K56GgJXBCO
         aoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723409419; x=1724014219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30MmO5Ubfbl97I5Vw8DCl6ThReVZ4KR6KWgGD+D3XV4=;
        b=Bn4NTeCaSVOXgw6U3Fb9uU1lx4f5QSu2iJL0d7dIjpRk8EAiwQH8Sw37bpIXDChbTg
         dCwHP4MPjHN9IbWcq2C7Iw1jpNsZRd4txkzhoQ9evypfsLXbS0Va0vD/9Jc0C8OFCuF5
         wh5qeROJFnr5UImzPzqi99AhbRU0we5jJ8eZ5pHHkIoYHYTk1kMzUO7y/6XOHa2EbXeY
         wgIepRF2jZB2Ai8/6kCDZP5qzPVqmodVFwll2SFEE8iwKMj+xRkmbIqG322RlFcI6hBz
         7n0mKpKaJjkdwLSsoIhr4Q81KD+PdMykBbOPOppDjpwr9X+FyjFiWN5dRE7JVfDXBr5o
         0c3A==
X-Forwarded-Encrypted: i=1; AJvYcCWJqjfYOHtN52CfNpDVVa0ZxMQYo17pMxG50UMm/+PvkSAsAjtsomjv6CE93YMuD/6n7E8Ggs1HF5wIlQXUo3+LWNGUJGUF+mxnyrp86lTTaiBV+78M8nLqkCfO/RPGPwSs3wAav1JPuA==
X-Gm-Message-State: AOJu0Yx1a3LP/301G81etPmnmFoFOEW9lgWWEKFTWkFBWK9YyWATjvsk
	/5IDSYXxZxVgTG77hV990seSbMjhOS3ujBBErolfWQk/d8zdkOIA
X-Google-Smtp-Source: AGHT+IFT8d7CXvF+D90W1XMEdbvDOsH4y5za/IYafgkmyc4tL7ZlQ5EEZ4RtZPC599clogZUBUcSTw==
X-Received: by 2002:a05:600c:1c81:b0:426:6857:3156 with SMTP id 5b1f17b1804b1-429c3a52de7mr68603365e9.27.1723409418941;
        Sun, 11 Aug 2024 13:50:18 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c750f0absm76421845e9.17.2024.08.11.13.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 13:50:18 -0700 (PDT)
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
Subject: [PATCH v2 7/8] arm64: dts: renesas: r9a09g057h44-gp-evk: Enable OSTM, I2C, and SDHI
Date: Sun, 11 Aug 2024 21:49:54 +0100
Message-Id: <20240811204955.270231-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable OSTM0-OSTM7, RIIC{0,1,2,3,6,7,8}, and SDHI1 (available on the SD2
connector) on the RZ/V2H GP-EVK platform.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- New patch
---
 .../boot/dts/renesas/r9a09g057h44-gp-evk.dts  | 191 ++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
index 593c48181248..11c13c85d278 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+#include <dt-bindings/gpio/gpio.h>
 #include "r9a09g057.dtsi"
 
 / {
@@ -14,6 +16,14 @@ / {
 	compatible = "renesas,gp-evk", "renesas,r9a09g057h44", "renesas,r9a09g057";
 
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		mmc1 = &sdhi1;
 		serial0 = &scif;
 	};
 
@@ -32,17 +42,186 @@ memory@240000000 {
 		device_type = "memory";
 		reg = <0x2 0x40000000 0x2 0x00000000>;
 	};
+
+	reg_3p3v: regulator1 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vqmmc_sdhi1: regulator-vccq-sdhi1 {
+		compatible = "regulator-gpio";
+		regulator-name = "SDHI1 VccQ";
+		gpios = <&pinctrl RZG2L_GPIO(10, 2) GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+	};
 };
 
 &audio_extal_clk {
 	clock-frequency = <22579200>;
 };
 
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&i2c6 {
+	pinctrl-0 = <&i2c6_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&i2c7 {
+	pinctrl-0 = <&i2c7_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&i2c8 {
+	pinctrl-0 = <&i2c8_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&ostm0 {
+	status = "okay";
+};
+
+&ostm1 {
+	status = "okay";
+};
+
+&ostm2 {
+	status = "okay";
+};
+
+&ostm3 {
+	status = "okay";
+};
+
+&ostm4 {
+	status = "okay";
+};
+
+&ostm5 {
+	status = "okay";
+};
+
+&ostm6 {
+	status = "okay";
+};
+
+&ostm7 {
+	status = "okay";
+};
+
 &pinctrl {
+	i2c0_pins: i2c0 {
+		pinmux = <RZG2L_PORT_PINMUX(3, 0, 1)>, /* I2C0_SDA */
+			 <RZG2L_PORT_PINMUX(3, 1, 1)>; /* I2C0_SCL */
+	};
+
+	i2c1_pins: i2c1 {
+		pinmux = <RZG2L_PORT_PINMUX(3, 2, 1)>, /* I2C1_SDA */
+			 <RZG2L_PORT_PINMUX(3, 3, 1)>; /* I2C1_SCL */
+	};
+
+	i2c2_pins: i2c2 {
+		pinmux = <RZG2L_PORT_PINMUX(2, 0, 4)>, /* I2C2_SDA */
+			 <RZG2L_PORT_PINMUX(2, 1, 4)>; /* I2C2_SCL */
+	};
+
+	i2c3_pins: i2c3 {
+		pinmux = <RZG2L_PORT_PINMUX(3, 6, 1)>, /* I2C3_SDA */
+			 <RZG2L_PORT_PINMUX(3, 7, 1)>; /* I2C3_SCL */
+	};
+
+	i2c6_pins: i2c6 {
+		pinmux = <RZG2L_PORT_PINMUX(4, 4, 1)>, /* I2C6_SDA */
+			 <RZG2L_PORT_PINMUX(4, 5, 1)>; /* I2C6_SCL */
+	};
+
+	i2c7_pins: i2c7 {
+		pinmux = <RZG2L_PORT_PINMUX(4, 6, 1)>, /* I2C7_SDA */
+			 <RZG2L_PORT_PINMUX(4, 7, 1)>; /* I2C7_SCL */
+	};
+
+	i2c8_pins: i2c8 {
+		pinmux = <RZG2L_PORT_PINMUX(0, 6, 1)>, /* I2C8_SDA */
+			 <RZG2L_PORT_PINMUX(0, 7, 1)>; /* I2C8_SCL */
+	};
+
 	scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
 	};
+
+	sd1-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZG2L_GPIO(10, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd1_pwr_en";
+	};
+
+	sdhi1_pins: sd1 {
+		sd1_data {
+			pins = "SD1DAT0", "SD1DAT1", "SD1DAT2", "SD1DAT3";
+			input-enable;
+			renesas,output-impedance = <3>;
+			slew-rate = <1>;
+		};
+
+		sd1_cmd {
+			pins = "SD1CMD";
+			input-enable;
+			renesas,output-impedance = <3>;
+			slew-rate = <1>;
+		};
+
+		sd1_clk {
+			pins = "SD1CLK";
+			renesas,output-impedance = <3>;
+			slew-rate = <1>;
+		};
+
+		sd1_cd {
+			pinmux = <RZG2L_PORT_PINMUX(9, 4, 14)>; /* SD1_CD */
+		};
+	};
 };
 
 &qextal_clk {
@@ -59,3 +238,15 @@ &scif {
 
 	status = "okay";
 };
+
+&sdhi1 {
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-1 = <&sdhi1_pins>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sdhi1>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
-- 
2.34.1


