Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C7E3727D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 May 2021 11:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhEDJJ7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 May 2021 05:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbhEDJJ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 May 2021 05:09:59 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4794CC06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 May 2021 02:09:04 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by baptiste.telenet-ops.be with bizsmtp
        id 0Z922500n3aEpPb01Z92Sb; Tue, 04 May 2021 11:09:02 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldr38-002j7q-FH; Tue, 04 May 2021 11:09:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldr37-00H748-Fe; Tue, 04 May 2021 11:09:01 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: power: sysc-rmobile: Convert to json-schema
Date:   Tue,  4 May 2021 11:09:00 +0200
Message-Id: <22150cfd2ef9d57e84eb53a5dfed8379627a9423.1620119210.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas R-Mobile System Controller (SYSC) Device Tree
binding documentation to json-schema.

Document missing properties.
Drop consumer example, as it does not belong here.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop double quotes in $id and $schema,
  - Drop patternProperties and regex,
  - Move pm-domains to properties,
  - Add $defs with pd-node description to fix nested domains,
  - Make pm-domains required.
---
 .../bindings/power/renesas,sysc-rmobile.txt   | 100 ---------------
 .../bindings/power/renesas,sysc-rmobile.yaml  | 121 ++++++++++++++++++
 2 files changed, 121 insertions(+), 100 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/renesas,sysc-rmobile.txt
 create mode 100644 Documentation/devicetree/bindings/power/renesas,sysc-rmobile.yaml

diff --git a/Documentation/devicetree/bindings/power/renesas,sysc-rmobile.txt b/Documentation/devicetree/bindings/power/renesas,sysc-rmobile.txt
deleted file mode 100644
index 49aba15dff8b7e4d..0000000000000000
--- a/Documentation/devicetree/bindings/power/renesas,sysc-rmobile.txt
+++ /dev/null
@@ -1,100 +0,0 @@
-DT bindings for the Renesas R-Mobile System Controller
-
-== System Controller Node ==
-
-The R-Mobile System Controller provides the following functions:
-  - Boot mode management,
-  - Reset generation,
-  - Power management.
-
-Required properties:
-- compatible: Should be "renesas,sysc-<soctype>", "renesas,sysc-rmobile" as
-	      fallback.
-	      Examples with soctypes are:
-		- "renesas,sysc-r8a73a4" (R-Mobile APE6)
-		- "renesas,sysc-r8a7740" (R-Mobile A1)
-		- "renesas,sysc-sh73a0" (SH-Mobile AG5)
-- reg: Two address start and address range blocks for the device:
-         - The first block refers to the normally accessible registers,
-         - the second block refers to the registers protected by the HPB
-	   semaphore.
-
-Optional nodes:
-- pm-domains: This node contains a hierarchy of PM domain nodes, which should
-  match the Power Area Hierarchy in the Power Domain Specifications section of
-  the device's datasheet.
-
-
-== PM Domain Nodes ==
-
-Each of the PM domain nodes represents a PM domain, as documented by the
-generic PM domain bindings in
-Documentation/devicetree/bindings/power/power-domain.yaml.
-
-The nodes should be named by the real power area names, and thus their names
-should be unique.
-
-Required properties:
-  - #power-domain-cells: Must be 0.
-
-Optional properties:
-- reg: If the PM domain is not always-on, this property must contain the bit
-       index number for the corresponding power area in the various Power
-       Control and Status Registers. The parent's node must contain the
-       following two properties:
-	 - #address-cells: Must be 1,
-	 - #size-cells: Must be 0.
-       If the PM domain is always-on, this property must be omitted.
-
-
-Example:
-
-This shows a subset of the r8a7740 PM domain hierarchy, containing the
-C5 "always-on" domain, 2 of its subdomains (A4S and A4SU), and the A3SP domain,
-which is a subdomain of A4S.
-
-	sysc: system-controller@e6180000 {
-		compatible = "renesas,sysc-r8a7740", "renesas,sysc-rmobile";
-		reg = <0xe6180000 0x8000>, <0xe6188000 0x8000>;
-
-		pm-domains {
-			pd_c5: c5 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				#power-domain-cells = <0>;
-
-				pd_a4s: a4s@10 {
-					reg = <10>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-					#power-domain-cells = <0>;
-
-					pd_a3sp: a3sp@11 {
-						reg = <11>;
-						#power-domain-cells = <0>;
-					};
-				};
-
-				pd_a4su: a4su@20 {
-					reg = <20>;
-					#power-domain-cells = <0>;
-				};
-			};
-		};
-	};
-
-
-== PM Domain Consumers ==
-
-Hardware blocks belonging to a PM domain should contain a "power-domains"
-property that is a phandle pointing to the corresponding PM domain node.
-
-Example:
-
-	tpu: pwm@e6600000 {
-		compatible = "renesas,tpu-r8a7740", "renesas,tpu";
-		reg = <0xe6600000 0x100>;
-		clocks = <&mstp3_clks R8A7740_CLK_TPU0>;
-		power-domains = <&pd_a3sp>;
-		#pwm-cells = <3>;
-	};
diff --git a/Documentation/devicetree/bindings/power/renesas,sysc-rmobile.yaml b/Documentation/devicetree/bindings/power/renesas,sysc-rmobile.yaml
new file mode 100644
index 0000000000000000..559718997de7b18b
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/renesas,sysc-rmobile.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/renesas,sysc-rmobile.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Mobile System Controller
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+  - Magnus Damm <magnus.damm@gmail.com>
+
+description: |
+  The R-Mobile System Controller provides the following functions:
+    - Boot mode management,
+    - Reset generation,
+    - Power management.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,sysc-r8a73a4    # R-Mobile APE6
+          - renesas,sysc-r8a7740    # R-Mobile A1
+          - renesas,sysc-sh73a0     # SH-Mobile AG5
+      - const: renesas,sysc-rmobile # Generic SH/R-Mobile
+
+  reg:
+    items:
+      - description: Normally accessible register block
+      - description: Register block protected by the HPB semaphore
+
+  pm-domains:
+    type: object
+    description: |
+      This node contains a hierarchy of PM domain nodes, which should match the
+      Power Area Hierarchy in the Power Domain Specifications section of the
+      device's datasheet.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    additionalProperties:
+      $ref: "#/$defs/pd-node"
+
+required:
+  - compatible
+  - reg
+  - pm-domains
+
+additionalProperties: false
+
+$defs:
+  pd-node:
+    type: object
+    description:
+      PM domain node representing a PM domain.  This node hould be named by
+      the real power area name, and thus its name should be unique.
+
+    properties:
+      reg:
+        maxItems: 1
+        description:
+          If the PM domain is not always-on, this property must contain the
+          bit index number for the corresponding power area in the various
+          Power Control and Status Registers.
+          If the PM domain is always-on, this property must be omitted.
+
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      '#power-domain-cells':
+        const: 0
+
+    required:
+      - '#power-domain-cells'
+
+    additionalProperties:
+      $ref: "#/$defs/pd-node"
+
+examples:
+  - |
+    // This shows a subset of the r8a7740 PM domain hierarchy, containing the
+    // C5 "always-on" domain, 2 of its subdomains (A4S and A4SU), and the A3SP
+    // domain, which is a subdomain of A4S.
+    sysc: system-controller@e6180000 {
+            compatible = "renesas,sysc-r8a7740", "renesas,sysc-rmobile";
+            reg = <0xe6180000 0x8000>, <0xe6188000 0x8000>;
+
+            pm-domains {
+                    pd_c5: c5 {
+                            #address-cells = <1>;
+                            #size-cells = <0>;
+                            #power-domain-cells = <0>;
+
+                            pd_a4s: a4s@10 {
+                                    reg = <10>;
+                                    #address-cells = <1>;
+                                    #size-cells = <0>;
+                                    #power-domain-cells = <0>;
+
+                                    pd_a3sp: a3sp@11 {
+                                            reg = <11>;
+                                            #power-domain-cells = <0>;
+                                    };
+                            };
+
+                            pd_a4su: a4su@20 {
+                                    reg = <20>;
+                                    #power-domain-cells = <0>;
+                            };
+                    };
+            };
+    };
-- 
2.25.1

