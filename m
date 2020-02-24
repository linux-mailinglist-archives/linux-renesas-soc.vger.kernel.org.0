Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 318E916A7A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2020 14:52:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbgBXNwh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Feb 2020 08:52:37 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:56670 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727310AbgBXNwh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Feb 2020 08:52:37 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id 6dsb220135USYZQ01dsbbp; Mon, 24 Feb 2020 14:52:35 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6E9z-00053n-KY; Mon, 24 Feb 2020 14:52:35 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6E9z-0008Le-JP; Mon, 24 Feb 2020 14:52:35 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: power: rcar-sysc: Convert to json-schema
Date:   Mon, 24 Feb 2020 14:52:34 +0100
Message-Id: <20200224135234.32049-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas R-Car System Controller Device Tree binding
documentation to json-schema.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
v2:
  - Add Reviewed-by,
  - Drop "DT bindings for the" from title.
---
 .../bindings/power/renesas,rcar-sysc.txt      | 62 ----------------
 .../bindings/power/renesas,rcar-sysc.yaml     | 73 +++++++++++++++++++
 2 files changed, 73 insertions(+), 62 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
 create mode 100644 Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml

diff --git a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
deleted file mode 100644
index acb41fade926e2de..0000000000000000
--- a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-DT bindings for the Renesas R-Car (RZ/G) System Controller
-
-== System Controller Node ==
-
-The R-Car (RZ/G) System Controller provides power management for the CPU cores
-and various coprocessors.
-
-Required properties:
-  - compatible: Must contain exactly one of the following:
-      - "renesas,r8a7743-sysc" (RZ/G1M)
-      - "renesas,r8a7744-sysc" (RZ/G1N)
-      - "renesas,r8a7745-sysc" (RZ/G1E)
-      - "renesas,r8a77470-sysc" (RZ/G1C)
-      - "renesas,r8a774a1-sysc" (RZ/G2M)
-      - "renesas,r8a774b1-sysc" (RZ/G2N)
-      - "renesas,r8a774c0-sysc" (RZ/G2E)
-      - "renesas,r8a7779-sysc" (R-Car H1)
-      - "renesas,r8a7790-sysc" (R-Car H2)
-      - "renesas,r8a7791-sysc" (R-Car M2-W)
-      - "renesas,r8a7792-sysc" (R-Car V2H)
-      - "renesas,r8a7793-sysc" (R-Car M2-N)
-      - "renesas,r8a7794-sysc" (R-Car E2)
-      - "renesas,r8a7795-sysc" (R-Car H3)
-      - "renesas,r8a7796-sysc" (R-Car M3-W)
-      - "renesas,r8a77961-sysc" (R-Car M3-W+)
-      - "renesas,r8a77965-sysc" (R-Car M3-N)
-      - "renesas,r8a77970-sysc" (R-Car V3M)
-      - "renesas,r8a77980-sysc" (R-Car V3H)
-      - "renesas,r8a77990-sysc" (R-Car E3)
-      - "renesas,r8a77995-sysc" (R-Car D3)
-  - reg: Address start and address range for the device.
-  - #power-domain-cells: Must be 1.
-
-
-Example:
-
-	sysc: system-controller@e6180000 {
-		compatible = "renesas,r8a7791-sysc";
-		reg = <0 0xe6180000 0 0x0200>;
-		#power-domain-cells = <1>;
-	};
-
-
-== PM Domain Consumers ==
-
-Devices residing in a power area must refer to that power area, as documented
-by the generic PM domain bindings in
-Documentation/devicetree/bindings/power/power_domain.txt.
-
-Required properties:
-  - power-domains: A phandle and symbolic PM domain specifier, as defined in
-		   <dt-bindings/power/r8a77*-sysc.h>.
-
-
-Example:
-
-	L2_CA15: cache-controller@0 {
-		compatible = "cache";
-		power-domains = <&sysc R8A7791_PD_CA15_SCU>;
-		cache-unified;
-		cache-level = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
new file mode 100644
index 0000000000000000..e59331e1d944c760
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/power/renesas,rcar-sysc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas R-Car and RZ/G System Controller
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+  - Magnus Damm <magnus.damm@gmail.com>
+
+description:
+  The R-Car (RZ/G) System Controller provides power management for the CPU
+  cores and various coprocessors.
+
+properties:
+  compatible:
+    enum:
+      - renesas,r8a7743-sysc  # RZ/G1M
+      - renesas,r8a7744-sysc  # RZ/G1N
+      - renesas,r8a7745-sysc  # RZ/G1E
+      - renesas,r8a77470-sysc # RZ/G1C
+      - renesas,r8a774a1-sysc # RZ/G2M
+      - renesas,r8a774b1-sysc # RZ/G2N
+      - renesas,r8a774c0-sysc # RZ/G2E
+      - renesas,r8a7779-sysc  # R-Car H1
+      - renesas,r8a7790-sysc  # R-Car H2
+      - renesas,r8a7791-sysc  # R-Car M2-W
+      - renesas,r8a7792-sysc  # R-Car V2H
+      - renesas,r8a7793-sysc  # R-Car M2-N
+      - renesas,r8a7794-sysc  # R-Car E2
+      - renesas,r8a7795-sysc  # R-Car H3
+      - renesas,r8a77961-sysc # R-Car M3-W+
+      - renesas,r8a77965-sysc # R-Car M3-N
+      - renesas,r8a7796-sysc  # R-Car M3-W
+      - renesas,r8a77970-sysc # R-Car V3M
+      - renesas,r8a77980-sysc # R-Car V3H
+      - renesas,r8a77990-sysc # R-Car E3
+      - renesas,r8a77995-sysc # R-Car D3
+
+  reg:
+    maxItems: 1
+
+  '#power-domain-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    // System Controller node
+    sysc: system-controller@e6180000 {
+            compatible = "renesas,r8a7791-sysc";
+            reg = <0xe6180000 0x0200>;
+            #power-domain-cells = <1>;
+    };
+
+  - |
+    // Power Domain consumers
+    #include <dt-bindings/power/r8a7791-sysc.h>
+
+    cache-controller-0 {
+            compatible = "cache";
+            power-domains = <&sysc R8A7791_PD_CA15_SCU>;
+            cache-unified;
+            cache-level = <2>;
+    };
-- 
2.17.1

