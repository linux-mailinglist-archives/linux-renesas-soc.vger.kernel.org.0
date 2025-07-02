Return-Path: <linux-renesas-soc+bounces-19018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 661D2AF0FEE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 11:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E45F164615
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 09:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0526F244663;
	Wed,  2 Jul 2025 09:28:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15C423CEF8;
	Wed,  2 Jul 2025 09:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448485; cv=none; b=buDM+ycPQ4FuiR7FkVnLMS4OQRFNT9m216+lfQhzm9TAH8vdBUXkbBimeF47R37qIby8izfppY2h3ENTHI+pQ01rL5aLHbUWha+aylbISODbM7YV7uslGnjeiI9fehX89S9hhf3RYXRu+1g+ZpnW2Qtff2XQFcVisTLQoJALhcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448485; c=relaxed/simple;
	bh=998uWJjRFOw5w+jHsc6gCACuy7MJzmnNtJzp2XH3cyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m7usfD3C36Px9dW+IDmYgIpxPXLLzVor+US3euGSx0ZYjIUEE5mnPC9+BS0LfmP+bRPfkE+vcevUpQIBZcftH54a5DOzgZv4sWBVDBwjOVBCbryA+c6JZzKRQ6bRDTPincDVqqtESDwdbZRmvG5KZm+Z4dF4RrOUa+w3fU7o15I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: NitnyPPpTae6aSBJwSx/hA==
X-CSE-MsgGUID: TvqiaY7XT5mjO4hvgffLIw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Jul 2025 18:28:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.89])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6C56241B60C0;
	Wed,  2 Jul 2025 18:27:58 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
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
Subject: [PATCH v2] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
Date: Wed,  2 Jul 2025 10:27:53 +0100
Message-ID: <20250702092755.70847-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/G3E SMARC EVK  has 3 user buttons called USER_SW1, USER_SW2 and
USER_SW3 and SLEEP button with NMI support. Add a DT node in device tree
to instantiate the gpio-keys driver for these buttons.

The system can enter into STR state by pressing the sleep button and
wakeup from STR is done by pressing power button. The USER_SW{1,2,3}
configured as wakeup-source, so it can wakeup the system during s2idle.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Added support for sleep button
 * Dropped the extra spaces after the define keywords for KEY_*_GPIO.
 * Dropped /delete-node/ keys as KEY_SLEEP will always present.
 * Moved input.h to r9a09g047e57-smarc.dts
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 37 +++++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 31 ++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 2454a9743df2..8efc4f0c6517 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 /* Switch selection settings */
+#define SW_LCD_EN		0
 #define SW_GPIO8_CAN0_STB	0
 #define SW_GPIO9_CAN1_STB	0
 #define SW_LCD_EN		0
@@ -15,7 +16,16 @@
 #define SW_SD0_DEV_SEL		0
 #define SW_SDIO_M2E		0
 
+#define PMOD_GPIO4		0
+#define PMOD_GPIO6		0
+#define PMOD_GPIO7		0
+
+#define KEY_1_GPIO		RZG3E_GPIO(3, 1)
+#define KEY_2_GPIO		RZG3E_GPIO(8, 4)
+#define KEY_3_GPIO		RZG3E_GPIO(8, 5)
+
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
 #include "r9a09g047e57.dtsi"
 #include "rzg3e-smarc-som.dtsi"
@@ -79,6 +89,29 @@ &i2c0 {
 	pinctrl-names = "default";
 };
 
+&keys{
+	key-sleep {
+		pinctrl-0 = <&nmi_pins>;
+		pinctrl-names = "default";
+
+		interrupts-extended = <&icu 0 IRQ_TYPE_EDGE_FALLING>;
+		linux,code = <KEY_SLEEP>;
+		label = "SLEEP";
+		debounce-interval = <20>;
+	};
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
 &pinctrl {
 	canfd_pins: canfd {
 		can1_pins: can1 {
@@ -97,6 +130,10 @@ i2c0_pins: i2c0 {
 			 <RZG3E_PORT_PINMUX(D, 5, 4)>; /* SDA0 */
 	};
 
+	nmi_pins: nmi {
+		pinmux = <RZG3E_PORT_PINMUX(S, 0, 0)>; /* NMI */
+	};
+
 	scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index 3cac292f20b3..58561da3007a 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -23,6 +23,9 @@
  * SW_GPIO9_CAN1_STB:
  *	0 - Connect to GPIO9 PMOD (default)
  *	1 - Connect to CAN1 transceiver STB pin
+ *
+ * GPIO keys are enabled by default. Use PMOD_GPIO macros to disable them
+ * if needed.
  */
 
 / {
@@ -53,6 +56,34 @@ can_transceiver1: can-phy1 {
 		max-bitrate = <8000000>;
 		status = "disabled";
 	};
+
+	keys: keys {
+		compatible = "gpio-keys";
+
+		key-1 {
+			interrupts-extended = <&pinctrl KEY_1_GPIO IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_1>;
+			label = "USER_SW1";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-2 {
+			interrupts-extended = <&pinctrl KEY_2_GPIO IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_2>;
+			label = "USER_SW2";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-3 {
+			interrupts-extended = <&pinctrl KEY_3_GPIO IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_3>;
+			label = "USER_SW3";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+	};
 };
 
 &canfd {
-- 
2.43.0


