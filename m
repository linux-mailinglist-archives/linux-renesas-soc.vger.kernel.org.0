Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F003278EC85
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 13:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbjHaLxK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 07:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346136AbjHaLxE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 07:53:04 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03B5E72
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 04:52:40 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
        by albert.telenet-ops.be with bizsmtp
        id gBse2A00A3874jb06BseXY; Thu, 31 Aug 2023 13:52:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbgDq-00274S-6N;
        Thu, 31 Aug 2023 13:52:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbgE2-00CIUg-M7;
        Thu, 31 Aug 2023 13:52:38 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 03/13] ARM: dts: renesas: Remove unused LBSC nodes from board DTS
Date:   Thu, 31 Aug 2023 13:52:25 +0200
Message-Id: <76ece7602045670cbb8dff684c3366ba6eb89add.1693481518.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693481518.git.geert+renesas@glider.be>
References: <cover.1693481518.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Several board DTS files contain minimal device nodes that represent
on-SoC Local Bus State Controllers (LBSC), although they belong in the
SoC-specific DTS files instead.  As these device nodes are incomplete
and unused, and hamper adding proper nodes later, it is better to just
remove them.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts   | 5 -----
 arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts | 5 -----
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts  | 5 -----
 arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts  | 5 -----
 arch/arm/boot/dts/renesas/r8a7790-lager.dts     | 5 -----
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts   | 5 -----
 arch/arm/boot/dts/renesas/r8a7794-alt.dts       | 5 -----
 7 files changed, 35 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index 1e8447176b1051f3..ee52c6d5349d0046 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -29,11 +29,6 @@ memory@8000000 {
 		reg = <0x08000000 0x08000000>;
 	};
 
-	lbsc {
-		#address-cells = <1>;
-		#size-cells = <1>;
-	};
-
 	leds {
 		status = "okay";
 		compatible = "gpio-leds";
diff --git a/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts b/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
index dc05eaf391f8e069..9d29861f23f1d964 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
@@ -29,11 +29,6 @@ memory@20000000 {
 		reg = <0x20000000 0x00a00000>;
 	};
 
-	lbsc {
-		#address-cells = <1>;
-		#size-cells = <1>;
-	};
-
 	flash@18000000 {
 		compatible = "mtd-rom";
 		reg = <0x18000000 0x00800000>;
diff --git a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
index 9bfa7d8e2888b9ee..e95b820e401663eb 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
@@ -60,11 +60,6 @@ key-3 {
 		};
 	};
 
-	lbsc {
-		#address-cells = <1>;
-		#size-cells = <1>;
-	};
-
 	leds {
 		compatible = "gpio-leds";
 
diff --git a/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
index 69a5a44b8a2fdd74..cd2324b8e8ffbddf 100644
--- a/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
@@ -63,11 +63,6 @@ key-3 {
 		};
 	};
 
-	lbsc {
-		#address-cells = <1>;
-		#size-cells = <1>;
-	};
-
 	leds {
 		compatible = "gpio-leds";
 
diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 5ad5349a50dc9b26..4d666ad8b114b33b 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -73,11 +73,6 @@ memory@140000000 {
 		reg = <1 0x40000000 0 0xc0000000>;
 	};
 
-	lbsc {
-		#address-cells = <1>;
-		#size-cells = <1>;
-	};
-
 	keyboard {
 		compatible = "gpio-keys";
 
diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
index 26a40782cc899bd0..545515b41ea3fae1 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
@@ -73,11 +73,6 @@ memory@200000000 {
 		reg = <2 0x00000000 0 0x40000000>;
 	};
 
-	lbsc {
-		#address-cells = <1>;
-		#size-cells = <1>;
-	};
-
 	keyboard {
 		compatible = "gpio-keys";
 
diff --git a/arch/arm/boot/dts/renesas/r8a7794-alt.dts b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
index 4d93319674c6efcf..08df031bc27c9e03 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
@@ -90,11 +90,6 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 		states = <3300000 1>, <1800000 0>;
 	};
 
-	lbsc {
-		#address-cells = <1>;
-		#size-cells = <1>;
-	};
-
 	keyboard {
 		compatible = "gpio-keys";
 
-- 
2.34.1

