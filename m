Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB931648E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 16:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgBSPlt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 10:41:49 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:52716 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbgBSPlt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 10:41:49 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id 4fhn2200J5USYZQ01fhn68; Wed, 19 Feb 2020 16:41:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j4RTv-0004PG-Qu; Wed, 19 Feb 2020 16:41:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j4RTv-0002vr-PH; Wed, 19 Feb 2020 16:41:47 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: ata: rcar-sata: Convert to json-schema
Date:   Wed, 19 Feb 2020 16:41:46 +0100
Message-Id: <20200219154146.11230-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas R-Car Serial-ATA Device Tree binding documentation
to json-schema.

While at it:
  - Remove the deprecated "renesas,rcar-sata" compatible value,
  - Add "iommus", "power-domains", and "resets" properties,
  - Update the example.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not having to care about the deprecated value simplifies the
jscon-schema.
---
 .../bindings/ata/renesas,rcar-sata.yaml       | 71 +++++++++++++++++++
 .../devicetree/bindings/ata/sata_rcar.txt     | 36 ----------
 2 files changed, 71 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
 delete mode 100644 Documentation/devicetree/bindings/ata/sata_rcar.txt

diff --git a/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml b/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
new file mode 100644
index 0000000000000000..7b69831060d8b9c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/ata/renesas,rcar-sata.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas R-Car Serial-ATA Interface
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,sata-r8a7779      # R-Car H1
+      - items:
+          - enum:
+              - renesas,sata-r8a7790-es1  # R-Car H2 ES1
+              - renesas,sata-r8a7790      # R-Car H2 other than ES1
+              - renesas,sata-r8a7791      # R-Car M2-W
+              - renesas,sata-r8a7793      # R-Car M2-N
+          - const: renesas,rcar-gen2-sata # generic R-Car Gen2
+      - items:
+          - enum:
+              - renesas,sata-r8a774b1     # RZ/G2N
+              - renesas,sata-r8a7795      # R-Car H3
+              - renesas,sata-r8a77965     # R-Car M3-N
+          - const: renesas,rcar-gen3-sata # generic R-Car Gen3 or RZ/G2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
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
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7791-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7791-sysc.h>
+
+    sata@ee300000 {
+            compatible = "renesas,sata-r8a7791", "renesas,rcar-gen2-sata";
+            reg = <0xee300000 0x200000>;
+            interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD 815>;
+            power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
+            resets = <&cpg 815>;
+    };
diff --git a/Documentation/devicetree/bindings/ata/sata_rcar.txt b/Documentation/devicetree/bindings/ata/sata_rcar.txt
deleted file mode 100644
index a2fbdc91570d0f7c..0000000000000000
--- a/Documentation/devicetree/bindings/ata/sata_rcar.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-* Renesas R-Car SATA
-
-Required properties:
-- compatible		: should contain one or more of the following:
-			  - "renesas,sata-r8a774b1" for RZ/G2N
-			  - "renesas,sata-r8a7779" for R-Car H1
-			  - "renesas,sata-r8a7790-es1" for R-Car H2 ES1
-			  - "renesas,sata-r8a7790" for R-Car H2 other than ES1
-			  - "renesas,sata-r8a7791" for R-Car M2-W
-			  - "renesas,sata-r8a7793" for R-Car M2-N
-			  - "renesas,sata-r8a7795" for R-Car H3
-			  - "renesas,sata-r8a77965" for R-Car M3-N
-			  - "renesas,rcar-gen2-sata" for a generic R-Car Gen2
-			     compatible device
-			  - "renesas,rcar-gen3-sata" for a generic R-Car Gen3 or
-			     RZ/G2 compatible device
-			  - "renesas,rcar-sata" is deprecated
-
-			  When compatible with the generic version nodes
-			  must list the SoC-specific version corresponding
-			  to the platform first followed by the generic
-			  version.
-
-- reg			: address and length of the SATA registers;
-- interrupts		: must consist of one interrupt specifier.
-- clocks		: must contain a reference to the functional clock.
-
-Example:
-
-sata0: sata@ee300000 {
-	compatible = "renesas,sata-r8a7791", "renesas,rcar-gen2-sata";
-	reg = <0 0xee300000 0 0x2000>;
-	interrupt-parent = <&gic>;
-	interrupts = <0 105 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&mstp8_clks R8A7791_CLK_SATA0>;
-};
-- 
2.17.1

