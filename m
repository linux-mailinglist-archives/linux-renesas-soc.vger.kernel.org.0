Return-Path: <linux-renesas-soc+bounces-8449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79891962781
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 14:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DEF91C20DD5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8111891D2;
	Wed, 28 Aug 2024 12:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iU3EUikB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84237188CA9;
	Wed, 28 Aug 2024 12:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848920; cv=none; b=rkCZ3bzX0gLJpLghBIJgZnSaCKEsJZD3cBuJnC1GnLQej4y2TrwJfzulXGhOY40iG7+Y8B5bF74rzNSthukfYjgRN6qw5DXOdVCl7vAuX+ahRHCx/Z9/a40eHoq6vx5/fFN6w/UvwKJ/OizFIDOIMJdN85eV9M0WLg8zas0CyS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848920; c=relaxed/simple;
	bh=nRTr1oWr/442qRj5Q2+Qr4tSqMNPopz3D8Upb/5lufI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DDEpfCyazf0D93ItBwaFwY6Pc+5npLqCiaIW4U9IMulbP155pAQ5fzs6K4P1Jj0nG0/mpg8fnC0zoxPdED/9RIPKx/74FWWfOgw37EE59vEor9SIOf9ZHFW4Xe8vbTo5bvs8UXLH+var4d0V4JizRjRzjlQZnZCrIeAIdOIjHzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iU3EUikB; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-371b015572cso4948847f8f.1;
        Wed, 28 Aug 2024 05:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724848917; x=1725453717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvQccBVm3738UiblCVN2oFX4LTmF1FA+Xugh23YbRpQ=;
        b=iU3EUikB6Gs6W1TPxpWRjALeptw+m6CTpsGSrCPPCZSwV/Rp7M87cR+75K3fTzcrrT
         OkBjafx8AmAf5d245Ox1YqR9TRZvW7kmWE1MWRV2SdyZ0dyrLlpf9XlflP8lThclxwWY
         thMEx7g+giCC5ucsRHHUbBt4uTEHyu+5WCy5CELXOvgSy15UI6UJvVlQTm47Vr9YjYb2
         Co7u+5N7NscdxucRjUS3l3DVMdud9fyuPY9JrPZLNSUgq9AvctyoRMRH5hxkHMG1bLRa
         WApGsf5MUvmKa/HYkW99V4mD9pX0NumvZgMYs1dZ1yiPhvc8um4I1bmi8BtyN+wajjwc
         vqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724848917; x=1725453717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvQccBVm3738UiblCVN2oFX4LTmF1FA+Xugh23YbRpQ=;
        b=HKx25r/40g6pz1T7BwVXYfAZOmPhkAG1b3ZLLiZ8lJ2K/tdzHuYedzxucN7dPk34rv
         7KSOoovCwrkSJ83uVOPNCgb6YkM63VkVpfJFRPxEGBEyi+ZTHYFys32xYR+XBsUjdd5G
         VaS4tMROdMH4rCQkBu6p+S0L0GSgh8xqCOnVniw3YnpbntAVajyOd4Ufn56d/1PtiRzg
         ET3Ukm7lz0SyqxwtaUl6IeH6JV3QcYUJ2YFYiSEwfwEIznlL+e65MFi3CSVKwXB+h296
         VPImmKWNoa7oRbUywRPITCdt0s7TWPSl65j+B137qjpsUV4TnCKlG1EUdS6h2uiOi5M6
         WQ0A==
X-Forwarded-Encrypted: i=1; AJvYcCVfbJ2ejgpJqaVd4Hm7I5UsqwHarHSppCRP3SxJ1DzHhzRB0lf/982hOMuwdCX9vpLidtZSUGo05u7f@vger.kernel.org, AJvYcCXIqAnc8fBddh7lVu1zy8Pc/W6GnHeHnXYf8bv8r+lTW8cdLOLUxkqjB8+9mQu7V/txucURAXI4ZP24nI2f@vger.kernel.org
X-Gm-Message-State: AOJu0YyPM0+MWdde9yhQj80VOwZPPwW57XdZiGGSeCc65F5c66Rc+O2G
	AuP/wKFAEaLnZUM4Ej4e1grpRT8AYd776fXwzmK6ARL8Pv0YIQcw
X-Google-Smtp-Source: AGHT+IGhIMmLiPZTmFRL9SONv9U4U9hyJJeTPLW5n4XpsGBr61H3rRJHRy+dCftVbN6qWA/WQMlJmg==
X-Received: by 2002:a5d:4451:0:b0:371:88f6:7f98 with SMTP id ffacd0b85a97d-373118c83bdmr12974763f8f.38.1724848916780;
        Wed, 28 Aug 2024 05:41:56 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813c5edsm15508226f8f.31.2024.08.28.05.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 05:41:56 -0700 (PDT)
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
Subject: [PATCH v4 8/9] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable OSTM, I2C, and SDHI
Date: Wed, 28 Aug 2024 13:41:33 +0100
Message-Id: <20240828124134.188864-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable OSTM0-OSTM7, RIIC{0,1,2,3,6,7,8}, and SDHI1 (available on the SD2
connector) on the RZ/V2H EVK platform.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4
- Updated commit header
- Added clock-frequency for i2c nodes

v2->v3
- Set the default slew reset value for SDHI1 pins

v1->v2
- New patch
---
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 191 ++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 47f6f2bf6925..18f3fb33439a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+#include <dt-bindings/gpio/gpio.h>
 #include "r9a09g057.dtsi"
 
 / {
@@ -14,6 +16,14 @@ / {
 	compatible = "renesas,rzv2h-evk", "renesas,r9a09g057h44", "renesas,r9a09g057";
 
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
+	clock-frequency = <400000>;
+
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+
+	status = "okay";
+};
+
+&i2c6 {
+	pinctrl-0 = <&i2c6_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+
+	status = "okay";
+};
+
+&i2c7 {
+	pinctrl-0 = <&i2c7_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+
+	status = "okay";
+};
+
+&i2c8 {
+	pinctrl-0 = <&i2c8_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
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
+		sd1_dat_cmd {
+			pins = "SD1DAT0", "SD1DAT1", "SD1DAT2", "SD1DAT3", "SD1CMD";
+			input-enable;
+			renesas,output-impedance = <3>;
+			slew-rate = <0>;
+		};
+
+		sd1_clk {
+			pins = "SD1CLK";
+			renesas,output-impedance = <3>;
+			slew-rate = <0>;
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


