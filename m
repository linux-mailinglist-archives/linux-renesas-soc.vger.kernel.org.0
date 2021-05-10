Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E313378EE7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 May 2021 15:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232508AbhEJNcW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 May 2021 09:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343820AbhEJMOc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 May 2021 08:14:32 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE375C06175F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 May 2021 05:13:25 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:f937:4595:45ff:bcbf])
        by michel.telenet-ops.be with bizsmtp
        id 30DQ250044jQ7kl060DQJ9; Mon, 10 May 2021 14:13:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lg4mp-004QhA-OV; Mon, 10 May 2021 14:13:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lg4mp-00HQJc-9l; Mon, 10 May 2021 14:13:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2] dt-bindings: mmc: renesas,mmcif: Convert to json-schema
Date:   Mon, 10 May 2021 14:13:21 +0200
Message-Id: <04b97315fed0f4f512356b68f9f5bb6ed7adc41f.1620648698.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas Multi Media Card Interface (MMCIF) Device Tree
binding documentation to json-schema.

Document missing properties.
Update the example to match reality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2:
  - Drop unneeded oneOf,
  - Add Reviewed-by.
---
 .../devicetree/bindings/mmc/renesas,mmcif.txt |  53 -------
 .../bindings/mmc/renesas,mmcif.yaml           | 135 ++++++++++++++++++
 2 files changed, 135 insertions(+), 53 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/renesas,mmcif.yaml

diff --git a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
deleted file mode 100644
index 291532ac0446fc71..0000000000000000
--- a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-* Renesas Multi Media Card Interface (MMCIF) Controller
-
-This file documents differences between the core properties in mmc.txt
-and the properties used by the MMCIF device.
-
-
-Required properties:
-
-- compatible: should be "renesas,mmcif-<soctype>", "renesas,sh-mmcif" as a
-  fallback. Examples with <soctype> are:
-	- "renesas,mmcif-r7s72100" for the MMCIF found in r7s72100 SoCs
-	- "renesas,mmcif-r8a73a4" for the MMCIF found in r8a73a4 SoCs
-	- "renesas,mmcif-r8a7740" for the MMCIF found in r8a7740 SoCs
-	- "renesas,mmcif-r8a7742" for the MMCIF found in r8a7742 SoCs
-	- "renesas,mmcif-r8a7743" for the MMCIF found in r8a7743 SoCs
-	- "renesas,mmcif-r8a7744" for the MMCIF found in r8a7744 SoCs
-	- "renesas,mmcif-r8a7745" for the MMCIF found in r8a7745 SoCs
-	- "renesas,mmcif-r8a7778" for the MMCIF found in r8a7778 SoCs
-	- "renesas,mmcif-r8a7790" for the MMCIF found in r8a7790 SoCs
-	- "renesas,mmcif-r8a7791" for the MMCIF found in r8a7791 SoCs
-	- "renesas,mmcif-r8a7793" for the MMCIF found in r8a7793 SoCs
-	- "renesas,mmcif-r8a7794" for the MMCIF found in r8a7794 SoCs
-	- "renesas,mmcif-sh73a0" for the MMCIF found in sh73a0 SoCs
-
-- interrupts: Some SoCs have only 1 shared interrupt, while others have either
-  2 or 3 individual interrupts (error, int, card detect). Below is the number
-  of interrupts for each SoC:
-    1: r8a73a4, r8a7742, r8a7743, r8a7744, r8a7745, r8a7778, r8a7790, r8a7791,
-       r8a7793, r8a7794
-    2: r8a7740, sh73a0
-    3: r7s72100
-
-- clocks: reference to the functional clock
-
-- dmas: reference to the DMA channels, one per channel name listed in the
-  dma-names property.
-- dma-names: must contain "tx" for the transmit DMA channel and "rx" for the
-  receive DMA channel.
-- max-frequency: Maximum operating clock frequency, driver uses default clock
-  frequency if it is not set.
-
-
-Example: R8A7790 (R-Car H2) MMCIF0
-
-	mmcif0: mmc@ee200000 {
-		compatible = "renesas,mmcif-r8a7790", "renesas,sh-mmcif";
-		reg = <0 0xee200000 0 0x80>;
-		interrupts = <0 169 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp3_clks R8A7790_CLK_MMCIF0>;
-		dmas = <&dmac0 0xd1>, <&dmac0 0xd2>;
-		dma-names = "tx", "rx";
-		max-frequency = <97500000>;
-	};
diff --git a/Documentation/devicetree/bindings/mmc/renesas,mmcif.yaml b/Documentation/devicetree/bindings/mmc/renesas,mmcif.yaml
new file mode 100644
index 0000000000000000..c36ba561c3875ad3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/renesas,mmcif.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/renesas,mmcif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Multi Media Card Interface (MMCIF) Controller
+
+maintainers:
+  - Wolfram Sang <wsa+renesas@sang-engineering.com>
+
+allOf:
+  - $ref: "mmc-controller.yaml"
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,mmcif-r7s72100 # RZ/A1H
+          - renesas,mmcif-r8a73a4  # R-Mobile APE6
+          - renesas,mmcif-r8a7740  # R-Mobile A1
+          - renesas,mmcif-r8a7742  # RZ/G1H
+          - renesas,mmcif-r8a7743  # RZ/G1M
+          - renesas,mmcif-r8a7744  # RZ/G1N
+          - renesas,mmcif-r8a7745  # RZ/G1E
+          - renesas,mmcif-r8a7778  # R-Car M1A
+          - renesas,mmcif-r8a7790  # R-Car H2
+          - renesas,mmcif-r8a7791  # R-Car M2-W
+          - renesas,mmcif-r8a7793  # R-Car M2-N
+          - renesas,mmcif-r8a7794  # R-Car E2
+          - renesas,mmcif-sh73a0   # SH-Mobile AG5
+      - const: renesas,sh-mmcif
+
+  reg:
+    maxItems: 1
+
+  interrupts: true
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    minItems: 2
+    maxItems: 4
+    description:
+      Must contain a list of pairs of references to DMA specifiers, one for
+      transmission, and one for reception.
+
+  dma-names:
+    minItems: 2
+    maxItems: 4
+    items:
+      enum:
+        - tx
+        - rx
+
+  max-frequency: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - power-domains
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: renesas,mmcif-r7s72100
+then:
+  properties:
+    interrupts:
+      items:
+        - description: Error interrupt
+        - description: Normal operation interrupt
+        - description: Card detection interrupt
+else:
+  if:
+    properties:
+      compatible:
+        contains:
+          enum:
+            - renesas,mmcif-r8a7740
+            - renesas,mmcif-sh73a0
+  then:
+    properties:
+      interrupts:
+        items:
+          - description: Error interrupt
+          - description: Normal operation interrupt
+  else:
+    if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,mmcif-r8a73a4
+              - renesas,mmcif-r8a7778
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+      required:
+        - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7790-sysc.h>
+
+    mmcif0: mmc@ee200000 {
+            compatible = "renesas,mmcif-r8a7790", "renesas,sh-mmcif";
+            reg = <0xee200000 0x80>;
+            interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD 315>;
+            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+            resets = <&cpg 315>;
+            dmas = <&dmac0 0xd1>, <&dmac0 0xd2>, <&dmac1 0xd1>, <&dmac1 0xd2>;
+            dma-names = "tx", "rx", "tx", "rx";
+            max-frequency = <97500000>;
+    };
-- 
2.25.1

