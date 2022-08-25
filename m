Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5538B5A128D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Aug 2022 15:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242041AbiHYNms (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Aug 2022 09:42:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233743AbiHYNmq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Aug 2022 09:42:46 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 19D6CB5A6E;
        Thu, 25 Aug 2022 06:42:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,263,1654527600"; 
   d="scan'208";a="130587087"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 Aug 2022 22:42:44 +0900
Received: from localhost.localdomain (unknown [10.226.93.110])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 89573425D7F5;
        Thu, 25 Aug 2022 22:42:37 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5 1/2] dt-bindings: display: bridge: Document RZ/G2L MIPI DSI TX bindings
Date:   Thu, 25 Aug 2022 14:42:28 +0100
Message-Id: <20220825134229.2620498-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825134229.2620498-1-biju.das.jz@bp.renesas.com>
References: <20220825134229.2620498-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's. It
can operate in DSI mode, with up to four data lanes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4->v5:
 * No change.
v3->v4:
 * No change.
v2->v3:
 * Added Rb tag from Geert and Laurent
 * Fixed the typo "Receive" -> "transmit"
 * Added accepible values for data-lanes
 * Sorted Header file in the example
 * Added SoC specific compaible along with generic one.
v1->v2:
 * Added full path for dsi-controller.yaml
 * Modeled DSI + D-PHY as single block and updated reg property
 * Fixed typo D_PHY->D-PHY
 * Updated description
 * Added interrupts and interrupt-names and updated the example 
RFC->v1:
 * Added a ref to dsi-controller.yaml.
RFC:-
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-22-biju.das.jz@bp.renesas.com/
---
 .../bindings/display/bridge/renesas,dsi.yaml  | 182 ++++++++++++++++++
 1 file changed, 182 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
new file mode 100644
index 000000000000..131d5b63ec4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -0,0 +1,182 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G2L MIPI DSI Encoder
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description: |
+  This binding describes the MIPI DSI encoder embedded in the Renesas
+  RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, with
+  up to four data lanes.
+
+allOf:
+  - $ref: /schemas/display/dsi-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
+      - const: renesas,rzg2l-mipi-dsi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Sequence operation channel 0 interrupt
+      - description: Sequence operation channel 1 interrupt
+      - description: Video-Input operation channel 1 interrupt
+      - description: DSI Packet Receive interrupt
+      - description: DSI Fatal Error interrupt
+      - description: DSI D-PHY PPI interrupt
+      - description: Debug interrupt
+
+  interrupt-names:
+    items:
+      - const: seq0
+      - const: seq1
+      - const: vin1
+      - const: rcv
+      - const: ferr
+      - const: ppi
+      - const: debug
+
+  clocks:
+    items:
+      - description: DSI D-PHY PLL multiplied clock
+      - description: DSI D-PHY system clock
+      - description: DSI AXI bus clock
+      - description: DSI Register access clock
+      - description: DSI Video clock
+      - description: DSI D-PHY Escape mode transmit clock
+
+  clock-names:
+    items:
+      - const: pllclk
+      - const: sysclk
+      - const: aclk
+      - const: pclk
+      - const: vclk
+      - const: lpclk
+
+  resets:
+    items:
+      - description: MIPI_DSI_CMN_RSTB
+      - description: MIPI_DSI_ARESET_N
+      - description: MIPI_DSI_PRESET_N
+
+  reset-names:
+    items:
+      - const: rst
+      - const: arst
+      - const: prst
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Parallel input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: DSI output port
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description: array of physical DSI data lane indexes.
+                minItems: 1
+                items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+            required:
+              - data-lanes
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dsi0: dsi@10850000 {
+        compatible = "renesas,r9a07g044-mipi-dsi", "renesas,rzg2l-mipi-dsi";
+        reg = <0x10850000 0x20000>;
+        interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "seq0", "seq1", "vin1", "rcv",
+                          "ferr", "ppi", "debug";
+        clocks = <&cpg CPG_MOD R9A07G044_MIPI_DSI_PLLCLK>,
+                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_SYSCLK>,
+                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_ACLK>,
+                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_PCLK>,
+                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_VCLK>,
+                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_LPCLK>;
+        clock-names = "pllclk", "sysclk", "aclk", "pclk", "vclk", "lpclk";
+        resets = <&cpg R9A07G044_MIPI_DSI_CMN_RSTB>,
+                 <&cpg R9A07G044_MIPI_DSI_ARESET_N>,
+                 <&cpg R9A07G044_MIPI_DSI_PRESET_N>;
+        reset-names = "rst", "arst", "prst";
+        power-domains = <&cpg>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dsi0_in: endpoint {
+                    remote-endpoint = <&du_out_dsi0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dsi0_out: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&adv7535_in>;
+                };
+            };
+        };
+    };
+...
-- 
2.25.1

