Return-Path: <linux-renesas-soc+bounces-17830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDE0ACD817
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 08:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFDBA7A246D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 06:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67D423E33D;
	Wed,  4 Jun 2025 06:52:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E9822D780;
	Wed,  4 Jun 2025 06:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749019967; cv=none; b=JdCoxZxxDtPNRYMAgso50YMcUQkuvdbyZmNCg/WZOLC4q+sdFRHmZqpUGYE8viwAAMpLUTyGTjFR2m54nQ9VnMeTXwZjzCHT/uYnsHTYKT/JMOAzEiTwcAKznPfqb1miiYgW0DeniJpkUZMavRpJ4v66kYRHgVp023p6coAbHSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749019967; c=relaxed/simple;
	bh=wS0/rk+VR2e5SJHiPu65TwXirhLJs5fysOSa54p4Y9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1VBbNGdk5NJnP9Is3CfwdNO38bG6wooQXGcOY71OSpFyvKewwZoSY8ZROS49BONJdxQbQpOpwi+3iJAreNXZMzVEODo7BnlPctAUB4tdhS41PQFrREK6nkS3CFTYqVsKJr73Xtfs2DCTLBF4DPmvDL0rJG0aCagzpnH6PCZnxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: vjj3ueQwTwaaG5xOmU0oEw==
X-CSE-MsgGUID: 8HR2ohBlSpC/ioUQqDn/Og==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Jun 2025 15:52:45 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.1])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E8D75417CC3B;
	Wed,  4 Jun 2025 15:52:39 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable eth{0-1} (GBETH) interfaces
Date: Wed,  4 Jun 2025 08:52:00 +0200
Message-ID: <20250604065200.163778-5-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250604065200.163778-1-john.madieu.xa@bp.renesas.com>
References: <20250604065200.163778-1-john.madieu.xa@bp.renesas.com>
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
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index f99a09d04ddd..4b4c7f3381ad 100644
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
@@ -77,6 +79,74 @@ &audio_extal_clk {
 	clock-frequency = <48000000>;
 };
 
+&eth0 {
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		phy0: ethernet-phy@7 {
+			compatible = "ethernet-phy-id0022.1640",
+				     "ethernet-phy-ieee802.3-c22";
+			reg = <7>;
+			interrupts-extended = <&icu 3 IRQ_TYPE_LEVEL_LOW>;
+			rxc-skew-psec = <1400>;
+			txc-skew-psec = <1400>;
+			rxdv-skew-psec = <0>;
+			txdv-skew-psec = <0>;
+			rxd0-skew-psec = <0>;
+			rxd1-skew-psec = <0>;
+			rxd2-skew-psec = <0>;
+			rxd3-skew-psec = <0>;
+			txd0-skew-psec = <0>;
+			txd1-skew-psec = <0>;
+			txd2-skew-psec = <0>;
+			txd3-skew-psec = <0>;
+		};
+	};
+};
+
+&eth1 {
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-0 = <&eth1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		phy1: ethernet-phy@7 {
+			compatible = "ethernet-phy-id0022.1640",
+				     "ethernet-phy-ieee802.3-c22";
+			reg = <7>;
+			interrupts-extended = <&icu 16 IRQ_TYPE_LEVEL_LOW>;
+			rxc-skew-psec = <1400>;
+			txc-skew-psec = <1400>;
+			rxdv-skew-psec = <0>;
+			txdv-skew-psec = <0>;
+			rxd0-skew-psec = <0>;
+			rxd1-skew-psec = <0>;
+			rxd2-skew-psec = <0>;
+			rxd3-skew-psec = <0>;
+			txd0-skew-psec = <0>;
+			txd1-skew-psec = <0>;
+			txd2-skew-psec = <0>;
+			txd3-skew-psec = <0>;
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 	mali-supply = <&reg_vdd0p8v_others>;
@@ -103,6 +173,42 @@ raa215300: pmic@12 {
 };
 
 &pinctrl {
+	eth0_pins: eth0 {
+		pinmux = <RZG3E_PORT_PINMUX(A, 1, 1)>, /* MDC */
+			 <RZG3E_PORT_PINMUX(A, 0, 1)>, /* MDIO */
+			 <RZG3E_PORT_PINMUX(C, 2, 15)>, /* PHY_INTR (IRQ2) */
+			 <RZG3E_PORT_PINMUX(C, 1, 1)>, /* RXD3 */
+			 <RZG3E_PORT_PINMUX(C, 0, 1)>, /* RXD2 */
+			 <RZG3E_PORT_PINMUX(B, 7, 1)>, /* RXD1 */
+			 <RZG3E_PORT_PINMUX(B, 6, 1)>, /* RXD0 */
+			 <RZG3E_PORT_PINMUX(B, 0, 1)>, /* RXC */
+			 <RZG3E_PORT_PINMUX(A, 2, 1)>, /* RX_CTL */
+			 <RZG3E_PORT_PINMUX(B, 5, 1)>, /* TXD3 */
+			 <RZG3E_PORT_PINMUX(B, 4, 1)>, /* TXD2 */
+			 <RZG3E_PORT_PINMUX(B, 3, 1)>, /* TXD1 */
+			 <RZG3E_PORT_PINMUX(B, 2, 1)>, /* TXD0 */
+			 <RZG3E_PORT_PINMUX(B, 1, 1)>, /* TXC */
+			 <RZG3E_PORT_PINMUX(A, 3, 1)>; /* TX_CTL */
+	};
+
+	eth1_pins: eth1 {
+		pinmux = <RZG3E_PORT_PINMUX(D, 1, 1)>, /* MDC */
+			 <RZG3E_PORT_PINMUX(D, 0, 1)>, /* MDIO */
+			 <RZG3E_PORT_PINMUX(F, 2, 15)>, /* PHY_INTR (IRQ15) */
+			 <RZG3E_PORT_PINMUX(F, 1, 1)>, /* RXD3 */
+			 <RZG3E_PORT_PINMUX(F, 0, 1)>, /* RXD2 */
+			 <RZG3E_PORT_PINMUX(E, 7, 1)>, /* RXD1 */
+			 <RZG3E_PORT_PINMUX(E, 6, 1)>, /* RXD0 */
+			 <RZG3E_PORT_PINMUX(E, 0, 1)>, /* RXC */
+			 <RZG3E_PORT_PINMUX(D, 2, 1)>, /* RX_CTL */
+			 <RZG3E_PORT_PINMUX(E, 5, 1)>, /* TXD3 */
+			 <RZG3E_PORT_PINMUX(E, 4, 1)>, /* TXD2 */
+			 <RZG3E_PORT_PINMUX(E, 3, 1)>, /* TXD1 */
+			 <RZG3E_PORT_PINMUX(E, 2, 1)>, /* TXD0 */
+			 <RZG3E_PORT_PINMUX(E, 1, 1)>, /* TXC */
+			 <RZG3E_PORT_PINMUX(D, 3, 1)>; /* TX_CTL */
+	};
+
 	i2c2_pins: i2c {
 		pinmux = <RZG3E_PORT_PINMUX(3, 4, 1)>, /* SCL2 */
 			 <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
-- 
2.25.1


