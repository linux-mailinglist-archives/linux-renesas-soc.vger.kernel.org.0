Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86DF93C84D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 14:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239383AbhGNM6d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 08:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239381AbhGNM6c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 08:58:32 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49AF6C061762
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jul 2021 05:55:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by xavier.telenet-ops.be with bizsmtp
        id V0vf2500C1ccfby010vf23; Wed, 14 Jul 2021 14:55:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eQN-0018mR-6j; Wed, 14 Jul 2021 14:55:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eQM-00AaUc-6a; Wed, 14 Jul 2021 14:55:38 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: rza2mevb: Add I2C EEPROM support
Date:   Wed, 14 Jul 2021 14:55:36 +0200
Message-Id: <786f0354fb30b183d5bccb2f12b13e6535b9ace1.1626267234.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable the third I2C channel, and describe the I2C EEPROM connected to
it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.15.

 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index 68498ce2aec0ebd9..ececb1bc995a5918 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -109,6 +109,20 @@ &extal_clk {
 	clock-frequency = <24000000>;	/* 24MHz */
 };
 
+&i2c3 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+
+	eeprom@50 {
+		compatible = "renesas,r1ex24128", "atmel,24c128";
+		reg = <0x50>;
+		pagesize = <64>;
+	};
+};
+
 /* High resolution System tick timers */
 &ostm0 {
 	status = "okay";
@@ -147,6 +161,11 @@ eth1_pins: eth1 {
 			 <RZA2_PINMUX(PORTL, 1, 5)>; /* IRQ5 */
 	};
 
+	i2c3_pins: i2c3 {
+		pinmux = <RZA2_PINMUX(PORTD, 6, 1)>,	/* RIIC3SCL */
+			 <RZA2_PINMUX(PORTD, 7, 1)>;	/* RIIC3SDA */
+	};
+
 	keyboard_pins: keyboard {
 		pinmux = <RZA2_PINMUX(PORTJ, 1, 6)>;	/* IRQ0 */
 	};
-- 
2.25.1

