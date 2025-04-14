Return-Path: <linux-renesas-soc+bounces-15932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD26A887B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 17:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02D321888C88
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 15:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801DC2798F1;
	Mon, 14 Apr 2025 15:43:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A077252295;
	Mon, 14 Apr 2025 15:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744645416; cv=none; b=mM9jcUC1pjFOE2XnZBvjKmaxRn6M54swB25N9sWz1DecGdOahP/LdbPcCWrYxGN6c4qM3UrddGPye0+9OM+TCyiLvn4bTU+oNtHDnh5KRiC3y9mpOMnxFTyh46ql12Rl23BMtT1uT+XU6Br/8bjAJGM/qR6wSSN7hbbDPsw1eGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744645416; c=relaxed/simple;
	bh=Tkk57IwElxqXIkI2v9lTSkM3kXzBNPN57prvrUMVkiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qExVtZx886sWwBM55GU5er2I2kMWXtTdKHSA5EctPDLPYrthfKAj/ugnbWenjHNTJ3Z6xrRtsRuzyrsp2C55Yh6b037P/yMhUppLb4d7eUt8wQoTcV7cMKVSmE5KM3u+8S18wRtMV3fjst6cqXNzWdvDnz8HBvMvuNVm0GeH7TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: cGrC+luCTY+SUvSx9SfAQw==
X-CSE-MsgGUID: B8r3E4ThQ06ZFEp0r10dcw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 Apr 2025 00:38:23 +0900
Received: from localhost.localdomain (unknown [10.226.92.176])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9F41A4003ED7;
	Tue, 15 Apr 2025 00:38:20 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
Date: Mon, 14 Apr 2025 16:38:07 +0100
Message-ID: <20250414153818.214811-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/G3E SMARC EVK  has 3 user buttons called USER_SW1, USER_SW2 and
USER_SW3. Add a DT node in device tree to instantiate the gpio-keys driver
for these buttons.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 27 +++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 30 +++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 5d7983812c70..246327a19527 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -8,9 +8,18 @@
 /dts-v1/;
 
 /* Switch selection settings */
+#define SW_LCD_EN		0
 #define SW_SD0_DEV_SEL		0
 #define SW_SDIO_M2E		0
 
+#define PMOD_GPIO4		0
+#define PMOD_GPIO6		0
+#define PMOD_GPIO7		0
+
+#define  KEY_1_GPIO		RZG3E_GPIO(3, 1)
+#define  KEY_2_GPIO		RZG3E_GPIO(8, 4)
+#define  KEY_3_GPIO		RZG3E_GPIO(8, 5)
+
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
 #include "r9a09g047e57.dtsi"
@@ -33,6 +42,24 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 	};
 };
 
+&keys{
+#if PMOD_GPIO4
+	/delete-node/ key-1;
+#endif
+
+#if SW_LCD_EN || PMOD_GPIO6
+	/delete-node/ key-2;
+#endif
+
+#if SW_LCD_EN || PMOD_GPIO7
+	/delete-node/ key-3;
+#endif
+};
+
+#if SW_LCD_EN && PMOD_GPIO4 && PMOD_GPIO6 && PMOD_GPIO7
+	/delete-node/ keys;
+#endif
+
 &pinctrl {
 	scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index fd82df8adc1e..84fb955ad77b 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -12,8 +12,13 @@
  * SW_SDIO_M2E:
  *     0 - SMARC SDIO signal is connected to uSD1
  *     1 - SMARC SDIO signal is connected to M.2 Key E connector
+ *
+ * GPIO keys are enabled by default. Use PMOD_GPIO macros to disable them
+ * if needed.
  */
 
+#include <dt-bindings/input/input.h>
+
 / {
 	model = "Renesas RZ SMARC Carrier-II Board";
 	compatible = "renesas,smarc2-evk";
@@ -27,6 +32,31 @@ aliases {
 		serial3 = &scif0;
 		mmc1 = &sdhi1;
 	};
+
+	keys: keys {
+		compatible = "gpio-keys";
+
+		key-1 {
+			interrupts-extended = <&pinctrl KEY_1_GPIO IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_1>;
+			label = "USER_SW1";
+			debounce-interval = <20>;
+		};
+
+		key-2 {
+			interrupts-extended = <&pinctrl KEY_2_GPIO IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_2>;
+			label = "USER_SW2";
+			debounce-interval = <20>;
+		};
+
+		key-3 {
+			interrupts-extended = <&pinctrl KEY_3_GPIO IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_3>;
+			label = "USER_SW3";
+			debounce-interval = <20>;
+		};
+	};
 };
 
 &scif0 {
-- 
2.43.0


