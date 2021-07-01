Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4783B927F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jul 2021 15:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232076AbhGANyj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jul 2021 09:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232370AbhGANyh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 09:54:37 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405DCC061764
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Jul 2021 06:51:28 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:445e:1c3:be41:9e10])
        by andre.telenet-ops.be with bizsmtp
        id PprS2500A474TTe01prSaa; Thu, 01 Jul 2021 15:51:26 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lyx6D-005Pn0-NH; Thu, 01 Jul 2021 15:51:25 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lyx6C-00Ef1b-Qx; Thu, 01 Jul 2021 15:51:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: mfd: bd9571mwv: Convert to json-schema
Date:   Thu,  1 Jul 2021 15:51:21 +0200
Message-Id: <d11f3ec58dd8213dfc8be59dd81db060b508b08c.1625147091.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the ROHM BD9571MWV/BD9574MWF Power Management Integrated Circuit
(PMIC) Device Tree binding documentation to json-schema.

Make the "regulators" subnode optional, as not all users describe the
regulators.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I have listed Marek as the maintainer, as he wrote the original
bindings.  Marek: Please scream if this is inappropriate ;-)
---
 .../devicetree/bindings/mfd/bd9571mwv.txt     |  69 ----------
 .../bindings/mfd/rohm,bd9571mwv.yaml          | 127 ++++++++++++++++++
 2 files changed, 127 insertions(+), 69 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/bd9571mwv.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd9571mwv.yaml

diff --git a/Documentation/devicetree/bindings/mfd/bd9571mwv.txt b/Documentation/devicetree/bindings/mfd/bd9571mwv.txt
deleted file mode 100644
index 1d6413e96c376e4b..0000000000000000
--- a/Documentation/devicetree/bindings/mfd/bd9571mwv.txt
+++ /dev/null
@@ -1,69 +0,0 @@
-* ROHM BD9571MWV/BD9574MWF Power Management Integrated Circuit (PMIC) bindings
-
-Required properties:
- - compatible		: Should be "rohm,bd9571mwv" or "rohm,bd9574mwf".
- - reg			: I2C slave address.
- - interrupts		: The interrupt line the device is connected to.
- - interrupt-controller	: Marks the device node as an interrupt controller.
- - #interrupt-cells	: The number of cells to describe an IRQ, should be 2.
-			    The first cell is the IRQ number.
-			    The second cell is the flags, encoded as trigger
-			    masks from ../interrupt-controller/interrupts.txt.
- - gpio-controller      : Marks the device node as a GPIO Controller.
- - #gpio-cells          : Should be two.  The first cell is the pin number and
-                            the second cell is used to specify flags.
-                            See ../gpio/gpio.txt for more information.
- - regulators:          : List of child nodes that specify the regulator
-                            initialization data. Child nodes must be named
-                            after their hardware counterparts:
-			     - vd09
-			     - vd18
-			     - vd25
-			     - vd33
-			     - dvfs
-			    Each child node is defined using the standard
-			    binding for regulators.
-
-Optional properties:
-  - rohm,ddr-backup-power : Value to use for DDR-Backup Power (default 0).
-			    This is a bitmask that specifies which DDR power
-			    rails need to be kept powered when backup mode is
-			    entered, for system suspend:
-			      - bit 0: DDR0
-			      - bit 1: DDR1
-			      - bit 2: DDR0C
-			      - bit 3: DDR1C
-			    These bits match the KEEPON_DDR* bits in the
-			    documentation for the "BKUP Mode Cnt" register.
-  - rohm,rstbmode-level: The RSTB signal is configured for level mode, to
-			 accommodate a toggle power switch (the RSTBMODE pin is
-			 strapped low).
-  - rohm,rstbmode-pulse: The RSTB signal is configured for pulse mode, to
-			 accommodate a momentary power switch (the RSTBMODE pin
-			 is strapped high).
-			 The two properties above are mutually exclusive.
-
-Example:
-
-	pmic: pmic@30 {
-		compatible = "rohm,bd9571mwv";
-		reg = <0x30>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		rohm,ddr-backup-power = <0xf>;
-		rohm,rstbmode-pulse;
-
-		regulators {
-			dvfs: dvfs {
-				regulator-name = "dvfs";
-				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt = <1030000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd9571mwv.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd9571mwv.yaml
new file mode 100644
index 0000000000000000..89f9efee465b8ed0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd9571mwv.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/rohm,bd9571mwv.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD9571MWV/BD9574MWF Power Management Integrated Circuit (PMIC)
+
+maintainers:
+  - Marek Vasut <marek.vasut@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - rohm,bd9571mwv
+      - rohm,bd9574mwf
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  rohm,ddr-backup-power:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x0
+    maximum: 0xf
+    description: |
+      Value to use for DDR-Backup Power (default 0).
+      This is a bitmask that specifies which DDR power rails need to be kept
+      powered when backup mode is entered, for system suspend:
+        - bit 0: DDR0
+        - bit 1: DDR1
+        - bit 2: DDR0C
+        - bit 3: DDR1C
+      These bits match the KEEPON_DDR* bits in the documentation for the "BKUP
+      Mode Cnt" register.
+
+  rohm,rstbmode-level:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The RSTB signal is configured for level mode, to accommodate a toggle
+      power switch (the RSTBMODE pin is strapped low).
+
+  rohm,rstbmode-pulse:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The RSTB signal is configured for pulse mode, to accommodate a momentary
+      power switch (the RSTBMODE pin is strapped high).
+
+  regulators:
+    type: object
+    description:
+      List of child nodes that specify the regulator initialization data.
+      Child nodes must be named after their hardware counterparts.
+
+    patternProperties:
+      "^(vd09|vd18|vd25|vd33|dvfs)$":
+        type: object
+        $ref: ../regulator/regulator.yaml#
+
+        properties:
+          regulator-name:
+            pattern: "^(vd09|vd18|vd25|vd33|dvfs)$"
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+
+oneOf:
+  - required:
+      - rohm,rstbmode-level
+  - required:
+      - rohm,rstbmode-pulse
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          pmic: pmic@30 {
+                  compatible = "rohm,bd9571mwv";
+                  reg = <0x30>;
+                  interrupt-parent = <&gpio2>;
+                  interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+                  interrupt-controller;
+                  #interrupt-cells = <2>;
+                  gpio-controller;
+                  #gpio-cells = <2>;
+                  rohm,ddr-backup-power = <0xf>;
+                  rohm,rstbmode-pulse;
+
+                  regulators {
+                          dvfs: dvfs {
+                                  regulator-name = "dvfs";
+                                  regulator-min-microvolt = <750000>;
+                                  regulator-max-microvolt = <1030000>;
+                                  regulator-boot-on;
+                                  regulator-always-on;
+                          };
+                  };
+          };
+    };
-- 
2.25.1

