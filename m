Return-Path: <linux-renesas-soc+bounces-32778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPH5CEXNC2oROQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 04:39:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B6465576796
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 04:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 98240300F5E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 02:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B313225BF13;
	Tue, 19 May 2026 02:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjH3e5aQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984343254B3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 02:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779158338; cv=none; b=dxGeDpKJNuWtvwkrDrY7lF1ncgE8lcnBeQgSVHOkYlat7iErRbdWazlHSmGbXZp75OPe4GjeIEU1ft4MYhBpyDix+8fSQe9aT/FagP2XIIf4kkVl4uwzhlysqnNxXb+LcAkOmLyGJGOLTfAT9dfLSOho/ZS8Ml6G9O8Slzg7Txw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779158338; c=relaxed/simple;
	bh=g00xaZ85ltdSLNuXqb0ahdfjlgLK47VhPTdOExgO4vY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gKJUsB7P3UGQ5w/thgy5OfM2Xr+2UvCPfcN9WvMxiJyewQs4JWTCxhCWjA+hUa5rtcArX3kPoNwMfapqxbIk1rYWRU/oOzkVi3Zyv71DCjW8cOtJZpd2Wx4iuIIPIsHTNnssKnwPomY39JhjDcJlPx+bikL2uo1yZjNBXGwS9/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjH3e5aQ; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3697421c2a8so1410929a91.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 19:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779158336; x=1779763136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZk2w9gQb7pz6jsnHvpGNE3LQPCwsGOqmxwmPC0N+9k=;
        b=bjH3e5aQAghxh4eZ3MGJR19eqqeptmRb90ETDl4ZrywJADlJZsHKhoMXoa3/Tew1Bv
         7kFWmhW8sMWfyrN4AzGDW5yf+deJVkPf+jEpktqp/9dDLlsGeR4W9PsNcett8juvsdR4
         TzAPdmVJtsNjgAdp5W7Ado2e/Q9dEHBeByQadBiMJMkJHyyvZSL0hajERjjc06emqpDj
         ImYpkj7wEFgZ/XGOA54gsXgNOxHNqX1brumo12l+TGZlqpmPlOGd+SZbRyOPCxBTzETz
         nPhJ3WxHjUzOlbrQXbNWNrxTcXUzbnZ7tjB44AFDxgtsVlM/ufSDHzLPJkuIZCPvfZIT
         7oUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779158336; x=1779763136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qZk2w9gQb7pz6jsnHvpGNE3LQPCwsGOqmxwmPC0N+9k=;
        b=AY6n7mQia0NW696JJgNegduglKnUc+H653bR7wHV4F5Z/g/poR+U9jihdtWA3ryWIF
         YQL12z22cAR75LTDolXsKMMH3z1ILrfyxWimaCCQ4LQ5zcpyf9fWNiJoZNUMvkvZcSuo
         /tgDFGjIKsq7YgqyHvAUq+NXBvSJjDw6VOgP6ixaQJ355awoDuq77kA7H9gTuRbVhDZK
         IFz+54EcZJiuXJtBk5uZnPe9+GbVfuRkqZSkpdWKH2MiHjPUyVY3B3f93bnL8cNCnSBX
         UZuXNx6egZqMOSf+zQbZJJCw/AILJ1ya2prIzRRBMzqaRmVXN4UWUgcAx2e3nrxNuG41
         ZHgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dPngHjA4AtXBh4habPM/St9llMqLVYeGZW9Swxq6dp1r1E6Jl5UZkcXdkyiwrIpSsB9NPzSLR592phbtGxtOTkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YznboZ0mv9GBYlOeWrk6BWTFDJHL71q86McEN0o0jW1tmF8BjjR
	Fifyy7QuDoJuq5RSwxrSQhdRayrORSnqIAgU14M7U0sKXFPgmEeCTLkZ
X-Gm-Gg: Acq92OEMr1p5NDQ6kGoVc1v9k7pG0RJnj/QwuF9Xj3zYELfN4rEqzX29xY8RZ65GIv4
	C0//sz9phs7lmNWIcy9V+7MITddzoPW7H2lgx5HQKwGD8avvJlq+XY3+d/3AecU8z0A4MCOA/7q
	uYSIYBn2kX3B4EyvS05qAC1XG6q84mKtssmO4IiDQL+P58BjjLTWucY+fqSRRETILXaBaeSjSXR
	o+7R8rbhZa7gEHstwNS2K5x5yNrnn02SmcoC8bolsYlwGEwogupRT9ykyCQeTBdtl+Cg8JxCloR
	kqwjBLHVI9JoO4xSpURTD5HkDdFEP36jTqQVfgmkkUkcvR2GB6hWXFDOhQ/ncZiKQaWYA14TPSb
	SIL2jytANB8wOmCyuF4i/RFmZFFlC5GoKYpwDaHnP8OdGTWcCc+xO2aD5tKvWTs7CDpy8Dxv1+s
	KiS0oxjV2Dkrf0wlQN5MhJPY9Y+pBBOTAwpFHUgUe3xbZV5/3CD0Q60EV0iSlW/dgs+MY4WP+fD
	YVQWPNvaxuO0xzR5MgynDRG
X-Received: by 2002:a17:90b:3505:b0:366:aba:4c86 with SMTP id 98e67ed59e1d1-36951dd5abemr17393983a91.27.1779158335846;
        Mon, 18 May 2026 19:38:55 -0700 (PDT)
Received: from open.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695124601asm12407713a91.2.2026.05.18.19.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 19:38:55 -0700 (PDT)
From: Neil Cheng <neilcheng0417@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Neil Cheng <neilcheng0417@gmail.com>
Subject: [PATCH v2 2/2] ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC
Date: Tue, 19 May 2026 10:38:38 +0800
Message-Id: <a48c9b49041fe5337087cd16539eae09825d6343.1779157117.git.neilcheng0417@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1779157117.git.neilcheng0417@gmail.com>
References: <cover.1779157117.git.neilcheng0417@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,jms.id.au,codeconstruct.com.au,glider.be,gmail.com];
	TAGGED_FROM(0.00)[bounces-32778-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neilcheng0417@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.ozlabs.org,gmail.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B6465576796
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree for the Meta (Facebook) Rainiera6 compute node, based on
AST2600 BMC.

Signed-off-by: Neil Cheng <neilcheng0417@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-rainiera6.dts  | 1012 +++++++++++++++++
 2 files changed, 1013 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 767f7c7652d5..215429af1135 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -34,6 +34,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-harma.dtb \
 	aspeed-bmc-facebook-minerva.dtb \
 	aspeed-bmc-facebook-minipack.dtb \
+	aspeed-bmc-facebook-rainiera6.dtb \
 	aspeed-bmc-facebook-santabarbara.dtb \
 	aspeed-bmc-facebook-tiogapass.dtb \
 	aspeed-bmc-facebook-wedge40.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts
new file mode 100644
index 000000000000..b29e08cea254
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts
@@ -0,0 +1,1012 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2026 Facebook Inc.
+
+/dts-v1/;
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/i2c/i2c.h>
+
+/ {
+	model = "Facebook Rainier BMC";
+	compatible = "facebook,rainiera6-bmc", "aspeed,ast2600";
+
+	aliases {
+		i2c16 = &i2c5mux0ch0;
+		i2c17 = &i2c5mux0ch1;
+		i2c18 = &i2c5mux1ch0;
+		i2c19 = &i2c5mux1ch1;
+		i2c20 = &i2c6mux0ch0;
+		i2c21 = &i2c6mux0ch1;
+		i2c22 = &i2c6mux0ch2;
+		i2c23 = &i2c6mux0ch3;
+		i2c24 = &i2c8mux0ch0;
+		i2c25 = &i2c8mux0ch1;
+		i2c26 = &i2c8mux0ch2;
+		i2c27 = &i2c8mux0ch3;
+		i2c28 = &i2c26mux0ch0;
+		i2c29 = &i2c26mux0ch1;
+		i2c30 = &i2c26mux0ch2;
+		i2c31 = &i2c26mux0ch3;
+		serial0 = &uart1;
+		serial2 = &uart3;
+		serial3 = &uart4;
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial4:57600n8";
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+					  <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+					  <&adc1 2>;
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
+			label = "power_fault_amber";
+			default-state = "off";
+			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	p1v8_adc_vref: regulator-p1v8-aux {
+		compatible = "regulator-fixed";
+		regulator-name = "p1v8_adc_vref";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	spi_gpio: spi {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
+		num-chipselects = <1>;
+		status = "okay";
+
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
+};
+
+&adc0 {
+	vref-supply = <&p1v8_adc_vref>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+				 &pinctrl_adc2_default &pinctrl_adc3_default
+				 &pinctrl_adc4_default &pinctrl_adc5_default
+				 &pinctrl_adc6_default &pinctrl_adc7_default>;
+	status = "okay";
+};
+
+&adc1 {
+	aspeed,int-vref-microvolt = <2500000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc10_default>;
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-128.dtsi"
+	};
+
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
+	/*B0-B7*/	"BATTERY_DETECT","","BMC_I2C1_FPGA_ALERT_L","BMC_READY_R",
+				"IOEXP_INT_3V3_L_R1","FM_ID_LED","","",
+	/*C0-C7*/	"BMC_GPIOC0","","","","PMBUS_REQ_N","PSU_FW_UPDATE_REQ_N","",
+				"BMC_I2C_SSIF_ALERT_L",
+	/*D0-D7*/	"","","","","BMC_GPIOD4","","","",
+	/*E0-E7*/	"BMC_GPIOE0","BMC_GPIOE1","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"FM_BMC_MUX1_SEL_R","","","","","","FM_DEBUG_PORT_PRSNT_R1_N",
+			"FM_BMC_DBP_PRESENT_R_N",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","FLASH_WP_STATUS_R1","BMC_JTAG_MUX_SEL","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"PCIE_EP_RST_EN","BMC_FRU_WP","SCM_HPM_STBY_RST_N",
+				"SCM_HPM_STBY_R_EN","STBY_POWER_PG_3V3_R","TH500_SHDN_OK_L","","",
+	/*N0-N7*/	"LED_POSTCODE_0","LED_POSTCODE_1","LED_POSTCODE_2",
+				"LED_POSTCODE_3","LED_POSTCODE_4","LED_POSTCODE_5",
+				"LED_POSTCODE_6","LED_POSTCODE_7",
+	/*O0-O7*/	"RUN_POWER_PG","PWR_BRAKE_L","CHASSIS_AC_LOSS_L",
+				"BSM_PRSNT_R_N","PSU_SMB_ALERT_L","FM_TPM_PRSNT_0_N",
+				"PSU_FW_UPDATING_N","DEBUG_CARD_BYPASS",
+	/*P0-P7*/	"PWR_BTN_BMC_R1_N","IPEX_CABLE_PRSNT_L","ID_RST_BTN_BMC_R_N",
+				"RST_BMC_RSTBTN_OUT_R_N","BMC_PWR_LED","RUN_POWER_EN",
+				"SHDN_FORCE_L","BMC_HEARTBEAT_N",
+	/*Q0-Q7*/	"IRQ_PCH_TPM_SPI_LV3_N","USB_OC0_REAR_R_N","UART_MUX_SEL",
+				"I2C_MUX_RESET_L","RSVD_NV_PLT_DETECT","SPI_TPM_INT_L",
+				"CPU_JTAG_MUX_SELECT","THERM_BB_OVERT_L",
+	/*R0-R7*/	"THERM_BB_WARN_L","SPI_BMC_FPGA_INT_L","CPU_BOOT_DONE",
+				"PMBUS_GNT_L","CHASSIS_PWR_BRK_L","PCIE_WAKE_L","PDB_THERM_OVERT_L",
+				"SHDN_REQ_L",
+	/*S0-S7*/	"","","SYS_BMC_PWRBTN_R_N","FM_TPM_PRSNT_1_N",
+				"FM_BMC_DEBUG_SW_N","UID_LED_N","SYS_FAULT_LED_N",
+				"RUN_POWER_FAULT_L",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"L2_RST_REQ_OUT_L","L0L1_RST_REQ_OUT_L","BMC_ID_BEEP_SEL_R1",
+				"BMC_I2C0_FPGA_ALERT_L","SMB_BMC_TMP_ALERT","PWR_LED_N",
+				"SYS_RST_OUT_L","IRQ_TPM_SPI_N",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","FM_DBP_CPU_PREQ_GF_N_R1","","","","","","",
+	/*Y0-Y7*/	"","RST_BMC_SELF_HW_R1","FM_FLASH_LATCH_N_R1","",
+				"BMC_GPIOY4_R","BMC_GPIOY5_R","","",
+	/*Z0-Z7*/	"","","","","","","BMC_GPIOZ6_R","BMC_GPIOZ7_R";
+};
+
+&gpio1 {
+	gpio-line-names =
+	/*18A0-18A7*/	"","","","","","","","",
+	/*18B0-18B7*/	"","","","","FM_BOARD_BMC_REV_ID0","FM_BOARD_BMC_REV_ID1",
+			"FM_BOARD_BMC_REV_ID2","",
+	/*18C0-18C7*/	"","","SPI_BMC_BIOS_ROM_IRQ0_R_N","","","","","",
+	/*18D0-18D7*/	"","","","","","","","",
+	/*18E0-18E3*/	"FM_BMC_PROT_LS_EN","AC_PWR_BMC_BTN_R_N","","";
+};
+
+/* Rainiera6 SoC SSIF */
+&i2c1 {
+	status = "okay";
+
+	ssif_bmc: ssif-bmc@10 {
+		compatible = "ssif-bmc";
+		reg = <0x10>;
+		status = "okay";
+	};
+};
+
+/* MCIO 2A I2C */
+&i2c2 {
+	status = "okay";
+};
+
+&i2c4 {
+	multi-master;
+	mctp-controller;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	/* OCP NIC TEMP */
+	temperature-sensor@1f {
+		compatible = "ti,tmp421";
+		reg = <0x1f>;
+	};
+
+	/* OCP NIC FRU EEPROM */
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+};
+
+&i2c5 {
+	status = "okay";
+
+	gpio-expander@22 {
+		compatible = "nxp,pca9535";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"JTAG_BMC_IOEXP_MUX_OE", "JTAG_BMC_MCIO_MUX_S1",
+			"JTAG_BMC_MCIO_MUX_S0", "JTAG_IOEXP_BMC_MUX_SEL",
+			"FM_USB_MUX_1_OE_N", "FM_USB_MUX_2_OE_N",
+			"PROGRAMN_CPLD", "",
+			"", "",
+			"", "",
+			"", "",
+			"", "";
+	};
+
+	/* I2C MUX for MCIO 1A */
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c5mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c5mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	/* I2C MUX for MCIO 0A */
+	i2c-mux@77 {
+		compatible = "nxp,pca9546";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c5mux1ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c5mux1ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&i2c6 {
+	status = "okay";
+
+	/* I2C MUX for PWRPIC #13 ~ #16 */
+	i2c-mux@77 {
+		compatible = "nxp,pca9546";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		/* PWRPIC #13 */
+		i2c6mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* PWRPIC #14 */
+		i2c6mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* PWRPIC #16 */
+		i2c6mux0ch2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* PWRPIC #15 */
+		i2c6mux0ch3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&i2c7 {
+	multi-master;
+	status = "okay";
+
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
+&i2c8 {
+	status = "okay";
+
+	power-monitor@14 {
+		compatible = "infineon,xdp710";
+		reg = <0x14>;
+	};
+
+	adc@1d {
+		compatible = "ti,adc128d818";
+		reg = <0x1d>;
+		ti,mode = /bits/ 8 <1>;
+	};
+
+	/* PDB IOEXP0 */
+	pdb_io_expander0: gpio-expander@24 {
+		compatible = "nxp,pca9555";
+		reg = <0x24>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <92 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"FM_P52V_AUX_FLT_N","FM_P12V_AUX_ALERT_N",
+			"FM_SLOT1_HSC_FAULT","FM_SLOT2_HSC_FAULT",
+			"FM_SLOT3_HSC_FAULT","FM_SLOT4_HSC_FAULT",
+			"FM_SLOT5_HSC_FAULT","FM_SLOT6_HSC_FAULT",
+			"PRSNT_FAN0","PRSNT_FAN1",
+			"PRSNT_FAN2","PRSNT_FAN3",
+			"","",
+			"","INT_SLOT";
+	};
+
+	/* PDB IOEXP1 */
+	gpio-expander@25 {
+		compatible = "nxp,pca9555";
+		reg = <0x25>;
+		interrupt-parent = <&pdb_io_expander0>;
+		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"SLOT1_CM_UPDATE","SLOT2_CM_UPDATE",
+			"SLOT3_CM_UPDATE","SLOT4_CM_UPDATE",
+			"SLOT5_CM_UPDATE","SLOT6_CM_UPDATE",
+			"","",
+			"","",
+			"","",
+			"","",
+			"","";
+	};
+
+	power-sensor@40 {
+		compatible = "ti,ina238";
+		reg = <0x40>;
+		shunt-resistor = <1000>;
+	};
+
+	/* PADDLE BD IOEXP */
+	gpio-expander@41 {
+		compatible = "nxp,pca9536";
+		reg = <0x41>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"HSC_OC_GPIO0", "HSC_OC_GPIO1",
+			"HSC_OC_GPIO2", "HSC_OC_GPIO3";
+	};
+
+	power-sensor@42 {
+		compatible = "ti,ina238";
+		reg = <0x42>;
+		shunt-resistor = <1000>;
+	};
+
+	power-monitor@43 {
+		compatible = "lltc,ltc4287";
+		reg = <0x43>;
+		shunt-resistor-micro-ohms = <100>;
+	};
+
+	power-sensor@44 {
+		compatible = "ti,ina238";
+		reg = <0x44>;
+		shunt-resistor = <1000>;
+	};
+
+	power-sensor@45 {
+		compatible = "ti,ina238";
+		reg = <0x45>;
+		shunt-resistor = <1000>;
+	};
+
+	power-monitor@46 {
+		compatible = "mps,mp5998";
+		reg = <0x46>;
+	};
+
+	power-monitor@47 {
+		compatible = "ti,tps25990";
+		reg = <0x47>;
+		ti,rimon-micro-ohms = <430000000>;
+	};
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp75";
+		reg = <0x48>;
+	};
+
+	temperature-sensor@49 {
+		compatible = "ti,tmp75";
+		reg = <0x49>;
+	};
+
+	/* PDB FRU */
+	eeprom@56 {
+		compatible = "atmel,24c128";
+		reg = <0x56>;
+	};
+
+	/* Paddle BD FRU */
+	eeprom@57 {
+		compatible = "atmel,24c128";
+		reg = <0x57>;
+	};
+
+	power-monitor@58 {
+		compatible = "renesas,isl28022";
+		reg = <0x58>;
+		shunt-resistor-micro-ohms = <10000>;
+	};
+
+	power-monitor@59 {
+		compatible = "renesas,isl28022";
+		reg = <0x59>;
+		shunt-resistor-micro-ohms = <10000>;
+	};
+
+	power-monitor@5a {
+		compatible = "renesas,isl28022";
+		reg = <0x5a>;
+		shunt-resistor-micro-ohms = <10000>;
+	};
+
+	power-monitor@5b {
+		compatible = "renesas,isl28022";
+		reg = <0x5b>;
+		shunt-resistor-micro-ohms = <10000>;
+	};
+
+	psu@5c {
+		compatible = "renesas,raa228006";
+		reg = <0x5c>;
+	};
+
+	fan-controller@5e{
+		compatible = "maxim,max31790";
+		reg = <0x5e>;
+	};
+
+	/* I2C MUX for PWRPIC #1, #2, #11, #12 */
+	i2c-mux@77 {
+		compatible = "nxp,pca9546";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		/* PWRPIC #1 */
+		i2c8mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* PWRPIC #2 */
+		i2c8mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* PWRPIC #12 (Connector to CXL BD) */
+		i2c8mux0ch2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			i2c-mux@70 {
+				compatible = "nxp,pca9546";
+				reg = <0x70>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				i2c-mux-idle-disconnect;
+				i2c26mux0ch0: i2c@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+				i2c26mux0ch1: i2c@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+				i2c26mux0ch2: i2c@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					/* CXL FRU */
+					eeprom@50 {
+						compatible = "atmel,24c64";
+						reg = <0x50>;
+					};
+				};
+				i2c26mux0ch3: i2c@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+
+		/* PWRPIC #11 */
+		i2c8mux0ch3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&i2c9 {
+	status = "okay";
+
+	temperature-sensor@4b {
+		compatible = "ti,tmp75";
+		reg = <0x4b>;
+	};
+
+	/* SCM FRU */
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+	};
+
+	/* BSM FRU */
+	eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+	};
+};
+
+/* MCIO 0A I2C */
+&i2c10 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+
+	/* I2C11_IOEXP_3 */
+	gpio-expander@20 {
+		compatible = "nxp,pca9535";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"IRQ_INA230_FAN0_ALERT_N_CPLD", "IRQ_INA230_FAN1_ALERT_N_CPLD",
+			"IRQ_INA230_FAN2_ALERT_N_CPLD", "IRQ_INA230_FAN3_ALERT_N_CPLD",
+			"IRQ_INA230_P12V_DIMM_0_ALERT_N", "IRQ_INA230_P12V_DIMM_1_ALERT_N",
+			"IRQ_P3V3_E1S_0_FLT_N", "P12V_E1S_0_FAULT_R_N",
+			"IRQ_P3V3_E1S_1_FLT_N", "P12V_E1S_1_FAULT_R_N",
+			"IRQ_P3V3_NIC_FLT_N", "P12V_NIC_FAULT_R_N",
+			"SMB_SENSOR_ALERT_N", "FW_CPLD_RST_RTC_RST_R1",
+			"RTC_CLR", "RTC_U11_ALRT_N";
+	};
+
+	/* I2C11_IOEXP_2 */
+	gpio-expander@21 {
+		compatible = "nxp,pca9535";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"FAN_0_PRESENT_CPLD", "FAN_1_PRESENT_CPLD",
+			"FAN_2_PRESENT_CPLD", "FAN_3_PRESENT_CPLD",
+			"FAN_FAIL_L_CPLD", "FULL_SPEED_N_R_CPLD",
+			"P12V_FAN0_PWRGD_CPLD", "P12V_FAN1_PWRGD_CPLD",
+			"P12V_FAN2_PWRGD_CPLD", "P12V_FAN3_PWRGD_CPLD",
+			"FM_P12V_FAN0_FLTB_N_CPLD", "FM_P12V_FAN1_FLTB_N_CPLD",
+			"FM_P12V_FAN2_FLTB_N_CPLD", "FM_P12V_FAN3_FLTB_N_CPLD",
+			"P12V_FAN_EN_R_CPLD", "";
+	};
+
+	/* I2C11_IOEXP_1 */
+	gpio-expander@27 {
+		compatible = "nxp,pca9535";
+		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"PWRGD_P12V_SCM", "PWRGD_P5V_STBY",
+			"PWRGD_P3V3_STBY", "PWRGD_P1V8_STBY",
+			"PWRGD_P1V2_STBY", "PWRGD_P1V1_STBY",
+			"PWRGD_P1V0_STBY", "",
+			"", "",
+			"", "",
+			"", "",
+			"", "";
+	};
+
+	power-sensor@40 {
+		compatible = "ti,ina230";
+		reg = <0x40>;
+		shunt-resistor = <1000>;
+	};
+
+	power-sensor@41 {
+		compatible = "ti,ina230";
+		reg = <0x41>;
+		shunt-resistor = <1000>;
+	};
+
+	power-sensor@42 {
+		compatible = "ti,ina230";
+		reg = <0x42>;
+		shunt-resistor = <2000>;
+	};
+
+	power-sensor@43 {
+		compatible = "ti,ina230";
+		reg = <0x43>;
+		shunt-resistor = <2000>;
+	};
+
+	power-sensor@44 {
+		compatible = "ti,ina230";
+		reg = <0x44>;
+		shunt-resistor = <2000>;
+	};
+
+	power-sensor@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
+
+	adc@49 {
+		compatible = "ti,ads7830";
+		reg = <0x49>;
+	};
+
+	adc@4a {
+		compatible = "ti,ads7830";
+		reg = <0x4a>;
+	};
+
+	adc@4b {
+		compatible = "ti,ads7830";
+		reg = <0x4b>;
+	};
+	rtc@6f {
+		compatible = "nuvoton,nct3018y";
+		reg = <0x6f>;
+		status = "okay";
+	};
+};
+
+/* MCIO 4A I2C */
+&i2c12 {
+	multi-master;
+	mctp-controller;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+};
+
+&i2c13 {
+	status = "okay";
+
+	fan-controller@20 {
+		compatible = "maxim,max31790";
+		reg = <0x20>;
+	};
+
+	power-sensor@40 {
+		compatible = "ti,ina230";
+		reg = <0x40>;
+		shunt-resistor = <2000>;
+	};
+
+	power-sensor@41 {
+		compatible = "ti,ina230";
+		reg = <0x41>;
+		shunt-resistor = <2000>;
+	};
+
+	power-sensor@44 {
+		compatible = "ti,ina230";
+		reg = <0x44>;
+		shunt-resistor = <2000>;
+	};
+
+	power-sensor@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
+
+	temperature-sensor@48 {
+		compatible = "national,lm75b";
+		reg = <0x48>;
+	};
+
+	temperature-sensor@49 {
+		compatible = "national,lm75b";
+		reg = <0x49>;
+	};
+
+	/* MB FRU */
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+	};
+};
+
+/* PROT reserve */
+&i2c14 {
+	status = "okay";
+};
+
+/* MCIO 3A I2C */
+&i2c15 {
+	status = "okay";
+};
+
+&mac2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ncsi3_default>;
+	use-ncsi;
+	status = "okay";
+};
+
+&pinctrl {
+	pinctrl_ncsi3_default: ncsi3_default {
+		function = "RMII3";
+		groups = "NCSI3";
+	};
+};
+
+&sgpiom0 {
+	status = "okay";
+	ngpios = <128>;
+	bus-frequency = <2000000>;
+	gpio-line-names =
+	/*"input pin","output pin"*/
+	"SOC_ERROR_N_CPLD","RST_SOC_SRST_N_CPLD",
+	"SOC_ELASTOPCLK_N","SOC_BMC_READY_CPLD",
+	"SOC_LINKSTOP_N","wIBB_BMC_SRST_OUT",
+	"SOC_POST_COMPLETE_CPLD","I3C_MUX_SEL_DIMM_C0_024",
+	"SOC_RESETREQ","I3C_MUX_SEL_DIMM_C0_135",
+	"SOC_SYS_PWRDN_CPLD","I3C_MUX_SEL_DIMM_C1_024",
+	"SOC_PORQ","I3C_MUX_SEL_DIMM_C1_135",
+	"SOC_HOT_N_CPLD","BOOT_PWRDIS_CPLD",
+	// IOB0-IOB7 bit8-15
+	"PWRGD_V1P8_CPU","HDD0_PERST_N_CPLD",
+	"PWRGD_V1P26_CPLD","HDD1_PERST_N_CPLD",
+	"PWRGD_V1P2","MCIO_1A_PWRDIS_R",
+	"","",
+	"FM_CONFIG_ID","P3V_BAT_SCALED_EN",
+	"wALL_POWER_OK","PERST_CEM0_N_CPLD",
+	"wANDGATE_ALL_POWER_GD","PERST_CEM1_N_CPLD",
+	"wAC_CYCLE_12V","PERST_PLD_TUSB7340_N",
+	// IOC0-IOC7 bit16-23
+	"wAC_CYCLE_54V","FM_USB_MUX_SEL_CPLD",
+	"FM_PLD_CLKS_DEV_EN","SMB_BOOT_RST_N_CPLD",
+	"PWRGD_P1V2_STBY","SMB_MCIO_0A_RST_R_N",
+	"wIBB_BMC_SRST","RST_SMB_NIC_R_N",
+	"PWRGD_P12V_E1S_0","FM_PPS_NIC_IN_BUF_OE_N_R",
+	"PWRGD_P12V_E1S_1","FM_BUF_PPS_NIC_IN_EN_CPLD",
+	"","FM_NIC_PPS_IN_OE_CPLD",
+	"PWRGD_P12V_NIC","FM_PPS_NIC_IN_S0_CPLD",
+	// IOD0-IOD7 bit24-31
+	"wALL_POWER_OK_1","FM_NIC_PPS_IN_S1",
+	"wALL_POWER_OK_2","FM_PPS_NIC_OUT_CPU_OE_N",
+	"PWRGD_EAST_DIMM_CPLD","",
+	"PWRGD_WEST_DIMM_CPLD","FM_BUF_PPS_NIC_OUT_EN_CPLD",
+	"PWRGD_NIC_CPLD","",
+	"","PMBUS_MUX_SEL_C0",
+	"PHOENIX_PWRBTN_N_CPLD","PMBUS_MUX_SEL_C1",
+	"IRQ_INA230_E1S_0_ALERT_N","",
+	// IOE0-IOE7 bit32-39
+	"IRQ_INA230_E1S_1_ALERT_N","PWR_ON_RST_TUSB7340_CPLD",
+	"","RST_PCIE_BOOT_PERST_N_CPLD",
+	"FM_NIC_WAKE_N_CPLD","RST_PCIE_CPLD_NIC_N_CPLD",
+	"FM_TPM_CONN_PRSNT_N","RST_PCIE_MCIO_0A_PERST_N_CPLD",
+	"HDD0_PRSNT_N_CPLD","RST_PCIE_MCIO_0B_PERST_N_CPLD",
+	"IRQ_INA230_P12V_NIC_ALERT_N","RST_PCIE_MCIO_1A_PERST_N_CPLD",
+	"IRQ_INA230_P12V_SCM_ALERT_N","RST_PCIE_MCIO_1A_SA_PERST_N_CPL",
+	"IRQ_PMBUS_ALERT_PWR11_R_N","RST_PCIE_MCIO_1B_PERST_N_CPLD",
+	// IOF0-IOF7 bit40-47
+	"CHASSIS_LEAK_2A_R_N","RST_PCIE_MCIO_2A_PERST_N_CPLD",
+	"CHASSIS_LEAK_3A_R_N","RST_PCIE_MCIO_2B_PERST_N_CPLD",
+	"CHASSIS_LEAK_4A_R_N","RST_PCIE_MCIO_3A_PERST_N_CPLD",
+	"OC_ALERT_PADDLE_R_N","RST_PCIE_MCIO_3B_PERST_N_CPLD",
+	"OC_ALERT_PWR2_R_N","RST_PCIE_MCIO_4A_PERST_N_CPLD",
+	"OC_ALERT_PWR11_R_N","RST_PCIE_MCIO_4B_PERST_N_CPLD",
+	"FM_IOE_ALT_N","RST_PERST1_N_CPLD",
+	"LEAK_DETECT_1_PWR14_R_N","RST_PERST2_N_CPLD",
+	// IOG0-IOG7 bit48-55
+	"LEAK_DETECT_2_PWR14_R_N","RST_PERST3_N_CPLD",
+	"LEAK_DETECT_1_PWR15_R_N","RST_SMB_MUX_MCIO_0A_R_N",
+	"LEAK_DETECT_2_PWR15_R_N","RST_SMB_MUX_MCIO_1A_R_N",
+	"MCIO_0A_SMB_ALERT_N","RST_SOC_EXTWARMRESET_CPLD",
+	"MCIO_1A_SMB_ALERT_N","RST_SOC_PORESET_N_BMC",
+	"MCIO_2A_SMB_ALERT_N","RST_USB_HUB_R_N",
+	"MCIO_2B_SMB_ALERT_N","SMB_MM7_MUX_RESET_N",
+	"MCIO_3A_SMB_ALERT_N","SMB_MUX_RESET_N_CPLD",
+	// IOH0-IOH7 bit56-63
+	"MCIO_3B_SMB_ALERT_N","SOC_I2C_0_ALERT_CPLD",
+	"MCIO_4A_SMB_ALERT_N","SOC_LINKSTOP_OUT_N",
+	"MCIO_4B_SMB_ALERT_N","SPI_TPM_RST_R_N",
+	"MCIO_1A_THERMTRIP_N","",
+	"MCIO_2A_THERMTRIP_N","",
+	"MCIO_3A_THERMTRIP_N","",
+	"MCIO_4A_THERMTRIP_N_CPLD","",
+	"UV_ALERT_PADDLE_R_N","wFM_USB_MUX_OE_N",
+	// IOI0-IOI7 bit64-71
+	"UV_ALERT_PWR2_R_N","wFM_USB_MUX_SEL",
+	"UV_ALERT_PWR11_R_N","",
+	"SOC_PMBUS_0_ALERT_R_CPLD","FM_BIOS_DEBUG_MODE_N",
+	"HDD1_PRSNT_N_CPLD","",
+	"","",
+	"SOC_DRAM_0_HOT_N_CPLD","",
+	"SOC_DRAM_1_HOT_N_CPLD","RST_PLTRST_PLD_B_N",
+	"SOC_DRAM_2_HOT_N_CPLD","FM_TPM_MUX6_SEL",
+	// IOJ0-IOJ7 bit72-79
+	"SOC_DRAM_3_HOT_N_CPLD","CPLD_MUX6_EN_N",
+	"IRQ_P3V3_NIC_FLT_MOS_N_CPLD","",
+	"VRHOT_V0P75_PCIE_VDDQ_N","",
+	"P12V_SCM_FAULT_R_N","",
+	"SOC_I2C_1_ALERT_CPLD","",
+	"","",
+	"SOC_PLATHOT_N_CPLD","",
+	"SOC_THRMTRIP_N_CPLD","",
+	// IOK0-IOK7 bit80-87
+	"VRHOT_VCPUC1_VCPUMC1_N","",
+	"VRHOT_VSYSC0_VSOCC0_N","",
+	"VRHOT_VSYSC1_VSOCC1_N","",
+	"VRHOT_VCPUC0_VCPUMC0_N","",
+	"","",
+	"INT_IOEXP_N","",
+	"RSVD_IOEXP_0A_SB1_R","",
+	"RSVD_IOEXP_0A_SB2_R","",
+	// IOL0-IOL7 bit88-95
+	"IRQ_PMBUS_PWR2_ALERT_R_N","",
+	"FM_BORD_REV_ID0","",
+	"FM_BORD_REV_ID1","",
+	"FM_BORD_REV_ID2","",
+	"FM_VR_TYPE_0","",
+	"FM_VR_TYPE_1","",
+	"","",
+	"MCIO_0B_SMB_ALERT_N","",
+	// IOM0-IOM7 bit96-103
+	"MCIO_1B_SMB_ALERT_N","",
+	"PRSNT_BOOT_N","",
+	"PRSNT_MCIO_1A_N","",
+	"wPRSNT_NIC_N","",
+	"","",
+	"SOC_TEST_MODE0","",
+	"PWRGD_V0P75_PCIE","",
+	"PWRGD_VDDQ","",
+	// ION0-ION7 bit104-111
+	"PWRGD_VCPUC0","",
+	"PWRGD_VCPUMC0","",
+	"PWRGD_VCPUMC1","",
+	"PWRGD_VCPUC1","",
+	"PWRGD_VSYSC0","",
+	"PWRGD_VSOCC0","",
+	"PWRGD_VSYSC1","",
+	"PWRGD_VSOCC1","",
+	// IOO0-IOO7 bit112-119
+	"SOC_PMBUS_1_ALERT_R_CPLD","",
+	"SOC_GPIO_15","",
+	"C0_POSTCODE_0_CPLD","",
+	"C0_POSTCODE_1_CPLD","",
+	"C0_POSTCODE_2_CPLD","",
+	"C0_POSTCODE_3_CPLD","",
+	"C0_POSTCODE_4_CPLD","",
+	"C1_POSTCODE_0_CPLD","",
+	// IOP0-IOP7 bit 120-127
+	"C1_POSTCODE_1_CPLD","",
+	"C1_POSTCODE_2_CPLD","",
+	"C1_POSTCODE_3_CPLD","",
+	"C1_POSTCODE_4_CPLD","",
+	"","",
+	"SOC_GPIO_17","",
+	"SOC_GPIO_18","",
+	"SOC_GPIO_37","";
+};
+
+/* BIOS Flash */
+&spi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2_default>;
+	status = "okay";
+
+	flash@0 {
+		m25p,fast-read;
+		label = "pnor";
+		spi-max-frequency = <12000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+		status = "okay";
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+/* SOL */
+&uart3 {
+	status = "okay";
+};
+
+&uart4 {
+	status = "okay";
+};
+
+/* BMC Console */
+&uart5 {
+	status = "okay";
+};
+
+&wdt1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst1_default>;
+	aspeed,reset-type = "soc";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
+	aspeed,ext-pulse-duration = <256>;
+	status = "okay";
+};
-- 
2.25.1


