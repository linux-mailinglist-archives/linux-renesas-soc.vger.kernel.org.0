Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31EFD78EC8C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 13:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346137AbjHaLxN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 07:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346164AbjHaLxE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 07:53:04 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CE810D0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 04:52:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
        by xavier.telenet-ops.be with bizsmtp
        id gBse2A00z3874jb01BseSK; Thu, 31 Aug 2023 13:52:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbgDq-00274s-B2;
        Thu, 31 Aug 2023 13:52:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbgE2-00CIV9-Qq;
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
Subject: [PATCH 09/13] ARM: dts: renesas: wheat: Move Ethernet node to LBSC
Date:   Thu, 31 Aug 2023 13:52:31 +0200
Message-Id: <a291c2750144df29e69824d5b9d76cbc11f613c1.1693481518.git.geert+renesas@glider.be>
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

The SMSC LAN89218AQ Ethernet controller on the Wheat development board
resides in the external address space of the Local Bus State Controller
(LBSC).  Move the Ethernet device node to reflect this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r8a7792-wheat.dts | 34 +++++++++++----------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7792-wheat.dts b/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
index 434e4655be9daff7..f87e78fe3f6e6aec 100644
--- a/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
+++ b/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
@@ -38,22 +38,6 @@ d3_3v: regulator-3v3 {
 		regulator-always-on;
 	};
 
-	ethernet@18000000 {
-		compatible = "smsc,lan89218", "smsc,lan9115";
-		reg = <0 0x18000000 0 0x100>;
-		phy-mode = "mii";
-		interrupt-parent = <&irqc>;
-		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
-		smsc,irq-push-pull;
-		smsc,save-mac-address;
-		reg-io-width = <4>;
-		vddvario-supply = <&d3_3v>;
-		vdd33a-supply = <&d3_3v>;
-
-		pinctrl-0 = <&lan89218_pins>;
-		pinctrl-names = "default";
-	};
-
 	keyboard {
 		compatible = "gpio-keys";
 
@@ -117,6 +101,24 @@ &extal_clk {
 	clock-frequency = <20000000>;
 };
 
+&lbsc {
+	ethernet@18000000 {
+		compatible = "smsc,lan89218", "smsc,lan9115";
+		reg = <0x18000000 0x100>;
+		phy-mode = "mii";
+		interrupt-parent = <&irqc>;
+		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		smsc,irq-push-pull;
+		smsc,save-mac-address;
+		reg-io-width = <4>;
+		vddvario-supply = <&d3_3v>;
+		vdd33a-supply = <&d3_3v>;
+
+		pinctrl-0 = <&lan89218_pins>;
+		pinctrl-names = "default";
+	};
+};
+
 &pfc {
 	scif0_pins: scif0 {
 		groups = "scif0_data";
-- 
2.34.1

