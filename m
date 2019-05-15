Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D22E1EA0C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 10:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfEOIXz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 04:23:55 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36801 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbfEOIXe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 04:23:34 -0400
Received: by mail-wr1-f67.google.com with SMTP id s17so1607925wru.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 May 2019 01:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p7UfUoQHdw2V5T9OO4cQVjr7I+4K0hfjSDR08/46NM8=;
        b=JC6JGU/R5mOXdJnFMhHg9NhRrwjnm9/rq3d0NNAv8tm1qyeK4yIS8VFjmNXISdFTzc
         fGZzqtAKXwKFac0gFgiZXEqme9KgtGgepWpAZj+yhHPWdvQLj+lzANnWRy/cSXRQgxQl
         GQtgi135wmcDG8au3xgNbrRsNJt39/zUx+62UX+zRkZM/LaF5Ke9bLTqDSRF1Gb+h9wW
         ZVP0qNW30wCv5gjNQnuM9QMFko5v+O1VRLZsFZHnUDy9Sqin7ZUT9SuNgONbuhJt9uCN
         9zN1aRLQ55opZWibPHxKzKe2PXBItE7xF/BCoGEzKX5ueYMNAkNA78i2ZhLNS2iYyHkF
         IQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p7UfUoQHdw2V5T9OO4cQVjr7I+4K0hfjSDR08/46NM8=;
        b=nfNss6CuirbIpvi5mhjSJr2prGT5ImTr5lbxwgm7d4lMpjrU81QVF9EGtUV6q/czJe
         ZKq0VyVHQI9Eb+Ji4jT8KVrT++j7BGJ7D/J7wkngeWGUbyZrwIJaW4CA8ucMzVA0wLp7
         qzt+cAbekBortXut8NR2h6iSwJolUvdPoB4+jWg+Dhd68nRsSuX0DRoRldOo61/KalBe
         kVfpomrRX0da79UekaCXHLDFHql6Ef4fSuOo9YgK1JkokX3pg2Y0eNDHJ9rk4nNc3ZvX
         Ep6FQoKWR1EaqhjfArdYEbYA5hkIHK6jGLarcCFHOulRRendNaopKSesYWIztIAORwc6
         tkYQ==
X-Gm-Message-State: APjAAAUC6PIHNnrBDWGDzkU7GtNrDl/+L0XMgaYlru38IoDiO0BS5sjb
        hl3uhiSOSq8vKHuaY+E/glE=
X-Google-Smtp-Source: APXvYqz91y91dnV4ymzUsPIk3oy6/2Qv8YL1PsZz/LsOBy8zoFbWLf+WGENcF7zET4VwvFgZtqyK0Q==
X-Received: by 2002:a5d:658f:: with SMTP id q15mr14507822wru.213.1557908611333;
        Wed, 15 May 2019 01:23:31 -0700 (PDT)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id o8sm1970678wra.4.2019.05.15.01.23.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 01:23:30 -0700 (PDT)
From:   marek.vasut@gmail.com
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2] ARM: dts: r8a779x: Configure PMIC IRQ pinmux
Date:   Wed, 15 May 2019 10:23:26 +0200
Message-Id: <20190515082326.6449-1-marek.vasut@gmail.com>
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
V2: Move the pin control node from iic3 controller to pmic on 7792 Blanche,
    since there's only one PMIC on that board.
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
index b6fa80c3b07e..b7af14de7c8e 100644
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
@@ -314,6 +319,8 @@
 	pmic@58 {
 		compatible = "dlg,da9063";
 		reg = <0x58>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_irq_pins>;
 		interrupt-parent = <&irqc>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
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

