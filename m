Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA02711AD0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2019 16:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbfEBOGs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 May 2019 10:06:48 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55503 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfEBOGs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 May 2019 10:06:48 -0400
Received: by mail-wm1-f65.google.com with SMTP id y2so2704209wmi.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 May 2019 07:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rvLXOgtsoKyORI6UV06ucWVqWeG0EvZKDx3T+a6oXjE=;
        b=TOCR+LouXmGE6yBg6AOSogcSwwhuNa893u94KhQrC2F3UaQTKaFgRnXLFlK0WoxpiS
         xvo1ZlWGgOr4hPuSMeVc4YESBmNowKadSxZGY9JltsJkfX+I1pk2F5wxufUgLc26ELvC
         LfF63yJ3g4B1jFp89ci83dPuf6dUFXT2D4I9JDARmo9TlpRHDBaxoOhb9pnR1xKnGv9B
         eDw92y2imM5695zsBBiNSg7rjUhy0QChwBg5yL2jMQkfgBFF7rqjQwPsTMgpbvkUXnvU
         x7kv0A8+jFnNZCheAZw8D5WCrX6RWEil9VGZOk5G5SpsvzbjZjh6fxCJhOiU5BL3g902
         5Yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rvLXOgtsoKyORI6UV06ucWVqWeG0EvZKDx3T+a6oXjE=;
        b=Y71Y5MO3utZEwPVKBlebfvJsrIZ0lX2x2aiFhc8wzUBtK5WWXjKDjJJvd+SKUga1zb
         D+j2jEF8g0VQduRB114EwaVMaLRqOqc8N9E6BWSl7AB8r4bWYhRagOjaw/uqF7WffABA
         Wbt5cza8SsXFD0CDyJvhnDLWp1n6XylI16lF+tebgL66/v/4JcV00JbauLsgGtIZ6syD
         jdIw5YkxAxrY/mSbphiW7UtsbGYToh6eElRhSLxxB5kYrwTFE6ykljnMsasxYBtA87Y/
         RoIf2jWDEr7aQBxmckIgQymCALmyy37RuACQ2AzyWNdKwDOpgQRqej1JSJZBQMPDK9/L
         g45A==
X-Gm-Message-State: APjAAAXGO3LJ/O5jR8Q7hJUb8+Vw+Z7edcspviLrLhon0zMERu8YzVFn
        /jgPwq+PE4ZoB2N3SAWtcnI=
X-Google-Smtp-Source: APXvYqyd3UGceOx/s9OVjIUn0NDg9Ced/63IpolYqJ3NuH7zUpvAMq2dQtYdmEkz9zz1YTXRgecf/A==
X-Received: by 2002:a1c:4602:: with SMTP id t2mr2471965wma.120.1556806006260;
        Thu, 02 May 2019 07:06:46 -0700 (PDT)
Received: from localhost.localdomain (cst-prg-80-10.cust.vodafone.cz. [46.135.80.10])
        by smtp.gmail.com with ESMTPSA id u11sm10396979wrg.35.2019.05.02.07.06.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 07:06:45 -0700 (PDT)
From:   marek.vasut@gmail.com
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: dts: r8a779x: Configure PMIC IRQ pinmux
Date:   Thu,  2 May 2019 16:06:34 +0200
Message-Id: <20190502140634.4529-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

The PMIC IRQ line pin multiplexing configuration is missing from the DTs.
Since the line is configured correctly by default, the system works fine.
However, add the IRQ line pin multiplexing configuration for completeness.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/r8a7790-lager.dts   | 7 +++++++
 arch/arm/boot/dts/r8a7790-stout.dts   | 7 ++++++-
 arch/arm/boot/dts/r8a7791-koelsch.dts | 7 +++++++
 arch/arm/boot/dts/r8a7791-porter.dts  | 7 +++++++
 arch/arm/boot/dts/r8a7792-blanche.dts | 7 +++++++
 arch/arm/boot/dts/r8a7793-gose.dts    | 7 +++++++
 6 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 7b9508e83d46..d637b9727808 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -423,6 +423,8 @@
 	 */
 	i2cpwr: i2c-13 {
 		compatible = "i2c-demux-pinctrl";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_irq_pins>;
 		i2c-parent = <&iic3>, <&i2c3>;
 		i2c-bus-name = "i2c-pwr";
 		#address-cells = <1>;
@@ -615,6 +617,11 @@
 		function = "iic3";
 	};
 
+	pmic_irq_pins: pmicirq {
+		groups = "intc_irq2";
+		function = "intc";
+	};
+
 	hsusb_pins: hsusb {
 		groups = "usb0_ovc_vbus";
 		function = "usb0";
diff --git a/arch/arm/boot/dts/r8a7790-stout.dts b/arch/arm/boot/dts/r8a7790-stout.dts
index 7a7d3b84d1a6..ad68e6034b43 100644
--- a/arch/arm/boot/dts/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/r8a7790-stout.dts
@@ -179,6 +179,11 @@
 		function = "iic3";
 	};
 
+	pmic_irq_pins: pmicirq {
+		groups = "intc_irq2";
+		function = "intc";
+	};
+
 	usb0_pins: usb0 {
 		groups = "usb0";
 		function = "usb0";
@@ -317,7 +322,7 @@
 
 &iic3 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&iic3_pins>;
+	pinctrl-0 = <&iic3_pins &pmic_irq_pins>;
 	status = "okay";
 
 	pmic@58 {
diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index e6580aa0cea3..a116bfc11f0b 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -540,6 +540,11 @@
 		function = "intc";
 	};
 
+	pmic_irq_pins: pmicirq {
+		groups = "intc_irq2";
+		function = "intc";
+	};
+
 	sdhi0_pins: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
@@ -776,6 +781,8 @@
 };
 
 &i2c6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pmic_irq_pins>;
 	status = "okay";
 	clock-frequency = <100000>;
 
diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
index fefdf8238bbe..e08d257f5d0c 100644
--- a/arch/arm/boot/dts/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/r8a7791-porter.dts
@@ -228,6 +228,11 @@
 		function = "intc";
 	};
 
+	pmic_irq_pins: pmicirq {
+		groups = "intc_irq2";
+		function = "intc";
+	};
+
 	sdhi0_pins: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
@@ -373,6 +378,8 @@
 };
 
 &i2c6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pmic_irq_pins>;
 	status = "okay";
 	clock-frequency = <100000>;
 
diff --git a/arch/arm/boot/dts/r8a7792-blanche.dts b/arch/arm/boot/dts/r8a7792-blanche.dts
index b6fa80c3b07e..7b0d17ee87fb 100644
--- a/arch/arm/boot/dts/r8a7792-blanche.dts
+++ b/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -234,6 +234,11 @@
 		groups = "du1_rgb666", "du1_sync", "du1_disp";
 		function = "du1";
 	};
+
+	pmic_irq_pins: pmicirq {
+		groups = "intc_irq2";
+		function = "intc";
+	};
 };
 
 &rwdt {
@@ -309,6 +314,8 @@
 };
 
 &iic3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pmic_irq_pins>;
 	status = "okay";
 
 	pmic@58 {
diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index f51601af89a2..9984ebf06695 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -514,6 +514,11 @@
 		function = "intc";
 	};
 
+	pmic_irq_pins: pmicirq {
+		groups = "intc_irq2";
+		function = "intc";
+	};
+
 	sdhi0_pins: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
@@ -711,6 +716,8 @@
 };
 
 &i2c6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pmic_irq_pins>;
 	status = "okay";
 	clock-frequency = <100000>;
 
-- 
2.20.1

