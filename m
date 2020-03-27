Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE20E195413
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2020 10:34:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgC0JeH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Mar 2020 05:34:07 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:51108 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726168AbgC0JeH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 05:34:07 -0400
X-IronPort-AV: E=Sophos;i="5.72,311,1580742000"; 
   d="scan'208";a="43017754"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 27 Mar 2020 18:34:05 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 55A5C420D842;
        Fri, 27 Mar 2020 18:34:05 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     kishon@ti.com, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 3/4] dt-bindings: phy: renesas: usb3-phy: convert bindings to json-schema
Date:   Fri, 27 Mar 2020 18:33:55 +0900
Message-Id: <1585301636-24399-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585301636-24399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1585301636-24399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert Renesas R-Car generation 3 USB 3.0 PHY bindings documentation
to json-schema.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/phy/rcar-gen3-phy-usb3.txt | 52 ---------------
 .../devicetree/bindings/phy/renesas,usb3-phy.yaml  | 78 ++++++++++++++++++++++
 2 files changed, 78 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
deleted file mode 100644
index 0fe433b..00000000
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-* Renesas R-Car generation 3 USB 3.0 PHY
-
-This file provides information on what the device node for the R-Car generation
-3 and RZ/G2 USB 3.0 PHY contain.
-If you want to enable spread spectrum clock (ssc), you should use USB_EXTAL
-instead of USB3_CLK. However, if you don't want to these features, you don't
-need this driver.
-
-Required properties:
-- compatible: "renesas,r8a774a1-usb3-phy" if the device is a part of an R8A774A1
-	      SoC.
-	      "renesas,r8a774b1-usb3-phy" if the device is a part of an R8A774B1
-	      SoC.
-	      "renesas,r8a7795-usb3-phy" if the device is a part of an R8A7795
-	      SoC.
-	      "renesas,r8a7796-usb3-phy" if the device is a part of an R8A7796
-	      SoC.
-	      "renesas,r8a77965-usb3-phy" if the device is a part of an
-	      R8A77965 SoC.
-	      "renesas,rcar-gen3-usb3-phy" for a generic R-Car Gen3 or RZ/G2
-	      compatible device.
-
-	      When compatible with the generic version, nodes must list the
-	      SoC-specific version corresponding to the platform first
-	      followed by the generic version.
-
-- reg: offset and length of the USB 3.0 PHY register block.
-- clocks: A list of phandles and clock-specifier pairs.
-- clock-names: Name of the clocks.
-  - The funcional clock must be "usb3-if".
-  - The usb3's external clock must be "usb3s_clk".
-  - The usb2's external clock must be "usb_extal". If you want to use the ssc,
-    the clock-frequency must not be 0.
-- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
-
-Optional properties:
-- renesas,ssc-range: Enable/disable spread spectrum clock (ssc) by using
-		     the following values as u32:
-			- 0 (or the property doesn't exist): disable the ssc
-			- 4980: enable the ssc as -4980 ppm
-			- 4492: enable the ssc as -4492 ppm
-			- 4003: enable the ssc as -4003 ppm
-
-Example (R-Car H3):
-
-	usb-phy@e65ee000 {
-		compatible = "renesas,r8a7795-usb3-phy",
-			     "renesas,rcar-gen3-usb3-phy";
-		reg = <0 0xe65ee000 0 0x90>;
-		clocks = <&cpg CPG_MOD 328>, <&usb3s0_clk>, <&usb_extal>;
-		clock-names = "usb3-if", "usb3s_clk", "usb_extal";
-	};
diff --git a/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
new file mode 100644
index 00000000..edd5417
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/renesas,usb3-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car generation 3 USB 3.0 PHY
+
+maintainers:
+  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r8a774a1-usb3-phy # RZ/G2M
+          - renesas,r8a774b1-usb3-phy # RZ/G2N
+          - renesas,r8a7795-usb3-phy  # R-Car H3
+          - renesas,r8a7796-usb3-phy  # R-Car M3-W
+          - renesas,r8a77965-usb3-phy # R-Car M3-N
+      - const: renesas,rcar-gen3-usb3-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    # If you want to use the ssc, the clock-frequency of usb_extal
+    # must not be 0.
+    minItems: 2
+    maxItems: 3
+    items:
+      - const: usb3-if # The funcional clock
+      - const: usb3s_clk # The usb3's external clock
+      - const: usb_extal # The usb2's external clock
+
+  '#phy-cells':
+    # see phy-bindings.txt in the same directory
+    const: 0
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  renesas,ssc-range:
+    description: |
+      Enable/disable spread spectrum clock (ssc). 0 or the property doesn't
+      exist means disabling the ssc. The actual value will be -<value> ppm.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 0, 4003, 4492, 4980 ]
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
+    #include <dt-bindings/power/r8a7795-sysc.h>
+
+    usb-phy@e65ee000 {
+        compatible = "renesas,r8a7795-usb3-phy", "renesas,rcar-gen3-usb3-phy";
+        reg = <0xe65ee000 0x90>;
+        clocks = <&cpg CPG_MOD 328>, <&usb3s0_clk>, <&usb_extal>;
+        clock-names = "usb3-if", "usb3s_clk", "usb_extal";
+        #phy-cells = <0>;
+    };
-- 
2.7.4

