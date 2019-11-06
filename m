Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6FCF1403
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2019 11:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730312AbfKFKe4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Nov 2019 05:34:56 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:27365 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726656AbfKFKez (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 05:34:55 -0500
X-IronPort-AV: E=Sophos;i="5.68,274,1569250800"; 
   d="scan'208";a="30986727"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Nov 2019 19:34:53 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C4DAD4007F4F;
        Wed,  6 Nov 2019 19:34:53 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] dt-bindings: usb: renesas: usb3-peri: convert bindings to json-schema
Date:   Wed,  6 Nov 2019 19:34:53 +0900
Message-Id: <1573036493-16525-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert Renesas USB 3.0 Peripheral controller bindings documentation
to json-schema.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v1:
 - Remove oneOf from compatible.
 - Remove comments from reg, interrupts and clocks.
 - Add maxItems on phys.
 - Remove generic.txt and graph.txt references.
 https://patchwork.kernel.org/patch/11205923/

 .../devicetree/bindings/usb/renesas,usb3-peri.txt  | 65 ----------------
 .../devicetree/bindings/usb/renesas,usb3-peri.yaml | 86 ++++++++++++++++++++++
 2 files changed, 86 insertions(+), 65 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml

diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
deleted file mode 100644
index 1343dfc..00000000
--- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-Renesas Electronics USB3.0 Peripheral driver
-
-Required properties:
-  - compatible: Must contain one of the following:
-	- "renesas,r8a774a1-usb3-peri"
-	- "renesas,r8a774b1-usb3-peri"
-	- "renesas,r8a774c0-usb3-peri"
-	- "renesas,r8a7795-usb3-peri"
-	- "renesas,r8a7796-usb3-peri"
-	- "renesas,r8a77965-usb3-peri"
-	- "renesas,r8a77990-usb3-peri"
-	- "renesas,rcar-gen3-usb3-peri" for a generic R-Car Gen3 or RZ/G2
-	  compatible device
-
-    When compatible with the generic version, nodes must list the
-    SoC-specific version corresponding to the platform first
-    followed by the generic version.
-
-  - reg: Base address and length of the register for the USB3.0 Peripheral
-  - interrupts: Interrupt specifier for the USB3.0 Peripheral
-  - clocks: clock phandle and specifier pair
-
-Optional properties:
-  - phys: phandle + phy specifier pair
-  - phy-names: must be "usb"
-  - usb-role-switch: support role switch. see usb/generic.txt
-
-Sub-nodes:
-- any connector to the data bus of this controller should be modelled using the
-  OF graph bindings specified in bindings/graph.txt, if the "usb-role-switch"
-  property is used.
-
-Example of R-Car H3 ES1.x:
-	usb3_peri0: usb@ee020000 {
-		compatible = "renesas,r8a7795-usb3-peri",
-			     "renesas,rcar-gen3-usb3-peri";
-		reg = <0 0xee020000 0 0x400>;
-		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cpg CPG_MOD 328>;
-	};
-
-	usb3_peri1: usb@ee060000 {
-		compatible = "renesas,r8a7795-usb3-peri",
-			     "renesas,rcar-gen3-usb3-peri";
-		reg = <0 0xee060000 0 0x400>;
-		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cpg CPG_MOD 327>;
-	};
-
-Example of RZ/G2E:
-	usb3_peri0: usb@ee020000 {
-		compatible = "renesas,r8a774c0-usb3-peri",
-			     "renesas,rcar-gen3-usb3-peri";
-		reg = <0 0xee020000 0 0x400>;
-		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cpg CPG_MOD 328>;
-		companion = <&xhci0>;
-		usb-role-switch;
-
-		port {
-			usb3_role_switch: endpoint {
-				remote-endpoint = <&hd3ss3220_ep>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
new file mode 100644
index 00000000..92d8631
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/renesas,usb3-peri.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas USB 3.0 Peripheral controller
+
+maintainers:
+  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r8a774a1-usb3-peri # RZ/G2M
+          - renesas,r8a774b1-usb3-peri # RZ/G2N
+          - renesas,r8a774c0-usb3-peri # RZ/G2E
+          - renesas,r8a7795-usb3-peri  # R-Car H3
+          - renesas,r8a7796-usb3-peri  # R-Car M3-W
+          - renesas,r8a77965-usb3-peri # R-Car M3-N
+          - renesas,r8a77990-usb3-peri # R-Car E3
+      - const: renesas,rcar-gen3-usb3-peri
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
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: usb
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  usb-role-switch:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Support role switch.
+
+  companion:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of a companion.
+
+  port:
+    description: |
+      any connector to the data bus of this controller should be modelled
+      using the OF graph bindings specified, if the "usb-role-switch"
+      property is used.
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a774c0-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a774c0-sysc.h>
+
+    usb3_peri0: usb@ee020000 {
+        compatible = "renesas,r8a774c0-usb3-peri", "renesas,rcar-gen3-usb3-peri";
+        reg = <0 0xee020000 0 0x400>;
+        interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 328>;
+        companion = <&xhci0>;
+        usb-role-switch;
+
+        port {
+            usb3_role_switch: endpoint {
+                remote-endpoint = <&hd3ss3220_ep>;
+            };
+        };
+    };
-- 
2.7.4

