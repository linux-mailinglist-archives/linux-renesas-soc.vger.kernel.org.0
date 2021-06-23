Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E153B1261
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 05:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhFWDtw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 23:49:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57848 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhFWDtw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:49:52 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95C04A66;
        Wed, 23 Jun 2021 05:47:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624420054;
        bh=muYRXlF9f3BfO3NiimOuraT8qB8/KWuV0WlU5G4kxOU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YBFKTrZnlcUtkvC9tY0L/iS9rax9Gy7QBIRThqXJq+LMtyBOMO7Cn/caSwA6eGv0B
         gVyzv/Ob9rwHOfI4Ax3+wBd+cAlpT5eCznG2ZuxOsY1mks/5wUFDUO6z/zrVQ8FEFr
         kW4aom/MrDDBNUomK9kSVgLt2gejHN19HNV8gADw=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [RFC PATCH 01/15] dt-bindings: display: bridge: Add binding for R-Car MIPI DSI/CSI-2 TX
Date:   Wed, 23 Jun 2021 06:46:42 +0300
Message-Id: <20210623034656.10316-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The R-Car MIPI DSI/CSI-2 TX is embedded in the Renesas R-Car V3U SoC. It
can operate in either DSI or CSI-2 mode, with up to four data lanes.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../display/bridge/renesas,dsi-csi2-tx.yaml   | 118 ++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
new file mode 100644
index 000000000000..7e1b606a65ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car MIPI DSI/CSI-2 Encoder
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description: |
+  This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
+  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
+  to four data lanes.
+
+properties:
+  compatible:
+    enum:
+      - renesas,r8a779a0-dsi-csi2-tx # for V3U
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Functional clock
+      - description: DSI (and CSI-2) functional clock
+      - description: PLL reference clock
+
+  clock-names:
+    items:
+      - const: fck
+      - const: dsi
+      - const: pll
+
+  power-domains:
+    maxItems: 1
+
+  resets:
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
+        description: DSI/CSI-2 output port
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
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
+  - clocks
+  - power-domains
+  - resets
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
+    #include <dt-bindings/power/r8a779a0-sysc.h>
+
+    dsi0: dsi-encoder@fed80000 {
+        compatible = "renesas,r8a779a0-dsi-csi2-tx";
+        reg = <0xfed80000 0x10000>;
+        power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+        clocks = <&cpg CPG_MOD 415>,
+                 <&cpg CPG_CORE R8A779A0_CLK_DSI>,
+                 <&cpg CPG_CORE R8A779A0_CLK_CP>;
+        clock-names = "fck", "dsi", "pll";
+        resets = <&cpg 415>;
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
+                    data-lanes = <1 2>;
+                    remote-endpoint = <&sn65dsi86_in>;
+                };
+            };
+        };
+    };
+...
-- 
Regards,

Laurent Pinchart

