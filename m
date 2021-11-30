Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 224AF463AC4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 16:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240633AbhK3QB1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 11:01:27 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:48449 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S243182AbhK3QB0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 11:01:26 -0500
X-IronPort-AV: E=Sophos;i="5.87,276,1631545200"; 
   d="scan'208";a="101916634"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 Dec 2021 00:58:06 +0900
Received: from localhost.localdomain (unknown [10.226.93.28])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1B238400C43C;
        Wed,  1 Dec 2021 00:58:03 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: thermal: Document Renesas RZ/G2L TSU
Date:   Tue, 30 Nov 2021 15:57:56 +0000
Message-Id: <20211130155757.17837-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211130155757.17837-1-biju.das.jz@bp.renesas.com>
References: <20211130155757.17837-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the Thermal Sensor Unit(TSU) in the RZ/G2L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2->v3:
 * Add Rb tag from Rob.
v1->v2:
 * No change
---
 .../bindings/thermal/rzg2l-thermal.yaml       | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml b/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
new file mode 100644
index 000000000000..ccab9511a042
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/rzg2l-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G2L Thermal Sensor Unit
+
+description:
+  On RZ/G2L SoCs, the thermal sensor unit (TSU) measures the
+  temperature(Tj) inside the LSI.
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a07g044-tsu # RZ/G2{L,LC}
+      - const: renesas,rzg2l-tsu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - resets
+  - "#thermal-sensor-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+
+    tsu: thermal@10059400 {
+            compatible = "renesas,r9a07g044-tsu",
+                         "renesas,rzg2l-tsu";
+            reg = <0x10059400 0x400>;
+            clocks = <&cpg CPG_MOD R9A07G044_TSU_PCLK>;
+            resets = <&cpg R9A07G044_TSU_PRESETN>;
+            power-domains = <&cpg>;
+            #thermal-sensor-cells = <1>;
+    };
+
+    thermal-zones {
+            cpu-thermal {
+                    polling-delay-passive = <250>;
+                    polling-delay = <1000>;
+                    thermal-sensors = <&tsu 0>;
+
+                    trips {
+                            sensor_crit: sensor-crit {
+                                    temperature = <125000>;
+                                    hysteresis = <1000>;
+                                    type = "critical";
+                            };
+                    };
+            };
+    };
-- 
2.17.1

