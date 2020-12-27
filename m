Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E153C2E310E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Dec 2020 13:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgL0MUM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Dec 2020 07:20:12 -0500
Received: from www.zeus03.de ([194.117.254.33]:56012 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbgL0MUL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Dec 2020 07:20:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=OLBuIGepKlSVnmvGOJPcnqAaTs1
        pHZHKKgWY6yobjxk=; b=GS0VMtTRA8/I2eTF11iid3gIysSzmWR/b2aebbKSsy3
        E3TL08YATnimvmjP9dZPBu5Duoq5thZ93eAMh5xJHfGP5zpwvgDnwcvDVBlxVyyN
        ufGnRrY0fvjwYjutOdG7kA2Gn3klkxE17ky/t8Vp8ThfXo2fDZgEUBq5AEn2kbkA
        =
Received: (qmail 1494280 invoked from network); 27 Dec 2020 13:19:28 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Dec 2020 13:19:28 +0100
X-UD-Smtp-Session: l3s3148p1@LAhEK3G3SsEgAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] arm64: dts: r8a779a0: correct reset values for GPIO
Date:   Sun, 27 Dec 2020 13:19:25 +0100
Message-Id: <20201227121925.8431-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Because the datasheet is ambigious, copy over the reset values from the
latest BSP.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

While looking for a problem when obtaining the reset GPIO for RAVB, I
noticed this difference and so send this patch as a notification. It
sadly did not fix my RAVB problem, so I'll report it with the RAVB
patches there. I didn't find a map from "pfc-clocks" to "GPIO block"
yet, so this is all very confusing without it.

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 2c7bb1503cda..16c64ec548df 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -110,7 +110,7 @@ gpio0: gpio@e6058180 {
 			interrupts = <GIC_SPI 832 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 916>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 916>;
+			resets =  <&cpg 1331>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			// gpio-ranges = <&pfc 0 0 28>;
@@ -124,7 +124,7 @@ gpio1: gpio@e6050180 {
 			interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 915>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 915>;
+			resets =  <&cpg 1330>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			// gpio-ranges = <&pfc 0 32 31>;
@@ -138,7 +138,7 @@ gpio2: gpio@e6050980 {
 			interrupts = <GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 915>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 915>;
+			resets =  <&cpg 1330>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			// gpio-ranges = <&pfc 0 64 25>;
@@ -152,7 +152,7 @@ gpio3: gpio@e6058980 {
 			interrupts = <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 916>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 916>;
+			resets =  <&cpg 1331>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			// gpio-ranges = <&pfc 0 96 17>;
@@ -166,7 +166,7 @@ gpio4: gpio@e6060180 {
 			interrupts = <GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 917>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 917>;
+			resets =  <&cpg 1400>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			// gpio-ranges = <&pfc 0 128 27>;
@@ -180,7 +180,7 @@ gpio5: gpio@e6060980 {
 			interrupts = <GIC_SPI 852 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 917>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 917>;
+			resets =  <&cpg 1400>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			// gpio-ranges = <&pfc 0 160 21>;
@@ -194,7 +194,7 @@ gpio6: gpio@e6068180 {
 			interrupts = <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 918>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 918>;
+			resets =  <&cpg 1401>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			// gpio-ranges = <&pfc 0 192 21>;
@@ -208,7 +208,7 @@ gpio7: gpio@e6068980 {
 			interrupts = <GIC_SPI 860 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 918>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 918>;
+			resets =  <&cpg 1401>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			// gpio-ranges = <&pfc 0 224 21>;
@@ -222,7 +222,7 @@ gpio8: gpio@e6069180 {
 			interrupts = <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 918>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 918>;
+			resets =  <&cpg 1401>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			// gpio-ranges = <&pfc 0 256 21>;
@@ -236,7 +236,7 @@ gpio9: gpio@e6069980 {
 			interrupts = <GIC_SPI 868 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 918>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets =  <&cpg 918>;
+			resets =  <&cpg 1401>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			// gpio-ranges = <&pfc 0 288 21>;
-- 
2.29.2

