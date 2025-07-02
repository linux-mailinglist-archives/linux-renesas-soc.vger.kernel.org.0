Return-Path: <linux-renesas-soc+bounces-19004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2118AF079C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 02:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AD651BC7FD9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 00:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD5881741;
	Wed,  2 Jul 2025 00:57:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9724CE08;
	Wed,  2 Jul 2025 00:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751417861; cv=none; b=osmHEaGPht3LDZDCqzFuJPecXbqEvpJgqrzFOv8UdqLNoV3SOHNvHOrmLJDzx8cGeQrpqMtja6rrHeeHtXn9+GN0cgw1wsY+eOLj2zh5wlK70j7rPQH/I53XO7MYuUxOH1BV0InIwVj3pIqzBoeFfQC0CG/xwtMIl2OSwYiWVZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751417861; c=relaxed/simple;
	bh=fQBAnkI5rjMDZQo6P8/3QVUINwHo/QDB3Xt13H5B0vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pTvwpMm7T6b6yTEzD1y/o6zhm7/sb5rfdig/b0rTzepNulfbkjfiyqVZ7YGVT7JdIz2jNcwfw4TyG44pYwRG+80yMJxDfbODzWUdvXNaN7KyJNmMMF/RYYnPlrZhNWbKTVhxqUwSQ0vEXlFN5GLIldt4/NL206UWeZjX87N+PFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: J5+YdmRNSKOnN3uomudF6w==
X-CSE-MsgGUID: oWfC5T+vSCu7irK4krP6oA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jul 2025 09:57:38 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.9])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C1FA740E798E;
	Wed,  2 Jul 2025 09:57:32 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	netdev@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v4 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable eth{0-1} (GBETH) interfaces
Date: Wed,  2 Jul 2025 02:57:06 +0200
Message-ID: <20250702005706.1200059-5-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702005706.1200059-1-john.madieu.xa@bp.renesas.com>
References: <20250702005706.1200059-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the Gigabit Ethernet Interfaces (GBETH) populated on the RZ/G3E SMARC EVK

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v2:
No changes but resending without dt-bindings patch

v3:
Updates mdio separately, based on phandles instead of node redefinition

v4:
 - Update pinmux to add OEN support
 - Drops Tb and Rb tags initially collected

 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index f99a09d04ddd..f930e98a7ea9 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -26,6 +26,8 @@ / {
 	compatible = "renesas,rzg3e-smarcm", "renesas,r9a09g047e57", "renesas,r9a09g047";
 
 	aliases {
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
 		i2c2 = &i2c2;
 		mmc0 = &sdhi0;
 		mmc2 = &sdhi2;
@@ -77,6 +79,24 @@ &audio_extal_clk {
 	clock-frequency = <48000000>;
 };
 
+&eth0 {
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&eth1 {
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-0 = <&eth1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 	mali-supply = <&reg_vdd0p8v_others>;
@@ -102,7 +122,98 @@ raa215300: pmic@12 {
 	};
 };
 
+&mdio0 {
+	phy0: ethernet-phy@7 {
+		compatible = "ethernet-phy-id0022.1640",
+			     "ethernet-phy-ieee802.3-c22";
+		reg = <7>;
+		interrupts-extended = <&icu 3 IRQ_TYPE_LEVEL_LOW>;
+		rxc-skew-psec = <1400>;
+		txc-skew-psec = <1400>;
+		rxdv-skew-psec = <0>;
+		txdv-skew-psec = <0>;
+		rxd0-skew-psec = <0>;
+		rxd1-skew-psec = <0>;
+		rxd2-skew-psec = <0>;
+		rxd3-skew-psec = <0>;
+		txd0-skew-psec = <0>;
+		txd1-skew-psec = <0>;
+		txd2-skew-psec = <0>;
+		txd3-skew-psec = <0>;
+	};
+};
+
+&mdio1 {
+	phy1: ethernet-phy@7 {
+		compatible = "ethernet-phy-id0022.1640",
+			     "ethernet-phy-ieee802.3-c22";
+		reg = <7>;
+		interrupts-extended = <&icu 16 IRQ_TYPE_LEVEL_LOW>;
+		rxc-skew-psec = <1400>;
+		txc-skew-psec = <1400>;
+		rxdv-skew-psec = <0>;
+		txdv-skew-psec = <0>;
+		rxd0-skew-psec = <0>;
+		rxd1-skew-psec = <0>;
+		rxd2-skew-psec = <0>;
+		rxd3-skew-psec = <0>;
+		txd0-skew-psec = <0>;
+		txd1-skew-psec = <0>;
+		txd2-skew-psec = <0>;
+		txd3-skew-psec = <0>;
+	};
+};
+
 &pinctrl {
+	eth0_pins: eth0 {
+		clk0 {
+			pinmux = <RZG3E_PORT_PINMUX(B, 1, 1)>; /* TXC */
+			output-enable;
+		};
+
+		ctrl0 {
+			pinmux = <RZG3E_PORT_PINMUX(A, 1, 1)>, /* MDC */
+				 <RZG3E_PORT_PINMUX(A, 0, 1)>, /* MDIO */
+				 <RZG3E_PORT_PINMUX(C, 2, 15)>, /* PHY_INTR (IRQ2) */
+				 <RZG3E_PORT_PINMUX(C, 1, 1)>, /* RXD3 */
+				 <RZG3E_PORT_PINMUX(C, 0, 1)>, /* RXD2 */
+				 <RZG3E_PORT_PINMUX(B, 7, 1)>, /* RXD1 */
+				 <RZG3E_PORT_PINMUX(B, 6, 1)>, /* RXD0 */
+				 <RZG3E_PORT_PINMUX(B, 0, 1)>, /* RXC */
+				 <RZG3E_PORT_PINMUX(A, 2, 1)>, /* RX_CTL */
+				 <RZG3E_PORT_PINMUX(B, 5, 1)>, /* TXD3 */
+				 <RZG3E_PORT_PINMUX(B, 4, 1)>, /* TXD2 */
+				 <RZG3E_PORT_PINMUX(B, 3, 1)>, /* TXD1 */
+				 <RZG3E_PORT_PINMUX(B, 2, 1)>, /* TXD0 */
+				 <RZG3E_PORT_PINMUX(A, 3, 1)>; /* TX_CTL */
+		};
+	};
+
+	eth1_pins: eth1 {
+		clk1 {
+			pinmux = <RZG3E_PORT_PINMUX(E, 1, 1)>; /* TXC */
+			output-enable;
+		};
+
+		ctrl1 {
+
+			pinmux = <RZG3E_PORT_PINMUX(D, 1, 1)>, /* MDC */
+				 <RZG3E_PORT_PINMUX(D, 0, 1)>, /* MDIO */
+				 <RZG3E_PORT_PINMUX(F, 2, 15)>, /* PHY_INTR (IRQ15) */
+				 <RZG3E_PORT_PINMUX(F, 1, 1)>, /* RXD3 */
+				 <RZG3E_PORT_PINMUX(F, 0, 1)>, /* RXD2 */
+				 <RZG3E_PORT_PINMUX(E, 7, 1)>, /* RXD1 */
+				 <RZG3E_PORT_PINMUX(E, 6, 1)>, /* RXD0 */
+				 <RZG3E_PORT_PINMUX(E, 0, 1)>, /* RXC */
+				 <RZG3E_PORT_PINMUX(D, 2, 1)>, /* RX_CTL */
+				 <RZG3E_PORT_PINMUX(E, 5, 1)>, /* TXD3 */
+				 <RZG3E_PORT_PINMUX(E, 4, 1)>, /* TXD2 */
+				 <RZG3E_PORT_PINMUX(E, 3, 1)>, /* TXD1 */
+				 <RZG3E_PORT_PINMUX(E, 2, 1)>, /* TXD0 */
+				 <RZG3E_PORT_PINMUX(D, 3, 1)>; /* TX_CTL */
+		};
+	};
+
 	i2c2_pins: i2c {
 		pinmux = <RZG3E_PORT_PINMUX(3, 4, 1)>, /* SCL2 */
 			 <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
-- 
2.25.1


