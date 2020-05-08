Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 023011CA7D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2020 12:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgEHKCi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 May 2020 06:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgEHKCi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 May 2020 06:02:38 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8924CC05BD09
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2020 03:02:37 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:5bb:5444:969e:23bc])
        by baptiste.telenet-ops.be with bizsmtp
        id cA2Y220092zKgvk01A2YFi; Fri, 08 May 2020 12:02:32 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWzpw-0002yy-68; Fri, 08 May 2020 12:02:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWzpw-0001in-4a; Fri, 08 May 2020 12:02:32 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: clock: renesas: cpg: Convert to json-schema
Date:   Fri,  8 May 2020 12:02:31 +0200
Message-Id: <20200508100231.6575-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas Clock Pulse Generator (CPG) Device Tree
binding documentation to json-schema, combining support for:
  - R-Mobile APE6 (R8A73A4) and A1 (R8A7740),
  - R-Car M1 (R8A7778) and H1 (R8A7779),
  - RZ/A1 (R7S72100),
  - SH-Mobile AG5 (SH73A0).

Keep the example for R-Mobile A1, which shows most properties.
Drop the consumer examples, as they do not belong here.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.8.

For a clean dtbs_check, this depends on "[PATCH] ARM: dts: r8a7740: Add
missing extal2 to CPG node"
(http://lore.kernel.org/r/20200508095918.6061-1-geert+renesas@glider.be)
which I intend to queue as a fix for v5.7.

As these bindings are very similar, I merged them into a single
document.  SoC-specific differences are mostly limited to the "clocks"
and "clock-output-names" properties, and "#power-domain-cells" for clock
domain providers.

The diffstat for the individual conversions would look like:
     .../clock/renesas,r8a73a4-cpg-clocks.txt      | 33 --------
     .../clock/renesas,r8a73a4-cpg-clocks.yaml     | 70 ++++++++++++++++
     .../clock/renesas,r8a7740-cpg-clocks.txt      | 41 ----------
     .../clock/renesas,r8a7740-cpg-clocks.yaml     | 81 +++++++++++++++++++
     .../clock/renesas,r8a7778-cpg-clocks.txt      | 47 -----------
     .../clock/renesas,r8a7778-cpg-clocks.yaml     | 64 +++++++++++++++
     .../clock/renesas,r8a7779-cpg-clocks.txt      | 49 -----------
     .../clock/renesas,r8a7779-cpg-clocks.yaml     | 65 +++++++++++++++
     .../bindings/clock/renesas,rz-cpg-clocks.txt  | 53 ------------
     .../bindings/clock/renesas,rz-cpg-clocks.yaml | 66 +++++++++++++++
     .../clock/renesas,sh73a0-cpg-clocks.txt       | 35 --------
     .../clock/renesas,sh73a0-cpg-clocks.yaml      | 69 ++++++++++++++++
     12 files changed, 415 insertions(+), 258 deletions(-)
     delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a73a4-cpg-clocks.txt
     create mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a73a4-cpg-clocks.yaml
     delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7740-cpg-clocks.txt
     create mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7740-cpg-clocks.yaml
     delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7778-cpg-clocks.txt
     create mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7778-cpg-clocks.yaml
     delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7779-cpg-clocks.txt
     create mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7779-cpg-clocks.yaml
     delete mode 100644 Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt
     create mode 100644 Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.yaml
     delete mode 100644 Documentation/devicetree/bindings/clock/renesas,sh73a0-cpg-clocks.txt
     create mode 100644 Documentation/devicetree/bindings/clock/renesas,sh73a0-cpg-clocks.yaml
---
 .../bindings/clock/renesas,cpg-clocks.yaml    | 242 ++++++++++++++++++
 .../clock/renesas,r8a73a4-cpg-clocks.txt      |  33 ---
 .../clock/renesas,r8a7740-cpg-clocks.txt      |  41 ---
 .../clock/renesas,r8a7778-cpg-clocks.txt      |  47 ----
 .../clock/renesas,r8a7779-cpg-clocks.txt      |  49 ----
 .../bindings/clock/renesas,rz-cpg-clocks.txt  |  53 ----
 .../clock/renesas,sh73a0-cpg-clocks.txt       |  35 ---
 7 files changed, 242 insertions(+), 258 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a73a4-cpg-clocks.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7740-cpg-clocks.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7778-cpg-clocks.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a7779-cpg-clocks.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,sh73a0-cpg-clocks.txt

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
new file mode 100644
index 0000000000000000..3f3659bf2263e172
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
@@ -0,0 +1,242 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/renesas,cpg-clocks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Clock Pulse Generator (CPG)
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  The Clock Pulse Generator (CPG) generates core clocks for the SoC.  It
+  includes PLLs, and fixed and variable ratio dividers.
+
+  The CPG may also provide a Clock Domain for SoC devices, in combination with
+  the CPG Module Stop (MSTP) Clocks.
+
+properties:
+  compatible:
+    oneOf:
+      - const: renesas,r8a73a4-cpg-clocks # R-Mobile APE6
+      - const: renesas,r8a7740-cpg-clocks # R-Mobile A1
+      - const: renesas,r8a7778-cpg-clocks # R-Car M1
+      - const: renesas,r8a7779-cpg-clocks # R-Car H1
+      - items:
+        - enum:
+            - renesas,r7s72100-cpg-clocks # RZ/A1H
+        - const: renesas,rz-cpg-clocks    # RZ/A1
+      - const: renesas,sh73a0-cpg-clocks  # SH-Mobile AG5
+
+  reg:
+    maxItems: 1
+
+  clocks: true
+
+  '#clock-cells':
+    const: 1
+
+  clock-output-names: true
+
+  renesas,mode:
+    description: Board-specific settings of the MD_CK* bits on R-Mobile A1
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 7
+
+  '#power-domain-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - clock-output-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r8a73a4-cpg-clocks
+    then:
+      properties:
+        clocks:
+          items:
+            - description: extal1
+            - description: extal2
+
+        clock-output-names:
+          items:
+            - const: main
+            - const: pll0
+            - const: pll1
+            - const: pll2
+            - const: pll2s
+            - const: pll2h
+            - const: z
+            - const: z2
+            - const: i
+            - const: m3
+            - const: b
+            - const: m1
+            - const: m2
+            - const: zx
+            - const: zs
+            - const: hp
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r8a7740-cpg-clocks
+    then:
+      properties:
+        clocks:
+          items:
+            - description: extal1
+            - description: extal2
+            - description: extalr
+
+        clock-output-names:
+          items:
+            - const: system
+            - const: pllc0
+            - const: pllc1
+            - const: pllc2
+            - const: r
+            - const: usb24s
+            - const: i
+            - const: zg
+            - const: b
+            - const: m1
+            - const: hp
+            - const: hpp
+            - const: usbp
+            - const: s
+            - const: zb
+            - const: m3
+            - const: cp
+
+      required:
+        - renesas,mode
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r8a7778-cpg-clocks
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-output-names:
+          items:
+            - const: plla
+            - const: pllb
+            - const: b
+            - const: out
+            - const: p
+            - const: s
+            - const: s1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r8a7779-cpg-clocks
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-output-names:
+          items:
+            - const: plla
+            - const: z
+            - const: zs
+            - const: s
+            - const: s1
+            - const: p
+            - const: b
+            - const: out
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r7s72100-cpg-clocks
+    then:
+      properties:
+        clocks:
+          items:
+            - description: extal1
+            - description: usb_x1
+
+        clock-output-names:
+          items:
+            - const: pll
+            - const: i
+            - const: g
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,sh73a0-cpg-clocks
+    then:
+      properties:
+        clocks:
+          items:
+            - description: extal1
+            - description: extal2
+
+        clock-output-names:
+          items:
+            - const: main
+            - const: pll0
+            - const: pll1
+            - const: pll2
+            - const: pll3
+            - const: dsi0phy
+            - const: dsi1phy
+            - const: zg
+            - const: m3
+            - const: b
+            - const: m1
+            - const: m2
+            - const: z
+            - const: zx
+            - const: hp
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r8a7778-cpg-clocks
+              - renesas,r8a7779-cpg-clocks
+              - renesas,rz-cpg-clocks
+    then:
+      required:
+        - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7740-clock.h>
+    cpg_clocks: cpg_clocks@e6150000 {
+            compatible = "renesas,r8a7740-cpg-clocks";
+            reg = <0xe6150000 0x10000>;
+            clocks = <&extal1_clk>, <&extal2_clk>, <&extalr_clk>;
+            #clock-cells = <1>;
+            clock-output-names = "system", "pllc0", "pllc1", "pllc2", "r",
+                                 "usb24s", "i", "zg", "b", "m1", "hp", "hpp",
+                                 "usbp", "s", "zb", "m3", "cp";
+            renesas,mode = <0x05>;
+    };
diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a73a4-cpg-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,r8a73a4-cpg-clocks.txt
deleted file mode 100644
index ece92393e80d4648..0000000000000000
--- a/Documentation/devicetree/bindings/clock/renesas,r8a73a4-cpg-clocks.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-* Renesas R8A73A4 Clock Pulse Generator (CPG)
-
-The CPG generates core clocks for the R8A73A4 SoC. It includes five PLLs
-and several fixed ratio dividers.
-
-Required Properties:
-
-  - compatible: Must be "renesas,r8a73a4-cpg-clocks"
-
-  - reg: Base address and length of the memory resource used by the CPG
-
-  - clocks: Reference to the parent clocks ("extal1" and "extal2")
-
-  - #clock-cells: Must be 1
-
-  - clock-output-names: The names of the clocks. Supported clocks are "main",
-    "pll0", "pll1", "pll2", "pll2s", "pll2h", "z", "z2", "i", "m3", "b",
-    "m1", "m2", "zx", "zs", and "hp".
-
-
-Example
--------
-
-        cpg_clocks: cpg_clocks@e6150000 {
-                compatible = "renesas,r8a73a4-cpg-clocks";
-                reg = <0 0xe6150000 0 0x10000>;
-                clocks = <&extal1_clk>, <&extal2_clk>;
-                #clock-cells = <1>;
-                clock-output-names = "main", "pll0", "pll1", "pll2",
-                                     "pll2s", "pll2h", "z", "z2",
-                                     "i", "m3", "b", "m1", "m2",
-                                     "zx", "zs", "hp";
-        };
diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a7740-cpg-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,r8a7740-cpg-clocks.txt
deleted file mode 100644
index 2c03302f86edfb83..0000000000000000
--- a/Documentation/devicetree/bindings/clock/renesas,r8a7740-cpg-clocks.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-These bindings should be considered EXPERIMENTAL for now.
-
-* Renesas R8A7740  Clock Pulse Generator (CPG)
-
-The CPG generates core clocks for the R8A7740 SoC. It includes three PLLs
-and several fixed ratio and variable ratio dividers.
-
-Required Properties:
-
-  - compatible: Must be "renesas,r8a7740-cpg-clocks"
-
-  - reg: Base address and length of the memory resource used by the CPG
-
-  - clocks: Reference to the three parent clocks
-  - #clock-cells: Must be 1
-  - clock-output-names: The names of the clocks. Supported clocks are
-    "system", "pllc0", "pllc1", "pllc2", "r", "usb24s", "i", "zg", "b",
-    "m1", "hp", "hpp", "usbp", "s", "zb", "m3", and "cp".
-
-  - renesas,mode: board-specific settings of the MD_CK* bits
-
-
-Example
--------
-
-cpg_clocks: cpg_clocks@e6150000 {
-        compatible = "renesas,r8a7740-cpg-clocks";
-        reg = <0xe6150000 0x10000>;
-        clocks = <&extal1_clk>, <&extal2_clk>, <&extalr_clk>;
-        #clock-cells = <1>;
-        clock-output-names = "system", "pllc0", "pllc1",
-                             "pllc2", "r",
-                             "usb24s",
-                             "i", "zg", "b", "m1", "hp",
-                             "hpp", "usbp", "s", "zb", "m3",
-                             "cp";
-};
-
-&cpg_clocks {
-	renesas,mode = <0x05>;
-};
diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a7778-cpg-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,r8a7778-cpg-clocks.txt
deleted file mode 100644
index 7cc4c0330b534660..0000000000000000
--- a/Documentation/devicetree/bindings/clock/renesas,r8a7778-cpg-clocks.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-* Renesas R8A7778 Clock Pulse Generator (CPG)
-
-The CPG generates core clocks for the R8A7778. It includes two PLLs and
-several fixed ratio dividers.
-The CPG also provides a Clock Domain for SoC devices, in combination with the
-CPG Module Stop (MSTP) Clocks.
-
-Required Properties:
-
-  - compatible: Must be "renesas,r8a7778-cpg-clocks"
-  - reg: Base address and length of the memory resource used by the CPG
-  - #clock-cells: Must be 1
-  - clock-output-names: The names of the clocks. Supported clocks are
-    "plla", "pllb", "b", "out", "p", "s", and "s1".
-  - #power-domain-cells: Must be 0
-
-SoC devices that are part of the CPG/MSTP Clock Domain and can be power-managed
-through an MSTP clock should refer to the CPG device node in their
-"power-domains" property, as documented by the generic PM domain bindings in
-Documentation/devicetree/bindings/power/power_domain.txt.
-
-
-Examples
---------
-
-  - CPG device node:
-
-	cpg_clocks: cpg_clocks@ffc80000 {
-		compatible = "renesas,r8a7778-cpg-clocks";
-		reg = <0xffc80000 0x80>;
-		#clock-cells = <1>;
-		clocks = <&extal_clk>;
-		clock-output-names = "plla", "pllb", "b",
-				     "out", "p", "s", "s1";
-		#power-domain-cells = <0>;
-	};
-
-
-  - CPG/MSTP Clock Domain member device node:
-
-	sdhi0: sd@ffe4c000 {
-		compatible = "renesas,sdhi-r8a7778";
-		reg = <0xffe4c000 0x100>;
-		interrupts = <0 87 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp3_clks R8A7778_CLK_SDHI0>;
-		power-domains = <&cpg_clocks>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a7779-cpg-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,r8a7779-cpg-clocks.txt
deleted file mode 100644
index 8c81547c29f568e8..0000000000000000
--- a/Documentation/devicetree/bindings/clock/renesas,r8a7779-cpg-clocks.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-* Renesas R8A7779 Clock Pulse Generator (CPG)
-
-The CPG generates core clocks for the R8A7779. It includes one PLL and
-several fixed ratio dividers.
-The CPG also provides a Clock Domain for SoC devices, in combination with the
-CPG Module Stop (MSTP) Clocks.
-
-Required Properties:
-
-  - compatible: Must be "renesas,r8a7779-cpg-clocks"
-  - reg: Base address and length of the memory resource used by the CPG
-
-  - clocks: Reference to the parent clock
-  - #clock-cells: Must be 1
-  - clock-output-names: The names of the clocks. Supported clocks are "plla",
-    "z", "zs", "s", "s1", "p", "b", "out".
-  - #power-domain-cells: Must be 0
-
-SoC devices that are part of the CPG/MSTP Clock Domain and can be power-managed
-through an MSTP clock should refer to the CPG device node in their
-"power-domains" property, as documented by the generic PM domain bindings in
-Documentation/devicetree/bindings/power/power_domain.txt.
-
-
-Examples
---------
-
-  - CPG device node:
-
-	cpg_clocks: cpg_clocks@ffc80000 {
-		compatible = "renesas,r8a7779-cpg-clocks";
-		reg = <0xffc80000 0x30>;
-		clocks = <&extal_clk>;
-		#clock-cells = <1>;
-		clock-output-names = "plla", "z", "zs", "s", "s1", "p",
-		                     "b", "out";
-		#power-domain-cells = <0>;
-	};
-
-
-  - CPG/MSTP Clock Domain member device node:
-
-	sata: sata@fc600000 {
-		compatible = "renesas,sata-r8a7779", "renesas,rcar-sata";
-		reg = <0xfc600000 0x2000>;
-		interrupts = <0 100 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp1_clks R8A7779_CLK_SATA>;
-		power-domains = <&cpg_clocks>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt
deleted file mode 100644
index 8ff3e2774ed8d1d0..0000000000000000
--- a/Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-* Renesas RZ/A1 Clock Pulse Generator (CPG)
-
-The CPG generates core clocks for the RZ/A1 SoCs. It includes the PLL, variable
-CPU and GPU clocks, and several fixed ratio dividers.
-The CPG also provides a Clock Domain for SoC devices, in combination with the
-CPG Module Stop (MSTP) Clocks.
-
-Required Properties:
-
-  - compatible: Must be one of
-    - "renesas,r7s72100-cpg-clocks" for the r7s72100 CPG
-    and "renesas,rz-cpg-clocks" as a fallback.
-  - reg: Base address and length of the memory resource used by the CPG
-  - clocks: References to possible parent clocks. Order must match clock modes
-    in the datasheet. For the r7s72100, this is extal, usb_x1.
-  - #clock-cells: Must be 1
-  - clock-output-names: The names of the clocks. Supported clocks are "pll",
-    "i", and "g"
-  - #power-domain-cells: Must be 0
-
-SoC devices that are part of the CPG/MSTP Clock Domain and can be power-managed
-through an MSTP clock should refer to the CPG device node in their
-"power-domains" property, as documented by the generic PM domain bindings in
-Documentation/devicetree/bindings/power/power_domain.txt.
-
-
-Examples
---------
-
-  - CPG device node:
-
-	cpg_clocks: cpg_clocks@fcfe0000 {
-		#clock-cells = <1>;
-		compatible = "renesas,r7s72100-cpg-clocks",
-			     "renesas,rz-cpg-clocks";
-		reg = <0xfcfe0000 0x18>;
-		clocks = <&extal_clk>, <&usb_x1_clk>;
-		clock-output-names = "pll", "i", "g";
-		#power-domain-cells = <0>;
-	};
-
-
-  - CPG/MSTP Clock Domain member device node:
-
-	mtu2: timer@fcff0000 {
-		compatible = "renesas,mtu2-r7s72100", "renesas,mtu2";
-		reg = <0xfcff0000 0x400>;
-		interrupts = <0 107 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "tgi0a";
-		clocks = <&mstp3_clks R7S72100_CLK_MTU2>;
-		clock-names = "fck";
-		power-domains = <&cpg_clocks>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/renesas,sh73a0-cpg-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,sh73a0-cpg-clocks.txt
deleted file mode 100644
index a8978ec94831fc6b..0000000000000000
--- a/Documentation/devicetree/bindings/clock/renesas,sh73a0-cpg-clocks.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-These bindings should be considered EXPERIMENTAL for now.
-
-* Renesas SH73A0 Clock Pulse Generator (CPG)
-
-The CPG generates core clocks for the SH73A0 SoC. It includes four PLLs
-and several fixed ratio dividers.
-
-Required Properties:
-
-  - compatible: Must be "renesas,sh73a0-cpg-clocks"
-
-  - reg: Base address and length of the memory resource used by the CPG
-
-  - clocks: Reference to the parent clocks ("extal1" and "extal2")
-
-  - #clock-cells: Must be 1
-
-  - clock-output-names: The names of the clocks. Supported clocks are "main",
-    "pll0", "pll1", "pll2", "pll3", "dsi0phy", "dsi1phy", "zg", "m3", "b",
-    "m1", "m2", "z", "zx", and "hp".
-
-
-Example
--------
-
-        cpg_clocks: cpg_clocks@e6150000 {
-                compatible = "renesas,sh73a0-cpg-clocks";
-                reg = <0 0xe6150000 0 0x10000>;
-                clocks = <&extal1_clk>, <&extal2_clk>;
-                #clock-cells = <1>;
-                clock-output-names = "main", "pll0", "pll1", "pll2",
-                                     "pll3", "dsi0phy", "dsi1phy",
-                                     "zg", "m3", "b", "m1", "m2",
-                                     "z", "zx", "hp";
-        };
-- 
2.17.1

