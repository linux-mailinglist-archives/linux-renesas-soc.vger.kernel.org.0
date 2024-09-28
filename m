Return-Path: <linux-renesas-soc+bounces-9174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D259988ED1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Sep 2024 11:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 790171C20E12
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Sep 2024 09:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A78119E974;
	Sat, 28 Sep 2024 09:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PKogq611"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74C419F12B
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Sep 2024 09:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727515813; cv=none; b=e1FK7DAJu4Ndaw5IFcT4mOhtO5LVv4lmXUXyiCnJQGat9/3cD6HjEcSo5q85eZHsfd0aTpyLWOcjb1pjUaZ+cGaOoqL2zrdY2aEKWFWB4Kp3KiBQ/HjwhbVH1jgIJXx7UK4LAsT4G4axyj79P5V8/m/dHq75ZVuJm7TpZMdANEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727515813; c=relaxed/simple;
	bh=knyrR7zyUV2Y/r85GYeyJ5Kkg0n27fv4OfiY9zZmi5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gh7tQWqXbDqhAzCgKYEiqjQbAulh7jqLVedg8NtZ3JQwhvujwmeeC8mdMLFSNlr1f26tq3LI3z33sVSZ/PDwSuFHQ4MuL+xpdk3Z9IlZ6uMbLf74HuPibelpqjIkpQ+snOPVsr0eV1ThnNRVmxzoXVBMU8Q54lNHfccUcYuwe0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PKogq611; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=yqUQpRTqBk6LIsR5oJyq4UEzqpOHG2dmtj7khx6ivSo=; b=PKogq6
	114987gBB3AP7G96sudAjHYNqo8lY1yl+CnJQCQqlopYFxdC7TjTJPGF/7o6kEuM
	u903GksABH0qiyY7aKNYwE/iIymEh2JBWKXJHXCZFh85MGFS7/t1izaf+APoMHPC
	DoEot69A8YemuL/cFsUk4ceBVRfqowMeckaUIUyxAq8k8zpKOsdI81SJH1cixOeM
	mo0Ls8L8jSEGsmc2NXG2lRAKgI38dlqr8V6rwT9cG/6kUZzybRE6omJFi2Xs28lK
	LtUb/P4jjBChM60jQ0d1bqTu0KppWGlK6lSvXYDT4ch11ZnNWKYK34YQtWwNZd6w
	xVsHGhWNlHuv0eMw==
Received: (qmail 1576755 invoked from network); 28 Sep 2024 11:30:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2024 11:30:08 +0200
X-UD-Smtp-Session: l3s3148p1@6BQbnioj2uIgAQnoAHS0AAL7owIOnAiN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] ARM: dts: renesas: genmai: enable MMCIF
Date: Sat, 28 Sep 2024 11:29:56 +0200
Message-ID: <20240928092953.2982-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240928092953.2982-5-wsa+renesas@sang-engineering.com>
References: <20240928092953.2982-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Luckily, I still had an MMC card lying around. Works fine.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index e93f444b2442..2403e21f2676 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -88,6 +88,15 @@ led2 {
 			gpios = <&port4 11 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	cvcc2: regulator-mmc {
+		compatible = "regulator-fixed";
+		regulator-name = "CVcc2";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &bsc {
@@ -179,6 +188,17 @@ eeprom@50 {
 	};
 };
 
+&mmcif {
+	pinctrl-0 = <&mmcif_pins>;
+	pinctrl-names = "default";
+	cd-gpios = <&port3 8 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&cvcc2>;
+	vqmmc-supply = <&cvcc2>;
+	bus-width = <8>;
+	status = "okay";
+};
+
 &mtu2 {
 	status = "okay";
 };
@@ -224,6 +244,20 @@ keyboard_pins: keyboard {
 		pinmux = <RZA1_PINMUX(3, 1, 3)>;
 	};
 
+	mmcif_pins: mmcif {
+		/* MMCIF: P3_8 is CD_GPIO, P3_10 up to P3_15, P4_0 up to P4_3 */
+		pinmux = <RZA1_PINMUX(3, 10, 8)>,	/* MMC_D1 */
+			 <RZA1_PINMUX(3, 11, 8)>,	/* MMC_D0 */
+			 <RZA1_PINMUX(3, 12, 8)>,	/* MMC_CLK */
+			 <RZA1_PINMUX(3, 13, 8)>,	/* MMC_CMD */
+			 <RZA1_PINMUX(3, 14, 8)>,	/* MMC_D3 */
+			 <RZA1_PINMUX(3, 15, 8)>,	/* MMC_D2 */
+			 <RZA1_PINMUX(4, 0, 8)>,	/* MMC_D4 */
+			 <RZA1_PINMUX(4, 1, 8)>,	/* MMC_D5 */
+			 <RZA1_PINMUX(4, 2, 8)>,	/* MMC_D6 */
+			 <RZA1_PINMUX(4, 3, 8)>;	/* MMC_D7 */
+	};
+
 	scif2_pins: serial2 {
 		/* P3_0 as TxD2; P3_2 as RxD2 */
 		pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
-- 
2.45.2


