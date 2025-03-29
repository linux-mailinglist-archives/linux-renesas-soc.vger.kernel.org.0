Return-Path: <linux-renesas-soc+bounces-15049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D87A75634
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 13:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D19D16FC2A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 12:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D9C1CB9F0;
	Sat, 29 Mar 2025 12:13:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190051B4244;
	Sat, 29 Mar 2025 12:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743250397; cv=none; b=NpBbEP6mNgbU1H7jTnLQzlLQC9NreNTpjRpkXOfV+GUBp1JDv+ZrpUF9ylkzciOmO+pUaE3k3jsc40FnTc1EO0yh6DZaT3Nf9O4HY3I6+gcfXFIWf7ktKREh0lTp3gr/OH1bML+jHVPd6ZtAKgPeCz2maTXRab9AcJvozeUt+BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743250397; c=relaxed/simple;
	bh=ax3K15f/Zgu5QWrA0Wkvm7uSI6BbJockaCAoIppOOSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g5INkhgh5UtLLIqPBQI2AGkLjfzuLjF1s0h5ozrefAOfQJTDJSrQqCjrMsuNOssEgh/U5ov1nWMOBUvVbvztMUevip53zamWD0S6o626Ha9Bp/RcEEMe+0ew9vOHhniA6r1mnPv3vOsYTjqBtqVNvmTn3F5YtpZm7WS3f3P4my8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ZNyKp2QPQnmZgI+IoXpOnA==
X-CSE-MsgGUID: +Y5B51wUQRG1+6k5DO9kig==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 Mar 2025 21:13:13 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.9])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B5C5E40062A6;
	Sat, 29 Mar 2025 21:13:09 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: john.madieu.xa@bp.renesas.com,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	magnus.damm@gmail.com,
	robh@kernel.org
Cc: biju.das.jz@bp.renesas.com,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: renesas: rzg3e-smarc-som: add raa215300 pmic support
Date: Sat, 29 Mar 2025 13:12:57 +0100
Message-ID: <20250329121258.172099-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250329121258.172099-1-john.madieu.xa@bp.renesas.com>
References: <20250329121258.172099-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable raa215300 pmic and built-in rtc support on RZ/G3E SoM module
Also add related clock and interrupt signals.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index ca56a9edda2e..cc0a477d6f61 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -46,6 +46,13 @@ reg_3p3v: regulator-3p3v {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	/* 32.768kHz crystal */
+	x3: x3-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
 };
 
 &audio_extal_clk {
@@ -57,6 +64,19 @@ &i2c2 {
 	pinctrl-names = "default";
 	clock-frequency = <1000000>;
 	status = "okay";
+
+	raa215300: pmic@12 {
+		compatible = "renesas,raa215300";
+		reg = <0x12>, <0x6f>;
+		reg-names = "main", "rtc";
+		clocks = <&x3>;
+		clock-names = "xin";
+
+		pinctrl-0 = <&rtc_irq_pin>;
+		pinctrl-names = "default";
+
+		interrupts-extended = <&pinctrl RZG3E_GPIO(S, 1) IRQ_TYPE_EDGE_FALLING>;
+	};
 };
 
 &pinctrl {
@@ -65,6 +85,11 @@ i2c2_pins: i2c {
 			 <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
 	};
 
+	rtc_irq_pin: rtc-irq {
+		pins = "PS1";
+		bias-pull-up;
+	};
+
 	sdhi0_emmc_pins: sd0-emmc {
 		sd0-ctrl {
 			pins = "SD0CLK", "SD0CMD";
-- 
2.25.1


