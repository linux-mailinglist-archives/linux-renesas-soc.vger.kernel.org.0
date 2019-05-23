Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8197727F82
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2019 16:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730756AbfEWO0C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 May 2019 10:26:02 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36994 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730719AbfEWO0C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 May 2019 10:26:02 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2542425BE06;
        Fri, 24 May 2019 00:25:53 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 15FAB940A91; Thu, 23 May 2019 16:25:49 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Dien Pham <dien.pham.ry@renesas.com>,
        An Huynh <an.huynh.uj@rvc.renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v4 5/8] arm64: dts: renesas: r8a77965: Create thermal zone to support IPA
Date:   Thu, 23 May 2019 16:25:41 +0200
Message-Id: <20190523142544.1273-6-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190523142544.1273-1-horms+renesas@verge.net.au>
References: <20190523142544.1273-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Dien Pham <dien.pham.ry@renesas.com>

Setup a thermal zone driven by SoC temperature sensor.
Create passive trip points and bind them to CPUFreq cooling
device that supports power extension.

In R-Car Gen3, IPA is supported for only one channel
(on H3/M3/M3N SoCs, it is channel THS3). Reason:
  Currently, IPA controls base on only CPU temperature.
  And only one thermal channel is assembled closest
  CPU cores is selected as target of IPA.
  If other channels are used, IPA controlling is not properly.

The A57 cooling device supports 5 cooling states which can be categorised
as follows:

0 & 1) boost (clocking up)
2)     default
3 & 4) cooling (clocking down)

Currently the thermal framework assumes that the default is the minimum,
or in other words there is no provision for handling boost states.
So this patch only describes the upper 3 states, default and cooling.

A single cooling device is described for all A57 CPUs and a separate
cooling device is described for all A53 CPUs. This reflects that physically
there is only one cooling device present for each type of CPU.

This patch improves on an earlier version by:

* Omitting cooling-max-level and cooling-min-level properties which
  are no longer present in mainline as of v4.17
* Removing an unused trip-point0 node sub-property from the trips
  property.
* Using cooling-device indexes such that maximum refers to maximum cooling
  rather than the inverse.
* Defers adding dynamic-power-coefficient properties to a separate patch as
  these are properties of the CPU.

The long signed-off by chain below reflects many revisions, mainly
internal, that this patch has been through.

Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
Signed-off-by: An Huynh <an.huynh.uj@rvc.renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v4
* Updates described in changelog above including revision of changelog

v2, v3
* Omitted
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 41dfeadb89a6..f0fe4350a970 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -111,6 +111,7 @@
 			power-domains = <&sysc R8A77965_PD_CA57_CPU0>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 			clocks = <&cpg CPG_CORE R8A77965_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
@@ -2530,6 +2531,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 0>;
+			sustainable-power = <2439>;
 
 			trips {
 				sensor1_crit: sensor1-crit {
@@ -2544,6 +2546,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 1>;
+			sustainable-power = <2439>;
 
 			trips {
 				sensor2_crit: sensor2-crit {
@@ -2558,14 +2561,30 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsc 2>;
+			sustainable-power = <2439>;
 
 			trips {
+				target: trip-point1 {
+					/* miliCelsius  */
+					temperature = <100000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
 				sensor3_crit: sensor3-crit {
 					temperature = <120000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device = <&a57_0 2 4>;
+					contribution = <1024>;
+				};
+			};
 		};
 	};
 
-- 
2.11.0

