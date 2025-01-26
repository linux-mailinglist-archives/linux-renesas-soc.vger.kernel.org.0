Return-Path: <linux-renesas-soc+bounces-12519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F79A1C824
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 14:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC14C1886823
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 13:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9473F137930;
	Sun, 26 Jan 2025 13:46:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9546578F5B;
	Sun, 26 Jan 2025 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737899206; cv=none; b=ANrSOPfZmsmxoHwxZfRUjnsmmIJZHOgWMiLcJcL046JWo7OSGDf7W1p8qttBPxjRQvTvop2blZl7eXiYePjphxIrmKoWc0fu5/CUOS3eT2TCH1le8WhjneuaULZ388azTJeDmqd9rV+0rWqfiZsM5zkk1DWon810BNpFuLgjzRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737899206; c=relaxed/simple;
	bh=d8dCY4JpHbY03zSh+bKbfneBBBzTTvdZdpQJ4YCFGfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IH3NBP7YffxZU2aWV2OK+kOg/P6b/UIbVeaWF3rxVC/Ije4uGQ0Hws9vWNxn3JuPwnx5HeLAuppvmCFnqrb7SlYd4+oBg1ey3T9T3hF790WuYqkhOfkeWkBELAJa2bMjRFNI/wIJmJ5BHX05HmEwXakdTHuEvupSmC6TieYENM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 2tE0m/GFRAOfyH8KajxykA==
X-CSE-MsgGUID: PH7stv96Tv2nBsV4uWvQ2w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jan 2025 22:46:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.41])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 95CA640061A7;
	Sun, 26 Jan 2025 22:46:40 +0900 (JST)
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
Subject: [PATCH 6/7] arm64: dts: renesas: rzg3e-smarc-som: Enable SDHI{0,2}
Date: Sun, 26 Jan 2025 13:46:08 +0000
Message-ID: <20250126134616.37334-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
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
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index f4ba050beb0d..81f4f738482b 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -8,17 +8,79 @@
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
+		sd0-iovs {
+			pins = "SD0IOVS";
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
+		sd2-io {
+			pinmux = <RZG3E_PORT_PINMUX(K, 1, 1)>, /* SD2IOVS */
+				 <RZG3E_PORT_PINMUX(K, 2, 1)>; /* SD2IOPWEN */
+		};
+
+		sd2-data {
+			pinmux = <RZG3E_PORT_PINMUX(H, 2, 1)>, /* SD2DAT0 */
+				 <RZG3E_PORT_PINMUX(H, 3, 1)>, /* SD2DAT1 */
+				 <RZG3E_PORT_PINMUX(H, 4, 1)>, /* SD2DAT2 */
+				 <RZG3E_PORT_PINMUX(H, 5, 1)>; /* SD2DAT3 */
+		};
+
+		sd2-ctrl {
+			pinmux = <RZG3E_PORT_PINMUX(H, 0, 1)>, /* SD2CLK */
+				 <RZG3E_PORT_PINMUX(H, 1, 1)>; /* SD2CMD */
+		};
+	};
+};
+
 &qextal_clk {
 	clock-frequency = <24000000>;
 };
@@ -27,6 +89,33 @@ &rtxin_clk {
 	clock-frequency = <32768>;
 };
 
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_emmc_pins>;
+	pinctrl-1 = <&sdhi0_emmc_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sdhi0>;
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
 &wdt1 {
 	status = "okay";
 };
-- 
2.43.0


