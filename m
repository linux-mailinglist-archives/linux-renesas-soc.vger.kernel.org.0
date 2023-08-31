Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB9478EC92
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 13:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346141AbjHaLxP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 07:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346177AbjHaLxE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 07:53:04 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7DB10D5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 04:52:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
        by michel.telenet-ops.be with bizsmtp
        id gBse2A00Q3874jb06Bse6M; Thu, 31 Aug 2023 13:52:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbgDq-00274l-9c;
        Thu, 31 Aug 2023 13:52:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbgE2-00CIUz-PN;
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
Subject: [PATCH 07/13] ARM: dts: renesas: marzen: Move Ethernet node to LBSC
Date:   Thu, 31 Aug 2023 13:52:29 +0200
Message-Id: <74a8ee61ed89c9ca0489156a4f135ecb825e56b9.1693481518.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693481518.git.geert+renesas@glider.be>
References: <cover.1693481518.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The SMSC LAN89218AQ Ethernet controller on the Marzen development board
resides in the external address space of the Local Bus State Controller
(LBSC).  Move the Ethernet device node to reflect this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r8a7779-marzen.dts | 32 +++++++++++---------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7779-marzen.dts b/arch/arm/boot/dts/renesas/r8a7779-marzen.dts
index 50a468c8018351df..9c001cbfc02f79f7 100644
--- a/arch/arm/boot/dts/renesas/r8a7779-marzen.dts
+++ b/arch/arm/boot/dts/renesas/r8a7779-marzen.dts
@@ -52,21 +52,6 @@ vccq_sdhi0: regulator-vccq-sdhi0 {
 		states = <3300000 1>, <1800000 0>;
 	};
 
-	ethernet@18000000 {
-		compatible = "smsc,lan89218", "smsc,lan9115";
-		reg = <0x18000000 0x100>;
-		pinctrl-0 = <&ethernet_pins>;
-		pinctrl-names = "default";
-
-		phy-mode = "mii";
-		interrupt-parent = <&irqpin0>;
-		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
-		smsc,irq-push-pull;
-		reg-io-width = <4>;
-		vddvario-supply = <&fixedregulator3v3>;
-		vdd33a-supply = <&fixedregulator3v3>;
-	};
-
 	keyboard-irq {
 		compatible = "gpio-keys";
 
@@ -229,6 +214,23 @@ &extal_clk {
 	clock-frequency = <31250000>;
 };
 
+&lbsc {
+	ethernet@18000000 {
+		compatible = "smsc,lan89218", "smsc,lan9115";
+		reg = <0x18000000 0x100>;
+		pinctrl-0 = <&ethernet_pins>;
+		pinctrl-names = "default";
+
+		phy-mode = "mii";
+		interrupt-parent = <&irqpin0>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		smsc,irq-push-pull;
+		reg-io-width = <4>;
+		vddvario-supply = <&fixedregulator3v3>;
+		vdd33a-supply = <&fixedregulator3v3>;
+	};
+};
+
 &tmu0 {
 	status = "okay";
 };
-- 
2.34.1

