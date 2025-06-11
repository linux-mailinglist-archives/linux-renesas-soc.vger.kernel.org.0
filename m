Return-Path: <linux-renesas-soc+bounces-18069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F73AD4B53
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 08:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 391E117C75C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 06:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE3D233728;
	Wed, 11 Jun 2025 06:16:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10ADF22CBD0;
	Wed, 11 Jun 2025 06:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622596; cv=none; b=QXIaMdJEnKkvsBmqHl+cnD8HqihfCzM5pIg9gphA6A5fDtOjNMHU0HX9qzPt38pcYlSr6i72BgoqzDkgfGaQMXywnjdzjxKP3EkLMiJBVqn1O2V/puc2n8B2Z2cek54B8GJLhODozuur8+TOckDn0mUlxzq3y87neC5efuMf0YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622596; c=relaxed/simple;
	bh=v4L2wlZ33mOuGPZDs6teD614QmYCP+zr9rUg3UN7axQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GptMUUWeKohINqhPMX8wAUM56ZzPgCkKtv0rPjxYbJiKoVYiKrb10M90D4eVEy15qv/a1huLPA0VdeXxOMm2isF2vEvYHA6BeEkJe5xfQRsx6M0AmrhgndAnjdCeRvz5mop5oYH/i+z7UJiDhrbEEa67kY+wawaAzfDWRFM9YzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: W6AiPcQpSEaYDJP7WfYCYQ==
X-CSE-MsgGUID: 6gH0QCHpSF2f9qsz7CjlXQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jun 2025 15:16:33 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.57])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A33D64012643;
	Wed, 11 Jun 2025 15:16:28 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: andrew+netdev@lunn.ch,
	conor+dt@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org
Cc: biju.das.jz@bp.renesas.com,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com,
	netdev@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v2 3/3] arm64: dts: renesas: rzg3e-smarc-som: Enable eth{0-1} (GBETH) interfaces
Date: Wed, 11 Jun 2025 08:16:09 +0200
Message-ID: <20250611061609.15527-4-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com>
References: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the Gigabit Ethernet Interfaces (GBETH) populated on the RZ/G3E SMARC EVK

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
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


