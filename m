Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 171524C2BD5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Feb 2022 13:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234436AbiBXMeW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Feb 2022 07:34:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234415AbiBXMeT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Feb 2022 07:34:19 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D2628198F
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Feb 2022 04:33:44 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:598d:7788:288b:e4f])
        by xavier.telenet-ops.be with bizsmtp
        id z0Zi2600a0fvPgN010Zi4S; Thu, 24 Feb 2022 13:33:43 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nNDJW-001jKC-I3; Thu, 24 Feb 2022 13:33:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nNDJV-00CPLc-HA; Thu, 24 Feb 2022 13:33:41 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: Align GPIO hog names with dtschema
Date:   Thu, 24 Feb 2022 13:33:40 +0100
Message-Id: <baee4b9980576ffbab24122fce7147c9cbc2ea59.1645705998.git.geert+renesas@glider.be>
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
 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi       | 2 +-
 arch/arm64/boot/dts/renesas/hihope-common.dtsi            | 2 +-
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi      | 2 +-
 arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts | 2 +-
 arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts         | 4 ++--
 arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi  | 4 ++--
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 17d5c4501bbe184c..877d076ffcc9bf92 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -77,7 +77,7 @@ &extalr_clk {
 };
 
 &gpio6 {
-	usb_hub_reset {
+	usb-hub-reset-hog {
 		gpio-hog;
 		gpios = <10 GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 0c7e6f79059020ff..935d06515aa6130b 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -140,7 +140,7 @@ &extalr_clk {
 };
 
 &gpio6 {
-	usb1-reset {
+	usb1-reset-hog {
 		gpio-hog;
 		gpios = <10 GPIO_ACTIVE_LOW>;
 		output-low;
diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi
index 40c5e8d6d8418910..d66d17e34694c871 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi
@@ -20,7 +20,7 @@ &gpio1 {
 	 * When GP1_20 is LOW LVDS0 is connected to the LVDS connector
 	 * When GP1_20 is HIGH LVDS0 is connected to the LT8918L
 	 */
-	lvds-connector-en-gpio {
+	lvds-connector-en-hog {
 		gpio-hog;
 		gpios = <20 GPIO_ACTIVE_HIGH>;
 		output-low;
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts
index a7b27d09f6c25fa1..c1812d1ef06a302a 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts
@@ -68,7 +68,7 @@ &gpio0 {
 	 * When GP0_17 is low LVDS[01] are connected to the LVDS connector
 	 * When GP0_17 is high LVDS[01] are connected to the LT8918L
 	 */
-	lvds-connector-en-gpio{
+	lvds-connector-en-hog {
 		gpio-hog;
 		gpios = <17 GPIO_ACTIVE_HIGH>;
 		output-low;
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
index 49d141db53f7af37..fc334b4c2aa422ee 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
@@ -18,8 +18,8 @@ / {
 };
 
 &pinctrl {
-	/delete-node/ can0-stb;
-	/delete-node/ can1-stb;
+	/delete-node/ can0-stb-hog;
+	/delete-node/ can1-stb-hog;
 	/delete-node/ gpio-sd0-pwr-en-hog;
 	/delete-node/ sd0-dev-sel-hog;
 	/delete-node/ sd1-pwr-en-hog;
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
index 2ef217445f72dae0..9085d8c76ce15452 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
@@ -18,7 +18,7 @@ can0_pins: can0 {
 	};
 
 	/* SW7 should be at position 2->3 so that GPIO8_CAN0_STB line is activated */
-	can0-stb {
+	can0-stb-hog {
 		gpio-hog;
 		gpios = <RZG2L_GPIO(42, 2) GPIO_ACTIVE_HIGH>;
 		output-low;
@@ -31,7 +31,7 @@ can1_pins: can1 {
 	};
 
 	/* SW8 should be at position 2->3 so that GPIO9_CAN1_STB line is activated */
-	can1-stb {
+	can1-stb-hog {
 		gpio-hog;
 		gpios = <RZG2L_GPIO(42, 3) GPIO_ACTIVE_HIGH>;
 		output-low;
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
index bff56d69693667f1..37ff2091582ec966 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
@@ -34,7 +34,7 @@ scif1_pins: scif1 {
 
 #if SW_RSPI_CAN
 	/* SW8 should be at position 2->3 so that GPIO9_CAN1_STB line is activated */
-	can1-stb {
+	can1-stb-hog {
 		gpio-hog;
 		gpios = <RZG2L_GPIO(44, 3) GPIO_ACTIVE_HIGH>;
 		output-low;
-- 
2.25.1

