Return-Path: <linux-renesas-soc+bounces-14701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AA6A6AB45
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 17:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C0E2486B81
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 16:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAECD221573;
	Thu, 20 Mar 2025 16:41:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733F42222B6;
	Thu, 20 Mar 2025 16:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742488896; cv=none; b=gqWyamflr9IID03tvvQtlYshRZ0xqrSRryqPecw7ywbP8U1Dm7pnBECVonwrhYnbeGu+Akme3GLQxLrEtVtc6jiVGbMb4mQrc4W+FdIq/3p/ikrUb+NHDU3WC7GQdDVmazZWHdEOk6i7rUJn4GpVZcBexGNZlYYh+6YuNroevRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742488896; c=relaxed/simple;
	bh=CKyUVq5PWzBL3D3yLl9aE8loKt4vD6wzpn3KOHgi2IM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MsOyOxaYdkn8cdcgjXQlM16KixIAgmabte28cveGjBuV3ajnSQVTKN3EnaIDtwXAAB7VOihJKanZPGsliAQfi/YnNKDlRZ5kcvhrJM2ypsjsRmpU7YxvO0rlapXbabAT8nNfrgBRjzbJwjyvrteDChv6vIhv6IdO1nHEDjGck1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ZoQ9MbluS0qwRHl45FzUaA==
X-CSE-MsgGUID: gc+TnhLNSZOf8wKY9T0beg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Mar 2025 01:41:34 +0900
Received: from localhost.localdomain (unknown [10.226.93.24])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4C0A4400721F;
	Fri, 21 Mar 2025 01:41:31 +0900 (JST)
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
Subject: [PATCH v2 2/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable CANFD
Date: Thu, 20 Mar 2025 16:41:17 +0000
Message-ID: <20250320164121.193857-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320164121.193857-1-biju.das.jz@bp.renesas.com>
References: <20250320164121.193857-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * Split the patch into two.
 * Enabling CANFD done in this patch and CAN Transceiver on next patch.
 * Defined the macros SW_LCD_EN and SW_PDM_EN  which routes signals to
   CAN0 and CAN1 based on SYS.5 and BOOT.6 switches.
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 31 +++++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  4 +++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 14 +++++++--
 3 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 5d7983812c70..7e1daaabce8a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -8,6 +8,8 @@
 /dts-v1/;
 
 /* Switch selection settings */
+#define SW_LCD_EN		0
+#define SW_PDM_EN		0
 #define SW_SD0_DEV_SEL		0
 #define SW_SDIO_M2E		0
 
@@ -33,7 +35,36 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 	};
 };
 
+&canfd {
+	pinctrl-0 = <&canfd_pins>;
+	pinctrl-names = "default";
+
+#if (!SW_PDM_EN)
+	channel1 {
+		status = "okay";
+	};
+#endif
+
+#if (!SW_LCD_EN)
+	channel4 {
+		status = "okay";
+	};
+#endif
+};
+
 &pinctrl {
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
index fd82df8adc1e..1d3a844174b3 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -29,6 +29,10 @@ aliases {
 	};
 };
 
+&canfd {
+	status = "okay";
+};
+
 &scif0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 72b42a81bcf3..f63f988f786a 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -6,12 +6,20 @@
  */
 
 /*
- * Please set the switch position SYS.1 on the SoM and the corresponding macro
- * SW_SD0_DEV_SEL on the board DTS:
+ * Please set the below switch position on the SoM and the corresponding macro
+ * on the board DTS:
  *
- * SW_SD0_DEV_SEL:
+ * Switch position SYS.1, Macro SW_SD0_DEV_SEL:
  *      0 - SD0 is connected to eMMC (default)
  *      1 - SD0 is connected to uSD0 card
+ *
+ * Switch position SYS.5, Macro SW_LCD_EN:
+ *      0 - Select Misc. Signals routing
+ *      1 - Select LCD
+ *
+ * Switch position BOOT.6, Macro SW_PDM_EN:
+ *      0 - Select CAN routing
+ *      1 - Select PDM
  */
 
 / {
-- 
2.43.0


