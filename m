Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8035270B9E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 May 2023 12:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232800AbjEVKTl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 May 2023 06:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232748AbjEVKTe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2023 06:19:34 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DEF3C100;
        Mon, 22 May 2023 03:19:32 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,184,1681138800"; 
   d="scan'208";a="163778384"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 May 2023 19:19:32 +0900
Received: from localhost.localdomain (unknown [10.226.93.9])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1DB894000AAA;
        Mon, 22 May 2023 19:19:28 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 09/11] regulator: dt-bindings: Add Renesas RAA215300 PMIC bindings
Date:   Mon, 22 May 2023 11:18:47 +0100
Message-Id: <20230522101849.297499-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
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

Document Renesas RAA215300 PMIC bindings.

The RAA215300 is a high Performance 9-Channel PMIC supporting DDR
Memory, with Built-In Charger and RTC.

It supports DDR3, DDR3L, DDR4, and LPDDR4 memory power requirements.
The internally compensated regulators, built-in Real-Time Clock (RTC),
32kHz crystal oscillator, and coin cell battery charger provide a
highly integrated, small footprint power solution ideal for
System-On-Module (SOM) applications. A spread spectrum feature
provides an ease-of-use solution for noise-sensitive audio or RF
applications.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v4->v5:
 * Added description for clocks.
 * Replaced Oneof->enum in clock-names as it is simpler.
 * Added Rb tag from Conor.
v3->v4:
 * Moved bindings from mfd->regulator.
 * Dropped minItems from reg.
 * Dropped renesas,rtc-enabled property and instead used clock-names property
   to find RTC is enabled or not.
 * Added reg-names in required property.
 * Updated the example.
v2->v3:
 * Added more detailed description for renesas,rtc-enabled property.
RFC->v2:
 * Updated reg property
 * Added optional reg-names, interrupts and renesas,rtc-enabled
   properties.
 * Fixed the node name in the example
 * Dropped the cross link property renesas,raa215300-rtc.
 * Updated the example
---
 .../bindings/regulator/renesas,raa215300.yaml | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/renesas,raa215300.yaml

diff --git a/Documentation/devicetree/bindings/regulator/renesas,raa215300.yaml b/Documentation/devicetree/bindings/regulator/renesas,raa215300.yaml
new file mode 100644
index 000000000000..a57676e3d5da
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/renesas,raa215300.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/renesas,raa215300.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RAA215300 Power Management Integrated Circuit (PMIC)
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description: |
+  The RAA215300 is a high-performance, low-cost 9-channel PMIC designed for
+  32-bit and 64-bit MCU and MPU applications. It supports DDR3, DDR3L, DDR4,
+  and LPDDR4 memory power requirements. The internally compensated regulators,
+  built-in Real-Time Clock (RTC), 32kHz crystal oscillator, and coin cell
+  battery charger provide a highly integrated, small footprint power solution
+  ideal for System-On-Module (SOM) applications. A spread spectrum feature
+  provides an ease-of-use solution for noise-sensitive audio or RF applications.
+
+  This device exposes two devices via I2C. One for the integrated RTC IP, and
+  one for everything else.
+
+  Link to datasheet:
+  https://www.renesas.com/in/en/products/power-power-management/multi-channel-power-management-ics-pmics/ssdsoc-power-management-ics-pmic-and-pmus/raa215300-high-performance-9-channel-pmic-supporting-ddr-memory-built-charger-and-rtc
+
+properties:
+  compatible:
+    enum:
+      - renesas,raa215300
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: main
+      - const: rtc
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: |
+      The clocks are optional. The RTC is disabled, if no clocks are
+      provided(either xin or clkin).
+    maxItems: 1
+
+  clock-names:
+    description: |
+      Use xin, if connected to an external crystal.
+      Use clkin, if connected to an external clock signal.
+    enum:
+      - xin
+      - clkin
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    /* 32.768kHz crystal */
+    x2: clock-xtal {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <32768>;
+    };
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        raa215300: pmic@12 {
+            compatible = "renesas,raa215300";
+            reg = <0x12>, <0x6f>;
+            reg-names = "main", "rtc";
+
+            clocks = <&x2>;
+            clock-names = "xin";
+        };
+    };
-- 
2.25.1

