Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B35414E2E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfFUJOM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:14:12 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33940 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfFUJOM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:14:12 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0C6C225BE5B;
        Fri, 21 Jun 2019 19:13:55 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4D6CB940FE7; Fri, 21 Jun 2019 11:13:51 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 12/22] ARM: dts: rskrza1: Add input switches
Date:   Fri, 21 Jun 2019 11:13:39 +0200
Message-Id: <35b81a037b2ee78f05d17e0856f0005ad8fc67f1.1561104194.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561104194.git.horms+renesas@verge.net.au>
References: <cover.1561104194.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

Add support for input switches SW1-3 on the Renesas RZ/A1 RSK+RZA1
development board.

Note that this uses the IRQ interrupts, as the RZ/A1 GPIO controller
does not include interrupt support.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index ff24301dc1be..99acfe4fe11a 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 #include "r7s72100.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/r7s72100-pinctrl.h>
 
 / {
@@ -28,6 +29,37 @@
 		reg = <0x08000000 0x02000000>;
 	};
 
+	keyboard {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&keyboard_pins>;
+
+		key-1 {
+			interrupt-parent = <&irqc>;
+			interrupts = <3 IRQ_TYPE_EDGE_BOTH>;
+			linux,code = <KEY_1>;
+			label = "SW1";
+			wakeup-source;
+		};
+
+		key-2 {
+			interrupt-parent = <&irqc>;
+			interrupts = <2 IRQ_TYPE_EDGE_BOTH>;
+			linux,code = <KEY_2>;
+			label = "SW2";
+			wakeup-source;
+		};
+
+		key-3 {
+			interrupt-parent = <&irqc>;
+			interrupts = <5 IRQ_TYPE_EDGE_BOTH>;
+			linux,code = <KEY_3>;
+			label = "SW3";
+			wakeup-source;
+		};
+	};
+
 	lbsc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -101,6 +133,12 @@
 			 <RZA1_PINMUX(1, 7, 1)>;	/* RIIC3SDA */
 	};
 
+	keyboard_pins: keyboard {
+		pinmux = <RZA1_PINMUX(1, 9, 3)>,	/* IRQ3 */
+			 <RZA1_PINMUX(1, 8, 3)>,	/* IRQ2 */
+			 <RZA1_PINMUX(1, 11, 3)>;	/* IRQ5 */
+	};
+
 	/* Serial Console */
 	scif2_pins: serial2 {
 		pinmux = <RZA1_PINMUX(3, 0, 6)>,	/* TxD2 */
-- 
2.11.0

