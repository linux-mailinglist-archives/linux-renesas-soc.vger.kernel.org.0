Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D25AF344D22
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 18:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbhCVRUi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 13:20:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46114 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbhCVRUW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 13:20:22 -0400
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 817CEAD6;
        Mon, 22 Mar 2021 18:20:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616433620;
        bh=RykYS79G/EklvOuPe3QTpqCIrtSmT1khKCTlg7CNBas=;
        h=From:To:Cc:Subject:Date:From;
        b=SLp5X6Xtuy/HL6Y5GJJmCrjUCsGgjL6/71rU/yBI27dCHLcDAttYXCkNf5cTqWGdX
         xHJAGy7CCdBDmgm8WUKdnOBQDLKQ430Sujt6dmmBX5WihoXEFmho2iPSl23Qz6LyEf
         qNlRNUgNGBlV9BgmF3g0UV01qQdHz+iZ/ttvFtxU=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2] arm64: dts: renesas: falcon-cpu: Add GP LEDs
Date:   Mon, 22 Mar 2021 17:20:13 +0000
Message-Id: <20210322172013.1152121-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Three general purpose LEDs are provided on the Falcon CPU board.

Connect GP_LED1, GP_LED2, and GP_LED3 to the gpio-leds frameworks as
indicator LEDs.

These LEDs are arranged in a block of four LEDs on the board itself, but
the fourth LED is as yet unidentified.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

--
v2:
 - Move to r8a779a0-falcon-cpu.dtsi
 - Define the colour, and function.
---
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index 286a5d5b9b08..98aa918e716e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -6,12 +6,37 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
 #include "r8a779a0.dtsi"
 
 / {
 	model = "Renesas Falcon CPU board";
 	compatible = "renesas,falcon-cpu", "renesas,r8a779a0";
 
+	leds {
+		compatible = "gpio-leds";
+
+		led1 {
+			gpios = <&gpio4 18 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <1>;
+		};
+		led2 {
+			gpios = <&gpio4 19 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <2>;
+		};
+		led3 {
+			gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <3>;
+		};
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
-- 
2.25.1

