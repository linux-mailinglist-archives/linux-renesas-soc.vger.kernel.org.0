Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E40C16F878A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 May 2023 19:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbjEERZn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 May 2023 13:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbjEERZm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 May 2023 13:25:42 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D938616088;
        Fri,  5 May 2023 10:25:40 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,252,1677510000"; 
   d="scan'208";a="158275142"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 May 2023 02:25:40 +0900
Received: from localhost.localdomain (unknown [10.226.92.145])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 478D24072B3D;
        Sat,  6 May 2023 02:25:37 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v2 1/5] dt-bindings: mfd: Add Renesas RAA215300 PMIC bindings
Date:   Fri,  5 May 2023 18:25:26 +0100
Message-Id: <20230505172530.357455-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
References: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
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
---
RFC->v2:
 * Updated reg property
 * Added optional reg-names, interrupts and renesas,rtc-enabled
   properties.
 * Fixed the node name in the example
 * Dropped the cross link property renesas,raa215300-rtc.
 * Updated the example
---
 .../bindings/mfd/renesas,raa215300.yaml       | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml

diff --git a/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
new file mode 100644
index 000000000000..85cb4f0b5711
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/renesas,raa215300.yaml#
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
+    minItems: 1
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
+  renesas,rtc-enabled:
+    description:
+      To indicate RTC is enabled on the PMIC.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        raa215300: pmic@12 {
+            compatible = "renesas,raa215300";
+            reg = <0x12>, <0x6f>;
+            reg-names = "main", "rtc";
+
+            renesas,rtc-enabled;
+        };
+    };
-- 
2.25.1

