Return-Path: <linux-renesas-soc+bounces-25394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E87C946C8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 19:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 59F524E2348
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 18:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26742620FC;
	Sat, 29 Nov 2025 18:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeDFu4qz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B74225487B
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764442332; cv=none; b=ZtFoyQCHYAv8Nv2DBYQlaAcAtCDM32Q2nnvKaHztBqCrVwOVbexLerihS7Ib4437EiTk3TKn89HhBp6Upkr7U7aCV5vL2yoFYphsiSwP+PBuYeJ/BPSOvQixwfw9+lDDnjpe8v6g++m/fca5Y06YIfLkToW91CKrnCTE2vFkBCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764442332; c=relaxed/simple;
	bh=+IhvIhpZItlJ2VxNyf81wNVEfmW0rqbVvD3SLVwfTaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eT+pIjjeCd8OKm6JzkH3ioSdPT/rEf1NXlbk5KPfs3Dk/kqh+LsX1lYsIOwhCAig9DEhuQnZlSIPm0Oc1RrlslQihemkFHG1vzczh3LXCPTygTMwnEkXeWe2RlAjbszc2ulJlOq/aaW3GNDxmGpgYlO7xRhwduL7Q+Yfq+6t7DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeDFu4qz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47118259fd8so25241965e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 10:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764442329; x=1765047129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZpSqqVta4EKUDTZ6gcuVDadlBldwJkUtIewibPZy8I=;
        b=YeDFu4qzjjtJdblDlG5fER+3Ip8HfYJ18hcehsLKzXL0u8y7hqiuwnrSAVp6s3f6lb
         VGt5S2AoEbdqaNscZWGhicFFWv9tjOgfOkYbOpsJtXjNR+I9AAjg0u2XfxWBT+ZbIG6U
         Z0T3fQq3y8wHqIjBU3VETbpGe+p0HOlJtUjUapAEqdBgI+Nf2B/xlGec669eToPy8BSW
         MBFkue/RL/oLTa7emYv8n8LjMcWYVXQHh7F3VnBHqQR36N3rppxFgKoVA/UNdoPk1BJ/
         pmKX5+1oe1KueEXsr/k7ZOtqN1jlcd6UDuaQTw2SlkBLy3Jwd+XF7l0Q+yBAh+ZEAngg
         C3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764442329; x=1765047129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lZpSqqVta4EKUDTZ6gcuVDadlBldwJkUtIewibPZy8I=;
        b=Ro7vn/Tj8NtG773k0vBCVG+0LFFPM0BpFrX05xkC3CcyVopk/jyskPBbv8ik5DBiYG
         lJdSh19dOuU8WM6kWxhMRC33/QVBfaM/qo/y70SAZW5g2CjzjbTS+nM734Aw4IfR1RFB
         xnFTgnyLk8PZy/KBNMnI1Y+MiOvVkIN9k8BY+APAAUCgSstuBS/YX9itP5OZUKUgNYbA
         gNKTMvugGpPyIMa0U6/+nBgBV68itnW2hDaa3W/QdfXCrT2IpqKVXccUcWxHaaX66d7n
         BEZ4arh8PkUGbPCrH8kE3MexaKY2FfMZisEjxXt7rqNOSYXc7SmmFBBixuNtt22bNgpD
         6/OA==
X-Forwarded-Encrypted: i=1; AJvYcCXJGpUqNVI8CCy57ZlVJ89kZsKke22VKgLSvXGTY0DJt8Yz3gFUESQ0Q3BjupyS6Hp9JY/vtwpJAUVWxHAqbXj3+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBlrSNisZO5EXQ8iypzwU6psE1SEQuFnD5HCvIvmgV9WiI1fPy
	FGwGdXfWFdFgPVEUqZI02km83GBmbz2DaxV9PSCbGdMXP8KS4oUL93A7
X-Gm-Gg: ASbGncuCwqTTngsUlhVvF7F5kMWX2GbzAC7epnCez/mhDsXQLWgLNwkw8sF4SXE19AU
	kKB5ngLvwGGtY8G2fKyAqRlZ0oKlf1jDJerX9dHJWW0LuYYOB+Qib1WsFh3vufB8NGThlkDMV93
	/LF5FdjKjSkcR8Kp0P1M00lI/tVZ+Xg0BRX1OPMGsNtveiVFJCHRpxc5ARX+jT5eOW1gpPKAIEb
	T3NukyKGH6JPwtACwusCGUOHGvkWEc+8wchozINU0zoCbjrexmK2Y+UCWq9FP+Yamltr6c0mqjE
	QQlg7ex5Rh7GwN520cTvKCmiUrMOpdkAHqhNRhhTE8kqcuttU6hMW2yg2Vq93yZ6SMDfgdFze39
	QtQP54TNRHIU8WR3g+Kiq8842Bu7mzDvOkia07iLSCizVyd7+I21xlZIZ7Sd1y4WtmzGw1ocfGF
	KgLV2LPo4g5VmcE7nF+axA5bj9YZnLy1UdSjmmztSHlux/KmGXKQryV/YcpPdxKAnyMg09DtD9a
	KogAscAB4Wvp566
X-Google-Smtp-Source: AGHT+IEfGuNPJra0AAGagVJ77NUJMUuteF3uL7cBVhT7oo/OEtQtHVXuotkOLVZFr2JH/3zahgkndA==
X-Received: by 2002:a05:6000:1a85:b0:42b:3e0a:64b8 with SMTP id ffacd0b85a97d-42e0f22c54amr21216570f8f.24.1764442328625;
        Sat, 29 Nov 2025 10:52:08 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d613esm17442067f8f.11.2025.11.29.10.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 10:52:08 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Add support for WIFI + BT test
Date: Sat, 29 Nov 2025 18:51:59 +0000
Message-ID: <20251129185203.380002-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251129185203.380002-1-biju.das.jz@bp.renesas.com>
References: <20251129185203.380002-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for WIFI + BT test M.2 board [1]
[1] https://www.embeddedartists.com/wp-content/uploads/2021/05/2AE_2BC_M2_Datasheet.pdf

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 43 ++++++++++++++++++-
 arch/arm64/configs/defconfig                  | 26 +++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 696903dc7a63..76f43c098123 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -15,7 +15,7 @@
 #define SW_SER0_PMOD		1
 #define SW_SER2_EN		1
 #define SW_SD0_DEV_SEL		0
-#define SW_SDIO_M2E		0
+#define SW_SDIO_M2E		1
 
 #define PMOD_GPIO4		0
 #define PMOD_GPIO6		0
@@ -46,6 +46,7 @@ aliases {
 		mmc1 = &sdhi1;
 	};
 
+#if (!SW_SDIO_M2E)
 	vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 		compatible = "regulator-gpio";
 		regulator-name = "SD1_PVDD";
@@ -55,6 +56,7 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 		gpios-states = <0>;
 		states = <3300000 0>, <1800000 1>;
 	};
+#endif
 };
 
 &canfd {
@@ -201,6 +203,15 @@ usb3_pins: usb3 {
 		pinmux = <RZG3E_PORT_PINMUX(4, 1, 12)>, /* USB30_VBUSEN */
 			 <RZG3E_PORT_PINMUX(4, 0, 12)>; /* USB30_OVRCURN */
 	};
+
+#if (SW_SDIO_M2E)
+	wifi18-hog {
+		gpio-hog;
+		gpios = <RZG3E_GPIO(1, 5) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "wifi1.8";
+	};
+#endif
 };
 
 #if SW_SER0_PMOD && SW_SER2_EN
@@ -211,6 +222,11 @@ &rsci2 {
 	uart-has-rtscts;
 
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <2000000>;
+	};
 };
 #endif
 
@@ -239,6 +255,7 @@ &scif0 {
 	pinctrl-names = "default";
 };
 
+#if (!SW_SDIO_M2E)
 &sdhi1 {
 	pinctrl-0 = <&sdhi1_pins>;
 	pinctrl-1 = <&sdhi1_pins>;
@@ -247,6 +264,30 @@ &sdhi1 {
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&vqmmc_sd1_pvdd>;
 };
+#else
+&sdhi1 {
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-1 = <&sdhi1_pins>;
+	pinctrl-names = "default", "state_uhs";
+	status = "okay";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	bus-width = <4>;
+
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+
+	non-removable;
+	cap-power-off-card;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
+#endif
 
 &xhci {
 	pinctrl-0 = <&usb3_pins>;
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 370211c50d12..fc684cf56a6c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1910,3 +1910,29 @@ CONFIG_CORESIGHT_STM=m
 CONFIG_CORESIGHT_CPU_DEBUG=m
 CONFIG_CORESIGHT_CTI=m
 CONFIG_MEMTEST=y
+CONFIG_BRCMUTIL=m
+CONFIG_BRCMFMAC_PROTO_BCDC=y
+CONFIG_BRCMFMAC_SDIO=y
+CONFIG_SERIAL_DEV_CTRL_TTYPORT=y
+CONFIG_BT_BREDR=y
+CONFIG_BT_RFCOMM=y
+CONFIG_BT_RFCOMM_TTY=y
+CONFIG_BT_BNEP=y
+CONFIG_BT_BNEP_MC_FILTER=y
+CONFIG_BT_BNEP_PROTO_FILTER=y
+CONFIG_BT_HS=y
+CONFIG_BT_HCIUART_NOKIA=m
+CONFIG_BT_HCIUART_BCSP=y
+CONFIG_BT_HCIUART_ATH3K=y
+CONFIG_BT_HCIUART_3WIRE=y
+CONFIG_BT_HCIUART_INTEL=y
+CONFIG_SND_SOC_MTK_BTCVSD=y
+CONFIG_SND_SOC_BT_SCO=y
+CONFIG_CRYPTO_RSA=y
+CONFIG_CRYPTO_HASH_INFO=y
+CONFIG_ASYMMETRIC_KEY_TYPE=y
+CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
+CONFIG_X509_CERTIFICATE_PARSER=y
+CONFIG_PKCS7_MESSAGE_PARSER=y
+CONFIG_SYSTEM_TRUSTED_KEYRING=y
+CONFIG_SYSTEM_TRUSTED_KEYS=y
-- 
2.43.0


