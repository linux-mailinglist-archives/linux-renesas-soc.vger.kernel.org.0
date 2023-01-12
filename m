Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1A366866E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jan 2023 23:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240437AbjALWJR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 17:09:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240526AbjALWIl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 17:08:41 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 22312B4B;
        Thu, 12 Jan 2023 13:59:28 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,212,1669042800"; 
   d="scan'208";a="149165224"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jan 2023 06:59:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.132])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 86783400A8BB;
        Fri, 13 Jan 2023 06:59:24 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 04/12] dt-bindings: usb: Add RZ/V2M USB3DRD binding
Date:   Thu, 12 Jan 2023 21:58:58 +0000
Message-Id: <20230112215906.494394-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
References: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree bindings for the RZ/V2{M, MA} USB3DRD module.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Added DRD interrupts and interrupt-names
 * Dropped peripheral reset and reset-names
 * Added reg property for usb3 device ctrlr
 * Renamed peri_axi->axi and apb->reg
 * Updated pattern properties and example.
---
 .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml

diff --git a/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml b/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
new file mode 100644
index 000000000000..ff625600d9af
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/renesas,rzv2m-usb3drd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/V2M USB 3.1 DRD controller
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description: |
+  The RZ/V2{M, MA} USB3.1 DRD module supports the following functions
+  * Role swapping function by the ID pin of the Micro-AB receptacle
+  * Battery Charging Specification Revision 1.2
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a09g011-usb3drd  # RZ/V2M
+          - renesas,r9a09g055-usb3drd  # RZ/V2MA
+      - const: renesas,rzv2m-usb3drd
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Dual Role Device (DRD)
+      - description: Battery Charging
+      - description: Global Purpose Input
+
+  interrupt-names:
+    items:
+      - const: drd
+      - const: bc
+      - const: gpi
+
+  clocks:
+    items:
+      - description: Peripheral AXI clock
+      - description: APB clock
+
+  clock-names:
+    items:
+      - const: axi
+      - const: reg
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  ranges: true
+
+  '#address-cells':
+    enum: [ 1, 2 ]
+
+  '#size-cells':
+    enum: [ 1, 2 ]
+
+patternProperties:
+  "^usb3peri@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/usb/renesas,usb3-peri.yaml
+
+  "^usb@[0-9a-f]+$":
+    type: object
+    $ref: renesas,usb-xhci.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a09g011-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb3drd: usb@85070400 {
+        compatible = "renesas,r9a09g011-usb3drd", "renesas,rzv2m-usb3drd";
+        reg = <0x85070400 0x100>;
+        interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "drd", "bc", "gpi";
+        clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
+                 <&cpg CPG_MOD R9A09G011_USB_PCLK>;
+        clock-names = "axi", "reg";
+        power-domains = <&cpg>;
+        resets = <&cpg R9A09G011_USB_DRD_RESET>;
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        usb3host: usb@85060000 {
+           compatible = "renesas,r9a09g011-xhci",
+                        "renesas,rzv2m-xhci";
+           reg = <0x85060000 0x2000>;
+           interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
+           clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_H>,
+                    <&cpg CPG_MOD R9A09G011_USB_PCLK>;
+           clock-names = "axi", "reg";
+           power-domains = <&cpg>;
+           resets = <&cpg R9A09G011_USB_ARESETN_H>;
+        };
+
+        usb3peri: usb3peri@85070000 {
+           compatible = "renesas,r9a09g011-usb3-peri",
+                        "renesas,rzv2m-usb3-peri";
+           reg = <0x85070000 0x400>;
+           interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+           clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
+                    <&cpg CPG_MOD R9A09G011_USB_PCLK>;
+           clock-names = "axi", "reg";
+           power-domains = <&cpg>;
+           resets = <&cpg R9A09G011_USB_ARESETN_P>;
+        };
+    };
-- 
2.25.1

