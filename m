Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49F29759908
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jul 2023 17:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbjGSPAb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jul 2023 11:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbjGSPA1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 11:00:27 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5A6172E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jul 2023 08:00:20 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:51f7:4083:c317:cdf])
        by michel.telenet-ops.be with bizsmtp
        id P30G2A00Q2xuRWb0630Gd3; Wed, 19 Jul 2023 17:00:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qM8es-001tPu-ES;
        Wed, 19 Jul 2023 17:00:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qM8f2-001Atd-Fd;
        Wed, 19 Jul 2023 17:00:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 11/13] of: unittest-data: Fix whitespace - blank lines
Date:   Wed, 19 Jul 2023 17:00:11 +0200
Message-Id: <a0f95faf5284da23889304c6f0617a52a6e1306e.1689776064.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689776064.git.geert+renesas@glider.be>
References: <cover.1689776064.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Blank line between properties and subnodes.
Blank line between subsequent subnodes.
No blank line after subnode opening curly brace.
No blank line after subnode closing curly brace.
No blank line at end of file.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/of/unittest-data/overlay.dtso                  | 2 --
 drivers/of/unittest-data/overlay_11.dtso               | 1 -
 drivers/of/unittest-data/overlay_15.dtso               | 1 +
 drivers/of/unittest-data/overlay_4.dtso                | 1 -
 drivers/of/unittest-data/overlay_bad_add_dup_node.dtso | 1 -
 drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso | 1 -
 drivers/of/unittest-data/overlay_bad_phandle.dtso      | 1 -
 drivers/of/unittest-data/overlay_bad_symbol.dtso       | 1 -
 drivers/of/unittest-data/overlay_common.dtsi           | 2 --
 drivers/of/unittest-data/overlay_gpio_01.dtso          | 1 +
 drivers/of/unittest-data/overlay_gpio_02a.dtso         | 1 +
 drivers/of/unittest-data/overlay_gpio_02b.dtso         | 1 +
 drivers/of/unittest-data/overlay_gpio_03.dtso          | 1 +
 drivers/of/unittest-data/overlay_gpio_04a.dtso         | 1 +
 drivers/of/unittest-data/overlay_gpio_04b.dtso         | 1 +
 drivers/of/unittest-data/testcases_common.dtsi         | 1 +
 drivers/of/unittest-data/tests-interrupts.dtsi         | 1 +
 drivers/of/unittest-data/tests-overlay.dtsi            | 1 -
 drivers/of/unittest-data/tests-phandle.dtsi            | 2 ++
 19 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/of/unittest-data/overlay.dtso b/drivers/of/unittest-data/overlay.dtso
index 3bbc59e922fe71c3..0c078b08ef083561 100644
--- a/drivers/of/unittest-data/overlay.dtso
+++ b/drivers/of/unittest-data/overlay.dtso
@@ -3,7 +3,6 @@
 /plugin/;
 
 &electric_1 {
-
 	status = "okay";
 
 	hvac_2: hvac-large-1 {
@@ -57,7 +56,6 @@ ride_200_right: track@20 {
 };
 
 &lights_2 {
-
 	status = "okay";
 	color = "purple", "white", "red", "green";
 	rate = < 3 256 >;
diff --git a/drivers/of/unittest-data/overlay_11.dtso b/drivers/of/unittest-data/overlay_11.dtso
index 9a79b253a8098833..7d04ff503a18ffba 100644
--- a/drivers/of/unittest-data/overlay_11.dtso
+++ b/drivers/of/unittest-data/overlay_11.dtso
@@ -23,6 +23,5 @@ test-unittest111 {
 			status = "okay";
 			reg = <1>;
 		};
-
 	};
 };
diff --git a/drivers/of/unittest-data/overlay_15.dtso b/drivers/of/unittest-data/overlay_15.dtso
index 5728490474f6bd2d..ba02ae1fed38b64a 100644
--- a/drivers/of/unittest-data/overlay_15.dtso
+++ b/drivers/of/unittest-data/overlay_15.dtso
@@ -7,6 +7,7 @@
 &unittest_i2c_test_bus {
 	#address-cells = <1>;
 	#size-cells = <0>;
+
 	test-unittest15 {
 		reg = <11>;
 		compatible = "unittest-i2c-mux";
diff --git a/drivers/of/unittest-data/overlay_4.dtso b/drivers/of/unittest-data/overlay_4.dtso
index a8a77ddf9abe829c..9b9eadddb4a09af3 100644
--- a/drivers/of/unittest-data/overlay_4.dtso
+++ b/drivers/of/unittest-data/overlay_4.dtso
@@ -5,7 +5,6 @@
 /* overlay_4 - test insertion of a full node */
 
 &unittest_test_bus {
-
 	/* suppress DTC warning */
 	#address-cells = <1>;
 	#size-cells = <0>;
diff --git a/drivers/of/unittest-data/overlay_bad_add_dup_node.dtso b/drivers/of/unittest-data/overlay_bad_add_dup_node.dtso
index 145dfc3b1024191a..a8d8534f725c10ea 100644
--- a/drivers/of/unittest-data/overlay_bad_add_dup_node.dtso
+++ b/drivers/of/unittest-data/overlay_bad_add_dup_node.dtso
@@ -13,7 +13,6 @@
  */
 
 &electric_1 {
-
 	motor-1 {
 		controller {
 			power_bus = < 0x1 0x2 >;
diff --git a/drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso b/drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso
index 6327d1ffb9636589..3f0ee9cbefb815be 100644
--- a/drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso
+++ b/drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso
@@ -24,7 +24,6 @@
  */
 
 &electric_1 {
-
 	motor-1 {
 		electric {
 			rpm_avail = < 100 >;
diff --git a/drivers/of/unittest-data/overlay_bad_phandle.dtso b/drivers/of/unittest-data/overlay_bad_phandle.dtso
index 83b79736031878fc..ab2c7df1019674f1 100644
--- a/drivers/of/unittest-data/overlay_bad_phandle.dtso
+++ b/drivers/of/unittest-data/overlay_bad_phandle.dtso
@@ -3,7 +3,6 @@
 /plugin/;
 
 &electric_1 {
-
 	// This label should cause an error when the overlay
 	// is applied.  There is already a phandle value
 	// in the base tree for motor-1.
diff --git a/drivers/of/unittest-data/overlay_bad_symbol.dtso b/drivers/of/unittest-data/overlay_bad_symbol.dtso
index 98c6d1de144a21ab..5d4e34baf1d8e3ed 100644
--- a/drivers/of/unittest-data/overlay_bad_symbol.dtso
+++ b/drivers/of/unittest-data/overlay_bad_symbol.dtso
@@ -3,7 +3,6 @@
 /plugin/;
 
 &electric_1 {
-
 	// This label should cause an error when the overlay
 	// is applied.  There is already a symbol hvac_1
 	// in the base tree
diff --git a/drivers/of/unittest-data/overlay_common.dtsi b/drivers/of/unittest-data/overlay_common.dtsi
index 08874a72556e050f..491b89c43cf38321 100644
--- a/drivers/of/unittest-data/overlay_common.dtsi
+++ b/drivers/of/unittest-data/overlay_common.dtsi
@@ -85,7 +85,5 @@ retail_1: vending@50000 {
 			compatible = "ot,tickets";
 			status = "disabled";
 		};
-
 	};
 };
-
diff --git a/drivers/of/unittest-data/overlay_gpio_01.dtso b/drivers/of/unittest-data/overlay_gpio_01.dtso
index 699ff104ae1062f9..bb3a31a2137aea17 100644
--- a/drivers/of/unittest-data/overlay_gpio_01.dtso
+++ b/drivers/of/unittest-data/overlay_gpio_01.dtso
@@ -5,6 +5,7 @@
 &unittest_test_bus {
 	#address-cells = <1>;
 	#size-cells = <0>;
+
 	gpio@0 {
 		compatible = "unittest-gpio";
 		reg = <0>;
diff --git a/drivers/of/unittest-data/overlay_gpio_02a.dtso b/drivers/of/unittest-data/overlay_gpio_02a.dtso
index ec59aff6ed47ed50..da955537df74be90 100644
--- a/drivers/of/unittest-data/overlay_gpio_02a.dtso
+++ b/drivers/of/unittest-data/overlay_gpio_02a.dtso
@@ -5,6 +5,7 @@
 &unittest_test_bus {
 	#address-cells = <1>;
 	#size-cells = <0>;
+
 	gpio@2 {
 		compatible = "unittest-gpio";
 		reg = <2>;
diff --git a/drivers/of/unittest-data/overlay_gpio_02b.dtso b/drivers/of/unittest-data/overlay_gpio_02b.dtso
index 43ce111d41ceb8d5..79503965d3d7d090 100644
--- a/drivers/of/unittest-data/overlay_gpio_02b.dtso
+++ b/drivers/of/unittest-data/overlay_gpio_02b.dtso
@@ -5,6 +5,7 @@
 &unittest_test_bus {
 	#address-cells = <1>;
 	#size-cells = <0>;
+
 	gpio@2 {
 		line-a {
 			gpio-hog;
diff --git a/drivers/of/unittest-data/overlay_gpio_03.dtso b/drivers/of/unittest-data/overlay_gpio_03.dtso
index 6e0312340a1ba758..d8c709616029b8ba 100644
--- a/drivers/of/unittest-data/overlay_gpio_03.dtso
+++ b/drivers/of/unittest-data/overlay_gpio_03.dtso
@@ -5,6 +5,7 @@
 &unittest_test_bus {
 	#address-cells = <1>;
 	#size-cells = <0>;
+
 	gpio@3 {
 		compatible = "unittest-gpio";
 		reg = <3>;
diff --git a/drivers/of/unittest-data/overlay_gpio_04a.dtso b/drivers/of/unittest-data/overlay_gpio_04a.dtso
index 7b1e04ebfa7a0410..de86511972c202a0 100644
--- a/drivers/of/unittest-data/overlay_gpio_04a.dtso
+++ b/drivers/of/unittest-data/overlay_gpio_04a.dtso
@@ -5,6 +5,7 @@
 &unittest_test_bus {
 	#address-cells = <1>;
 	#size-cells = <0>;
+
 	gpio@4 {
 		compatible = "unittest-gpio";
 		reg = <4>;
diff --git a/drivers/of/unittest-data/overlay_gpio_04b.dtso b/drivers/of/unittest-data/overlay_gpio_04b.dtso
index a14e95c6699aeb06..dc6eff22f927218b 100644
--- a/drivers/of/unittest-data/overlay_gpio_04b.dtso
+++ b/drivers/of/unittest-data/overlay_gpio_04b.dtso
@@ -5,6 +5,7 @@
 &unittest_test_bus {
 	#address-cells = <1>;
 	#size-cells = <0>;
+
 	gpio@4 {
 		line-c {
 			gpio-hog;
diff --git a/drivers/of/unittest-data/testcases_common.dtsi b/drivers/of/unittest-data/testcases_common.dtsi
index e7887f2301c102e6..1c2cdf353ae36b50 100644
--- a/drivers/of/unittest-data/testcases_common.dtsi
+++ b/drivers/of/unittest-data/testcases_common.dtsi
@@ -5,6 +5,7 @@ testcase-data {
 		changeset {
 			prop-update = "hello";
 			prop-remove = "world";
+
 			node-remove {
 			};
 		};
diff --git a/drivers/of/unittest-data/tests-interrupts.dtsi b/drivers/of/unittest-data/tests-interrupts.dtsi
index ecc74dbcc373f655..7c9f31cc131bae79 100644
--- a/drivers/of/unittest-data/tests-interrupts.dtsi
+++ b/drivers/of/unittest-data/tests-interrupts.dtsi
@@ -5,6 +5,7 @@ testcase-data {
 		interrupts {
 			#address-cells = <1>;
 			#size-cells = <1>;
+
 			test_intc0: intc0 {
 				interrupt-controller;
 				#interrupt-cells = <1>;
diff --git a/drivers/of/unittest-data/tests-overlay.dtsi b/drivers/of/unittest-data/tests-overlay.dtsi
index 4ea024d908ee22d6..eb35e8aa5d5ace95 100644
--- a/drivers/of/unittest-data/tests-overlay.dtsi
+++ b/drivers/of/unittest-data/tests-overlay.dtsi
@@ -3,7 +3,6 @@
 / {
 	testcase-data {
 		overlay-node {
-
 			/* test bus */
 			unittest_test_bus: test-bus {
 				compatible = "simple-bus";
diff --git a/drivers/of/unittest-data/tests-phandle.dtsi b/drivers/of/unittest-data/tests-phandle.dtsi
index 6b33be4c4416ce7b..d01f92f0f0db7f57 100644
--- a/drivers/of/unittest-data/tests-phandle.dtsi
+++ b/drivers/of/unittest-data/tests-phandle.dtsi
@@ -8,7 +8,9 @@ aliases {
 	testcase: testcase-data {
 		security-password = "password";
 		duplicate-name = "duplicate";
+
 		duplicate-name { };
+
 		phandle-tests {
 			provider0: provider0 {
 				#phandle-cells = <0>;
-- 
2.34.1

