Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52C6F3727DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 May 2021 11:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbhEDJLd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 May 2021 05:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhEDJLb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 May 2021 05:11:31 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD2EC06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 May 2021 02:10:32 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by xavier.telenet-ops.be with bizsmtp
        id 0ZAW2500T3aEpPb01ZAW7K; Tue, 04 May 2021 11:10:30 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldr4Y-002j8K-4H; Tue, 04 May 2021 11:10:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldr4X-00H77s-LB; Tue, 04 May 2021 11:10:29 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: clk: emev2: Convert to json-schema
Date:   Tue,  4 May 2021 11:10:20 +0200
Message-Id: <526e1a412145a0fcc5a43dcf6de5c580301017cb.1620119350.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas EMMA Mobile EV2 System Management Unit (SMU) Device
Tree binding documentation to json-schema.

Drop the separate provider examples, as they mostly duplicate the global
example.  Drop the consumer example, as it doesn't belong here.
Update the global example to match reality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is a very old common clock binding, describing all clocks in detail
in DT, grouped under a "clocks" node.
---
 .../bindings/clock/renesas,emev2-smu.txt      |  98 ------------
 .../bindings/clock/renesas,emev2-smu.yaml     | 140 ++++++++++++++++++
 2 files changed, 140 insertions(+), 98 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,emev2-smu.txt
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,emev2-smu.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,emev2-smu.txt b/Documentation/devicetree/bindings/clock/renesas,emev2-smu.txt
deleted file mode 100644
index 268ca615459e7549..0000000000000000
--- a/Documentation/devicetree/bindings/clock/renesas,emev2-smu.txt
+++ /dev/null
@@ -1,98 +0,0 @@
-Device tree Clock bindings for Renesas EMMA Mobile EV2
-
-This binding uses the common clock binding.
-
-* SMU
-System Management Unit described in user's manual R19UH0037EJ1000_SMU.
-This is not a clock provider, but clocks under SMU depend on it.
-
-Required properties:
-- compatible: Should be "renesas,emev2-smu"
-- reg: Address and Size of SMU registers
-
-* SMU_CLKDIV
-Function block with an input mux and a divider, which corresponds to
-"Serial clock generator" in fig."Clock System Overview" of the manual,
-and "xxx frequency division setting register" (XXXCLKDIV) registers.
-This makes internal (neither input nor output) clock that is provided
-to input of xxxGCLK block.
-
-Required properties:
-- compatible: Should be "renesas,emev2-smu-clkdiv"
-- reg: Byte offset from SMU base and Bit position in the register
-- clocks: Parent clocks. Input clocks as described in clock-bindings.txt
-- #clock-cells: Should be <0>
-
-* SMU_GCLK
-Clock gating node shown as "Clock stop processing block" in the
-fig."Clock System Overview" of the manual.
-Registers are "xxx clock gate control register" (XXXGCLKCTRL).
-
-Required properties:
-- compatible: Should be "renesas,emev2-smu-gclk"
-- reg: Byte offset from SMU base and Bit position in the register
-- clocks: Input clock as described in clock-bindings.txt
-- #clock-cells: Should be <0>
-
-Example of provider:
-
-usia_u0_sclkdiv: usia_u0_sclkdiv {
-	compatible = "renesas,emev2-smu-clkdiv";
-	reg = <0x610 0>;
-	clocks = <&pll3_fo>, <&pll4_fo>, <&pll1_fo>, <&osc1_fo>;
-	#clock-cells = <0>;
-};
-
-usia_u0_sclk: usia_u0_sclk {
-	compatible = "renesas,emev2-smu-gclk";
-	reg = <0x4a0 1>;
-	clocks = <&usia_u0_sclkdiv>;
-	#clock-cells = <0>;
-};
-
-Example of consumer:
-
-serial@e1020000 {
-	compatible = "renesas,em-uart";
-	reg = <0xe1020000 0x38>;
-	interrupts = <0 8 0>;
-	clocks = <&usia_u0_sclk>;
-	clock-names = "sclk";
-};
-
-Example of clock-tree description:
-
- This describes a clock path in the clock tree
-  c32ki -> pll3_fo -> usia_u0_sclkdiv -> usia_u0_sclk
-
-smu@e0110000 {
-	compatible = "renesas,emev2-smu";
-	reg = <0xe0110000 0x10000>;
-	#address-cells = <2>;
-	#size-cells = <0>;
-
-	c32ki: c32ki {
-		compatible = "fixed-clock";
-		clock-frequency = <32768>;
-		#clock-cells = <0>;
-	};
-	pll3_fo: pll3_fo {
-		compatible = "fixed-factor-clock";
-		clocks = <&c32ki>;
-		clock-div = <1>;
-		clock-mult = <7000>;
-		#clock-cells = <0>;
-	};
-	usia_u0_sclkdiv: usia_u0_sclkdiv {
-		compatible = "renesas,emev2-smu-clkdiv";
-		reg = <0x610 0>;
-		clocks = <&pll3_fo>;
-		#clock-cells = <0>;
-	};
-	usia_u0_sclk: usia_u0_sclk {
-		compatible = "renesas,emev2-smu-gclk";
-		reg = <0x4a0 1>;
-		clocks = <&usia_u0_sclkdiv>;
-		#clock-cells = <0>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/clock/renesas,emev2-smu.yaml b/Documentation/devicetree/bindings/clock/renesas,emev2-smu.yaml
new file mode 100644
index 0000000000000000..4d9a6480048108b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,emev2-smu.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/renesas,emev2-smu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas EMMA Mobile EV2 System Management Unit
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+  - Magnus Damm <magnus.damm@gmail.com>
+
+description: |
+  The System Management Unit is described in user's manual R19UH0037EJ1000_SMU.
+  This is not a clock provider, but clocks under SMU depend on it.
+
+properties:
+  compatible:
+    const: renesas,emev2-smu
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+
+patternProperties:
+  ".*sclkdiv@.*":
+    type: object
+
+    description: |
+      Function block with an input mux and a divider, which corresponds to
+      "Serial clock generator" in fig. "Clock System Overview" of the manual,
+      and "xxx frequency division setting register" (XXXCLKDIV) registers.
+      This makes internal (neither input nor output) clock that is provided
+      to input of xxxGCLK block.
+
+    properties:
+      compatible:
+        const: renesas,emev2-smu-clkdiv
+
+      reg:
+        maxItems: 1
+        description:
+          Byte offset from SMU base and Bit position in the register.
+
+      clocks:
+        minItems: 1
+        maxItems: 4
+
+      '#clock-cells':
+        const: 0
+
+    required:
+      - compatible
+      - reg
+      - clocks
+      - '#clock-cells'
+
+    additionalProperties: false
+
+  ".*sclk@.*":
+    type: object
+
+    description: |
+      Clock gating node shown as "Clock stop processing block" in the
+      fig. "Clock System Overview" of the manual.
+      Registers are "xxx clock gate control register" (XXXGCLKCTRL).
+
+    properties:
+      compatible:
+        const: renesas,emev2-smu-gclk
+
+      reg:
+        maxItems: 1
+        description:
+          Byte offset from SMU base and Bit position in the register.
+
+      clocks:
+        maxItems: 1
+
+      '#clock-cells':
+        const: 0
+
+    required:
+      - compatible
+      - reg
+      - clocks
+      - '#clock-cells'
+
+    additionalProperties: false
+
+additionalProperties: true
+
+examples:
+  - |
+    // Example of clock-tree description:
+    //
+    //  This describes a clock path in the clock tree
+    //   c32ki -> pll3_fo -> usia_u0_sclkdiv -> usia_u0_sclk
+    clocks@e0110000 {
+            compatible = "renesas,emev2-smu";
+            reg = <0xe0110000 0x10000>;
+            #address-cells = <2>;
+            #size-cells = <0>;
+
+            c32ki: c32ki {
+                    compatible = "fixed-clock";
+                    clock-frequency = <32768>;
+                    #clock-cells = <0>;
+            };
+            pll3_fo: pll3_fo {
+                    compatible = "fixed-factor-clock";
+                    clocks = <&c32ki>;
+                    clock-div = <1>;
+                    clock-mult = <7000>;
+                    #clock-cells = <0>;
+            };
+            usia_u0_sclkdiv: usia_u0_sclkdiv@610,0 {
+                    compatible = "renesas,emev2-smu-clkdiv";
+                    reg = <0x610 0>;
+                    clocks = <&pll3_fo>;
+                    #clock-cells = <0>;
+            };
+            usia_u0_sclk: usia_u0_sclk@4a0,1 {
+                    compatible = "renesas,emev2-smu-gclk";
+                    reg = <0x4a0 1>;
+                    clocks = <&usia_u0_sclkdiv>;
+                    #clock-cells = <0>;
+            };
+    };
-- 
2.25.1

