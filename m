Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B061C83E0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2020 09:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgEGHzH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 May 2020 03:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725905AbgEGHzG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 May 2020 03:55:06 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ABF2C0610D5
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2020 00:55:06 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:6572:4a1f:d283:9ae8])
        by michel.telenet-ops.be with bizsmtp
        id bjv42200a3ZRV0X06jv4l4; Thu, 07 May 2020 09:55:05 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWbN2-0001WQ-Jm; Thu, 07 May 2020 09:55:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWbN2-0008PY-Gd; Thu, 07 May 2020 09:55:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3] dt-bindings: irqchip: renesas-intc-irqpin: Convert to json-schema
Date:   Thu,  7 May 2020 09:55:03 +0200
Message-Id: <20200507075503.32291-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Convert the Renesas Interrupt Controller (INTC) for external pins Device
Tree binding documentation to json-schema.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Co-developed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Take over from Kaneko-san,
  - Update license,
  - Fix title,
  - Remove standard descriptions,
  - reg: fix minItems, add descriptions,
  - interrupts: fix {min,max}Items,
  - sense-bitfield-width: add enum and default, use description,
  - control-parent: use description,
  - Make clocks and power-domains required on SH/R-Mobile,
  - Group interrupts in example,

v2:
  - Correct Geert-san's E-mail address,
  - Delete Guennadi-san from the maintainer of this binding,
  - Give 'sense-bitfield-width' the uint32 type,
  - Describe 'control-parent' property as a boolean.
---
 .../renesas,intc-irqpin.txt                   |  62 ----------
 .../renesas,intc-irqpin.yaml                  | 108 ++++++++++++++++++
 2 files changed, 108 insertions(+), 62 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
deleted file mode 100644
index 772c550d3b4bcfe2..0000000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-DT bindings for the R-/SH-Mobile irqpin controller
-
-Required properties:
-
-- compatible: has to be "renesas,intc-irqpin-<soctype>", "renesas,intc-irqpin"
-  as fallback.
-  Examples with soctypes are:
-    - "renesas,intc-irqpin-r8a7740" (R-Mobile A1)
-    - "renesas,intc-irqpin-r8a7778" (R-Car M1A)
-    - "renesas,intc-irqpin-r8a7779" (R-Car H1)
-    - "renesas,intc-irqpin-sh73a0" (SH-Mobile AG5)
-
-- reg: Base address and length of each register bank used by the external
-  IRQ pins driven by the interrupt controller hardware module. The base
-  addresses, length and number of required register banks varies with soctype.
-- interrupt-controller: Identifies the node as an interrupt controller.
-- #interrupt-cells: has to be <2>: an interrupt index and flags, as defined in
-  interrupts.txt in this directory.
-- interrupts: Must contain a list of interrupt specifiers. For each interrupt
-  provided by this irqpin controller instance, there must be one entry,
-  referring to the corresponding parent interrupt.
-
-Optional properties:
-
-- any properties, listed in interrupts.txt, and any standard resource allocation
-  properties
-- sense-bitfield-width: width of a single sense bitfield in the SENSE register,
-  if different from the default 4 bits
-- control-parent: disable and enable interrupts on the parent interrupt
-  controller, needed for some broken implementations
-- clocks: Must contain a reference to the functional clock.  This property is
-  mandatory if the hardware implements a controllable functional clock for
-  the irqpin controller instance.
-- power-domains: Must contain a reference to the power domain. This property is
-  mandatory if the irqpin controller instance is part of a controllable power
-  domain.
-
-
-Example
--------
-
-	irqpin1: interrupt-controller@e6900004 {
-		compatible = "renesas,intc-irqpin-r8a7740",
-			     "renesas,intc-irqpin";
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		reg = <0xe6900004 4>,
-			<0xe6900014 4>,
-			<0xe6900024 1>,
-			<0xe6900044 1>,
-			<0xe6900064 1>;
-		interrupts = <0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp2_clks R8A7740_CLK_INTCA>;
-		power-domains = <&pd_a4s>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
new file mode 100644
index 0000000000000000..800243d3ee8ef42f
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/renesas,intc-irqpin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Interrupt Controller (INTC) for external pins
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,intc-irqpin-r8a7740  # R-Mobile A1
+          - renesas,intc-irqpin-r8a7778  # R-Car M1A
+          - renesas,intc-irqpin-r8a7779  # R-Car H1
+          - renesas,intc-irqpin-sh73a0   # SH-Mobile AG5
+      - const: renesas,intc-irqpin
+
+  reg:
+    minItems: 5
+    items:
+      - description: Interrupt control register
+      - description: Interrupt priority register
+      - description: Interrupt source register
+      - description: Interrupt mask register
+      - description: Interrupt mask clear register
+      - description: Interrupt control register for ICR0 with IRLM0 bit
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupts:
+    minItems: 1
+    maxItems: 8
+
+  sense-bitfield-width:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [2, 4]
+        default: 4
+    description:
+      Width of a single sense bitfield in the SENSE register, if different from the
+      default.
+
+  control-parent:
+    type: boolean
+    description:
+      Disable and enable interrupts on the parent interrupt controller, needed for some
+      broken implementations.
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+  - interrupts
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,intc-irqpin-r8a7740
+          - renesas,intc-irqpin-sh73a0
+then:
+  required:
+    - clocks
+    - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7740-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    irqpin1: interrupt-controller@e6900004 {
+        compatible = "renesas,intc-irqpin-r8a7740", "renesas,intc-irqpin";
+        reg = <0xe6900004 4>,
+              <0xe6900014 4>,
+              <0xe6900024 1>,
+              <0xe6900044 1>,
+              <0xe6900064 1>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&mstp2_clks R8A7740_CLK_INTCA>;
+        power-domains = <&pd_a4s>;
+    };
-- 
2.17.1

