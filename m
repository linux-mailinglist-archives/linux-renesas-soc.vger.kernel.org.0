Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96EF627F83
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2019 16:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730846AbfEWO0D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 May 2019 10:26:03 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36994 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730719AbfEWO0D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 May 2019 10:26:03 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3844E25BE27;
        Fri, 24 May 2019 00:25:53 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 414AF940C9A; Thu, 23 May 2019 16:25:49 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Dien Pham <dien.pham.ry@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v4 7/8] arm64: dts: renesas: r8a77990: Create thermal zone to support IPA
Date:   Thu, 23 May 2019 16:25:43 +0200
Message-Id: <20190523142544.1273-8-horms+renesas@verge.net.au>
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
Reason:
  Currently, IPA controls base on only CPU temperature.
  And only one thermal channel is assembled closest
  CPU cores is selected as target of IPA.
  If other channels are used, IPA controlling is not properly.

A single cooling device is described for all A53 CPUs as this
reflects that physically there is only one cooling device present.

This patch improves on an earlier version by:

* Omitting cooling-max-level and cooling-min-level properties which
  are no longer present in mainline as of v4.17
* Removing an unused trip-point0 node sub-property from the trips
  property.
* Defers adding dynamic-power-coefficient properties to a separate patch as
  these are properties of the CPU.

The long signed-off by chain below reflects many revisions, mainly
internal, that this patch has been through.

Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v4
* Updates described in changelog above including revision of changelog

v2, v3
* Omitted
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 56cb566ffa09..93603f6ca0fb 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -84,6 +84,7 @@
 			compatible = "arm,cortex-a53";
 			reg = <0>;
 			device_type = "cpu";
+			#cooling-cells = <2>;
 			power-domains = <&sysc R8A77990_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
@@ -1856,11 +1857,18 @@
 	thermal-zones {
 		cpu-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-			thermal-sensors = <&thermal>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 0>;
+			sustainable-power = <717>;
 
 			trips {
-				cpu-crit {
+				target: trip-point1 {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				sensor1_crit: sensor1-crit {
 					temperature = <120000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -1868,6 +1876,11 @@
 			};
 
 			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device = <&a53_0 0 2>;
+					contribution = <1024>;
+				};
 			};
 		};
 	};
-- 
2.11.0

