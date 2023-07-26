Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83734763975
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jul 2023 16:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbjGZOpF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jul 2023 10:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232146AbjGZOpD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2023 10:45:03 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F8019A4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 07:44:58 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d80c:aaca:e11d:6940])
        by baptiste.telenet-ops.be with bizsmtp
        id Rqkv2A00T4qLm8F01qkvNV; Wed, 26 Jul 2023 16:44:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qOfko-002Ym4-FX;
        Wed, 26 Jul 2023 16:44:55 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qOfl1-00A8Hp-L9;
        Wed, 26 Jul 2023 16:44:55 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT 3/3] arm64: dts: renesas: spider: Add keyboard to test IRQ[0145]
Date:   Wed, 26 Jul 2023 16:44:43 +0200
Message-Id: <d6ccbb7b7a73eb35f1e1a8d85adcf9f1f980b2c1.1690382328.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690382328.git.geert+renesas@glider.be>
References: <cover.1690382328.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add an interrupt-controlled keyboard to test operation of the Interrupt
Controller for External Devices (INTC-EX) on the Spider development
board.

Test procedure:
  - Run "evtest" (select device event number "0"),
  - Pull one of the following signals on the Spider Breakout Board low
    to trigger the corresponding interrupt and keypress (key release is
    automatic):
      - Test point CP18 -> IRQ0 (KEY_0),
      - Test point CP17 -> IRQ1 (KEY_1),
      - CN37 pin 4 -> IRQ4 (KEY_4),
      - CN37 pin 2 -> IRQ5 (KEY_5).

GND is available on e.g. pin 8 of CN37 (MSIOF0 PIN HEADER).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.

I do not have physical access to a Spider development board.
Thanks for testing!

Note that this IRQ conflicts with operation of LED7, so do not apply the
LED patch while testing.
---
 .../boot/dts/renesas/r8a779f0-spider.dts      | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
index 7aac3f4d319c330c..a73251da1f215141 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
@@ -6,12 +6,56 @@
  */
 
 /dts-v1/;
+
+#include <dt-bindings/input/input.h>
+
 #include "r8a779f0-spider-cpu.dtsi"
 #include "r8a779f0-spider-ethernet.dtsi"
 
 / {
 	model = "Renesas Spider CPU and Breakout boards based on r8a779f0";
 	compatible = "renesas,spider-breakout", "renesas,spider-cpu", "renesas,r8a779f0";
+
+	keyboard-irq {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&keyboard_irq_pins>;
+		pinctrl-names = "default";
+
+		interrupt-parent = <&intc_ex>;
+
+		key-0 {
+			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_0>;
+			label = "Breakabout Board CP18";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-1 {
+			interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_1>;
+			label = "Breakabout Board CP17";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-4 {
+			interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_4>;
+			label = "Breakout Board CN37-4";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-5 {
+			interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_5>;
+			label = "Breakout Board CN37-2";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+	};
 };
 
 &i2c4 {
@@ -22,3 +66,11 @@ eeprom@51 {
 		pagesize = <8>;
 	};
 };
+
+&pfc {
+	keyboard_irq_pins: keyboard-irq {
+		groups = "intc_ex_irq0", "intc_ex_irq1", "intc_ex_irq4",
+			 "intc_ex_irq5";
+		function = "intc_ex";
+	};
+};
-- 
2.34.1

