Return-Path: <linux-renesas-soc+bounces-14702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CCBA6AB49
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 17:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DF1A8A7875
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 16:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EE1221572;
	Thu, 20 Mar 2025 16:41:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB87721C9F2;
	Thu, 20 Mar 2025 16:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742488900; cv=none; b=TBrUGYdhSm+oNIyIWc2upm0qcn7J6QSP6vHbzZQL1RjgmcmXN5VHB6jw1F6BZL8s8ksvYBTjjZagNYPQpDiIXYCt3PwHtoMYBe3TdaSa1lRbqX4SIeNjUI/ekno3iCI7eIChAQs013Q/wBMrTcSe3tgMD688iFHEyqbNeByyY4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742488900; c=relaxed/simple;
	bh=xi1iKXhZWCLdT2pVoZvOrzPhwd9Oc06didJRRgDtptg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DIC3LogLYCLiYiNNXWlf469FE9jDG4S2M/y7ZQh1h2xqHWzCLVtfL+VXP6RDuFB47q0YNRs2HctWFKaEHLWK4B83FZM3byVCIv9eSeLeN+XyepnMk+zN8kUYnbyhw50BY4SM07q2pjrHFR8UnC3G9QJ0WNswKv4gAoTnNTseSTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: secjPJA4R36WIFw8ZfzM7w==
X-CSE-MsgGUID: lKwdLtCBTgC2oxvCOjms6w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Mar 2025 01:41:37 +0900
Received: from localhost.localdomain (unknown [10.226.93.24])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B3E1C400721F;
	Fri, 21 Mar 2025 01:41:34 +0900 (JST)
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
Subject: [PATCH v2 3/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable CAN Transceiver
Date: Thu, 20 Mar 2025 16:41:18 +0000
Message-ID: <20250320164121.193857-4-biju.das.jz@bp.renesas.com>
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

Enable TCAN1046V-Q1 CAN Transceiver populated on RZ/G3E SMARC EVK by
modelling it as two instances of tcan1042.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Replaced GPIO hog with CAN Transceiver.
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 22 ++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 25 +++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 7e1daaabce8a..1f5e61a73c35 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -8,6 +8,8 @@
 /dts-v1/;
 
 /* Switch selection settings */
+#define SW_GPIO8_CAN0_STB	0
+#define SW_GPIO9_CAN1_STB	0
 #define SW_LCD_EN		0
 #define SW_PDM_EN		0
 #define SW_SD0_DEV_SEL		0
@@ -42,16 +44,36 @@ &canfd {
 #if (!SW_PDM_EN)
 	channel1 {
 		status = "okay";
+#if (!SW_LCD_EN) && (SW_GPIO9_CAN1_STB)
+		phys = <&can_transceiver1>;
+#endif
 	};
 #endif
 
 #if (!SW_LCD_EN)
 	channel4 {
 		status = "okay";
+#if (SW_GPIO8_CAN0_STB)
+		phys = <&can_transceiver0>;
+#endif
 	};
 #endif
 };
 
+#if (!SW_LCD_EN) && (SW_GPIO8_CAN0_STB)
+&can_transceiver0 {
+	standby-gpios = <&pinctrl RZG3E_GPIO(5, 4) GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+#endif
+
+#if (!SW_LCD_EN) && (SW_GPIO9_CAN1_STB)
+&can_transceiver1 {
+	standby-gpios = <&pinctrl RZG3E_GPIO(5, 5) GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+#endif
+
 &pinctrl {
 	canfd_pins: canfd {
 		can1_pins: can1 {
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index 1d3a844174b3..afdc1940e24a 100644
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
@@ -27,6 +38,20 @@ aliases {
 		serial3 = &scif0;
 		mmc1 = &sdhi1;
 	};
+
+	can_transceiver0: can-phy0 {
+		compatible = "ti,tcan1042";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+		status = "disabled";
+	};
+
+	can_transceiver1: can-phy1 {
+		compatible = "ti,tcan1042";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+		status = "disabled";
+	};
 };
 
 &canfd {
-- 
2.43.0


