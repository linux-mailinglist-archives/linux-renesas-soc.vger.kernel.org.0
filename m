Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567C3249E5D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Aug 2020 14:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgHSMnP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Aug 2020 08:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728305AbgHSMnG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Aug 2020 08:43:06 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B92C061757
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2020 05:43:05 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id HQj4230084C55Sk01Qj4Eo; Wed, 19 Aug 2020 14:43:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8NQm-0002Mr-3U; Wed, 19 Aug 2020 14:43:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8NQm-0005D7-1w; Wed, 19 Aug 2020 14:43:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4] dt-bindings: timer: renesas: tmu: Convert to json-schema
Date:   Wed, 19 Aug 2020 14:43:02 +0200
Message-Id: <20200819124302.19988-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas R-Mobile/R-Car Timer Unit (TMU) Device Tree binding
documentation to json-schema.

Document missing properties.
Update the example to match reality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v4:
  - Rebase on top of "dt-bindings: timer: renesas,tmu: Document r8a774e1
    bindings",

v3:
  - Remove unneeded 'allOf' container around '$ref',

v2:
  - Add missing "additionalProperties: false",
  - Add Reviewed-by.
---
 .../devicetree/bindings/timer/renesas,tmu.txt | 50 ----------
 .../bindings/timer/renesas,tmu.yaml           | 99 +++++++++++++++++++
 2 files changed, 99 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/renesas,tmu.txt
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,tmu.yaml

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.txt b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
deleted file mode 100644
index a36cd61e74fba52e..0000000000000000
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-* Renesas R-Mobile/R-Car Timer Unit (TMU)
-
-The TMU is a 32-bit timer/counter with configurable clock inputs and
-programmable compare match.
-
-Channels share hardware resources but their counter and compare match value
-are independent. The TMU hardware supports up to three channels.
-
-Required Properties:
-
-  - compatible: must contain one or more of the following:
-    - "renesas,tmu-r8a7740" for the r8a7740 TMU
-    - "renesas,tmu-r8a774a1" for the r8a774A1 TMU
-    - "renesas,tmu-r8a774b1" for the r8a774B1 TMU
-    - "renesas,tmu-r8a774c0" for the r8a774C0 TMU
-    - "renesas,tmu-r8a774e1" for the r8a774E1 TMU
-    - "renesas,tmu-r8a7778" for the r8a7778 TMU
-    - "renesas,tmu-r8a7779" for the r8a7779 TMU
-    - "renesas,tmu-r8a77970" for the r8a77970 TMU
-    - "renesas,tmu-r8a77980" for the r8a77980 TMU
-    - "renesas,tmu" for any TMU.
-      This is a fallback for the above renesas,tmu-* entries
-
-  - reg: base address and length of the registers block for the timer module.
-
-  - interrupts: interrupt-specifier for the timer, one per channel.
-
-  - clocks: a list of phandle + clock-specifier pairs, one for each entry
-    in clock-names.
-  - clock-names: must contain "fck" for the functional clock.
-
-Optional Properties:
-
-  - #renesas,channels: number of channels implemented by the timer, must be 2
-    or 3 (if not specified the value defaults to 3).
-
-
-Example: R8A7779 (R-Car H1) TMU0 node
-
-	tmu0: timer@ffd80000 {
-		compatible = "renesas,tmu-r8a7779", "renesas,tmu";
-		reg = <0xffd80000 0x30>;
-		interrupts = <0 32 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 33 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 34 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp0_clks R8A7779_CLK_TMU0>;
-		clock-names = "fck";
-
-		#renesas,channels = <3>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
new file mode 100644
index 0000000000000000..c54188731a1bd7c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/renesas,tmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Mobile/R-Car Timer Unit (TMU)
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description:
+  The TMU is a 32-bit timer/counter with configurable clock inputs and
+  programmable compare match.
+
+  Channels share hardware resources but their counter and compare match value
+  are independent. The TMU hardware supports up to three channels.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,tmu-r8a7740  # R-Mobile A1
+          - renesas,tmu-r8a774a1 # RZ/G2M
+          - renesas,tmu-r8a774b1 # RZ/G2N
+          - renesas,tmu-r8a774c0 # RZ/G2E
+          - renesas,tmu-r8a774e1 # RZ/G2H
+          - renesas,tmu-r8a7778  # R-Car M1A
+          - renesas,tmu-r8a7779  # R-Car H1
+          - renesas,tmu-r8a77970 # R-Car V3M
+          - renesas,tmu-r8a77980 # R-Car V3H
+      - const: renesas,tmu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 2
+    maxItems: 3
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
+  '#renesas,channels':
+    description:
+      Number of channels implemented by the timer.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 2, 3 ]
+    default: 3
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+if:
+  not:
+    properties:
+      compatible:
+        contains:
+          enum:
+            - renesas,tmu-r8a7740
+            - renesas,tmu-r8a7778
+            - renesas,tmu-r8a7779
+then:
+  required:
+    - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7779-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7779-sysc.h>
+    tmu0: timer@ffd80000 {
+            compatible = "renesas,tmu-r8a7779", "renesas,tmu";
+            reg = <0xffd80000 0x30>;
+            interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&mstp0_clks R8A7779_CLK_TMU0>;
+            clock-names = "fck";
+            power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
+            #renesas,channels = <3>;
+    };
-- 
2.17.1

