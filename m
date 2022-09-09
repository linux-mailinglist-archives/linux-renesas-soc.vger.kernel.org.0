Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5AA5B3490
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Sep 2022 11:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiIIJyT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Sep 2022 05:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiIIJyJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2022 05:54:09 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE976A61E9
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 02:54:07 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:91db:705e:cfbc:a001])
        by albert.telenet-ops.be with bizsmtp
        id Hlu6280080sKggw06lu6fs; Fri, 09 Sep 2022 11:54:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWai5-004bsf-NH; Fri, 09 Sep 2022 11:54:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWai4-004i5N-I2; Fri, 09 Sep 2022 11:54:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 11/14] arm64: dts: renesas: white-hawk-cpu: Add push switches
Date:   Fri,  9 Sep 2022 11:53:58 +0200
Message-Id: <e18d0d5087a514db611295f5d1e13c950cf7dae7.1662715538.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662715538.git.geert+renesas@glider.be>
References: <cover.1662715538.git.geert+renesas@glider.be>
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

Describe the three Push Switches on the White Hawk CPU board, so
they can be used for user input.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
index 684c250d3c739924..f2ad18912f83296a 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
@@ -8,12 +8,44 @@
 #include "r8a779g0.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 
 / {
 	model = "Renesas White Hawk CPU board";
 	compatible = "renesas,white-hawk-cpu", "renesas,r8a779g0";
 
+	keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&keys_pins>;
+		pinctrl-names = "default";
+
+		key-1 {
+			gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_1>;
+			label = "SW47";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-2 {
+			gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_2>;
+			label = "SW48";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-3 {
+			gpios = <&gpio5 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_3>;
+			label = "SW49";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -97,6 +129,11 @@ i2c0_pins: i2c0 {
 		function = "i2c0";
 	};
 
+	keys_pins: keys {
+		pins = "GP_5_0", "GP_5_1", "GP_5_2";
+		bias-pull-up;
+	};
+
 	scif_clk_pins: scif_clk {
 		groups = "scif_clk";
 		function = "scif_clk";
-- 
2.25.1

