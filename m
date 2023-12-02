Return-Path: <linux-renesas-soc+bounces-555-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF84801E55
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Dec 2023 20:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 507271F21009
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Dec 2023 19:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C5920DD9;
	Sat,  2 Dec 2023 19:26:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id DCFC5124;
	Sat,  2 Dec 2023 11:26:47 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,246,1695654000"; 
   d="scan'208";a="185089934"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Dec 2023 04:26:47 +0900
Received: from localhost.localdomain (unknown [10.226.92.28])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6B1C340765FE;
	Sun,  3 Dec 2023 04:26:42 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 11/11] dt-bindings: mfd: dlg,da9063: Convert da9062 to json-schema
Date: Sat,  2 Dec 2023 19:25:35 +0000
Message-Id: <20231202192536.266885-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the da9062 PMIC device tree binding documentation to json-schema.

Update the example to match reality.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../devicetree/bindings/mfd/da9062.txt        | 124 ------------
 .../devicetree/bindings/mfd/dlg,da9063.yaml   | 184 +++++++++++++++++-
 2 files changed, 178 insertions(+), 130 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/da9062.txt

diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documentation/devicetree/bindings/mfd/da9062.txt
deleted file mode 100644
index 7dd641deea1d..000000000000
--- a/Documentation/devicetree/bindings/mfd/da9062.txt
+++ /dev/null
@@ -1,124 +0,0 @@
-* Dialog DA9062 Power Management Integrated Circuit (PMIC)
-
-Product information for the DA9062 and DA9061 devices can be found here:
-- https://www.dialog-semiconductor.com/products/da9062
-- https://www.dialog-semiconductor.com/products/da9061
-
-The DA9062 PMIC consists of:
-
-Device                   Supply Names    Description
-------                   ------------    -----------
-da9062-regulator        :               : LDOs & BUCKs
-da9062-rtc              :               : Real-Time Clock
-da9062-onkey            :               : On Key
-da9062-watchdog         :               : Watchdog Timer
-da9062-thermal          :               : Thermal
-da9062-gpio             :               : GPIOs
-
-The DA9061 PMIC consists of:
-
-Device                   Supply Names    Description
-------                   ------------    -----------
-da9062-regulator        :               : LDOs & BUCKs
-da9062-onkey            :               : On Key
-da9062-watchdog         :               : Watchdog Timer
-da9062-thermal          :               : Thermal
-
-======
-
-Required properties:
-
-- compatible : Should be
-    "dlg,da9062" for DA9062
-    "dlg,da9061" for DA9061
-- reg : Specifies the I2C slave address (this defaults to 0x58 but it can be
-  modified to match the chip's OTP settings).
-
-Optional properties:
-
-- gpio-controller : Marks the device as a gpio controller.
-- #gpio-cells     : Should be two. The first cell is the pin number and the
-                    second cell is used to specify the gpio polarity.
-
-See Documentation/devicetree/bindings/gpio/gpio.txt for further information on
-GPIO bindings.
-
-- interrupts : IRQ line information.
-- interrupt-controller
-
-See Documentation/devicetree/bindings/interrupt-controller/interrupts.txt for
-further information on IRQ bindings.
-
-Sub-nodes:
-
-- regulators : This node defines the settings for the LDOs and BUCKs.
-  The DA9062 regulators are bound using their names listed below:
-
-    buck1    : BUCK_1
-    buck2    : BUCK_2
-    buck3    : BUCK_3
-    buck4    : BUCK_4
-    ldo1     : LDO_1
-    ldo2     : LDO_2
-    ldo3     : LDO_3
-    ldo4     : LDO_4
-
-  The DA9061 regulators are bound using their names listed below:
-
-    buck1    : BUCK_1
-    buck2    : BUCK_2
-    buck3    : BUCK_3
-    ldo1     : LDO_1
-    ldo2     : LDO_2
-    ldo3     : LDO_3
-    ldo4     : LDO_4
-
-  The component follows the standard regulator framework and the bindings
-  details of individual regulator device can be found in:
-  Documentation/devicetree/bindings/regulator/regulator.txt
-
-  regulator-initial-mode may be specified for buck regulators using mode values
-  from include/dt-bindings/regulator/dlg,da9063-regulator.h.
-
-- rtc : This node defines settings required for the Real-Time Clock associated
-  with the DA9062. There are currently no entries in this binding, however
-  compatible = "dlg,da9062-rtc" should be added if a node is created.
-
-- onkey : See ../input/dlg,da9062-onkey.yaml
-
-- watchdog: See ../watchdog/da9062-watchdog.yaml
-
-- thermal : See ../thermal/dlg,da9062-thermal.yaml
-
-Example:
-
-	pmic0: da9062@58 {
-		compatible = "dlg,da9062";
-		reg = <0x58>;
-		interrupt-parent = <&gpio6>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-controller;
-
-		rtc {
-			compatible = "dlg,da9062-rtc";
-		};
-
-		regulators {
-			DA9062_BUCK1: buck1 {
-				regulator-name = "BUCK1";
-				regulator-min-microvolt = <300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp = <500000>;
-				regulator-max-microamp = <2000000>;
-				regulator-initial-mode = <DA9063_BUCK_MODE_SYNC>;
-				regulator-boot-on;
-			};
-			DA9062_LDO1: ldo1 {
-				regulator-name = "LDO_1";
-				regulator-min-microvolt = <900000>;
-				regulator-max-microvolt = <3600000>;
-				regulator-boot-on;
-			};
-		};
-	};
-
diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
index ecdef322723d..9f11e3ec8cde 100644
--- a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
+++ b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
+title: Dialog DA906{3L,3,2,1} Power Management Integrated Circuit (PMIC)
 
 maintainers:
   - Steve Twiss <stwiss.opensource@diasemi.com>
@@ -17,13 +17,17 @@ description: |
   moment where all voltage monitors are disabled. Next, as da9063 only supports
   UV *and* OV monitoring, both must be set to the same severity and value
   (0: disable, 1: enable).
-  Product information for the DA906{3L,3} devices can be found here:
+  Product information for the DA906{3L,3,2,1} devices can be found here:
   - https://www.dialog-semiconductor.com/products/da9063l
   - https://www.dialog-semiconductor.com/products/da9063
+  - https://www.dialog-semiconductor.com/products/da9062
+  - https://www.dialog-semiconductor.com/products/da9061
 
 properties:
   compatible:
     enum:
+      - dlg,da9061
+      - dlg,da9062
       - dlg,da9063
       - dlg,da9063l
 
@@ -38,6 +42,19 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  gpio:
+    type: object
+    $ref: /schemas/gpio/gpio.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: dlg,da9062-gpio
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
   onkey:
     $ref: /schemas/input/dlg,da9062-onkey.yaml
 
@@ -45,7 +62,7 @@ properties:
     type: object
     additionalProperties: false
     patternProperties:
-      "^(ldo([1-9]|1[01])|bcore([1-2]|s-merged)|b(pro|mem|io|peri)|bmem-bio-merged)$":
+      "^(ldo([1-9]|1[01])|bcore([1-2]|s-merged)|b(pro|mem|io|peri)|bmem-bio-merged|buck[1-4])$":
         $ref: /schemas/regulator/regulator.yaml
         unevaluatedProperties: false
 
@@ -55,7 +72,12 @@ properties:
     unevaluatedProperties: false
     properties:
       compatible:
-        const: dlg,da9063-rtc
+        enum:
+          - dlg,da9063-rtc
+          - dlg,da9062-rtc
+
+  thermal:
+    $ref: /schemas/thermal/dlg,da9062-thermal.yaml
 
   watchdog:
     $ref: /schemas/watchdog/dlg,da9062-watchdog.yaml
@@ -63,8 +85,65 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
-  - interrupt-controller
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - dlg,da9063
+              - dlg,da9063l
+    then:
+      properties:
+        thermal: false
+        gpio: false
+        gpio-controller: false
+        "#gpio-cells": false
+        regulators:
+          patternProperties:
+            "^buck[1-4]$": false
+      required:
+        - interrupts
+        - interrupt-controller
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - dlg,da9062
+    then:
+      properties:
+        regulators:
+          patternProperties:
+            "^(ldo([5-9]|10|11)|bcore([1-2]|s-merged)|b(pro|mem|io|peri)|bmem-bio-merged)$": false
+      required:
+        - gpio
+        - onkey
+        - rtc
+        - thermal
+        - watchdog
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - dlg,da9061
+    then:
+      properties:
+        gpio: false
+        gpio-controller: false
+        "#gpio-cells": false
+        regulators:
+          patternProperties:
+            "^(ldo([5-9]|10|11)|bcore([1-2]|s-merged)|b(pro|mem|io|peri)|bmem-bio-merged|buck4)$": false
+        rtc: false
+      required:
+        - onkey
+        - thermal
+        - watchdog
 
 additionalProperties: false
 
@@ -121,4 +200,97 @@ examples:
         };
       };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/dlg,da9063-regulator.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      pmic@58 {
+        compatible = "dlg,da9062";
+        reg = <0x58>;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&gpio1>;
+        interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-controller;
+
+        rtc {
+          compatible = "dlg,da9062-rtc";
+        };
+
+        onkey {
+          compatible = "dlg,da9062-onkey";
+        };
+
+        watchdog {
+          compatible = "dlg,da9062-watchdog";
+          dlg,use-sw-pm;
+        };
+
+        thermal {
+          compatible = "dlg,da9062-thermal";
+          status = "disabled";
+        };
+
+        gpio {
+          compatible = "dlg,da9062-gpio";
+          status = "disabled";
+        };
+
+        regulators {
+          buck1 {
+            regulator-name = "vdd_arm";
+            regulator-min-microvolt = <925000>;
+            regulator-max-microvolt = <1380000>;
+            regulator-initial-mode = <DA9063_BUCK_MODE_SYNC>;
+            regulator-always-on;
+          };
+          buck2 {
+            regulator-name = "vdd_soc";
+            regulator-min-microvolt = <1150000>;
+            regulator-max-microvolt = <1380000>;
+            regulator-initial-mode = <DA9063_BUCK_MODE_SYNC>;
+            regulator-always-on;
+          };
+          buck3 {
+            regulator-name = "vdd_ddr3";
+            regulator-min-microvolt = <1500000>;
+            regulator-max-microvolt = <1500000>;
+            regulator-initial-mode = <DA9063_BUCK_MODE_SYNC>;
+            regulator-always-on;
+          };
+          buck4 {
+            regulator-name = "vdd_eth";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <1200000>;
+            regulator-initial-mode = <DA9063_BUCK_MODE_SYNC>;
+            regulator-always-on;
+          };
+          ldo1 {
+            regulator-name = "vdd_snvs";
+            regulator-min-microvolt = <3000000>;
+            regulator-max-microvolt = <3000000>;
+            regulator-always-on;
+          };
+          ldo2 {
+            regulator-name = "vdd_high";
+            regulator-min-microvolt = <3000000>;
+            regulator-max-microvolt = <3000000>;
+            regulator-always-on;
+          };
+          ldo3 {
+            regulator-name = "vdd_eth_io";
+            regulator-min-microvolt = <2500000>;
+            regulator-max-microvolt = <2500000>;
+          };
+          ldo4 {
+            regulator-name = "vdd_emmc";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-always-on;
+          };
+        };
+      };
+    };
 ...
-- 
2.39.2


