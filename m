Return-Path: <linux-renesas-soc+bounces-12913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA696A2AA37
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 14:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 106833A237B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 13:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA611EA7F7;
	Thu,  6 Feb 2025 13:41:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8611EA7C2;
	Thu,  6 Feb 2025 13:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738849294; cv=none; b=AXCtIaNSg4wViEZi1geDYZWS2MaAM0LB/2UI2nodrxJuknZbE0UUz9w9OPEvQMrJ/U14+yc7r0J7NNARpKdo2nd7/dYZh73W4buU78Y7NiJLB51+lg+082tOMm7vCDHH4ZwPiKMfAKX09sB+rkevaOZz8zdkEl0hgaA2nZdFcA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738849294; c=relaxed/simple;
	bh=DpQ7hSKwv0ZE/L758XqYKwTUjKGPe5DIaMuEwu8SB5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmeGNmpnt5jckwMSv5MTl09KmSuFMUHl0Yz2jR5xTBtVriedD204qQjsXQ+TgM9OWCQi4fOj/4+6kK4y89p2ezdO4vItsPWPrad0fNEimQaevZpvOYiPFY8pu3jk3AAMzhIj/Z5LJzj1kyc4UILGFI0drlxzclYjrxUqtfNuSdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: aemB5odvSn2ziB2hS+Rbnw==
X-CSE-MsgGUID: MBM3H5b9RQOtjgTPPHcHCw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Feb 2025 22:41:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.229])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D2893401BC08;
	Thu,  6 Feb 2025 22:41:15 +0900 (JST)
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
Subject: [PATCH v3 7/8] arm64: dts: renesas: rzg3e-smarc-som: Add support for enable SD on SDHI0
Date: Thu,  6 Feb 2025 13:40:31 +0000
Message-ID: <20250206134047.67866-8-biju.das.jz@bp.renesas.com>
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

Add support for enabling SD on SDHI0 on RZ/G3E SMARC SoM. It is enabled
by setting the macro SW_SD0_DEV_SEL to 1 in board DTS and setting the
switch SYS.1 to ON position on the SoM.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Dropped #if guard in pinctrl node for SDHI0
 * Renamed the label/node sdhi0_pins: sd0->sdhi0_usd_pins: sd0-usd.
 * Dropped overriding regulator name.
 * Updated regulator phandle.
v2:
 * New patch
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  3 ++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 54 +++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index c063d47e2952..152a00aa354b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -7,6 +7,9 @@
 
 /dts-v1/;
 
+/* Switch selection settings */
+#define SW_SD0_DEV_SEL		0
+
 #include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
 #include "r9a09g047e57.dtsi"
 #include "rzg3e-smarc-som.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index fcbabe2cb003..1966f2ce70b8 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -5,6 +5,15 @@
  * Copyright (C) 2024 Renesas Electronics Corp.
  */
 
+/*
+ * Please set the switch position SYS.1 on the SoM and the corresponding macro
+ * SW_SD0_DEV_SEL on the board DTS:
+ *
+ * SW_SD0_DEV_SEL:
+ *      0 - SD0 is connected to eMMC (default)
+ *      1 - SD0 is connected to uSD0 card
+ */
+
 / {
 	compatible = "renesas,rzg3e-smarcm", "renesas,r9a09g047e57", "renesas,r9a09g047";
 
@@ -43,6 +52,32 @@ &audio_extal_clk {
 };
 
 &pinctrl {
+	sdhi0_usd_pins: sd0-usd {
+		sd0-cd {
+			pinmux = <RZG3E_PORT_PINMUX(5, 0, 8)>;
+		};
+
+		sd0-ctrl {
+			pins = "SD0CLK", "SD0CMD";
+			renesas,output-impedance = <3>;
+		};
+
+		sd0-data {
+			pins = "SD0DAT0", "SD0DAT1", "SD0DAT2", "SD0DAT3";
+			renesas,output-impedance = <3>;
+		};
+
+		sd0-iovs {
+			pins = "SD0IOVS";
+			renesas,output-impedance = <3>;
+		};
+
+		sd0-pwen {
+			pins = "SD0PWEN";
+			renesas,output-impedance = <3>;
+		};
+	};
+
 	sdhi0_emmc_pins: sd0-emmc {
 		sd0-ctrl {
 			pins = "SD0CLK", "SD0CMD";
@@ -96,6 +131,24 @@ &rtxin_clk {
 	clock-frequency = <32768>;
 };
 
+#if (SW_SD0_DEV_SEL)
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_usd_pins>;
+	pinctrl-1 = <&sdhi0_usd_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&sdhi0_vqmmc>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&sdhi0_vqmmc {
+	status = "okay";
+};
+#else
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_emmc_pins>;
 	pinctrl-1 = <&sdhi0_emmc_pins>;
@@ -109,6 +162,7 @@ &sdhi0 {
 	fixed-emmc-driver-type = <1>;
 	status = "okay";
 };
+#endif
 
 &sdhi2 {
 	pinctrl-0 = <&sdhi2_pins>;
-- 
2.43.0


