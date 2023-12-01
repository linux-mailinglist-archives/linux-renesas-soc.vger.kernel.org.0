Return-Path: <linux-renesas-soc+bounces-500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19036800960
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 12:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38B1F1C2092E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 11:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1879210F3;
	Fri,  1 Dec 2023 11:09:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 05CFF10DE;
	Fri,  1 Dec 2023 03:09:01 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,241,1695654000"; 
   d="scan'208";a="188861580"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Dec 2023 20:09:01 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 531DB40108F2;
	Fri,  1 Dec 2023 20:08:58 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/6] dt-bindings: mfd: Convert da9062 to json-schema
Date: Fri,  1 Dec 2023 11:08:38 +0000
Message-Id: <20231201110840.37408-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
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
 .../devicetree/bindings/mfd/da9062.txt        | 124 ----------
 .../devicetree/bindings/mfd/dlg,da9062.yaml   | 220 ++++++++++++++++++
 2 files changed, 220 insertions(+), 124 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/da9062.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/dlg,da9062.yaml

diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documentation/devicetree/bindings/mfd/da9062.txt
deleted file mode 100644
index e4eedd3bd233..000000000000
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
-- onkey : See ../input/da9062-onkey.txt
-
-- watchdog: See ../watchdog/da9062-wdt.txt
-
-- thermal : See ../thermal/da9062-thermal.txt
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
diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9062.yaml b/Documentation/devicetree/bindings/mfd/dlg,da9062.yaml
new file mode 100644
index 000000000000..43ddf14a4a6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/dlg,da9062.yaml
@@ -0,0 +1,220 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/dlg,da9062.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dialog DA9062 Power Management Integrated Circuit (PMIC)
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description: |
+  Product information for the DA9062 and DA9061 devices can be found here:
+  - https://www.dialog-semiconductor.com/products/da9062
+  - https://www.dialog-semiconductor.com/products/da9061
+
+  The DA9062 PMIC consists of:
+
+  Device                   Supply Names    Description
+  ------                   ------------    -----------
+  da9062-regulator        :               : LDOs & BUCKs
+  da9062-rtc              :               : Real-Time Clock
+  da9062-onkey            :               : On Key
+  da9062-watchdog         :               : Watchdog Timer
+  da9062-thermal          :               : Thermal
+  da9062-gpio             :               : GPIOs
+
+  The DA9061 PMIC consists of:
+
+  Device                   Supply Names    Description
+  ------                   ------------    -----------
+  da9062-regulator        :               : LDOs & BUCKs
+  da9062-onkey            :               : On Key
+  da9062-watchdog         :               : Watchdog Timer
+  da9062-thermal          :               : Thermal
+
+properties:
+  compatible:
+    enum:
+      - dlg,da9062
+      - dlg,da9061
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  watchdog:
+    type: object
+    $ref: /schemas/watchdog/watchdog.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: dlg,da9062-watchdog
+
+      dlg,use-sw-pm:
+        type: boolean
+        description:
+          Disable the watchdog during suspend.
+          Only use this option if you can't use the watchdog automatic suspend
+          function during a suspend (see register CONTROL_B).
+
+  rtc:
+    type: object
+    $ref: /schemas/rtc/rtc.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: dlg,da9062-rtc
+
+  thermal:
+    type: object
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: dlg,da9062-thermal
+
+  gpio:
+    type: object
+    $ref: /schemas/gpio/gpio.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: dlg,da9062-gpio
+
+  onkey:
+    type: object
+    $ref: /schemas/input/input.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: dlg,da9062-onkey
+
+      dlg,disable-key-power:
+        type: boolean
+        description: |
+          Disable power-down using a long key-press.
+          If this entry does not exist then by default the key-press triggered
+          power down is enabled and the OnKey will support both KEY_POWER and
+          KEY_SLEEP.
+
+  regulators:
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^(ldo[1-9]|buck[1-4])$":
+        $ref: /schemas/regulator/regulator.yaml
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
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
+...
-- 
2.25.1


