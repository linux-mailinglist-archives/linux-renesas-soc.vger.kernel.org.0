Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694262ADB80
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 17:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730312AbgKJQUn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 11:20:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729110AbgKJQUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 11:20:37 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47BEC0617A6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2020 08:20:36 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id qgLa2300k4C55Sk01gLbVr; Tue, 10 Nov 2020 17:20:35 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kcWNm-001E0w-Nq; Tue, 10 Nov 2020 17:20:34 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kcWNm-00DnvH-AI; Tue, 10 Nov 2020 17:20:34 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 2/2] dt-bindings: timer: renesas: tmu: Convert to json-schema
Date:   Tue, 10 Nov 2020 17:20:14 +0100
Message-Id: <20201110162014.3290109-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110162014.3290109-1-geert+renesas@glider.be>
References: <20201110162014.3290109-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
v5:
  - No changes,

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
2.25.1

