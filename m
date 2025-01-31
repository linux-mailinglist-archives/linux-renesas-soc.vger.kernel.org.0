Return-Path: <linux-renesas-soc+bounces-12786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFA6A23CDE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 12:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8ACD7A2447
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 11:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0491C07C4;
	Fri, 31 Jan 2025 11:25:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BAF1581EE;
	Fri, 31 Jan 2025 11:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322706; cv=none; b=i987a8FrAnlA7ddhz/zvkA5nkJKpw4sSAi+LERge4wau/MWctzHjKZfqMxvHf+q6IxDwpeqEmsF5x5aL+utqMLAk0jN/6LoGSsTfgUGZhhcwYayItwbQOas/cae3IFl7HUFFEx2C2uP2JTwKniZjeJ6OmWLb50oBa58iDinzccE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322706; c=relaxed/simple;
	bh=pCtdl42Kkh6E3mW3byHp7idPDtWZ4bDEKmlDTwjqmJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=omypHqh1NSRCJlBecmJQOFRvh0FuI/fdt0yuwQAQ4VR/P2Snt66kiZBFzGC+ase+Qk4Hkq4RxDgrzZifEPcYd411IBgKGHhSRaaC55NTrf0HwJ8/5po9USY8ZlYnFL8jpEmUlJv4lzfKE5xevRjJzW6LUIsOoRlBG1Bt0Kz6+wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: R6p/StPqTRy7c0ooRX6deg==
X-CSE-MsgGUID: 2kGW4YfZS9mLbo5Hzz3n8A==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 31 Jan 2025 20:25:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.122])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id F07E54017B95;
	Fri, 31 Jan 2025 20:24:49 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 6/8] arm64: dts: renesas: rzg3e-smarc-som: Enable SDHI{0,2}
Date: Fri, 31 Jan 2025 11:24:21 +0000
Message-ID: <20250131112429.119882-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250131112429.119882-1-biju.das.jz@bp.renesas.com>
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable eMMC on SDHI0 and SD on SDHI2 on RZ/G3E SMARC SoM.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Added missing header file gpio.h
 * Used fixed regulator for eMMC on SD0 and dropped sd0-iovs pins for
   eMMC.
 * Sorted pinctrl nodes for sd2
 * Enabled internal regulator for SD2.
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |   1 +
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 101 ++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index c063d47e2952..f9248037de9e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
 #include "r9a09g047e57.dtsi"
 #include "rzg3e-smarc-som.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index f4ba050beb0d..9b5e5fd76c29 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -8,17 +8,86 @@
 / {
 	compatible = "renesas,rzg3e-smarcm", "renesas,r9a09g047e57", "renesas,r9a09g047";
 
+	aliases {
+		mmc0 = &sdhi0;
+		mmc2 = &sdhi2;
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* First 128MB is reserved for secure area. */
 		reg = <0x0 0x48000000 0x0 0xf8000000>;
 	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &audio_extal_clk {
 	clock-frequency = <48000000>;
 };
 
+&pinctrl {
+	sdhi0_emmc_pins: sd0emmc {
+		sd0-emmc-ctrl {
+			pins = "SD0CLK", "SD0CMD";
+			renesas,output-impedance = <3>;
+		};
+
+		sd0-emmc-data {
+			pins = "SD0DAT0", "SD0DAT1", "SD0DAT2", "SD0DAT3",
+			       "SD0DAT4", "SD0DAT5", "SD0DAT6", "SD0DAT7";
+			renesas,output-impedance = <3>;
+		};
+
+		sd0-emmc-rst {
+			pins = "SD0RSTN";
+			renesas,output-impedance = <3>;
+		};
+	};
+
+	sdhi2_pins: sd2 {
+		sd2-cd {
+			pinmux = <RZG3E_PORT_PINMUX(K, 0, 1)>; /* SD2CD */
+		};
+
+		sd2-ctrl {
+			pinmux = <RZG3E_PORT_PINMUX(H, 0, 1)>, /* SD2CLK */
+				 <RZG3E_PORT_PINMUX(H, 1, 1)>; /* SD2CMD */
+		};
+
+		sd2-data {
+			pinmux = <RZG3E_PORT_PINMUX(H, 2, 1)>, /* SD2DAT0 */
+				 <RZG3E_PORT_PINMUX(H, 3, 1)>, /* SD2DAT1 */
+				 <RZG3E_PORT_PINMUX(H, 4, 1)>, /* SD2DAT2 */
+				 <RZG3E_PORT_PINMUX(H, 5, 1)>; /* SD2DAT3 */
+		};
+
+		sd2-iovs {
+			pinmux = <RZG3E_PORT_PINMUX(K, 1, 1)>; /* SD2IOVS */
+		};
+
+		sd2-pwen {
+			pinmux = <RZG3E_PORT_PINMUX(K, 2, 1)>; /* SD2PWEN */
+		};
+	};
+};
+
 &qextal_clk {
 	clock-frequency = <24000000>;
 };
@@ -27,6 +96,38 @@ &rtxin_clk {
 	clock-frequency = <32768>;
 };
 
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_emmc_pins>;
+	pinctrl-1 = <&sdhi0_emmc_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	bus-width = <8>;
+	mmc-hs200-1_8v;
+	non-removable;
+	fixed-emmc-driver-type = <1>;
+	status = "okay";
+};
+
+&sdhi2 {
+	pinctrl-0 = <&sdhi2_pins>;
+	pinctrl-1 = <&sdhi2_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sdhi2>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&vqmmc_sdhi2 {
+	regulator-name = "SD2_PVDD";
+	status = "okay";
+};
+
 &wdt1 {
 	status = "okay";
 };
-- 
2.43.0


