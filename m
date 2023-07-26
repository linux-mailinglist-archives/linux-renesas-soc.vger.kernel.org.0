Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEF176397C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jul 2023 16:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbjGZOqD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jul 2023 10:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbjGZOqD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2023 10:46:03 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184D219A4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 07:46:01 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d80c:aaca:e11d:6940])
        by michel.telenet-ops.be with bizsmtp
        id Rqlz2A00S4qLm8F06qlzbe; Wed, 26 Jul 2023 16:46:00 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qOflq-002YmQ-G7;
        Wed, 26 Jul 2023 16:45:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qOfm3-00A8Kz-L2;
        Wed, 26 Jul 2023 16:45:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT] arm64: dts: renesas: spider-cpu: Add GP LEDs
Date:   Wed, 26 Jul 2023 16:45:57 +0200
Message-Id: <aa1a92cf69dc341724bcb5662de994a54cb14422.1690382707.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

Describe the two General Purpose LEDs LED7 and LED8 on the Spider CPU
board, so they can be used as indicator LEDs.

Note that General Purpose LEDs LED9 to LED11 are not added, as they are
connected to GPIO block 4, which can only be accessed from the Control
Domain.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I do not have physical access to a Spider development board.
Thanks for testing!
---
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
index dd8e0e1595260b3d..76a94812875ef261 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
@@ -6,6 +6,8 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
 #include "r8a779f0.dtsi"
 
 / {
@@ -22,6 +24,24 @@ chosen {
 		stdout-path = "serial0:1843200n8";
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led-7 {
+			gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <7>;
+		};
+
+		led-8 {
+			gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <8>;
+		};
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
-- 
2.34.1

