Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C367B178EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 13:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbfEHL4R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 07:56:17 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:52368 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbfEHL4Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 07:56:16 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0FA9425BE05;
        Wed,  8 May 2019 21:56:15 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 138099403E0; Wed,  8 May 2019 13:56:13 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH v2] arm64: dts: renesas: r8a7795: Create thermal zone to support IPA
Date:   Wed,  8 May 2019 13:56:05 +0200
Message-Id: <20190508115605.13726-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Dien Pham <dien.pham.ry@renesas.com>

Setup a thermal zone driven by SoC temperature sensor.
Create passive trip points and bind them to CPUFreq cooling
device that supports power extension.

In R-Car Gen3, IPA is supported for only one channel
 (on H3/M3/M3N board, it is channel THS3). Reason:
  Currently, IPA controls base on only CPU temperature.
  And only one thermal channel is assembled closest
  CPU cores is selected as target of IPA.
  If other channels are used, IPA controlling is not properly.

The device supports 5 cooling states which can be categorised as follows:

0 & 1) boost (clocking up)
2)     default
3 & 4) cooling (clocking down)

Currently the thermal framework assumes that the default is the minimum,
or in other words there is no provision for handling boost states.
So this patch only describes the upper 3 states, default and cooling.

A single cooling device is described for all A57 CPUs as this
reflects that physically there is only one cooling device present.

This patch improves on an earlier version by:

* Omitting cooling-max-level and cooling-min-level properties which
  are no longer present in mainline as of v4.17
* Removing an unused trip-point0 node sub-property from the trips
  property.
* Using cooling-device indexes such that maximum refers to maximum cooling
  rather than the inverse.

The long signed-off by chain below reflects many revisions, mainly
internal, that this patch has been through.

Signed-off-by: Keita Kobayashi <keita.kobayashi.ym@renesas.com>
Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
Signed-off-by: Hien Dang <hien.dang.eb@rvc.renesas.com>
Signed-off-by: An Huynh <an.huynh.uj@rvc.renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Signed-off-by: Simon Horman <simon.horman@netronome.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 54 ++++++++++----------------------
 1 file changed, 17 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index abeac3059383..41111dcf80ae 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -155,6 +155,7 @@
 			power-domains = <&sysc R8A7795_PD_CA57_CPU0>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			dynamic-power-coefficient = <854>;
 			clocks = <&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			capacity-dmips-mhz = <1024>;
@@ -207,6 +208,8 @@
 			power-domains = <&sysc R8A7795_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
+			dynamic-power-coefficient = <277>;
 			clocks = <&cpg CPG_CORE R8A7795_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 			capacity-dmips-mhz = <535>;
@@ -3098,58 +3101,30 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 0>;
+			sustainable-power = <6313>;
 
 			trips {
-				sensor1_passive: sensor1-passive {
-					temperature = <95000>;
-					hysteresis = <1000>;
-					type = "passive";
-				};
 				sensor1_crit: sensor1-crit {
 					temperature = <120000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
-
-			cooling-maps {
-				map0 {
-					trip = <&sensor1_passive>;
-					cooling-device = <&a57_0 4 4>,
-							 <&a57_1 4 4>,
-							 <&a57_2 4 4>,
-							 <&a57_3 4 4>;
-				};
-			};
 		};
 
 		sensor_thermal2: sensor-thermal2 {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 1>;
+			sustainable-power = <6313>;
 
 			trips {
-				sensor2_passive: sensor2-passive {
-					temperature = <95000>;
-					hysteresis = <1000>;
-					type = "passive";
-				};
 				sensor2_crit: sensor2-crit {
 					temperature = <120000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
-
-			cooling-maps {
-				map0 {
-					trip = <&sensor2_passive>;
-					cooling-device = <&a57_0 4 4>,
-							 <&a57_1 4 4>,
-							 <&a57_2 4 4>,
-							 <&a57_3 4 4>;
-				};
-			};
 		};
 
 		sensor_thermal3: sensor-thermal3 {
@@ -3158,11 +3133,12 @@
 			thermal-sensors = <&tsc 2>;
 
 			trips {
-				sensor3_passive: sensor3-passive {
-					temperature = <95000>;
+				target: trip-point1 {
+					temperature = <100000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
+
 				sensor3_crit: sensor3-crit {
 					temperature = <120000>;
 					hysteresis = <1000>;
@@ -3172,11 +3148,15 @@
 
 			cooling-maps {
 				map0 {
-					trip = <&sensor3_passive>;
-					cooling-device = <&a57_0 4 4>,
-							 <&a57_1 4 4>,
-							 <&a57_2 4 4>,
-							 <&a57_3 4 4>;
+					trip = <&target>;
+					cooling-device = <&a57_0 2 4>;
+					contribution = <1024>;
+				};
+
+				map1 {
+					trip = <&target>;
+					cooling-device = <&a53_0 0 2>;
+					contribution = <1024>;
 				};
 			};
 		};
-- 
2.11.0

