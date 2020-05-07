Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A4C1C83D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2020 09:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725841AbgEGHua (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 May 2020 03:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725802AbgEGHua (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 May 2020 03:50:30 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733E7C061A10
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2020 00:50:29 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:6572:4a1f:d283:9ae8])
        by laurent.telenet-ops.be with bizsmtp
        id bjqT220073ZRV0X01jqTao; Thu, 07 May 2020 09:50:27 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWbIZ-0001PA-El; Thu, 07 May 2020 09:50:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWbIZ-0008K4-CR; Thu, 07 May 2020 09:50:27 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: clock: renesas: div6: Convert to json-schema
Date:   Thu,  7 May 2020 09:50:26 +0200
Message-Id: <20200507075026.31941-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas CPG DIV6 Clock Device Tree binding documentation to
json-schema.

Drop R-Car Gen2 compatible values, which were obsoleted by the unified
"Renesas Clock Pulse Generator / Module Standby and Software Reset" DT
bindings.
Update the example to match reality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.8.

 .../clock/renesas,cpg-div6-clock.yaml         | 60 +++++++++++++++++++
 .../clock/renesas,cpg-div6-clocks.txt         | 40 -------------
 2 files changed, 60 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
new file mode 100644
index 0000000000000000..c55a7c494e013da5
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/renesas,cpg-div6-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas CPG DIV6 Clock
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  The CPG DIV6 clocks are variable factor clocks provided by the Clock Pulse
+  Generator (CPG). Their clock input is divided by a configurable factor from 1
+  to 64.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r8a73a4-div6-clock # R-Mobile APE6
+          - renesas,r8a7740-div6-clock # R-Mobile A1
+          - renesas,sh73a0-div6-clock  # SH-Mobile AG5
+      - const: renesas,cpg-div6-clock
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    oneOf:
+      - maxItems: 1
+      - maxItems: 4
+      - maxItems: 8
+    description:
+      For clocks with multiple parents, invalid settings must be specified as
+      "<0>".
+
+  '#clock-cells':
+    const: 0
+
+  clock-output-names: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a73a4-clock.h>
+    sdhi2_clk: sdhi2_clk@e615007c {
+            compatible = "renesas,r8a73a4-div6-clock", "renesas,cpg-div6-clock";
+            reg = <0xe615007c 4>;
+            clocks = <&pll1_div2_clk>, <&cpg_clocks R8A73A4_CLK_PLL2S>, <0>,
+                     <&extal2_clk>;
+            #clock-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt
deleted file mode 100644
index ae36ab84291988b7..0000000000000000
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-* Renesas CPG DIV6 Clock
-
-The CPG DIV6 clocks are variable factor clocks provided by the Clock Pulse
-Generator (CPG). Their clock input is divided by a configurable factor from 1
-to 64.
-
-Required Properties:
-
-  - compatible: Must be one of the following
-    - "renesas,r8a73a4-div6-clock" for R8A73A4 (R-Mobile APE6) DIV6 clocks
-    - "renesas,r8a7740-div6-clock" for R8A7740 (R-Mobile A1) DIV6 clocks
-    - "renesas,r8a7790-div6-clock" for R8A7790 (R-Car H2) DIV6 clocks
-    - "renesas,r8a7791-div6-clock" for R8A7791 (R-Car M2-W) DIV6 clocks
-    - "renesas,r8a7793-div6-clock" for R8A7793 (R-Car M2-N) DIV6 clocks
-    - "renesas,r8a7794-div6-clock" for R8A7794 (R-Car E2) DIV6 clocks
-    - "renesas,sh73a0-div6-clock" for SH73A0 (SH-Mobile AG5) DIV6 clocks
-    and "renesas,cpg-div6-clock" as a fallback.
-  - reg: Base address and length of the memory resource used by the DIV6 clock
-  - clocks: Reference to the parent clock(s); either one, four, or eight
-    clocks must be specified.  For clocks with multiple parents, invalid
-    settings must be specified as "<0>".
-  - #clock-cells: Must be 0
-
-
-Optional Properties:
-
-  - clock-output-names: The name of the clock as a free-form string
-
-
-Example
--------
-
-	sdhi2_clk: sdhi2_clk@e615007c {
-		compatible = "renesas,r8a73a4-div6-clock", "renesas,cpg-div6-clock";
-		reg = <0 0xe615007c 0 4>;
-		clocks = <&pll1_div2_clk>, <&cpg_clocks R8A73A4_CLK_PLL2S>,
-			 <0>, <&extal2_clk>;
-		#clock-cells = <0>;
-		clock-output-names = "sdhi2ck";
-	};
-- 
2.17.1

