Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1063AA81CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2019 14:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbfIDMBU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Sep 2019 08:01:20 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:33516 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729316AbfIDMBU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 08:01:20 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id xQ1H2000A05gfCL06Q1Hlw; Wed, 04 Sep 2019 14:01:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5TyP-0001Yt-9t; Wed, 04 Sep 2019 14:01:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5TyP-0000VN-8N; Wed, 04 Sep 2019 14:01:17 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: dts: gose: Replace spaces by TABs
Date:   Wed,  4 Sep 2019 14:01:13 +0200
Message-Id: <20190904120114.1894-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904120114.1894-1-geert+renesas@glider.be>
References: <20190904120114.1894-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make it easier to compare the file with other similar files.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7793-gose.dts | 110 ++++++++++++++---------------
 1 file changed, 55 insertions(+), 55 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index 42f3313e6988affa..48fbeb6340fd4dac 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -65,81 +65,81 @@
 		compatible = "gpio-keys";
 
 		key-1 {
-		        gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
-		        linux,code = <KEY_1>;
-		        label = "SW2-1";
-		        wakeup-source;
-		        debounce-interval = <20>;
+			gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_1>;
+			label = "SW2-1";
+			wakeup-source;
+			debounce-interval = <20>;
 		};
 		key-2 {
-		        gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
-		        linux,code = <KEY_2>;
-		        label = "SW2-2";
-		        wakeup-source;
-		        debounce-interval = <20>;
+			gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_2>;
+			label = "SW2-2";
+			wakeup-source;
+			debounce-interval = <20>;
 		};
 		key-3 {
-		        gpios = <&gpio5 2 GPIO_ACTIVE_LOW>;
-		        linux,code = <KEY_3>;
-		        label = "SW2-3";
-		        wakeup-source;
-		        debounce-interval = <20>;
+			gpios = <&gpio5 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_3>;
+			label = "SW2-3";
+			wakeup-source;
+			debounce-interval = <20>;
 		};
 		key-4 {
-		        gpios = <&gpio5 3 GPIO_ACTIVE_LOW>;
-		        linux,code = <KEY_4>;
-		        label = "SW2-4";
-		        wakeup-source;
-		        debounce-interval = <20>;
+			gpios = <&gpio5 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_4>;
+			label = "SW2-4";
+			wakeup-source;
+			debounce-interval = <20>;
 		};
 		key-a {
-		        gpios = <&gpio7 0 GPIO_ACTIVE_LOW>;
-		        linux,code = <KEY_A>;
-		        label = "SW30";
-		        wakeup-source;
-		        debounce-interval = <20>;
+			gpios = <&gpio7 0 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_A>;
+			label = "SW30";
+			wakeup-source;
+			debounce-interval = <20>;
 		};
 		key-b {
-		        gpios = <&gpio7 1 GPIO_ACTIVE_LOW>;
-		        linux,code = <KEY_B>;
-		        label = "SW31";
-		        wakeup-source;
-		        debounce-interval = <20>;
+			gpios = <&gpio7 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_B>;
+			label = "SW31";
+			wakeup-source;
+			debounce-interval = <20>;
 		};
 		key-c {
-		        gpios = <&gpio7 2 GPIO_ACTIVE_LOW>;
-		        linux,code = <KEY_C>;
-		        label = "SW32";
-		        wakeup-source;
-		        debounce-interval = <20>;
+			gpios = <&gpio7 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_C>;
+			label = "SW32";
+			wakeup-source;
+			debounce-interval = <20>;
 		};
 		key-d {
-		        gpios = <&gpio7 3 GPIO_ACTIVE_LOW>;
-		        linux,code = <KEY_D>;
-		        label = "SW33";
-		        wakeup-source;
-		        debounce-interval = <20>;
+			gpios = <&gpio7 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_D>;
+			label = "SW33";
+			wakeup-source;
+			debounce-interval = <20>;
 		};
 		key-e {
-		        gpios = <&gpio7 4 GPIO_ACTIVE_LOW>;
-		        linux,code = <KEY_E>;
-		        label = "SW34";
-		        wakeup-source;
-		        debounce-interval = <20>;
+			gpios = <&gpio7 4 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_E>;
+			label = "SW34";
+			wakeup-source;
+			debounce-interval = <20>;
 		};
 		key-f {
-		        gpios = <&gpio7 5 GPIO_ACTIVE_LOW>;
-		        linux,code = <KEY_F>;
-		        label = "SW35";
-		        wakeup-source;
-		        debounce-interval = <20>;
+			gpios = <&gpio7 5 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_F>;
+			label = "SW35";
+			wakeup-source;
+			debounce-interval = <20>;
 		};
 		key-g {
-		        gpios = <&gpio7 6 GPIO_ACTIVE_LOW>;
-		        linux,code = <KEY_G>;
-		        label = "SW36";
-		        wakeup-source;
-		        debounce-interval = <20>;
+			gpios = <&gpio7 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_G>;
+			label = "SW36";
+			wakeup-source;
+			debounce-interval = <20>;
 		};
 	};
 
-- 
2.17.1

