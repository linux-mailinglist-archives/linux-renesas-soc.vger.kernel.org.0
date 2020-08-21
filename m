Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC74124D3C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Aug 2020 13:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgHULUP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Aug 2020 07:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727833AbgHULUH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Aug 2020 07:20:07 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600C7C061387
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2020 04:20:06 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id JBL22300A4C55Sk06BL2eK; Fri, 21 Aug 2020 13:20:02 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k955W-0002qP-6E; Fri, 21 Aug 2020 13:20:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k955W-0001JC-3r; Fri, 21 Aug 2020 13:20:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: pinctrl: rza1: Convert to json-schema
Date:   Fri, 21 Aug 2020 13:19:56 +0200
Message-Id: <20200821111956.4989-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas RZ/A1 combined Pin and GPIO controller Device Tree
binding documentation to json-schema.

Rename "rza1-pinctrl" to "rza1-ports", to match the compatible value
scheme.
Use "pinctrl" generic node name.
Drop generic and consumer examples, as they do not belong here.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Note: "phandle: true" is needed because dt-schema does not add it
      automatically to subnodes.

This depends on "[PATCH] pinctrl: rza1: Switch to using "output-enable".
To be queued in sh-pfc for v5.10.
---
 .../bindings/pinctrl/renesas,rza1-pinctrl.txt | 222 ------------------
 .../bindings/pinctrl/renesas,rza1-ports.yaml  | 190 +++++++++++++++
 2 files changed, 190 insertions(+), 222 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
deleted file mode 100644
index 38cdd23d3498e74a..0000000000000000
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
+++ /dev/null
@@ -1,222 +0,0 @@
-Renesas RZ/A1 combined Pin and GPIO controller
-
-The Renesas SoCs of the RZ/A1 family feature a combined Pin and GPIO controller,
-named "Ports" in the hardware reference manual.
-Pin multiplexing and GPIO configuration is performed on a per-pin basis
-writing configuration values to per-port register sets.
-Each "port" features up to 16 pins, each of them configurable for GPIO
-function (port mode) or in alternate function mode.
-Up to 8 different alternate function modes exist for each single pin.
-
-Pin controller node
--------------------
-
-Required properties:
-  - compatible: should be:
-    - "renesas,r7s72100-ports": for RZ/A1H
-    - "renesas,r7s72101-ports", "renesas,r7s72100-ports": for RZ/A1M
-    - "renesas,r7s72102-ports": for RZ/A1L
-
-  - reg
-    address base and length of the memory area where the pin controller
-    hardware is mapped to.
-
-Example:
-Pin controller node for RZ/A1H SoC (r7s72100)
-
-pinctrl: pin-controller@fcfe3000 {
-	compatible = "renesas,r7s72100-ports";
-
-	reg = <0xfcfe3000 0x4230>;
-};
-
-Sub-nodes
----------
-
-The child nodes of the pin controller node describe a pin multiplexing
-function or a GPIO controller alternatively.
-
-- Pin multiplexing sub-nodes:
-  A pin multiplexing sub-node describes how to configure a set of
-  (or a single) pin in some desired alternate function mode.
-  A single sub-node may define several pin configurations.
-  A few alternate function require special pin configuration flags to be
-  supplied along with the alternate function configuration number.
-  The hardware reference manual specifies when a pin function requires
-  "software IO driven" mode to be specified. To do so use the generic
-  properties from the <include/linux/pinctrl/pinconf_generic.h> header file
-  to instruct the pin controller to perform the desired pin configuration
-  operation.
-  Please refer to pinctrl-bindings.txt to get to know more on generic
-  pin properties usage.
-
-  The allowed generic formats for a pin multiplexing sub-node are the
-  following ones:
-
-  node-1 {
-      pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
-      GENERIC_PINCONFIG;
-  };
-
-  node-2 {
-      sub-node-1 {
-          pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
-          GENERIC_PINCONFIG;
-      };
-
-      sub-node-2 {
-          pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
-          GENERIC_PINCONFIG;
-      };
-
-      ...
-
-      sub-node-n {
-          pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
-          GENERIC_PINCONFIG;
-      };
-  };
-
-  Use the second format when pins part of the same logical group need to have
-  different generic pin configuration flags applied.
-
-  Client sub-nodes shall refer to pin multiplexing sub-nodes using the phandle
-  of the most external one.
-
-  Eg.
-
-  client-1 {
-      ...
-      pinctrl-0 = <&node-1>;
-      ...
-  };
-
-  client-2 {
-      ...
-      pinctrl-0 = <&node-2>;
-      ...
-  };
-
-  Required properties:
-    - pinmux:
-      integer array representing pin number and pin multiplexing configuration.
-      When a pin has to be configured in alternate function mode, use this
-      property to identify the pin by its global index, and provide its
-      alternate function configuration number along with it.
-      When multiple pins are required to be configured as part of the same
-      alternate function they shall be specified as members of the same
-      argument list of a single "pinmux" property.
-      Helper macros to ease assembling the pin index from its position
-      (port where it sits on and pin number) and alternate function identifier
-      are provided by the pin controller header file at:
-      <include/dt-bindings/pinctrl/r7s72100-pinctrl.h>
-      Integers values in "pinmux" argument list are assembled as:
-      ((PORT * 16 + PIN) | MUX_FUNC << 16)
-
-  Optional generic properties:
-    - input-enable:
-      enable input bufer for pins requiring software driven IO input
-      operations.
-    - output-enable:
-      enable output buffer for pins requiring software driven IO output
-      operations.
-
-  The hardware reference manual specifies when a pin has to be configured to
-  work in bi-directional mode and when the IO direction has to be specified
-  by software. Bi-directional pins are managed by the pin controller driver
-  internally, while software driven IO direction has to be explicitly
-  selected when multiple options are available.
-
-  Example:
-  A serial communication interface with a TX output pin and an RX input pin.
-
-  &pinctrl {
-	scif2_pins: serial2 {
-		pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
-	};
-  };
-
-  Pin #0 on port #3 is configured as alternate function #6.
-  Pin #2 on port #3 is configured as alternate function #4.
-
-  Example 2:
-  I2c master: both SDA and SCL pins need bi-directional operations
-
-  &pinctrl {
-	i2c2_pins: i2c2 {
-		pinmux = <RZA1_PINMUX(1, 4, 1)>, <RZA1_PINMUX(1, 5, 1)>;
-	};
-  };
-
-  Pin #4 on port #1 is configured as alternate function #1.
-  Pin #5 on port #1 is configured as alternate function #1.
-  Both need to work in bi-directional mode, the driver manages this internally.
-
-  Example 3:
-  Multi-function timer input and output compare pins.
-  Configure TIOC0A as software driven input and TIOC0B as software driven
-  output.
-
-  &pinctrl {
-	tioc0_pins: tioc0 {
-		tioc0_input_pins {
-			pinumx = <RZA1_PINMUX(4, 0, 2)>;
-			input-enable;
-		};
-
-		tioc0_output_pins {
-			pinmux = <RZA1_PINMUX(4, 1, 1)>;
-			output-enable;
-		};
-	};
-  };
-
-  &tioc0 {
-	...
-	pinctrl-0 = <&tioc0_pins>;
-	...
-  };
-
-  Pin #0 on port #4 is configured as alternate function #2 with IO direction
-  specified by software as input.
-  Pin #1 on port #4 is configured as alternate function #1 with IO direction
-  specified by software as output.
-
-- GPIO controller sub-nodes:
-  Each port of the r7s72100 pin controller hardware is itself a GPIO controller.
-  Different SoCs have different numbers of available pins per port, but
-  generally speaking, each of them can be configured in GPIO ("port") mode
-  on this hardware.
-  Describe GPIO controllers using sub-nodes with the following properties.
-
-  Required properties:
-    - gpio-controller
-      empty property as defined by the GPIO bindings documentation.
-    - #gpio-cells
-      number of cells required to identify and configure a GPIO.
-      Shall be 2.
-    - gpio-ranges
-      Describes a GPIO controller specifying its specific pin base, the pin
-      base in the global pin numbering space, and the number of controlled
-      pins, as defined by the GPIO bindings documentation. Refer to
-      Documentation/devicetree/bindings/gpio/gpio.txt file for a more detailed
-      description.
-
-  Example:
-  A GPIO controller node, controlling 16 pins indexed from 0.
-  The GPIO controller base in the global pin indexing space is pin 48, thus
-  pins [0 - 15] on this controller map to pins [48 - 63] in the global pin
-  indexing space.
-
-  port3: gpio-3 {
-	gpio-controller;
-	#gpio-cells = <2>;
-	gpio-ranges = <&pinctrl 0 48 16>;
-  };
-
-  A device node willing to use pins controlled by this GPIO controller, shall
-  refer to it as follows:
-
-  led1 {
-	gpios = <&port3 10 GPIO_ACTIVE_LOW>;
-  };
diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
new file mode 100644
index 0000000000000000..7f80578dc229fb84
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
@@ -0,0 +1,190 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/renesas,rza1-ports.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/A1 combined Pin and GPIO controller
+
+maintainers:
+  - Jacopo Mondi <jacopo+renesas@jmondi.org>
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  The Renesas SoCs of the RZ/A1 family feature a combined Pin and GPIO
+  controller, named "Ports" in the hardware reference manual.
+  Pin multiplexing and GPIO configuration is performed on a per-pin basis
+  writing configuration values to per-port register sets.
+  Each "port" features up to 16 pins, each of them configurable for GPIO
+  function (port mode) or in alternate function mode.
+  Up to 8 different alternate function modes exist for each single pin.
+
+properties:
+  compatible:
+    oneOf:
+      - const: renesas,r7s72100-ports     # RZ/A1H
+      - items:
+          - const: renesas,r7s72101-ports # RZ/A1M
+          - const: renesas,r7s72100-ports # fallback
+      - const: renesas,r7s72102-ports     # RZ/A1L
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+patternProperties:
+  "^gpio-[0-9]*$":
+    type: object
+
+    description:
+      Each port of the r7s72100 pin controller hardware is itself a GPIO
+      controller.
+      Different SoCs have different numbers of available pins per port, but
+      generally speaking, each of them can be configured in GPIO ("port") mode
+      on this hardware.
+      Describe GPIO controllers using sub-nodes with the following properties.
+
+    properties:
+      gpio-controller: true
+
+      '#gpio-cells':
+        const: 2
+
+      gpio-ranges:
+        maxItems: 1
+
+    required:
+      - gpio-controller
+      - '#gpio-cells'
+      - gpio-ranges
+
+
+additionalProperties:
+  anyOf:
+    - type: object
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
+
+      description:
+        A pin multiplexing sub-node describes how to configure a set of (or a
+        single) pin in some desired alternate function mode.
+        A single sub-node may define several pin configurations.
+        A few alternate function require special pin configuration flags to be
+        supplied along with the alternate function configuration number.
+        The hardware reference manual specifies when a pin function requires
+        "software IO driven" mode to be specified. To do so use the generic
+        properties from the <include/linux/pinctrl/pinconf_generic.h> header
+        file to instruct the pin controller to perform the desired pin
+        configuration operation.
+        The hardware reference manual specifies when a pin has to be configured
+        to work in bi-directional mode and when the IO direction has to be
+        specified by software. Bi-directional pins must be managed by the pin
+        controller driver internally, while software driven IO direction has to
+        be explicitly selected when multiple options are available.
+
+      properties:
+        pinmux:
+          description: |
+            Integer array representing pin number and pin multiplexing
+            configuration.
+            When a pin has to be configured in alternate function mode, use
+            this property to identify the pin by its global index, and provide
+            its alternate function configuration number along with it.
+            When multiple pins are required to be configured as part of the
+            same alternate function they shall be specified as members of the
+            same argument list of a single "pinmux" property.
+            Helper macros to ease assembling the pin index from its position
+            (port where it sits on and pin number) and alternate function
+            identifier are provided by the pin controller header file at:
+            <include/dt-bindings/pinctrl/r7s72100-pinctrl.h>
+            Integers values in "pinmux" argument list are assembled as:
+            ((PORT * 16 + PIN) | MUX_FUNC << 16)
+
+        phandle: true
+        input-enable: true
+        output-enable: true
+
+      required:
+        - pinmux
+
+      additionalProperties: false
+
+    - type: object
+      properties:
+        phandle: true
+
+      additionalProperties:
+        $ref: "#/additionalProperties/anyOf/0"
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/r7s72100-pinctrl.h>
+    pinctrl: pinctrl@fcfe3000 {
+            compatible = "renesas,r7s72100-ports";
+
+            reg = <0xfcfe3000 0x4230>;
+
+            /*
+             * A GPIO controller node, controlling 16 pins indexed from 0.
+             * The GPIO controller base in the global pin indexing space is pin
+             * 48, thus pins [0 - 15] on this controller map to pins [48 - 63]
+             * in the global pin indexing space.
+             */
+            port3: gpio-3 {
+                    gpio-controller;
+                    #gpio-cells = <2>;
+                    gpio-ranges = <&pinctrl 0 48 16>;
+            };
+
+            /*
+             * A serial communication interface with a TX output pin and an RX
+             * input pin.
+             * Pin #0 on port #3 is configured as alternate function #6.
+             * Pin #2 on port #3 is configured as alternate function #4.
+             */
+            scif2_pins: serial2 {
+                    pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
+            };
+
+
+            /*
+             * I2c master: both SDA and SCL pins need bi-directional operations
+             * Pin #4 on port #1 is configured as alternate function #1.
+             * Pin #5 on port #1 is configured as alternate function #1.
+             * Both need to work in bi-directional mode, the driver must manage
+             * this internally.
+             */
+            i2c2_pins: i2c2 {
+                    pinmux = <RZA1_PINMUX(1, 4, 1)>, <RZA1_PINMUX(1, 5, 1)>;
+            };
+
+
+            /*
+             * Multi-function timer input and output compare pins.
+             */
+            tioc0_pins: tioc0 {
+                    /*
+                     * Configure TIOC0A as software driven input
+                     * Pin #0 on port #4 is configured as alternate function #2
+                     * with IO direction specified by software as input.
+                     */
+                    tioc0_input_pins {
+                            pinmux = <RZA1_PINMUX(4, 0, 2)>;
+                            input-enable;
+                    };
+
+                    /*
+                     * Configure TIOC0B as software driven output
+                     * Pin #1 on port #4 is configured as alternate function #1
+                     * with IO direction specified by software as output.
+                     */
+                    tioc0_output_pins {
+                            pinmux = <RZA1_PINMUX(4, 1, 1)>;
+                            output-enable;
+                    };
+            };
+    };
-- 
2.17.1

