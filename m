Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0391E623A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2020 15:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390329AbgE1N33 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 May 2020 09:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390412AbgE1N25 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 May 2020 09:28:57 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F5EC05BD1E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2020 06:28:56 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:21:946d:6344:ccc1])
        by michel.telenet-ops.be with bizsmtp
        id kDUu2200G55ue4H06DUu0H; Thu, 28 May 2020 15:28:55 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jeIac-000869-NQ; Thu, 28 May 2020 15:28:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jeIac-0000T6-LX; Thu, 28 May 2020 15:28:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: irqchip: renesas-rza1-irqc: Convert to json-schema
Date:   Thu, 28 May 2020 15:28:53 +0200
Message-Id: <20200528132853.1751-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas RZ/A1 Interrupt Controller Device Tree binding
documentation to json-schema.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Validation depends on "[PATCH dt-schema] Fix interrupt controllers with
interrupt-map".
http://lore.kernel.org/r/20200528132323.30288-1-geert+renesas@glider.be
---
 .../renesas,rza1-irqc.txt                     | 43 ----------
 .../renesas,rza1-irqc.yaml                    | 80 +++++++++++++++++++
 2 files changed, 80 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
deleted file mode 100644
index 727b7e4cd6e01110..0000000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-DT bindings for the Renesas RZ/A1 Interrupt Controller
-
-The RZ/A1 Interrupt Controller is a front-end for the GIC found on Renesas
-RZ/A1 and RZ/A2 SoCs:
-  - IRQ sense select for 8 external interrupts, 1:1-mapped to 8 GIC SPI
-    interrupts,
-  - NMI edge select.
-
-Required properties:
-  - compatible: Must be "renesas,<soctype>-irqc", and "renesas,rza1-irqc" as
-		fallback.
-		Examples with soctypes are:
-		  - "renesas,r7s72100-irqc" (RZ/A1H)
-		  - "renesas,r7s9210-irqc" (RZ/A2M)
-  - #interrupt-cells: Must be 2 (an interrupt index and flags, as defined
-				 in interrupts.txt in this directory)
-  - #address-cells: Must be zero
-  - interrupt-controller: Marks the device as an interrupt controller
-  - reg: Base address and length of the memory resource used by the interrupt
-         controller
-  - interrupt-map: Specifies the mapping from external interrupts to GIC
-		   interrupts
-  - interrupt-map-mask: Must be <7 0>
-
-Example:
-
-	irqc: interrupt-controller@fcfef800 {
-		compatible = "renesas,r7s72100-irqc", "renesas,rza1-irqc";
-		#interrupt-cells = <2>;
-		#address-cells = <0>;
-		interrupt-controller;
-		reg = <0xfcfef800 0x6>;
-		interrupt-map =
-			<0 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
-			<1 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
-			<2 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
-			<3 0 &gic GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
-			<4 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
-			<5 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
-			<6 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
-			<7 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-map-mask = <7 0>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.yaml
new file mode 100644
index 0000000000000000..755cdfabfcd06c85
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/renesas,rza1-irqc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/A1 Interrupt Controller
+
+maintainers:
+  - Chris Brandt <chris.brandt@renesas.com>
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description: |
+  The RZ/A1 Interrupt Controller is a front-end for the GIC found on Renesas RZ/A1 and
+  RZ/A2 SoCs:
+    - IRQ sense select for 8 external interrupts, 1:1-mapped to 8 GIC SPI interrupts,
+    - NMI edge select.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r7s72100-irqc # RZ/A1H
+          - renesas,r7s9210-irqc  # RZ/A2M
+      - const: renesas,rza1-irqc
+
+  '#interrupt-cells':
+    const: 2
+
+  '#address-cells':
+    const: 0
+
+  interrupt-controller: true
+
+  reg:
+    maxItems: 1
+
+  interrupt-map:
+    maxItems: 8
+    description: Specifies the mapping from external interrupts to GIC interrupts.
+
+  interrupt-map-mask:
+    items:
+      - const: 7
+      - const: 0
+
+required:
+  - compatible
+  - '#interrupt-cells'
+  - '#address-cells'
+  - interrupt-controller
+  - reg
+  - interrupt-map
+  - interrupt-map-mask
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    irqc: interrupt-controller@fcfef800 {
+            compatible = "renesas,r7s72100-irqc", "renesas,rza1-irqc";
+            #interrupt-cells = <2>;
+            #address-cells = <0>;
+            interrupt-controller;
+            reg = <0xfcfef800 0x6>;
+            interrupt-map =
+                    <0 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                    <1 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+                    <2 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+                    <3 0 &gic GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+                    <4 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+                    <5 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+                    <6 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+                    <7 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-map-mask = <7 0>;
+    };
-- 
2.17.1

