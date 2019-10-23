Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E28EE13F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 10:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390214AbfJWIUz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 04:20:55 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:57485 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2390020AbfJWIUz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 04:20:55 -0400
X-IronPort-AV: E=Sophos;i="5.68,220,1569250800"; 
   d="scan'208";a="29789660"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Oct 2019 17:20:53 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 937174007F2B;
        Wed, 23 Oct 2019 17:20:53 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dt-bindings: usb: renesas_usbhs: convert bindings to json-schema
Date:   Wed, 23 Oct 2019 17:20:08 +0900
Message-Id: <1571818808-12495-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert Renesas USBHS (HS-USB) controller bindings documentation
to json-schema.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../devicetree/bindings/usb/renesas,usbhs.txt      |  58 ----------
 .../devicetree/bindings/usb/renesas,usbhs.yaml     | 121 +++++++++++++++++++++
 2 files changed, 121 insertions(+), 58 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/renesas,usbhs.txt
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.txt b/Documentation/devicetree/bindings/usb/renesas,usbhs.txt
deleted file mode 100644
index 06abe99..00000000
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-Renesas Electronics USBHS driver
-
-Required properties:
-  - compatible: Must contain one or more of the following:
-
-	- "renesas,usbhs-r8a7743" for r8a7743 (RZ/G1M) compatible device
-	- "renesas,usbhs-r8a7744" for r8a7744 (RZ/G1N) compatible device
-	- "renesas,usbhs-r8a7745" for r8a7745 (RZ/G1E) compatible device
-	- "renesas,usbhs-r8a77470" for r8a77470 (RZ/G1C) compatible device
-	- "renesas,usbhs-r8a774a1" for r8a774a1 (RZ/G2M) compatible device
-	- "renesas,usbhs-r8a774b1" for r8a774b1 (RZ/G2N) compatible device
-	- "renesas,usbhs-r8a774c0" for r8a774c0 (RZ/G2E) compatible device
-	- "renesas,usbhs-r8a7790" for r8a7790 (R-Car H2) compatible device
-	- "renesas,usbhs-r8a7791" for r8a7791 (R-Car M2-W) compatible device
-	- "renesas,usbhs-r8a7792" for r8a7792 (R-Car V2H) compatible device
-	- "renesas,usbhs-r8a7793" for r8a7793 (R-Car M2-N) compatible device
-	- "renesas,usbhs-r8a7794" for r8a7794 (R-Car E2) compatible device
-	- "renesas,usbhs-r8a7795" for r8a7795 (R-Car H3) compatible device
-	- "renesas,usbhs-r8a7796" for r8a7796 (R-Car M3-W) compatible device
-	- "renesas,usbhs-r8a77965" for r8a77965 (R-Car M3-N) compatible device
-	- "renesas,usbhs-r8a77990" for r8a77990 (R-Car E3) compatible device
-	- "renesas,usbhs-r8a77995" for r8a77995 (R-Car D3) compatible device
-	- "renesas,usbhs-r7s72100" for r7s72100 (RZ/A1) compatible device
-	- "renesas,usbhs-r7s9210" for r7s9210 (RZ/A2) compatible device
-	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 or RZ/G1 compatible devices
-	- "renesas,rcar-gen3-usbhs" for R-Car Gen3 or RZ/G2 compatible devices
-	- "renesas,rza1-usbhs" for RZ/A1 compatible device
-	- "renesas,rza2-usbhs" for RZ/A2 compatible device
-
-	When compatible with the generic version, nodes must list the
-	SoC-specific version corresponding to the platform first followed
-	by the generic version.
-
-  - reg: Base address and length of the register for the USBHS
-  - interrupts: Interrupt specifier for the USBHS
-  - clocks: A list of phandle + clock specifier pairs.
-	    - In case of "renesas,rcar-gen3-usbhs", two clocks are required.
-	      First clock should be peripheral and second one should be host.
-	    - In case of except above, one clock is required. First clock
-	      should be peripheral.
-
-Optional properties:
-  - renesas,buswait: Integer to use BUSWAIT register
-  - renesas,enable-gpio: A gpio specifier to check GPIO determining if USB
-			 function should be enabled
-  - phys: phandle + phy specifier pair
-  - phy-names: must be "usb"
-  - dmas: Must contain a list of references to DMA specifiers.
-  - dma-names : named "ch%d", where %d is the channel number ranging from zero
-                to the number of channels (DnFIFOs) minus one.
-
-Example:
-	usbhs: usb@e6590000 {
-		compatible = "renesas,usbhs-r8a7790", "renesas,rcar-gen2-usbhs";
-		reg = <0 0xe6590000 0 0x100>;
-		interrupts = <0 107 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp7_clks R8A7790_CLK_HSUSB>;
-	};
diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
new file mode 100644
index 00000000..cb80a06
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/renesas,usbhs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas USBHS (HS-USB) controller
+
+maintainers:
+  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,usbhs-r7s72100 # RZ/A1
+          - const: renesas,rza1-usbhs
+
+      - items:
+          - enum:
+              - renesas,usbhs-r7s9210 # RZ/A2
+          - const: renesas,rza2-usbhs
+
+      - items:
+          - enum:
+              - renesas,usbhs-r8a7743  # RZ/G1M
+              - renesas,usbhs-r8a7744  # RZ/G1N
+              - renesas,usbhs-r8a7745  # RZ/G1E
+              - renesas,usbhs-r8a77470 # RZ/G1C
+              - renesas,usbhs-r8a7790  # R-Car H2
+              - renesas,usbhs-r8a7791  # R-Car M2-W
+              - renesas,usbhs-r8a7792  # R-Car V2H
+              - renesas,usbhs-r8a7793  # R-Car M2-N
+              - renesas,usbhs-r8a7794  # R-Car E2
+          - const: renesas,rcar-gen2-usbhs
+
+      - items:
+          - enum:
+              - renesas,usbhs-r8a774a1 # RZ/G2M
+              - renesas,usbhs-r8a774b1 # RZ/G2N
+              - renesas,usbhs-r8a774c0 # RZ/G2E
+              - renesas,usbhs-r8a7795  # R-Car H3
+              - renesas,usbhs-r8a7796  # R-Car M3-W
+              - renesas,usbhs-r8a77965 # R-Car M3-N
+              - renesas,usbhs-r8a77990 # R-Car E3
+              - renesas,usbhs-r8a77995 # R-Car D3
+          - const: renesas,rcar-gen3-usbhs
+
+  reg:
+    # base address and length of the registers block for the controller.
+    maxItems: 1
+
+  clocks:
+    # clock phandle and specifier pair(s).
+    minItems: 1
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  renesas,buswait:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Integer to use BUSWAIT register.
+
+  renesas,enable-gpio:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      gpio specifier to check GPIO determining if USB function should be
+      enabled.
+
+  phys:
+    description: phandle + phy specifier pair.
+
+  phy-names:
+    const: usb
+
+  dmas:
+    minItems: 2
+    maxItems: 4
+
+  dma-names:
+    minItems: 2
+    maxItems: 4
+    items:
+      enum: [ch0, ch1, ch2, ch3]
+
+  dr_mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      See generic.txt.
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7790-sysc.h>
+
+    usbhs: usb@e6590000 {
+        compatible = "renesas,usbhs-r8a7790", "renesas,rcar-gen2-usbhs";
+        reg = <0 0xe6590000 0 0x100>;
+        interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 704>;
+    };
+
-- 
2.7.4

