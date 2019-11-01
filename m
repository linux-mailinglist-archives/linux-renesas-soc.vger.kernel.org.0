Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3F1EBE69
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2019 08:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729825AbfKAHTZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Nov 2019 03:19:25 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:50015 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725787AbfKAHTZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Nov 2019 03:19:25 -0400
X-IronPort-AV: E=Sophos;i="5.68,254,1569250800"; 
   d="scan'208";a="30393225"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Nov 2019 16:19:24 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0278740104E7;
        Fri,  1 Nov 2019 16:19:24 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] dt-bindings: phy: renesas: usb2-phy: convert bindings to json-schema
Date:   Fri,  1 Nov 2019 16:19:23 +0900
Message-Id: <1572592763-12396-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert Renesas R-Car generation 3 USB 2.0 PHY bindings documentation
to json-schema.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v1:
 - Use const for RZ/G1C's compatible.
 - Add resets' descriptions.
 - Remove dr_mode descrption. 
 https://patchwork.kernel.org/patch/11197805/

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  70 --------------
 .../devicetree/bindings/phy/renesas,usb2-phy.yaml  | 103 +++++++++++++++++++++
 2 files changed, 103 insertions(+), 70 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
deleted file mode 100644
index 7734b21..00000000
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ /dev/null
@@ -1,70 +0,0 @@
-* Renesas R-Car generation 3 USB 2.0 PHY
-
-This file provides information on what the device node for the R-Car generation
-3, RZ/G1C, RZ/G2 and RZ/A2 USB 2.0 PHY contain.
-
-Required properties:
-- compatible: "renesas,usb2-phy-r7s9210" if the device is a part of an R7S9210
-	      SoC.
-	      "renesas,usb2-phy-r8a77470" if the device is a part of an R8A77470
-	      SoC.
-	      "renesas,usb2-phy-r8a774a1" if the device is a part of an R8A774A1
-	      SoC.
-	      "renesas,usb2-phy-r8a774b1" if the device is a part of an R8A774B1
-	      SoC.
-	      "renesas,usb2-phy-r8a774c0" if the device is a part of an R8A774C0
-	      SoC.
-	      "renesas,usb2-phy-r8a7795" if the device is a part of an R8A7795
-	      SoC.
-	      "renesas,usb2-phy-r8a7796" if the device is a part of an R8A7796
-	      SoC.
-	      "renesas,usb2-phy-r8a77965" if the device is a part of an
-	      R8A77965 SoC.
-	      "renesas,usb2-phy-r8a77990" if the device is a part of an
-	      R8A77990 SoC.
-	      "renesas,usb2-phy-r8a77995" if the device is a part of an
-	      R8A77995 SoC.
-	      "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3, RZ/G2 or
-	      RZ/A2 compatible device.
-
-	      When compatible with the generic version, nodes must list the
-	      SoC-specific version corresponding to the platform first
-	      followed by the generic version.
-
-- reg: offset and length of the partial USB 2.0 Host register block.
-- clocks: clock phandle and specifier pair(s).
-- #phy-cells: see phy-bindings.txt in the same directory, must be <1> (and
-	      using <0> is deprecated).
-
-The phandle's argument in the PHY specifier is the INT_STATUS bit of controller:
-- 1 = USBH_INTA (OHCI)
-- 2 = USBH_INTB (EHCI)
-- 3 = UCOM_INT (OTG and BC)
-
-Optional properties:
-To use a USB channel where USB 2.0 Host and HSUSB (USB 2.0 Peripheral) are
-combined, the device tree node should set interrupt properties to use the
-channel as USB OTG:
-- interrupts: interrupt specifier for the PHY.
-- vbus-supply: Phandle to a regulator that provides power to the VBUS. This
-	       regulator will be managed during the PHY power on/off sequence.
-- renesas,no-otg-pins: boolean, specify when a board does not provide proper
-		       otg pins.
-- dr_mode: string, indicates the working mode for the PHY. Can be "host",
-           "peripheral", or "otg". Should be set if otg controller is not used.
-
-
-Example (R-Car H3):
-
-	usb-phy@ee080200 {
-		compatible = "renesas,usb2-phy-r8a7795", "renesas,rcar-gen3-usb2-phy";
-		reg = <0 0xee080200 0 0x700>;
-		interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cpg CPG_MOD 703>;
-	};
-
-	usb-phy@ee0a0200 {
-		compatible = "renesas,usb2-phy-r8a7795", "renesas,rcar-gen3-usb2-phy";
-		reg = <0 0xee0a0200 0 0x700>;
-		clocks = <&cpg CPG_MOD 702>;
-	};
diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
new file mode 100644
index 00000000..c0e1af6
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/renesas,usb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car generation 3 USB 2.0 PHY
+
+maintainers:
+  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: renesas,usb2-phy-r8a77470 # RZ/G1C
+
+      - items:
+          - enum:
+              - renesas,usb2-phy-r7s9210  # RZ/A2
+              - renesas,usb2-phy-r8a774a1 # RZ/G2M
+              - renesas,usb2-phy-r8a774b1 # RZ/G2N
+              - renesas,usb2-phy-r8a774c0 # RZ/G2E
+              - renesas,usb2-phy-r8a7795  # R-Car H3
+              - renesas,usb2-phy-r8a7796  # R-Car M3-W
+              - renesas,usb2-phy-r8a77965 # R-Car M3-N
+              - renesas,usb2-phy-r8a77990 # R-Car E3
+              - renesas,usb2-phy-r8a77995 # R-Car D3
+          - const: renesas,rcar-gen3-usb2-phy
+
+  reg:
+    # base address and length of the registers block for the PHY.
+    maxItems: 1
+
+  clocks:
+    # clock phandle and specifier pair(s).
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    # for RZ/A2
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: fck
+      - const: usb_x1
+
+  '#phy-cells':
+    enum: [0, 1]  # and 0 is deprecated.
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: reset of USB 2.0 host side
+      - description: reset of USB 2.0 peripheral side
+
+  vbus-supply:
+    description: |
+      Phandle to a regulator that provides power to the VBUS. This regulator
+      will be managed during the PHY power on/off sequence.
+
+  renesas,no-otg-pins:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      specify when a board does not provide proper otg pins.
+
+  dr_mode: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7795-sysc.h>
+
+    usb-phy@ee080200 {
+        compatible = "renesas,usb2-phy-r8a7795", "renesas,rcar-gen3-usb2-phy";
+        reg = <0 0xee080200 0 0x700>;
+        interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 703>;
+        #phy-cells = <1>;
+    };
+
+    usb-phy@ee0a0200 {
+        compatible = "renesas,usb2-phy-r8a7795", "renesas,rcar-gen3-usb2-phy";
+        reg = <0 0xee0a0200 0 0x700>;
+        clocks = <&cpg CPG_MOD 702>;
+        #phy-cells = <1>;
+    };
-- 
2.7.4

