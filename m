Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1AFD64A5C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Dec 2022 18:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbiLLR2U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Dec 2022 12:28:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232631AbiLLR2T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 12:28:19 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 07302FCDE;
        Mon, 12 Dec 2022 09:28:17 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,239,1665414000"; 
   d="scan'208";a="145905861"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Dec 2022 02:28:17 +0900
Received: from localhost.localdomain (unknown [10.226.93.82])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0893C406F1D1;
        Tue, 13 Dec 2022 02:28:14 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 02/16] dt-bindings: usb: Add RZ/V2M USB3DRD binding
Date:   Mon, 12 Dec 2022 17:27:50 +0000
Message-Id: <20221212172804.1277751-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
References: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
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
 .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml

diff --git a/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml b/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
new file mode 100644
index 000000000000..0c473c3398b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
@@ -0,0 +1,123 @@
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
+  clocks:
+    items:
+      - description: Peripheral AXI clock
+      - description: APB clock
+
+  clock-names:
+    items:
+      - const: peri_axi
+      - const: apb
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: DRD reset
+      - description: Peripheral reset
+
+  reset-names:
+    items:
+      - const: drd_reset
+      - const: aresetn_p
+
+  ranges: true
+
+  '#address-cells':
+    enum: [ 1, 2 ]
+
+  '#size-cells':
+    enum: [ 1, 2 ]
+
+  usb3peri:
+    $ref: /schemas/usb/renesas,usb3-peri.yaml
+
+patternProperties:
+  "^usb@[0-9a-f]+$":
+    type: object
+    $ref: renesas,usb-xhci.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a09g011-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb3drd: usb@85070000 {
+        compatible = "renesas,r9a09g011-usb3drd", "renesas,rzv2m-usb3drd";
+        reg = <0x85070000 0x1000>;
+        clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
+                 <&cpg CPG_MOD R9A09G011_USB_PCLK>;
+        clock-names = "peri_axi", "apb";
+        power-domains = <&cpg>;
+        resets = <&cpg R9A09G011_USB_DRD_RESET>,
+                 <&cpg R9A09G011_USB_ARESETN_P>;
+        reset-names = "drd_reset", "aresetn_p";
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
+           clock-names = "host_axi", "reg";
+           power-domains = <&cpg>;
+           resets = <&cpg R9A09G011_USB_ARESETN_H>;
+        };
+
+        usb3peri: usb3peri {
+           compatible = "renesas,r9a09g011-usb3-peri",
+                        "renesas,rzv2m-usb3-peri";
+           interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+                        <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
+                        <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
+                        <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
+           interrupt-names = "all_p", "drd", "bc", "gpi";
+           clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
+                    <&cpg CPG_MOD R9A09G011_USB_PCLK>;
+           clock-names = "aclk", "reg";
+           power-domains = <&cpg>;
+           resets = <&cpg R9A09G011_USB_ARESETN_P>;
+        };
+    };
-- 
2.25.1

