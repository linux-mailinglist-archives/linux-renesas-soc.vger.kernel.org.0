Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDB00759900
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jul 2023 17:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbjGSPA2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jul 2023 11:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbjGSPAY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 11:00:24 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA61C7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jul 2023 08:00:20 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:51f7:4083:c317:cdf])
        by xavier.telenet-ops.be with bizsmtp
        id P30G2A00P2xuRWb0130G4P; Wed, 19 Jul 2023 17:00:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qM8es-001tQ0-Fh;
        Wed, 19 Jul 2023 17:00:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qM8f2-001Atn-Gn;
        Wed, 19 Jul 2023 17:00:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 13/13] of: unittest-data: Fix whitespace - angular brackets
Date:   Wed, 19 Jul 2023 17:00:13 +0200
Message-Id: <1b48f7fa983763894607d9a8157d7dc99ab7adc8.1689776064.git.geert+renesas@glider.be>
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

No space after opening or before closing angular bracket.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/of/unittest-data/overlay.dtso         | 30 ++++++++--------
 .../overlay_bad_add_dup_node.dtso             |  4 +--
 .../overlay_bad_add_dup_prop.dtso             |  4 +--
 .../of/unittest-data/overlay_bad_phandle.dtso |  4 +--
 .../of/unittest-data/overlay_bad_symbol.dtso  |  4 +--
 drivers/of/unittest-data/overlay_common.dtsi  | 34 +++++++++----------
 6 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/of/unittest-data/overlay.dtso b/drivers/of/unittest-data/overlay.dtso
index 0c078b08ef083561..b3e807b99852363e 100644
--- a/drivers/of/unittest-data/overlay.dtso
+++ b/drivers/of/unittest-data/overlay.dtso
@@ -7,8 +7,8 @@ &electric_1 {
 
 	hvac_2: hvac-large-1 {
 		compatible = "ot,hvac-large";
-		heat-range = < 40 75 >;
-		cool-range = < 65 80 >;
+		heat-range = <40 75>;
+		cool-range = <65 80>;
 	};
 };
 
@@ -23,11 +23,11 @@ ride@100 {
 		#size-cells = <1>;
 
 		track@30 {
-			incline-up = < 48 32 16 >;
+			incline-up = <48 32 16>;
 		};
 
 		track@40 {
-			incline-up = < 47 31 15 >;
+			incline-up = <47 31 15>;
 		};
 	};
 
@@ -35,22 +35,22 @@ ride_200: ride@200 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "ot,ferris-wheel";
-		reg = < 0x00000200 0x100 >;
-		hvac-provider = < &hvac_2 >;
-		hvac-thermostat = < 27 32 > ;
-		hvac-zones = < 12 5 >;
+		reg = <0x00000200 0x100>;
+		hvac-provider = <&hvac_2>;
+		hvac-thermostat = <27 32> ;
+		hvac-zones = <12 5>;
 		hvac-zone-names = "operator", "snack-bar";
-		spin-controller = < &spin_ctrl_1 3 >;
-		spin-rph = < 30 >;
-		gondolas = < 16 >;
-		gondola-capacity = < 6 >;
+		spin-controller = <&spin_ctrl_1 3>;
+		spin-rph = <30>;
+		gondolas = <16>;
+		gondola-capacity = <6>;
 
 		ride_200_left: track@10 {
-			reg = < 0x00000010 0x10 >;
+			reg = <0x00000010 0x10>;
 		};
 
 		ride_200_right: track@20 {
-			reg = < 0x00000020 0x10 >;
+			reg = <0x00000020 0x10>;
 		};
 	};
 };
@@ -58,5 +58,5 @@ ride_200_right: track@20 {
 &lights_2 {
 	status = "okay";
 	color = "purple", "white", "red", "green";
-	rate = < 3 256 >;
+	rate = <3 256>;
 };
diff --git a/drivers/of/unittest-data/overlay_bad_add_dup_node.dtso b/drivers/of/unittest-data/overlay_bad_add_dup_node.dtso
index 11aa1401244d9685..9b53412b20796e29 100644
--- a/drivers/of/unittest-data/overlay_bad_add_dup_node.dtso
+++ b/drivers/of/unittest-data/overlay_bad_add_dup_node.dtso
@@ -15,13 +15,13 @@
 &electric_1 {
 	motor-1 {
 		controller {
-			power_bus = < 0x1 0x2 >;
+			power_bus = <0x1 0x2>;
 		};
 	};
 };
 
 &spin_ctrl_1 {
 	controller {
-		power_bus_emergency = < 0x101 0x102 >;
+		power_bus_emergency = <0x101 0x102>;
 	};
 };
diff --git a/drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso b/drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso
index 5af099cc2174e273..e03f791655b07b3f 100644
--- a/drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso
+++ b/drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso
@@ -26,13 +26,13 @@
 &electric_1 {
 	motor-1 {
 		electric {
-			rpm_avail = < 100 >;
+			rpm_avail = <100>;
 		};
 	};
 };
 
 &spin_ctrl_1 {
 	electric {
-		rpm_avail = < 100 200 >;
+		rpm_avail = <100 200>;
 	};
 };
diff --git a/drivers/of/unittest-data/overlay_bad_phandle.dtso b/drivers/of/unittest-data/overlay_bad_phandle.dtso
index ab2c7df1019674f1..a61ffc0738e3bf01 100644
--- a/drivers/of/unittest-data/overlay_bad_phandle.dtso
+++ b/drivers/of/unittest-data/overlay_bad_phandle.dtso
@@ -7,7 +7,7 @@ &electric_1 {
 	// is applied.  There is already a phandle value
 	// in the base tree for motor-1.
 	spin_ctrl_1_conflict: motor-1 {
-		accelerate = < 3 >;
-		decelerate = < 5 >;
+		accelerate = <3>;
+		decelerate = <5>;
 	};
 };
diff --git a/drivers/of/unittest-data/overlay_bad_symbol.dtso b/drivers/of/unittest-data/overlay_bad_symbol.dtso
index 5d4e34baf1d8e3ed..07f730384cdde1f8 100644
--- a/drivers/of/unittest-data/overlay_bad_symbol.dtso
+++ b/drivers/of/unittest-data/overlay_bad_symbol.dtso
@@ -8,8 +8,8 @@ &electric_1 {
 	// in the base tree
 	hvac_1: hvac-medium-2 {
 		compatible = "ot,hvac-medium";
-		heat-range = < 50 75 >;
-		cool-range = < 60 80 >;
+		heat-range = <50 75>;
+		cool-range = <60 80>;
 	};
 
 };
diff --git a/drivers/of/unittest-data/overlay_common.dtsi b/drivers/of/unittest-data/overlay_common.dtsi
index 491b89c43cf38321..a9d7cdbd5ddc470c 100644
--- a/drivers/of/unittest-data/overlay_common.dtsi
+++ b/drivers/of/unittest-data/overlay_common.dtsi
@@ -16,19 +16,19 @@ testcase-data-2 {
 
 		electric_1: substation@100 {
 			compatible = "ot,big-volts-control";
-			reg = < 0x00000100 0x100 >;
+			reg = <0x00000100 0x100>;
 			status = "disabled";
 
 			hvac_1: hvac-medium-1 {
 				compatible = "ot,hvac-medium";
-				heat-range = < 50 75 >;
-				cool-range = < 60 80 >;
+				heat-range = <50 75>;
+				cool-range = <60 80>;
 			};
 
 			spin_ctrl_1: motor-1 {
 				compatible = "ot,ferris-wheel-motor";
 				spin = "clockwise";
-				rpm_avail = < 50 >;
+				rpm_avail = <50>;
 			};
 
 			spin_ctrl_2: motor-8 {
@@ -41,27 +41,27 @@ rides_1: fairway-1 {
 			#size-cells = <1>;
 			compatible = "ot,rides";
 			status = "disabled";
-			orientation = < 127 >;
+			orientation = <127>;
 
 			ride@100 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 				compatible = "ot,roller-coaster";
-				reg = < 0x00000100 0x100 >;
-				hvac-provider = < &hvac_1 >;
-				hvac-thermostat = < 29 > ;
-				hvac-zones = < 14 >;
+				reg = <0x00000100 0x100>;
+				hvac-provider = <&hvac_1>;
+				hvac-thermostat = <29> ;
+				hvac-zones = <14>;
 				hvac-zone-names = "operator";
-				spin-controller = < &spin_ctrl_2 5 &spin_ctrl_2 7 >;
+				spin-controller = <&spin_ctrl_2 5 &spin_ctrl_2 7>;
 				spin-controller-names = "track_1", "track_2";
-				queues = < 2 >;
+				queues = <2>;
 
 				track@30 {
-					reg = < 0x00000030 0x10 >;
+					reg = <0x00000030 0x10>;
 				};
 
 				track@40 {
-					reg = < 0x00000040 0x10 >;
+					reg = <0x00000040 0x10>;
 				};
 
 			};
@@ -69,19 +69,19 @@ track@40 {
 
 		lights_1: lights@30000 {
 			compatible = "ot,work-lights";
-			reg = < 0x00030000 0x1000 >;
+			reg = <0x00030000 0x1000>;
 			status = "disabled";
 		};
 
 		lights_2: lights@40000 {
 			compatible = "ot,show-lights";
-			reg = < 0x00040000 0x1000 >;
+			reg = <0x00040000 0x1000>;
 			status = "disabled";
-			rate = < 13 138 >;
+			rate = <13 138>;
 		};
 
 		retail_1: vending@50000 {
-			reg = < 0x00050000 0x1000 >;
+			reg = <0x00050000 0x1000>;
 			compatible = "ot,tickets";
 			status = "disabled";
 		};
-- 
2.34.1

