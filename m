Return-Path: <linux-renesas-soc+bounces-12202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61020A13CB3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 15:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 690F97A169C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 14:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A40822D4C8;
	Thu, 16 Jan 2025 14:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="gncACmDp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC6F22CF13
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 14:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737038901; cv=none; b=YqyPIE6sZWe7Eo0HVx94iwCuUacEqcJuMLBe5xBWmRqZYW9UFo8qfGjy9LkyAmJGrgETdQb1iFYbLPtvgYwQKIfwUQYDfXc5zEndPqArPSph9NEsFtVjD1YphcYkv1QyeA6yi/8p51z/ohXRbz7n3qKN7khc/iba8PIMcXhsWFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737038901; c=relaxed/simple;
	bh=HK3JpGdhQRobIdF3deBVPv/1aNYFMUvCnv+zkCVfHxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMFbIQYykEm0B62mGVosoJay2vY3RFUFyQSotiPvd4vOOL22eCSyx0DTu/rGSfjcefLJrhLaM5x/hqGEdbn3tgB/I7V1lkdyoO/ThSVf5Fu0AIvubGq8LVZg1YKUQMJBe1aCju7EA+u6vYCXal+SkQnhE+ULhG1zD5Ube3lwe/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=gncACmDp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216426b0865so18260855ad.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 06:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1737038899; x=1737643699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+ImoZeCgDi17lkAamCCvBTMAZc2xhlZE/Yp3EuPuXM=;
        b=gncACmDpug46dBN5MxSWZ6WTIKyKQiHmmfUIAglbRDPue5xMZQsCapNVJ3mSS2SFJN
         ZatdHltueaeHP5wsFoZCdtg39AKFHHzXyijJ04m5qkAYaX/fvQwHJ0TiOEgbuYFYvd+o
         E6vYs0uUYQkPoDOetfx5euyOB/Y3O/T10e7iVHlhwrKImERAAmHiSukJ0lj87XQVAyiJ
         /tVZ98r6F/MBrFG+8EDJxSbpIcKCd7m1bgU9To6I/UBtiw0sWZldiAZ5+mqtfxNh8dYq
         ouOZdWxlAOVfShTm9/KBgZuGPifWZ5JbYnlRn0utNiTnD4WvQrUNdhaTMoibIyK26UJv
         yoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737038899; x=1737643699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+ImoZeCgDi17lkAamCCvBTMAZc2xhlZE/Yp3EuPuXM=;
        b=lQlPECDyBUcJ8aBRZzRTZi/I0klpHh1Wc+J37iZLdVNmJPFu9qegVV+gpvoEEaipzA
         tSeBCXjS2GwFaQinSnYVnAfJq1cYkPuoYHdjgyXDk1DhSNgbMd54qCT5Wfb7n5PyaPaS
         roAmgmJqFDOwSBU2D9tYZI5Ra/7g5lNqcs3uH+6U0cm75Yw84+m+itwMH6OBYluE5nrW
         hVd6Nmmnwgldoh9si/wYEuKMQdP0lpc8pIjFmiYAX+UovX+GrS5qVBprTOM/0zmb4p+R
         Orpjo8J7pxxohvhm2ubdBDNE/zvs0qJyFVxx0uMVf1MsbevT2L/fIPrkT1kqFk2SMeg5
         t+1Q==
X-Gm-Message-State: AOJu0YyJdAY150/gNo38/8AyMaR1FXAkfvHs2d7C1UPoWqc8OS6evoUB
	82txcAHXr7Ue1AplpLqNYP6rNyBXBxGyEAmZauRrOSIaQw8Z9DjlirwuNvv8
X-Gm-Gg: ASbGncs6jFwe2pNn+NTVyxSDamFkRBNeMa9E1qPzOwYMUGzlSyOdxZtfsAzHRDG1h8q
	fuelAU8AxZWGi4LI6HKv5XoulAB2ImzLhrQAlXnwoV8xSZRkjxyEyPRKvVHM5m+QqkAb69L1+uJ
	nO+vMLJdLzUR0ILUG2YFOpMkD6yGgE7UYo1gzJ+aRVZrMWlCPFT6KhXRdJciPOdabnm7PnmRKuW
	qhafbS+kf4rykLVE4hNc8IHSGQw5wfTKtT8HWmhsNMxnxT7xwzUUpgkjQ==
X-Google-Smtp-Source: AGHT+IFuxUkqJjlyXPonoX5N6Dyz1mmSLUYEA5EYZIsLBdReusU74cwAkR2Dn+QHucpLaV1Be/RYuQ==
X-Received: by 2002:a17:903:1c5:b0:216:431b:e577 with SMTP id d9443c01a7336-21a8400afc8mr444626485ad.51.1737038898964;
        Thu, 16 Jan 2025 06:48:18 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:4323:933a:5975:d650])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3d7d98sm1222535ad.177.2025.01.16.06.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 06:48:18 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masato Kiuchi <kiuchi_masato@yuridenki.co.jp>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH v2 4/4] arm64: dts: renesas: Add initial device tree for Yuridenki-Shokai Kakip board
Date: Thu, 16 Jan 2025 23:47:52 +0900
Message-ID: <20250116144752.1738574-5-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250116144752.1738574-1-iwamatsu@nigauri.org>
References: <20250116144752.1738574-1-iwamatsu@nigauri.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add basic support for Yuridenki-Shokai Kakip board based on R9A09G057H48.
This commit supports the following:

  - Memory
  - Input clocks
  - Pin Control
  - SCIF
  - OSTM0 - OSTM7
  - SDHI0

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

---
v2: Drop bootargs from chosen.
    Fix binding name for regulators.
    Fix the name style of the regulator.
    Use DTS coding style.

 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 .../boot/dts/renesas/r9a09g057h48-kakip.dts   | 136 ++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 928635f2e76bbb..698f790bd42524 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -149,6 +149,7 @@ dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk.dtb
+dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb
 
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
new file mode 100644
index 00000000000000..b35a6c0499ee7c
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for Yuridenki-Shokai the Kakip board
+ *
+ * Copyright (C) 2024 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h>
+#include <dt-bindings/gpio/gpio.h>
+#include "r9a09g057.dtsi"
+
+/ {
+	model = "Yuridenki-Shokai Kakip Board based on r9a09g057h48";
+	compatible = "yuridenki,kakip", "renesas,r9a09g057h48", "renesas,r9a09g057";
+
+	aliases {
+		serial0 = &scif;
+		mmc0 = &sdhi0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x1 0xF8000000>;
+	};
+
+	reg_3p3v: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vqmmc_sdhi0: regulator-vccq-sdhi0 {
+		compatible = "regulator-gpio";
+		regulator-name = "SDHI0 VccQ";
+		gpios = <&pinctrl RZV2H_GPIO(A, 0) GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios-states = <0>;
+		states = <3300000 0 1800000 1>;
+	};
+};
+
+&qextal_clk {
+	clock-frequency = <24000000>;
+};
+
+&pinctrl {
+	scif_pins: scif {
+		pins =  "SCIF_RXD", "SCIF_TXD";
+	};
+
+	sd0-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZV2H_GPIO(A, 1) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd0_pwr_en";
+	};
+
+	sdhi0_pins: sd0 {
+		sd0-data {
+			pins = "SD0DAT0", "SD0DAT1", "SD0DAT2", "SD0DAT3", "SD0CMD";
+			input-enable;
+			renesas,output-impedance = <3>;
+			slew-rate = <0>;
+		};
+
+		sd0-clk {
+			pins = "SD0CLK";
+			renesas,output-impedance = <3>;
+			slew-rate = <0>;
+		};
+
+		sd0-mux {
+			pinmux = <RZV2H_PORT_PINMUX(A, 5, 15)>; /* SD0_CD */
+		};
+	};
+};
+
+&scif {
+	pinctrl-0 = <&scif_pins>;
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
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_pins>;
+	pinctrl-names = "default";
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sdhi0>;
+	bus-width = <4>;
+
+	status = "okay";
+};
-- 
2.47.1


