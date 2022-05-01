Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1239551642B
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 May 2022 13:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346336AbiEALdR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 May 2022 07:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346328AbiEALdQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 May 2022 07:33:16 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 902096D38C;
        Sun,  1 May 2022 04:29:50 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,189,1647270000"; 
   d="scan'208";a="119719501"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 May 2022 20:29:50 +0900
Received: from localhost.localdomain (unknown [10.226.92.14])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3EA644229240;
        Sun,  1 May 2022 20:29:46 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/6] arm64: dts: renesas: r9a07g043: Create thermal zone to support IPA
Date:   Sun,  1 May 2022 12:29:25 +0100
Message-Id: <20220501112926.47024-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220501112926.47024-1-biju.das.jz@bp.renesas.com>
References: <20220501112926.47024-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Setup a thermal zone driven by SoC temperature sensor.
Create passive trip points and bind them to CPUFreq cooling
device that supports power extension.

Based on the work done by Dien Pham <dien.pham.ry@renesas.com>
and others for r8a77990 SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index c0a57055af49..55081071293f 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -77,6 +77,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0>;
 			device_type = "cpu";
+			#cooling-cells = <2>;
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A07G043_CLK_I>;
@@ -849,6 +850,15 @@ cpu-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 			thermal-sensors = <&tsu 0>;
+			sustainable-power = <717>;
+
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device = <&cpu0 0 2>;
+					contribution = <1024>;
+				};
+			};
 
 			trips {
 				sensor_crit: sensor-crit {
@@ -856,6 +866,12 @@ sensor_crit: sensor-crit {
 					hysteresis = <1000>;
 					type = "critical";
 				};
+
+				target: trip-point {
+					temperature = <100000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
 			};
 		};
 	};
-- 
2.25.1

