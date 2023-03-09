Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 856F86B28DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 16:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjCIPa6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 10:30:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbjCIPaz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 10:30:55 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82987EFF56
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Mar 2023 07:30:54 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:3a77:63e:b168:ae06])
        by baptiste.telenet-ops.be with bizsmtp
        id WFWs2900Z54Hw2A01FWsuQ; Thu, 09 Mar 2023 16:30:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1paIDi-00BL6g-1U;
        Thu, 09 Mar 2023 16:30:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1paIEG-00GUnn-Jh;
        Thu, 09 Mar 2023 16:30:52 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] ARM: dts: armadillo800eva: Add I2C EEPROM for MAC address
Date:   Thu,  9 Mar 2023 16:30:47 +0100
Message-Id: <6d402b289fd20125d9f6f6b2a4f239aa1887daa6.1678375464.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678375464.git.geert+renesas@glider.be>
References: <cover.1678375464.git.geert+renesas@glider.be>
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

Add a device node for the M24C01 I2C EEPROM which serves as external
storage for the Ethernet MAC address.

While at it, restore sort order (by unit address) of the I2C devices.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
index 76f04011870cc571..48b678a6c5cb92e5 100644
--- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
@@ -210,6 +210,19 @@ &cmt1 {
 
 &i2c0 {
 	status = "okay";
+
+	wm8978: codec@1a {
+		#sound-dai-cells = <0>;
+		compatible = "wlf,wm8978";
+		reg = <0x1a>;
+	};
+
+	eeprom@50 {
+		compatible = "st,24c01", "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+
 	touchscreen@55 {
 		compatible = "sitronix,st1232";
 		reg = <0x55>;
@@ -219,12 +232,6 @@ touchscreen@55 {
 		pinctrl-names = "default";
 		gpios = <&pfc 166 GPIO_ACTIVE_LOW>;
 	};
-
-	wm8978: codec@1a {
-		#sound-dai-cells = <0>;
-		compatible = "wlf,wm8978";
-		reg = <0x1a>;
-	};
 };
 
 &i2c2 {
-- 
2.34.1

