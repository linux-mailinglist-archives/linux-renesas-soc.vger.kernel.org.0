Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A40F50A599
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 18:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbiDUQfh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 12:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbiDUQex (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 12:34:53 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D30D13B3CC;
        Thu, 21 Apr 2022 09:31:40 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,279,1643641200"; 
   d="scan'208";a="117591262"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Apr 2022 01:31:40 +0900
Received: from localhost.localdomain (unknown [10.226.92.11])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2E2DE40065CE;
        Fri, 22 Apr 2022 01:31:35 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: display: Document Renesas RZ/G2L DU bindings
Date:   Thu, 21 Apr 2022 17:31:25 +0100
Message-Id: <20220421163128.101520-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/G2L LCD controller is composed of Frame Compression Processor
(FCPVD), Video Signal Processor (VSPD), and Display Unit (DU).

The DU module supports the following hardware features
− Display Parallel Interface (DPI) and MIPI LINK Video Interface
− Display timing master
− Generates video timings
− Selecting the polarity of output DCLK, HSYNC, VSYNC, and DE
− Supports Progressive
− Input data format (from VSPD): RGB888, RGB666
− Output data format: same as Input data format
− Supporting Full HD (1920 pixels x 1080 lines) for MIPI-DSI Output
− Supporting WXGA (1280 pixels x 800 lines) for Parallel Output

This patch document DU module found on RZ/G2L LCDC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 v3: New patch
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 159 ++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
new file mode 100644
index 000000000000..2ee2d713cef4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/renesas,rzg2l-du.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G2L Display Unit (DU)
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description: |
+  These DT bindings describe the Display Unit embedded in the Renesas RZ/G2L
+  and RZ/V2L SoCs.
+
+properties:
+  compatible:
+    enum:
+      - renesas,du-r9a07g044c # for RZ/G2LC compatible DU
+      - renesas,du-r9a07g044l # for RZ/G2L compatible DU
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main clock
+      - description: Register access clock
+      - description: Video clock
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: pclk
+      - const: vclk
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      The connections to the DU output video ports are modeled using the OF
+      graph bindings specified in Documentation/devicetree/bindings/graph.txt.
+      The number of ports and their assignment are model-dependent. Each port
+      shall have a single endpoint.
+
+    patternProperties:
+      "^port@[0-1]$":
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+
+    required:
+      - port@0
+
+    unevaluatedProperties: false
+
+  renesas,vsps:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    items:
+      items:
+        - description: phandle to VSP instance that serves the DU channel
+        - description: Channel index identifying the LIF instance in that VSP
+    description:
+      A list of phandle and channel index tuples to the VSPs that handle the
+      memory interfaces for the DU channels.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - power-domains
+  - ports
+  - renesas,vsps
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r9a07g044c
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              description: DSI 0
+          required:
+            - port@0
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r9a07g044l
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: DSI 0
+          required:
+            - port@0
+            - port@1
+
+additionalProperties: false
+
+examples:
+  # RZ/G2L DU
+  - |
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    display@10890000 {
+        compatible = "renesas,du-r9a07g044l";
+        reg = <0x10890000 0x10000>;
+        interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD R9A07G044_LCDC_CLK_A>,
+                 <&cpg CPG_MOD R9A07G044_LCDC_CLK_P>,
+                 <&cpg CPG_MOD R9A07G044_LCDC_CLK_D>;
+        clock-names = "aclk", "pclk", "vclk";
+        resets = <&cpg R9A07G044_LCDC_RESET_N>;
+        power-domains = <&cpg>;
+
+        renesas,vsps = <&vspd0 0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                du_out_rgb: endpoint {
+                };
+            };
+            port@1 {
+                reg = <1>;
+                du_out_dsi0: endpoint {
+                    remote-endpoint = <&dsi0_in>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.25.1

