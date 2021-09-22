Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48A2415095
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 21:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbhIVTnG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 15:43:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56358 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhIVTnF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 15:43:05 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF2EFF1;
        Wed, 22 Sep 2021 21:41:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632339694;
        bh=xhlt80++Q98z8WJlp1CUJfsP7i/HaivnsbvTFnOOOCo=;
        h=From:To:Cc:Subject:Date:From;
        b=des1xodfQEWhqKAOTocO2on9F0YeLKKVwTz6cb8IGUgLgCrAVeX3BDgTH+GsoF5n4
         kwNR2tqjxGTBUf7Ovvzi2uit7rli6ydTtRJwWzzdirkGhvZ0tlYIeiwduwHw2bN5Hm
         mU0QNBYtme+tVMtneaAQSAfICrNSH7qH7yYyRtug=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@glider.be>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: renesas: r8a779a0: falcon-cpu: Add SW47-SW49 support
Date:   Wed, 22 Sep 2021 20:41:30 +0100
Message-Id: <20210922194131.3188186-1-kieran.bingham@ideasonboard.com>
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
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index a0a1a1da0d87..18865c94f5cf 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 
 #include "r8a779a0.dtsi"
@@ -45,6 +46,36 @@ led-3 {
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
+			label = "SW47";
+			linux,code = <KEY_1>;
+			debounce-interval = <20>;
+		};
+
+		key-2 {
+			gpios = <&gpio6 19 GPIO_ACTIVE_LOW>;
+			label = "SW48";
+			linux,code = <KEY_2>;
+			debounce-interval = <20>;
+			wakeup-source;
+		};
+
+		key-3 {
+			gpios = <&gpio6 20 GPIO_ACTIVE_LOW>;
+			label = "SW49";
+			linux,code = <KEY_3>;
+			debounce-interval = <20>;
+			wakeup-source;
+		};
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
@@ -160,6 +191,11 @@ i2c6_pins: i2c6 {
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

