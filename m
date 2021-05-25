Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1DB638FD94
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 May 2021 11:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbhEYJRE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 May 2021 05:17:04 -0400
Received: from www.zeus03.de ([194.117.254.33]:45932 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232464AbhEYJQ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 May 2021 05:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=N32Jaoqsed33jOQOjK+g7guRATu
        YdbNDg1Jq5cVVl/o=; b=JVSwsPww0EwLtzvO3pgp4+j5C/eM1F82rD+qJY4eHMj
        GszIi0mrhGl2C2iauvC4o2FGgRJkDj0a93E3IxMSYwpUDMFvIAXyvUjX8l+I2hyJ
        3vCB8owuiQkh9tkMQrIBLNLEhdrr+PF849l3jMrFiLmNLdRgFxKR2aS+bglY9N0c
        =
Received: (qmail 1177944 invoked from network); 25 May 2021 11:15:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 May 2021 11:15:19 +0200
X-UD-Smtp-Session: l3s3148p1@SroH9yPDmpQgARa4RYtfAdx6+N0ksazW
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] ARM: dts: alt: add SW2 as GPIO keys
Date:   Tue, 25 May 2021 11:15:12 +0200
Message-Id: <20210525091512.29119-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SW2 on Alt is connected as on Lager board. So, use the same GPIO
settings.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/r8a7794-alt.dts | 42 +++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index f9dba5688d3f..f330d796a772 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 #include "r8a7794.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Alt";
@@ -94,6 +95,42 @@ lbsc {
 		#size-cells = <1>;
 	};
 
+	keyboard {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&keyboard_pins>;
+		pinctrl-names = "default";
+
+		one {
+			linux,code = <KEY_1>;
+			label = "SW2-1";
+			wakeup-source;
+			debounce-interval = <20>;
+			gpios = <&gpio3 9 GPIO_ACTIVE_LOW>;
+		};
+		two {
+			linux,code = <KEY_2>;
+			label = "SW2-2";
+			wakeup-source;
+			debounce-interval = <20>;
+			gpios = <&gpio3 10 GPIO_ACTIVE_LOW>;
+		};
+		three {
+			linux,code = <KEY_3>;
+			label = "SW2-3";
+			wakeup-source;
+			debounce-interval = <20>;
+			gpios = <&gpio3 11 GPIO_ACTIVE_LOW>;
+		};
+		four {
+			linux,code = <KEY_4>;
+			label = "SW2-4";
+			wakeup-source;
+			debounce-interval = <20>;
+			gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	vga-encoder {
 		compatible = "adi,adv7123";
 
@@ -319,6 +356,11 @@ usb1_pins: usb1 {
 		groups = "usb1";
 		function = "usb1";
 	};
+
+	keyboard_pins: keyboard {
+		pins = "GP_3_9", "GP_3_10", "GP_3_11", "GP_3_12";
+		bias-pull-up;
+	};
 };
 
 &cmt0 {
-- 
2.30.2

