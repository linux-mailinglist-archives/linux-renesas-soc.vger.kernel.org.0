Return-Path: <linux-renesas-soc+bounces-7974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8FC95983C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 12:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28BA81F237F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 10:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FE91DEF4A;
	Wed, 21 Aug 2024 08:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsbo1wJl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB961DE63E;
	Wed, 21 Aug 2024 08:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724230620; cv=none; b=Pp9UXgCX/d0sp5/s8saOfHtCSU6ciZUOfDNlMC/4T51c7md/pTCLPEhdJg07wEfXg3ZI+mZnMhp8ba5KTY1T8Hi6SgdcsA8VKzsk0eVwNtEHeRlm7PDSVIy5v3okTuCeucy9tYPN/eakPaumLkeS8hgwb/LVRWpj/VVHD97tt/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724230620; c=relaxed/simple;
	bh=RwX/pXbGHHT83KmC9b/vvyLBFn4g3aN/DxvMSRBEHMg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=frps2eGQhstSYHKUvwU3Rhbg6p2g5SyVqFLxH0MXCzThojceY9QKxjORDyrMytvmxmNq9BuLFvVZ1RTm85C/oqAf2E8gXzrmfiwCuy/ZZoRx1JNt0uuR+fPVmDeIKpg7umzPl1OHJubkYz+ebp8eY3T/XnRs9UQSOhJO9nwGeEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsbo1wJl; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5bed83487aeso5124288a12.2;
        Wed, 21 Aug 2024 01:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724230617; x=1724835417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxbu7z7xcaBzV+rorrQqleiWS/mvIfgmk/tzjBT7pVM=;
        b=nsbo1wJl+i5f7XkJeJaQMe6r+Cw3xoAE/lxB7/S8i4lzCb7sYn+PKCARdnN03CZvzj
         5JWWLbub+wNgAR3CedL9+ZJfhvIIvGTAdxx/bDOMf81Kq7Bv6/W2X4/4SfEShET5SaYG
         S/XEOTSp5xW5zEcTiwCMUepflR+Kyb+UggYlaiERdPT3cUmYetVT3LYEImTYrhBP98hJ
         XQtRI5RFEAtJzpHoOrUNWfhZlF/nytHLcdJ4iQRG+EiYVwsnweD3Z0wGsK4TyygIVrPm
         fmUKPKQVVzNN4+0JzwwqEH0pm7vNMwfYJyq543cjgy3TzyoCioob6pTb5NaOUSKemPFX
         rERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724230617; x=1724835417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxbu7z7xcaBzV+rorrQqleiWS/mvIfgmk/tzjBT7pVM=;
        b=jCfu5+8WlsaTnXmJN7cYvedLu6P8iLG450EmfuvCoGQLMInQB5UaXq4oBc8HM9CbA/
         Z1cZ/fc1OgtM1/1NoqwVFdfvxHcsbQmB1gPfAncpC3M9QJmqwkG6GNpxoD2wlSfb6uuT
         u17Wrr9XHgpjxZmwT4wZGtdql6Q/SkJn7vGndxaZ8eb4O1zy7W2x9nIWPQTfyL7aKnM8
         mSONslOEfepyd81FE3SK7U4H/em5kJI89+5wNNdcPKew4RSWrdE7j5FolWg/00En2jLo
         MuOlIT4SZG3/njYYeOtU78Ianu5zxKryPVeWlaBTEzP0hteK7pm4sBEzfdKyr1QBGSqd
         EmZw==
X-Forwarded-Encrypted: i=1; AJvYcCUBmNNLtw8L+fM1hbWWxMyxrSoPuhGeiJeLCTZsKAvqv7QmD7JbQUNmSWziPbBrojH3iGWK2hHlXTE+@vger.kernel.org, AJvYcCX1/h8yv1oKosQqdFD0cESe3DNFfOWq0ewfuAZIaQB4KPKHNxm2+BQ0TNL2JnvRYc9N154nxG5sBy8kwIwD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8FbXT9468nzJJzzgGhKfMm2JgXIkXr7TtpH1qKORJ+BQZeaQq
	ARsgsLMfxpwb0f2o4jdfyxcRbT0QkzVzSfN6dn8DlNma6YplEmv9
X-Google-Smtp-Source: AGHT+IFSz13Q818Zqi9BjvyCiTrajFKSoOM83UG3yaOZkPmn8FUtSGh3w2GhUWxs8PMeRJt4vgL1/Q==
X-Received: by 2002:a17:907:7252:b0:a86:43c0:7d2 with SMTP id a640c23a62f3a-a866ee6476cmr141315966b.0.1724230616751;
        Wed, 21 Aug 2024 01:56:56 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:b9a9:40a4:353f:6481])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cf183sm873416266b.56.2024.08.21.01.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:56:56 -0700 (PDT)
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
Subject: [PATCH v3 7/8] arm64: dts: renesas: r9a09g057h44-gp-evk: Enable OSTM, I2C, and SDHI
Date: Wed, 21 Aug 2024 09:56:43 +0100
Message-Id: <20240821085644.240009-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
note, for i2c nodes we are defaulting the clock-frequency and this
will be updated when slave nodes are enabled.

v2->v3
- Set the default slew reset value for SDHI1 pins

v1->v2
- New patch
---
 .../boot/dts/renesas/r9a09g057h44-gp-evk.dts  | 184 ++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
index 593c48181248..1c532810dad0 100644
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
 
@@ -32,17 +42,179 @@ memory@240000000 {
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
@@ -59,3 +231,15 @@ &scif {
 
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


