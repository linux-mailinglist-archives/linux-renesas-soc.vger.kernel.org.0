Return-Path: <linux-renesas-soc+bounces-12910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F92FA2AA2F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 14:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B071C1883BD0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 13:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470FD1624DA;
	Thu,  6 Feb 2025 13:41:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5F21EA7E6;
	Thu,  6 Feb 2025 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738849280; cv=none; b=j39F4/jwMd+ZQFGQwo8PsTNUThjYdYCRlzWouEkKkgS8fXv9vg1I/2hW8eAwUyxYhWlm/IgcsyjONQpP7fLqLlSbZRYfi6/XsbQSgY4NN/mHMfzDaTERuMfRIgVxFSf9JOTo0fP7Er2J2Ehr3sPigCcpwp3+zD2hd1hVdbzCvM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738849280; c=relaxed/simple;
	bh=f6jtMJfnZlcitHmz+gjpr3KcBjp3XBElrrxhWAD8ARk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F7sXA/4DHbpyta1CKcIfe147MXPZNjTVDHGWOvtBM7J329vW2BHICWsf5aEMNN3vgjdYY285fhKn+Dlt5ytnAAC8hMzeu/ydQs3IqAH4OaCRjs3odS1wiZLGd7xn2v1n3z/Ad4hpEZxRsHYeRhhV/EcsR/2cjFhYHqEZd1iTr4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ucjM+kLjSq+mL5HMa7BsCg==
X-CSE-MsgGUID: dX9NeaiPQHyX1r0pa9S++Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Feb 2025 22:41:15 +0900
Received: from localhost.localdomain (unknown [10.226.92.229])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4F2B04019C60;
	Thu,  6 Feb 2025 22:41:12 +0900 (JST)
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
Subject: [PATCH v3 6/8] arm64: dts: renesas: rzg3e-smarc-som: Enable SDHI{0,2}
Date: Thu,  6 Feb 2025 13:40:30 +0000
Message-ID: <20250206134047.67866-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
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
v2->v3:
 * Renamed node sd0emmc->sd0-emmc
 * Renamed sd0-emmc-{ctrl,data,rst}->sd0-{ctrl,data,rst}
 * Dropped header file gpio.h.
 * Dropped overriding internal regulator name.
 * Updated regulator phandle.
v1->v2:
 * Added missing header file gpio.h
 * Used fixed regulator for eMMC on SD0 and dropped sd0-iovs pins for
   eMMC.
 * Sorted pinctrl nodes for sd2
 * Enabled internal regulator for SD2.
---
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index f4ba050beb0d..fcbabe2cb003 100644
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
+	sdhi0_emmc_pins: sd0-emmc {
+		sd0-ctrl {
+			pins = "SD0CLK", "SD0CMD";
+			renesas,output-impedance = <3>;
+		};
+
+		sd0-data {
+			pins = "SD0DAT0", "SD0DAT1", "SD0DAT2", "SD0DAT3",
+			       "SD0DAT4", "SD0DAT5", "SD0DAT6", "SD0DAT7";
+			renesas,output-impedance = <3>;
+		};
+
+		sd0-rst {
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
@@ -27,6 +96,37 @@ &rtxin_clk {
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
+	vqmmc-supply = <&sdhi2_vqmmc>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&sdhi2_vqmmc {
+	status = "okay";
+};
+
 &wdt1 {
 	status = "okay";
 };
-- 
2.43.0


