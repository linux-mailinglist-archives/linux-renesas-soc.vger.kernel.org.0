Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0320B1F9533
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2020 13:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729624AbgFOLUE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Jun 2020 07:20:04 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:36610 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728285AbgFOLUE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jun 2020 07:20:04 -0400
X-IronPort-AV: E=Sophos;i="5.73,514,1583161200"; 
   d="scan'208";a="49507830"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 Jun 2020 20:20:02 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5F81940078B5;
        Mon, 15 Jun 2020 20:20:02 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     prabhakar.mahadev-lad.rj@bp.renesas.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dt-bindings: usb: renesas,usb-xhci: convert to YAML
Date:   Mon, 15 Jun 2020 20:19:49 +0900
Message-Id: <1592219989-28631-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert renesas related part of usb-xhci to YAML.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../devicetree/bindings/usb/renesas,usb-xhci.yaml  | 84 ++++++++++++++++++++++
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 18 -----
 2 files changed, 84 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml

diff --git a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
new file mode 100644
index 0000000..279413b
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/renesas,usb-xhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas USB xHCI controllers
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
+
+allOf:
+  - $ref: "usb-hcd.yaml"
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,xhci-r8a7742 # r8a7742 SoC
+              - renesas,xhci-r8a7743 # r8a7743 SoC
+              - renesas,xhci-r8a7744 # r8a7744 SoC
+              - renesas,xhci-r8a7790 # r8a7790 SoC
+              - renesas,xhci-r8a7791 # r8a7791 SoC
+              - renesas,xhci-r8a7793 # r8a7793 SoC
+          - const: renesas,rcar-gen2-xhci
+      - items:
+          - enum:
+              - renesas,xhci-r8a774a1 # r8a774a1 SoC
+              - renesas,xhci-r8a774b1 # r8a774b1 SoC
+              - renesas,xhci-r8a774c0 # r8a774c0 SoC
+              - renesas,xhci-r8a7795  # r8a7795 SoC
+              - renesas,xhci-r8a7796  # r8a77960 SoC
+              - renesas,xhci-r8a77961 # r8a77961 SoC
+              - renesas,xhci-r8a77965 # r8a77965 SoC
+              - renesas,xhci-r8a77990 # r8a77990 SoC
+          - const: renesas,rcar-gen3-xhci
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
+    maxItems: 1
+    items:
+      - const: usb
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
+    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7795-sysc.h>
+
+    xhci0: usb@ee000000 {
+        compatible = "renesas,xhci-r8a7795", "renesas,rcar-gen3-xhci";
+        reg = <0xee000000 0xc00>;
+        interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 328>;
+        power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+        resets = <&cpg 328>;
+    };
diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index b120dd6..0c5cff8 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -7,24 +7,6 @@ Required properties:
     - "marvell,armada3700-xhci" for Armada 37xx SoCs
     - "marvell,armada-375-xhci" for Armada 375 SoCs
     - "marvell,armada-380-xhci" for Armada 38x SoCs
-    - "renesas,xhci-r8a7742" for r8a7742 SoC
-    - "renesas,xhci-r8a7743" for r8a7743 SoC
-    - "renesas,xhci-r8a7744" for r8a7744 SoC
-    - "renesas,xhci-r8a774a1" for r8a774a1 SoC
-    - "renesas,xhci-r8a774b1" for r8a774b1 SoC
-    - "renesas,xhci-r8a774c0" for r8a774c0 SoC
-    - "renesas,xhci-r8a7790" for r8a7790 SoC
-    - "renesas,xhci-r8a7791" for r8a7791 SoC
-    - "renesas,xhci-r8a7793" for r8a7793 SoC
-    - "renesas,xhci-r8a7795" for r8a7795 SoC
-    - "renesas,xhci-r8a7796" for r8a77960 SoC
-    - "renesas,xhci-r8a77961" for r8a77961 SoC
-    - "renesas,xhci-r8a77965" for r8a77965 SoC
-    - "renesas,xhci-r8a77990" for r8a77990 SoC
-    - "renesas,rcar-gen2-xhci" for a generic R-Car Gen2 or RZ/G1 compatible
-      device
-    - "renesas,rcar-gen3-xhci" for a generic R-Car Gen3 or RZ/G2 compatible
-      device
     - "brcm,bcm7445-xhci" for Broadcom STB SoCs with XHCI
     - "xhci-platform" (deprecated)
 
-- 
2.7.4

