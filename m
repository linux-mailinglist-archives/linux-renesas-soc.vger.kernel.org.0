Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C13A3219E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2019 16:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbfEQOnT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 May 2019 10:43:19 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42567 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728383AbfEQOnS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 May 2019 10:43:18 -0400
Received: by mail-pf1-f194.google.com with SMTP id 13so3783285pfw.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 May 2019 07:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=qalnLftG8BGXufJW9Y1XxKgDlaGf8qdtZjfLnyDTaDY=;
        b=Lr7ZEuS4guPaPWxHmyxqVA60Z7hDws4wiAA2x3CNhcPpXXowz7VycdoFmhXT9i5rGq
         NMiXRw3rgxK3eYyyJXPLIiH8fZeQE9gSb+OLJpy1evlORo7TQuesrlxHIHgOXAFsDZal
         7TSXIxEQ+gzNRaDKupwfzJwRm0SX7GgGimpYLo44emMvkWhbgxKHbvMBRfQzIb5qFwmi
         V5rk1zbI1YiyvcrzmoaQuN4xUebbyvCzT15PGA/iIwdn8UnZLgXeyexB+l+ZUxXLQP89
         m99RwYz/HbPTODGMf5xvrYeEEJi0iTTL/m3xNJA4WRCJIm8gOZEgFeVQWOs9nCvFjQRO
         hecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qalnLftG8BGXufJW9Y1XxKgDlaGf8qdtZjfLnyDTaDY=;
        b=JhEf7dXYt4sMwTo8X2anKRd6EgvUnYlpJrzTXvbGhbRCe69vy5jLCSmcciU9OS82XT
         Kd4e2MXpjr7IThjqPOuaxD62ZbPoJuoG5ZOKZVSZrV0XJzc89ebIwMT3p6E19+WC6PKO
         Uv8luVDpTwyr8J0y3Koh0RP2W5ksaIEwmaOG0tXeNqZOLpCqG+V6DT3ykoeIkOENFMhD
         DYXHHrTT0oClMknuIA9utmpxp1jwEK85A7o2rgFXBUbjbKf5qioNvmLfrMDWdLtVKoXy
         u3W+hqgfnU2CW+UHO6picPr8wvH1sUmp5Gh3uxQFnVYJQGTc4/VVZKNVsZ2TCM3H3COe
         9+OQ==
X-Gm-Message-State: APjAAAX9p2AoIoUqdG9WfA8/lKe1pXRpJMVXL6n5OGdQMsyVT0lXekM0
        4XXk3SwGqPbICR7HIOM7FqOFW2xN
X-Google-Smtp-Source: APXvYqwn/ZaiN3K+fBgNdBDQ9lJQsMUhnLwY9QRcif3KBUu7XvGpc5MFy0DXSd1Pzq3+OcF7j4nNZA==
X-Received: by 2002:aa7:881a:: with SMTP id c26mr54130569pfo.254.1558104197811;
        Fri, 17 May 2019 07:43:17 -0700 (PDT)
Received: from localhost.localdomain (p8554011-ipngn42901marunouchi.tokyo.ocn.ne.jp. [180.57.220.11])
        by smtp.gmail.com with ESMTPSA id 194sm5687959pgd.33.2019.05.17.07.43.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 17 May 2019 07:43:15 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT] arm: dts: renesas: r7s9210-rza2mevb: sort nodes of rza2mevb board
Date:   Fri, 17 May 2019 23:43:07 +0900
Message-Id: <1558104187-2842-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch sorts the nodes of arch/arm/boot/dts/r7s9210-rza2mevb.dts.

* Sort subnodes of root ("/") node alphabetically
* Sort following top-level nodes alphabetically
* Sort subnodes of pinctrl alphabetically

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 92 +++++++++++++++++-----------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index fa44e35..71808ce 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -26,11 +26,6 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@40000000 {
-		device_type = "memory";
-		reg = <0x40000000 0x00800000>;	 /* HyperRAM */
-	};
-
 	lbsc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -46,6 +41,33 @@
 			gpios = <&pinctrl RZA2_PIN(PORTC, 1) GPIO_ACTIVE_HIGH>;
 		};
 	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x00800000>;	 /* HyperRAM */
+	};
+};
+
+&ether0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth0_pins>;
+	status = "okay";
+	renesas,no-ether-link;
+	phy-handle = <&phy0>;
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&ether1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth1_pins>;
+	status = "okay";
+	renesas,no-ether-link;
+	phy-handle = <&phy1>;
+	phy1: ethernet-phy@1 {
+		reg = <0>;
+	};
 };
 
 /* EXTAL */
@@ -53,23 +75,16 @@
 	clock-frequency = <24000000>;	/* 24MHz */
 };
 
-/* RTC_X1 */
-&rtc_x1_clk {
-	clock-frequency = <32768>;
+/* High resolution System tick timers */
+&ostm0 {
+	status = "okay";
 };
 
-/* USB_X1 */
-&usb_x1_clk {
-	clock-frequency = <48000000>;
+&ostm1 {
+	status = "okay";
 };
 
 &pinctrl {
-	/* Serial Console */
-	scif4_pins: serial4 {
-		pinmux = <RZA2_PINMUX(PORT9, 0, 4)>,	/* TxD4 */
-			 <RZA2_PINMUX(PORT9, 1, 4)>;	/* RxD4 */
-	};
-
 	eth0_pins: eth0 {
 		pinmux = <RZA2_PINMUX(PORTE, 0, 7)>, /* REF50CK0 */
 			 <RZA2_PINMUX(PORT6, 1, 7)>, /* RMMI0_TXDEN */
@@ -98,6 +113,12 @@
 			 <RZA2_PINMUX(PORTL, 1, 5)>; /* IRQ5 */
 	};
 
+	/* Serial Console */
+	scif4_pins: serial4 {
+		pinmux = <RZA2_PINMUX(PORT9, 0, 4)>,	/* TxD4 */
+			 <RZA2_PINMUX(PORT9, 1, 4)>;	/* RxD4 */
+	};
+
 	sdhi0_pins: sdhi0 {
 		pinmux = <RZA2_PINMUX(PORT5, 0, 3)>,	/* SD0_CD */
 			 <RZA2_PINMUX(PORT5, 1, 3)>;	/* SD0_WP */
@@ -109,13 +130,9 @@
 	};
 };
 
-/* High resolution System tick timers */
-&ostm0 {
-	status = "okay";
-};
-
-&ostm1 {
-	status = "okay";
+/* RTC_X1 */
+&rtc_x1_clk {
+	clock-frequency = <32768>;
 };
 
 /* Serial Console */
@@ -126,28 +143,6 @@
 	status = "okay";
 };
 
-&ether0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&eth0_pins>;
-	status = "okay";
-	renesas,no-ether-link;
-	phy-handle = <&phy0>;
-	phy0: ethernet-phy@0 {
-		reg = <0>;
-	};
-};
-
-&ether1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&eth1_pins>;
-	status = "okay";
-	renesas,no-ether-link;
-	phy-handle = <&phy1>;
-	phy1: ethernet-phy@1 {
-		reg = <0>;
-	};
-};
-
 &sdhi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdhi0_pins>;
@@ -161,3 +156,8 @@
 	bus-width = <4>;
 	status = "okay";
 };
+
+/* USB_X1 */
+&usb_x1_clk {
+	clock-frequency = <48000000>;
+};
-- 
1.9.1

