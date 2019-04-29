Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D995DF8D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 11:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbfD2Jgm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 05:36:42 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:38572 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727635AbfD2Jgl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 05:36:41 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id 69cc2000R3XaVaC069ccRa; Mon, 29 Apr 2019 11:36:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hL2iD-0000ws-83; Mon, 29 Apr 2019 11:36:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hL2iD-0002pE-5P; Mon, 29 Apr 2019 11:36:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] ARM: dts: rskrza1: Add input switches
Date:   Mon, 29 Apr 2019 11:36:31 +0200
Message-Id: <20190429093631.10799-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429093631.10799-1-geert+renesas@glider.be>
References: <20190429093631.10799-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for input switches SW1-3 on the Renesas RZ/A1 RSK+RZA1
development board.

Note that this uses the IRQ interrupts, as the RZ/A1 GPIO controller
does not include interrupt support.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Use rza1-irqc instead of gic.
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 38 ++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index ff24301dc1be54de..99acfe4fe11aaed9 100644
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
2.17.1

