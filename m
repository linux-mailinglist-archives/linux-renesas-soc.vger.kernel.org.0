Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6643D1B1E10
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2020 07:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgDUFP4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Apr 2020 01:15:56 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:31387 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725795AbgDUFPz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 01:15:55 -0400
X-IronPort-AV: E=Sophos;i="5.72,409,1580742000"; 
   d="scan'208";a="45276363"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Apr 2020 14:15:54 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 59E0E40078AC;
        Tue, 21 Apr 2020 14:15:54 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, robh+dt@kernel.org
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5] dt-bindings: iommu: renesas,ipmmu-vmsa: convert to json-schema
Date:   Tue, 21 Apr 2020 14:15:52 +0900
Message-Id: <1587446152-23886-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert Renesas VMSA-Compatible IOMMU bindings documentation
to json-schema.

Note that original documentation doesn't mention renesas,ipmmu-vmsa
for R-Mobile APE6. But, R-Mobile APE6 is similar to the R-Car
Gen2. So, renesas,ipmmu-r8a73a4 belongs the renesas,ipmmu-vmsa
section.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v4:
 - Fix description about cell counts on #iommu-cells and renesas,ipmmu-main.
 - Fix node name on the example. 
 https://patchwork.kernel.org/patch/11494231/

 Changes from v3:
 - Fix renesas,ipmmu-r8a7795's section
 https://patchwork.kernel.org/patch/11494079/

 Changes from v2:
 - Add a description for R-Mobile APE6 on the commit log.
 - Change renesas,ipmmu-r8a73a4 section on the compatible.
 - Add items on the interrupts.
 - Add power-domains to required.
 - Add oneOf for interrupts and renesas,ipmmu-main
 https://patchwork.kernel.org/patch/11490581/

 Changes from v1:
 - Fix typo in the subject.
 - Add a description on #iommu-cells.
 https://patchwork.kernel.org/patch/11485415/

 .../bindings/iommu/renesas,ipmmu-vmsa.txt          | 73 ----------------
 .../bindings/iommu/renesas,ipmmu-vmsa.yaml         | 98 ++++++++++++++++++++++
 2 files changed, 98 insertions(+), 73 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
 create mode 100644 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml

diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
deleted file mode 100644
index 020d6f2..00000000
--- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
+++ /dev/null
@@ -1,73 +0,0 @@
-* Renesas VMSA-Compatible IOMMU
-
-The IPMMU is an IOMMU implementation compatible with the ARM VMSA page tables.
-It provides address translation for bus masters outside of the CPU, each
-connected to the IPMMU through a port called micro-TLB.
-
-
-Required Properties:
-
-  - compatible: Must contain SoC-specific and generic entry below in case
-    the device is compatible with the R-Car Gen2 VMSA-compatible IPMMU.
-
-    - "renesas,ipmmu-r8a73a4" for the R8A73A4 (R-Mobile APE6) IPMMU.
-    - "renesas,ipmmu-r8a7743" for the R8A7743 (RZ/G1M) IPMMU.
-    - "renesas,ipmmu-r8a7744" for the R8A7744 (RZ/G1N) IPMMU.
-    - "renesas,ipmmu-r8a7745" for the R8A7745 (RZ/G1E) IPMMU.
-    - "renesas,ipmmu-r8a774a1" for the R8A774A1 (RZ/G2M) IPMMU.
-    - "renesas,ipmmu-r8a774b1" for the R8A774B1 (RZ/G2N) IPMMU.
-    - "renesas,ipmmu-r8a774c0" for the R8A774C0 (RZ/G2E) IPMMU.
-    - "renesas,ipmmu-r8a7790" for the R8A7790 (R-Car H2) IPMMU.
-    - "renesas,ipmmu-r8a7791" for the R8A7791 (R-Car M2-W) IPMMU.
-    - "renesas,ipmmu-r8a7793" for the R8A7793 (R-Car M2-N) IPMMU.
-    - "renesas,ipmmu-r8a7794" for the R8A7794 (R-Car E2) IPMMU.
-    - "renesas,ipmmu-r8a7795" for the R8A7795 (R-Car H3) IPMMU.
-    - "renesas,ipmmu-r8a7796" for the R8A7796 (R-Car M3-W) IPMMU.
-    - "renesas,ipmmu-r8a77965" for the R8A77965 (R-Car M3-N) IPMMU.
-    - "renesas,ipmmu-r8a77970" for the R8A77970 (R-Car V3M) IPMMU.
-    - "renesas,ipmmu-r8a77980" for the R8A77980 (R-Car V3H) IPMMU.
-    - "renesas,ipmmu-r8a77990" for the R8A77990 (R-Car E3) IPMMU.
-    - "renesas,ipmmu-r8a77995" for the R8A77995 (R-Car D3) IPMMU.
-    - "renesas,ipmmu-vmsa" for generic R-Car Gen2 or RZ/G1 VMSA-compatible
-			   IPMMU.
-
-  - reg: Base address and size of the IPMMU registers.
-  - interrupts: Specifiers for the MMU fault interrupts. For instances that
-    support secure mode two interrupts must be specified, for non-secure and
-    secure mode, in that order. For instances that don't support secure mode a
-    single interrupt must be specified. Not required for cache IPMMUs.
-
-  - #iommu-cells: Must be 1.
-
-Optional properties:
-
-  - renesas,ipmmu-main: reference to the main IPMMU instance in two cells.
-    The first cell is a phandle to the main IPMMU and the second cell is
-    the interrupt bit number associated with the particular cache IPMMU device.
-    The interrupt bit number needs to match the main IPMMU IMSSTR register.
-    Only used by cache IPMMU instances.
-
-
-Each bus master connected to an IPMMU must reference the IPMMU in its device
-node with the following property:
-
-  - iommus: A reference to the IPMMU in two cells. The first cell is a phandle
-    to the IPMMU and the second cell the number of the micro-TLB that the
-    device is connected to.
-
-
-Example: R8A7791 IPMMU-MX and VSP1-D0 bus master
-
-	ipmmu_mx: mmu@fe951000 {
-		compatible = "renasas,ipmmu-r8a7791", "renasas,ipmmu-vmsa";
-		reg = <0 0xfe951000 0 0x1000>;
-		interrupts = <0 222 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 221 IRQ_TYPE_LEVEL_HIGH>;
-		#iommu-cells = <1>;
-	};
-
-	vsp@fe928000 {
-		...
-		iommus = <&ipmmu_mx 13>;
-		...
-	};
diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
new file mode 100644
index 00000000..39675cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/renesas,ipmmu-vmsa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas VMSA-Compatible IOMMU
+
+maintainers:
+  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
+
+description:
+  The IPMMU is an IOMMU implementation compatible with the ARM VMSA page tables.
+  It provides address translation for bus masters outside of the CPU, each
+  connected to the IPMMU through a port called micro-TLB.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,ipmmu-r8a73a4  # R-Mobile APE6
+              - renesas,ipmmu-r8a7743  # RZ/G1M
+              - renesas,ipmmu-r8a7744  # RZ/G1N
+              - renesas,ipmmu-r8a7745  # RZ/G1E
+              - renesas,ipmmu-r8a7790  # R-Car H2
+              - renesas,ipmmu-r8a7791  # R-Car M2-W
+              - renesas,ipmmu-r8a7793  # R-Car M2-N
+              - renesas,ipmmu-r8a7794  # R-Car E2
+          - const: renesas,ipmmu-vmsa  # R-Mobile APE6 or R-Car Gen2 or RZ/G1
+      - items:
+          - enum:
+              - renesas,ipmmu-r8a774a1 # RZ/G2M
+              - renesas,ipmmu-r8a774b1 # RZ/G2N
+              - renesas,ipmmu-r8a774c0 # RZ/G2E
+              - renesas,ipmmu-r8a7795  # R-Car H3
+              - renesas,ipmmu-r8a7796  # R-Car M3-W
+              - renesas,ipmmu-r8a77965 # R-Car M3-N
+              - renesas,ipmmu-r8a77970 # R-Car V3M
+              - renesas,ipmmu-r8a77980 # R-Car V3H
+              - renesas,ipmmu-r8a77990 # R-Car E3
+              - renesas,ipmmu-r8a77995 # R-Car D3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+    description:
+      Specifiers for the MMU fault interrupts. Not required for cache IPMMUs.
+    items:
+      - description: non-secure mode
+      - description: secure mode if supported
+
+  '#iommu-cells':
+    const: 1
+    description:
+      The number of the micro-TLB that the device is connected to.
+
+  power-domains:
+    maxItems: 1
+
+  renesas,ipmmu-main:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Reference to the main IPMMU phandle plus 1 cell. The cell is
+      the interrupt bit number associated with the particular cache IPMMU
+      device. The interrupt bit number needs to match the main IPMMU IMSSTR
+      register. Only used by cache IPMMU instances.
+
+required:
+  - compatible
+  - reg
+  - '#iommu-cells'
+  - power-domains
+
+oneOf:
+  - required:
+      - interrupts
+  - required:
+      - renesas,ipmmu-main
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7791-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7791-sysc.h>
+
+    ipmmu_mx: iommu@fe951000 {
+        compatible = "renasas,ipmmu-r8a7791", "renasas,ipmmu-vmsa";
+        reg = <0xfe951000 0x1000>;
+        interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+        #iommu-cells = <1>;
+    };
-- 
2.7.4

