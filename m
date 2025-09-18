Return-Path: <linux-renesas-soc+bounces-20451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2157B24691
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 12:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49BAF7B8E3A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 10:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665FC2F5336;
	Wed, 13 Aug 2025 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6oeuAyW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0532F530B;
	Wed, 13 Aug 2025 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755079485; cv=none; b=nja/mzIoyT9fQJGhAGCiF5QZsiCdaJvOXdGIP1Z2VAjnY51ovHuTCHneP5MYyamTPsmWOm7zrrVEJiiLJIeQQ65SFPN8B+rgkd9gAPum4xGk97WwTAZcOtXM6HnSVGTe8G6Yxdi9UyjhrGOEqq1390fz7LBqgLPihAMpb8GARMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755079485; c=relaxed/simple;
	bh=HhqqsGT7bicGR+Ne8QlfbGNzLBwqQMb8LnncSVXk3SQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a76rcumvyrruQ/rCNaTtJ37rVINxcgmSwch7W12bBjbNQjS1b/YTGgGctKsLVhs9ppC+Tze3UPfawZGbI+jAjNtXoevJkfQJK9RcSZUs733rciYi9m6uvo7P66RrW71+cNsMKF7lv63TQrkMKcgd2lda2SLumG6fadkXRTanke4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6oeuAyW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23c8f179e1bso76072425ad.1;
        Wed, 13 Aug 2025 03:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755079482; x=1755684282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwkxHeki+lUT+UKaya1OH8h3RWf992vFNET3MhdJavQ=;
        b=j6oeuAyW90jusdteZBRhhoMsNqcuizymZHZcfMEtPVKHdVdIX+f64yThlxsrQS//DU
         U44JvhAvmA11rhstkbbe2/kPgOt6AGQ+ZnkRIkcSiCL0qtsYQfpzJJmZNn/UAJUNDD5T
         IOZjaB6MppGIpBi9n0myZzsYpNGdH3uGG2XMnLhn/WO5LYOkqz2Gke/Ic6hXFrV2Kv/d
         tiZ9/szk+vvxEWLZ2Tw+sGn2VGkdzN0LYCCDh4KrWAprfkH1mIb4ZmkjF3pGyOm+4D87
         9mUKdAsFAKD3T8/HgnAtDQjburPWCpmt7tyEhhCy8Dft7HBT3KlOXhOupA98vQNMkvyL
         F1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755079482; x=1755684282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwkxHeki+lUT+UKaya1OH8h3RWf992vFNET3MhdJavQ=;
        b=fUOXEyVYBceOZUvxFmRrrNnF61igL/xWeKNFqwK3LR5y+YTT27+8/yuT/aKoIIZ2Fy
         nuCLZXiY449aEtsdM+TZS/+UjLmE7GBBr3YUURxIUSQFZKLVlAMHCjh+CXw9UmrLQecw
         VmQ2FYvGw7sXUW7FEzLvFVcLvTGKzE7pageQ2YQvmKflO8UPqEgofZnaxPWB8zMTtR/2
         ma5r8V04P/wtZKYwjO/fDM13T9dIqXJJY8Hd/+HgS8pG7yDCuFCQF3yBuLO9NsVN6ZKi
         SuKbsZ6wA60uyRAmKPJDi2sz9fDdkxmahbIq8vu7zgw7r9MlESrWkQvu2IXT4pkLT9rq
         2oEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmYPfBWVg+2XHgLp15Cl1uEVhMVQ1lf9wm98b3EtSLZH1o4DyzFx7N6twIgMX5t9RQdiVGV5bbLzSrWOQ4GHQ=@vger.kernel.org, AJvYcCVvWCD1tFOetxcLWW6yIczt5oOPAARPAueZZ2+3tkc2K/rP17LUh5GwTsLijqyATjSN8AjrXNkgpaefahQzW4HcruI=@vger.kernel.org, AJvYcCXV2kr8tv1PTjuqGLaZCT4yxRmu9yVlWs/S0r/MLTN10QrW4C/RUW0TViBWYdc75pLl3Mo1vT35CQF9dXDO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0pvKh6JL4eFpZENItQA2HQQCOCIRWtE1i+Y6gYXysEl8OpYxS
	G15UE19AyPTd6XVlC4cwW5Bp2LPVzdxFa9rSYKMNNP86jZMiUACe1Gtk
X-Gm-Gg: ASbGncuqM7Lbk7nATLVcV8zp/JRRi0aXcHoqbUc7nyrU89LRbD035tyZ60k3Pl+mCDA
	rTMNYqoVFWc12+FLWOUgRmd8llCXkqMgYg3R/3FpNhCOhCPQAP5bd3BzlDB9qz/wEH/bOoeU9ky
	6EsN6wUv8qLjAQeFU9XAwVqa0Av31PADp8iObaGl+FJ87/BFsKfRWT+NS4FjZFMFtidN7Q7OMfn
	sGFw1kGyr6kNpx84s6kuTfEThI31HjuzvIFaCqu25Co9TgZTLTXdJweypQgwGVduHLWIMCrSgym
	oDwk/tPvu/iy8aDfL8qxkLC8zA0+2F2vQV9eXcOftjDuBBzM8x5kHMfLrwuYjMwvViJVNJtNn4g
	dIVvQbY4NFsikZQtwBVdv9pIdSHw32l7GiAh/m7ur7dj0Q5Hapy3dLWAR3Pl4QWAzwts=
X-Google-Smtp-Source: AGHT+IGrQoByz9FLvgubA60oX70GMopGC08vi7M83Fodh6d9WV6U2rHjbDUNXiZMqWIsuZQDynGINA==
X-Received: by 2002:a17:903:234c:b0:240:3f4d:b9b1 with SMTP id d9443c01a7336-2430d1a1056mr31965625ad.29.1755079481870;
        Wed, 13 Aug 2025 03:04:41 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aabdedsm321545335ad.167.2025.08.13.03.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:04:41 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Wed, 13 Aug 2025 18:04:15 +0800
Subject: [PATCH v11 3/3] ARM: dts: aspeed: clemente: add Meta Clemente BMC
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-add-support-for-meta-clemente-bmc-v11-3-8970d41f88b0@fii-foxconn.com>
References: <20250813-add-support-for-meta-clemente-bmc-v11-0-8970d41f88b0@fii-foxconn.com>
In-Reply-To: <20250813-add-support-for-meta-clemente-bmc-v11-0-8970d41f88b0@fii-foxconn.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 bruce.jy.hung@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755079466; l=27995;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=0sIszASTTcUkRxbgj6hOHVKCfN3yA2FwCzCmKWXKT0M=;
 b=vaEJfSz4ZwB6/5CEb3gLYJL3kpwNEKpAb4pVdL6u+hFfreUt30ZWicFzyrgyqcP5FJ09SYV6w
 X9feFxI0BJBBCxDXsH4+2zN3I4eD/+BkTHDCw9ZyELYGJCeLhnfEsYO
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

From: Leo Wang <leo.jt.wang@gmail.com>

Add linux device tree entry for Meta Clemente compute-tray
BMC using AST2600 SoC.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1250 ++++++++++++++++++++
 2 files changed, 1251 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 8062c685f7e8795b9b805499e7461013cee28c94..0f0b5b7076545e6babb2f25f302b5d70b71d8a19 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -19,6 +19,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-delta-ahe50dc.dtb \
 	aspeed-bmc-facebook-bletchley.dtb \
 	aspeed-bmc-facebook-catalina.dtb \
+	aspeed-bmc-facebook-clemente.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
 	aspeed-bmc-facebook-darwin.dtb \
 	aspeed-bmc-facebook-elbert.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
new file mode 100644
index 0000000000000000000000000000000000000000..fd32d41a75b43a61b15c9c662ba715bbe0b3335f
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -0,0 +1,1250 @@
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
+		i2c48 = &i2c0mux0ch1mux0ch0;
+		i2c49 = &i2c0mux0ch1mux0ch1;
+		i2c50 = &i2c0mux0ch1mux0ch2;
+		i2c51 = &i2c0mux0ch1mux0ch3;
+		i2c52 = &i2c0mux3ch1mux0ch0;
+		i2c53 = &i2c0mux3ch1mux0ch1;
+		i2c54 = &i2c0mux3ch1mux0ch2;
+		i2c55 = &i2c0mux3ch1mux0ch3;
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
+			      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			      <&adc1 2>;
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
+	/*18B0-18B3*/	"","","","",
+	/*18B4-18B7*/	"FM_BOARD_BMC_REV_ID0","FM_BOARD_BMC_REV_ID1","FM_BOARD_BMC_REV_ID2","",
+	/*18C0-18C7*/	"","","PI_BMC_BIOS_ROM_IRQ0_N","","","","","",
+	/*18D0-18D7*/	"","","","","","","","",
+	/*18E0-18E3*/	"","","","AC_PWR_BMC_BTN_N","","","","";
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
+		};
+		i2c0mux0ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			// HDD FRU EEPROM
+			eeprom@56 {
+				compatible = "atmel,24c128";
+				reg = <0x56>;
+			};
+
+			// E1.S Backplane
+			i2c0mux0ch1mux0: i2c-mux@74 {
+				compatible = "nxp,pca9546";
+				reg = <0x74>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				i2c-mux-idle-disconnect;
+
+				i2c0mux0ch1mux0ch0: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				i2c0mux0ch1mux0ch1: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				i2c0mux0ch1mux0ch2: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				i2c0mux0ch1mux0ch3: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+			};
+		};
+		i2c0mux0ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
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
+			io_expander7: gpio@20 {
+				compatible = "nxp,pca9535";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names =
+					"RST_CX7_0",
+					"RST_CX7_1",
+					"CX0_SSD0_PRSNT_L",
+					"CX1_SSD1_PRSNT_L",
+					"CX_BOOT_CMPLT_CX0",
+					"CX_BOOT_CMPLT_CX1",
+					"CX_TWARN_CX0_L",
+					"CX_TWARN_CX1_L",
+					"CX_OVT_SHDN_CX0",
+					"CX_OVT_SHDN_CX1",
+					"FNP_L_CX0",
+					"FNP_L_CX1",
+					"",
+					"MCU_GPIO",
+					"MCU_RST_N",
+					"MCU_RECOVERY_N";
+			};
+
+			// IO Mezz 0 FRU EEPROM
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+
+			// OSFP 0 FRU EEPROM
+			eeprom@52 {
+				compatible = "atmel,24c128";
+				reg = <0x52>;
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
+			// IOB0 NIC0 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
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
+			// IOB0 NIC1 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
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
+		};
+		i2c0mux3ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			// E1.S Backplane HDD FRU EEPROM
+			eeprom@56 {
+				compatible = "atmel,24c128";
+				reg = <0x56>;
+			};
+
+			// E1.S Backplane MUX
+			i2c0mux3ch1mux0: i2c-mux@74 {
+				compatible = "nxp,pca9546";
+				reg = <0x74>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				i2c-mux-idle-disconnect;
+
+				i2c0mux3ch1mux0ch0: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				i2c0mux3ch1mux0ch1: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				i2c0mux3ch1mux0ch2: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				i2c0mux3ch1mux0ch3: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+			};
+		};
+		i2c0mux3ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
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
+				gpio-line-names =
+					"SEC_RST_CX7_0",
+					"SEC_RST_CX7_1",
+					"SEC_CX0_SSD0_PRSNT_L",
+					"SEC_CX1_SSD1_PRSNT_L",
+					"SEC_CX_BOOT_CMPLT_CX0",
+					"SEC_CX_BOOT_CMPLT_CX1",
+					"SEC_CX_TWARN_CX0_L",
+					"SEC_CX_TWARN_CX1_L",
+					"SEC_CX_OVT_SHDN_CX0",
+					"SEC_CX_OVT_SHDN_CX1",
+					"SEC_FNP_L_CX0",
+					"SEC_FNP_L_CX1",
+					"",
+					"SEC_MCU_GPIO",
+					"SEC_MCU_RST_N",
+					"SEC_MCU_RECOVERY_N";
+			};
+
+			// IO Mezz 1 FRU EEPROM
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+
+			// OSFP 1 FRU EEPROM
+			eeprom@52 {
+				compatible = "atmel,24c128";
+				reg = <0x52>;
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
+			// IOB1 NIC0 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
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
+			// IOB1 NIC1 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+	};
+};
+
+&i2c1 {
+	status = "okay";
+
+	// PDB
+	power-monitor@12 {
+		compatible = "ti,lm5066i";
+		reg = <0x12>;
+	};
+
+	// PDB
+	power-monitor@14 {
+		compatible = "ti,lm5066i";
+		reg = <0x14>;
+	};
+
+	// Module 0
+	fanctl0: fan-controller@20{
+		compatible = "maxim,max31790";
+		reg = <0x20>;
+	};
+
+	// Module 0
+	fanctl1: fan-controller@23{
+		compatible = "maxim,max31790";
+		reg = <0x23>;
+	};
+
+	// Module 1
+	fanctl2: fan-controller@2c{
+		compatible = "maxim,max31790";
+		reg = <0x2c>;
+	};
+
+	// Module 1
+	fanctl3: fan-controller@2f{
+		compatible = "maxim,max31790";
+		reg = <0x2f>;
+	};
+
+	// Module 0 Leak Sensor
+	adc@34 {
+		compatible = "maxim,max1363";
+		reg = <0x34>;
+	};
+
+	// Module 1 Leak Sensor
+	adc@35 {
+		compatible = "maxim,max1363";
+		reg = <0x35>;
+	};
+
+	// PDB TEMP SENSOR
+	temperature-sensor@4e {
+		compatible = "ti,tmp1075";
+		reg = <0x4e>;
+	};
+
+	// PDB FRU EEPROM
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+	};
+
+	// PDB
+	vrm@60 {
+		compatible = "renesas,raa228004";
+		reg = <0x60>;
+	};
+
+	// PDB
+	vrm@61 {
+		compatible = "renesas,raa228004";
+		reg = <0x61>;
+	};
+
+	// Interposer
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
+		};
+		i2c1mux0ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x3>;
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
+			// Interposer TEMP SENSOR
+			temperature-sensor@4f {
+				compatible = "ti,tmp75";
+				reg = <0x4f>;
+			};
+
+			// Interposer FRU EEPROM
+			eeprom@54 {
+				compatible = "atmel,24c64";
+				reg = <0x54>;
+			};
+		};
+		i2c1mux0ch6: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x6>;
+
+			// Interposer IOEXP
+			io_expander5: gpio@27 {
+				compatible = "nxp,pca9554";
+				reg = <0x27>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names =
+					"JTAG_MUX_SEL",
+					"IOX_BMC_RESET",
+					"RTC_CLR_L",
+					"RTC_U77_ALRT_N",
+					"",
+					"PSU_ALERT_N",
+					"",
+					"RST_P12V_STBY_N";
+			};
+		};
+		i2c1mux0ch7: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x7>;
+
+			// FIO TEMP SENSOR
+			temperature-sensor@4b {
+				compatible = "ti,tmp75";
+				reg = <0x4b>;
+			};
+
+			// FIO FRU EEPROM
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	status = "okay";
+	// Module 0, Expander @0x20
+	io_expander0: gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"FPGA_THERM_OVERT_L-I",
+			"FPGA_READY_BMC-I",
+			"HMC_BMC_DETECT-O",
+			"HMC_PGOOD-O",
+			"",
+			"BMC_STBY_CYCLE-O",
+			"FPGA_EROT_FATAL_ERROR_L-I",
+			"WP_HW_EXT_CTRL_L-O",
+			"EROT_FPGA_RST_L-O",
+			"FPGA_EROT_RECOVERY_L-O",
+			"BMC_EROT_FPGA_SPI_MUX_SEL-O",
+			"USB2_HUB_RST_L-O",
+			"",
+			"SGPIO_EN_L-O",
+			"B2B_IOEXP_INT_L-I",
+			"I2C_BUS_MUX_RESET_L-O";
+	};
+
+	// Module 1, Expander @0x21
+	io_expander1: gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"SEC_FPGA_THERM_OVERT_L",
+			"SEC_FPGA_READY_BMC",
+			"SEC_HMC_BMC_DETECT",
+			"SEC_HMC_PGOOD",
+			"",
+			"SEC_BMC_SELF_POWER_CYCLE",
+			"SEC_SEC_FPGA_EROT_FATAL_ERROR_L",
+			"SEC_WP_HW_EXT_CTRL_L",
+			"SEC_EROT_FPGA_RST_L",
+			"SEC_FPGA_EROT_RECOVERY_L",
+			"SEC_BMC_EROT_FPGA_SPI_MUX_SEL",
+			"SEC_USB2_HUB_RST_L",
+			"",
+			"SEC_SGPIO_EN_L",
+			"SEC_IOB_IOEXP_INT_L",
+			"SEC_I2C_BUS_MUX_RESET_L";
+	};
+
+	// HMC Expander @0x27
+	io_expander2: gpio@27 {
+		compatible = "nxp,pca9555";
+		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"HMC_PRSNT_L-I",
+			"HMC_READY-I",
+			"HMC_EROT_FATAL_ERROR_L-I",
+			"I2C_MUX_SEL-O",
+			"HMC_EROT_SPI_MUX_SEL-O",
+			"HMC_EROT_RECOVERY_L-O",
+			"HMC_EROT_RST_L-O",
+			"GLOBAL_WP_HMC-O",
+			"FPGA_RST_L-O",
+			"USB2_HUB_RST-O",
+			"CPU_UART_MUX_SEL-O",
+			"",
+			"",
+			"",
+			"",
+			"";
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
+	io_expander3: gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"RTC_MUX_SEL",
+			"PCI_MUX_SEL",
+			"TPM_MUX_SEL",
+			"FAN_MUX-SEL",
+			"SGMII_MUX_SEL",
+			"DP_MUX_SEL",
+			"UPHY3_USB_SEL",
+			"NCSI_MUX_SEL",
+			"BMC_PHY_RST",
+			"RTC_CLR_L",
+			"BMC_12V_CTRL",
+			"PS_RUN_IO0_PG",
+			"",
+			"",
+			"",
+			"";
+	};
+
+	rtc@6f {
+		compatible = "nuvoton,nct3018y";
+		reg = <0x6f>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+	// SCM TEMP SENSOR BOARD
+	temperature-sensor@4b {
+		compatible = "national,lm75b";
+		reg = <0x4b>;
+	};
+
+	// SCM CPLD IOEXP
+	io_expander4: gpio@4f {
+		compatible = "nxp,pca9555";
+		reg = <0x4f>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"stby_power_en_cpld",
+			"stby_power_gd_cpld",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"";
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
+	multi-master;
+	mctp-controller;
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
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
+	};
+};
+
+&i2c12 {
+	status = "okay";
+	multi-master;
+
+	// HPM 1 FRU EEPROM
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+	// CBC 2 FRU
+	eeprom@54 {
+		compatible = "atmel,24c02";
+		reg = <0x54>;
+	};
+	// CBC 3 FRU
+	eeprom@55 {
+		compatible = "atmel,24c02";
+		reg = <0x55>;
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
+		gpio-line-names =
+			"wSequence_Latch_State_N",
+			"wP12V_N1N2_RUNTIME_FLT_N",
+			"wP12V_FAN_RUNTIME_FLT_N",
+			"wP12V_AUX_RUNTIME_FLT_N",
+			"wHost_PERST_SEQPWR_FLT_N",
+			"wP12V_N1N2_SEQPWR_FLT_N",
+			"wP12V_FAN_SEQPWR_FLT_N",
+			"wP12V_AUX_SEQPWR_FLT_N",
+			"wP12V_RUNTIME_FLT_NIC1_N",
+			"wAUX_RUNTIME_FLT_NIC1_N",
+			"wP12V_SEQPWR_FLT_NIC1_N",
+			"wAUX_SEQPWR_FLT_NIC1_N",
+			"wP12V_RUNTIME_FLT_NIC0_N",
+			"wAUX_RUNTIME_FLT_NIC0_N",
+			"wP12V_SEQPWR_FLT_NIC0_N",
+			"wAUX_SEQPWR_FLT_NIC0_N";
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
+		gpio-line-names =
+			"FM_P12V_NIC1_FLTB_R_N",
+			"FM_P3V3_NIC1_FAULT_R_N",
+			"FM_P12V_NIC0_FLTB_R_N",
+			"FM_P3V3_NIC0_FAULT_R_N",
+			"P48V_HS2_FAULT_N_PLD",
+			"P48V_HS1_FAULT_N_PLD",
+			"P12V_AUX_FAN_OC_PLD_N",
+			"P12V_AUX_FAN_FAULT_PLD_N",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"FM_SYS_THROTTLE_N",
+			"OCP_V3_2_PWRBRK_FROM_HOST_ISO_PLD_N",
+			"OCP_SFF_PWRBRK_FROM_HOST_ISO_PLD_N";
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
+		gpio-line-names =
+			"P12V_AUX_PSU_SMB_ALERT_R_L",
+			"P12V_SCM_SENSE_ALERT_R_N",
+			"P12V_AUX_NIC1_SENSE_ALERT_R_N",
+			"P12V_AUX_NIC0_SENSE_ALERT_R_N",
+			"NODEB_PSU_SMB_ALERT_R_L",
+			"NODEA_PSU_SMB_ALERT_R_L",
+			"P12V_AUX_FAN_ALERT_PLD_N",
+			"P52V_SENSE_ALERT_PLD_N",
+			"PRSNT_RJ45_FIO_N_R",
+			"FM_MAIN_PWREN_RMC_EN_ISO_R",
+			"CHASSIS3_LEAK_Q_N_PLD",
+			"CHASSIS2_LEAK_Q_N_PLD",
+			"CHASSIS1_LEAK_Q_N_PLD",
+			"CHASSIS0_LEAK_Q_N_PLD",
+			"",
+			"SMB_RJ45_FIO_TMP_ALERT";
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
+		gpio-line-names =
+			"FAN_7_PRESENT_N",
+			"FAN_6_PRESENT_N",
+			"FAN_5_PRESENT_N",
+			"FAN_4_PRESENT_N",
+			"FAN_3_PRESENT_N",
+			"FAN_2_PRESENT_N",
+			"FAN_1_PRESENT_N",
+			"FAN_0_PRESENT_N",
+			"HP_LVC3_OCP_V3_2_PRSNT2_PLD_N",
+			"HP_LVC3_OCP_V3_1_PRSNT2_PLD_N",
+			"PRSNT_HDDBD_POWER_CABLE_N",
+			"PRSNT_OSFP0_POWER_CABLE_N",
+			"PRSNT_CHASSIS3_LEAK_CABLE_R_N",
+			"PRSNT_CHASSIS2_LEAK_CABLE_R_N",
+			"PRSNT_CHASSIS1_LEAK_CABLE_R_N",
+			"PRSNT_CHASSIS0_LEAK_CABLE_R_N";
+	};
+
+	// PDB CPLD IOEXP 0x14
+	io_expander13: gpio@14 {
+		compatible = "nxp,pca9555";
+		reg = <0x14>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"rmc_en_dc_pwr_on",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"leak_config_0",
+			"leak_config_1",
+			"leak_config_2",
+			"leak_config_3",
+			"mfg_led_test_mode_l",
+			"small_leak_err_inj",
+			"large_leak_err_inj",
+			"";
+	};
+};
+
+&i2c15 {
+	status = "okay";
+	multi-master;
+	mctp-controller;
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
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
+&mac2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ncsi3_default>;
+	use-ncsi;
+};
+
+&mac3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ncsi4_default>;
+	use-ncsi;
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

-- 
2.43.0


