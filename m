Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2C7E4E2D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfFUJOB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:14:01 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33940 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfFUJOB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:14:01 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id DFCD925BE02;
        Fri, 21 Jun 2019 19:13:52 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C99C3940C81; Fri, 21 Jun 2019 11:13:50 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 05/22] ARM: dts: rza2mevb: Add Ethernet support
Date:   Fri, 21 Jun 2019 11:13:32 +0200
Message-Id: <c5dab2e9a90a75ad839764c777a8da091215eee8.1561104194.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561104194.git.horms+renesas@verge.net.au>
References: <cover.1561104194.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Chris Brandt <chris.brandt@renesas.com>

The RZ/A2M EVB sub board has 2 Ethernet jacks on it.

Set switch SW6_4	to ON to use Ethernet Ch-0
Set switch SW6_5	to ON to use Ethernet Ch-1

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 50 ++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index 991e09de1219..1544f3bab3f8 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -62,6 +62,34 @@
 		pinmux = <RZA2_PINMUX(PORT9, 0, 4)>,	/* TxD4 */
 			 <RZA2_PINMUX(PORT9, 1, 4)>;	/* RxD4 */
 	};
+
+	eth0_pins: eth0 {
+		pinmux = <RZA2_PINMUX(PORTE, 0, 7)>, /* REF50CK0 */
+			 <RZA2_PINMUX(PORT6, 1, 7)>, /* RMMI0_TXDEN */
+			 <RZA2_PINMUX(PORT6, 2, 7)>, /* RMII0_TXD0 */
+			 <RZA2_PINMUX(PORT6, 3, 7)>, /* RMII0_TXD1 */
+			 <RZA2_PINMUX(PORTE, 4, 7)>, /* RMII0_CRSDV */
+			 <RZA2_PINMUX(PORTE, 1, 7)>, /* RMII0_RXD0 */
+			 <RZA2_PINMUX(PORTE, 2, 7)>, /* RMII0_RXD1 */
+			 <RZA2_PINMUX(PORTE, 3, 7)>, /* RMII0_RXER */
+			 <RZA2_PINMUX(PORTE, 5, 1)>, /* ET0_MDC */
+			 <RZA2_PINMUX(PORTE, 6, 1)>, /* ET0_MDIO */
+			 <RZA2_PINMUX(PORTL, 0, 5)>; /* IRQ4 */
+	};
+
+	eth1_pins: eth1 {
+		pinmux = <RZA2_PINMUX(PORTK, 3, 7)>, /* REF50CK1 */
+			 <RZA2_PINMUX(PORTK, 0, 7)>, /* RMMI1_TXDEN */
+			 <RZA2_PINMUX(PORTK, 1, 7)>, /* RMII1_TXD0 */
+			 <RZA2_PINMUX(PORTK, 2, 7)>, /* RMII1_TXD1 */
+			 <RZA2_PINMUX(PORT3, 2, 7)>, /* RMII1_CRSDV */
+			 <RZA2_PINMUX(PORTK, 4, 7)>, /* RMII1_RXD0 */
+			 <RZA2_PINMUX(PORT3, 5, 7)>, /* RMII1_RXD1 */
+			 <RZA2_PINMUX(PORT3, 1, 7)>, /* RMII1_RXER */
+			 <RZA2_PINMUX(PORT3, 3, 1)>, /* ET1_MDC */
+			 <RZA2_PINMUX(PORT3, 4, 1)>, /* ET1_MDIO */
+			 <RZA2_PINMUX(PORTL, 1, 5)>; /* IRQ5 */
+	};
 };
 
 /* High resolution System tick timers */
@@ -80,3 +108,25 @@
 
 	status = "okay";
 };
+
+&ether0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth0_pins>;
+	status = "okay";
+	renesas,no-ether-link;
+	phy-handle = <&phy0>;
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&ether1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth1_pins>;
+	status = "okay";
+	renesas,no-ether-link;
+	phy-handle = <&phy1>;
+	phy1: ethernet-phy@1 {
+		reg = <0>;
+	};
+};
-- 
2.11.0

