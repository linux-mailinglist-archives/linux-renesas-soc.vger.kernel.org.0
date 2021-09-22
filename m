Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFBEC415138
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 22:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237354AbhIVUOv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 16:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237309AbhIVUOu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 16:14:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EDADC061574;
        Wed, 22 Sep 2021 13:13:20 -0700 (PDT)
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E235F1;
        Wed, 22 Sep 2021 22:13:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632341597;
        bh=tShOERH5sXTbHEmaYtqdH8O9acS6wGB/gI0B1DU9AW0=;
        h=From:To:Cc:Subject:Date:From;
        b=n1g/ZHGyHehukt2il8bU4JR59+2o1URCa6CL3VWBz9CbDiaPEiwiCB1dvb3dNsPwS
         kx6LS1qvRGhZ0jd9KbfBaPsj+fMIzqWe1pPdGJ6DMCOtiKdU4bJLzwm9F8mI//ad4R
         3Zl5YoclF56cB/AO65TwgCHEknh/sbsqnjce4Kz0=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@glider.be>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] arm64: dts: renesas: r8a779a0: falcon-cpu: Add SW47-SW49 support
Date:   Wed, 22 Sep 2021 21:13:13 +0100
Message-Id: <20210922201314.3205674-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for SW47, SW48 and SW49 via "gpio-keys" on the R-Car V3U
Falcon board.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

---
Apologies, I sent out v1 with locally staged changes that didn't get sqaushed
in.

v2:
 - add wakeup-source to key-1
 - make line ordering consistent across each key

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index a0a1a1da0d87..d595fbad4589 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 
 #include "r8a779a0.dtsi"
@@ -45,6 +46,37 @@ led-3 {
 		};
 	};
 
+	keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&keys_pins>;
+		pinctrl-names = "default";
+
+		key-1 {
+			gpios = <&gpio6 18 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_1>;
+			label = "SW47";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-2 {
+			gpios = <&gpio6 19 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_2>;
+			label = "SW48";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-3 {
+			gpios = <&gpio6 20 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_3>;
+			label = "SW49";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
@@ -160,6 +192,11 @@ i2c6_pins: i2c6 {
 		function = "i2c6";
 	};
 
+	keys_pins: keys {
+		pins = "GP_6_18", "GP_6_19", "GP_6_20";
+		bias-pull-up;
+	};
+
 	mmc_pins: mmc {
 		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
 		function = "mmc";
-- 
2.30.2

