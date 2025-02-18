Return-Path: <linux-renesas-soc+bounces-13243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A55A399AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 11:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A6873AE964
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 10:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A631123AE67;
	Tue, 18 Feb 2025 10:51:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8802376E0;
	Tue, 18 Feb 2025 10:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739875860; cv=none; b=d/tWRJP3CR/pwSO5meG9tYh3qYieHgkD2kOddfHJ52YCmIe6on+9FTwtqmPK/Gkb8utY62eT1nOt/B9w8q/9F2pJ0zfhukXeEuBiq3wBtVTbs7xBnOoozlXu/RDurJhQytmU7qN6LBTKQ5Dbcpng8RoEigcEsKVKDPAcvaZk0fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739875860; c=relaxed/simple;
	bh=ZoIQF26rmEJf9RCXZUKPNH9hhsauii+mZjsUmvxT+EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eDQ6czdeehg8d0xHUbLD/6B3drqFAUYh9ivyMEIWHHDqJnmw+dCtuAcSGCvSYBTP/SXsLA8g1hbJtkJFrf8B3n/Ahzza2HenI0td7xYuQPdIQWs9qqr61agc2zi823m8LTJcI5sDjrTQNeEMINniml3NYEgKwFuj1tH7GfDQcBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: u7PajCclRR6/G0UKZnQh5A==
X-CSE-MsgGUID: UKTFrJcfTLi7Q0LozL8W4g==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 18 Feb 2025 19:50:58 +0900
Received: from localhost.localdomain (unknown [10.226.92.208])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8EFD042A47AC;
	Tue, 18 Feb 2025 19:50:55 +0900 (JST)
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
Subject: [PATCH 11/11] arm64: dts: renesas: r9a09g047e57-smarc: Enable CANFD
Date: Tue, 18 Feb 2025 10:50:01 +0000
Message-ID: <20250218105007.66358-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218105007.66358-1-biju.das.jz@bp.renesas.com>
References: <20250218105007.66358-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CANFD on the RZ/G3E SMARC EVK platform.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 45 +++++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 15 +++++++
 2 files changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 5d7983812c70..2a4b7bb3a1a6 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -10,6 +10,8 @@
 /* Switch selection settings */
 #define SW_SD0_DEV_SEL		0
 #define SW_SDIO_M2E		0
+#define SW_GPIO8_CAN0_STB	0
+#define SW_GPIO9_CAN1_STB	0
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
@@ -33,7 +35,50 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 	};
 };
 
+&canfd {
+	pinctrl-0 = <&canfd_pins>;
+	pinctrl-names = "default";
+
+	channel1 {
+		status = "okay";
+	};
+
+	channel4 {
+		status = "okay";
+	};
+};
+
 &pinctrl {
+#if SW_GPIO8_CAN0_STB
+	can0-stb-hog {
+		gpio-hog;
+		gpios = <RZG3E_GPIO(5, 4) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "can0_stb";
+	};
+#endif
+
+#if SW_GPIO9_CAN1_STB
+	can1-stb-hog {
+		gpio-hog;
+		gpios = <RZG3E_GPIO(5, 5) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "can1_stb";
+	};
+#endif
+
+	canfd_pins: canfd {
+		can1_pins: can1 {
+			pinmux = <RZG3E_PORT_PINMUX(L, 2, 3)>, /* RX */
+				 <RZG3E_PORT_PINMUX(L, 3, 3)>; /* TX */
+		};
+
+		can4_pins: can4 {
+			pinmux = <RZG3E_PORT_PINMUX(5, 2, 3)>, /* RX */
+				 <RZG3E_PORT_PINMUX(5, 3, 3)>; /* TX */
+		};
+	};
+
 	scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index fd82df8adc1e..a480358c5771 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -12,6 +12,17 @@
  * SW_SDIO_M2E:
  *     0 - SMARC SDIO signal is connected to uSD1
  *     1 - SMARC SDIO signal is connected to M.2 Key E connector
+ *
+ * Please set the switch position SW_GPIO_CAN_PMOD on the carrier board and the
+ * corresponding macro SW_GPIO8_CAN0_STB/SW_GPIO8_CAN0_STB on the board DTS:
+ *
+ * SW_GPIO8_CAN0_STB:
+ *	0 - Connect to GPIO8 PMOD (default)
+ *	1 - Connect to CAN0 transceiver STB pin
+ *
+ * SW_GPIO9_CAN1_STB:
+ *	0 - Connect to GPIO9 PMOD (default)
+ *	1 - Connect to CAN1 transceiver STB pin
  */
 
 / {
@@ -29,6 +40,10 @@ aliases {
 	};
 };
 
+&canfd {
+	status = "okay";
+};
+
 &scif0 {
 	status = "okay";
 };
-- 
2.43.0


