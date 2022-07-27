Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8EDA582A56
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Jul 2022 18:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234592AbiG0QIk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Jul 2022 12:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232334AbiG0QIi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 12:08:38 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AD97E31936;
        Wed, 27 Jul 2022 09:08:37 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,195,1654527600"; 
   d="scan'208";a="127555192"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Jul 2022 01:08:37 +0900
Received: from localhost.localdomain (unknown [10.226.92.195])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3EE6540183E9;
        Thu, 28 Jul 2022 01:08:32 +0900 (JST)
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
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 09/10] dt-bindings: display: Document Renesas RZ/G2L DU bindings
Date:   Wed, 27 Jul 2022 17:07:52 +0100
Message-Id: <20220727160753.1774761-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
References: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
v4->v5:
 * Added Rb tag from Rob.
v3->v4:
 * Changed compatible name from renesas,du-r9a07g044->renesas,r9a07g044-du
 * started using same compatible for RZ/G2{L,LC}
v3: New patch
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
new file mode 100644
index 000000000000..7626043debd8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -0,0 +1,124 @@
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
+      - renesas,r9a07g044-du # RZ/G2{L,LC}
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
+additionalProperties: false
+
+examples:
+  # RZ/G2L DU
+  - |
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    display@10890000 {
+        compatible = "renesas,r9a07g044-du";
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
+                endpoint {
+                    remote-endpoint = <&dsi0_in>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                endpoint {
+                };
+            };
+        };
+    };
+
+...
-- 
2.25.1

