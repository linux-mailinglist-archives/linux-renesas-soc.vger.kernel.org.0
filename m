Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB0CB16AA09
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2020 16:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727674AbgBXP0s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Feb 2020 10:26:48 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:60178 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727701AbgBXP0s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Feb 2020 10:26:48 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id 6fSh2200v5USYZQ01fShpF; Mon, 24 Feb 2020 16:26:42 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6Fd3-0006KY-R5; Mon, 24 Feb 2020 16:26:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6Fd3-0000MI-Ob; Mon, 24 Feb 2020 16:26:41 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: clock: renesas: cpg-mssr: Convert to json-schema
Date:   Mon, 24 Feb 2020 16:26:40 +0100
Message-Id: <20200224152640.1318-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas Clock Pulse Generator / Module Standby and Software
Reset Device Tree binding documentation to json-schema.

Note that #reset-cells was incorrecty marked a required property for
RZ/A2 before.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/clock/renesas,cpg-mssr.txt       | 101 ---------
 .../bindings/clock/renesas,cpg-mssr.yaml      | 204 ++++++++++++++++++
 2 files changed, 204 insertions(+), 101 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
deleted file mode 100644
index 5846dee455b6318d..0000000000000000
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ /dev/null
@@ -1,100 +0,0 @@
-* Renesas Clock Pulse Generator / Module Standby and Software Reset
-
-On Renesas ARM SoCs (SH/R-Mobile, R-Car, RZ), the CPG (Clock Pulse Generator)
-and MSSR (Module Standby and Software Reset) blocks are intimately connected,
-and share the same register block.
-
-They provide the following functionalities:
-  - The CPG block generates various core clocks,
-  - The MSSR block provides two functions:
-      1. Module Standby, providing a Clock Domain to control the clock supply
-	 to individual SoC devices,
-      2. Reset Control, to perform a software reset of individual SoC devices.
-
-Required Properties:
-  - compatible: Must be one of:
-      - "renesas,r7s9210-cpg-mssr" for the r7s9210 SoC (RZ/A2)
-      - "renesas,r8a7743-cpg-mssr" for the r8a7743 SoC (RZ/G1M)
-      - "renesas,r8a7744-cpg-mssr" for the r8a7744 SoC (RZ/G1N)
-      - "renesas,r8a7745-cpg-mssr" for the r8a7745 SoC (RZ/G1E)
-      - "renesas,r8a77470-cpg-mssr" for the r8a77470 SoC (RZ/G1C)
-      - "renesas,r8a774a1-cpg-mssr" for the r8a774a1 SoC (RZ/G2M)
-      - "renesas,r8a774b1-cpg-mssr" for the r8a774b1 SoC (RZ/G2N)
-      - "renesas,r8a774c0-cpg-mssr" for the r8a774c0 SoC (RZ/G2E)
-      - "renesas,r8a7790-cpg-mssr" for the r8a7790 SoC (R-Car H2)
-      - "renesas,r8a7791-cpg-mssr" for the r8a7791 SoC (R-Car M2-W)
-      - "renesas,r8a7792-cpg-mssr" for the r8a7792 SoC (R-Car V2H)
-      - "renesas,r8a7793-cpg-mssr" for the r8a7793 SoC (R-Car M2-N)
-      - "renesas,r8a7794-cpg-mssr" for the r8a7794 SoC (R-Car E2)
-      - "renesas,r8a7795-cpg-mssr" for the r8a7795 SoC (R-Car H3)
-      - "renesas,r8a7796-cpg-mssr" for the r8a77960 SoC (R-Car M3-W)
-      - "renesas,r8a77961-cpg-mssr" for the r8a77961 SoC (R-Car M3-W+)
-      - "renesas,r8a77965-cpg-mssr" for the r8a77965 SoC (R-Car M3-N)
-      - "renesas,r8a77970-cpg-mssr" for the r8a77970 SoC (R-Car V3M)
-      - "renesas,r8a77980-cpg-mssr" for the r8a77980 SoC (R-Car V3H)
-      - "renesas,r8a77990-cpg-mssr" for the r8a77990 SoC (R-Car E3)
-      - "renesas,r8a77995-cpg-mssr" for the r8a77995 SoC (R-Car D3)
-
-  - reg: Base address and length of the memory resource used by the CPG/MSSR
-    block
-
-  - clocks: References to external parent clocks, one entry for each entry in
-    clock-names
-  - clock-names: List of external parent clock names. Valid names are:
-      - "extal" (r7s9210, r8a7743, r8a7744, r8a7745, r8a77470, r8a774a1,
-		 r8a774b1, r8a774c0, r8a7790, r8a7791, r8a7792, r8a7793,
-		 r8a7794, r8a7795, r8a77960, r8a77961, r8a77965, r8a77970,
-		 r8a77980, r8a77990, r8a77995)
-      - "extalr" (r8a774a1, r8a774b1, r8a7795, r8a77960, r8a77961, r8a77965,
-		  r8a77970, r8a77980)
-      - "usb_extal" (r8a7743, r8a7744, r8a7745, r8a77470, r8a7790, r8a7791,
-		     r8a7793, r8a7794)
-
-  - #clock-cells: Must be 2
-      - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
-	and a core clock reference, as defined in
-	<dt-bindings/clock/*-cpg-mssr.h>.
-      - For module clocks, the two clock specifier cells must be "CPG_MOD" and
-	a module number, as defined in the datasheet.
-
-  - #power-domain-cells: Must be 0
-      - SoC devices that are part of the CPG/MSSR Clock Domain and can be
-	power-managed through Module Standby should refer to the CPG device
-	node in their "power-domains" property, as documented by the generic PM
-	Domain bindings in
-	Documentation/devicetree/bindings/power/power-domain.yaml.
-
-  - #reset-cells: Must be 1
-      - The single reset specifier cell must be the module number, as defined
-	in the datasheet.
-
-
-Examples
---------
-
-  - CPG device node:
-
-	cpg: clock-controller@e6150000 {
-		compatible = "renesas,r8a7795-cpg-mssr";
-		reg = <0 0xe6150000 0 0x1000>;
-		clocks = <&extal_clk>, <&extalr_clk>;
-		clock-names = "extal", "extalr";
-		#clock-cells = <2>;
-		#power-domain-cells = <0>;
-		#reset-cells = <1>;
-	};
-
-
-  - CPG/MSSR Clock Domain member device node:
-
-	scif2: serial@e6e88000 {
-		compatible = "renesas,scif-r8a7795", "renesas,scif";
-		reg = <0 0xe6e88000 0 64>;
-		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cpg CPG_MOD 310>;
-		clock-names = "fck";
-		dmas = <&dmac1 0x13>, <&dmac1 0x12>;
-		dma-names = "tx", "rx";
-		power-domains = <&cpg>;
-		resets = <&cpg 310>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
new file mode 100644
index 0000000000000000..dfbd1933f1bc56de
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
@@ -0,0 +1,204 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas Clock Pulse Generator / Module Standby and Software Reset
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description: |
+  On Renesas ARM SoCs (SH/R-Mobile, R-Car, RZ), the CPG (Clock Pulse Generator)
+  and MSSR (Module Standby and Software Reset) blocks are intimately connected,
+  and share the same register block.
+
+  They provide the following functionalities:
+    - The CPG block generates various core clocks,
+    - The MSSR block provides two functions:
+        1. Module Standby, providing a Clock Domain to control the clock supply
+           to individual SoC devices,
+        2. Reset Control, to perform a software reset of individual SoC devices.
+
+properties:
+  compatible:
+    enum:
+      - renesas,r7s9210-cpg-mssr  # RZ/A2
+      - renesas,r8a7743-cpg-mssr  # RZ/G1M
+      - renesas,r8a7744-cpg-mssr  # RZ/G1N
+      - renesas,r8a7745-cpg-mssr  # RZ/G1E
+      - renesas,r8a77470-cpg-mssr # RZ/G1C
+      - renesas,r8a774a1-cpg-mssr # RZ/G2M
+      - renesas,r8a774b1-cpg-mssr # RZ/G2N
+      - renesas,r8a774c0-cpg-mssr # RZ/G2E
+      - renesas,r8a7790-cpg-mssr  # R-Car H2
+      - renesas,r8a7791-cpg-mssr  # R-Car M2-W
+      - renesas,r8a7792-cpg-mssr  # R-Car V2H
+      - renesas,r8a7793-cpg-mssr  # R-Car M2-N
+      - renesas,r8a7794-cpg-mssr  # R-Car E2
+      - renesas,r8a7795-cpg-mssr  # R-Car H3
+      - renesas,r8a7796-cpg-mssr  # R-Car M3-W
+      - renesas,r8a77961-cpg-mssr # R-Car M3-W+
+      - renesas,r8a77965-cpg-mssr # R-Car M3-N
+      - renesas,r8a77970-cpg-mssr # R-Car V3M
+      - renesas,r8a77980-cpg-mssr # R-Car V3H
+      - renesas,r8a77990-cpg-mssr # R-Car E3
+      - renesas,r8a77995-cpg-mssr # R-Car D3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+
+  '#clock-cells':
+    description: |
+      - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
+        and a core clock reference, as defined in
+        <dt-bindings/clock/*-cpg-mssr.h>
+      - For module clocks, the two clock specifier cells must be "CPG_MOD" and
+        a module number, as defined in the datasheet.
+    const: 2
+
+  '#power-domain-cells':
+    description:
+      SoC devices that are part of the CPG/MSSR Clock Domain and can be
+      power-managed through Module Standby should refer to the CPG device node
+      in their "power-domains" property, as documented by the generic PM Domain
+      bindings in Documentation/devicetree/bindings/power/power-domain.yaml.
+    const: 0
+
+  '#reset-cells':
+    description:
+      The single reset specifier cell must be the module number, as defined in
+      the datasheet.
+    const: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          items:
+            enum:
+              - renesas,r7s9210-cpg-mssr
+              - renesas,r8a774c0-cpg-mssr
+              - renesas,r8a7792-cpg-mssr
+              - renesas,r8a77990-cpg-mssr
+              - renesas,r8a77995-cpg-mssr
+
+    then:
+      properties:
+        clock:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+          items:
+            - const: extal
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r8a7743-cpg-mssr
+              - renesas,r8a7744-cpg-mssr
+              - renesas,r8a7745-cpg-mssr
+              - renesas,r8a77470-cpg-mssr
+              - renesas,r8a7790-cpg-mssr
+              - renesas,r8a7791-cpg-mssr
+              - renesas,r8a7793-cpg-mssr
+              - renesas,r8a7794-cpg-mssr
+
+    then:
+      properties:
+        clock:
+          minItems: 2
+        clock-names:
+          minItems: 2
+          items:
+            - const: extal
+            - const: usb_extal
+
+  - if:
+      properties:
+        compatible:
+          items:
+            enum:
+              - renesas,r8a774a1-cpg-mssr
+              - renesas,r8a774b1-cpg-mssr
+              - renesas,r8a7795-cpg-mssr
+              - renesas,r8a7796-cpg-mssr
+              - renesas,r8a77961-cpg-mssr
+              - renesas,r8a77965-cpg-mssr
+              - renesas,r8a77970-cpg-mssr
+              - renesas,r8a77980-cpg-mssr
+
+    then:
+      properties:
+        clock:
+          minItems: 2
+        clock-names:
+          minItems: 2
+          items:
+            - const: extal
+            - const: extalr
+
+  - if:
+      not:
+        properties:
+          compatible:
+            items:
+              enum:
+                - renesas,r7s9210-cpg-mssr
+    then:
+      required:
+        - '#reset-cells'
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    // CPG device node:
+
+    cpg: clock-controller@e6150000 {
+            compatible = "renesas,r8a7795-cpg-mssr";
+            reg = <0xe6150000 0x1000>;
+            clocks = <&extal_clk>, <&extalr_clk>;
+            clock-names = "extal", "extalr";
+            #clock-cells = <2>;
+            #power-domain-cells = <0>;
+            #reset-cells = <1>;
+    };
+
+  - |
+    // CPG/MSSR Clock Domain member device node:
+    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    scif2: serial@e6e88000 {
+            compatible = "renesas,scif-r8a7795", "renesas,rcar-gen3-scif",
+                         "renesas,scif";
+            reg = <0xe6e88000 64>;
+            interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD 310>, <&cpg CPG_CORE R8A7795_CLK_S3D1>,
+                     <&scif_clk>;
+            clock-names = "fck";
+            dmas = <&dmac1 0x13>, <&dmac1 0x12>, <&dmac2 0x13>, <&dmac2 0x12>;
+            dma-names = "tx", "rx", "tx", "rx";
+            power-domains = <&cpg>;
+            resets = <&cpg 310>;
+    };
-- 
2.17.1

