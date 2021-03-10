Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53353333B1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 12:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhCJLKT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 06:10:19 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:17482 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232670AbhCJLJ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 06:09:59 -0500
X-Halon-ID: 238fa7c9-8191-11eb-b73f-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 238fa7c9-8191-11eb-b73f-0050569116f7;
        Wed, 10 Mar 2021 12:09:57 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3] arm64: dts: renesas: r8a779a0: Add thermal support
Date:   Wed, 10 Mar 2021 12:09:51 +0100
Message-Id: <20210310110951.3299524-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for thermal.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Add fifth TSC node.

* Changes since v2
- Increase register size to 0x200 to cover the larger V3U layout.
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 85 +++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index dfd6ae8b564fb1ba..31a2501125d6f0de 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -260,6 +260,19 @@ sysc: system-controller@e6180000 {
 			#power-domain-cells = <1>;
 		};
 
+		tsc: thermal@e6190000 {
+			compatible = "renesas,r8a779a0-thermal";
+			reg = <0 0xe6190000 0 0x200>,
+			      <0 0xe6198000 0 0x200>,
+			      <0 0xe61a0000 0 0x200>,
+			      <0 0xe61a8000 0 0x200>,
+			      <0 0xe61b0000 0 0x200>;
+			clocks = <&cpg CPG_MOD 919>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 919>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		i2c0: i2c@e6500000 {
 			compatible = "renesas,i2c-r8a779a0",
 				     "renesas,rcar-gen3-i2c";
@@ -960,6 +973,78 @@ prr: chipid@fff00044 {
 		};
 	};
 
+	thermal-zones {
+		sensor_thermal1: sensor-thermal1 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsc 0>;
+
+			trips {
+				sensor1_crit: sensor1-crit {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		sensor_thermal2: sensor-thermal2 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsc 1>;
+
+			trips {
+				sensor2_crit: sensor2-crit {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		sensor_thermal3: sensor-thermal3 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsc 2>;
+
+			trips {
+				sensor3_crit: sensor3-crit {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		sensor_thermal4: sensor-thermal4 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsc 3>;
+
+			trips {
+				sensor4_crit: sensor4-crit {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		sensor_thermal5: sensor-thermal5 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsc 4>;
+
+			trips {
+				sensor5_crit: sensor5-crit {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-- 
2.30.1

