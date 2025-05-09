Return-Path: <linux-renesas-soc+bounces-16832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F119AB0E00
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 10:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AAFA18979C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 08:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D5E274645;
	Fri,  9 May 2025 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiL6lZRJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7EA26FA57;
	Fri,  9 May 2025 08:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781167; cv=none; b=pdzu1xLPCstu2u8Xh6vAL/zh+H6mpt7UK6hLDj42bg1bSCtprko4TXLfXidf8XKHIwFwrQM6WmFLGojPvNmeLEGS1p6dmqJAoF9bYnnhsMZpYKY5ZF7hgrQlb28jzeoqR/VUAcNhjhBP0M/1m2ZdUm/kddG6I7ubsM4EQ3KOn2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781167; c=relaxed/simple;
	bh=hqEjcZTWAJAn6XNug/26j41gD3dOw76bgXmLoFnQ4Tc=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=X2Vet3nST6xsQ59MNS5e+4GpIWD7SqP8zrTzi0vD9Z9AcfDlCSTpECnJET70Xa5wwIyBv+sTwizXEZ/FtR3uAXl4BIm+9ydepeW3lLhtfNULpiIa1rD4W3JZ4GXgbOoplx9ARZ5d2+iU1CBd7BJN0ZI+drcYDE9l1JCtU8wl+PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiL6lZRJ; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b245ff89c99so251716a12.3;
        Fri, 09 May 2025 01:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746781164; x=1747385964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:subject:cc:to:from
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/lAhTfHxvDin0g8nrPlpYtTw4qtyrlA5KvC7fcIuX1k=;
        b=CiL6lZRJXF6KNWD+jGLU+Fk+5iNjfJrXaEnbuZ2ZxiaSs8fg5HMpRH8chegDg04zsU
         FoJHgEN7rBMznXuVg3evGmMTCFuzCHQLP+fWPJKcuCLdEooiZXz6Qv7R0VyCeGRPHdCj
         ftnqV2fYVpwD7Q1eOnaMhepgKPUmWjEBrpQdWSy2lpCxF4bSVvNpx19GPCZkBnwyQlnU
         TdJT1zJDE7Kirycq5G4cSpsU8YHVKMd0CPV4tVHE/Gfqb3GqopiOKqysnZNiK9iW2nCw
         Tq4Qr+7Os+NBUXZxG15irpLLLTZTn5jmzj2Bmd55aapTr8LZ9IrpPqUXNgLGY0j4h4kZ
         0ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781164; x=1747385964;
        h=content-transfer-encoding:mime-version:date:subject:cc:to:from
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lAhTfHxvDin0g8nrPlpYtTw4qtyrlA5KvC7fcIuX1k=;
        b=whumT+3gsngxQLsX3/TY6Lfzy2RUTyX5ANIlVN2syFdu1PCLpEMwnTbTfYRiisWdSR
         kwox8Kb+pD0yJ+oyUdA4xI0brR8b5ZJDPDFMkt7cnu74HuY/+674+E4cfRRLsHVrqB5Q
         ZGDDFX2IgQIM+U9Jhb6z0ztAjnWp96vV6OexFmvbzWW9H9PNEPKglIyw3v2jZHD5JwzO
         84Vpg0cUDvh8/f4CuYYBYAJBv9wCfqZLG435/acH0fnHXT8Y4Vx8ZlNmBY8iTX611eev
         5zZAUE5fXBWSK0EPuKR5KIyb/lUk2xDrWbSScz/34poUlbNpouOsdR/tzSgRyCy2VQWd
         M8dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEacLHwEP0XiBBdrHCw3q7kCaZ96+8FnTD3qf7uF1jKfbd92ze35z0OYSVho3JKdwq8DZQwCDdq3J5Fk9xOly+Y0E=@vger.kernel.org, AJvYcCUMJjMILCqJ0hobqqj/q7kK6vapoIBvKC3TFGImU/aWTegR2f5kMJAgD3XZS8N4B4unbGQYHFRyYCBh@vger.kernel.org, AJvYcCVAafuqFObvKFQt9jdJRMam0RM+FUA2pp9Y49/mfSKMMDK/Ao5vFvbfnTsgRCmCPbbzeUumJBKWgxWMDBld@vger.kernel.org, AJvYcCVizAbMKI3XvlLCFCoTZGQQYPIGx5QWcwzwd6BtNytVhoasLZ9enkqeXOyGPcM1Jl0jYoguGBcYv3tQH/sBchSL@vger.kernel.org
X-Gm-Message-State: AOJu0YwdS5wYXVpHaCdPgAGTt7qq67+Y1BGHQEECTsyLdHRrecdmPEg3
	nbl4g/kWoylz2/ZAXDyfohjs0oHaofupRK4WQ4PVTdbeYZrHxzfF
X-Gm-Gg: ASbGncuEJsSE1b67smmOesJtzLU1Lzr2vbpeMPKXPzKp72NoDewvNuU+39fl5DO0K+v
	93bZBoRtssYekI1fcFdVLE7yjEhO3cGh3RPUwqx3ETPfeI3mAM7R2hP1HnlDrkGe4lnBx66T0rC
	gGSF+vefeZE4YJ6b6iKCDo0VmzBkm4FTZ21V0aKrX8OI1INIkMZ0CYKcE1jxzyopPKN3Nzog/3d
	nnLwDUWYoBvIcKHMH+g5B1+AdjyX6jVL+wRv307Khj4TlXgB6Go3eb/xMKyuQGjWSAd6HQ4EFgj
	2sedLVLeH0gTuBPVTLwSrCPtU7ZYg76+OEVo2OFxlQjQ5eTWWTcNqo5eUOGUyQ==
X-Google-Smtp-Source: AGHT+IEuzWB+/bk1gHEvYby6p/KeuXux/LMGfMY7oK2xsmN+SuHnh44cljGLHDIGxMvgNJEvBtlXnQ==
X-Received: by 2002:a17:902:ec8a:b0:220:df73:b639 with SMTP id d9443c01a7336-22fc8d98a52mr37929105ad.36.1746781163587;
        Fri, 09 May 2025 01:59:23 -0700 (PDT)
Received: from dea88b1475bb.. (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7549354sm12871975ad.32.2025.05.09.01.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:59:23 -0700 (PDT)
Message-ID: <681dc3eb.170a0220.1fd80.c9ce@mx.google.com>
X-Google-Original-Message-ID: <20250509085901.92496-1-LeoWang>
From: leo.jt.wang@gmail.com
X-Google-Original-From: LeoWang
To: robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	keescook@chromium.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	george.kw.lee@fii-foxconn.com,
	leo.jt.wang@fii-foxconn.com
Subject: [PATCH] ASPEED: bmc: Add device tree for Meta(Facebook) Clemente compute-tray.
Date: Fri,  9 May 2025 16:59:01 +0800
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leo Wang <leo.jt.wang@fii-foxconn.com>

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-clemente.dts   | 1280 +++++++++++++++++
 3 files changed, 1282 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index a3736f134130..4416a40dcd86 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc
diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index b3170fdd3096..9d0a465cbb36 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -19,6 +19,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-delta-ahe50dc.dtb \
 	aspeed-bmc-facebook-bletchley.dtb \
 	aspeed-bmc-facebook-catalina.dtb \
+	aspeed-bmc-facebook-clemente.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
 	aspeed-bmc-facebook-elbert.dtb \
 	aspeed-bmc-facebook-fuji.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
new file mode 100644
index 000000000000..2d2488918e32
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -0,0 +1,1280 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2021 Facebook Inc.
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/usb/pd.h>
+#include <dt-bindings/leds/leds-pca955x.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/i2c/i2c.h>
+
+/ {
+	model = "Facebook Clemente BMC";
+	compatible = "facebook,clemente-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial0 = &uart1;
+		serial2 = &uart3;
+		serial3 = &uart4;
+		serial4 = &uart5;
+		i2c16 = &i2c1mux0ch0;
+		i2c17 = &i2c1mux0ch1;
+		i2c18 = &i2c1mux0ch2;
+		i2c19 = &i2c1mux0ch3;
+		i2c20 = &i2c1mux0ch4;
+		i2c21 = &i2c1mux0ch5;
+		i2c22 = &i2c1mux0ch6;
+		i2c23 = &i2c1mux0ch7;
+		i2c24 = &i2c0mux0ch0;
+		i2c25 = &i2c0mux0ch1;
+		i2c26 = &i2c0mux0ch2;
+		i2c27 = &i2c0mux0ch3;
+		i2c28 = &i2c0mux1ch0;
+		i2c29 = &i2c0mux1ch1;
+		i2c30 = &i2c0mux1ch2;
+		i2c31 = &i2c0mux1ch3;
+		i2c32 = &i2c0mux2ch0;
+		i2c33 = &i2c0mux2ch1;
+		i2c34 = &i2c0mux2ch2;
+		i2c35 = &i2c0mux2ch3;
+		i2c36 = &i2c0mux3ch0;
+		i2c37 = &i2c0mux3ch1;
+		i2c38 = &i2c0mux3ch2;
+		i2c39 = &i2c0mux3ch3;
+		i2c40 = &i2c0mux4ch0;
+		i2c41 = &i2c0mux4ch1;
+		i2c42 = &i2c0mux4ch2;
+		i2c43 = &i2c0mux4ch3;
+		i2c44 = &i2c0mux5ch0;
+		i2c45 = &i2c0mux5ch1;
+		i2c46 = &i2c0mux5ch2;
+		i2c47 = &i2c0mux5ch3;
+		i2c48 = &i2c5mux0ch0;
+		i2c49 = &i2c5mux0ch1;
+		i2c50 = &i2c5mux0ch2;
+		i2c51 = &i2c5mux0ch3;
+		i2c52 = &i2c5mux0ch4;
+		i2c53 = &i2c5mux0ch5;
+		i2c54 = &i2c5mux0ch6;
+		i2c55 = &i2c5mux0ch7;
+	};
+
+	chosen {
+		stdout-path = "serial4:57600n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+				  <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+				  <&adc1 2>;
+	};
+
+	spi1_gpio: spi {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
+		num-chipselects = <1>;
+
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "bmc_heartbeat_amber";
+			gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-1 {
+			label = "fp_id_amber";
+			default-state = "off";
+			gpios = <&gpio0 ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-2 {
+			label = "bmc_ready_noled";
+			gpios = <&gpio0 ASPEED_GPIO(B, 3) (GPIO_ACTIVE_HIGH|GPIO_TRANSITORY)>;
+		};
+
+		led-3 {
+			label = "bmc_ready_cpld_noled";
+			gpios = <&gpio0 ASPEED_GPIO(P, 5) (GPIO_ACTIVE_HIGH|GPIO_TRANSITORY)>;
+		};
+	};
+
+	p1v8_bmc_aux: regulator-p1v8-bmc-aux {
+		compatible = "regulator-fixed";
+		regulator-name = "p1v8_bmc_aux";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	p2v5_bmc_aux: regulator-p2v5-bmc-aux {
+		compatible = "regulator-fixed";
+		regulator-name = "p2v5_bmc_aux";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+		regulator-always-on;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		ramoops@b3e00000 {
+			compatible = "ramoops";
+			reg = <0xbb000000 0x200000>; /* 16 * (4 * 0x8000) */
+			record-size = <0x8000>;
+			console-size = <0x8000>;
+			ftrace-size = <0x8000>;
+			pmsg-size = <0x8000>;
+			max-reason = <3>;
+		};
+	};
+
+};
+
+&udma {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart3 {
+	compatible = "aspeed,ast2600-uart";
+	status = "okay";
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&mdio0 {
+	status = "okay";
+	ethphy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
+
+&mac0 {
+	status = "okay";
+	phy-mode = "rgmii-rxid";
+	phy-handle = <&ethphy0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+};
+
+&mac2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ncsi3_default>;
+	use-ncsi;
+	ncsi-ctrl,start-redo-probe;
+	ncsi-package = <1>;
+};
+
+&mac3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ncsi4_default>;
+	use-ncsi;
+	ncsi-ctrl,start-redo-probe;
+	ncsi-package = <2>;
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-128.dtsi"
+	};
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "alt-bmc";
+		spi-max-frequency = <50000000>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+
+	i2c-mux@71 {
+		compatible = "nxp,pca9546";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c0mux0ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			// IOB0 NIC0 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+		i2c0mux0ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c0mux0ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			// IOB0 NIC1 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+		i2c0mux0ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-mux@72 {
+		compatible = "nxp,pca9546";
+		reg = <0x72>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c0mux1ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+		i2c0mux1ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			// IO Mezz 0 IOEXP
+			io_expander7: gpio@21 {
+				compatible = "nxp,pca9535";
+				reg = <0x21>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			// IO Mezz 0 FRU EEPROM
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+		i2c0mux1ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+		i2c0mux1ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-mux@73 {
+		compatible = "nxp,pca9546";
+		reg = <0x73>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c0mux2ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+		i2c0mux2ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c0mux2ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+		i2c0mux2ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-mux@75 {
+		compatible = "nxp,pca9546";
+		reg = <0x75>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c0mux3ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			// IOB1 NIC0 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+		i2c0mux3ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c0mux3ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			// IOB1 NIC1 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+		i2c0mux3ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-mux@76 {
+		compatible = "nxp,pca9546";
+		reg = <0x76>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c0mux4ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+		i2c0mux4ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			// IO Mezz 1 IOEXP
+			io_expander8: gpio@21 {
+				compatible = "nxp,pca9535";
+				reg = <0x21>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			// IO Mezz 1 FRU EEPROM
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+		i2c0mux4ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+		i2c0mux4ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-mux@77 {
+		compatible = "nxp,pca9546";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c0mux5ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+		i2c0mux5ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c0mux5ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+		i2c0mux5ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c1 {
+	status = "okay";
+
+	// HSC
+	power-monitor@12 {
+		compatible = "ti,lm5066i";
+		reg = <0x12>;
+	};
+
+	// HSC
+	power-monitor@14 {
+		compatible = "ti,lm5066i";
+		reg = <0x14>;
+	};
+
+	// HSC TEMP SENSOR
+	temperature-sensor@4a {
+		compatible = "ti,tmp461";
+		reg = <0x4a>;
+	};
+
+	// HSC FRU EEPROM
+	eeprom@53 {
+		compatible = "atmel,24c02";
+		reg = <0x53>;
+	};
+
+    // CPU0 Leak sensor MAX1363
+	Leak-sensor@34 {
+		compatible = "max1363,max1363";
+		reg = <0x34>;
+	};
+
+    // CPU1 Leak sensor MAX1363
+	Leak-sensor@35 {
+		compatible = "max1363,max1363";
+		reg = <0x35>;
+	};
+
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		i2c1mux0ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+
+			power-sensor@22 {
+				compatible = "mps,mp5990";
+				reg = <0x22>;
+			};
+		};
+		i2c1mux0ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+		};
+		i2c1mux0ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+
+			fanctl0: fan-controller@21{
+				compatible = "maxim,max31790";
+				reg = <0x21>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				channel@2 {
+					reg = <2>;
+					sensor-type = "TACH";
+				};
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
+			};
+			fanctl1: fan-controller@27{
+				compatible = "maxim,max31790";
+				reg = <0x27>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				channel@2 {
+					reg = <2>;
+					sensor-type = "TACH";
+				};
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
+			};
+		};
+		i2c1mux0ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x3>;
+
+			vrm@60 {
+				compatible = "renesas,raa228004";
+				reg = <0x60>;
+			};
+			vrm@61 {
+				compatible = "renesas,raa228004";
+				reg = <0x61>;
+			};
+			vrm@62 {
+				compatible = "renesas,raa228004";
+				reg = <0x62>;
+			};
+		};
+		i2c1mux0ch4: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x4>;
+		};
+		i2c1mux0ch5: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x5>;
+
+			// PDB FRU EEPROM
+			eeprom@54 {
+				compatible = "atmel,24c64";
+				reg = <0x54>;
+			};
+
+			// PDB TEMP SENSOR
+			temperature-sensor@4f {
+				compatible = "ti,tmp75";
+				reg = <0x4f>;
+			};
+		};
+		i2c1mux0ch6: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x6>;
+
+			// PDB IOEXP
+			io_expander5: gpio@27 {
+				compatible = "nxp,pca9554";
+				reg = <0x27>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			// OSFP IOEXP
+			io_expander6: gpio@25 {
+				compatible = "nxp,pca9555";
+				reg = <0x25>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			// OSFP FRU EEPROM
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+		i2c1mux0ch7: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x7>;
+
+			// FIO FRU EEPROM
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+
+			// FIO TEMP SENSOR
+			temperature-sensor@4b {
+				compatible = "ti,tmp75";
+				reg = <0x4b>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	// Module 0, Expander @0x20
+	io_expander0: gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	// Module 1, Expander @0x21
+	io_expander1: gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	// HMC Expander @0x27
+	io_expander2: gpio@27 {
+		compatible = "nxp,pca9555";
+		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	// HMC Expander @0x74
+	io_expander3: gpio@74 {
+		compatible = "nxp,pca9555";
+		reg = <0x74>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	// Module 0 Aux EEPROM
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	// Module 1 Aux EEPROM
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+
+	rtc@6f {
+		compatible = "nuvoton,nct3018y";
+		reg = <0x6f>;
+	};
+
+	// Interposer board EEPROM
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+	bus-frequency = <100000>;
+	multi-master;
+	aspeed,hw-timeout-ms = <1000>;
+
+	//USB Debug Connector
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+
+	// SCM CPLD IOEXP
+	io_expander4: gpio@4f {
+		compatible = "nxp,pca9555";
+		reg = <0x4f>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	// SCM TEMP SENSOR BOARD
+	temperature-sensor@4b {
+		compatible = "national,lm75b";
+		reg = <0x4b>;
+	};
+
+	// SCM FRU EEPROM
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	// BSM FRU EEPROM
+	eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+	};
+};
+
+&i2c10 {
+	status = "okay";
+
+	// OCP NIC0 TEMP
+	temperature-sensor@1f {
+		compatible = "ti,tmp421";
+		reg = <0x1f>;
+	};
+
+	// OCP NIC0 FRU EEPROM
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+};
+
+&i2c11 {
+	status = "okay";
+
+	ssif-bmc@10 {
+		compatible = "ssif-bmc";
+		reg = <0x10>;
+		alert-gpios = <&gpio0 ASPEED_GPIO(C, 7) GPIO_ACTIVE_LOW>;
+		timeout-ms = <5000>;
+	};
+};
+
+&i2c12 {
+	status = "okay";
+	multi-master;
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c5mux0ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+		i2c5mux0ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c5mux0ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+		i2c5mux0ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+		i2c5mux0ch4: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+		i2c5mux0ch5: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+		i2c5mux0ch6: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+			// HDD FRU EEPROM
+			eeprom@56 {
+				compatible = "atmel,24c64";
+				reg = <0x56>;
+			};
+		};
+		i2c5mux0ch7: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+
+			power-sensor@40 {
+				compatible = "ti,ina230";
+				reg = <0x40>;
+				shunt-resistor = <2000>;
+			};
+			power-sensor@41 {
+				compatible = "ti,ina230";
+				reg = <0x41>;
+				shunt-resistor = <2000>;
+			};
+			power-sensor@44 {
+				compatible = "ti,ina230";
+				reg = <0x44>;
+				shunt-resistor = <2000>;
+			};
+			power-sensor@49 {
+				compatible = "ti,ina230";
+				reg = <0x49>;
+				shunt-resistor = <2000>;
+			};
+		};
+	};
+};
+
+&i2c13 {
+	status = "okay";
+	multi-master;
+
+	// HPM FRU EEPROM
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+	// CBC 0 FRU
+	eeprom@54 {
+		compatible = "atmel,24c02";
+		reg = <0x54>;
+	};
+	// CBC 1 FRU
+	eeprom@55 {
+		compatible = "atmel,24c02";
+		reg = <0x55>;
+	};
+	// CBC 2 FRU
+	eeprom@56 {
+		compatible = "atmel,24c02";
+		reg = <0x56>;
+	};
+	// CBC 3 FRU
+	eeprom@58 {
+		compatible = "atmel,24c02";
+		reg = <0x58>;
+	};
+	// HMC FRU EEPROM
+	eeprom@57 {
+		compatible = "atmel,24c02";
+		reg = <0x57>;
+	};
+};
+
+&i2c14 {
+	status = "okay";
+
+	// PDB CPLD IOEXP 0x10
+	io_expander9: gpio@10 {
+		compatible = "nxp,pca9555";
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x10>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	// PDB CPLD IOEXP 0x11
+	io_expander10: gpio@11 {
+		compatible = "nxp,pca9555";
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x11>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	// PDB CPLD IOEXP 0x12
+	io_expander11: gpio@12 {
+		compatible = "nxp,pca9555";
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x12>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	// PDB CPLD IOEXP 0x13
+	io_expander12: gpio@13 {
+		compatible = "nxp,pca9555";
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x13>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	// PDB CPLD IOEXP 0x14
+	io_expander13: gpio@14 {
+		compatible = "nxp,pca9555";
+		reg = <0x14>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&i2c15 {
+	status = "okay";
+
+	// OCP NIC1 TEMP
+	temperature-sensor@1f {
+		compatible = "ti,tmp421";
+		reg = <0x1f>;
+	};
+
+	// OCP NIC1 FRU EEPROM
+	eeprom@52 {
+		compatible = "atmel,24c64";
+		reg = <0x52>;
+	};
+};
+
+&adc0 {
+	vref-supply = <&p1v8_bmc_aux>;
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		&pinctrl_adc2_default &pinctrl_adc3_default
+		&pinctrl_adc4_default &pinctrl_adc5_default
+		&pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	vref-supply = <&p2v5_bmc_aux>;
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc10_default>;
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&wdt1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst1_default>;
+	aspeed,reset-type = "soc";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
+	aspeed,ext-pulse-duration = <256>;
+};
+
+&pinctrl {
+	pinctrl_ncsi3_default: ncsi3_default {
+		function = "RMII3";
+		groups = "NCSI3";
+	};
+
+	pinctrl_ncsi4_default: ncsi4_default {
+		function = "RMII4";
+		groups = "NCSI4";
+	};
+};
+
+&gpio0 {
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"BATTERY_DETECT","PRSNT1_HPM_SCM_N",
+			"BMC_I2C1_FPGA_ALERT_L","BMC_READY",
+			"IOEXP_INT_L","FM_ID_LED",
+			"","",
+	/*C0-C7*/	"BMC_GPIOC0","","","",
+			"PMBUS_REQ_N","PSU_FW_UPDATE_REQ_N",
+			"","BMC_I2C_SSIF_ALERT_L",
+	/*D0-D7*/	"","","","","BMC_GPIOD4","","","",
+	/*E0-E7*/	"BMC_GPIOE0","BMC_GPIOE1","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","",
+			"FM_DEBUG_PORT_PRSNT_N","FM_BMC_DBP_PRESENT_N",
+	/*H0-H7*/	"PWR_BRAKE_L","RUN_POWER_EN",
+			"SHDN_FORCE_L","SHDN_REQ_L",
+			"","","","",
+	/*I0-I7*/	"","","","",
+			"","FLASH_WP_STATUS",
+			"FM_PDB_HEALTH_N","RUN_POWER_PG",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"PCIE_EP_RST_EN","BMC_FRU_WP",
+			"SCM_HPM_STBY_RST_N","SCM_HPM_STBY_EN",
+			"STBY_POWER_PG_3V3","TH500_SHDN_OK_L","","",
+	/*N0-N7*/	"LED_POSTCODE_0","LED_POSTCODE_1",
+			"LED_POSTCODE_2","LED_POSTCODE_3",
+			"LED_POSTCODE_4","LED_POSTCODE_5",
+			"LED_POSTCODE_6","LED_POSTCODE_7",
+	/*O0-O7*/	"HMC_I2C3_FPGA_ALERT_L","FPGA_READY_HMC",
+			"CHASSIS_AC_LOSS_L","BSM_PRSNT_R_N",
+			"PSU_SMB_ALERT_L","FM_TPM_PRSNT_0_N",
+			"","USBDBG_IPMI_EN_L",
+	/*P0-P7*/	"PWR_BTN_BMC_N","IPEX_CABLE_PRSNT_L",
+			"ID_RST_BTN_BMC_N","RST_BMC_RSTBTN_OUT_N",
+			"host0-ready","BMC_READY_CPLD","BMC_GPIOP6","BMC_HEARTBEAT_N",
+	/*Q0-Q7*/	"IRQ_PCH_TPM_SPI_N","USB_OC0_REAR_R_N",
+			"UART_MUX_SEL","I2C_MUX_RESET_L",
+			"RSVD_NV_PLT_DETECT","SPI_TPM_INT_L",
+			"CPU_JTAG_MUX_SELECT","THERM_BB_OVERT_L",
+	/*R0-R7*/	"THERM_BB_WARN_L","SPI_BMC_FPGA_INT_L",
+			"CPU_BOOT_DONE","PMBUS_GNT_L",
+			"CHASSIS_PWR_BRK_L","PCIE_WAKE_L",
+			"PDB_THERM_OVERT_L","HMC_I2C2_FPGA_ALERT_L",
+	/*S0-S7*/	"","","SYS_BMC_PWRBTN_R_N","FM_TPM_PRSNT_1_N",
+			"FM_BMC_DEBUG_SW_N","UID_LED_N",
+			"SYS_FAULT_LED_N","RUN_POWER_FAULT_L",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"L2_RST_REQ_OUT_L","L0L1_RST_REQ_OUT_L",
+			"BMC_ID_BEEP_SEL","BMC_I2C0_FPGA_ALERT_L",
+			"SMB_BMC_TMP_ALERT","PWR_LED_N",
+			"SYS_RST_OUT_L","IRQ_TPM_SPI_N",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","RST_BMC_SELF_HW",
+			"FM_FLASH_LATCH_N","BMC_EMMC_RST_N",
+			"BMC_GPIOY4","BMC_GPIOY5","","",
+	/*Z0-Z7*/	"","","","","","","BMC_GPIOZ6","BMC_GPIOZ7";
+};
+
+&gpio1 {
+	gpio-line-names =
+	/*18A0-18A7*/	"","","","","","","","",
+	/*18B0-18B7*/	"","","","","FM_BOARD_BMC_REV_ID0","FM_BOARD_BMC_REV_ID1","FM_BOARD_BMC_REV_ID2","",
+	/*18C0-18C7*/	"","","PI_BMC_BIOS_ROM_IRQ0_N","","","","","",
+	/*18D0-18D7*/	"","","","","","","","",
+	/*18E0-18E3*/	"","","","AC_PWR_BMC_BTN_N","","","","";
+};
+
+&io_expander0 {
+	gpio-line-names =
+		"FPGA_THERM_OVERT_L-I",
+		"FPGA_READY_BMC-I",
+		"HMC_BMC_DETECT-O",
+		"HMC_PGOOD-O",
+		"",
+		"BMC_STBY_CYCLE-O",
+		"FPGA_EROT_FATAL_ERROR_L-I",
+		"WP_HW_EXT_CTRL_L-O",
+		"EROT_FPGA_RST_L-O",
+		"FPGA_EROT_RECOVERY_L-O",
+		"BMC_EROT_FPGA_SPI_MUX_SEL-O",
+		"USB2_HUB_RST_L-O",
+		"",
+		"SGPIO_EN_L-O",
+		"B2B_IOEXP_INT_L-I",
+		"I2C_BUS_MUX_RESET_L-O";
+};
+
+&io_expander1 {
+	gpio-line-names =
+		"USB_MUX_SEL_N-O",
+		"",
+		"MCIO_PCIE_DISABLE_L-O",
+		"USB_PCIE_DISABLE_L-O",
+		"PEX_SW_PCIE_DISABLE_L-O",
+		"HSC_CARD_PRSNT_N-I",
+		"TPM_MUX_3V3_SEL_OUT_N-O",
+		"USB2_HUB4_RST_L-O",
+		"PCI_MUX_SEL-O",
+		"TPM_MUX_SEL-O",
+		"IOEXP_BMC_PHY_RST_N-O",
+		"IOEXP_RTC_CLR_L-O",
+		"BMC_12V_CTRL-O",
+		"PS_RUN_IO0_PG-I",
+		"",
+		"";
+};
+
+&io_expander2 {
+	gpio-line-names =
+		"HMC_PRSNT_L-I",
+		"HMC_READY-I",
+		"HMC_EROT_FATAL_ERROR_L-I",
+		"I2C_MUX_SEL-O",
+		"HMC_EROT_SPI_MUX_SEL-O",
+		"HMC_EROT_RECOVERY_L-O",
+		"HMC_EROT_RST_L-O",
+		"GLOBAL_WP_HMC-O",
+		"FPGA_RST_L-O",
+		"USB2_HUB_RST-O",
+		"CPU_UART_MUX_SEL-O",
+		"",
+		"",
+		"",
+		"",
+		"";
+};
+
+&io_expander3 {
+	gpio-line-names =
+		"IOB_PRSNT_L",
+		"IOB_DP_HPD",
+		"IOX_BMC_RESET",
+		"IOB_IOEXP_INT_L",
+		"IOB_UID_LED_L",
+		"IOB_UID_BTN_L",
+		"IOB_SYS_RST_BTN_L",
+		"IOB_PWR_LED_L",
+		"IOB_PWR_BTN_L",
+		"IOB_PHY_RST",
+		"CPLD_JTAG_MUX_SEL",
+		"",
+		"",
+		"",
+		"",
+		"";
+};
+
+&io_expander4 {
+	gpio-line-names =
+		"stby_power_en_cpld","stby_power_gd_cpld","","",
+		"","","","",
+		"","","","",
+		"","","","";
+};
+
+&io_expander5 {
+	gpio-line-names =
+		"JTAG_MUX_SEL","IOX_BMC_RESET","RTC_CLR_L","RTC_U77_ALRT_N",
+		"","PSU_ALERT_N","","RST_P12V_STBY_N";
+};
+
+&io_expander6 {
+	gpio-line-names =
+		"OSFP_PHASE_ID0","OSFP_PHASE_ID1",
+		"OSFP_PHASE_ID2","OSFP_PHASE_ID3",
+		"","","","",
+		"OSFP_BOARD_ID0","OSFP_BOARD_ID1",
+		"OSFP_BOARD_ID2","PWRGD_P3V3_N1",
+		"PWRGD_P3V3_N2","","","";
+};
+
+&io_expander7 {
+	gpio-line-names =
+		"RST_CX7_0","RST_CX7_1",
+		"CX0_SSD0_PRSNT_L","CX1_SSD1_PRSNT_L",
+		"CX_BOOT_CMPLT_CX0","CX_BOOT_CMPLT_CX1",
+		"CX_TWARN_CX0_L","CX_TWARN_CX1_L",
+		"CX_OVT_SHDN_CX0","CX_OVT_SHDN_CX1",
+		"FNP_L_CX0","FNP_L_CX1",
+		"","MCU_GPIO","MCU_RST_N","MCU_RECOVERY_N";
+};
+
+&io_expander8 {
+	gpio-line-names =
+		"SEC_RST_CX7_0","SEC_RST_CX7_1",
+		"SEC_CX0_SSD0_PRSNT_L","SEC_CX1_SSD1_PRSNT_L",
+		"SEC_CX_BOOT_CMPLT_CX0","SEC_CX_BOOT_CMPLT_CX1",
+		"SEC_CX_TWARN_CX0_L","SEC_CX_TWARN_CX1_L",
+		"SEC_CX_OVT_SHDN_CX0","SEC_CX_OVT_SHDN_CX1",
+		"SEC_FNP_L_CX0","SEC_FNP_L_CX1",
+		"","SEC_MCU_GPIO","SEC_MCU_RST_N","SEC_MCU_RECOVERY_N";
+};
+
+&io_expander9 {
+	gpio-line-names =
+		"wSequence_Latch_State_N","wP12V_N1N2_RUNTIME_FLT_N",
+		"wP12V_FAN_RUNTIME_FLT_N","wP12V_AUX_RUNTIME_FLT_N",
+		"wHost_PERST_SEQPWR_FLT_N","wP12V_N1N2_SEQPWR_FLT_N",
+		"wP12V_FAN_SEQPWR_FLT_N","wP12V_AUX_SEQPWR_FLT_N",
+		"wP12V_RUNTIME_FLT_NIC1_N","wAUX_RUNTIME_FLT_NIC1_N",
+		"wP12V_SEQPWR_FLT_NIC1_N","wAUX_SEQPWR_FLT_NIC1_N",
+		"wP12V_RUNTIME_FLT_NIC0_N","wAUX_RUNTIME_FLT_NIC0_N",
+		"wP12V_SEQPWR_FLT_NIC0_N","wAUX_SEQPWR_FLT_NIC0_N";
+};
+
+&io_expander10 {
+	gpio-line-names =
+		"FM_P12V_NIC1_FLTB_R_N","FM_P3V3_NIC1_FAULT_R_N",
+		"FM_P12V_NIC0_FLTB_R_N","FM_P3V3_NIC0_FAULT_R_N",
+		"P48V_HS2_FAULT_N_PLD","P48V_HS1_FAULT_N_PLD",
+		"P12V_AUX_FAN_OC_PLD_N","P12V_AUX_FAN_FAULT_PLD_N",
+		"","",
+		"","",
+		"","FM_SYS_THROTTLE_N",
+		"OCP_V3_2_PWRBRK_FROM_HOST_ISO_PLD_N",
+		"OCP_SFF_PWRBRK_FROM_HOST_ISO_PLD_N";
+};
+
+&io_expander11 {
+	gpio-line-names =
+		"P12V_AUX_PSU_SMB_ALERT_R_L","P12V_SCM_SENSE_ALERT_R_N",
+		"P12V_AUX_NIC1_SENSE_ALERT_R_N","P12V_AUX_NIC0_SENSE_ALERT_R_N",
+		"NODEB_PSU_SMB_ALERT_R_L","NODEA_PSU_SMB_ALERT_R_L",
+		"P12V_AUX_FAN_ALERT_PLD_N","P52V_SENSE_ALERT_PLD_N",
+		"PRSNT_RJ45_FIO_N_R","FM_MAIN_PWREN_RMC_EN_ISO_R",
+		"CHASSIS3_LEAK_Q_N_PLD","CHASSIS2_LEAK_Q_N_PLD",
+		"CHASSIS1_LEAK_Q_N_PLD","CHASSIS0_LEAK_Q_N_PLD",
+		"","SMB_RJ45_FIO_TMP_ALERT";
+};
+
+&io_expander12 {
+	gpio-line-names =
+		"FAN_7_PRESENT_N","FAN_6_PRESENT_N",
+		"FAN_5_PRESENT_N","FAN_4_PRESENT_N",
+		"FAN_3_PRESENT_N","FAN_2_PRESENT_N",
+		"FAN_1_PRESENT_N","FAN_0_PRESENT_N",
+		"HP_LVC3_OCP_V3_2_PRSNT2_PLD_N","HP_LVC3_OCP_V3_1_PRSNT2_PLD_N",
+		"PRSNT_HDDBD_POWER_CABLE_N","PRSNT_OSFP0_POWER_CABLE_N",
+		"PRSNT_CHASSIS3_LEAK_CABLE_R_N","PRSNT_CHASSIS2_LEAK_CABLE_R_N",
+		"PRSNT_CHASSIS1_LEAK_CABLE_R_N","PRSNT_CHASSIS0_LEAK_CABLE_R_N";
+};
+
+&io_expander13 {
+	gpio-line-names =
+		"rmc_en_dc_pwr_on","",
+		"","",
+		"","",
+		"","",
+		"leak_config_0","leak_config_1",
+		"leak_config_2","leak_config_3",
+		"mfg_led_test_mode_l","small_leak_err_inj",
+		"large_leak_err_inj","";
+};
\ No newline at end of file
-- 
2.43.0


