Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52BB01A4F20
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2020 11:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgDKJ1d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Apr 2020 05:27:33 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:25654 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725927AbgDKJ1d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Apr 2020 05:27:33 -0400
X-Halon-ID: 97ac6961-7bd6-11ea-89d0-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 97ac6961-7bd6-11ea-89d0-0050569116f7;
        Sat, 11 Apr 2020 11:27:02 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] dt-bindings: thermal: rcar-gen3-thermal: Convert bindings to json-schema
Date:   Sat, 11 Apr 2020 11:27:19 +0200
Message-Id: <20200411092719.1170489-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert Renesas R-Car Gen3 Thermal bindings documentation to
json-schema.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Improved on reg and interrupt descriptions with the use of 'items:'
- Improved the examples inside the yaml file
- Added compatibility value renesas,r8a77961-thermal for R-Car M3-W+
  which was merged in the text binding description.
---
 .../bindings/thermal/rcar-gen3-thermal.txt    | 60 -----------
 .../bindings/thermal/rcar-gen3-thermal.yaml   | 99 +++++++++++++++++++
 2 files changed, 99 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
deleted file mode 100644
index 2993fa720195308f..0000000000000000
--- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-* DT bindings for Renesas R-Car Gen3 Thermal Sensor driver
-
-On R-Car Gen3 SoCs, the thermal sensor controllers (TSC) control the thermal
-sensors (THS) which are the analog circuits for measuring temperature (Tj)
-inside the LSI.
-
-Required properties:
-- compatible		: "renesas,<soctype>-thermal",
-			  Examples with soctypes are:
-			    - "renesas,r8a774a1-thermal" (RZ/G2M)
-			    - "renesas,r8a774b1-thermal" (RZ/G2N)
-			    - "renesas,r8a7795-thermal" (R-Car H3)
-			    - "renesas,r8a7796-thermal" (R-Car M3-W)
-			    - "renesas,r8a77961-thermal" (R-Car M3-W+)
-			    - "renesas,r8a77965-thermal" (R-Car M3-N)
-			    - "renesas,r8a77980-thermal" (R-Car V3H)
-- reg			: Address ranges of the thermal registers. Each sensor
-			  needs one address range. Sorting must be done in
-			  increasing order according to datasheet, i.e.
-			  TSC1, TSC2, ...
-- clocks		: Must contain a reference to the functional clock.
-- #thermal-sensor-cells : must be <1>.
-
-Optional properties:
-
-- interrupts		: interrupts routed to the TSC (must be 3).
-- power-domain		: Must contain a reference to the power domain. This
-			  property is mandatory if the thermal sensor instance
-			  is part of a controllable power domain.
-
-Example:
-
-	tsc: thermal@e6198000 {
-		compatible = "renesas,r8a7795-thermal";
-		reg = <0 0xe6198000 0 0x100>,
-		      <0 0xe61a0000 0 0x100>,
-		      <0 0xe61a8000 0 0x100>;
-		interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cpg CPG_MOD 522>;
-		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-		#thermal-sensor-cells = <1>;
-	};
-
-	thermal-zones {
-		sensor_thermal1: sensor-thermal1 {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-			thermal-sensors = <&tsc 0>;
-
-			trips {
-				sensor1_crit: sensor1-crit {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "critical";
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
new file mode 100644
index 0000000000000000..1fba1b6b89d5f1ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2020 Renesas Electronics Corp.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/rcar-gen3-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Gen3 Thermal Sensor
+
+description:
+  On R-Car Gen3 SoCs, the thermal sensor controllers (TSC) control the thermal
+  sensors (THS) which are the analog circuits for measuring temperature (Tj)
+  inside the LSI.
+
+maintainers:
+  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
+
+properties:
+  compatible:
+    enum:
+      - renesas,r8a774a1-thermal # RZ/G2M
+      - renesas,r8a774b1-thermal # RZ/G2N
+      - renesas,r8a7795-thermal  # R-Car H3
+      - renesas,r8a7796-thermal  # R-Car M3-W
+      - renesas,r8a77961-thermal # R-Car M3-W+
+      - renesas,r8a77965-thermal # R-Car M3-N
+      - renesas,r8a77980-thermal # R-Car V3H
+  reg:
+    minItems: 2
+    maxItems: 3
+    items:
+      - description: TSC1 registers
+      - description: TSC2 registers
+      - description: TSC3 registers
+
+  interrupts:
+    items:
+      - description: TEMP1 interrupt
+      - description: TEMP2 interrupt
+      - description: TEMP3 interrupt
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
+  - interrupts
+  - clocks
+  - power-domains
+  - resets
+  - "#thermal-sensor-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7795-sysc.h>
+
+    tsc: thermal@e6198000 {
+            compatible = "renesas,r8a7795-thermal";
+            reg = <0 0xe6198000 0 0x100>,
+                  <0 0xe61a0000 0 0x100>,
+                  <0 0xe61a8000 0 0x100>;
+            interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD 522>;
+            power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+            resets = <&cpg 522>;
+            #thermal-sensor-cells = <1>;
+    };
+
+    thermal-zones {
+            sensor_thermal: sensor-thermal {
+                    polling-delay-passive = <250>;
+                    polling-delay = <1000>;
+                    thermal-sensors = <&tsc 0>;
+
+                    trips {
+                            sensor1_crit: sensor1-crit {
+                                    temperature = <90000>;
+                                    hysteresis = <2000>;
+                                    type = "critical";
+                            };
+                    };
+            };
+    };
-- 
2.26.0

