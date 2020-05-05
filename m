Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D81E61C5C91
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2020 17:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729682AbgEEPvx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 May 2020 11:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729412AbgEEPvw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 May 2020 11:51:52 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 594C3C061A10
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2020 08:51:52 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:bd97:8453:3b10:1832])
        by baptiste.telenet-ops.be with bizsmtp
        id b3rU2200q3VwRR3013rU3U; Tue, 05 May 2020 17:51:29 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jVzqy-0003Pb-Qw; Tue, 05 May 2020 17:51:28 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jVzqy-0001Gl-P8; Tue, 05 May 2020 17:51:28 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: timer: renesas: cmt: Convert to json-schema
Date:   Tue,  5 May 2020 17:51:27 +0200
Message-Id: <20200505155127.4836-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas Compare Match Timer (CMT) Device Tree binding
documentation to json-schema.

Document missing properties.
Update the example to match reality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2:
  - Add missing "additionalProperties: false",
  - Add Reviewed-by.
---
 .../devicetree/bindings/timer/renesas,cmt.txt | 110 -----------
 .../bindings/timer/renesas,cmt.yaml           | 182 ++++++++++++++++++
 2 files changed, 182 insertions(+), 110 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/renesas,cmt.txt
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,cmt.yaml

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
deleted file mode 100644
index a747fabab7d3fda4..0000000000000000
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ /dev/null
@@ -1,110 +0,0 @@
-* Renesas R-Car Compare Match Timer (CMT)
-
-The CMT is a multi-channel 16/32/48-bit timer/counter with configurable clock
-inputs and programmable compare match.
-
-Channels share hardware resources but their counter and compare match value
-are independent. A particular CMT instance can implement only a subset of the
-channels supported by the CMT model. Channel indices represent the hardware
-position of the channel in the CMT and don't match the channel numbers in the
-datasheets.
-
-Required Properties:
-
-  - compatible: must contain one or more of the following:
-    - "renesas,r8a73a4-cmt0" for the 32-bit CMT0 device included in r8a73a4.
-    - "renesas,r8a73a4-cmt1" for the 48-bit CMT1 device included in r8a73a4.
-    - "renesas,r8a7740-cmt0" for the 32-bit CMT0 device included in r8a7740.
-    - "renesas,r8a7740-cmt1" for the 48-bit CMT1 device included in r8a7740.
-    - "renesas,r8a7740-cmt2" for the 32-bit CMT2 device included in r8a7740.
-    - "renesas,r8a7740-cmt3" for the 32-bit CMT3 device included in r8a7740.
-    - "renesas,r8a7740-cmt4" for the 32-bit CMT4 device included in r8a7740.
-    - "renesas,r8a7743-cmt0" for the 32-bit CMT0 device included in r8a7743.
-    - "renesas,r8a7743-cmt1" for the 48-bit CMT1 device included in r8a7743.
-    - "renesas,r8a7744-cmt0" for the 32-bit CMT0 device included in r8a7744.
-    - "renesas,r8a7744-cmt1" for the 48-bit CMT1 device included in r8a7744.
-    - "renesas,r8a7745-cmt0" for the 32-bit CMT0 device included in r8a7745.
-    - "renesas,r8a7745-cmt1" for the 48-bit CMT1 device included in r8a7745.
-    - "renesas,r8a77470-cmt0" for the 32-bit CMT0 device included in r8a77470.
-    - "renesas,r8a77470-cmt1" for the 48-bit CMT1 device included in r8a77470.
-    - "renesas,r8a774a1-cmt0" for the 32-bit CMT0 device included in r8a774a1.
-    - "renesas,r8a774a1-cmt1" for the 48-bit CMT devices included in r8a774a1.
-    - "renesas,r8a774b1-cmt0" for the 32-bit CMT0 device included in r8a774b1.
-    - "renesas,r8a774b1-cmt1" for the 48-bit CMT devices included in r8a774b1.
-    - "renesas,r8a774c0-cmt0" for the 32-bit CMT0 device included in r8a774c0.
-    - "renesas,r8a774c0-cmt1" for the 48-bit CMT devices included in r8a774c0.
-    - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7790.
-    - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7790.
-    - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7791.
-    - "renesas,r8a7791-cmt1" for the 48-bit CMT1 device included in r8a7791.
-    - "renesas,r8a7792-cmt0" for the 32-bit CMT0 device included in r8a7792.
-    - "renesas,r8a7792-cmt1" for the 48-bit CMT1 device included in r8a7792.
-    - "renesas,r8a7793-cmt0" for the 32-bit CMT0 device included in r8a7793.
-    - "renesas,r8a7793-cmt1" for the 48-bit CMT1 device included in r8a7793.
-    - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
-    - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
-    - "renesas,r8a7795-cmt0" for the 32-bit CMT0 device included in r8a7795.
-    - "renesas,r8a7795-cmt1" for the 48-bit CMT devices included in r8a7795.
-    - "renesas,r8a7796-cmt0" for the 32-bit CMT0 device included in r8a7796.
-    - "renesas,r8a7796-cmt1" for the 48-bit CMT devices included in r8a7796.
-    - "renesas,r8a77965-cmt0" for the 32-bit CMT0 device included in r8a77965.
-    - "renesas,r8a77965-cmt1" for the 48-bit CMT devices included in r8a77965.
-    - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a77970.
-    - "renesas,r8a77970-cmt1" for the 48-bit CMT devices included in r8a77970.
-    - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
-    - "renesas,r8a77980-cmt1" for the 48-bit CMT devices included in r8a77980.
-    - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
-    - "renesas,r8a77990-cmt1" for the 48-bit CMT devices included in r8a77990.
-    - "renesas,r8a77995-cmt0" for the 32-bit CMT0 device included in r8a77995.
-    - "renesas,r8a77995-cmt1" for the 48-bit CMT devices included in r8a77995.
-    - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
-    - "renesas,sh73a0-cmt1" for the 48-bit CMT1 device included in sh73a0.
-    - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
-    - "renesas,sh73a0-cmt3" for the 32-bit CMT3 device included in sh73a0.
-    - "renesas,sh73a0-cmt4" for the 32-bit CMT4 device included in sh73a0.
-
-    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
-		and RZ/G1.
-    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 devices included in R-Car Gen2
-		and RZ/G1.
-		These are fallbacks for r8a73a4, R-Car Gen2 and RZ/G1 entries
-		listed above.
-    - "renesas,rcar-gen3-cmt0" for 32-bit CMT0 devices included in R-Car Gen3
-		and RZ/G2.
-    - "renesas,rcar-gen3-cmt1" for 48-bit CMT devices included in R-Car Gen3
-		and RZ/G2.
-		These are fallbacks for R-Car Gen3 and RZ/G2 entries listed
-		above.
-
-  - reg: base address and length of the registers block for the timer module.
-  - interrupts: interrupt-specifier for the timer, one per channel.
-  - clocks: a list of phandle + clock-specifier pairs, one for each entry
-    in clock-names.
-  - clock-names: must contain "fck" for the functional clock.
-
-
-Example: R8A7790 (R-Car H2) CMT0 and CMT1 nodes
-
-	cmt0: timer@ffca0000 {
-		compatible = "renesas,r8a7790-cmt0", "renesas,rcar-gen2-cmt0";
-		reg = <0 0xffca0000 0 0x1004>;
-		interrupts = <0 142 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 142 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp1_clks R8A7790_CLK_CMT0>;
-		clock-names = "fck";
-	};
-
-	cmt1: timer@e6130000 {
-		compatible = "renesas,r8a7790-cmt1", "renesas,rcar-gen2-cmt1";
-		reg = <0 0xe6130000 0 0x1004>;
-		interrupts = <0 120 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 121 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 122 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 123 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 124 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 125 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 126 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 127 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp3_clks R8A7790_CLK_CMT1>;
-		clock-names = "fck";
-	};
diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
new file mode 100644
index 0000000000000000..7e4dc5623da80e5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
@@ -0,0 +1,182 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/renesas,cmt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Compare Match Timer (CMT)
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description:
+  The CMT is a multi-channel 16/32/48-bit timer/counter with configurable clock
+  inputs and programmable compare match.
+
+  Channels share hardware resources but their counter and compare match values
+  are independent. A particular CMT instance can implement only a subset of the
+  channels supported by the CMT model. Channel indices represent the hardware
+  position of the channel in the CMT and don't match the channel numbers in the
+  datasheets.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r8a7740-cmt0      # 32-bit CMT0 on R-Mobile A1
+              - renesas,r8a7740-cmt1      # 48-bit CMT1 on R-Mobile A1
+              - renesas,r8a7740-cmt2      # 32-bit CMT2 on R-Mobile A1
+              - renesas,r8a7740-cmt3      # 32-bit CMT3 on R-Mobile A1
+              - renesas,r8a7740-cmt4      # 32-bit CMT4 on R-Mobile A1
+              - renesas,sh73a0-cmt0       # 32-bit CMT0 on SH-Mobile AG5
+              - renesas,sh73a0-cmt1       # 48-bit CMT1 on SH-Mobile AG5
+              - renesas,sh73a0-cmt2       # 32-bit CMT2 on SH-Mobile AG5
+              - renesas,sh73a0-cmt3       # 32-bit CMT3 on SH-Mobile AG5
+              - renesas,sh73a0-cmt4       # 32-bit CMT4 on SH-Mobile AG5
+
+      - items:
+          - enum:
+              - renesas,r8a73a4-cmt0      # 32-bit CMT0 on R-Mobile APE6
+              - renesas,r8a7743-cmt0      # 32-bit CMT0 on RZ/G1M
+              - renesas,r8a7744-cmt0      # 32-bit CMT0 on RZ/G1N
+              - renesas,r8a7745-cmt0      # 32-bit CMT0 on RZ/G1E
+              - renesas,r8a77470-cmt0     # 32-bit CMT0 on RZ/G1C
+              - renesas,r8a7790-cmt0      # 32-bit CMT0 on R-Car H2
+              - renesas,r8a7791-cmt0      # 32-bit CMT0 on R-Car M2-W
+              - renesas,r8a7792-cmt0      # 32-bit CMT0 on R-Car V2H
+              - renesas,r8a7793-cmt0      # 32-bit CMT0 on R-Car M2-N
+              - renesas,r8a7794-cmt0      # 32-bit CMT0 on R-Car E2
+          - const: renesas,rcar-gen2-cmt0 # 32-bit CMT0 on R-Mobile APE6, R-Car Gen2 and RZ/G1
+
+      - items:
+          - enum:
+              - renesas,r8a73a4-cmt1      # 48-bit CMT1 on R-Mobile APE6
+              - renesas,r8a7743-cmt1      # 48-bit CMT1 on RZ/G1M
+              - renesas,r8a7744-cmt1      # 48-bit CMT1 on RZ/G1N
+              - renesas,r8a7745-cmt1      # 48-bit CMT1 on RZ/G1E
+              - renesas,r8a77470-cmt1     # 48-bit CMT1 on RZ/G1C
+              - renesas,r8a7790-cmt1      # 48-bit CMT1 on R-Car H2
+              - renesas,r8a7791-cmt1      # 48-bit CMT1 on R-Car M2-W
+              - renesas,r8a7792-cmt1      # 48-bit CMT1 on R-Car V2H
+              - renesas,r8a7793-cmt1      # 48-bit CMT1 on R-Car M2-N
+              - renesas,r8a7794-cmt1      # 48-bit CMT1 on R-Car E2
+          - const: renesas,rcar-gen2-cmt1 # 48-bit CMT1 on R-Mobile APE6, R-Car Gen2 and RZ/G1
+
+      - items:
+          - enum:
+              - renesas,r8a774a1-cmt0     # 32-bit CMT0 on RZ/G2M
+              - renesas,r8a774b1-cmt0     # 32-bit CMT0 on RZ/G2N
+              - renesas,r8a774c0-cmt0     # 32-bit CMT0 on RZ/G2E
+              - renesas,r8a7795-cmt0      # 32-bit CMT0 on R-Car H3
+              - renesas,r8a7796-cmt0      # 32-bit CMT0 on R-Car M3-W
+              - renesas,r8a77965-cmt0     # 32-bit CMT0 on R-Car M3-N
+              - renesas,r8a77970-cmt0     # 32-bit CMT0 on R-Car V3M
+              - renesas,r8a77980-cmt0     # 32-bit CMT0 on R-Car V3H
+              - renesas,r8a77990-cmt0     # 32-bit CMT0 on R-Car E3
+              - renesas,r8a77995-cmt0     # 32-bit CMT0 on R-Car D3
+          - const: renesas,rcar-gen3-cmt0 # 32-bit CMT0 on R-Car Gen3 and RZ/G2
+
+      - items:
+          - enum:
+              - renesas,r8a774a1-cmt1     # 48-bit CMT on RZ/G2M
+              - renesas,r8a774b1-cmt1     # 48-bit CMT on RZ/G2N
+              - renesas,r8a774c0-cmt1     # 48-bit CMT on RZ/G2E
+              - renesas,r8a7795-cmt1      # 48-bit CMT on R-Car H3
+              - renesas,r8a7796-cmt1      # 48-bit CMT on R-Car M3-W
+              - renesas,r8a77965-cmt1     # 48-bit CMT on R-Car M3-N
+              - renesas,r8a77970-cmt1     # 48-bit CMT on R-Car V3M
+              - renesas,r8a77980-cmt1     # 48-bit CMT on R-Car V3H
+              - renesas,r8a77990-cmt1     # 48-bit CMT on R-Car E3
+              - renesas,r8a77995-cmt1     # 48-bit CMT on R-Car D3
+          - const: renesas,rcar-gen3-cmt1 # 48-bit CMT on R-Car Gen3 and RZ/G2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 8
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: fck
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,rcar-gen2-cmt0
+              - renesas,rcar-gen3-cmt0
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,rcar-gen2-cmt1
+              - renesas,rcar-gen3-cmt1
+    then:
+      properties:
+        interrupts:
+          minItems: 8
+          maxItems: 8
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7790-sysc.h>
+    cmt0: timer@ffca0000 {
+            compatible = "renesas,r8a7790-cmt0", "renesas,rcar-gen2-cmt0";
+            reg = <0xffca0000 0x1004>;
+            interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD 124>;
+            clock-names = "fck";
+            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+            resets = <&cpg 124>;
+    };
+
+    cmt1: timer@e6130000 {
+            compatible = "renesas,r8a7790-cmt1", "renesas,rcar-gen2-cmt1";
+            reg = <0xe6130000 0x1004>;
+            interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD 329>;
+            clock-names = "fck";
+            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+            resets = <&cpg 329>;
+    };
-- 
2.17.1

