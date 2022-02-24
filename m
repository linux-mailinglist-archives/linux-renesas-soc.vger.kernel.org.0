Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF7E4C2BCA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Feb 2022 13:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbiBXMdr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Feb 2022 07:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234401AbiBXMdp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Feb 2022 07:33:45 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02352192E27
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Feb 2022 04:33:13 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:598d:7788:288b:e4f])
        by andre.telenet-ops.be with bizsmtp
        id z0ZB2600J0fvPgN010ZBXM; Thu, 24 Feb 2022 13:33:12 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nNDJ1-001jK1-En; Thu, 24 Feb 2022 13:33:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nNDJ1-00CPJn-08; Thu, 24 Feb 2022 13:33:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: Align GPIO hog names with dtschema
Date:   Thu, 24 Feb 2022 13:33:09 +0100
Message-Id: <972d982024cbb04dcf29b2a0ac6beaf41e66c363.1645705927.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dtschema expects GPIO hogs to end with a "hog" suffix.
Also, the convention for node names is to use hyphens, not underscores.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.18.
---
 arch/arm/boot/dts/iwg20d-q7-common.dtsi         | 2 +-
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts   | 2 +-
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts | 4 ++--
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts         | 4 ++--
 arch/arm/boot/dts/r8a7742-iwg21m.dtsi           | 2 +-
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts       | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index 849034a49a3f98e2..03caea6fc6ffa4cf 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -181,7 +181,7 @@ &du {
 };
 
 &gpio2 {
-	touch-interrupt {
+	touch-interrupt-hog {
 		gpio-hog;
 		gpios = <12 GPIO_ACTIVE_LOW>;
 		input;
diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
index c3ca693b91daebed..4a9e6343d4759b74 100644
--- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
@@ -276,7 +276,7 @@ lcd0_pins: lcd0 {
 		function = "lcd0";
 	};
 
-	lcd0_mux {
+	lcd0-mux-hog {
 		/* DBGMD/LCDC0/FSIA MUX */
 		gpio-hog;
 		gpios = <176 0>;
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
index 3c8a7c8b1fdd56d3..4e58c54cde17c382 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -91,10 +91,10 @@ phy1: ethernet-phy@1 {
 
 &gpio0 {
 	/* Disable hogging GP0_18 to output LOW */
-	/delete-node/ qspi_en;
+	/delete-node/ qspi-en-hog;
 
 	/* Hog GP0_18 to output HIGH to enable VIN2 */
-	vin2_en {
+	vin2-en-hog {
 		gpio-hog;
 		gpios = <18 GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
index a5a79cdbcd0ee09b..64102b664055b475 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
@@ -226,7 +226,7 @@ &du {
 };
 
 &gpio0 {
-	touch-interrupt {
+	touch-interrupt-hog {
 		gpio-hog;
 		gpios = <24 GPIO_ACTIVE_LOW>;
 		input;
@@ -234,7 +234,7 @@ touch-interrupt {
 };
 
 &gpio1 {
-	can-trx-en-gpio{
+	can-trx-en-hog {
 		gpio-hog;
 		gpios = <28 GPIO_ACTIVE_HIGH>;
 		output-low;
diff --git a/arch/arm/boot/dts/r8a7742-iwg21m.dtsi b/arch/arm/boot/dts/r8a7742-iwg21m.dtsi
index 5621c9ed698f0e4a..b281a4d164b0aae8 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21m.dtsi
+++ b/arch/arm/boot/dts/r8a7742-iwg21m.dtsi
@@ -37,7 +37,7 @@ &extal_clk {
 
 &gpio0 {
 	/* GP0_18 set low to select QSPI. Doing so will disable VIN2 */
-	qspi_en {
+	qspi-en-hog {
 		gpio-hog;
 		gpios = <18 GPIO_ACTIVE_HIGH>;
 		output-low;
diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index b024621c998103b2..6448022852491661 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -116,7 +116,7 @@ &extal_clk {
 };
 
 &gpio2 {
-	interrupt-fixup {
+	interrupt-fixup-hog {
 		gpio-hog;
 		gpios = <29 GPIO_ACTIVE_HIGH>;
 		line-name = "hdmi-hpd-int";
-- 
2.25.1

